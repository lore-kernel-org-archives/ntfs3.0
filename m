Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110E2F7442
	for <ntfs3@lists.linux.dev>; Wed, 29 Oct 2025 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751506; cv=none; b=ZzT8iAguStIKI7Oop9r7mP68ex4BOWBZIv6mqHGsEDdFHBrUu5YZAwPskmYw/rJuJImPOTVlniAnVzponN7aRwqdMmcPLPAHqm1iqVpXdF+0NqG9EkFBGuqVn20OkcqIBzBGRNc7Y4DKWkkjdNoXGhkNZ/cUbyU+Bm9L45mxTIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751506; c=relaxed/simple;
	bh=oz5/FdGaNUEgLVToKsd5oT6RMB3AVWzvznYx2ubnONQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=a5BE9JOOS5UqVGVFtRpyziHqVVX8yRXx7NT5t1M8FMHcoGVS2wDY6Co9/H1S9Kj0XU/xO/v9JNr8ciGcOhpmBeChfZjZaZ7y2+WnYnNv2nktyCpCjFl5no3EYsCQpf+Mrji6I+Uj3DiHZk4pPTqdKbN4ggRRZK9uaLxuI6t1mZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-945ab8d3d0bso400698439f.2
        for <ntfs3@lists.linux.dev>; Wed, 29 Oct 2025 08:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751504; x=1762356304;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjxd8/NUsI1hfMIrqtOMXoq3b6QjBv+xq100vcZ9G+E=;
        b=XkxP+4VVQOYTg2K2R9cXGnxgpMoVs+RaTfgG4gc+ddK9BH7JzWv3Tev/YSi//ju6iH
         5TRzXY1aWkg8CV5Hh9rQlvZWOrUbKoERMIDlHmoUWH28vMGdQVeUWsn0IyrFg/nGyDbd
         90UiYef+RVqCtJ+RFuDouJ1kxSy5vM2LQcWw4H9wYkQjDk0FLSXPUVY6U3XRl+q2Ys2Q
         cMp7C5snpMnv5yKwYPo5oNvbeK1MYp5D6u5pRibx1fsPKIOPRO44yGiW/1u8DEw607uI
         Ob7lCZixYs3W2vfhnWIQoCRJtHkd5s6R0Hh9zg7f7D+esaJqHhSWtks1/SavGEmg75/s
         Jebw==
X-Forwarded-Encrypted: i=1; AJvYcCX5kDyB72g1mxaGdstlkz+maJphekSr6p3QtqvQfeVfex10DQJE+ukYQaYwXbBNk29am44HMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhvmEcJ+irlzi7gXbzmkjqgLtt2PBgQHxvm4Yu0ST4LTwKFnx1
	tSb00WAy5BKhZYoTpgmqA9R6ODvJxf1lTGJlqm13wiWvq5JId2ZeVjUwDYSNOEt2szd3ug3Nv5Z
	lwJ5bB4zB7kVicjvfGpcn0I+jBUfNnz50x42ee1fhLb5kn7+Uiw5Aefrrs0E=
X-Google-Smtp-Source: AGHT+IGuHiMjVIwLMgSMF2Yqd97+3DJATLJD55vykLJy9hu3ZBUHu44RCvAnyaEsWL6rkVUmh9Khhk/hjDnedWa666N0X3odFRz8
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4611:b0:432:fd5c:df03 with SMTP id
 e9e14a558f8ab-432fd5cdff8mr13478835ab.24.1761751504572; Wed, 29 Oct 2025
 08:25:04 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:25:04 -0700
In-Reply-To: <69015bf1.050a0220.3344a1.03f7.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690231d0.050a0220.3344a1.0425.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_put_super
From: syzbot <syzbot+cc433e4cd6d54736bf80@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anmuxixixi@gmail.com, 
	eadavis@qq.com, linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 02f312754c873efe076888a2fdca982e56617929
Author: YangWen <anmuxixixi@gmail.com>
Date:   Wed Sep 10 15:17:08 2025 +0000

    ntfs3: fix use-after-free of sbi->options in cmp_fnames

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12ba4bcd980000
start commit:   f7d2388eeec2 Add linux-next specific files for 20251028
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11ba4bcd980000
console output: https://syzkaller.appspot.com/x/log.txt?x=16ba4bcd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ecdce5bceba74f
dashboard link: https://syzkaller.appspot.com/bug?extid=cc433e4cd6d54736bf80
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b73d42580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1019dfe2580000

Reported-by: syzbot+cc433e4cd6d54736bf80@syzkaller.appspotmail.com
Fixes: 02f312754c87 ("ntfs3: fix use-after-free of sbi->options in cmp_fnames")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
