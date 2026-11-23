Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418154;
	b=oxuG89IE0i2BuEn4L/bUpxnLKjO4cmdLOvm8aOC2dIjwcB3nbSq1MSJq/UjCWd0ykZd2
	 dQEjjcNwxt8HUjtNbTaTilDxvgLcyaRutTOafcYSrYTsLN25+GAsOGkMpT49ZEfgniP3V
	 9cb3GptprSUti2wy4zK7lAnV5sOQHR5yH91xVPYUSqXi9tBY/DqUF3pilPjivOU88N8KO
	 x9juXJkvdPDzeJtWSFM0vHa27k9irl/lNjbLDF6cbiarGNLuITsS7dnDJ6/dYZB6gc1q1
	 OGMgRFmURTWTaZAIEAJmI6gZGgnNEqPTZvOhvyrjUW53dlw3AWUXOodYDov3yKz5kLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418154;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=629g86cRTauZQlhr9Wri/E7+EASS87C5XJjWnCiTchI=;
	b=FGf2wNCRSk9V8fDW9EU+R+BSH+XvqYokhkYOaRJnlqlFUvdU69TnVCHTnuJ9hYWwV2j3
	 ieIQMnPjJmOC/O/MSUwLVZB0lUMbnaO4l2eFglGW4KN+wUradApzMjRPNjQAcuoqDL+q7
	 QuvnDQpdWqH1PsCbHxiwbCQttHX4vu6Z/Ku8eeqH9ZQzqCFEc8xx5gV5ZLQQtKXX3wVdf
	 EhGSt3UJwtTIoWAzovCl0zQXMpUagFL0R8IhgGGCuBjNH/SzB+RqwtvV6aMgzHxWTXgyd
	 RxezpCQD2Bo9e6M82vj+uB2XcYolt83L2Ib9lggSFjMLwFUHWxzHnSlwvKac4KDEwdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B35606A31F
	for <ntfs3@lists.linux.dev>; Mon, 23 Nov 2026 07:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37620eb73so4181225b6e.1
        for <ntfs3@lists.linux.dev>; Sun, 22 Nov 2026 23:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418153; x=1796022953;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=629g86cRTauZQlhr9Wri/E7+EASS87C5XJjWnCiTchI=;
        b=MG8DOK6WfiWpRYDxpe0Z/4QyxsawaHVLtJZOdBkR8fzGqMMofFsENp8d6rLmWnvZMh
         orf6GszLIRgPjTSCp7BTZvXD+o6VvwcrM7aQD+/2I6qIMZ8OyN5AXIif+FoPJPJ02GWU
         +P/C2E4LaxkAgzsVC3cbi/awYzkMjYg6tDKXMX9AoknAfXrHLAl5FYhVSRVlwVj9WOX1
         qpWYZyd8vyHoE5avBezrlx/wcrssbmFpDyNxFqZ9xvAK5NVRaqYLxidBkRtVdGjhj++e
         UPzvekOpskim7vsKqzzybVwjOmsmrDd7exJKJEm5cXPvGDUcbFxkbudvYBvx5L6BAwCi
         zEWg==
X-Forwarded-Encrypted: i=1; AL+hErFbN2ZlwxnjNeREopZEEAd0Mj/1TsF39e1VYfu2MKUQ/78XHBJoTkl2iSoLyUhkoBYCGwjSRw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+HkwUliFPERv4I6sbDYId433/H2MTZP+4gNBtHDo4BhnVSmriM
	gmtUQieP8rFPkm893yR4ImqKjlP4/tExXh1HqG3oPWGeC4KbAYnWBpSgd84X/teFVxj4rxDAfqU
	RjaQTKlGo7mt68iowpR+HIIemdBemcEyDtqkNw0sU3a3QUj73zXbic6hlNgQ=
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:198f:b0:573:7a6b:f33d with SMTP id
 5614622812f47-57a0ab2f9c8mr12792402b6e.42.1795418153219; Sun, 22 Nov 2026
 23:15:53 -0800 (PST)
Date: Sun, 22 Nov 2026 23:15:53 -0800
In-Reply-To: <20261118132710.29751-1-suruurism@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b03e829.a481e175.27cf24.0019.GAE@google.com>
Subject: [syzbot ci] Re: ntfs3: clear VMA_MAYWRITE on read-only
 compressed-file mmap
From: syzbot ci <syzbot+cie4518cb24e7c0c99@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	stable@vger.kernel.org, suruurism@gmail.com
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot ci has tested the following series

[v1] ntfs3: clear VMA_MAYWRITE on read-only compressed-file mmap
https://lore.kernel.org/all/20261118132710.29751-1-suruurism@gmail.com
* [PATCH] ntfs3: clear VMA_MAYWRITE on read-only compressed-file mmap

and found the following issue:
WARNING in mmap_validate

Full report is available here:
https://ci.syzbot.org/series/2cf8a8c7-bfcc-4bcc-bfda-dccd333a025d

***

WARNING in mmap_validate

tree:      torvalds
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
base:      b3f1631d362539cfe14571ccfd7db919ffbc08c7
arch:      amd64
compiler:  Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
config:    https://ci.syzbot.org/builds/92ccdff0-04ed-4a0e-80d7-77102143beb7/config
syz repro: https://ci.syzbot.org/findings/189d2e19-2002-455d-a0ed-c3a015048eaa/syz_repro

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Failed to load $Extend (-22).
ntfs3(loop0): Failed to initialize $Extend.
------------[ cut here ]------------
was_maywrite && !is_maywrite
WARNING: mm/vma.c:2872 at mmap_validate+0x1c3/0x1e0 mm/vma.c:2872, CPU#1: syz.0.17/5893
Modules linked in:
CPU: 1 UID: 0 PID: 5893 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:mmap_validate+0x1c3/0x1e0 mm/vma.c:2872
Code: 5c 41 5d 41 5e 41 5f 5d e9 1a 34 d8 09 cc e8 e4 8a 98 ff 90 0f 0b 90 eb 1f e8 d9 8a 98 ff 90 0f 0b 90 eb 14 e8 ce 8a 98 ff 90 <0f> 0b 90 eb 09 e8 c3 8a 98 ff 90 0f 0b 90 41 be ea ff ff ff eb bb
RSP: 0018:ffffc900041ef428 EFLAGS: 00010293
RAX: ffffffff82309662 RBX: ffffc900041ef9a0 RCX: ffff8881686c3c00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000200000000001 R08: ffffc900041ef9a7 R09: 1ffff9200083df34
R10: dffffc0000000000 R11: fffff5200083df35 R12: dffffc0000000000
R13: 1ffff9200083df34 R14: 0000000000000001 R15: 0000000000000001
FS:  00007fb956e196c0(0000) GS:ffff8882a7809000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb955e71a20 CR3: 00000001baeae000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 call_mmap_prepare mm/vma.c:2975 [inline]
 __mmap_region mm/vma.c:3075 [inline]
 mmap_region+0x12d8/0x2800 mm/vma.c:3173
 do_mmap+0xe0a/0x1300 mm/mmap.c:573
 vm_mmap_pgoff+0x27a/0x520 mm/util.c:581
 ksys_mmap_pgoff+0x4dc/0x760 mm/mmap.c:619
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb955fa8fd9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb956e19028 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 00007fb956225fa0 RCX: 00007fb955fa8fd9
RDX: 0000000000000001 RSI: 0000000000400000 RDI: 0000200000000000
RBP: 00007fb956037fed R08: 0000000000000004 R09: 0000000000000000
R10: 0000000000010012 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb956226038 R14: 00007fb956225fa0 R15: 00007ffcdbaed6f8
 </TASK>


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.
