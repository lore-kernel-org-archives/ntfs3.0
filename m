Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0C2EFDB2
	for <ntfs3@lists.linux.dev>; Mon, 24 Nov 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763974627; cv=none; b=XcvrUvRvRY2wZlP1cobW42QBW388CYrl8aomHppML3XGemyQazvdBlAIbn/htwhRyOv4QPRy5ZojyRTDZVqRpSH9qjFaDE9XJq+OP7AP0y2bg0y3lllLZitE0lTYl2S56x2nncZJXnI2zQ09hBl9Nce/9cONnXtgb8K/t6OA0rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763974627; c=relaxed/simple;
	bh=77x9AyTB64fyj0fw+VLfJeSJSvnY2GAQ67S5hveEqao=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=C2G0Qcl4xx+r76RVgRsB7rDw3RbyuRA8fEOS1P8d3v4mcv4sp230RSWTZE78QWb1QLgkJnfzWRlcVfuGq190vfmj3c1C4/UsmrEAo1AnAEQ0NKta/qw/yZ8ufsmS/s0H4uoYD+oe/VqIMgpXEHB7NBGhumTAR7zoqUTDB3Hspi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-43321627eabso42124275ab.3
        for <ntfs3@lists.linux.dev>; Mon, 24 Nov 2025 00:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763974625; x=1764579425;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgpdXraqge1crgzutbhxY1FweyGIh99mqt/ID7C9uWY=;
        b=mMslMaGjIr/DqmnrYO4sGvNFIJ65EzznvCm3pvEQNugSPihV6pjaBDLjQdJZ1ml6E9
         nixLVw0PS93E01cqn6Oatab71o51I9F0YU/n4pBB2cHxhTvDNhkXwRvu98h33G+ummnX
         uDJmOs75C7DuKHqrdrS29p48xE2Jp9iZ2oBI0x9gSYMVsJyiuYUooQWDL9VEpwmaqfu7
         KVgp+HYPO7052iXRowjF2Bt11Vf853Yf3sqhj8I98ydiva91wQEaNV4jBEid0+IaFI0H
         dcbIOKLeh21KIkjkHV1ndkNk5ddstmEJy4J5H9Ud+fN5cZtk7V2xjVo1Um/Tx6wWk/H/
         9DBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPlzkPPK1+sNN5ygb005DG/f6ptEDC2pfBcxBw322hQn43Om+JUr4p8F2gqlykSwlMjWMCwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyO63y2E3yWrtO4xULfknp+s71dR1kaL29jn+m6WeFxH0smWFX/
	fSua8ti2Z7Ie56Hg3NWhOpkMRHybPlK/Cr4oi7IjPh7CGy6T/TIZNpdwzKyovQl4lORm/iOYaOC
	VcvR87HQE34Rpik3d9JXvxnQixv81+ER6c3eXoFix6Yu6G3micBQPoIb9Bxc=
X-Google-Smtp-Source: AGHT+IF9rF0JDF4x3w0a1F2G7uPBAzeg5qEtEj7GcsQo4Lsq+x808f/YwHriczCx8EfwVCOiVfp0zi7ct6BY2GDotXbx7xMmDMdz
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8a:b0:435:a148:d2c with SMTP id
 e9e14a558f8ab-435b9ae62b5mr86289295ab.41.1763974625536; Mon, 24 Nov 2025
 00:57:05 -0800 (PST)
Date: Mon, 24 Nov 2025 00:57:05 -0800
In-Reply-To: <v6f6kfeeur7hhpj74za4larguj2jdhz652cwvmxu5o32ivkuso@cdpkqhx5gt7j>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69241de1.a70a0220.d98e3.0082.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] INFO: task hung in __start_renaming
From: syzbot <syzbot+2fefb910d2c20c0698d8@syzkaller.appspotmail.com>
To: agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, 
	brauner@kernel.org, dhowells@redhat.com, gfs2@lists.linux.dev, jack@suse.cz, 
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, mjguzik@gmail.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2fefb910d2c20c0698d8@syzkaller.appspotmail.com
Tested-by: syzbot+2fefb910d2c20c0698d8@syzkaller.appspotmail.com

Tested on:

commit:         523ac768 Merge patch series "Create and use APIs to ce..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.19.directory.locking
console output: https://syzkaller.appspot.com/x/log.txt?x=168a38b4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4d8bca00359e65f
dashboard link: https://syzkaller.appspot.com/bug?extid=2fefb910d2c20c0698d8
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
