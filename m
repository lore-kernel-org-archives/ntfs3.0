Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C295BD53E
	for <ntfs3@lists.linux.dev>; Thu, 25 May 2023 10:01:22 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f6a6e9d90dso172141cf.0
        for <ntfs3@lists.linux.dev>; Thu, 25 May 2023 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685008881; x=1687600881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmOWaLV+dlmmR2pxZAbEKqT5QECjyZujcCsJOTVir3s=;
        b=tNT9gMF69yLuJbKM6pRi6QPxT5/6hFnVzL+S81dH2OKp8xW2nk1KEh4enC8HXO5ClX
         8VeWNYhcstOsmNETIUrdu7+hJ9/GYe9LFegkyOzwjp3mQtDW90eMsklg9HE0bkeu/i/c
         CM4hRVXjov0b382BV/Uxw77nwl1Wvzc81YKmT8T9g3BwNTkyQQYnRXERg6zIPQZ/C3v6
         33E0fLj/ZYGDE8fxOPAy0TdkwC1/LRB7QCnee9PbOd/rnSVRIzieF65VimUz3f0O4AlP
         xOy/GK9I/dy56mcuWGTzFASyEbwm5B7tRry3vwZqzOlv5o23eeJW6Gbhs1+vJObstwPm
         THTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685008881; x=1687600881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmOWaLV+dlmmR2pxZAbEKqT5QECjyZujcCsJOTVir3s=;
        b=iwoRyRuOaGCWn05kgwCGFtVNjQXx17WFkC0XlAt0qeGpz1OFxjlwmdB2tOBD14DhUl
         mqlrBuz8tNIF43d3zbrcB/c1Kfru9Ki2PBdVLzBdfouRgBy35koKunaby0D8koSGrRpF
         /9O/i2MrB7j2lnPVFisoaQu1qeES0bo0Ilwn2hirJcGhaVHrHonMu8p7QHq/yu1dOTDX
         uNPABSEJPFArDVs8ZYimQ8gx3dMGzorvvnyUBzfQjIuGN+XE0e6mtvUNHQseNv9HS7JS
         sJbRyGjD292HUyViryUm+RLU+HO8L7r7Gl5iuwSYvk2h443RmQYmxKcTMRn88LgBgIfs
         lGPw==
X-Gm-Message-State: AC+VfDxAWh2tU9SaFDmdTwI1tsZPd6MBDTdEfh4McoQCCJE/KbNycVV+
	Yjpd1Lf2xt1ZRcJuniCH0jwill8bzbtz+hmxjXmzgw==
X-Google-Smtp-Source: ACHHUZ5oCzEQNzdamhGrz4yfKZwtIrLRFeFtlUXbqwdF9uT1Ca8oaD/nIJ4tEWCEvshqrtk0ZuDvbko445j9SoHEO94=
X-Received: by 2002:ac8:7f0f:0:b0:3ef:5f97:258f with SMTP id
 f15-20020ac87f0f000000b003ef5f97258fmr194951qtk.16.1685008881498; Thu, 25 May
 2023 03:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000eb49a905f061ada5@google.com> <0000000000000ca36b05fc780953@google.com>
In-Reply-To: <0000000000000ca36b05fc780953@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 25 May 2023 12:01:10 +0200
Message-ID: <CANp29Y68oXAQZBAChyiB58qebXS5bNOGda6tG=B+kKa7QRh6EQ@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in do_symlinkat
To: syzbot <syzbot+e78eab0c1cf4649256ed@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 12:29=E2=80=AFAM syzbot
<syzbot+e78eab0c1cf4649256ed@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 267a36ba30a7425ad59d20e7e7e33bbdcc9cfb0a
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Mon Jan 16 08:52:10 2023 +0000
>
>     fs/ntfs3: Remove noacsrules
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D15fdf76128=
0000
> start commit:   ec35307e18ba Merge tag 'drm-fixes-2023-02-17' of git://an=
o..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5f0b8e3df6f76=
ec
> dashboard link: https://syzkaller.appspot.com/bug?extid=3De78eab0c1cf4649=
256ed
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D12570890c80=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D14523acf48000=
0
>
> If the result looks correct, please mark the issue as fixed by replying w=
ith:
>
> #syz fix: fs/ntfs3: Remove noacsrules

This commit definitely removes one of the options used by the
reproducer, though at least from the stack trace it's not clear
whether the problem was in noacsrules or we're just now not mounting
the image because of invalid mount options.

Anyway, let's close the bug, it will reappear on syzbot if it's not fixed.

#syz fix: fs/ntfs3: Remove noacsrules

>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>
