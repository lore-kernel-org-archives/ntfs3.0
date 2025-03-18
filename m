Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17372080E4
	for <ntfs3@lists.linux.dev>; Tue, 18 Mar 2025 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309397; cv=none; b=CBTnGgtQ4aKnVtGyQJaW0Tc/XNyaVLwyfzv9oZi7oQ0mU0tfq0I5nqrO1tNkynmG4U+lE0cKBC45V7HfFuZX3v0mKIeQoCEee2XKrW6Jow8OVjhVF0E8tfgNJ5Y5hOuZQ3ofuDuWrndw4dyLf7hPTTVrpI+3KM26f55JUDj8Z1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309397; c=relaxed/simple;
	bh=4HtMV/Abc0l4P38k6TkSYoPMbclObapgbZrVii3uVPE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FbkXkc7Z4pQsQVtIVdjY7y36ipWPaIvY+1f1m6QRtIrZkHFLIrPB7LHgAW8a19AZYuK3P7mphpyHHv3SzpSm0cJntW6TcUX6KCXPr9LBneWrlse8JLI68mlMTinFsitTa114IA36IfiH4m7+uB1H+V9weWTO/uUP43eyiz/iOXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43b460970so119182705ab.2
        for <ntfs3@lists.linux.dev>; Tue, 18 Mar 2025 07:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309391; x=1742914191;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8L6xlE9FVOcOjJswkbLW3hrSG76u5OhzMVCEfCA8yU=;
        b=qCH05m8SsiQT9WwOBtdJn7hvvojKBrOLQGfMPGKGv3bCx0ykRwENQxU4par4AhpOqA
         FRERFLJ3z3mGw+TH1bsjr8jwdtq++22gyzsgk16QC/KxK/z+GO375HN5hyYUa4GT/0TM
         5Ii6+5ih4mr+Xv4Ig0otGMn5axdrDNfaUNTfqn0joON05YwzaNbKgux/h9Ic1T0RPVSA
         qdB7tulk58ZWJuwaatSpSoem//fNI9sTJaMwZRt1C7jTweE21SOwKM3DEgZiE3yK5CLa
         /cjH4YqnvnZgkV6IKTn8qo8BGHCN7hkIH862W+PLnRG+99zTcDWpxAE8yQOqmWVONCBx
         tcSA==
X-Forwarded-Encrypted: i=1; AJvYcCXyINhpYhcyrRZU0u4wB/72F6ta0V3iD8EL+ZTrKzTewFHhdCEtRCeOdPoYvLtwPNsbUDLGtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwK90De0UbzWt3FputfQlSE884tEBkRJCHH9FEtnq3YicWtuqkf
	pOUCS1q80Zj2cLhxiCiYEufrZzAgUNStmDFwxvUQNk8pZrulQhel/WFLHIZRWth7A/rm4riDtek
	UrVnIu2BS77p8ZTcQa1S56O07NjepjlJsHdKLH4C8U/SVPKTArODaoc8=
X-Google-Smtp-Source: AGHT+IHq5u09TGzljtWLDoo4CLXQeO+jsV2L0c/HFLP4t10LhYfS7ZiHcjWO4IDf7rkgNJfjwMpwO4OcIr8QisP5HXG/thUZVYDr
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156d:b0:3d1:7835:1031 with SMTP id
 e9e14a558f8ab-3d483a1825amr172905725ab.7.1742309376538; Tue, 18 Mar 2025
 07:49:36 -0700 (PDT)
Date: Tue, 18 Mar 2025 07:49:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67d98800.050a0220.2ca2c6.018a.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Mar 2025)
From: syzbot <syzbot+list66953ed1adbd749afd25@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 3 new issues were detected and 0 were fixed.
In total, 41 issues are still open and 61 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  17765   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  11938   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  4927    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<4>  4531    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  3813    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  2519    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<7>  2205    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<8>  1870    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<9>  1850    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<10> 407     Yes   possible deadlock in ntfs_fallocate
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
