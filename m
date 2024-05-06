Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567D7640E
	for <ntfs3@lists.linux.dev>; Mon,  6 May 2024 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715001515; cv=none; b=hMPZzjxlF5qhzokXCrAbnGYAwLnbxXxTf2Bm8YD6t8Eb+UIXCSWCy0ZPs4qlEF6T26q68HObaWl6GAkSvvz0bKupxL9FYYwe9k6tx6f6RD51j9BJ+0XSaU9zOKPhIJ945HGvBov3OCYAu5svHVokIAj/aCMNRE3zPPJuCPo5zOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715001515; c=relaxed/simple;
	bh=V/up/2lYtF398jVbxFQpvlOQdOIQO1W2NMWn/hoN80Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=blyxxoNKDryTDp/a3L57ryPCe0ozDH2Kki87o7m1ssARMcvJ5TxHeRqwcrEDKAs5Uech6Vdfv8wcfQNg9Af3G+RpfKBaM9klm/y9oEM/uo4YAHl11EcaJOJoy2UdXtWeXeDJks4hdcDo7BZ46mduMyrwcskeeq3hxHAdMpiYgKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7dec4e29827so213735539f.2
        for <ntfs3@lists.linux.dev>; Mon, 06 May 2024 06:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715001513; x=1715606313;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcwKLWuIXegQ7OmHl8ESKsXo8407Y2njqb3uaJ2tHCE=;
        b=empdGG4lw3iQAJUxrjRL0CifFXkUkA4IioITsXTOv2x4MjiQpDWhQW0Jpe60A19k4s
         /FmttZ4owu15wzVtu78FK/ajA0cepH/UpOwlftxPJQnm6+59r695TrFHjdDgEzFAgzmh
         I44R5/PEtBHky5S4k9jRd62rHlWikWivpmhYoIjialEuIYGNHJz+jn7pXmo0r+PkRdsu
         ADWvHoTGzO6kC82A/CFW1entZnH/SXjnQEl59p5xvPwpEeCj2uwlsjAsfISwaPMODlAe
         Dwr8OHj36SpvydLHW0yh3MrDXQLbfp24rNi8J2ffBVmInFXijE3MygRS60a/MnihT7sS
         DvGg==
X-Forwarded-Encrypted: i=1; AJvYcCXKa40Idi2NnFNwbmDFYS7Pu40+tpFScnB8rNVNYPg7l4BwRoLg4Ll5Ms2slFM3Q1ik4AeBQ7mJz+sUJ1VOim/kpyklzgM=
X-Gm-Message-State: AOJu0YylSwGrGMBD/GT4SeKq7F4dBiw1kU4iYAmeuR5AJvIZpmG0D5ZM
	MVTsOPr7xgdkhDcsDi3GBRlFmacgbo2ulJfcsB1B46VO1XhkVPOqBa4Tq0lWIzpuSuc4+f7/i7F
	XJokved2g2cklKRA2BEgi+9157owjC11OLA4OHvO9PdwnutnZZsWaXFk=
X-Google-Smtp-Source: AGHT+IEy2h9Lv/3WyA81977yE/QNPlDFgusZ7+onp68DOwCdTvOR+oQtdUkse+NjyOVDBoqsrIzTSZb3JP8nVs5cajVEaMZcbctg
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2489:b0:488:75e3:f3ce with SMTP id
 x9-20020a056638248900b0048875e3f3cemr296968jat.0.1715001513464; Mon, 06 May
 2024 06:18:33 -0700 (PDT)
Date: Mon, 06 May 2024 06:18:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ffdf280617c8e726@google.com>
Subject: [syzbot] Monthly ntfs3 report (May 2024)
From: syzbot <syzbot+list0a6d53d08fa90971e6a1@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 7 new issues were detected and 0 were fixed.
In total, 38 issues are still open and 48 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  11902   Yes   VFS: Busy inodes after unmount (use-after-free)
                   https://syzkaller.appspot.com/bug?extid=0af00f6a2cba2058b5db
<2>  5503    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<3>  4669    Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<4>  3286    Yes   possible deadlock in mi_read
                   https://syzkaller.appspot.com/bug?extid=bc7ca0ae4591cb2550f9
<5>  3080    Yes   possible deadlock in ni_fiemap
                   https://syzkaller.appspot.com/bug?extid=c300ab283ba3bc072439
<6>  2684    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<7>  2085    Yes   possible deadlock in attr_data_get_block
                   https://syzkaller.appspot.com/bug?extid=36bb70085ef6edc2ebb9
<8>  729     Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<9>  723     Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<10> 141     Yes   possible deadlock in ntfs_set_state (2)
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
