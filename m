Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519022627
	for <ntfs3@lists.linux.dev>; Wed, 24 May 2023 22:29:22 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-76c6c1b16d2so261073439f.1
        for <ntfs3@lists.linux.dev>; Wed, 24 May 2023 15:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684967361; x=1687559361;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEv2m2tkW3LxgGFisYpUk4xaYXyQdf15D8timEsBePw=;
        b=Yx46Ogd+DUGrTDsInyfl5z7YY2PJ7wIakr9M956VRjS3rop1MGJwcP/omZtNKIvVMS
         T3GwGgzHMgHig140qPQADm5OIkiPTj2oO3bXagjNT+JQ+cJBR3aFetVR0l4iwFZJ4sGK
         stlxGBMRUTDd7K24FDWyz202Y2euOkDsxo/Y5/+gu/6SM7GjhlChQsLHrnWbTgYBWkQ6
         NIPcW8xrCxQ8LVD/LkkeNAyJMTvDzOxhu0scbsulEVzikRxbCz0pEe+6Q6XBNTAxTvBb
         qU8dxfttCy1jBpbWajznNpU5SIxuAEqlsgF0RlKw/EayWNGakDHner9/zRtGaSau78Ah
         Hv4g==
X-Gm-Message-State: AC+VfDz+qWvqh/1MGoExNBW+R2Aqd4fAnOffWHmTjpVGG9NirfIK5Vc5
	BI8XNzQ3OFJjMwTla3QoIZsOw5ZttRIL4TEdt9KlR724iFA3
X-Google-Smtp-Source: ACHHUZ72qrCpncxwPE6/T5eypdjBRfnsPFGFFDWfjAutJOp5v9DIOoQX8UKqk1yaqn3vJLjS3kFKoFiv8AWb/wsRgVElDA5SO5rs
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:8521:0:b0:41a:c808:b49f with SMTP id
 g30-20020a028521000000b0041ac808b49fmr8538740jai.3.1684967361648; Wed, 24 May
 2023 15:29:21 -0700 (PDT)
Date: Wed, 24 May 2023 15:29:21 -0700
In-Reply-To: <000000000000eb49a905f061ada5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000ca36b05fc780953@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in do_symlinkat
From: syzbot <syzbot+e78eab0c1cf4649256ed@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 267a36ba30a7425ad59d20e7e7e33bbdcc9cfb0a
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Jan 16 08:52:10 2023 +0000

    fs/ntfs3: Remove noacsrules

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15fdf761280000
start commit:   ec35307e18ba Merge tag 'drm-fixes-2023-02-17' of git://ano..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=5f0b8e3df6f76ec
dashboard link: https://syzkaller.appspot.com/bug?extid=e78eab0c1cf4649256ed
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12570890c80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14523acf480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Remove noacsrules

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
