Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E017C8
	for <ntfs3@lists.linux.dev>; Sun,  2 Oct 2022 07:07:26 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id i8-20020a056e0212c800b002f9a4c75658so1276972ilm.3
        for <ntfs3@lists.linux.dev>; Sun, 02 Oct 2022 00:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Qi6nBTR+UnFwIOgi+5za5E54nvZ3NxHLQWk2qFGen7o=;
        b=P0hbl8wtYo5mw+g13yiGLOTNcirrpkg84kZ73i42UZKS4P25Dpp/u1gmwpJTMeoXfI
         zDjj7qEeDeM2O4vNu8oMkuCM2EqfwSJR5qt7eySOksd6otmTpKxobRNfnaIzx92SQU+J
         tQiDM8EkuvOk0qU4cmtz3eJs/woo4jlagmcYwRdKbesqKTXcqhIhYBmBIji89x4TU6ve
         McwXj4OQamC1WSzfeEZhYbZhMPMC+17d2B80YItujkJLEFvSzPQITFXaJyW91D8435n9
         O4eMdTWv3LyyGC099n76LyoJ6rLfoj1EWouB+4aid/Zl090tRftu4Yy1asE39CCO6uJl
         hApw==
X-Gm-Message-State: ACrzQf21LeH1/vd2KhB1+hKIveZTVNnALts8jgpvyRucJwn+N5g/8YTd
	6CzzXW0sM3K5fx8InHpnIt7QLTAFhtVFR+yoK90vFUWeamog
X-Google-Smtp-Source: AMsMyM6cwMuncRrmt79Mj/WXcS4r8FkcadYGjogneb5rOnAxTbtsoztfCGT+QgEWfG27XV9v4TrPFfCnEMjjdH+b+i0t+wg4+sQ6
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e0c:b0:2f9:c089:eb27 with SMTP id
 g12-20020a056e021e0c00b002f9c089eb27mr447588ila.172.1664694446144; Sun, 02
 Oct 2022 00:07:26 -0700 (PDT)
Date: Sun, 02 Oct 2022 00:07:26 -0700
In-Reply-To: <000000000000c2333105e9cc7b1c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001f464d05ea07e1ec@google.com>
Subject: Re: [syzbot] WARNING in wnd_init
From: syzbot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, kari.argillander@gmail.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, pjwatson999@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit fa3cacf544636b2dc48cfb2f277a2071f14d66a2
Author: Kari Argillander <kari.argillander@gmail.com>
Date:   Thu Aug 26 08:56:29 2021 +0000

    fs/ntfs3: Use kernel ALIGN macros over driver specific

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11e776f4880000
start commit:   49c13ed0316d Merge tag 'soc-fixes-6.0-rc7' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13e776f4880000
console output: https://syzkaller.appspot.com/x/log.txt?x=15e776f4880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba0d23aa7e1ffaf5
dashboard link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cad4e0880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1303781f080000

Reported-by: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
Fixes: fa3cacf54463 ("fs/ntfs3: Use kernel ALIGN macros over driver specific")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
