Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290E10945
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 10:17:27 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fbb07e7155so54155e9.0
        for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 03:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689243446; x=1691835446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgTfpf6IMD+zAdQw7gG1t68xyEykfaw6L7r/eLwpcfM=;
        b=QXKfcJsGmoR2FM+lAmlHzHe6q7yhlyPrQsB+vj6KfUt6Bb2e8m8BQf+lpKGL7vFgJo
         /qZh3y1iyMzKappWzYzKoDn2Rxfd+N6uaAr16XWKSmVi+bOYgmEOm/n32Eq/oDdpfOPu
         pjTEImKYTahfoNfD4b1rE87Fy8swF5uKyvdgAP6bfdgnLbRNQ4wU9Fhb9K00BWInbz5X
         Dft/1S1COT/pG2C2MPHxeIVnpI7Xx7r2Q2PmXJbQpQEtFq54SC4aoORGeD+J480O/bTo
         ovGRzW5PUnr/06tkzkmgEVgnzXTGYofZ4L3Elq1nV9Di4/OyJsbGG6q3VLnPhjMfoc6z
         He5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689243446; x=1691835446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgTfpf6IMD+zAdQw7gG1t68xyEykfaw6L7r/eLwpcfM=;
        b=LVa8QfZznT9M/pTJL4B32cuSYvV2rq7Lc649STqi6q1AbhXoiv60iN94quOBLIF+6C
         kQ90xxVckJ2B0CpqILwfEnEBPinHl8iioV4K1L65W7Ye/zXwaE+IbQGxmb/YlL0XYCqM
         piU9AL/LmUa6JiKNY+gVtoemTBpEwuhsu5zXYGl3TiP4jtU17YbQwJUcGEbmw88oIhdJ
         qVILh0NxPHWrsv5kj7EU+5X81372M2rBWuQMet2M6bV4XzxLWYQzGw7eefiGadN1RYkq
         zsEa8CzrXaMFMrIKskWcecBY8GxN1+QMtRYSoKx2YpIJoTjtaIHCIrBmyH7A/7yBoL55
         v27A==
X-Gm-Message-State: ABy/qLaKx8mne8gBaALIvDNqaTTsotF3hJrUy6dWqpH9+Jhvwd3NXi7o
	xaD+1qmVPA4vkpja8AbiYrlaeMWA3NWHs/zu/CnZ7Q==
X-Google-Smtp-Source: APBJJlELuWCfdGb2EDMi3fT5s3Ym2+WxWmUEY6LSu7hPmkiTxSseEO2OPLfVUEJVsYNHI5Mbp/NFKXW02jQC8YiyH48=
X-Received: by 2002:a05:600c:1c9a:b0:3f6:f4b:d4a6 with SMTP id
 k26-20020a05600c1c9a00b003f60f4bd4a6mr179255wms.7.1689243446227; Thu, 13 Jul
 2023 03:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <00000000000009408f05e977da5d@google.com> <00000000000085151506005b1491@google.com>
In-Reply-To: <00000000000085151506005b1491@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 13 Jul 2023 12:17:13 +0200
Message-ID: <CANp29Y4y1T6T6VBCGxOP2aDSf-2zRBgFOJEbxZT_Figd=gNm0A@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in d_flags_for_inode
To: syzbot <syzbot+2f012b85ac8ce9be92e5@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, hverkuil-cisco@xs4all.nl, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 11:37=E2=80=AFAM syzbot
<syzbot+2f012b85ac8ce9be92e5@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit c43784c856483dded7956175b5786e27af6d87f1
> Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date:   Thu Dec 8 07:51:32 2022 +0000
>
>     media: v4l2-mem2mem: use vb2_is_streaming()
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D17e7d1bca8=
0000

No, that's apparently unrelated. Though I don't see where exactly the
bisection went astray..
Likely because the reproducer got quite unreliable at older commits
and we made a few false "git bisect good" commands.

We will soon start automatically discarding such bisection results:
https://github.com/google/syzkaller/pull/4028

> start commit:   4da34b7d175d Merge tag 'thermal-6.1-rc2' of git://git.ker=
n..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dea03ca4517608=
0bc
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D2f012b85ac8ce9b=
e92e5
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17834f9a880=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D10edf52688000=
0
>
> If the result looks correct, please mark the issue as fixed by replying w=
ith:
>
> #syz fix: media: v4l2-mem2mem: use vb2_is_streaming()

>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>
> --
