Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA924878D
	for <ntfs3@lists.linux.dev>; Tue, 21 Nov 2023 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6bd5730bef9so6811308b3a.1
        for <ntfs3@lists.linux.dev>; Tue, 21 Nov 2023 07:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582285; x=1701187085;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mtd40gvVZOgliZlu2JdNIeTyUfDE7Z/9wGS/OB7/wxc=;
        b=SzwYp2SiTrYC7VsETTkmB0oTcKeM/Vgyp+LZijkQv5aK37m2G3vvM1mY2MR/qaWWJQ
         qZbiXFtjpkWx1Mcpzsg+e9lHHx6r2MYpZU4T0vwOdDYA8VugwJWTaz1phclVVuXw7GjA
         mYMODBFGc5UnrH/mSu489SkvHQxeNt1+CZpr+IuoCkmLM3x2SowgvDTN6v7tKhZ3vYim
         T2/x56kd8TylfgWPtrfKqESjup3Arah9VHQJYywMECBdMquqNBFeYSkY44MHYaIu7OpE
         he7gtvGOQXYl3iCBwKuMEP2+WQ0pOJm5FfN+kNolwUwuMIEwFdDFu7+x+7sAoYMwA9iT
         CCog==
X-Gm-Message-State: AOJu0Yy41BXb7TGG8NSrMtoRjAE3O/bgp+VS5akk3D2nmQG2Y1G6EJIY
	Ro4W/7vOqa+P3FH3EKDovIAJHa+fX1Vp2FvHkzMay18cjM2k
X-Google-Smtp-Source: AGHT+IHELjvdHTY2zj4TwvzBjmYjsWI+xOBCOLYeJxvpvDnYxDNJqankuMtl8QGZRNJdh1bCLF9cVLeOAEq8HhRNWKvvoyLJKEAC
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:10c1:b0:690:bc3f:4fe2 with SMTP id
 d1-20020a056a0010c100b00690bc3f4fe2mr1005253pfu.1.1700582285241; Tue, 21 Nov
 2023 07:58:05 -0800 (PST)
Date: Tue, 21 Nov 2023 07:58:05 -0800
In-Reply-To: <000000000000b0cabf05f90bcb15@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000005f3f6060aabab28@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in ni_readpage_cmpr
From: syzbot <syzbot+af224b63e76b2d869bc3@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, neilb@suse.de, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 013ff63b649475f0ee134e2c8d0c8e65284ede50
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Jun 30 12:17:02 2023 +0000

    fs/ntfs3: Add more attributes checks in mi_enum_attr()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14b8bcbf680000
start commit:   1b29d271614a Merge tag 'staging-6.4-rc7' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ac246111fb601aec
dashboard link: https://syzkaller.appspot.com/bug?extid=af224b63e76b2d869bc3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1241fd03280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1476e8f3280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Add more attributes checks in mi_enum_attr()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
