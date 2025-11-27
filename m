Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CE31A07C
	for <ntfs3@lists.linux.dev>; Thu, 27 Nov 2025 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229471; cv=none; b=SFJsnMl4E7LY7pop5M/6N4c1tckylniUBORIeFNp5UR7Y89pEUjFGqTwbPQBxx8PIHHn1dN/JhFJVMdHNnuJ/8B4DCRHdC27mP/HNx8VVKc5woPLA4n54nGHeEPN9lB8JvamIhRMJ9uRK5KWdnvGWQzC6QroARtiAV7EYnbnNto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229471; c=relaxed/simple;
	bh=P8sgxWJEoeimp+yooNzt5Cmk0ga1Xb4FpAgDXir6OpY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=I32Rda33xDSEapvNUm7jm++VvyyrM/v0NmHDg7ZG2HLyoA9QbQ4zy1xIP53Mn9ZQW/HHvmm2bo1Ob+77kmTnbbznQ4XQHq+Vptp0BdLaFEXCmqlQDUoN56wQSi++dl92llglMI3I3YhzrQmNf7GgEUCsbIHAJtQNgWrzHQqYXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-949026e871cso42642039f.1
        for <ntfs3@lists.linux.dev>; Wed, 26 Nov 2025 23:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229469; x=1764834269;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUjnGrylghAkdbGBeXf2liX9400ezVp/N/1peTBT+/0=;
        b=efYOHRO1TKgAaqvgXq3187PrTkOej8Lixgr1oHU+QcT3Pouny78gjiOb126VfrLm3u
         s8+35pDzrEKp2TIqU1zGwDgzlNC/VO3+XvrfxNgn31AoDncDs4PV1mh5xw9S3fzqbMAy
         JvhlqFDgFWQqPPwjAJmUpVaAKRvIDjRBQXjEwh5R6yynwVCMrbA0P9kuhGoyAn6x6low
         7WHPpt8kDsw+Tm6eSppf2ltT/w/ECG+7l9R/k+8lewWoS7+/CoxtmSeNDPjr+Q5k1cKQ
         a3WOi6hwrDpwg73GoxCNYllSV/veMfBQ7Ahqj5/NqorgG5jrOT7XjUWi3lNCvlYxJ4Od
         A3qg==
X-Forwarded-Encrypted: i=1; AJvYcCWXY8oHbLTgijazZc4EFt+YhnRhSZpYXY6H6/9//Gm0jtDVHtmWwo+FPrcIiszG/a6hf4a0vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzky0BLUkBpjtwpgyhtROamzZ9OrGesrAHBsxi7mlb8N0JQEJg6
	LFPLcRL8PMjyWs2HuIP04Jzb9cuzEBTr4csi3mMqENd/Zt5kkTXqgvx6qVki5v3XQteyiF8h4g2
	/3ANO7mrA/AyThhyNYgiFdTf5y1MVNtPOI4fcuOveGo6CrydU9ODl2b4Pl3I=
X-Google-Smtp-Source: AGHT+IG/Wnj1HOAPLtIuht680gEPJOJ/TMN7wK6hdjPkPuPr/uzT9OVzAcuXFmX8/va6QPeAYWm/YAWJvkurlglBpdzl8DH0T9Ox
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:280d:0:b0:433:4f43:2322 with SMTP id
 e9e14a558f8ab-435b8c181demr133643555ab.4.1764229469012; Wed, 26 Nov 2025
 23:44:29 -0800 (PST)
Date: Wed, 26 Nov 2025 23:44:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6928015c.a70a0220.d98e3.00f5.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Nov 2025)
From: syzbot <syzbot+list76209f953d5a6e865b37@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 3 new issues were detected and 0 were fixed.
In total, 26 issues are still open and 70 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  8369    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<2>  5226    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<3>  3778    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<4>  3438    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<5>  3182    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<6>  504     Yes   possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<7>  403     Yes   possible deadlock in mi_read (2)
                   https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
<8>  126     Yes   INFO: task hung in do_unlinkat (5)
                   https://syzkaller.appspot.com/bug?extid=08b113332e19a9378dd5
<9>  31      Yes   WARNING in ni_rename (2)
                   https://syzkaller.appspot.com/bug?extid=4d8e30dbafb5c1260479
<10> 15      Yes   WARNING in walk_component
                   https://syzkaller.appspot.com/bug?extid=eba014ac93ef29f83dc8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
