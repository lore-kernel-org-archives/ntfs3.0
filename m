Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681912561C2
	for <ntfs3@lists.linux.dev>; Tue, 24 Jun 2025 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750710; cv=none; b=HpwVBxR3RSfUio4GksXdvM1yOMMvdm0aGDq7m1E+F5IbNfZftIIWDlfPcKnCRonN4mNoKGZgf7q402+PctQUsZa2bEhaEU2S23O+hCfipa+ar8u4obh23PpWwY7gDSaG4zOg7eEE5tXnp6w6zKGay5WKGjhUrBW+ueohggaE1bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750710; c=relaxed/simple;
	bh=QRt2kMUKKo3WovmnyygE/uZNFYNYksTMY81fyx21Aw8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QBFdwBlxOM+8S0+Jx0rr3MGG8HFAV34eZuIu/v93cDFOZhPhqY1EpvJC8QqZofJL15nmtUqXbOtwfYuAjf/UV0qHEZBJj30gf53pQEiLqzKVNvb9QnYMtX40NzpVNbhp+B47t8KCplhVcJGMdiuf7qVkrls2uR2T4zMaAa/3n6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc5137992so61336005ab.2
        for <ntfs3@lists.linux.dev>; Tue, 24 Jun 2025 00:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750707; x=1751355507;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y963xLNbVywdgMorz82t4MiEiMYWjkE7nnRGkYos37s=;
        b=MsxEPChW8+b1sz47YgNsBu7OjPDjh6Em+gq5pVGRkfn5DBA3TtSQnx3PUFJVZQwaZF
         2dk5Wtz5aVM5zgBP82NOlXPrJYFUHVQIeEEN9p2ldB3/noX54RZL3cA4WVP2zhh6P9/j
         1Xn8VueFz8Hz6KDyUrQmv5DPoOdWgI0p+gGYKmIZGBoespwYgJVKduOMDqbQrx7U3qvC
         ItdKpWbx55j6ASLTc/3zY+0wXPSiRk0sf81/L1Rt4Nw24Vpu0x+FkccRJc96rOUs3auQ
         57RAe5YXy6dxfxi7d7v7sj/Xj26stOsAaZ5dE8XuniWJ3faAfCZuN8xV0+Nnz40vKm7q
         PF7A==
X-Forwarded-Encrypted: i=1; AJvYcCUaNYezw9mMM34LrixMW9c0Nu4dR5iUEJ20zg262XsPu7k9S/D+EPO80zN4zAK5o+vg4AMcfg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx82DIhRTzV+cc8M/slmmNLuPVimHk8Lp9D2b7WvDHuGFT/idw+
	zeMYqYekzIyNkubzKTnyoiV20/JU9ecGrttrOHkyNe6bdBZKlAil68LpqtPLwOVLGaGkCZgeCi2
	3YWRNyOj7OrFQZU34kpcFxyetmUYG6dfVKsUBhyODEshJmqfV/aqew5eyKK8=
X-Google-Smtp-Source: AGHT+IFqVTw4FTRwv+Ci/OXlWPaTpzBgQqZk9sx3Vol1TK7v62itBtYlol9Bs9jwjEFkDZ30bXyDEkrrdBWH8FGmGeM5S6bMM7ug
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1646:b0:3db:86fc:d328 with SMTP id
 e9e14a558f8ab-3de38c2e1c2mr179727175ab.5.1750750707609; Tue, 24 Jun 2025
 00:38:27 -0700 (PDT)
Date: Tue, 24 Jun 2025 00:38:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685a55f3.050a0220.2303ee.0006.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Jun 2025)
From: syzbot <syzbot+list32a9ebc8ed81539e58eb@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 3 new issues were detected and 0 were fixed.
In total, 39 issues are still open and 65 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  20874   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  14296   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  5925    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<4>  5556    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<5>  4757    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<6>  4422    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<7>  3268    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<8>  2667    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<9>  2331    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<10> 2329    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
