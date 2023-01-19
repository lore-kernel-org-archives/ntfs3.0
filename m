Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563643C26
	for <ntfs3@lists.linux.dev>; Thu, 19 Jan 2023 09:35:16 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id l13-20020a056e0212ed00b00304c6338d79so1197449iln.21
        for <ntfs3@lists.linux.dev>; Thu, 19 Jan 2023 01:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=am8GpKWA1BfZfDywTelCI0lV8JSyrH6JH35aW+117pk=;
        b=ItVvq+DQ73aSs2+/7UXKD+bC3dH2craqC24vcEcO0Y9rxxmswZg1Z18YIAgT8Z/9Wc
         qHk5y9S4xASkcgLN6gC6ORxJw+vr7MzIaymE/AUvr/rvD0RDktuDQPFu5Rdj8eiY6ST/
         lvV3yn4kKc4+r/s8Nk953YTSu1dnc4WtEDg/TUie8Wt2xjB1vbP6zpfTRSsrNbc4JUTC
         U07xDhbNdilS9skCuP+OqrTtlISOS04FkGRyL1qEAGJHY8vExwsO04J+PLJnbpLZ+KqA
         oCy9xEux3DwaZMrEEI5liI+R0WvamsKvRxhx6GD0eQpIxsdeI+5cdtt9cMStQx58rqU3
         YvCw==
X-Gm-Message-State: AFqh2kq0tTq/jaLtR2fdUW6bTUCHAUXgCDGwjghr49EGRG/GqH4uuleX
	IHNMVSJjYbkWzxsXWq+25FCeGe/ll/U+4u+sYmZhDB7N2M4h
X-Google-Smtp-Source: AMrXdXsOAWPE6bSz4Hy3s0I/hLKjZwQxD0yrmoLIlj3p9fBgVOSQZ+UzmiokcTtqSqnCIFMwiC7AwT2r4rkTMOuBnMzWq3EzLcwe
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:d241:0:b0:302:fe4d:3b9f with SMTP id
 v1-20020a92d241000000b00302fe4d3b9fmr1103045ilg.54.1674120915492; Thu, 19 Jan
 2023 01:35:15 -0800 (PST)
Date: Thu, 19 Jan 2023 01:35:15 -0800
In-Reply-To: <000000000000d7eced05f01fa8d0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007aa8fc05f29aa6d7@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in mi_find_attr
From: syzbot <syzbot+8ebb469b64740648f1c3@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=111e2f0e480000
start commit:   e2ca6ba6ba01 Merge tag 'mm-stable-2022-12-13' of git://git..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=131e2f0e480000
console output: https://syzkaller.appspot.com/x/log.txt?x=151e2f0e480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6133b41a9a0f500
dashboard link: https://syzkaller.appspot.com/bug?extid=8ebb469b64740648f1c3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fb2ad0480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164513e0480000

Reported-by: syzbot+8ebb469b64740648f1c3@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
