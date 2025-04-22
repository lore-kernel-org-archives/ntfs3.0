Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA7F27C851
	for <ntfs3@lists.linux.dev>; Tue, 22 Apr 2025 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325692; cv=none; b=Ogxov9xCWlxJYDfuBewo3hwD9kk9/bqpO1qqUOZlFICs+Peg1ZLSeqO2LZGLzXG7n8wKhhWRcZB86gvHaHfBbE374md1C3WRDVpDeSQ21Xqt7h9UKIiXkDUGzUcaeefyBDyYOoXMCL6rhJfD32kn4cH7wjiQ/vv9ftwceXx4wI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325692; c=relaxed/simple;
	bh=sXAmC3nPD4o856nJkf7EEsWJp4SumMbC8VcB+aXXTfQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bY5gGm8NXMZAUctupg95AHaOhgqa2fu2gx1tiYv4hvu6hsf0pRCUG1+r5Az4AnhyIcWeVoTj/lC+gxqXRh4qi2Bf3jygCxk/N/F+60qAdknElFcIL9ssnUsKqyUo4kLsiOV9v1upkfHkRWj0YmTiwqkb20G0HiTgaaAu+7Psv3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d586b968cfso99761085ab.1
        for <ntfs3@lists.linux.dev>; Tue, 22 Apr 2025 05:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325690; x=1745930490;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZI5pxYWXpM/1HCCzlo1oeF8evSj5UCtmrqzj7LHn6Y=;
        b=BfnDwjPlMgzALukSebGRo43kx9xdkR5eUKLXQVBsTHHbQdU5rLw92uVw7ydq76pVLk
         OfcHRPX4wELf7L7acfG8Hkqcwjwpxb9PeTfDGCC1FVohry/oKDEAUxhtTsgwiUu7OoFx
         d12UZVqJb9+42jg+p5l3Km7jtJ5lN6XXNxZTYpgaDmSWDqAhT8c/F9/xtorTiRyRcVeF
         Rz1DR2dDY9XuTao8kMR0yLKZQxvrbD1kdoB40gJIZ5UDxG6+X7fNyuc/lK5w63reVu+Z
         fHDzewdjl3h9AgZH5gWLOk3+GmsgM/sH30IsYQf/96AxoDk1S9YgWe7cyZ7OLvnKvfvM
         su4g==
X-Forwarded-Encrypted: i=1; AJvYcCXIBfFkuEt8xnfoLx1D0wY4ySO1iBJ+cAN5JSwP3kOs+VGT4L+nwObYGsg32j57Y23Lk4tTvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSDfQZQBEFfR6d2kCaWJ6JXdwsLhaSwwd4b6PupuwXke5ZNnVP
	fC7HX7GM97Ookk0LexsF1ObecVb5smRxT0PF5rPYDdVXFn44wjiPTfH5OvHI/SPE4+qi89hausU
	Oiy4VITVEMAfH/ioXRQs903fgRJxFDPlHilr5ZcJubVz4P4TVGkq3yYU=
X-Google-Smtp-Source: AGHT+IGQeXTcvVNqypgAVTTOcVPU7JX76uRLC4W40pLs31CrQCpqzglo4XBsKjHePz8m9OGgfcAZwl5iV+bM9aWNKZKUfG3okuwV
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4708:b0:3d8:1b25:cc3 with SMTP id
 e9e14a558f8ab-3d88eda88admr136644615ab.10.1745325689840; Tue, 22 Apr 2025
 05:41:29 -0700 (PDT)
Date: Tue, 22 Apr 2025 05:41:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68078e79.050a0220.8500a.0017.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Apr 2025)
From: syzbot <syzbot+list718ac120d53e1a745259@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 2 new issues were detected and 1 were fixed.
In total, 43 issues are still open and 64 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  18568   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  12842   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  5245    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<4>  4648    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  3934    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  2747    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<7>  2371    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<8>  2012    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<9>  1958    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<10> 417     Yes   possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
