Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13872192F9
	for <ntfs3@lists.linux.dev>; Tue,  2 Jun 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432349; cv=none; b=V2EzJAAMT1y8d4FuqdHEgk2bzOjByJpGNEbmtA2HYnP37+uRDNua31F1I5rF6R6YFpFMYMNVELN1x6f02Ay+gGUkcM89D2LD7F+yG9nSgOQPlN3YbPc1G4/18nf81ZfllFI78vO+5bzwj0c4T1EU33jRbG1WSC/MEODxDFWKwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432349; c=relaxed/simple;
	bh=HMnZNs+d9R7Tgc3HE7c5SW9sQVVlHC7wvRIo6JYgkU0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rnMN7UaXZuDDRvqQudzlCc9uc8JuUqRSPLwDXBpnXppcjb0j/SUBgkuFwtjfizhoHVYUZOwr3+fazy8i28xwsUBcKRs2Rv4bbIHRbEo/4G6mMDllU5r54O/Mdajz+45zZRGEn6h3NesOzrMgTLSJoaeFkQ84D/H7yK6mdPuFFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69e45c65b5eso650466eaf.2
        for <ntfs3@lists.linux.dev>; Tue, 02 Jun 2026 13:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780432347; x=1781037147;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drx1GfcGrZibJxFfCokStljH63Tsy2tWkatIme3Dhl8=;
        b=PNg61ZNtLeztVfigMcpgQ9r5xbbnZV0BHqsQX1eBizxrbPWSagTLPISvW3atfCyxoL
         eE6rGrQNkHFthl4qHJPIAQPiYHQAkJXU+G/E+QRKEI2GrG/6fdygNUewQoKMgBgHCfJi
         djYwf8aakps6FE9dcTGb2ByW8oQlcbKgts4jQOvq9Vpw8ak66zA6bcxaK9aBtWv8OeJv
         KW+DW/eRwDUulbr15B7FPobbMKHI7fWEC5OU+CutbQwFb/4iSaZNVJwuAmTh1YyyeBrN
         7EdFiY5P9j3pEk9qAzYDuXSm98jkTb+A67X4bLqJm02L/k7Ngi1RFGzkVmXS9LLWEyqg
         9A/g==
X-Forwarded-Encrypted: i=1; AFNElJ/5PG9MFN8xkQdd/3T/8m9y8osUta+BYfv2Ut28nJR1qfSd/95itdJpBLbv/7UO4/9IOGgspA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUxqlFsCEByE0cqbRcZfAM6cxNd6fnbIj62R81CU4bptWu9dEn
	vSxwTOT+irrmygh3kR2fGU3ixacqAOvjyv5glkyZNrEkiWLwEaRSAdtozWrQegSkZtf7gAqS6Gj
	erQULi+8H54N376Lfk/W6r23pu/OHvU8MDR8JbifVTMEpE+h7B26jnJ7yjlI=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a4a:d1ab:0:b0:69d:d865:92b1 with SMTP id
 006d021491bc7-69e47ed51cbmr300218eaf.25.1780432347214; Tue, 02 Jun 2026
 13:32:27 -0700 (PDT)
Date: Tue, 02 Jun 2026 13:32:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1f3ddb.7b89b7e1.205e57.0008.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Jun 2026)
From: syzbot <syzbot+list013626ba288e4441207f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 3 new issues were detected and 0 were fixed.
In total, 15 issues are still open and 91 have already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3711    Yes   possible deadlock in attr_data_get_block (2)
                  https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<2> 523     Yes   possible deadlock in ntfs_fallocate
                  https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<3> 39      Yes   WARNING in errseq_set (2)
                  https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
<4> 8       No    KASAN: slab-use-after-free Read in ntfs_iget5
                  https://syzkaller.appspot.com/bug?extid=4d48dcd9e88d37df77b3
<5> 6       Yes   INFO: task hung in attr_data_get_block (2)
                  https://syzkaller.appspot.com/bug?extid=ca081116e9150ecfe495
<6> 2       No    KASAN: slab-use-after-free Read in ntfs_read_hdr
                  https://syzkaller.appspot.com/bug?extid=233bcd55d51543e76e99
<7> 2       No    WARNING in attr_data_get_block_locked (2)
                  https://syzkaller.appspot.com/bug?extid=7be6ad5cb228286af3e3

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
