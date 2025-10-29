Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2936C324B2F
	for <ntfs3@lists.linux.dev>; Wed, 29 Oct 2025 23:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761781625; cv=none; b=APWN/bkDi8GoOUFAvMVT8uOe2/Y2uZwq6bfTc/0IGMSwM4Ocp4SBRW3J2dNEKK2PE+5yoyXdtt4JRlS+KH+kjdC1UZz/WglJFIN302jHay+AJjMKs9hmDmVJGy5diu1pjv8YDTRPHUyFtoI/7DwBETqSINAT9iCKoA4oP+gR78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761781625; c=relaxed/simple;
	bh=nfRxFHm+9TZ0tLP/v5TW7uTT0F58CAooDqfltg0GWks=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eonHW03bnliK9hduL7Iz5gUXGQlixk8KVKbKar4/2fNa0sUoZ32Yc+mEyfvbFGQrrtlYhXPBtM9r/V9kKDsJq/A5hpKQ/8VG2r1pvgUUlioWufr+clc1IMUlXN5PemHzzrexB3C6m9S8ckg/CA1B6UXr1F1KFaBNy/pkbL02s30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-431d8643856so15120215ab.2
        for <ntfs3@lists.linux.dev>; Wed, 29 Oct 2025 16:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761781623; x=1762386423;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4ohgP/kWGAWCgLzkRSuXf2G22n9q/x2vsu6I4BIXPo=;
        b=gd1jeyXSUCszF1q9jLd6RtdYOu8ThGQfhx8SB9veF+yeOd/d6f4iQ1YRu8f64ugijO
         nd6ISoAHS4WV9VNX+wnRfCLDjqTiA5KfReZddbyuc5yM6gp7U8Bt32cUfbvjqJeBN/DT
         f61JSyOT6dT/bVi6tWe8D+4dEIpehepJ3ezNl7EfBVrVAo/tmQvtvcrvBuGk3pBeyCak
         1ZIJJ/wtqXi7KKB3re7xpEQ2zDghb7OHAThqjlGBStRwOtXnGnoXwYKRA4buBHr6wUOT
         fkaxSKd6ZABF5uion8jCKpqUhUUUSMsxU2ysLHNLGhsrfomeZtLthdnKKKvpvFo3Qmf7
         BgrA==
X-Forwarded-Encrypted: i=1; AJvYcCWdcd3Y9CgdvJiCDU4dFW8R41DiqnOtQVATczHDSsr2QZYbRzmJj582rMUv1lXFxxUNfjCB4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEYNzjBeBXsAENFDDeMBCA2yhrsQzcTuVjVQJQR2ZaghtmQtRQ
	VsxrDqkFICx1+bkelwHPtF6M4OzLkl4X7PUqQElp9ynyPa94YOQ8lgM7HKhU3E1dxvatwFdg15c
	0WpEukuJCi8Dn2oXKIDjgjkycgdnpfcDiVrqQhsy68MN5LpDxNC8m1aUgJYA=
X-Google-Smtp-Source: AGHT+IFlCtKkoBjZVCQ14rcVAEaGC/TrYlK+5JUYeN/+dO89IWGnuhYs+O+4fqOSCTTYeLZC/DzdXHtz4yGtPGLjzHDaINa1Tnje
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3486:b0:432:f835:2584 with SMTP id
 e9e14a558f8ab-432f8f871b3mr64356975ab.1.1761781623296; Wed, 29 Oct 2025
 16:47:03 -0700 (PDT)
Date: Wed, 29 Oct 2025 16:47:03 -0700
In-Reply-To: <69015bf1.050a0220.3344a1.03f8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6902a777.a70a0220.5b2ed.0015.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_fill_super (2)
From: syzbot <syzbot+2e6c1eda2eff0745b028@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anmuxixixi@gmail.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 02f312754c873efe076888a2fdca982e56617929
Author: YangWen <anmuxixixi@gmail.com>
Date:   Wed Sep 10 15:17:08 2025 +0000

    ntfs3: fix use-after-free of sbi->options in cmp_fnames

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11825f34580000
start commit:   f7d2388eeec2 Add linux-next specific files for 20251028
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13825f34580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15825f34580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ecdce5bceba74f
dashboard link: https://syzkaller.appspot.com/bug?extid=2e6c1eda2eff0745b028
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=116e6704580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11198fe2580000

Reported-by: syzbot+2e6c1eda2eff0745b028@syzkaller.appspotmail.com
Fixes: 02f312754c87 ("ntfs3: fix use-after-free of sbi->options in cmp_fnames")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
