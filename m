Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3549423CE
	for <ntfs3@lists.linux.dev>; Sun, 16 Feb 2025 21:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739742801; cv=none; b=iypOcD6wirid85HkI+yF5nBO7VHY7P1hmRj1TlBEcqPzFEnHfG7D5AN6yvPYk4LjnaiRL17P9F3FmJFU1yWZRX9wlgHAZWZXHYaK8AZeXORZPBpvL6fpeeh+KTPcCX0jbnxnrvGU6QumoboSt1B3sIuPwbTerNPqtU4MYIcsBLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739742801; c=relaxed/simple;
	bh=uIhAZ4GX55IifAUO0HZ5YNZ4H95enbP3Ufo7EZSw4es=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gDLzl/gNL/uUTKmXLv+ltu9OGHjyUh+thLjVZ1yZrMGPIAB9FaKe2aKt6CNFePutH7razL4mkl0JLiBw7eFBd4xUsRgyxCo3WMNRgAYi4xJYVZ6t/cClN6b/cEckeNa3TfNKWiaJqLZL/bi6a5Dg/y9wod/kpok/p+nG1k6Ai+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3cfba354f79so77950565ab.1
        for <ntfs3@lists.linux.dev>; Sun, 16 Feb 2025 13:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739742799; x=1740347599;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zvzlh8rBNfRkvNnq76a9cHlXie97oPHR6kXBR2RdZMs=;
        b=A0dDc7ZQYOboXNz/R5N2MsKF1e/AZ1NnS4U2Dumghg4W01rHzmQoXk3/aq+l4rSi1B
         bZpIRfdz9PG2gLbEa+YFmsQEwjIYLpkmEo6rAjdBj97dpdPWjobCU1pC7w+Yd9CjWV2P
         qpbvjzC9V+B6OA4UoLPguBoz5H5npTdc4gvJayXfF9ttm9pFofCDwwy5wPtfx5wQbSlC
         64spt9VqyS/gUQelA17ZeXAJEtCM3Yu0keirQA/uSVvNmSKZjBHVz8ng5OB+T34xv4Mz
         UJvuomZ5OB1blzG4Qk+T8DED+IBXHdfH+DlimU4ogJYtyddiTwUryP2l942NNwPA9y1t
         iSCA==
X-Forwarded-Encrypted: i=1; AJvYcCWVLgcu5GFkkteUzwLl46uWuyH6oG95iv9Zvab0ahnQAMjIo1x6Asf7EFUxdpvR7xUQMHEkXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMokvfkY3dtjM8HxUvjE+ktKXS1fdAXZX77VXPkcJ81ixkaC/5
	twOH5amqtndhCOTulIQk9EkmqKNE+wlQNciAzSq1m6Tq7QEw2ArWuVbOdWFxrmYG/LN7GD5z+pA
	QuTZnZDAhvwnc6PsMzTJuGhGnKb1oRxLcLtGjiNcd1Os2O4eRbPZaGuI=
X-Google-Smtp-Source: AGHT+IHQmuM6vRequHdbUhqRX+tGP+7f81E5WepbRoXVBH+w2f7nnCdNHCePw7gGOXimpBVEvfG1ToF80Rww+3tNEuB8fyEtlChX
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184d:b0:3cf:bb3e:884c with SMTP id
 e9e14a558f8ab-3d280940c90mr60134545ab.16.1739742799361; Sun, 16 Feb 2025
 13:53:19 -0800 (PST)
Date: Sun, 16 Feb 2025 13:53:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67b25e4f.050a0220.173698.0015.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Feb 2025)
From: syzbot <syzbot+list540750168bf76ebe43cf@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 2 new issues were detected and 0 were fixed.
In total, 43 issues are still open and 61 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  16240   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  5550    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<3>  4557    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<4>  4395    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  3718    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  2302    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<7>  1999    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<8>  1782    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<9>  1717    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<10> 399     Yes   possible deadlock in ntfs_fallocate
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
