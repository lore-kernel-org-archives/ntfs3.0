Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812947;
	b=njU3AAfUXRyValv4AiNiyMFmn3Iu4+RHpTUnMDWGCGKXRt+s7hD1adikDjtsKqcV8Dys
	 4Hl3P2fAKRn/bZsI45Fy/1MgLVKBNy3CNlvrF/hUmfM8sxhlI9WVsVR6fefASX38iY6dv
	 N3PFXBDvQN26Czmj9f7nNnfhLagHWtnHOPoYgFCEqtETza0/+XIVNnqhOyTBbAV24BNA/
	 oXiO0qbL3o/RWAF0s1V/tq+Xt4aUUQL4jUCNR5QCg7SVbDksnFYXn3pv8XnzpqrjzxKxA
	 prAEPXuFKdK32d5PtyVMpc/TNkbL2f+RXO7MhmHr/cfKN0K3X3M2NLO3SnfKja+XfMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812947;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=1mHmG9IJHtIMld4ZeRanDjKIMZUQxx8f0ptnWkrCv+U=;
	b=1sC5Cp0sk0Q+9RQMoecB1gaIoh2OpmmXvFX3Fh3ktZiRwX6naueUyXPuNtEj4JwWv014
	 I7zvh7le1gJRCAAcvVnqPKQ1bWIoZo0hpdsnie1/B+bK74sTTCEUscNKfyc8870SuY79G
	 p6UzZQCdA58iwcK4B5Er3RtYEOOF7BwPsQTNMywVwVHLU2mSHO1gpz7jMMNh/JTfwkuIN
	 vnjHvkVbhd89CFp3btRdxOmWWGJ4zitoYVaBSORaC5oMPQF7ZCRZ+391n1dT9QQ++XNti
	 2Q24TelOb4sECb3j6YpYlNy6ZakSU8eOXCYN77zV1zCB8QWQ831FF5/E11f7O56o3Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364C7606A333
	for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 07:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364C7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 39D8A92009C; Mon, 16 Nov 2026 08:09:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 376CC92009B;
	Mon, 16 Nov 2026 07:09:04 +0000 (GMT)
Date: Mon, 16 Nov 2026 07:09:04 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: David Laight <david.laight.linux@gmail.com>, 
    Christian Brauner <brauner@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
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
In-Reply-To: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2611160657470.17804@angie.orcam.me.uk>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org> <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com> <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin> <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
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

On Mon, 9 Nov 2026, Linus Torvalds wrote:

> > Just that the cast would have to be:
> >         u8 *foo = (u8 *)bar;
> > where 'bar' is 'char *', and I don't think you need a cast there when
> > char is unsigned.
> 
> .. and just to clarify: 'char' is always unsigned in the kernel on all
> architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
> unsigned") back four years ago...

 Thanks, yes, that's the piece of the context I was missing.  I've since
actually come across this commit while investigating which Linux ports 
have plain `char' signed in the psABI (MIPS for sure).

  Maciej
