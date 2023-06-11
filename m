Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC4107B4
	for <ntfs3@lists.linux.dev>; Sun, 11 Jun 2023 22:17:28 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7775dd6c7e1so475344239f.1
        for <ntfs3@lists.linux.dev>; Sun, 11 Jun 2023 15:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686521847; x=1689113847;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tb0ZpKp5Xcf7c2M/6Lg/dqUujad/vr5X4auVnTDjdJ0=;
        b=KiUcAETIHU1YOrHGy1InAYQYLM0ed3dJnRgzbjsxCbc5K2wx8qF4EnA+6+wkbxCk2p
         F0RNBhkzD9q0bgM9Exonchg4lNCK9lngSzzCzYOeh3TA48eB7I7112saoMk7/ns1dKZr
         04ldFU94THzrMeLip54OH9Uf0N/YtroUZ11AQYnadydpuey3M3ynnaiS6rbcWvyh4g1x
         jxblgcunSiJU9z/goDKtb1LIbZ3gaNZmAO2WGouz8BMLLCTiwaTx0GdyxpdYLb6RN+c+
         x/LZcWJD10z9brBzTMM45jiqq9xvnIdiIlWNIVXAL95T1sU5bTMcqHGmBJzitT2r/tEn
         phuA==
X-Gm-Message-State: AC+VfDxH/IfCUHzl3fSYGQKNiwTf3l8vLwo6CqkZunWaoLhL3VJsCx4Z
	N6O8tepgPUv2becqAG/l6vFVA+NNb2VKVh1MHWRMw4BWIGU5
X-Google-Smtp-Source: ACHHUZ76jxhpMkdSOWymiIXSmAP6nlbvMNMejA6KYO29dhEW02hKZhueWLXvaOgfjmygw/0Wl9A7WAYJqR30bFmRG9ZnFevqGqT/
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:735d:0:b0:420:cbe4:af62 with SMTP id
 a29-20020a02735d000000b00420cbe4af62mr2890400jae.5.1686521847528; Sun, 11 Jun
 2023 15:17:27 -0700 (PDT)
Date: Sun, 11 Jun 2023 15:17:27 -0700
In-Reply-To: <000000000000b0cabf05f90bcb15@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a0c29605fde1f706@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in ni_readpage_cmpr
From: syzbot <syzbot+af224b63e76b2d869bc3@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, neilb@suse.de, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 9fd472af84abd6da15376353c2283b3df9497646
Author: NeilBrown <neilb@suse.de>
Date:   Tue Mar 22 21:38:54 2022 +0000

    mm: improve cleanup when ->readpages doesn't process all pages

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1285d453280000
start commit:   64569520920a Merge tag 'block-6.4-2023-06-09' of git://git..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1185d453280000
console output: https://syzkaller.appspot.com/x/log.txt?x=1685d453280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c980bfe8b399968
dashboard link: https://syzkaller.appspot.com/bug?extid=af224b63e76b2d869bc3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15835795280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16966d43280000

Reported-by: syzbot+af224b63e76b2d869bc3@syzkaller.appspotmail.com
Fixes: 9fd472af84ab ("mm: improve cleanup when ->readpages doesn't process all pages")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
