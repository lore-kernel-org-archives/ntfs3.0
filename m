Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D42ED164
	for <ntfs3@lists.linux.dev>; Mon, 27 Oct 2025 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554543; cv=none; b=erf8lfNS1KnGQ0aMrUCOYCZufbXT49r8QiwicCFFOiLq024Dv1agjSMPrs9Ybt0mZ83n0wKydbdI6CIpGw2kb+W7NuTbJP1xwaczuppRxybKj07UmV4vL3FwP/UfihQPGGj87c8nN6u9WtI2u6yS2rmnnUoW/6cUeRUffGJ/2YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554543; c=relaxed/simple;
	bh=hnlLRcV8zn3MJM2yQhRmnXTcVYj2iqM+bgJVAjxQtm0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cQqCuCincyKf045bTK1Djm93ZYY0GLuFBP04DaXU8HsewwZdagF3fHc7XfjAe/kQ2QTZp85Y/qssSK4jS0G6GDZDXsiUSQJCjHGgGI5RCk+7kC6cZvWuEPEFQPGeu6z8D08hYq98vD0uWqUB5UZZqReo3Ppv0lRfXaVdg6RQbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-9374627bb7eso641563839f.1
        for <ntfs3@lists.linux.dev>; Mon, 27 Oct 2025 01:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554541; x=1762159341;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QBqeIwOciaTmXKoZIhci2rtjD+K88Ea+ckvbwYoOuU=;
        b=cRRHals+UTf8lA/oymO0Zs/YWRa0cUf3YdTfdAa1F+U9AJJ0YPa3R+dqzME2gGAo9y
         dJe28U95vTvLm/+0dFCbKlJ/WJObpfBB29SF3CIO3Gc/HJ01W2bhxCSLAMLSjHeETgZu
         qrrWb0BvAffvdMOKGoZENtcDaOKs249375BWaTzMk3DG+UtzEaV4hDUGWP5XW6dq8pt/
         QNnwOAwHvfPseY8SNUqYDFlqTKNtTJvidaVn97W2s2BnPDskrphL4LV30KLQ73xxPkLL
         WICzoamkoIVoNIYqhDesVgH8Plr1wZk3mJ+YzfWcbyL+rKV+KiyEZamPcTSQCnG9RmtT
         uvQw==
X-Forwarded-Encrypted: i=1; AJvYcCX6xHXVQvj66SHWYNPlcK/FTENmmNl2Iea5DXIM3c5ZdAbWzOZBNO+jKwioj7oLi2qezvcC3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvEiFId0aIoqXIVSIwf0Bw3aYZjGaLTAtAmHvwoIrh6evdESYo
	OX07V1ThZN/Q82OaPdNvUjLMDCFAWlwv6/t/BvXjLy2LZw51cxBHovmM4jzTeDKoHuiX2T0OqAS
	KTw6AL91gUDdvhTbtn4GIr6DPOR0xgRihXBwLu4l+fBzFw0MT3EzgQDEkvTQ=
X-Google-Smtp-Source: AGHT+IHuDkYOQ/FNaVGfp1mI13EztKQGqIFfCUpYQu1XTw5g4VXS4sBo5lLIUmoxmiVDtdogHimrS0mAP7Yy5u0bHCL5lx/W+Uo4
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c95:b0:945:a834:5951 with SMTP id
 ca18e2360f4ac-945a8346334mr425689639f.6.1761554541318; Mon, 27 Oct 2025
 01:42:21 -0700 (PDT)
Date: Mon, 27 Oct 2025 01:42:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ff306d.050a0220.32483.0013.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Oct 2025)
From: syzbot <syzbot+list0bca5cd9894f3ce13802@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 3 new issues were detected and 0 were fixed.
In total, 40 issues are still open and 70 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  19521   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<2>  7872    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<3>  5563    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<4>  5086    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<5>  3590    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<6>  3255    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<7>  2983    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<8>  499     Yes   possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<9>  380     Yes   possible deadlock in mi_read (2)
                   https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
<10> 193     Yes   KMSAN: uninit-value in ntfs_read_bh
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
