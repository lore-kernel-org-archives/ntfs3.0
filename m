Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A22149C62
	for <ntfs3@lists.linux.dev>; Tue, 23 Jul 2024 23:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721779085; cv=none; b=XgpMDhb3aGNkbhv7pR5QceV+kkQ79B9dGw1oXe4z7KJw8u3xlk+55FN4vpyxTi5Wme49mCJGN6V6HOblXyuXxCSV1L5DKGvwhqbU7tN7+XbmweNt3jazSV2hGRtc/L/qnzKg6uIJkeKI/Q2TaR/PCQguCR8h5qeaExUhyxjk7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721779085; c=relaxed/simple;
	bh=hjOYStjjoYX2np0BHeHR/g/Tp+auHJmuVRMt2T6GoEc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Qq79yR6jvQsIa5jixPjbDa1FrroOGOh02Ji0LJK8Ty7pRGgmoQJK0f9aF3Eva4BEzd+ByVgpN1jg8VY78e4P8xQByIuupysL7GBrD4/NUYjhuxnWnBTHHuDUi7uzskDqhZobC6W2EKrFRRWjNzu82PozmIY6yuksoAbKinQ4hQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-81258697716so1039224139f.3
        for <ntfs3@lists.linux.dev>; Tue, 23 Jul 2024 16:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721779083; x=1722383883;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgOyZUlzEMZOpU/YW1FXvWk4x0U9V9/l/E3qzG/wK8Q=;
        b=K4gWOFeC07s2HGfGkGcs/yFsYeEvtHXv37G2E9WjdFzVgwU4utck+D3Cs/5jq9DZcv
         nT/b5pMgAxkqb66DdPJkHUKqqr8YCxHPvdQigK8RD/5shF1eKA0LpnQlv0Ozwc7rcQQO
         TrwGOqThCaCeJwmOUtR90VBJ23dPuaQ8eWLWQYauyp9jzdzXD+mGl3QgKhQaFnv2n1bB
         bwDRi13bUH/+vUXEMHjfiU+PW/y6Ibwbrndbi3Szzo68UizLeLpOgzxoXQ1RnVbH4PmN
         P1WO/joPOJ6w5s4vxikD+qv8HFIL9+MwkAQi9SQxldcrKx6Lbf+WxQLSnN7AWo66VpAb
         z3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXBKvcyL+V/64EZFn4z31hG3weswLQOnbThdMlKpRUU2AllWdDFNzQMUFtsSCLrsHLKQcio3wvzxXWnGZIqCHA4D44GN0=
X-Gm-Message-State: AOJu0YyOlEQQGBYR5Pl9VShnXbjzDoajnPTAkcU8OnIu7DFggKnnDJCj
	dhtvDCEfkHNGIcCFuu6EKpxyzVKytho0DAmSS2VRefte8ndLudW89RPM6D/H+y6UTJl3Sb6UcIx
	sp6sWRw8Pe6G4YoSMBKbn/3pcDEQdTxNfuf61Yk3i0Tpt6WsN5pujB7M=
X-Google-Smtp-Source: AGHT+IEzZornDDZMpWDzFdkE+q/FriUsjqZ+4sHmZEu/bJAB9hWGgnKawl2seZVupWtON8ikupSSpqqlgz3tPuyYT3PdwKwJZ6Lc
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20c6:b0:374:9a34:a16 with SMTP id
 e9e14a558f8ab-398e7de7b70mr8748705ab.5.1721779083711; Tue, 23 Jul 2024
 16:58:03 -0700 (PDT)
Date: Tue, 23 Jul 2024 16:58:03 -0700
In-Reply-To: <0000000000007cfb2405febf9023@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000aaa8dc061df2eef7@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel paging request in attr_data_read_resident
From: syzbot <syzbot+33a67f9990381cc8951c@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d4adc3980000
start commit:   b57b17e88bf5 Merge tag 'parisc-for-6.7-rc1-2' of git://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=88e7ba51eecd9cd6
dashboard link: https://syzkaller.appspot.com/bug?extid=33a67f9990381cc8951c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12493e98e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1334b4a8e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
