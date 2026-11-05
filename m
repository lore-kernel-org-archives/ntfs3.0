Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872251;
	b=F1hst44nTvhux1tMR8oAsUKaSH4S8IScOaPdwbLwmPO5mqz6+tnSYm/SAEF+1BFAV38r
	 DpRZBALfakDSdQ3yIN/A/XJUdtpI2fBraCclxxlea7VzcRvcZFH2HW+fQlRXsZFGSucK1
	 FQPD2PFCgFa3pBSK4iIMppt9vSZPt4xTw9AhCwsCmeTcTYjQCZ72SAyuOQc+MY+KSmnoy
	 TKtnVVaHsrCHfGdD7I6M19BBEdBt6il1VIlknRhG46JSosozgrT05ALP8hKz3UTGRH3yB
	 9NHjoqdi8mwrVVUUR8Fd7+OQcpGdMDfXh45jdKR+ipIHK3q7110O/oPfE9RESc+soDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872251;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=k1FcwmUja/H9zAEkN30QQ6GJsXuIjncbjao9tLmDL2zVOJtB8lu9cimkZzqkLF4Mjr/f
	 tOYRDGhr3v+z32TtneZBwhbcEdDqsIY+kq7uc34YzAngenU5PNSCx3L4ByOELUD+FMKfZ
	 5b4ESm599pP/AqVNV9pDq7BR5p8NCCPaA/4LLVezUTKmffTujnhLJ0eU1Y0WOFA7Nwe1A
	 yYkg/is+plFbFs1kUEj1+uqyL9zfdxrrVflf9foyLshtoHYg/Qj/SFwQn4MZSBR8xCWgT
	 DUNT82Lffg7aFN79CvCkQ0XywoNE1/BldyfZwYziaJQe87FVbxkUSp3ULB7IyTYwwGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0DF606D802
	for <ntfs3@lists.linux.dev>; Thu,  5 Nov 2026 09:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA0DF606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e635220b4so158968785a.1
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 01:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872250; x=1794477050;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=cKCkulbE/6r6UJrsja2qncM+mZiTcpknqcLy9h7HGy1wXEEu84tFc2QN0ZY4KPl0A5
         cxpf88ttD1aN+O2akuj6y8rUV3Bi16EFW7PaR5HWzQrFfq/X5rL36Ic6n4sph/gvZEbl
         iSYiKiFTgN/ij3r/f9Kd+7cRjyxtxF86JsCs/wBRDVZA0rbEPfa6nn1qnm2tXfl+gBr0
         9w5A4DwEiRVhc5gRplplnU5q5FMWRpmYGW8kgtA+I6SuoZ0SDPN1eZMlRizq7ZV5EcOX
         c2ykoYDwWtxT5X7wf8k6fmgJ8cEdxglEFbKauliRm6l7uXeUCaRMgoM8ybUvPq0ndadD
         qS4g==
X-Forwarded-Encrypted: i=1; AKwUvBzpRvPrswfue7fNkS9PGYVprToQf9Gj25qvYm7anXn70XgHU9NmlUtobUydX6rK1sh2CevfxA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/D+z30/8sr68q5wC6dLBul8zxcySrX+irI5zInbMIu3/pl9QcN
	bsKMgUuriOnSUCEmhPApaNbHM9TlPpg7FKWfBc1wn4C62cylNpkceYIBG/tP2UytpCo=
X-Gm-Gg: AYBFou1Iao0g6jTFDDNBJTcWqIQ2sEF/MD4fvVd/OjSXqioxtW4X4lmI1mVgqKeWAWi
	n/Vo7nQBuC6qAvTmaHnjU8PcWkZ0RKA29j0vwV6S0NmSRiJfeJyGuHqyHm1m8C4PI6bT3NitK5x
	NnUWhSHVQdHEn8Rtm91GPUy9lEcajt+57Lo4ePjzwiMUthYDh8trA6/Csjrzb/dHvNNMi5plRhX
	l0LxI4AmHbzrVrqb6kXMCAAQkYrhaPoydcsL3hWEqv/KwKusabSEPcZgsdaB3gPZj5ymvUEkQEL
	Fa3UmEUjgRHeTT3rKtAzEwROk5a/r2bt+Jt/HdfMka8LhVYb6yWYcv+gtCBTK+WR6U1SKZmJez7
	crYbNwLPV3Lh8NKT9i6mYQA3hi8v18R5OxItUiZowf0ojPvh0wTV+U8ipqZy9zvVPYui6zlahv5
	gCtDFp3QdoWpMo4Q+W8sMXk92NItqPWk0clrVqJ+fd+N/ynArxmCRhKLTzHCxSiLIQm5XrqfEVL
	gzS/jPkJ4Bn8wl3v+kal7HKDRl/w8iXR42TEIqIInCZ0kihyAnyX6XeaRewI23c44s0IKgMBAmC
	GJo+qndTUPjFSeH1kUlCRlJhCNwW890OhthUPvwREqR2qzFkvOdvP8NjoFSOSuIMtZencQ==
X-Received: by 2002:a05:620a:600e:b0:93e:869c:43e2 with SMTP id af79cd13be357-944216db68fmr3058097985a.50.1793872249899;
        Thu, 05 Nov 2026 01:50:49 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4814c0asm421788585a.20.2026.11.05.01.50.49
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:50:49 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93cc1ab5f6cso197235285a.0
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 01:50:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx9Ym/CUXhc3JN1XPlNpleb1qIreLAPwBF9PMe3xPivHDaB37ZaK8pVH2NzZkiZyLvppwa8+w==@lists.linux.dev
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
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

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
