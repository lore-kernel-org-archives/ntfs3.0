Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200761;
	b=SjlteX0SxABMs1Ycbt7a2Uo2RFzHbmCmVDo0/eSXB/RNsVMzHHQvZDlxYNUQUvYBTXMt
	 AjIBLlF+AUAuQJVkJuos9yBFDpxtGUC4gwGyiaTCxobhGlQ/GtOK3VZtcQAyVyDdVfmdv
	 QnYpZ+tVpi5fdQ1ut38m74P6S/0SkcIyi+p82S1bDfZQZn9J7aoPe1MpwnRhz6O1lC9jL
	 RKWl0pOoXHWUwP/atAvbbzbJdRp+4obReqAYijuEcapmqztXtS9U/f99uxK8sfKT/FJhb
	 YCEXYOwVsHaAHNwb5E1Yy6L6FepF7f1c0pg1o9TAd4xPQI+7k7MXLYlt3LKY3iVbO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200761;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=+UmCB5muc9jAh5/NVu2M6h8Lcfrpgge2sRUuegusfl0=;
	b=nwLIM6H8ZFbUmwGGQkroxV/wRSjAJRv3ee4gJHFJq0x8XV0BfHHG/hnlUZEUSHHsTNxJ
	 6+iCuJN6PMnRUuaZxEUhuGKAzK/csIBYMRLoZgaqzyeeViHfwp2aylytECfEECoFkPXyy
	 Lr9nDsZkNVe8x8rIxMcA4vN/2LQkYL6mmCohzv26G/wWk2OXzHEKo7W3U+f4UQLAgTGHG
	 CBq94lfXPV2qDDYI04UdQIw13eEB3U9druyO4GBeprVd/biyXocAkqNBQUrfk00l8Ij5o
	 yy1ytk88vUEs2lkCxWsZDjeh3TTX2vetolgsRYBznPd23juzU8E5JTv1CjKs7o2WLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186FE606A321
	for <ntfs3@lists.linux.dev>; Mon,  9 Nov 2026 05:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186FE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B42DD92009C; Mon,  9 Nov 2026 06:05:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B0D2992009B;
	Mon,  9 Nov 2026 05:05:57 +0000 (GMT)
Date: Mon, 9 Nov 2026 05:05:57 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: Christian Brauner <brauner@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
    Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
    NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
    Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
    Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
    Greg Kroah-Hartman <gregkh@suse.de>, 
    Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, 
    Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
    linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
    linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
    linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
    ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
    coreteam@netfilter.org, kexec@lists.infradead.org, 
    linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
    netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
    ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
    linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-cifs@vger.kernel.org, linux-fbdev@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-mm@kvack.org, linux-sh@vger.kernel.org, 
    linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
    sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
    linux-doc@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-atm-general@lists.sourceforge.net, Takashi Iwai <tiwai@suse.de>, 
    linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
    linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
    linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
In-Reply-To: <20261108185953.28054fb3@pumpkin>
Message-ID: <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org> <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com> <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 8 Nov 2026, David Laight wrote:

> > > While at it, I think it would be good to use this conversion as an
> > > opportunity to replace "char *" by "void *", which will probably let
> > > you drop several casts from users.  
> > 
> > So I tried that too. The thing is it drops exactly one u8 * cast in
> > ntfs3's label write. 
> 
> Since char is now unsigned that one isn't even needed...

 Please excuse me missing the context, but what circumstances does your 
claim refer to?

  Maciej
