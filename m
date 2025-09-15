Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746002D6E4B
	for <ntfs3@lists.linux.dev>; Mon, 15 Sep 2025 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757922484; cv=none; b=R8ny/Go4WcV4cRzIOmjrOHrxPy9TYczKJOWnePC3x/RmeqnndPc5ZVmX9gNdO40sFoxLI0OvI7v6wuHwhEnjhS5bMnGrPltBgFrQDdMZkwqjbX57X4a5QDSREpqVUcJUREdDOfemoOqn1PlrvoWBo8RZadjdnjYthTKz+ZKi/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757922484; c=relaxed/simple;
	bh=sDqJwn9c7svvbHL1gVSSlKD6t7Spn2ExhaOMtxottpk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MOsKBOEG6qxemKcJV747vvP/6zlLZQiZ8iTnQYszQB9yoUCd0qx8A3Mv7xkHtpT8PQx9pssdHrxNR+TezMJf8edmMxfDZN7489NzF5L4p52YM3CVKd3Myd+iO1LtiG7Xi3Gs0jQlF4s3mqvcvFdNUBW3VZmzau4ClTe6a7ZzyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-40f7be8ecf2so114926285ab.1
        for <ntfs3@lists.linux.dev>; Mon, 15 Sep 2025 00:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757922482; x=1758527282;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mUB+sqn22sEooHqNX4QjIWNl0SVDHgDFAZHnR3by08=;
        b=Zz8bImdpyWMZiQGY869/g+Xj4yXiK/xyCvU/45PFVLWEeVoKtfKNxxjPeNiXrVi4mR
         cW04LorYpZUhE1TpQ6vg3nRP6zfYQz8sDSkObjJCQg0u/m5kDZ5ermGCaJ46CXMKNybD
         wD5w1aScY3DjAtPXJoC0g+h55/GvmrnsgledChv6W4iGzinHN8gPG7HgcQwN1jglAX1W
         0HabMvQlgKSkz6QHFfYQ9KQ5YFRW5C3E2pmcJ8ZDgRGLPbTcmS7PLrFVQmHk4AUe1Ra0
         uc2XxugFMX5xLweOXXER18bN6G+dVwi3SJ2iQ2MzpR1KA4MccI2ww1bZvAjzS+WYvWsK
         h5/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+Hs6zxRzDWFt7oJEZ31n2ZePU5QRoEewAYPau1S8E9XnBD643EG535SYhm5hcSVWwJ16NgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhucm5AwPlTnyKmtkRh4jdVTGacq3ztO8GYn5UpXH41L/lsuSq
	lfHLqxvt5V+gYYfWa/5u4yrwr+hEOd8CtG6sDZKaobJ9Yh/zHGw+TG/g2KNvCr4lxwYUpB1xGyZ
	+45L4mvDG68T+rjLp7TOaB3f91RfgMh0XpshFUKYGc674F5tBcpRNX/PPxwc=
X-Google-Smtp-Source: AGHT+IE4CuAPdzy8E4AvKc8mu1VORU1gsGkMG2LeH46HuG2nXACKeM9R4m04zBUAqJVQdjLVNxByaK5Y3triGrs0MdUjLeTFvwJq
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe9:b0:423:f9c6:f21b with SMTP id
 e9e14a558f8ab-423f9c6f2d1mr51696275ab.8.1757922482721; Mon, 15 Sep 2025
 00:48:02 -0700 (PDT)
Date: Mon, 15 Sep 2025 00:48:02 -0700
In-Reply-To: <0000000000008b529305ec20dacc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c7c4b2.050a0220.2ff435.0391.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] kernel BUG in dnotify_free_mark
From: syzbot <syzbot+06cc05ddc896f12b7ec5@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, amir73il@gmail.com, 
	christian@brauner.io, hdanton@sina.com, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@ZenIV.linux.org.uk, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 55ad333de0f80bc0caee10c6c27196cdcf8891bb
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Dec 30 07:34:08 2024 +0000

    fs/ntfs3: Unify inode corruption marking with _ntfs_bad_inode()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15420e42580000
start commit:   fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1a07d5da4eb21586
dashboard link: https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e3dffd180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f9e08d180000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Unify inode corruption marking with _ntfs_bad_inode()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
