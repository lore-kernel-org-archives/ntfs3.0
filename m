Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2779D8
	for <ntfs3@lists.linux.dev>; Thu, 27 Jul 2023 06:47:31 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fbd33a1819so35475e9.1
        for <ntfs3@lists.linux.dev>; Wed, 26 Jul 2023 23:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690440450; x=1691045250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VjR3y/NhR9d/n61OfA+UcoVAqNvKvdj5JIvCgpy4QI=;
        b=jv8kLEWT6bSwYha6xFiUAElWMCPrx3lpi1qWwErb4NzD7uum6JoSy84x2ZQ1lSPBqy
         JKSGnsuYi7/r3JF9xKsx7Nk8kMhafpBmSsD1oLdfdCGsDieibuegl6LfafbTHfToNLth
         ApCcnXmususTHmOZGaiCwkYtDvIWX/kdtXz4VaJon/YHdjkS/7pEtmoknHjT6GWraSOs
         +ElWjpcZGO2e8woDEb5CL+sKmKy4J196loIyFGF6OcJauDh+HW2hIR2+Iia3rsksqJqe
         +IeEfZp7t1B58DRUR0Oos53qLswubOwyqMX/EcW6zhA/NHl9BV7ixCZgqBBeZQAVsCX8
         EMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690440450; x=1691045250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VjR3y/NhR9d/n61OfA+UcoVAqNvKvdj5JIvCgpy4QI=;
        b=VRKPxjkIgzz19uwJQ5nq/8TQhEoU5QrycqKFn3H5NYHwY8rjvOwopz8EnTVhTz1Jud
         hkHflPlscw3tq1xAt4ZYrcNBxebw+SSEmCuBA4Xzv7WzELyKcHjkQnXuf2sUugzv5/ee
         wCuDbKKDpGnIFujMT0W4NzigrR2/xt3dZeJKaldLD65dw/QpXgNJ4TVRVn1lVk64pu0H
         enOGN64phE3uoHPwyJIBPiJxPiYcs50jTZM82+MrDSeGRhPWTuYaBeU0KtOTLQt9jAUk
         s4MKCWw9yq1x+vWafnL0p3JUs6NZj6iMlQMpjbOoG64Cu54s/aK+7fb5X+BYxMX2nFBU
         66DQ==
X-Gm-Message-State: ABy/qLaw4qucMVLqrVVaf+tF4rg0XWDFzuWblKgsJMy0OJS3LpBBF6+m
	TrDNNEbLMeWnBpRA/k2CXt1yahFrRMEAZhTkV9YRvQ==
X-Google-Smtp-Source: APBJJlHfJHMB79wmPcYAX+eRz3l3yJooxMVKXpu6Z2nTr7RChJGtq0JGjXHvXpOL9DCD74cw420Zqm1UmohQ13kUBC8=
X-Received: by 2002:a05:600c:3b21:b0:3f7:7bd4:3b9d with SMTP id
 m33-20020a05600c3b2100b003f77bd43b9dmr1852wms.6.1690440436670; Wed, 26 Jul
 2023 23:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000a0d7f305eecfcbb9@google.com> <000000000000ca24700601714dd2@google.com>
In-Reply-To: <000000000000ca24700601714dd2@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 27 Jul 2023 08:47:04 +0200
Message-ID: <CANp29Y5htGCC0X73qb-iGwjN0OaFCmCRKTEdhCcF_nx7aLpe2w@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in path_openat
To: syzbot <syzbot+be8872fcb764bf9fea73@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, bp@alien8.de, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk, yazen.ghannam@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore this bisection result.

On Thu, Jul 27, 2023 at 7:33=E2=80=AFAM syzbot
<syzbot+be8872fcb764bf9fea73@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 00e4feb8c0476bbde3c8bf4a593e0f82ca9a4df6
> Author: Yazen Ghannam <yazen.ghannam@amd.com>
> Date:   Fri Jan 27 17:04:03 2023 +0000
>
>     EDAC/amd64: Rename debug_display_dimm_sizes()
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D157a6f81a8=
0000

accumulated error probability: 0.50
< .. >
reproducer is flaky (0.11 repro chance estimate)

The reproducer was too unstable and the threshold for non-reporting is
currently exactly 0.5 :)
I'll decrease it.

> start commit:   c1649ec55708 Merge tag 'nfsd-6.2-4' of git://git.kernel.o=
r..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D319a3509d25b0=
f85
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dbe8872fcb764bf9=
fea73
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17c604fe480=
000
>
> If the result looks correct, please mark the issue as fixed by replying w=
ith:
>
> #syz fix: EDAC/amd64: Rename debug_display_dimm_sizes()
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>
