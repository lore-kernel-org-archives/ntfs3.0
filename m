Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52939548F0
	for <ntfs3@lists.linux.dev>; Tue,  5 Mar 2024 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636966; cv=none; b=FK0xiOH6Nrhn/wo3NxYSDisJ4U9IZpq3995pxMzz+q9BwF3nSYH7WrZaAM3Wlt7oOR9QHPWvcSCTyDdox0huhHUKHhj85ENuopRrff6K//mTFii6884R8ah5+7UeTX52uEtifKGJTASbT1vPhEge7z7RgcX8Zb7+ZNo5MjT43sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636966; c=relaxed/simple;
	bh=YGFkNFR6BVT4HzZEwFfHVNLmz3rtTFWjnXbYP88kSxk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qgODXqfy8J+suO2oWbmrxnYG/C+4Hta+bFAOZGZE62KXzSYW/JsImTcpAc4byaEyrMDYLzv/XAzEvC6Rlh4E9GUIPXl/llG8eUbYdRhpDKUqcYVrtvG+Vj37W5J8xGL4A6boq7vQIcvLhlYdwnUoA+pV4DUkF9PRbETEMPu40bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c49d118546so438761739f.0
        for <ntfs3@lists.linux.dev>; Tue, 05 Mar 2024 03:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709636964; x=1710241764;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NINenztmi1JIDOL7+T+uX7S56DXuTaxMwu0U9sYeZh8=;
        b=a+H5Ipe3qqm37seRroaS7YFOWzXGraA4fgnBiyi1R3vaCsi5KqDVGkz0cP1d9DlYD0
         BS0t36U1Zp56+cUNKmQSpDWQdbb5PHcAY90idF3W3s66f/nJgI3eWGHsrfsre35TJ0HW
         +c4uvVPU9aoMxpkKt3jPd884kVP/Ue6XTVZyXhGnVimX1YLEilotgpBNMm9PgRVqv9hj
         FXl8lqGMxC6Ox03th6qgbQlWFDLpOKDlx8/cT76Ki12CFGWoDIG7jb7k2oQ+7oPwAw6t
         VDd9WMkj+Zisi71ScMtuJEpg7e5u96IcZyhHyDOxko9722zqKOY9e8eluojm8iu/AYy6
         UFIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgmcoQ2U+fM5MCEJZAtP2Ga3qjkM4HPaB2rD5b1oUgAuexnv28hYmpfsZrFHf/BIlutLtPlZFxHwgCkFYE+B/fRVtqavA=
X-Gm-Message-State: AOJu0Yy3CO8+wlR9E4T3niz9fPNOEUZ8ZNU2dj3hQcWzp2p3daAWNspV
	18+N99A9Dh0rilV1hCZ5vKmzPqgebLuEkfH3m/Z29IH+91u1bUVBedYgmbLYtNDedMhHRRs7fTF
	0HqMK0IyVMzqZokEOvKtc/XifpBqJgXJrpSsBhggONMsUkXnYZwjHMPE=
X-Google-Smtp-Source: AGHT+IE8tLV4V8t6SSMxemP9bmpaV+de9LW7kK6fYoUBrxgLrKYcz39WotJL8USLPdsfzWA0LRuRhuqaoYh+S/SiAs0RcNxheZBZ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:35a7:b0:474:d2f6:f0d1 with SMTP id
 v39-20020a05663835a700b00474d2f6f0d1mr71197jal.1.1709636964623; Tue, 05 Mar
 2024 03:09:24 -0800 (PST)
Date: Tue, 05 Mar 2024 03:09:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f8b0ab0612e7dffa@google.com>
Subject: [syzbot] Monthly ntfs3 report (Mar 2024)
From: syzbot <syzbot+list6abea8b8591745b4404a@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 1 new issues were detected and 0 were fixed.
In total, 47 issues are still open and 41 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  11885   Yes   VFS: Busy inodes after unmount (use-after-free)
                   https://syzkaller.appspot.com/bug?extid=0af00f6a2cba2058b5db
<2>  3848    Yes   kernel BUG at fs/ntfs/aops.c:LINE!
                   https://syzkaller.appspot.com/bug?extid=6a5a7672f663cce8b156
<3>  2589    Yes   possible deadlock in ni_fiemap
                   https://syzkaller.appspot.com/bug?extid=c300ab283ba3bc072439
<4>  2164    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  2136    Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<6>  1940    Yes   kernel BUG in __ntfs_grab_cache_pages
                   https://syzkaller.appspot.com/bug?extid=01b3ade7c86f7dd584d7
<7>  1785    Yes   possible deadlock in attr_data_get_block
                   https://syzkaller.appspot.com/bug?extid=36bb70085ef6edc2ebb9
<8>  1003    Yes   possible deadlock in mi_read
                   https://syzkaller.appspot.com/bug?extid=bc7ca0ae4591cb2550f9
<9>  672     Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<10> 645     Yes   possible deadlock in filemap_fault
                   https://syzkaller.appspot.com/bug?extid=7736960b837908f3a81d

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
