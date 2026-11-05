Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872533;
	b=xbD0gTTYTxzpPHEAXjD4GrpR2G5VF5ps0JQE9nIu0gHe1LJkHc1kYpDvFD2Y+CTJGheU
	 g27XUkrRy6iYQkkxSL9HWHsUgs5PLHQIZE0xjh5pIhVFx0P5QErk/urtJQrqlNQtoe7RS
	 6TgU6coRgKSCa2S8Cx+HaJtqkl8RU3OQ/ElCkbCSW5JXybi0Bo2lETd+mYI6ZKat/p8te
	 agC3lLoD+CbpFHY2crA1WYfIomjQaxyTrDvSnkrsg0QH2pzW1OBeOum8NvWqiye3C3fAL
	 5GXXrB8JFBZ+3c25+6Q/55wMTjby6VJ52uyjM4MkN7wSseGaQCEwHlB0Q/AUYi3zwXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872533;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
	b=DRy6AgJJDHNwtKhELSNGhrZOphNDf+grIB1Z1POfoesRkMt1FUChAzdhR0r3pdVWHjTo
	 KdS0X8xNPNB/m3uhfjntwvVPvRBokSXSEhP8aVDYTzRAYrFKwOPO5aotdeBYvR+6B4XL0
	 PCZC93HZ5jt+PeNXcPNAOc19PgH72tLlpQYQ6O2OgqJul31i+cpCt4+NW0q9oagWTcUOZ
	 TUgAzbBdTvXg9/OyERtzAcBE3k7oADPQhaiBtRW9jvbzkkbXtgOxnHNSmGnP/chnJuz2l
	 uc1n+9cfouZ5anj74arYuu04RgZiMCL38LTQscdsFv8KRsa7mUlXnBpwGut21rDyKgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63A4606D806
	for <ntfs3@lists.linux.dev>; Thu,  5 Nov 2026 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E63A4606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eafb65e163so1143319e0c.2
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 01:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872532; x=1794477332;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
        b=ttuq2yC+ly/GTm+Jcam/2bAHtSZO2QBPyoR92veQTOhOCNjCUzT3Un+aR1npmzvhLJ
         ltRJfVAaKmInSXjuNpfqaeEMXCh3qNvPOsKD6R5m4p7/5xHQ78hqWyrg7Hyjr1kRbbX4
         SPYspHPMiUsHUVICpo78a++SISC1rQ8ivuOvO3GNEWrqw/gWG16wDpPVqrdAeavGVLia
         PJWV6+VHiPaqchQKLdCsVY6VQ4pwgQEhE5Y0aSnUb2PHaD4y7p4bIq8wkf4Rp8AMtOMW
         1XGUJAKEACNLSo5jiVDvE1VV8zkLzh2jr3VIH3a1Eb46EpyxleKgtEsBGDVVGfIhhPms
         pjaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqinkXPf3zgjYWUo3YuILMRPs+LGBAxnXtA8k6qWCadWzB42MjteIIzRyzASSvJl+FnM8Zkg==@lists.linux.dev
X-Gm-Message-State: APuU4Z93QCpZa0w/DRi+15nP3bopIuBlTL4EPXX2t0sfuFS2Ly58Kmeg
	kbl/n6zV93VvK467kpTi/8ZOwphfQ33jVn5OhgUwd2XQMZNrMlekvgEYzubBxWgkS+M=
X-Gm-Gg: AYBFou1qy5+ygxNy6BcBURhwrk3rPNWxa1IsyPO7Kxgp5n20KvWkeb/7tqfZ78OlupA
	OlT1woxs+fEx3WaILAWX8Gl74KtgNKjtQZ8mFnIR7q4WkHS4GHUydBwDKA4hloU6PBu7kPV2gVs
	w5CEqU3cU4+YZSGdMbYddCE2x7+mBF5+pGIThcUzxBD1C8ECwFRDQgOIgpIMCeq36CvFta2tGhc
	8O3UFEZOR5RIZUQZJlsA1FFmTxFKbysXHOXwJDCtX8n+gdrHlsMUVd8tBW+yGtOkOhL1qL/nSkn
	RGZzTSedQCfE5Y4BRh2xEvuc6/WOKYN62GApDfTZsNVb4lyA2M7kzC3EXUau8G2K2STUchT/pIx
	tmCo7s9qZWm6KavV+EfO5cseNE8rAFqFIvSOY/HSWcVIcNmw6DixYhdIHZXXu9TaqedYAh0NBF4
	csoyBCVGztr8YzHwTENve6qsFEy+sdMjdn15tYI8VLQX663VwF2aOsS5hLJbirxuzsnWNvpkYnF
	Dv0Fe3XksuG15bCXyW8Dt7LIm1wbPwqHQVLSiCNUe+8S5HJ0P/XyKhuh01RsEEJrA70+0usB4O2
	OMh3/vnB0Q2XrHWVBoEPCp0AJy2aF5GGeR9tGYc4ABqEOY865/xchjzBXQuM/26Xi4F/kj3b6Q6
	Uk/9du6gH+ds=
X-Received: by 2002:a05:6122:ec6:b0:5ea:cc3c:9449 with SMTP id 71dfb90a1353d-5ec689e0d33mr9357885e0c.19.1793872531817;
        Thu, 05 Nov 2026 01:55:31 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9fe6dsm3769218e0c.9.2026.11.05.01.55.26
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:55:29 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7ccae9f1a9eso868852137.1
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 01:55:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxgi8SHbjWS0jukyXRWoq5CSDYpRB8GRLIazwqIpyIWAxZ4mSTN2J/FyI/CuSEikGbFydk5Wg==@lists.linux.dev
X-Received: by 2002:a05:6102:5108:b0:7cc:56a:58e5 with SMTP id
 ada2fe7eead31-7d072d84a58mr8269567137.37.1793872526219; Thu, 05 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
X-Gm-Features: AclHuK_UsJ1nGicdWEWcMLQAICTi1A7pGF3yhNkxXkXRPqohle17eXAHHNBsR6k
Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
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

On Wed, 4 Nov 2026 at 20:43, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
>
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
