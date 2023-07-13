Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5A15ADB
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 08:32:09 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fbd33a1819so43335e9.1
        for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689237127; x=1691829127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZXFTzZ23tBD9HLQ6KgmQfM1q8HQlCUmLAo2N+jQgyQ=;
        b=ex2YC8/yDLqNpP6R+BAdB+o08HynDsjMbJ48xoaS3vhuyNfQFKPILnqmnZYvjL1tDv
         p5TaPb1oAbo2DpdKeRR6VWKRxq/V/P5bA1DeqgD4VQTrE/zrK0ioQ7LA55ZAK7lpw0+T
         doC/1Nv9st++dDqdBr+xRhMTdjhiH1Utf5EfYVQIVkLyYtDjK7h3BILyLPLAPIm6JsrR
         eAjwxflsLOprvTo+sE2GjEz5fSwM+GmTBwFzKAvI5M/cauBYCOOgmRUicRBvk2llX8iU
         ZyHeP2zmdkPYu/pmt2LyU/171rz5UHlSG2gUfAymA0p/yJbsMUoBtm+Pmm1ot/6w6qn/
         R/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689237127; x=1691829127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZXFTzZ23tBD9HLQ6KgmQfM1q8HQlCUmLAo2N+jQgyQ=;
        b=iLKxnfiYZoO9M7WDkkRd1xSYGlN5a07lOMmAO1PKngrgDm0OOZzCrvE8AIuU//ioko
         A1RDO5udboDlFsUvUm2KAmLdoznwBB/pdzdACIW/WFgDVjJYToE5XFqSAcUHLKhWaIq6
         NmPpo21z0Kg+K4e6542SOml2H4V4YCPoKb+7ygJD8RJFTKmckNclaNHqCJdGah+ieKQG
         2oKDW/79aNnRNYHl42mrcz6Hq7ZkOLjw7m4JG/ZhXZzVLIdjEa3ViUsr5pofMLMBk3sU
         OWhJ5ZAuEPFckTVEiJC6cHq/GHgpv62g9gpExkb0r49QC8S2z4qAo61XlZsryXSTcW/U
         2E+g==
X-Gm-Message-State: ABy/qLZ3VTb/YDLNL98k3hSFX6Y37XMxcIedOMl0cVuFa+5k8+nFSw00
	LbOgXeaeXH1WYcd6WJViyFCT6b5MylrpQx924PU3HQ==
X-Google-Smtp-Source: APBJJlEc9EZE8pYaZ2NssNIo57gADVB0lUq6rpskj6IUCA4s3O+BuqWJPo9l+Ye6E3lzSHTKA26gblQsnM6dChRfViM=
X-Received: by 2002:a05:600c:3ba6:b0:3f7:7bd4:3b9d with SMTP id
 n38-20020a05600c3ba600b003f77bd43b9dmr201139wms.6.1689237127389; Thu, 13 Jul
 2023 01:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000fd3bbe05efb0d1fd@google.com> <000000000000a5d5ab060055215c@google.com>
In-Reply-To: <000000000000a5d5ab060055215c@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 13 Jul 2023 10:31:55 +0200
Message-ID: <CANp29Y7LG7szcmLzfjNAZRpitQwn6Yh-h7zPk+demObAwuxwZw@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in walk_component
To: syzbot <syzbot+eba014ac93ef29f83dc8@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	davem@davemloft.net, hughd@google.com, jiri@nvidia.com, kuba@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 4:31=E2=80=AFAM syzbot
<syzbot+eba014ac93ef29f83dc8@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit d772781964415c63759572b917e21c4f7ec08d9f
> Author: Jakub Kicinski <kuba@kernel.org>
> Date:   Fri Jan 6 06:33:54 2023 +0000
>
>     devlink: bump the instance index directly when iterating
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D12801432a8=
0000
> start commit:   f3e8416619ce Merge tag 'soc-fixes-6.1-5' of git://git.ker=
n..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Db83f3e90d7476=
5ea
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Deba014ac93ef29f=
83dc8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D117d216b880=
000
>
> If the result looks correct, please mark the issue as fixed by replying w=
ith:
>
> #syz fix: devlink: bump the instance index directly when iterating

That commit fixes a second problem triggerable by the same reproducer
-- "INFO: rcu detected stall", but it is not related to the original
"WARNING in walk_component" crash.

>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>
> --
