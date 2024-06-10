Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1780029
	for <ntfs3@lists.linux.dev>; Mon, 10 Jun 2024 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718023293; cv=none; b=VJpmIwi8Hdzvw7FzR5K5VbZapV+A1VFyLhce+bpxAiUbzeAZijViHTLF3L4STfVCI6q/ymoqpZase+S3m+qKGGEPOywCP1rUad/hBGniJQsMhRLQdWQVV8UHf6K104r4qFuIrpPmW8hSbcoOWxHEIsiERY9SGwPihvAug/Y6DHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718023293; c=relaxed/simple;
	bh=DA77A8YAHSe8JU7F+/GD/pa/ejxm7v+N5Nh/jow5Cgc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VfMEV4s4NXlRRhJ3T8jPpTNQll2DKLF3ZlIDuSMk5l/0sOdCoKtjf8mURDzzNET8guy+DuGfmDmFV8kybx1iPTM2M+mLlevH9p6x5U9/6b7VHhtJqf01mD6g8bhdUFjgycnSmMmeJiWOitoqWLRGFUm19nwwJRMqh2tirkYdfzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7e1fe2ba2e1so565273139f.3
        for <ntfs3@lists.linux.dev>; Mon, 10 Jun 2024 05:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718023291; x=1718628091;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BCMkQeD1xNxViM3XomxwPQ71fS171Gbimn0jnC4MuAw=;
        b=cfDavH+GoPs6t8RLJ0/bhgNNiY/0EFpWVxxxcG2H04fHSWXTRra5kyejyGHDqw5Sq8
         f1f8JJlrJWgZjCeHMJ2otC8kQXtzRgrO0ASMpMXMaPGEsJJ6bS2AP0QDMN5X/ZcinQLD
         RBtAMWW6MTOZm042cCwubTb3WTbOA5f6Xj1olVzDBcMCG8G16mU8td61RPta2DaaEWPk
         wcIqO9Fi1/Lf3OAYNh+Dvwc5pZi6hOoy5GsPw6qRzoaMrzdfN2U6l3IPFBDpD7QFdsa4
         xZad62e2zJUpihozA2PzbE9LOEheBCoQHcwTMdW5RpzGz0qFDiumy9BEEFH1niS3FBey
         uLKg==
X-Forwarded-Encrypted: i=1; AJvYcCUjMFakcUylYv2lA3n/Xn8zA8VNVlh1TwEF/aQSdt+1xvS7qxVazi35KwVvhH611CUaZVqXVtjE4mdyf2rYcAGEPyJXW+o=
X-Gm-Message-State: AOJu0Yz4b9m0lPlVfKdpWFnYgTG2hFFRkh9BB///yzHTZT2kTSMW+oqK
	6KofE+i7A5MTOU+sMZzRKTy0DKkM/NSdJwr1kAHTrE4plBNO8h+8mq5+ZzoLvK+qBodlIqAPVT4
	mCwF1A0Hty8/dvqKkHNCCtxDOtXgMm+JLtFuOEDe7xoydJALsrrFR1Rg=
X-Google-Smtp-Source: AGHT+IGrGjiNH+9FmfHarI8DR/5L8W/JwMgALZZAvpD6utcEzq31maichB4/VJ2EXCgaRrn9Sv2vvbVqiAOCEJlLvBchjDrISgYM
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2dd5:b0:7eb:75e9:8f42 with SMTP id
 ca18e2360f4ac-7eb75e992fcmr17530339f.3.1718023291583; Mon, 10 Jun 2024
 05:41:31 -0700 (PDT)
Date: Mon, 10 Jun 2024 05:41:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000002cc68061a8878e4@google.com>
Subject: [syzbot] Monthly ntfs3 report (Jun 2024)
From: syzbot <syzbot+list8fdb856cc132bfdfb91f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 4 new issues were detected and 0 were fixed.
In total, 38 issues are still open and 48 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  11937   Yes   VFS: Busy inodes after unmount (use-after-free)
                   https://syzkaller.appspot.com/bug?extid=0af00f6a2cba2058b5db
<2>  8302    Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  5508    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<4>  4666    Yes   possible deadlock in mi_read
                   https://syzkaller.appspot.com/bug?extid=bc7ca0ae4591cb2550f9
<5>  3679    Yes   possible deadlock in ni_fiemap
                   https://syzkaller.appspot.com/bug?extid=c300ab283ba3bc072439
<6>  3351    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<7>  2584    Yes   possible deadlock in attr_data_get_block
                   https://syzkaller.appspot.com/bug?extid=36bb70085ef6edc2ebb9
<8>  1679    Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<9>  807     Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<10> 397     Yes   possible deadlock in ntfs_set_state (2)
                   https://syzkaller.appspot.com/bug?extid=c2ada45c23d98d646118

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
