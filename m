Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B628EA
	for <ntfs3@lists.linux.dev>; Mon,  2 Jan 2023 19:19:23 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id i20so23018333qtw.9
        for <ntfs3@lists.linux.dev>; Mon, 02 Jan 2023 11:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R6k/fEMZCmOmEt57raJGiBHMAXA3er6KmGSBfbjnP48=;
        b=FPswAxOycqwgPTarBphiKECLSd+ITnxOCNopN9RimTNXCA9iNG4HCZjTaDHpYaEP/b
         U3OtKirwHYHjcn8LezDQ4NQLusrJPE7EVbf3mIyUcbySaST3sVyC85UEoex45+I/naxk
         FDK3IdBgY/NFBPCm2X4oRJQ45wrywkXZ4Z5Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6k/fEMZCmOmEt57raJGiBHMAXA3er6KmGSBfbjnP48=;
        b=aUEqXRfaLIFqFa0szSKazxrPqeBYGubj8ZPXh2eyU9oKvV6i+lIOsv/NuV6sKbI3Mg
         761JGnkakoXuq+2oW5PKj/NFlmKQmSIF9cy24GZBTfXxAaPf7tjpK6YeM0u3WB4/lCvC
         HbWedE8DrV6NjKFjHb2Se1LQxPNSoohqiy/noJXJYQ7+Q61MiqInaE8AfvbmthzS4sBc
         quY2LZNR9+/Egp1Sp+Lt+sOUT/3m1tr+YyhPeaSucs5T4UO9OHhRhtRb/hvqFTnSVfi/
         m61IgWWUUsO2RtA0DUcd9AFyT8eEP7VolrJyhdfVo2hG5T9bvBqogP5/7qF/ST73zy+h
         FhOw==
X-Gm-Message-State: AFqh2kphuzoey9NdkwipSyKypp7VvxJVzBzJf+atPfZ/yNw1XtPe80TL
	BJUZ27t6y88UwcATkEGwoI4HzFLyuA254nYS
X-Google-Smtp-Source: AMrXdXuNIWqX/Q29eJV84kF1gWWCkVNHUGJ3IGvbhTcYZzfJON6lYjMbzVUeWfbIwG5xzyKpo90Vyg==
X-Received: by 2002:ac8:445a:0:b0:3a8:e35:258f with SMTP id m26-20020ac8445a000000b003a80e35258fmr59760492qtn.31.1672687161664;
        Mon, 02 Jan 2023 11:19:21 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id x10-20020a05620a448a00b006ea7f9d8644sm21322488qkp.96.2023.01.02.11.19.20
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 11:19:20 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id m12so13700647qvq.13
        for <ntfs3@lists.linux.dev>; Mon, 02 Jan 2023 11:19:20 -0800 (PST)
X-Received: by 2002:a05:6214:568c:b0:531:7593:f551 with SMTP id
 lm12-20020a056214568c00b005317593f551mr1533599qvb.89.1672687160612; Mon, 02
 Jan 2023 11:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <00000000000060d41f05f139aa44@google.com> <20230102005409.3474-1-hdanton@sina.com>
 <CAHk-=wim+_xutuWdeykqM34EQxbE3As7+91L5uEVLUCXbUL1CA@mail.gmail.com>
 <20230102094125.3552-1-hdanton@sina.com> <305e5da3-bf57-0fc0-cf5e-4c620a76fb8d@I-love.SAKURA.ne.jp>
In-Reply-To: <305e5da3-bf57-0fc0-cf5e-4c620a76fb8d@I-love.SAKURA.ne.jp>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Jan 2023 11:19:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wioYYi=A8r2bXRE9Nvg1FBe-9UV+HB51cGPGwi5d7N_ug@mail.gmail.com>
Message-ID: <CAHk-=wioYYi=A8r2bXRE9Nvg1FBe-9UV+HB51cGPGwi5d7N_ug@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: don't hold ni_lock when calling truncate_setsize()
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	syzbot <syzbot+bed15dbf10294aa4f2ae@syzkaller.appspotmail.com>, 
	syzkaller-bugs@googlegroups.com, Hillf Danton <hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 2, 2023 at 6:05 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Since filemap_update_page() calls filemap_read_folio() after calling
> folio_trylock() which will set PG_locked bit, ntfs_truncate() must not
> call truncate_setsize() which will wait for PG_locked bit to be
> cleared when holding ni_lock lock.

I've applied this patch directly.

I'm not thrilled about changing the locking like this, but I don't
think truncate_setsize() can possibly rely on the ni_lock in any
productive ways (ie it only touches generic vfs data, not anything
that ni_lock protects), and it clearly is a source of deadlocks.

So I think some ntfs3 person needs to think hard about the locking
here, and maybe there are future patches in this area, but this seems
to be the RightThing(tm) for now, at least.

                Linus
