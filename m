Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E113C691
	for <ntfs3@lists.linux.dev>; Tue, 13 Aug 2024 08:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539263; cv=none; b=RBdKHVR+USrmGQkcjoPIQwRpD1jOjM5plRrg/UQ6aH/Lvjkm4a9/P6eEeuRfY/nV02UEdnDHIQ7D0ECdeX0v/KfoSjtF1tb5CHsA24pkyWLuTS8ASYqExtpEcG/HWZBZpc1Sztp76ULI5vzXgOfynaCkVnqSyvwaz4YRKmj7RyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539263; c=relaxed/simple;
	bh=ntZ7ki0U1JQBEN7NPjGQxQxlm5nJEP56fPEYesiwwHA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=E5tJhlsPIPhHVykzmllyIPp0FnrzDxIXS+d0TH4AbSu8OGNrYndalAYJNCXVNj2YxNDtGuN6dQ+MNwbeBJf8ZMFIRT8CLWNmqhjyhCQ5BNsp1F2BxM8tzzX8dk11bZS/dd5V+xDpRCKBkCe1Nky4e31ZZjqaI1W3g8AyItERn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-39b3b3c74d9so63262615ab.0
        for <ntfs3@lists.linux.dev>; Tue, 13 Aug 2024 01:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723539261; x=1724144061;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzyHOexbn1EOtAlkf/o3rEeXCw0wodCIeE0tcNgnlUY=;
        b=i2iGVpbZvT1lmjPorUrulYOXKOEa+7s33OgeEli+GQ/IVPlj258kIs27AsvGXb+wZI
         n7rne7xQPykKXKG5dKO6wQcUPifRjjqBJ0tKPvIEjBtmt44YgxZHpXuYHRE9LXIDIEod
         vH7Ubf1wsPHR1HMVPa/DJGfobjSXWq7O9QTnk2c/Lwfo+YHKL8hXpyQ9bOykUVazhEwP
         HffWf1p8xZtmfhwlOdFq39sVGcmwoePQj7rEPmEpgwbH+7z5dVpjs5V6RLu9ZQkwW/Rs
         CUifxgJepjUs5D4SI+XYeqBqZd9NcQTyp4y3m+V23+AlZUDO5xpvss3+0kx4YsXBXd6j
         6X4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFrkejeU/rlAl9DtyexlXRS/4s4uVcHc24gP+ettgDi2OJfONr0EOBUOEwsGMBY1OvwJcdnWd1416eb7pvcmwF2Wa6Wac=
X-Gm-Message-State: AOJu0YzRQ0ZD+6d+qwSUSIBk8nnCPUxdfkMBD1aczEbxZyxxI8aOYpRQ
	zjbc4PBMItmMZv2DrIWG5um3wkXA2IA5GnZJsQjjZe/GgDjuew5t6fhYOgclCxYtM2uXaX3P8/A
	i9lTWVOpSiPWIYSeHIMmdtiQBcuEX3CNgKYlB0bt9gTDRmDNmEztZ8Hs=
X-Google-Smtp-Source: AGHT+IFyD5ghMIF2yVYmDj4jmGrhKlOUGR5SCL1/c/RG69lsGjVTh4cPc6DoXLedZjqI+rlUryuEEKeuJdOFW+o2FPuTcFwKnd4s
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18ca:b0:39a:e909:29f6 with SMTP id
 e9e14a558f8ab-39c476a3da8mr1933285ab.0.1723539261310; Tue, 13 Aug 2024
 01:54:21 -0700 (PDT)
Date: Tue, 13 Aug 2024 01:54:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006d54eb061f8cc12a@google.com>
Subject: [syzbot] Monthly ntfs3 report (Aug 2024)
From: syzbot <syzbot+listebf691b208eb1cd7d80e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 1 new issues were detected and 0 were fixed.
In total, 35 issues are still open and 49 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  11997   Yes   VFS: Busy inodes after unmount (use-after-free)
                   https://syzkaller.appspot.com/bug?extid=0af00f6a2cba2058b5db
<2>  6681    Yes   possible deadlock in mi_read
                   https://syzkaller.appspot.com/bug?extid=bc7ca0ae4591cb2550f9
<3>  5512    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<4>  4793    Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<5>  4007    Yes   possible deadlock in ni_fiemap
                   https://syzkaller.appspot.com/bug?extid=c300ab283ba3bc072439
<6>  3561    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<7>  1198    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<8>  636     Yes   possible deadlock in ntfs_set_state (2)
                   https://syzkaller.appspot.com/bug?extid=c2ada45c23d98d646118
<9>  338     Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<10> 112     No    possible deadlock in ntfs_fallocate
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
