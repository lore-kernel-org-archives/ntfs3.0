Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A6E20AF87
	for <ntfs3@lists.linux.dev>; Wed, 15 Jan 2025 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931263; cv=none; b=puynnvYc1NaabqcD7iW4S9kNYGNQytSN6KvGDRu6N7h/m6gqQBKvWEk3YrY/J37mNuDbpvohZaWWEa0qjJjAOfECL3RnWprDqPH4Kl+6btk0390AcbE7AFz5mWrWnxEEJ+c6IFlqUQxtHroPgKdHd32zioOuDi5yw9AeOgqUfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931263; c=relaxed/simple;
	bh=3my8WlSTxgmUZvfHgMokHSCfnV1fkBiT7GL2IrUTO9k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hdaiLJymOKtj7syk1GYB2jLWybO0dOWP8hsTV4WtFl9hc/dbsGNhBXbVVny3x1at5TjecbYMrU1gnYOeaxdG7fUvzqQKuhoIvCwl+yuTXlg1ft+nzosDitKWcGK1Z8hdgg0GDwVVlEhFDa7KDNZvbG7SLysL0PNNteImU6vaYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a819a4e83dso59734205ab.1
        for <ntfs3@lists.linux.dev>; Wed, 15 Jan 2025 00:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736931261; x=1737536061;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TVgUlXnalTQCTXS6c/APCnKXQMTQCdJ982y4ugg7Lxo=;
        b=kURw4HvN1/erGtpl30HT3gzPZGJAO+y79aeq+fryMIs1MjB8AQeEHQVW97vDrikStG
         S/66gUZZoYn0plGqE5oLsV0dwCPPMQxqExuYFdiYRFQPMB08mLdi3uc4a7NZJJu72fP6
         6WV/oc1YVdBFVcgvUNQGFh/JHXwlLKgvirtVcoOuPJz3Xs8nMgtnmUChquRgbn50WvbS
         hS/Hcj+Ci9DP5xqGObksg6wDg8ULsRUEWP+9OLOzNAz+4KngdCcsbovbjlrcSRXVSEMY
         POyJ7VOen6L4kRbK9gvjGaLBeX1Yo8dEuLP2Sf+0jAUwjvA7EAT0lRHBiUXE7YuluNEb
         DUHw==
X-Forwarded-Encrypted: i=1; AJvYcCX7yiKU3M/BBIvdCMx8LFpoSS5qgwoWoUrwqKPWD4McX3MnY9GtPbEz0E19oYB9siI/2pybww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuuOU31u9ZxlYAjSibvuNohBb1kbaaaanmD2b8ouBuV5lL6NJ6
	sw3CNV/Nt3WA4z5qmEjOasQoMQQKa6vEtcxqiVAOrTYEyWioNXsJTOxVif8n8Bz+QmJBRKb29FQ
	zJBuFgIZyDPHCBkmpqvZLYjyUgw7Iv+w85chIdMR4Z/rWOx2/UulebF0=
X-Google-Smtp-Source: AGHT+IHZK9Kn1CogS5FAr/IkVybeO4OfBgV7ejS3ApQE9LW8w/ClO8Dawv8b1OBByStbuOWP+Wbux9vLfaYPf0DYkSrOqWmxSUMO
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1524:b0:3ce:7cca:db1b with SMTP id
 e9e14a558f8ab-3ce7ccadb8cmr47718265ab.12.1736931260847; Wed, 15 Jan 2025
 00:54:20 -0800 (PST)
Date: Wed, 15 Jan 2025 00:54:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <678777bc.050a0220.20d369.000a.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Jan 2025)
From: syzbot <syzbot+list0205393c911028101569@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 3 new issues were detected and 0 were fixed.
In total, 46 issues are still open and 60 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  14384   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  10520   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  4129    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<4>  3787    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<5>  3603    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  2071    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<7>  1711    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<8>  1662    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<9>  1412    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<10> 389     Yes   possible deadlock in ntfs_fallocate
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
