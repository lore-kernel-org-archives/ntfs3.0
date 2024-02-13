Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DD410A05
	for <ntfs3@lists.linux.dev>; Tue, 13 Feb 2024 18:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707849725; cv=none; b=H51M2m6eBZilPCh2Qalztzrqm0XNULIhFswTXdKb95MRdlCitU+G8xuL8q2w9YVke08/fqK1Zcg/C36cYfeJCkKZ82JiQfT+GzoGMJ3TMECieJFBDei13di0k+6e64t7Onh4yF/7bsmlmZVa20FmsmghilGw2wUW9aNAvvvx3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707849725; c=relaxed/simple;
	bh=gGTofCRKDI0Z9TW+TeMYIS+KXW44FQb7kapqG3xt0NI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Hz0mc6uyErJtXWATX4JAD9eWKI5w4Cmi1b+H4fEhOJqGRFCHtDWSs1xLFVZelWo9RNLn0kQADIJdbxjCINHx5arZvJRC3GO8uFqr+q/2182BGlRapM2Xhcn2uK5XNi2Lea+TxslyrDUKl6nZ7Vl4hPHR+HuEtYP2Wf6ULy3TMe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-36381f0e0a6so30647525ab.2
        for <ntfs3@lists.linux.dev>; Tue, 13 Feb 2024 10:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707849723; x=1708454523;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiiASvbc7a26H8Bub12QdvoOFsqbdc7cNoE+2hwgvwk=;
        b=tmEzvZo2RQZDovyRsieqOH3qwTvwTlo3GRbwjFxksE+enPWwuzRQ6vWXwfhWqn1jXQ
         xpw8n/egSZgFPfDBfrnN/eSFaXFvPcxD1QGo5X6C5eYbdWakRfcoL1pbMnvehtLjUyH6
         7Omjd5CdIlaFHSdhu8sAq344WHdBxhUYe9lr5cHlbPKb+GlcWIGbfxHqmfJTn8MTUa+B
         9Oh/K7VDzztvp32S39xndEarWBJK5Fun79lsyHPPfqb1WW4I/VO3IKmA3xKO97gvsC62
         tz25JV07zcGVjGk8BsYMrDpZbsCnkb/xWts14/s9WY5x80wgSddTE7SQ+7daZJyhSoQQ
         zHGw==
X-Forwarded-Encrypted: i=1; AJvYcCUEl3aB29esTiVDhyrEJGmzS8r/TSbSX6K1nVAnluSlYrFd41NJpAR6/C/tj35UOQOEgRih1dwY67IpCYpa1NGDgyy/VuI=
X-Gm-Message-State: AOJu0Yx1a9fl0UQ9FNKIcQuGQdVTaluXqy1L2K9NYQxtTq0Nu4Yf0scH
	9x++zsD4LpeOmIxVbiu+zpYNDMXaI85kKqg+hjO4qLiNozy/9rXi/bkrZrScZZ7V7a+t0mpba3X
	wTZvH++3u+Q6sVscAPmBXVxvpT9nItJGGS8wdFLIz9PARFuSUyoJ+dMs=
X-Google-Smtp-Source: AGHT+IENo1xPvITOHRQQJ+M5KbsV17Ysd+dOGuZAlsgGB+yI15qx8x+sXPoucnIA7sf0wLWSQPaLwLfwWQ3yIBkYN186lvWoDH8J
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a03:b0:363:ba7e:ddc0 with SMTP id
 s3-20020a056e021a0300b00363ba7eddc0mr30763ild.0.1707849723685; Tue, 13 Feb
 2024 10:42:03 -0800 (PST)
Date: Tue, 13 Feb 2024 10:42:03 -0800
In-Reply-To: <00000000000042f98c05f16c0792@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001c3739061147c07d@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel paging request in step_into
From: syzbot <syzbot+0994679b6f098bb3da6d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10656c42180000
start commit:   bff687b3dad6 Merge tag 'block-6.2-2022-12-29' of git://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=68e0be42c8ee4bb4
dashboard link: https://syzkaller.appspot.com/bug?extid=0994679b6f098bb3da6d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11307974480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c567f2480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
