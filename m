Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73418FDD8
	for <ntfs3@lists.linux.dev>; Thu, 12 Sep 2024 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726128683; cv=none; b=CUURzslTtx2Xnsq41i2kOMF2Iv8JrkMwLVoU0vHoJRXxB3rsFkAmg/mzXcLtjFViCtBCZZPg7PWoFTmMP+Eu/uqACPkAc5bctEHCeuGs8hRd5kudZ88ftn8quWxUSW7n+84g8GIF5SbUVabgahEombUUGQ1A1/kHOVbXmEj6QL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726128683; c=relaxed/simple;
	bh=+FjPOjsC90nGSQ6SyM2El4O7afIWk4e2DSPjQIXmi6c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pY0TItQhokLBUvFogTJLsQZhzTErXd6xAWucw4Ksi+y45rXzUUteTGd7vrmCjkz98Rtlh1Br03ry/MnJDUhujslnHpH78rKwMi+Rndp22zjSpGY4qMJn4nwCeP8Ek6x1L33TktfXiwY3WX1pSexiGWkyXd7cTaMPGiwsQO9m2sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-39f5605c674so11605045ab.3
        for <ntfs3@lists.linux.dev>; Thu, 12 Sep 2024 01:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726128681; x=1726733481;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6URRhafhkSYWjZNhALlJLM/SfWa/5qmQZKFuhu6WB8=;
        b=r+X5rFjEKIiVSwrEf3pDMiPxjKjyk9S+Av0FJkQdkxr1rrfCv5A6HJppgvFS5TQhs2
         IdMG83Crpx4g/sFg8s0w7a8TRsioGdvGZo1pB7bwP6nBh7pKime788KnbkV7jrQQWWP0
         6hJ2Mh6WHRLRbl6sP60hLYoYpx6egnnnbX9l8JA/jrcAL/qlcw1LvA2fU7Sy9SLhvzYY
         WhdrfsBR3ytFkREv/Quxg5m+wyTVMBZfHLgv37yXSH8SZdTLiC5KrU6h0d3vrkjBQ+XW
         KwebCjSpTXC29sXh2hCukgoblPmq6PZYV5ML2Gt9rpEhTqKfRrr4zC/yr4aKte0mYFN+
         2KeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEV9kdZHJLQHIHcSyhJCgCkk3+Y9uxHbppAVipaUiR/f/Kt3Llk05WbrcgJbuQA5ErvOs36w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUg4J1Q4EuPyP0H60YRdUD3C27s2ZCbEaZirsGBn7Ihb/sRx1V
	Zqw19KxeZjFUczJGoU5u/7bvgtCINNIJDpvRfuLbC6EtuMzaABEHVZgshKiiL+ZNwlYUzqc9cEQ
	WGJXB9pDbbYQV7Bidjq3+qjwJUbct4qvVR12V+IK5oY4yz5X1aih5l7w=
X-Google-Smtp-Source: AGHT+IH9PefFzA7QiLpOatAAZXNdwSgRcv509nYPOUBPbCuMPlwum216H1nu9GMdnHtOhvrwl6/I2VauZokki3C6SgdxpXrxhNu7
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148c:b0:39d:1694:d261 with SMTP id
 e9e14a558f8ab-3a084907d29mr19004285ab.12.1726128681656; Thu, 12 Sep 2024
 01:11:21 -0700 (PDT)
Date: Thu, 12 Sep 2024 01:11:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e831e90621e7a6b5@google.com>
Subject: [syzbot] Monthly ntfs3 report (Sep 2024)
From: syzbot <syzbot+list6ec5971c0fd039e92cbd@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 12 new issues were detected and 0 were fixed.
In total, 38 issues are still open and 50 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  12022   Yes   VFS: Busy inodes after unmount (use-after-free)
                   https://syzkaller.appspot.com/bug?extid=0af00f6a2cba2058b5db
<2>  8882    Yes   possible deadlock in mi_read
                   https://syzkaller.appspot.com/bug?extid=bc7ca0ae4591cb2550f9
<3>  6470    Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<4>  3596    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  1828    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  864     Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<7>  491     Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<8>  179     Yes   possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<9>  83      Yes   possible deadlock in ntfs_mark_rec_free (2)
                   https://syzkaller.appspot.com/bug?extid=016b09736213e65d106e
<10> 56      Yes   KMSAN: uninit-value in ntfs_read_bh
                   https://syzkaller.appspot.com/bug?extid=7a2ba6b7b66340cff225

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
