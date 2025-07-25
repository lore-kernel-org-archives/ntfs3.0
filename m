Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564172EBDC1
	for <ntfs3@lists.linux.dev>; Fri, 25 Jul 2025 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753447174; cv=none; b=fMBkHjK6/Vypcbyliw+76MIJxxApFsBw2HYhVlcDyWFoW6l6VGKHJzN1Ta6gHyzD+RQjKAH5KzwTyztdDsScWCEoeGGCF2T1Qmrq33geiugnjTKDT0mJSC2LiYH8JCnwjV/cYNsiiIxdmFB8IxwTOcWbTh+krZeXbW6xO77t4kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753447174; c=relaxed/simple;
	bh=pDbXLO9s1B26nuvXrdNGv7NEmVAQzgsCzx8/zI2EuY4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AAKab0+ThboGJpf8ByQmDm4z140nLgPzC4iQOr4/NhquZZnlA6XS+f1nQgqkCMsUbtcJ3tfsvOmFylywckIXEwQYBAhT8jLes+fyQ/5rv1MxoR4KgYs/UEoJUNGDeMxDGdwGZhV48I7XCq0ipMJllfHjXC+e4CiAIoUFxCWqEak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-87b89891d5dso356943539f.0
        for <ntfs3@lists.linux.dev>; Fri, 25 Jul 2025 05:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753447171; x=1754051971;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sa/HoxLzLJuDpA44YCodPaUbQNsjacjc1N01Ba02j7s=;
        b=PiGQdwk07/TOO4rOgKdWfTVviQjE1B8RJrmGafLplCg5nQKzn3cQZMDdwJXW7K0NpK
         6xhAx4QQPbqFRsq+T4QzYJgI0u6j9RpSV7P1vQBWyMSfQ1ucYaqc3x+/HPBp1ZFxUIGL
         esjKiJtec9Xf2/dk3X3ZTHoWcYdSTI9JqqMcFIp0xgTWNNL1H4TjoHF7ba0xS5lfAQ4p
         0hm4lU3m7eCKiy7SGpc50KVPv0k8QVETz++2KNxIFL0huXjBTy2QeVIl+eiG3L4WDIVC
         KfshuywprDax6hDTUBRjaRKGv69EsY4fgIBKdo76Y/CuiJipKb0pbJ+toNxyg9+Gkyzg
         0UiA==
X-Forwarded-Encrypted: i=1; AJvYcCV6WpJiQq9lBFiFaR7xk2FtkQEABGQrGaTvqyNI5of6quEMJ9NMwVDCjDOM3P+hJrW2qv58IA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxMGkxSkAHB9uj9cH42DDfFsAbt4Y46kbxreroQJ7WPESZYS3l
	6cpFPeJEtftALHMzqMDMIzZPmkqG6xwoAUJKvCtrozEtGrWx8c6izHhxysCEN04H7SAXKJR6Rb5
	zjUqpG/aSXrbqYZ4E/u26GsSFTJlN2GQTqJ3pfa6MEYbNRJIHWSkWQvS+KC4=
X-Google-Smtp-Source: AGHT+IHYEK4t6W6Z1UUdvddJPgXDuXoBZxCVRJOv06G6878vsmMs7JTE/MR5b5v7NlTxPz1DRqI2jJ4scAsJ96IQ/S5jqSH5+rqh
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c06:b0:869:d4de:f7 with SMTP id
 ca18e2360f4ac-880388fedfbmr242259339f.12.1753447171304; Fri, 25 Jul 2025
 05:39:31 -0700 (PDT)
Date: Fri, 25 Jul 2025 05:39:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68837b03.a00a0220.2f88df.0050.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Jul 2025)
From: syzbot <syzbot+listcde0fbb18221df5bd95c@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 1 new issues were detected and 0 were fixed.
In total, 36 issues are still open and 65 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  22703   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  15421   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  6258    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<4>  5558    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<5>  4823    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<6>  4651    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<7>  3603    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<8>  2818    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<9>  2524    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<10> 2522    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
