Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6B3145326
	for <ntfs3@lists.linux.dev>; Fri, 12 Jul 2024 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720778723; cv=none; b=IiMwp8W5gfKTT/16wmSklG97HGzjJck5e+7dGA1BIl5WTtGIOn2mSyHttyxjh8zDFsOXe1W1KOps09RDQggT9TI1KfTVEygLybgH3W678D9Its/Gvjp5X1Lvp6OMo4H0jnVPYloJAM2A2xdHJQY2vw7pMiat+H0Gw49xd3N39Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720778723; c=relaxed/simple;
	bh=DikmJ9E0CkpxwbNQafR/uYCkxku/pf/Nz17bFWwUQD4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LNxsDR0Ga0KRk9xPVybnl8wYr0OSor10fQHYEb9fvm+Zj0oiWx9OYiCxov0hn2BO+OlXgQfziwqA+Yz1cyWGaatPT8LF1Ed+1Zx7WRdonN4fXJpIjbqrAMa+d/6vBR0PcL++SY/nqd1Qdq1/AWagwUVB6c5mewQ3gpHE3IJaRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7ebd11f77d8so196115839f.1
        for <ntfs3@lists.linux.dev>; Fri, 12 Jul 2024 03:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720778721; x=1721383521;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sbd91EqdxWCu/AGP/6JU5N6zMd6H/sbaW+FVWVJC6ew=;
        b=nq/qY12+kVvBQIzZ773xpfw2W8MY0xhLKv/LqidX5EsWSszx4FdutoFn4Wkdw70ouj
         8IHoYo1JtRw0j5QeGdIrUawU8Ka8v67tUmWvunYGjnU3xLAg9+iwUThQgYeYxeHe5sR8
         jmThvjUvA+qWCx3pjo4196VG6CbSiXhOEudSRZiHWsQq6wz/oHQBL9VKu2e0mdcT2jKB
         0f0jpVeVqqqyGuM3Ow9IYsSnECY1ekKjEzbs4G7X37mY+DF8JiHa7uOicstX9kGSy3nN
         taO8AeHOcZIxAbmPKt95FUk+zkZ6B6Iyr6rLosU6By7qL6lF7mm7E091NvRDRpSMBz4K
         67GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/dWEWPJg3/7QQnRbMK+VygWavduQXEh7Ix79p5juj42FzKeFT/OQFhzYiqNEKiVXzPmTsScPe2iC/kcZ65+5KFWmhRwI=
X-Gm-Message-State: AOJu0Yx/1o47zd41os3ELHK0JwSMGA+MtqYE7Cvqe+bzphEIGX38j7Ym
	g7U6o8bRj8CbdOb6ag0eOxdg6bEFMRu3N4064tkt3qpCbaySnYzWZjwVZBRNrF0wSP63QdHXL3k
	hJGAm4al6yUyxH/G8XO+1JI0CzkXbeMM+4I2qUlTfWKegnfSjSbBxuv8=
X-Google-Smtp-Source: AGHT+IGOOu5kA2OdFNx3OPYCfpBjbuyZtWQxI+rSmp0aKMpP/GM8DhnuanvAXnFLoMgIkRMkFSPKyuZ7sLUB9otUh7fA+i7L+Nnw
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8601:b0:4c0:9a05:44c4 with SMTP id
 8926c6da1cb9f-4c0b24e9f62mr666495173.0.1720778720883; Fri, 12 Jul 2024
 03:05:20 -0700 (PDT)
Date: Fri, 12 Jul 2024 03:05:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000065473a061d0a0451@google.com>
Subject: [syzbot] Monthly ntfs3 report (Jul 2024)
From: syzbot <syzbot+list90007c8b31066d0be99e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 2 new issues were detected and 0 were fixed.
In total, 32 issues are still open and 48 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  11954   Yes   VFS: Busy inodes after unmount (use-after-free)
                   https://syzkaller.appspot.com/bug?extid=0af00f6a2cba2058b5db
<2>  5491    Yes   possible deadlock in mi_read
                   https://syzkaller.appspot.com/bug?extid=bc7ca0ae4591cb2550f9
<3>  3908    Yes   possible deadlock in ni_fiemap
                   https://syzkaller.appspot.com/bug?extid=c300ab283ba3bc072439
<4>  3543    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  2533    Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<6>  870     Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<7>  562     Yes   possible deadlock in ntfs_set_state (2)
                   https://syzkaller.appspot.com/bug?extid=c2ada45c23d98d646118
<8>  97      No    possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<9>  92      Yes   BUG: unable to handle kernel NULL pointer dereference in attr_make_nonresident
                   https://syzkaller.appspot.com/bug?extid=5b6ed16da1077f45bc8e
<10> 82      Yes   possible deadlock in ntfs_mark_rec_free (2)
                   https://syzkaller.appspot.com/bug?extid=016b09736213e65d106e

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
