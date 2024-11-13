Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDB01FEFA0
	for <ntfs3@lists.linux.dev>; Wed, 13 Nov 2024 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496046; cv=none; b=I9KvZkF8VEI0ULi6IDB1OcHaUDHceMM+cj5Fqk2rugqvpk6YcITfmgxRzSJeT4p9Gn6MkP0HPeTkz/JhIj/TVoq2k2zL0CRNSMJHC2QSTr+YnhzStS18EbJuvukKiccIF0UvIKKxFjtdcCx9JyP22bu6vmpeAE4j281PkuNQL70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496046; c=relaxed/simple;
	bh=SjEdKI+Kf2R/D5KyAWV7tYeKtJYT89P1xDRnIawO9Z4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GrDHKtTSzXFTz2pRadxVrcIa6bFx+8GoN3T0H/NX7FZ8/6c0CSuCU5HU+GHKW+ciNzsYL1XLnGXvrpL3BhWrartGY6VwtfEeylMjwnmvVWRFbA+yOdSCvOcq9eUe7wGqgoPukqbphU63zbcHqZvafZ9E4RhUGvxSrjNe9fEzjbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a715ac91f6so7939275ab.2
        for <ntfs3@lists.linux.dev>; Wed, 13 Nov 2024 03:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731496044; x=1732100844;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ia67arJPZRlvAYh7PoL/9fY5Xwvq773i9uIxPQF94OA=;
        b=n/jNtlN/6mHLAV2zWSMjvadzFst3OD/uZRSisBhUOXbkIHNe5AkNbfSN7aNM//pK7l
         GfB6SXti3dt/OEhpBvA2GyxWSRxXHB0qLB7cMHIAWG8OBwkLz5KBwDT51e4u3pVIFkqH
         +jE3EkS/fOe5nsZJVi4A2snyKYIBgFXfsK16einy7qIlR6pKxcvhcChRCMxXiOi5EsVM
         YP5fLJcCZlkXcUmzb4fr3y0zBWWVOH7AtsMpQHQyltpaSNy3MmKFrhRem5qJK5y3F9dN
         scsDe2VpN1ki63dFz2Xp1sqTzde7QATOV9UkIp2/qmGM/+awMWn30paLagFOQjwvNz3A
         7qIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD8/tbykwepE+iTHB4r1sR9l9O/OA2wh7iCQYnXt9KKfnM3gLv9sN1TkazIXY4ULoUbsB4cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZkVs/peSu8s0+b0xOCqxykLHumGyNqzNbVcFQXX2XMIT6oqSV
	qOEfSnciqu5P3osizv4SKbkCVjcuN6XjC1mqNGu2IuEqVjcESa/ke0zunEKJ1Qo00cNO5i5AyY9
	OgKXQ2sOzLK3uylAKnz0aAxllCC4BcfQjN7N47M1dqorUcm+D4/UqLBQ=
X-Google-Smtp-Source: AGHT+IHb1qQ281rd8LQ1YRUaOEUlsWojI7DHK9jf4xZnGydMEjXlCKwBSxGrPBN9YWVUkVgPxVqZrerO9cmUFkgZ2Vdbf0Z6JEp7
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:388d:b0:3a6:aee2:1696 with SMTP id
 e9e14a558f8ab-3a71578db17mr25270845ab.21.1731496043969; Wed, 13 Nov 2024
 03:07:23 -0800 (PST)
Date: Wed, 13 Nov 2024 03:07:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6734886b.050a0220.2a2fcc.0009.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Nov 2024)
From: syzbot <syzbot+liste07f67aea454cc1bcc00@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 5 new issues were detected and 0 were fixed.
In total, 41 issues are still open and 57 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  14466   Yes   kernel BUG in zero_user_segments
                   https://syzkaller.appspot.com/bug?extid=78eeb671facb19832e95
<2>  10502   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<3>  9346    Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<4>  5539    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<5>  3780    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<6>  2983    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<7>  1538    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<8>  1302    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<9>  529     Yes   kernel BUG in ntfs_extend_initialized_size
                   https://syzkaller.appspot.com/bug?extid=39385e8595a092bae44b
<10> 313     Yes   possible deadlock in ntfs_fallocate
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
