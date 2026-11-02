Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642351;
	b=hWlJrmB+hToNYM8UNjP6sQ4T3/4SIpdBs5LBaXn2aIOz/sDx4yzBkZoqgpjWYNL6X4sn
	 rkc9Gy836iB4acfsooMf32mVULjqumzEnEX5MnRYTM2a2FEGkiPisYeU7C6J3lHOXh/L1
	 ULyErRoPRodmwLbacZraEYQUVEOmdp6lrYaBfBSkL90sVTSW1vbjFCL9StK05m6vAdg60
	 BpQpafArPe0VJaiWa3sdg69LpQMLGlcAr2s0YbAsTdGl0MiTXB1EVrMQJHPMPEuR1Uvr8
	 C18ue046xV4E7hEZN/kHGm6yuktd+mdDbXcQVJn3mFuJd5n2K1EkXbVLvK2UR4gMUSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=43C4ioMBlWonCo7BgQy0HyPD3/DJhN3ZbXIntWyRAzZjWgHRgA/V6s+tz88RQTS6i2Gt
	 A20B/fG0rsOyjtKMPKJqJgfqUqH+6yRlvCYXiiZFiVxg/R9zcPxxGhZbHpxukBQTdqz+t
	 3ORU0JlBINppMv8MSqmQwtxH/6tPDm2eJ9W4cYmJDvPJgmB9J8Kjm74yJkA9n7I0kPE7G
	 x5sPVB4I3uGROhd8aNjgQWiDyh/jd58Mwq+sVI0/dIorzZ5mIwKJbhRg99hlUg7DL/BRG
	 bvKbFvavUAo+TFQ0YqBpv6ftLBrk8K3ermNDb7XBuumBG0ARmMjoPSD+I2Q5ybZigWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DApXZtXN;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F19A606A331
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 17:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F19A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DApXZtXN
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40e30c26a4so833827366b.0
        for <ntfs3@lists.linux.dev>; Mon, 02 Nov 2026 09:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642349; x=1794247149; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=DApXZtXNn/T4yDTck/qzbmPQgaYc07t8AgDxZKHUrLXKnIdKXokjT6mrekgpgGBLys
         b4cbKCYsR1/6hHMbPkkE5LWBWxKS0JG2UVG5A3B9PVhyiv04/kkrcXeFWHFjQEpz7hzi
         3j7iitWiiGYc3HQXIgVcpdrIFYuEQEwwP36/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642349; x=1794247149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=e0cqOsq3i2kd//Yb/Ghv94IuV4MxovIUTm0iLWMBcWsKLiuuXmuER8Cd5sHO/1Akm1
         v3vY4TaOl55K2gBfImuDau5/907I9706L9yjZI3cbYsHGLiUFqqNHYuIVOv1+aFPS4/V
         4PYuwWiixIy6LbLbqqlHOFGAlfo68rEL6NESSb5aOuzZy35CwUKIZycrUMtlhjFPhvG8
         9D0lBdxDjxiaMJq+CAF94uH3DvOcnWwuCICcYKh7boUN0552Gy3EvC1u8T0epmcy7dob
         pxBpYoHojKk9Uom/sOu9k62/lIqYHvdP1MFnMRx6V2+XSixVrJr5a4BdQp6dfsQajo3q
         S1CA==
X-Forwarded-Encrypted: i=1; AKwUvBycgV6NfUgKyIKDz2ZWNJv/PeNOx7Z6L+46eKmcCkvbZ0M4v8wkTjTtwHZ4XzYmfUzZijM0uQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJCYpI1W3B5/q3renkiEiZ51TZ6Tw2Ce9AvSiD/c+CarUMnMMTZ
	QOL/PlUA2Ygy3ZB7jF1PfRqBndbfa/9eN+Y+W2CSMxexrDdccHLgu1vFtKDMpX1FGJ40zjyXrHz
	Vev6Wa5M=
X-Gm-Gg: AYBFou1X91UJkvKX1heebNKydIMQ37oll3PumhwuzD66H1/SoZMlU5eyV9s4Uu64lGO
	ahJUk0RFi8LldSbc9tknR0QriKPtu0pzqFpphk/xNPK3r5JHoanQdUs5RdxRWsfbnmDEJscIm+9
	Fw7CpO/Z1K/iKRIDDwKpfeiOtZndgmHdAu4mp9DQnSzeYa6iOlZWSiGJAEUYxRjJ8+sQxgTPjhY
	qIIlCOofSqZ23zyi99T90LpDhVr8lcSvPcjIwDiWS4pLHmBrsV4fXIczt16umhFY3FrfibeRUON
	a7C6MG4+C8ctbqkbM1VFaIdErG8sc7B1ydBsrd9eevww8HF3/kgJjb13mH7FyAb/jH/CkAXgDZm
	u8S/QsFyDYPp7zReJdZEA6FVlD+umx2esknaMpYUPd2cGxPxOor+8krpyWJHPWeWTReOQQRciAe
	tE2rj4QP59flm8PASYZOw8quMuLikSh/M9H1wUR/rkyrSPh5dBY+UUfUDZW+1ODVnMkqk8KR8Gw
	XutkycgMwvofKwgatqoj5YPRSUyQY+cRk0tJmc84IGtkrC4fBCYtAJ/qfRr8AbGRc6WWmJ3Ko1M
	I87gZaI+mTw5aYDArGffK9eJyuvEj2G5e1pz0ZbpjGCb/Wr6Kgv8ycOPB120TLHlRpu4cfFyorp
	kpg==
X-Received: by 2002:a17:907:3e90:b0:c2e:62af:b6fe with SMTP id a640c23a62f3a-c4ca7a42386mr952564266b.8.1793642348751;
        Mon, 02 Nov 2026 09:59:08 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebf241sm12489866b.24.2026.11.02.09.59.08
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:59:08 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso7716048a12.1
        for <ntfs3@lists.linux.dev>; Mon, 02 Nov 2026 09:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzlxxMUSzQaan0fi5oCctoNfaz7s5xCWXjCFlntBCxlcCm0Q+We/C7tjacMRuFTzOfOszG+PQ==@lists.linux.dev
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
