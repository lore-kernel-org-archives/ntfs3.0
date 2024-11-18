Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA514A635
	for <ntfs3@lists.linux.dev>; Mon, 18 Nov 2024 06:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731913085; cv=none; b=ttedMGJjsYRVpya0+NtmOmZCB+WIOkvRBeYeoNWBvzISJOBQwaoS8GW6Ou4qfTzBLLIRsG8XOrEDEE6YTPsLlBJ4k1XoOn1qTt1XkwdGAy0rhXoA9OyVsfhhmdsDEF3Exy2w/56ugWcxIu1HPKFpe2PvgWEtbHDajrOSDoYf4+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731913085; c=relaxed/simple;
	bh=xphumfc+8v+hZxlhemmR0uazoP3uH9uQvMf4ECWjmcU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YK3TY8WMuOTARkzIaRZSX1KqpsdxauyF2U44y4clwj2ZsjGOcIwwUrlBY3ClmfiC9b/mh9h51wKTWexohxKO00b2+QUzAiaCogI12Ob5iWn3KDVz6cFWOhsiVVpnh+vFiMxirr+M/7XpFB88ftpKAsumwqWjLEB9XCirVibhBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a7162d1485so42829125ab.0
        for <ntfs3@lists.linux.dev>; Sun, 17 Nov 2024 22:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731913083; x=1732517883;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTxLF36+Z28UFe0muHYp/+Q2EWoocHPS7WBe2Dr+vRg=;
        b=U6oN6YCUKS+SybElAFn6WUdmM9wnzKVFdEXFlNBJY2XNzWVWpHaDXq2IzQ0TabaDep
         /dXLertPmLHrS2e9ZDneVxhtvdcpM66oZnD8/tIhwbyox04QyIGBoSMNZXEfnbLSqtq6
         nRrdJA47SXsr0K7n/q3Mhz38NALszp/A72SUAjoK6LJWONTmYSx7WPS2vR7ivVNRmsm7
         299RXavvzFEeM/MCa3D+g3Sb435+qvCpfTKEqMN+cbBQwoWExe5kk11w4wqWGYjrfwYd
         20zzZ8EJlfw3fIvaK1Z0QE8BvK82lGBoZcDuO053cvjvrD2EqN+mu5BQhmVobOkW66Dz
         DJbw==
X-Forwarded-Encrypted: i=1; AJvYcCXY01PEgmiePuRhKgE3gUUY7TXy5dZB5lxcLhiRbzNDhzuJCsW12NhH0BIE6rOq5skp0ytB8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh5dEKDfdvVyK2EsfhVFeVVA43zGesj8cH7zgx4nsKbeVM4XGt
	rFAMX3Vq36a4Z90VRvmrJlCMzjuevZL/ejHacEiE2+JXI1j9CirmQngWtYsaO6uJwTe7NDnKzoK
	Ifxa9Q3QYD+VOwRDevmtEUe3q5xqCWY3/c0yslnVORZLUFSogkyKDAMw=
X-Google-Smtp-Source: AGHT+IHykOYzKiqHu0/8fmHWY2+qsP6dgdXZ51ll9DidWZFeQmHKuBeoMcXUuokaEkqdT/NY2QQr+X8bO8wpwKvRARIGH55UQqAg
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c28:b0:3a7:66e0:a96b with SMTP id
 e9e14a558f8ab-3a766e0ad62mr22425045ab.7.1731913082968; Sun, 17 Nov 2024
 22:58:02 -0800 (PST)
Date: Sun, 17 Nov 2024 22:58:02 -0800
In-Reply-To: <0000000000000fc50405eb48a1be@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673ae57a.050a0220.87769.0025.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ni_fiemap
From: syzbot <syzbot+c300ab283ba3bc072439@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=120c0ac0580000
start commit:   d537ae43f8a1 Merge tag 'gpio-fixes-for-v6.6-rc7' of git://..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=849fe52ba7c6d78a
dashboard link: https://syzkaller.appspot.com/bug?extid=c300ab283ba3bc072439
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1056076d680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17093269680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
