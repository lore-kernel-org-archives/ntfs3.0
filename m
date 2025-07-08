Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD3429C35B
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962388; cv=none; b=lS3CeTVgm839/Zs2rQ/9aG4fv9zPXECwc7rq9zM6KJ0yRsfqMimx6U8IhfnjhDASiFJLUsLvpUO+QAuJsP4MRoCC6sG3KMTZhBjOu3C+8NPXDJxYKzoe2rhwSEmjrs24nGSKTgVIQse74DZ7XnNiakRDTT5YYomgxe4FzH1JQik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962388; c=relaxed/simple;
	bh=3j0z7uOc88PwXujdHZH89nrv/QfI9epcRoVUAUMe6Xs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jA9YdwBngu2h3t7nUttMz9eNnJdxzZzpEuHUQdfdLTF0ybwq3DC4RyGV6RCqBfjr4cn73LqEPvnrAbQwvXElYEyn0rgWil7/su4I2S+pWbCRvDaPHvWKEexEZ//agjHkVpvhWWNFogDnFcOdAb4DDCKKWZZTIQ3JfuF9Eul5m8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-87313ccba79so791476739f.2
        for <ntfs3@lists.linux.dev>; Tue, 08 Jul 2025 01:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751962386; x=1752567186;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhWvT0kMFjNYF78VKmzBmutmUcr/RtdPbRnLzEi+R5k=;
        b=xMd81oOJ6FCouKHZKbSSpQNZ9y8pTR2OqEFIll6LKCWl7Tks0kQYCPDWMl1Rvkz3zt
         XYygyTV18Go64SEwD2PwXyDTfrzG1LRJEBK6byWpOiWUhSZLcLazOVAR8FWPnoQeV6zf
         qdIdyL2RtCa2W7R7vEKqMJem53d+W1pOTU8MQPRix4PYLL7CgLNtBR7vEr1P8vrE2jea
         QEFav74rIqZVBCK0i/ilp1yFmp3VIdW1ycdmNQAPQccbnEPfx2lK+j9Zl6XYFW2rbW3y
         4yfn2l4RNXfZUqjvPoDCt+bfN15IJJHyquKa6ek8/iPvx7+r4aUgDb4S/OkHreWYazX8
         NkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOB3+t2eEBmpdEO0d5z9XztdyagxSzn2k4WJW4GLwgz6t7UIayvwNlGAWzPfCOqRpsRADPxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLUgEarYUyHCHN2+q4+wtUpwzHsF/ndjsXThlcTrorHYRbV5Yp
	zmkHNgveB73qWfdoMYLlUihGi7Om/5NqRxhLHsvRGi2Or8TfD7k8Flya5Hh89BY8ZoDi/m6PK/Q
	LTz29nl77ptznXZaA2UPoMJSYXnDbuPr7epA4T8yefAa7qWF6RqClBqxnes8=
X-Google-Smtp-Source: AGHT+IHRsdLZqFOWOf8AjNIs2iK6p31lxgxA+YD8ORzS4RcFP4kZ6kOFZA6d6nlD15a8wPEeuOfs4sk39fcQym/79EF5m1KsjtTM
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f87:b0:3df:3541:7007 with SMTP id
 e9e14a558f8ab-3e136ee48a7mr151749605ab.4.1751962386387; Tue, 08 Jul 2025
 01:13:06 -0700 (PDT)
Date: Tue, 08 Jul 2025 01:13:06 -0700
In-Reply-To: <CAF3JpA5n1Xb7h_RWG+y10zu_cbciPsppv8Pnetmxw6QXxi1D9A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686cd312.a00a0220.338033.0009.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	moonhee.lee.ca@gmail.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in ni_rename

loop0: detected capacity change from 0 to 4096
------------[ cut here ]------------
WARNING: fs/ntfs3/frecord.c:3030 at ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029, CPU#1: syz.0.16/6620
Modules linked in:
CPU: 1 UID: 0 PID: 6620 Comm: syz.0.16 Not tainted 6.16.0-rc4-next-20250704-syzkaller-07381-g26ffb3d6f02c-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029
Code: 8b 05 b6 5d 9a 0f 48 3b 44 24 10 75 22 44 89 e0 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d e9 d9 a6 6c 08 cc e8 f3 7d b9 fe 90 <0f> 0b 90 eb c5 e8 68 cc 69 08 0f 1f 84 00 00 00 00 00 90 90 90 90
RSP: 0018:ffffc900033e7ab8 EFLAGS: 00010293
RAX: ffffffff8306228d RBX: 00000000fffffffe RCX: ffff888021723c00
RDX: 0000000000000000 RSI: 00000000fffffffe RDI: 0000000000000000
RBP: 00000000fffffffe R08: ffffffff8fa18a37 R09: 1ffffffff1f43146
R10: dffffc0000000000 R11: fffffbfff1f43147 R12: 0000000000000000
R13: ffff88802f30d500 R14: ffff88806d04d0c8 R15: ffff88806d04b368
FS:  00007f1edd33f6c0(0000) GS:ffff888125d18000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001060 CR3: 000000007c546000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 ntfs_rename+0x6e2/0xb40 fs/ntfs3/namei.c:316
 vfs_rename+0xbd7/0xf00 fs/namei.c:5129
 do_renameat2+0x6ce/0xa80 fs/namei.c:5278
 __do_sys_rename fs/namei.c:5325 [inline]
 __se_sys_rename fs/namei.c:5323 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5323
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1edc58e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1edd33f038 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 00007f1edc7b5fa0 RCX: 00007f1edc58e929
RDX: 0000000000000000 RSI: 0000200000001040 RDI: 0000200000000280
RBP: 00007f1edc610b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f1edc7b5fa0 R15: 00007ffcb3616c48
 </TASK>


Tested on:

commit:         26ffb3d6 Add linux-next specific files for 20250704
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16c95582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59817f9ef599726c
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=175edf70580000

