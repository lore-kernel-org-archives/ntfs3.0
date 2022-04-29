Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581577B
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zmFHtQlfqq6DwSUQuwQ9Bt69xBwGkpD+/qzGyc01df0=; b=RwP7o7QIdRQoGGEpPvZaQvYbGD
	lBTi/JIiLQrM0Ix5YWwLpC2PQhHaCvjieh7NsyVgHIwGe3hyWkmXp/NsYvZuHkREQv6bktcNZN+El
	AFYEB64/oGdcd3UQ32FFqqeSesSV+dfiJa6OpNMM0caGUanh85myPmzQggVsu4ADNf61ck/u8WixY
	d+zUWixtKovmZrVahGN6cOslVpPy6uD3EnQm3zsuN0HujJYjM5+PRoQaQ634oAy5n1jViN7pvDUj5
	CRJCetGe9bMlRz3IXsClnRFbqdARWOKYnOt5Gp3ZfeAoRlRAOq7G4OCfkDQxqCKfLpJv6gLYcFZEa
	4Fr9X/rA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkW1H-00Citq-Nw; Fri, 29 Apr 2022 19:11:11 +0000
Date: Fri, 29 Apr 2022 20:11:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-fsdevel@vger.kernel.org,
	syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kari Argillander <kari.argillander@stargateuniverse.net>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: [PATCH] fs/ntfs3: validate BOOT sectors_per_clusters
Message-ID: <Ymw4T1CF4PxMe5Ym@casper.infradead.org>
References: <20220429172711.31894-1-rdunlap@infradead.org>
 <YmwixlgHg8n4NsOd@casper.infradead.org>
 <8a29f83c-7fbd-8044-406f-248595cd2ee6@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a29f83c-7fbd-8044-406f-248595cd2ee6@infradead.org>

On Fri, Apr 29, 2022 at 11:52:47AM -0700, Randy Dunlap wrote:
> Hi--
> 
> On 4/29/22 10:39, Matthew Wilcox wrote:
> > On Fri, Apr 29, 2022 at 10:27:11AM -0700, Randy Dunlap wrote:
> > > When the NTFS BOOT sectors_per_clusters field is > 0x80,
> > > it represents a shift value. First change its sign to positive
> > > and then make sure that the shift count is not too large.
> > > This prevents negative shift values and shift values that are
> > > larger than the field size.
> > > 
> > > Prevents this UBSAN error:
> > > 
> > >   UBSAN: shift-out-of-bounds in ../fs/ntfs3/super.c:673:16
> > >   shift exponent -192 is negative
> > > 
> > > Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> > > Signed-off-by: Randy Dunlap<rdunlap@infradead.org>
> > > Reported-by:syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com
> > > Cc: Konstantin Komarov<almaz.alexandrovich@paragon-software.com>
> > > Cc:ntfs3@lists.linux.dev
> > > Cc: Alexander Viro<viro@zeniv.linux.org.uk>
> > > Cc: Andrew Morton<akpm@linux-foundation.org>
> > > Cc: Kari Argillander<kari.argillander@stargateuniverse.net>
> > > Cc: Namjae Jeon<linkinjeon@kernel.org>
> > > ---
> > >   fs/ntfs3/super.c |    5 +++--
> > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > --- linux-next-20220428.orig/fs/ntfs3/super.c
> > > +++ linux-next-20220428/fs/ntfs3/super.c
> > > @@ -670,7 +670,8 @@ static u32 true_sectors_per_clst(const s
> > >   {
> > >   	return boot->sectors_per_clusters <= 0x80
> > >   		       ? boot->sectors_per_clusters
> > > -		       : (1u << (0 - boot->sectors_per_clusters));
> > > +		       : -(s8)boot->sectors_per_clusters > 31 ? -1
> > > +		       : (1u << -(s8)boot->sectors_per_clusters);
> > >   }
> > This hurts my brain.  Can we do instead:
> 
> It's just C.  Lot clearer than some of our macro magic.

Well, yeah, but I don't have to understand our macro magic; I can just
assume it does what it says on the tin.

> > 
> > 	if (boot->sectors_per_clusters <= 0x80)
> > 		return boot->sectors_per_clusters;
> > 	if (boot->sectors_per_clusters < 0xA0)
> 
> The 0xA0 does not take into account the '-' negating of sectors_per_clusters
> in the shift.
> Looks like it should be
> 
> 	if (boot->sectors_per_clusters >= 0xe1)
> 		return 1U << -boot->sectors_per_clusters;

Oh!  I misunderstood how the ranges are used.  But I think a unary minus
will leave the type as unsigned (am I wrong?  C integer promotions
always confuse me), so how about:

	if (boot->sectors_per_clusters > 0xe0)
		return 1U << (0 - boot->sectors_per_clusters);

https://en.cppreference.com/w/c/language/conversion

> > 		return 1U << (boot->sectors_per_clusters - 0x80);
> > 	return 0xffffffff;
> > 
> 
> Sorry about your head.
