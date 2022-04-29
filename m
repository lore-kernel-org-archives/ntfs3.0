Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF01851
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 17:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uyfpKPPa6hnnQIBHHcj14pjq20v7Ad1CFjfO3O4N/1A=; b=P7UNq206nST6xgQELjPX2fRoe+
	vjdW78WoOSpeEIz+0dd+jh6VbKmsEDgEE4WMX6974MxC37tV2zll72czNHqij+Z3ULCCsNfLdFBSP
	0tQy/nO/FHWmD81+GdYppf+0FQGfvpIR25fzoqLNHCHIbC6KQjLNDKzrNR5x0ISHcVdXNoT+YDx5B
	ZiEqqQywPB5+6SW6eCIv8Cw5ZVQA4IxxqIu4IHoM8gXXeXDIQELemLZmsarGwiy4gjV+i3dNCMpEs
	kW31X2VFlWfSNSSar+znEngzVyW+nmAOrd95hlxdzwRx0TTtnLjYRFIafuxvXxVRg2ZBY+h+Ss7ru
	witdkYLg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkUaM-00CePK-6h; Fri, 29 Apr 2022 17:39:18 +0000
Date: Fri, 29 Apr 2022 18:39:18 +0100
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
Message-ID: <YmwixlgHg8n4NsOd@casper.infradead.org>
References: <20220429172711.31894-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429172711.31894-1-rdunlap@infradead.org>

On Fri, Apr 29, 2022 at 10:27:11AM -0700, Randy Dunlap wrote:
> When the NTFS BOOT sectors_per_clusters field is > 0x80,
> it represents a shift value. First change its sign to positive
> and then make sure that the shift count is not too large.
> This prevents negative shift values and shift values that are
> larger than the field size.
> 
> Prevents this UBSAN error:
> 
>  UBSAN: shift-out-of-bounds in ../fs/ntfs3/super.c:673:16
>  shift exponent -192 is negative
> 
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com
> Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Cc: ntfs3@lists.linux.dev
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Kari Argillander <kari.argillander@stargateuniverse.net>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> ---
>  fs/ntfs3/super.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- linux-next-20220428.orig/fs/ntfs3/super.c
> +++ linux-next-20220428/fs/ntfs3/super.c
> @@ -670,7 +670,8 @@ static u32 true_sectors_per_clst(const s
>  {
>  	return boot->sectors_per_clusters <= 0x80
>  		       ? boot->sectors_per_clusters
> -		       : (1u << (0 - boot->sectors_per_clusters));
> +		       : -(s8)boot->sectors_per_clusters > 31 ? -1
> +		       : (1u << -(s8)boot->sectors_per_clusters);
>  }

This hurts my brain.  Can we do instead:

	if (boot->sectors_per_clusters <= 0x80)
		return boot->sectors_per_clusters;
	if (boot->sectors_per_clusters < 0xA0)
		return 1U << (boot->sectors_per_clusters - 0x80);
	return -1;

>  /*
> @@ -713,7 +714,7 @@ static int ntfs_init_from_boot(struct su
>  
>  	/* cluster size: 512, 1K, 2K, 4K, ... 2M */
>  	sct_per_clst = true_sectors_per_clst(boot);
> -	if (!is_power_of_2(sct_per_clst))
> +	if ((int)sct_per_clst < 0 || !is_power_of_2(sct_per_clst))
>  		goto out;

Do we need this change?  Presumably -1 is not a power of 2 ...
