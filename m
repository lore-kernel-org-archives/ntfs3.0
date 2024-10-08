Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F208208B8
	for <ntfs3@lists.linux.dev>; Tue,  8 Oct 2024 03:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728358625; cv=none; b=CJV505CjvIRiXzzjc6K6B99srGBoZ7T52WQS6O/mDtKnWzayNTicwOYTFN3aK87Bt2rBOXThDmbVvubWPGNYkGxqwNZ6g0Cllas+gIbhVM1wYXR380a9YzymzEIKFUKVxPKr+CjHCZfTRt14yxDQBFUDWC5sNVRt6CidP6xHALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728358625; c=relaxed/simple;
	bh=9lCC6/cPpt6A3D9ApigehizFGweWB9PeX4KwX3Vh3HA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Pldi0u5aIZTdBdZNZF1N16V4WVLoomfqFlmTwenqx0figycm0AE3RnlYKhju7Org5xEbLqhmE9cWuZZVJpjKUjMlL2ELusC04LFDMKjdAlYMshz9KXsvfWP+bVx9cQYmrpeb5kgV6+h897p/qOIssGM0u4PU8hfyEeI4DVlVRsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a1925177fdso58539255ab.3
        for <ntfs3@lists.linux.dev>; Mon, 07 Oct 2024 20:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728358623; x=1728963423;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSzLNKT6ggLBRa7OjU1CCapcNmts6fijQLpZW/Tgbkk=;
        b=EwlqZbWih8hIzNJPJu5w7eeEQ28z1FnJuBntPcJufJHGnADDrxkC5+JhDoQgI9dXMo
         eIEdRx9cLS4Ii19m7D8bTu/ggvN4Cq9slNp/oagWFJYdNlnZ8GeFnuZPfynbSqeQgHiF
         GofTD0q6S3w9mgeUkNmYfBs/p92Wi0khdHF7+JlAkjYpJAswJhU3Bz6ujHW4uYBDZFFH
         Go3rQbQl5wm0NtXfaQmxhfh/fXFjlcgPqYfUDOTJ02b757V8HxmgPTGVXiiPW+Quvy3C
         jt/IKSSC026Eq7tSegJD0D4ybTY/GckxM9pqYQKrxskIQtctAs5Wm9qe7WCLFX0Vf8iB
         U98Q==
X-Forwarded-Encrypted: i=1; AJvYcCWR8mw93bVo6qQCeuInT8gy8uPfhSz0gH/yiHr7ZiHKJ/R3gorD/ME4TEJlwrO5GM9kulUq6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkWzqxyCcktY31mprNh++57qi+1R7Aik2mQCSukguU5ibHQaSH
	zQBkph7wKQvpQWDLuME+k1XpvZsLE0qysfMTzMtck+AbgcmAeQXynyHKhKVQXRqxp8t+UkLUODT
	Z5EZiaVO+1kbWmoEVyr/0e6SFTXbY8B2eLh/pVJXlCLTY4gBvdiNJL0E=
X-Google-Smtp-Source: AGHT+IF0hAiBE0Fb+aPb21J0S7uMLzyS9Sc9RrEn7srF0SIcpCnZCDnEqOSeWf85zCgZaSnrqbrbOA9grvuCBSNyji9u+HpMxZSt
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184d:b0:3a0:451b:ade3 with SMTP id
 e9e14a558f8ab-3a375a978dbmr140169875ab.10.1728358623187; Mon, 07 Oct 2024
 20:37:03 -0700 (PDT)
Date: Mon, 07 Oct 2024 20:37:03 -0700
In-Reply-To: <66f70232.050a0220.38ace9.002f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6704a8df.050a0220.49194.0521.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in wnd_init (2)
From: syzbot <syzbot+47de774a425e2380f16f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit fc471e39e38fea6677017cbdd6d928088a59fc67
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Jun 30 12:12:58 2023 +0000

    fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10a4bb80580000
start commit:   8cf0b93919e1 Linux 6.12-rc2
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12a4bb80580000
console output: https://syzkaller.appspot.com/x/log.txt?x=14a4bb80580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a3fccdd0bb995
dashboard link: https://syzkaller.appspot.com/bug?extid=47de774a425e2380f16f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ab2707980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10dbc327980000

Reported-by: syzbot+47de774a425e2380f16f@syzkaller.appspotmail.com
Fixes: fc471e39e38f ("fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
