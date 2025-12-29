Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B36238C1B
	for <ntfs3@lists.linux.dev>; Mon, 29 Dec 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766995884; cv=none; b=VlvZx8FB60SD+NB9+eNNgTaSi4z6+FEITAq2Z9zQ5AhDAGqDCVHd66uI6Yr5XICwgV8BbgTrOggZUwHjvozL65+s3V1Ij93KCzqslpolr1J1k46GL7JMMPOrSKG6bNnhAFmRi2YtWfKnlrxzHZFk7bXxHRbuiX28N9TFXrEHctM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766995884; c=relaxed/simple;
	bh=063dUptcDxQbArr4zPwTVjTjKa2jyhOamrOLFZyQKOU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=d627oevHV0PPDdOFAxoH0iZgsFWnpjS4H/Ht5rizjkIm5Fhz0SLYroSn5/CbLW12s6rub5bA2jiQlc4xEf/g0E3sPUQiFNWyZ3sjahiP4Pd46XwJVMNMDTHMf0K75kLnxX971IY9Rp8f3ue04Ykzxn1DSsUBoTY6ZBwKSfRqw9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c705ffd76fso10216197a34.3
        for <ntfs3@lists.linux.dev>; Mon, 29 Dec 2025 00:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766995882; x=1767600682;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKzKeLK+ZicVVZfQETdO8/QeJ1600PSojCROCKq/rYQ=;
        b=G4iUruCrt7fLl73Z8lnv/24VKBUrrZ1aKbOV5Vwm+s+22ROeAbJBGLt8IqpeMwMLTx
         WmdabU/nm6yfl5nLrZ8/p4DAjovgaWmN0h1G710obkMFRn1rO1NBVg7X6WBmWUv3Irxu
         xzfb/rM3zyQSEwhZ7EgaEcO48v5hyNLgGikQb00mGYDHrncrZIOIBVjJWr5Hnjd+66M8
         K72f0RnhoQ6kAeR6RxkItbxBA5eT+B4O0A/qqjn0Lmee0QFtnIC1LouqOkLWf/f/+yK4
         CaS1MCAyngjS+c9z0la77u8/uBD2KSL7fe9uezWGtiJmVRV3nxzC/5V+1Gx/WOFINbpK
         +yjw==
X-Forwarded-Encrypted: i=1; AJvYcCXKhSisG0DOWkzmkNAUFVPQduUP0Z9D1fbP1SR/UjEaumvHzOaucrO7MxExvOcwM9O0oKSYjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTa8uF0RCAaAAtjafLsT7A7zgVTk3seZMcEL4NjWj0Nt8THoDj
	Ac5FI1DXthQus4HpEnLW5BK6/GWg3SngXrXJ1g4T6LYihh/XNpMthfjPY0nbB3J3246JD6oiguj
	Q8j5nWiYQ2iDpYT3HygruXG/O842H/QjUdbRXpWeDsD5gGYNoF5eYeqBbd3Q=
X-Google-Smtp-Source: AGHT+IF7lhgraIEZne1R07aHDNiashgUX3OLKnLVOYNWqiOXUViqaulI2cy9J+869DjhJFfG+OsmvSe2oBaneMtwEF4i3nfPHVMw
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca9:b0:659:9a49:8deb with SMTP id
 006d021491bc7-65d0eb1f7demr14140369eaf.45.1766995881818; Mon, 29 Dec 2025
 00:11:21 -0800 (PST)
Date: Mon, 29 Dec 2025 00:11:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695237a9.a70a0220.c527.001d.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Dec 2025)
From: syzbot <syzbot+list59be5123a1c329b3c5e0@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 3 new issues were detected and 0 were fixed.
In total, 28 issues are still open and 74 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  22243   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<2>  8893    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<3>  5565    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<4>  5410    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<5>  3847    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<6>  3394    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<7>  512     Yes   possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<8>  407     Yes   possible deadlock in mi_read (2)
                   https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
<9>  129     Yes   INFO: task hung in do_unlinkat (5)
                   https://syzkaller.appspot.com/bug?extid=08b113332e19a9378dd5
<10> 122     Yes   memory leak in ntfs_init_fs_context (2)
                   https://syzkaller.appspot.com/bug?extid=23aee7afc440fe803545

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
