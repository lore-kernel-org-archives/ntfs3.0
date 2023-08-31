Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C410E1
	for <ntfs3@lists.linux.dev>; Thu, 31 Aug 2023 00:31:34 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6bb23d4b3b7so470540a34.3
        for <ntfs3@lists.linux.dev>; Wed, 30 Aug 2023 17:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693441894; x=1694046694;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+Ys1cwjPfgqv/vEsA4s7A+pElm5Cn9tj91Zioe86LI=;
        b=M5TXm8miNks/SCDJhWFa5g8beYyQP8WGXZOn2X5UTsgLhDICkN8QoXu2SCBII86voX
         PxR9CoAu9NfGp4PQHAbFnYJs92KcauTG4XiyZJXybXbQQfycdBA0fgKsbQKS1JfnJs98
         76NG6WEgXZ67wiDjiqOFwyxXA6Se5M1LCGXtWytj+oOKpCscBO01OYXxsoDNySIxFPt8
         zCao+ApVwd7HBbaInibvwP4FsbYJQI5jboLvZEtzVTfQ4PFVz4Dc5EZasSSj4c9qjUxV
         bhoiZyNuTsja8fGZgqR78rWwssXWMpPa4XPyKmDepMZfxaCJDrgSFVF1WgOs4Xa6PZjN
         B8/A==
X-Gm-Message-State: AOJu0YxBHGHqQSB7avewSA6j4u/K0ZRRnXDxga61guhyPL11e71xIWZo
	+MK+uOgKUrMN7Cwjt4ey94HkGpf9Q9XRITNvl0LYMR0+kqIa
X-Google-Smtp-Source: AGHT+IH/xFTz4XQxoutjF9VYd71vW+qQX2pv9ulRwbHgizHfCMrd72ah6dGGlmAvpkUjeFfrdGqRibIV1gy5WEuRRlQQHGWoS/Gy
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a9d:4d0e:0:b0:6b9:a422:9f with SMTP id n14-20020a9d4d0e000000b006b9a422009fmr374752otf.1.1693441894159;
 Wed, 30 Aug 2023 17:31:34 -0700 (PDT)
Date: Wed, 30 Aug 2023 17:31:34 -0700
In-Reply-To: <0000000000009531dc0602016bb0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008c9d5106042d2abb@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in hdr_find_e (2)
From: syzbot <syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, astrajoan@yahoo.com, 
	ivan.orlov0322@gmail.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=151f20a8680000
start commit:   4b954598a47b Merge tag 'exfat-for-6.5-rc5' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=171f20a8680000
console output: https://syzkaller.appspot.com/x/log.txt?x=131f20a8680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1e3d5175079af5a4
dashboard link: https://syzkaller.appspot.com/bug?extid=60cf892fc31d1f4358fc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ee0aa6a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=100eaedea80000

Reported-by: syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
