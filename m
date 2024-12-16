Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322F201100
	for <ntfs3@lists.linux.dev>; Mon, 16 Dec 2024 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342263; cv=none; b=BvhleNHlgN5OFrLbl4YfmAqhuQ6aj4YYXwSR26lqkFmnGWjXogufIF5lDF2+qi34o2kPlE88v2SFz2XZFTX7TRk/p6GLLIbL4BCWcLX+gq/iGXI+leAyQirRPXhkF3ZcRUQw3J91AS8sYzZ7XSbnvSGzlTlrv1WWU96/zjLcpyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342263; c=relaxed/simple;
	bh=AG8K2DMLN0Ode/7NxCk/OkFCTrhFYNnYze1xqVrE/6k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VXqpTPzN/ld8JM6zRTeCiFUzEpaWmcI5RQ6SVrJBbt+5C++I/PZkc93IKNBdZujlZkWXU82o57GIS86G+cA6bCFTkPdda9y926Uq/Gf6MYrO52XhQ0Khf0Bi2zhS0D2TTrIK/IbHRq3FhTfwS49DAm7m6+KGucrU8I5x67oUTtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a81570ea43so37379275ab.0
        for <ntfs3@lists.linux.dev>; Mon, 16 Dec 2024 01:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734342261; x=1734947061;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltWQwfR9GIc+MCjFnjnrnTvhb+cUIMwa9fDdY2xAn0I=;
        b=EGOvozmteWzMge7l7OhNWtPT6X7ABDQVF9lr8KBaL3MrFfweDoSkXl2EW4YnkEWD1p
         Mu+FToCzJtb1NXTIngVK9430mgpBXrzG6UhQELJvRN3oNptW2Bu/BbHunIfxa0fxmOaJ
         XGH9WD/yF1SU77K+dTnnRBMG9erpea2Ml7F4do4CbZF0rD5vC1QL+B4eEW9A1O0ac5Bm
         0u9uQHOhQxWuRN9R8WIt4ZeP8e1wdlemgHm0PJaZD0/MjzYEm5AVkMyv2UenX3Qocy1k
         wzoCMg6dW8Xw9nUfWc0wO4qSEoLVRTSdUhqAy3aV308wnZmyzAzr0SU9z9R4S8THPmwB
         S8cg==
X-Forwarded-Encrypted: i=1; AJvYcCWT/P0V7FCCuJlbLdX5CcWC6/qChux3mtvzLv+41+RJFPS2cCVo/tXcBu6f/2itu3hysi1RxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOyxIK4YIWGdIfQkKU8ezdYA5ucIIn9/Hpc47dpyJ+tzyVsjho
	VL4raIXowbj0e08v/6uXDJ/s02T9RuT638gAZBSCBBXQqpyOsJ8pUoB4Lsn0WydkkAjV4tMB9/F
	tgS7WkOUJPU2HN5Ny/E0kyb41Uv/5s94iuJgKvuXCDXqj18B84MIgPco=
X-Google-Smtp-Source: AGHT+IEK6ui5yECvmSrw0yP+Q3n74CQa/s47RUkzp+DHvOojyx3mYtlOdAB02vz4ZVXjIu4BmzQdPBQLMmFDOBXQeI+a28lRvnuk
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144c:b0:3a7:e8e1:cbcd with SMTP id
 e9e14a558f8ab-3aff8c9159bmr105220035ab.22.1734342261229; Mon, 16 Dec 2024
 01:44:21 -0800 (PST)
Date: Mon, 16 Dec 2024 01:44:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675ff675.050a0220.37aaf.0123.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Dec 2024)
From: syzbot <syzbot+list26922f6871252a2b2df9@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 4 new issues were detected and 0 were fixed.
In total, 45 issues are still open and 60 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  12409   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  9932    Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  5549    Yes   possible deadlock in ntfs_read_folio
                   https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
<4>  3925    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  3409    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  1827    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<7>  1580    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<8>  1569    No    possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<9>  1474    Yes   kernel BUG in ntfs_extend_initialized_size
                   https://syzkaller.appspot.com/bug?extid=39385e8595a092bae44b
<10> 585     No    possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
