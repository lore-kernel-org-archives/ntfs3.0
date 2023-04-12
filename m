Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305F05660
	for <ntfs3@lists.linux.dev>; Wed, 12 Apr 2023 13:11:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f08b6a9f8aso59465e9.0
        for <ntfs3@lists.linux.dev>; Wed, 12 Apr 2023 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681305075; x=1683897075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYNrGQC5b/NBqc1yQ3cYIsZNkqhxiUfUPkUBeBGXBMI=;
        b=1CZnjtbR216USXkVhbERFHDy8P7c+AU2osjSac6rHPbdfZ1vFvFhpC8NSnsnBms5yM
         ve/WfWhOsaTBOMut5gQKDeHynouskhigYhz64Uh/jmvu7HqO0dQe8SQoPknBPtZozit5
         +m0QCFmYDoIWUSceZWqW2EdwpZ8RhSffbp1dST0cR8Q4g4o3pKr6l3PMhjVc561EUbq/
         HH6huU0rL1RFwJFtwRCbNvrYq2y8pY5k5TLhOYU0gv4QMzCP7fr69CaKpq+U6jaONVkB
         qLHdWz7mNBPIAxaNX6thZHHVqNyUN70hDnR9dxnWTtJAdEHNDRboANdIZIAejOdlbmr/
         Hg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681305075; x=1683897075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYNrGQC5b/NBqc1yQ3cYIsZNkqhxiUfUPkUBeBGXBMI=;
        b=5NMcxtjuNQdzysNu0Dcb+cskOGT3q3hnJ4sjtFs5/NDVCm9hs26hBniyKqkoCQ9mAn
         IKqDSL5reg9Jpe7oz+As5w0rHCzT8DpPhu5Ir6EIwfx1AaA9XIHWuD6OmSHOCk/oFrk5
         MG9gzjNjtpdCIb+6T0zlZIaV/OM0GQxtxHil7UhIW9ZE/5d0dYWXistP3miGOiSlyoYL
         /wC0JLZQkKEdcz8CoBYr/K50H7RAIX/qqgKlXzYgxmGKN9KqxYc+Oi6W4U1bnJiaKcV2
         /TfjsNKA5wo5J306eYo2/KdRnOTfvel0sBqoUaKrkgPUo+g0MR+EEo1qS9Kugj9u3XlP
         BREA==
X-Gm-Message-State: AAQBX9fFvDoojXHP3GVHRxYIELyvTqxzRhEJaS99J5s9+odG+60LcNEJ
	XRYRc4u+6DuyyOEpxoG/1ZN7Kxm5xvEBDvtNksu2JQ==
X-Google-Smtp-Source: AKy350YtLCDH4ydbVdrabxsvBBFQW00tuyHb9t9bfLeg/Wd8PxHaRAFugQin3ixuS561igGxpjSQp0SgAkwMWeu5Lh8=
X-Received: by 2002:a05:600c:5125:b0:3f0:a122:93d9 with SMTP id
 o37-20020a05600c512500b003f0a12293d9mr24457wms.6.1681305075095; Wed, 12 Apr
 2023 06:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000005af92105e80510f2@google.com> <0000000000002c692505f3265254@google.com>
In-Reply-To: <0000000000002c692505f3265254@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 12 Apr 2023 15:11:03 +0200
Message-ID: <CANp29Y6-1HThnB6C+p1D77n3hH1RKyD5WR+xjQomdqrc_pjUcw@mail.gmail.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_get_ea
To: syzbot <syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, dan.carpenter@oracle.com, 
	eadaivs@sina.com, eadavis@sina.com, eadvis@sina.com, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, lkp@intel.com, llvm@lists.linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	pjwatson999@gmail.com, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz fix: fs/ntfs3: Check fields while reading

On Thu, Jan 26, 2023 at 9:13=E2=80=AFAM syzbot
<syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Mon Oct 10 10:15:33 2022 +0000
>
>     fs/ntfs3: Check fields while reading
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D15cc619948=
0000
> start commit:   fef7fd48922d Merge tag 'scsi-fixes' of git://git.kernel.o=
r..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D7341d0f941b33=
56
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc4d950787fd5553=
287b7
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D133d4479880=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D13f05e7188000=
0
>
> If the result looks correct, please mark the issue as fixed by replying w=
ith:
>
> #syz fix: fs/ntfs3: Check fields while reading
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/0000000000002c692505f3265254%40google.com.
