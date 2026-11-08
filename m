Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=mKZcxsne9SQqMH/e3J8eak71qAAkbfKah+wiMyw3KQTE8MfJx1Fs7oXDNsXl7Icc51JZ
	 MK7BgS50xR5Qj4LQiu59Npj313EnB33W96EhJFLr3ZfsTI8Dc2QNNSF+VlCBdiCMo2l0j
	 7zyZ4ufR8pTEWKcFEOyUhqFsUhh0f6SR+Jf1qtIx5dR66qaYgFPg/dVKTYOxrms71Ex/X
	 WApPXIBoIRfMkhNItSvwH05OXKEte0ndJRb5ulK6h0WdxVrhbBp5DSUvnyEKtyrZDI34j
	 BWSDDoTQtkfk+/ytSgmo9bDlAt4seLlWldal9Mo6xqREhOCV32JwvF4t+PdI80W12tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=QDtRWggskBtNco2SNu9dESg3MCC74KTRATsLCBrqe1rqjT5918tdYKLJLOZmSvgDBCUN
	 /OxWSVD+xcn7xQnX6MULc3qXhizmGMO+80CYxTlbACwEonOkM0TrOqh/35NDQ+UBtaAzn
	 XIucO1oQ/Et2twQ34uUTYHY+SMsJtwQr70JxDFPBD9ZLkIB2wVRxL2y+OkTgW1ZSah+6z
	 jUaZfjyen16Phym7i+xlXTGAvuRy7N7mbRTpsvw2t7E3yQWuR2urerN5xn1Ay3Wq297zj
	 fgsDRgLTbDGEALVGFY/rTswB8SYYt4bGsnYwDBUWbxhBOXfxav2v+03bkG76R4S9Vsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dFeQSe3;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385AA606A334
	for <ntfs3@lists.linux.dev>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385AA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dFeQSe3
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1338295e9.3
        for <ntfs3@lists.linux.dev>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=0dFeQSe3IU5NQDlmZSyTvOPWhpYukrsGUFdU3+otjahwZzDrAkhQgiYXIsVIS0jPCS
         dFOH+gCXM7tEX5I+yUQTiTY4qIz2+9WtRNBcXexa/Ll+r9ZHIxHdgmWTkm6pgNpQD+Fb
         MXcRssbSdLS+hxVxzLwIYK12BphT3DntnaTCtoTEHms7Q6aStP4OP241AeDyz7geHrec
         VLVngt7SyD8o2gtBhPqihU6qaEM16tXAVgcmLv3lX1zZhHyT4gvM0di4pXf+MaL9E3Po
         TdvlTVrk57adunJPiakzaXYxkgqNmDYA/6b2h4Zsj6926xzbWIjwqX3HbU476ARRgHM8
         Ihdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=JKGvOpV5ij+p9K0zN2/4dYspbP4jbPBLG7ZZO99Y3cDp4ZX+VrzBmyMAKOE+2KsAlv
         oJmbiPZdjiK4YZkmfyRYCSdg9+TBifIgKS92/08mt1c48pwGm3CpZ2P9Ecwr6eq9wD+U
         CDlrjaCevRZdS5X8EPTFM2LafdY9pqHRi6skwt0sXhBS9Wl+4Ff2ZhmcCnZR/ZFAcYwR
         FyArmrH4aTbkHfCainhnOO5LxAm+Vllo5MLToWgurvrO37irw446p8kH5kuBq840vRLO
         aoxz81iKsuzFn5nYMXnrJtfr4B9+IwTHq3mUFzTx6StG/du8Zv1LTOUqo4uqFedM5tYg
         vTeQ==
X-Forwarded-Encrypted: i=1; AL+hErHKDSQ/Qlj3KN2lQ5/F/T/ejvZ4CrxUVkg/1cBfj9GvqBeEV2afibKmvffYM81l1Bz4onjw7A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Vls3W5Br0zvIUgjamrPSWsnKdH58kWjbQSxlGOa8+/rtJa3EV
	AhY67ShtxLPz+s+dODipj1XAKnMPE/M26yNOpNwkbcb3p4EN4vaWO2zs
X-Gm-Gg: AYBFou1TLtpAIMakz9o0yrp05zQYCgLeFF6fyRXkJQMovn+MX7OqYa8tcd3+cYGduEG
	ykRXKgTB29qTyVFaka4fesVZGQL10Zk3MQgeg3CKPNK70y06Xf1P1IK68o86P0HT5iUxeCdauYu
	8+aAhz2ICyDcXZ80Vq4CaBGJVp1f5ampmcpnyhxWQFhcU1VpAWkf9tv4Wy+0TJVYP7+hUERYomR
	eeLv8oo8mvIQ44nfVgGhq0EpA2/gY163uVz/cQxlwIorhTEOSr7jnbfMJAfk3HIm5kGraEhPLN6
	h2foKYYjdZKUC6kogBooANoWDXw5Zu+rPeL4F5GsbEmmNTrZjI87avrKLiyr2PXNXU+t+rDf+/d
	ohFHyw8co6Kp9ME5g12TRl93ZdYDLSsjM370RNgZzKKFmZXqQB+h3cZnNobV2PeL34ZRjLjiHFo
	q8zoqGWVqQm0dOhbKhR1vlyCqo1zxD0Kif39JH/EpkYRvO+ZHdGarKGzMavg5l59KpK6EyA6nly
	MabpinqZWflhoPQk6pKQzfKP4fNuZM6hX/vHssIdlX1NGf1ykp95A8JtlxWvJrbUarfmmd+mlC+
	Zs9bdzhJaMHCsDSN6AIn+ulzCQJy2GUh8G1pRM8SlKJHzB+6mcKU6uXNR/1FKukQ
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
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
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
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

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
