Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260763;
	b=dgsbRxtn/HdjJ3dGmo4RMv910XuUbLos8R0aml0i9puGQUFQKcUG/+zqBZ9geoGtmtY5
	 ZEKdMtGxeeDNciTYYQNqIyTGX7uoJoAsjJSPxBdxf9L9I3Xleaws91MZtK0a2HRnLGvvr
	 Q9t/1Yy28byQBz0w0aF3mICPbiYw2NewYGBlfcgam+GRFn7oldB3GJF6FZ3nppEN8tJpf
	 E4wuxsd/QmtFUbSS2lWPGvDcXucQThPj/5z8LeLHMEF2cisai8D/DP7vJnp43gipEGsAL
	 7NWbsGjS08IN0aF2tHYwln/Xd9vBI1RvHtMSmv9qWEZLPcSnuKK11/y4GR6LDfmfb2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
	b=BzYkHM1Uyz39oAZdTNze9lC7G+M86KzRoMlCryf65A26R0kF3BVWDqKV/y1NP5CUnWYn
	 MsnUjudY8T1sQqaS+WFtSYZM7rkAZb2yuCwl0GHJ78cF1VaZF3QZJ0btMXGvSGFKVKi00
	 DLLmrxP1rmrXPSmOgdeWTtzd9btajtY8tdSL6EmhoRSrB0aFtrpgrpN+z91kNjr+FVKTa
	 +5jCUWLFYPJMpjAoNa5VTeWqmm+MVbLLDu+VpRKx27s4ivCLyxAyWAZPHQo3bEWdykdGv
	 0vPn71Nb7azlt5YRVmJPZESHIhIFyOOa99YmmzRsv//cZH11i0XhQB6r3jyZMUTawBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYkmRMxr;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0B606A33D
	for <ntfs3@lists.linux.dev>; Mon,  9 Nov 2026 21:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC0B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYkmRMxr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e47347279so893309f8f.1
        for <ntfs3@lists.linux.dev>; Mon, 09 Nov 2026 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794260761; x=1794865561; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
        b=EYkmRMxroCPifR7kyyHLWxtN5+Oz/o+7rIC/XW5NPdqaTmD7ijl91rjJrD7RY5EOxl
         JqapWDLvHUaYEDC5BoXe/4HtW3xXdqU96hbilkR2u5wgTE9HpxpuECp1W1zfF47ZMB28
         tQKtozIUEPwmFyQyJzuVdGe7wXD9EGFtyYfuML/mXs7oDZQLzQgDnBF89Lf75EW3IAY7
         rKQPM6NC4YsPphf/AjDBrlFkaSCaDb0SbbbkuQdjftiSHdFiPwHzdXBKeKlRN8MiL/Ne
         ZPeguz6AIujq/VphN9AMNP0W3Bui/FMGGCPCEHISc7Zw7E8heqVyFRqfaV/2agDl4gzI
         uHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260761; x=1794865561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
        b=EvE0i4pnolUygAy31RTyMFg5Qczyc+/9EWCR8Avvqf/bmCPGlEq3aMSUhZs+SQiIv+
         0t7RISG4LlTQWsKYAmh4a0Y7C/VhMN5ZU44/vJPC24fjE4R/K8nh0YNgyyzvcPW68Nw+
         XS3LpffNSgOyb4B/dgZz/KzHsZ8JXHkkK3EkLpSqRYH0pFkzVNGvCLnKg+f4qzfqaU+l
         j9tZrN2fc3RgTf8XwVDJV4FLYpjqzVwfcem3WzPCjAUmDAfo005BggczYjIzLOinZ6L4
         EUbEAas+ui4CKiWJsE8p9v4Ow3Cuubxz5klaLolSk0qLTzhHvcWMmqON4txAyJUOD9hc
         Akgw==
X-Forwarded-Encrypted: i=1; AL+hErH7dRpdk4y6uVUdBP0AMtHi3Ca6+CrSYW/axW2bQcd8Kx3vczooigbW0ISGGUIjkMF3/+0qDw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/iI+pqOwO4xHKoOAFRzmpn69W7lzp1JpKGjI0DskQWxo8YYpZA
	pLmBD7w4dpSdDz1xaJ3SmjRLVXJNJxXdgRFKVIB5OcEv2Nc0TBOdCg60
X-Gm-Gg: AYBFou0L+u/C4vajXDfAiOIDWXkvcqfk5b6YwSp2XE7OZebbDJxxCPyDVBeDRzE/Mim
	Rz3Vlo4XoKBXAl56lsuhGlzmR5ssScNiucA4lbZRPM1PdBolRBsJmYyhv2szdTSeXj5GWj8usxe
	B/Jy6R61bxMdvKEIRUTNXPeSa7gzaTHyuxm0+zTs9LalaXPQ3+ZoGDEPcZm14C7tr64dtfruui+
	0Wg5O5fopPYBpsCsuyW6TGzvdpOxzDtph7P5NRBgPOUda2jBoJg07LJ6wOTO7WBSjB7P+YpW5Tl
	J8tkr1B62etS7LStAeeBA/1PE8JaU4J9JX/IirhkLpF5MrSLwEOMag6P1B2wCATwtwVCwd/RNrP
	PCqnukbZX2l0PzdEvrtjgfRSItkwGbyr6KeFDmxz6CMB1NLah6ZmMM9k0fO+GpU1Rw99/iUr5N/
	MWZC9mG6hTId9W+0F4CbnRfwykDEWjOL8JvpjnrS/DgDA3hw+Bk+BPl/AgeoaDphhvc75YN7/oN
	1/HurhCso42WeGGkYr0IZo2qDQZCO6SNdyUiTklS9szERP7TmZ2p0/hAopvv6av+mLH36iktDOe
	px4eQP/EIqRrA7qYYF3LC0zA9n0P87hyuvOoc0q5+jMjCKvtWvPyRulWp+Bv25DyvQ==
X-Received: by 2002:a05:6000:288d:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-4982b28aa42mr1487213f8f.3.1794260760763;
        Mon, 09 Nov 2026 13:46:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm1213644f8f.10.2026.11.09.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:46:00 -0800 (PST)
Date: Mon, 9 Nov 2026 21:45:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Christian Brauner <brauner@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
	<20261108185953.28054fb3@pumpkin>
	<alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Transfer-Encoding: 7bit

On Mon, 9 Nov 2026 05:05:57 +0000 (GMT)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Sun, 8 Nov 2026, David Laight wrote:
> 
> > > > While at it, I think it would be good to use this conversion as an
> > > > opportunity to replace "char *" by "void *", which will probably let
> > > > you drop several casts from users.    
> > > 
> > > So I tried that too. The thing is it drops exactly one u8 * cast in
> > > ntfs3's label write.   
> > 
> > Since char is now unsigned that one isn't even needed...  
> 
>  Please excuse me missing the context, but what circumstances does your 
> claim refer to?

Just that the cast would have to be:
	u8 *foo = (u8 *)bar;
where 'bar' is 'char *', and I don't think you need a cast there when
char is unsigned.

David
 
> 
>   Maciej
> 

