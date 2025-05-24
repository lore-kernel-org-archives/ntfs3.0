Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2626195811
	for <ntfs3@lists.linux.dev>; Sat, 24 May 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081076; cv=none; b=EO5e03zsje8ys4nRDY008sP6NaJU6LCkybjRDhjIxkoQjlL34Be/Bjk21AGz/FyISfkE8c9rTqWgO6jah9kdVeH6PS9VwmXo/dHRpO3kg/d31exRqCz5EsYOvo0BbVtixHFI4abC6pEcsd4rNOfYwnCTz4kntuyLKM0AOF8QZf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081076; c=relaxed/simple;
	bh=b1Uq1m/6fvr+jmGl93XzGvlmwruTnkA8n8VcvNy+mDo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LVwk4dvEe6Ni0qToAlyi321G+ljo6YA1JOGVK+Z9lGLGJRqCj24ogI54oTasBK/xEw+k47EF8on27iW6AffLozH5GAu3egFuOZndY4h9YnBCAzwclMffxcJn9u5y7FE41vYTyIuzNGbQProVZkyK474Uoyx4jhrnTuin5D4dbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-861d6e340e2so59439639f.2
        for <ntfs3@lists.linux.dev>; Sat, 24 May 2025 03:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081074; x=1748685874;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gaS3ynhDOu3Jf/8g2JUKVyz6qWFIrfoIhxFFX/+x46c=;
        b=VegTuCK/6lPuH4MTY4oemcguqdMmoVJxI0YtxWCLb9cWCZGp6dMFcnp/WBjij5Ozqm
         rWNQdLwcQUF20qLeqZvPFAyOgb8L96jVgx8cRg0Uh6ifdP6qj9F7FYNw31As3BloZpml
         FAYmnjNYJTJO2SmjnWbVXCZr/8IrrJRXZGSkNsb+aW7UnVRbAesxx+6XqQbVsgBQW1Tq
         xKW3n0HszY2sgYnalpv01kWjj6tJ0a2ej427D+Wf6PipTzffyMI9FhtZ+I3+hmWnWgxY
         7ZCu1CXSJlnDLVMEdyjKxZ7lhEW+immwN1M2jJHtgr9fTfYDSzcEbvGQYFuLWrP97MFg
         2djg==
X-Forwarded-Encrypted: i=1; AJvYcCWAfxHGy7f/JwTQVwfNa2CGz0ZUiae2xnVPTcddwOu7+R4xD1s7hp1A6/wxedz0V7HihHDMKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmauHG6IvJtBWYUKRoPJjnp/r854Qaxal0+c+lAj9xOVxlDUFQ
	njSePwKV48ermWwcn8uc1tqK/NwbkHmDhV/8Ec+BV/E1ZDKlIa/A+GkwoL3+YNaH5/+HwV1jhAp
	wDNeFwG3aaDdMFU5hwBlTUSn31fgOJIdBV1JdAiQA2qFZIarZZdqTcvD8aDw=
X-Google-Smtp-Source: AGHT+IH7RuOUEBJR2A0sEwtFKn5Dzt1rLOhsdXhUdRO2GGdIpwBX65i8bNWFlLio15FPIdFeIQmBA+8r7pDP0i906VblBPbTZhkk
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a09:b0:85a:eecd:37b with SMTP id
 ca18e2360f4ac-86cbb88d2a5mr227413239f.11.1748081074020; Sat, 24 May 2025
 03:04:34 -0700 (PDT)
Date: Sat, 24 May 2025 03:04:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683199b2.a70a0220.29d4a0.07f4.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (May 2025)
From: syzbot <syzbot+list55b581808b23b36a03dc@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 2 new issues were detected and 0 were fixed.
In total, 41 issues are still open and 64 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  19612   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  13795   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  5580    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<4>  4703    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  4153    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  2971    Yes   possible deadlock in ntfs_file_mmap
                   https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
<7>  2537    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<8>  2155    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<9>  2151    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<10> 438     Yes   possible deadlock in ntfs_fallocate
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
