Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350F36C0D6
	for <ntfs3@lists.linux.dev>; Wed, 11 Mar 2026 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238368; cv=none; b=pzxun6scwBlxm++36fkvCqNIfEZqdjM+b+S7AFB4lrf7cQP1gVuKP7svJosc/yHFMyJSKdVVLZGuJ/UPIVmdxbRSyCmf8DOvpBYUzxpC4TtRMi75wSfdn67SyRpo9+ffxtnhkuNYUZ04wGYq0CitoTmYIPPo0mKC3bf2NuGo93U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238368; c=relaxed/simple;
	bh=POUJjzeRhBIXfPGojdZfC417KH92loTKx1KmDpRcfoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvMrMF3viiwgH4uR5cU8mDRcFfm9QmerWUJByqJrWKk+I5vNrFqrRI2FILyiBNoccOg0ET4Md8Gs1RAFAtxCvruvnGTI639iAyLWdYRE02lvH3inTlYsaq1N+tW86yZzQwQ5u/cIbwV4cqmFNJJjrilDSDJg2RTT29GIePBT178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so2113883a12.0
        for <ntfs3@lists.linux.dev>; Wed, 11 Mar 2026 07:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238366; x=1773843166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
        b=DLH/ydHMf4Zq+0jC93jgg0USoAsrwRgplopULW+oIQ8db988PZAcibYOyuP0JT1spr
         tFK8ZRhVKmTpPa9DUxV8HFtg6PJO3urPsokTsFtVA75y/wWWbb0Z9UEwkjGWaX3XsE3t
         TjPGbdLr9Ep22O7J8KoCEESEc1nmDEE5E2U+Iv1xNoCX2Bz/9f5k+0gbSXTnn8pAb+MU
         iSSUjf+roe7J8wSSA/rzR57Rn+bIdtYmSQL8eDiw65pFgca98d9upKFAGsPh6JOzkray
         K5Jo+gZ78Wk0X1WzAzu0OvgFGoFgeUxBwkEDo/A8jzRot+h3FXQqw4JKNKxJMPDDgmUW
         KigQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlLETfh59jXF7ChOUb/18Sb5U+tudRl+fngq2cBHwUQWyk4GNhUJoeMKKBGxIiKiuWS7kAjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx//Q8UrXXWU5UgGMe0si4tele8rlIK85Xbq+NzCg3CQZ82DZlF
	LIiwfiLrQch9ysJ89yS6XjckgMhPXi2fSyMYbmWj4W4usfBzC87Dqki6iGz/BMHNt9EZsw==
X-Gm-Gg: ATEYQzxO+ahRxxjYv/jGxfg0SDBWAoX+s/m419n2HF2Ui4SixITOFiElR+OG2YbhcMS
	CuLvFowID78V8KB+x2NS9gIoPnnrzppqsh7u2RN18+vN1VxO/+j3pQQM6Rlwl0Y0rk/mbIr3hQe
	DTIfMOh+JQeITqVLsuWpCEiBZSSRsXFJ9TftNER1AVFVij2FabDQrI0VyYALqPO8jndSXynASjS
	kHdJXLqUPFPn8ToLk4hOVjLa+2XOsS7JZcblR9ulGc3AEpZ+c8SoOviCkf0b3+ZBlUpMljrhOO2
	no39ugPOSuGHJON4mXW1P8yUg8c+dHRQ/iSxPHsvzBMhCJZHoFvYFPq71uzkqcPdFAGtdo6L85j
	w1TAJU9ZuD7C3OcuhNcJTz/HCOf6KqtxnkMXJ2bWstRDyI3+SsGgLZP7rSLW3AXpg7UoFLbV+YQ
	YlFMGcKTXXqY9I8YYxykfDWjzpZL66OVfFle2B0kAt3wRShiT/vV68QhhFrvVq
X-Received: by 2002:a05:6402:1463:b0:662:811d:60f4 with SMTP id 4fb4d7f45d1cf-66317dc03edmr1630346a12.14.1773238365430;
        Wed, 11 Mar 2026 07:12:45 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631419b21bsm639536a12.5.2026.03.11.07.12.44
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:12:44 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b93698bb57aso170317666b.0
        for <ntfs3@lists.linux.dev>; Wed, 11 Mar 2026 07:12:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbsw/hv+mik35JQpgNpLKZiSka1+mjVRSQtUZxS1zQU5jgqT0fGenWRj5LqrNEg9LhCcKEKQ==@lists.linux.dev
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de> <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org> <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
Subject: Re: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org, 
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org, 
	cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
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
	v9fs@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
