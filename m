Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD8031D366
	for <ntfs3@lists.linux.dev>; Wed, 11 Mar 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235414; cv=none; b=ERHGBE17j/+En2cPG4Fx6DvdJtcWlIQaEGGJagXyB4kVzQTGCV2qcr0NyNyKW6hy/DrTcW2PKyqjkPvT8p7SUqM9EDbHULuu1XyzpOKMI4eOaLgPbh0qh45zDqJ3pJ0ZiBTdRiojKu+rPUrkCR5NP889gm78tStIkTr8jIi3nTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235414; c=relaxed/simple;
	bh=bQRlE5OR+3/41N9B/xBGXfMeOTv3hgeQ2WrY6jcTpBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JNJ1//GTkJmghYuUsUHnzllTDalGfvVAJHGQJgmygyqJrEAM7dX/h/GxqT7qHRjzYLKQ09+YubDx1UA9EgGn5G7XMOgM8472PmuJinp+RUifodM1FF5bvFvw/zZ2id6m4LTFcf/VsmpOm2xwKm8In0bvIxsKroN8tWLNWoCggtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56739adfa1aso10530352e0c.0
        for <ntfs3@lists.linux.dev>; Wed, 11 Mar 2026 06:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235411; x=1773840211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=UAqmbu8Ij9AVpW+5sFOQJzQMbL7ETYm5eIRpYWL+ZtSkBUbx9vJSx4qBkcE49jDUCf
         0dCEjCXFMubRb81QuTpcfAaKVXws/4syG3x/tB1EngZR/XM9DeRcSvswBbJd/y440RhF
         VZ9Rn7A5/jNuIt3Kssi6g9nbvgwZNMTLlLNxhR/ih6jm52hAT1b8ncqUuv4/olj+hd47
         qinwtF0EJnb46pRhKD202lqmabODd2KFGSrsmP+zsG3kcaj00WKSG6ICoPfnJIIFvxjD
         zRLd8538Gqlbqj/NtdlzbHBWZ5CLFjZeErdSp8UTj8kopbTNW+e3tQeai9dXmm31OczJ
         ZNzw==
X-Forwarded-Encrypted: i=1; AJvYcCUeGs/anrfok0c6RCxX99uVyNJpE/Zq7foGbkTP7XHaGk54zVZJsNaTXDouSybbBSQfuXkCFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyglXlhKphU7fXJpudqa+QwbrofypHNPZc1695mso4A+dPcNJj/
	mGzMamOZn3tufuAZga8TSsv+3XUH/UH8xgcoGikBsvszMog0e2EKY+WwYN1X3VbMgHU=
X-Gm-Gg: ATEYQzyv5xdLqNynrwkyU10wVuvcO8nQltVuyS1Wb8OFqIXFR1U4dUHqPIsduy6pSzJ
	4Tlx7zpRtzieZCDkwZ6Ev8WnQNOsWe6RNMKHs/LF0B73uMKEvnKXjpRBuaksatM2bX1IqPIq0qp
	0uWtYTIe1aYDuyl8QdOai+k1Jm8zLChMg7V7uECr+SjSK6HqOMXS1eNWIXU0bpHQh0t2xfpFnWL
	KKxs5HmLWmm4T99h/mxo5ceFyqnadV8EKVG/msOoeCxoH7LhAkW/HKHdPSWro1lvS2RHUFG2Pb4
	IFSq1YQYlUaa03a71pA6PBQugwDsill37F+KABmLxXDycERu8IvNBGZJOGp6Hi/Cts3ftVkJjTE
	3ZjBCcok6hPM05JXj1AmND4Iz0SQKUu2rDMW+lHN4cHaVDdvqxUgPh/6O8uMmHO2LvyXuUvhFXK
	/2HwX0dvH775QtOvOi8swQSsTivB53flMbJ9zJGMAGs2701tGNpwjFRzHxofnQ4cMMK68AFzYRx
	Qs=
X-Received: by 2002:a05:6102:370c:b0:5ff:9ed3:448a with SMTP id ada2fe7eead31-601def4dc34mr951478137.24.1773235410847;
        Wed, 11 Mar 2026 06:23:30 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfc9c9fcsm523936241.4.2026.03.11.06.23.30
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:23:30 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5675d609621so11792314e0c.2
        for <ntfs3@lists.linux.dev>; Wed, 11 Mar 2026 06:23:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU64rbk8EoKGvbkxbCk8lWrgRQ011HOantxmqAi100FtgzEpbVOHgAuMdWlfvX4PQ2BeMgwrg==@lists.linux.dev
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
