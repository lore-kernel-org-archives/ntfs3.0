Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71E7C
	for <ntfs3@lists.linux.dev>; Sun,  2 Oct 2022 20:04:20 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id g1-20020a92cda1000000b002f612391d5bso7051709ild.2
        for <ntfs3@lists.linux.dev>; Sun, 02 Oct 2022 13:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=alt+Pnmjzew3cSMHF8D4f4jTWwNd/We9mTfqo5aLOos=;
        b=dvS7UGKOuJi6pa27kAj1URMwSXtd3d9j3zbdCMGqogNE2g1WSS9IRFmyvU3U2d7F1P
         XMNn/xA58EgXbTooDRjxzcnOjyPCvLQRQEtIKCei2sSMeMyRpVeN20r0Bnh1DJYooSha
         PKo4MP+WUcHvVzmo1stPruxZoEZmF2pr32eRsKlJBG36Ns0HfgoXxpOLOHIe1OmcLyQ8
         mIPudYiBcp5zrnBMBq1de/1+QP2ad3wCJY4IVyHJizodiTThqUOxoSLQ/JM3bCrCbv3x
         uPZjx3GRW1hhosUaJFzrHjIdPyW7LeLTlP4R20xuMs7SYM2baxuKvblTrzYmp1BBjUOu
         GcCQ==
X-Gm-Message-State: ACrzQf2Q3ccs1e1Wp2nOjSPt449GZEM+u31p0doCyQla5xGAOEitmomg
	uY/PQpGCc6r6VS/PF6vbvdfwcewYTSmiNFj91d8q1895QYVB
X-Google-Smtp-Source: AMsMyM6VLcxZo3tjaJFXzbN/lsdTicHGhkOT9Fp7uoyQ4GhRHFgxHmgHscdmxDLKobMFvIgDK8W1sDcVNrnUqYDMsKocGpjcH2gM
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:150c:b0:35a:f7a9:c3d8 with SMTP id
 b12-20020a056638150c00b0035af7a9c3d8mr9235231jat.38.1664741059255; Sun, 02
 Oct 2022 13:04:19 -0700 (PDT)
Date: Sun, 02 Oct 2022 13:04:19 -0700
In-Reply-To: <000000000000eca83705e9a72fb9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007ae43605ea12bb12@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_trim_fs
From: syzbot <syzbot+b892240eac461e488d51@syzkaller.appspotmail.com>
To: abdun.nihaal@gmail.com, almaz.alexandrovich@paragon-software.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b6daf4880000
start commit:   f76349cf4145 Linux 6.0-rc7
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1476daf4880000
console output: https://syzkaller.appspot.com/x/log.txt?x=1076daf4880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba0d23aa7e1ffaf5
dashboard link: https://syzkaller.appspot.com/bug?extid=b892240eac461e488d51
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133c8540880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b74870880000

Reported-by: syzbot+b892240eac461e488d51@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
