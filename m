Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594077F
	for <ntfs3@lists.linux.dev>; Thu,  2 Feb 2023 07:01:11 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id d8so908970ljq.9
        for <ntfs3@lists.linux.dev>; Wed, 01 Feb 2023 23:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6RPkQZwzCSh98zsjzzoNHs7/CVVvqXi24+J6zt37CWU=;
        b=eQYQvVEeNh6GrV8MdWOCA/5ah+ioo03sXKFCDQYkNXEZmChGTT0z3qoR/kcWV3g1/T
         yuCzb7Q7boaK/I8eCnExwjdL/W+o8IFDb0hRa8ONF3OnyZ72Q8M4Esr6sdjkOsQTYPGH
         igbgzB/F7dfc87XMT37hVaFsRsSYBkWTiimHAabwnPuQ0UfI8GEbG+Hu74hmqriL4HJa
         9em3Sg8bCf9xZMF5dRPn+6PhkGlsEThmBfiOYWcQJ+NwQU6wUMyy1en6b6l3DW62ANit
         y+Aha6L22poHQZmn8wAiNXxTS9sJUbSyceUVWh7IIZGoGpvR4H4Cd4OrAQ5V8+DyvzgA
         2+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RPkQZwzCSh98zsjzzoNHs7/CVVvqXi24+J6zt37CWU=;
        b=2Jy/s7CtY3vEG4cqltPi1j3tMJ2/fQ3LiPNnrNNCDmk+zsmh0DihBRdd6uGTXkmJle
         pysBTA9bJLhy0uS3n2LG4bQzHo+e55seqvoP7BELgI/or42rJsi19OXvE86O6dHXevj3
         LiA3+VoCpzU0E/WphlaxldZJ6Dt86QrW1MtgSM/kmikny1sNPnH3jVxHn8G++FZ5LJwh
         pX+LerD7EQhYTK6jtn6quYMvxOZCT13XXpVbtzKIuaLB4T6s3zK3Jwx/aAO+tZJgXeIT
         eJzhk6vVuYpR8bCcCp5SuzEQORzM4covGGp94IGD721qh/2LWoiWi4eUK0RAnX/SYDyq
         obAQ==
X-Gm-Message-State: AO0yUKUK+ryXUBbkhYFEXVRGUAB8DkfAn/4QDXq5mPpDcduCE93bTfKF
	749OWIsykB+nn9RngXGvW8E1KExgVUjUBSiePYv1UA==
X-Google-Smtp-Source: AK7set8eYoMskBn9g7b2mHv/miX35ovEm4VxCpwXRwArxQOTNJwt7VlGy2815FzYrrg+lVY75OJlVwNGKNf/NgHNLx8=
X-Received: by 2002:a05:651c:146:b0:28a:a1d3:572f with SMTP id
 c6-20020a05651c014600b0028aa1d3572fmr771155ljd.20.1675321269189; Wed, 01 Feb
 2023 23:01:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000fea8c705e9a732af@google.com> <00000000000047848f05f3a4a32f@google.com>
In-Reply-To: <00000000000047848f05f3a4a32f@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 2 Feb 2023 08:00:56 +0100
Message-ID: <CACT4Y+Z1RhbV_=cQXSRtX94R0aUuFS2LXYQ5V7CySpPxMNzfTg@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: use-after-free Read in hdr_find_e
To: syzbot <syzbot+c986d2a447ac6fb27b02@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, pjwatson999@gmail.com, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Feb 2023 at 15:55, syzbot
<syzbot+c986d2a447ac6fb27b02@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Mon Oct 10 10:15:33 2022 +0000
>
>     fs/ntfs3: Check fields while reading
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1268739e480000
> start commit:   55be6084c8e0 Merge tag 'timers-core-2022-10-05' of git://g..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=df75278aabf0681a
> dashboard link: https://syzkaller.appspot.com/bug?extid=c986d2a447ac6fb27b02
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164e92a4880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=126f7ac6880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fs/ntfs3: Check fields while reading
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable:

#syz fix: fs/ntfs3: Check fields while reading
