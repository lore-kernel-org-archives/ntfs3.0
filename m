Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822728;
	b=zXUNQBz9LDJ2J0P3Yfh9c5JYiNKWSDqqjbLSYuDJzfvgqYCD4jCd+2x1MrLuoMguB3EV
	 dCwlxTUlid3vFfG4iYuDXS/h07FeHmVOhcHTu41mV/H60lyJcXfOPtrk9n9XZgAj2Vk3D
	 9CGfjgZ20QLH90eeHJtuV0XFdVXMsDC8DWEy5YbzqgeB3mAL6vwupqlGR3g2SUOXtsNxe
	 TBBcqLzij+mkYNiRw5gGeo7pTC12W8oI7E3kNkAuY6/OwYVevyAanFMIk66PGRxRwAGxn
	 pKXlO+e0BBWptISEncwBwbofewsJiUrJ3KudM4qDA2qiaWF+eycYcOLLkLlcSNLWe1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=5R322+XXVBpP8JBcSG7wpMTfVGmcM3kHBdwnIqSdlAT0rt+C6Vx9TtTLNfTEOTsosvGq
	 wXocf1pLmz4STT/3Ja1iGrw+4jOsqLSajpapiw1TP7j3iiH1jb9BG5RVjgoGBzEVFti4O
	 7uGSeI+Gbn80cHx1+8suw9i1WtET2HEW1x8HJqD0zIsld9yWAEXDPt+nSHjGk7npwrDC0
	 eJeLYETJn32BVU3jcq2u9ULD1kvfRq2i/Y4pEBfHVNHUayjAvdI9l5jEknMofyBewl1GF
	 E9IHY0y0RM+E21FA0dFnhxdQCoE+NMYAi8faDERYiLI80rExLjVtfZPOJNqdmnJgZlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=S0PKc2oZ;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7762C606EE80
	for <ntfs3@lists.linux.dev>; Wed,  4 Nov 2026 20:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7762C606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=S0PKc2oZ
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4550d8ab15so175923266b.2
        for <ntfs3@lists.linux.dev>; Wed, 04 Nov 2026 12:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793822725; x=1794427525; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=S0PKc2oZTWbq+t5Ugmtsi7o5IYpISQPk90HLbAzO/MIva0E/ATaE6mqjMYumxV3SDH
         q8ljX2Ej1CR93Hjk8AbI+A9UqM+MIRgkvPCCGVKlMdGFibTGHDr1tCRCq8MDjsQU+5OV
         aTwrYhIcHgxuUhFiadinpMylZin9OfUshaIO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822725; x=1794427525;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=qYuTpx7paP4oTGP3nJbfteDDD4CBs594tayojJD3VwuBOskERnMX1dzXvqdtHfjG4i
         OdW95mJJ4jM2ll8OoER/mY5xLgmtJEbRUfR6PE2i5LVWxwRQA+t1PXHTY4dyclICqiK7
         XKxoEOCEqHCbjQmeE0Dd6onb+/9kd/z/muChsNx4iY/0dwVokxV+oxyUhjSY4ZA5fa2b
         mmeUUXx2K0uB4w4jRfYqWQsWHqwYS5Wm1IMMAl3cPaGu0iuCOXdCmU8RQchzuOe1YRC9
         ryw4zXrSDpMEnoDFWowtSSEiRJFESUNI48iltwBgOZ7k6ZGHSccrL1kaTAliwhpAsMtU
         DgxA==
X-Forwarded-Encrypted: i=1; AKwUvBz3VpqWFMrA5+pBkRtMLN2uEu89fNTNeL+ispOjnK0Gjks3j8NvYWDHPvK+4xK5RBJVMR/fgA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9POWousiNaVrjEukQqC+BB7/nvxhCI+NzD61hL1iLbMRnmCRLB
	V3azqE+7W6e/ZwWcnkCd9aVV/kHQ6w08CEcdM/tXdP+8i39vbTITRhFfYAvI9D3pR7A0mCIJJ6u
	XT3QmIaRbVA==
X-Gm-Gg: AYBFou0NmlTyEzhzSP7CFG/2PI64xuyrxfNhWyOZAP+A4/UKzSA7gpYkoUxaaRiajNy
	H+guMvsnSaJBUx5jQhMtgNASz3G91/IS81Z2rnYugHBvdNOxJ+MG2pXcG8P787lFKMDUHwkXecb
	s5LnkKI2AMLOpySDAexXjd/dAQaL4sdhKepEzxGP2XFi9pxukzhjgFIuIFx4RSMzMVYdFUNU1AD
	iwu8KtkgT+d+DaKDcmepIf2L0rB/FIo2vR0lGFuTaH0S14bvdr8nuHJgeJiGtYzSKgengjcTk3b
	uzGurhFJQiK/4xbc+GXLjlzq5EiZuV1lJ40BbZmWAhLt/Nq0VHF8/rnDTGfgxExLTtMAUSIlA1z
	XGMDsY6QO4tv7+RbKG1uVTvwruSk9bWWajtWrwimAHxVEMF8Q0GPdgT3bPv+wiP2WLPOf2yuymM
	AQkl75x1VtxBjIkHIfq4C2kjQZ1TuDqtHGnTXqZ2W6E/ubWSaBE0tEfxBsvNSs1yXsLM4H80Nl7
	uLqqGIyc5qlirXMH+u+WvyVyCBwMtBgexbDkp4nQtZw0CCR6jV92G9O/xAEoUDtFE75zNuLICba
	GJST1ED4MmiDFSjJka1iOzCmCXZF4SrNP7FfdmyNWNkfkvscswzPRiBKxIqIC3fAAyOSnPbFWVS
	skg==
X-Received: by 2002:a17:907:1b1e:b0:c46:9d50:8af0 with SMTP id a640c23a62f3a-c4ca7ad10cbmr1455476066b.36.1793822725590;
        Wed, 04 Nov 2026 12:05:25 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424c34sm105229266b.13.2026.11.04.12.05.25
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:05:25 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c423b145922so162300666b.3
        for <ntfs3@lists.linux.dev>; Wed, 04 Nov 2026 12:05:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxc8fSKg7b27HOzHuK7ocQaIKJesc3b1Hxlrg8gq82LFtTTkx7wHBaQs1/hV9Txby9JEu7ztw==@lists.linux.dev
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
