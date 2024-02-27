Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413E8468E
	for <ntfs3@lists.linux.dev>; Tue, 27 Feb 2024 01:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708996144; cv=none; b=BZ43jydcdOH1a0IyPe9dU7g3UBBnjMWmgfjBRc4VWDa57f67ub+pp3TS+LfNjGk6FIAxwmaN9XQbZhChdXaJUpXSyogr1tn8g1NCrg8WldAu4h7e8/ly6k5pj4ouxIWWOEECML5pjiQTY6wiMIz0wPr9LAuj6+Fu/hBYJGOP+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708996144; c=relaxed/simple;
	bh=kzoRrXh08bElKHfj1aPeK5wEZBKK/c9vqPFeUCMIWnA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oafhKke5pJp6TLJlcoYU+tK0pU6TaZ9oux9uDCVppAOkgaAawzfr5b87i/K3ek5JGwqlFHziD3ufvy/IIawM5DkFKw4eeDEwMENSVq5Go9Y0sA2An+6378r0Tn6uhvnKv8eTMORlBsLqKLwJCaFE1chyDUJBhUF+PzjNUEcPLEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3651f5a357bso25923825ab.3
        for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 17:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708996142; x=1709600942;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aktuv2KRKCqLRwq94WSyQgX3rAr6mzRgiYzRkrGsztc=;
        b=mib6Scs9VfZp0muNq4UFK3c2MK3GJUrhrgOqlO4ziO/hsr7iI3E0iOsXJRv7K+mwRr
         rubhmwYkl7ihVPaC5LDpI68/F2hU2M7lQHSVDXvaozyPxRqvFjz4RNOlT/5KKIdfVqXS
         bnuRUdZfnlJbHFYIAG4lESgJVkrN0630MDtFHJGtnd7kJe+hMwsSZ36ipM4MjVAfJ0Jp
         F95uTJ006+Zo4KEDzoJcw87zwPZezktZFDusJn0n+UqWH44lWs4tpqeGf9F2dWq/12ic
         Xkf0j57lJXXRZ3T9T0IuQP/FYgy0IuVCD144NF/QgaEDeILQdsMDL8Wc7QL9GmqE+uE7
         zBuA==
X-Forwarded-Encrypted: i=1; AJvYcCU0p1FDkKBZ+HKr8C3R/LQKMsJLu4RNZKfd5mkrrTgQihEEC64pO+isW7Ol4sRrN7naFaxMxgZB1XJ9zLyj+8aOvVwm1fY=
X-Gm-Message-State: AOJu0Yyg40wEEuNTPOarDmJVio0hbvNx5r4jO+mgVk31WYwD7GTx52cZ
	n1cyVgZWs88lRyfHKRbkiJbudU53UWFWx1hRPEn+UkYU41eKKmKxrZwv8eSgbVnScOcYztd3lue
	pr6CZgDkVHrSgOXQ8aLnCuW9qcYcg0FfcC5blj524OPv7gDBDS8OCNyQ=
X-Google-Smtp-Source: AGHT+IE1wkVsYou1Utkg829CH1m2uRacrTIEQTXsrl5dubL6Fav7LdHQpDU/SJebyUC6BahX5BA+F53OQcjQF6i4WPT/D5AWRTlZ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:358a:b0:474:96f7:a3a1 with SMTP id
 v10-20020a056638358a00b0047496f7a3a1mr45049jal.0.1708996142473; Mon, 26 Feb
 2024 17:09:02 -0800 (PST)
Date: Mon, 26 Feb 2024 17:09:02 -0800
In-Reply-To: <000000000000cc261105f10682eb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fea5b1061252ab7d@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: use-after-free Read in ntfs_lookup_inode_by_name
From: syzbot <syzbot+3625b78845a725e80f61@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16ae7a30180000
start commit:   cc3c44c9fda2 Merge tag 'drm-fixes-2023-05-12' of git://ano..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=38526bf24c8d961b
dashboard link: https://syzkaller.appspot.com/bug?extid=3625b78845a725e80f61
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16eae776280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d273ea280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
