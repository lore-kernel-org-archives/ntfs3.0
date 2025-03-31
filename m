Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751F13C9C4
	for <ntfs3@lists.linux.dev>; Mon, 31 Mar 2025 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410287; cv=none; b=H+91+pVdewZ39X+fT9Y5tYp2Q7FGv/QT/GRN43aMo1FOC4R7/7+mAz8hQSbCNbMApoDlbZtkkpEy0uUHXArTNi9kBYV0b7h2TkzQlOAp96VEsUullrEvwsabwh/I+Q2rvevqRsL3juB1iAl5WDzaJe3fxAOVNA/wAZv+YBf2I1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410287; c=relaxed/simple;
	bh=AHpW6yU0VAXcUXJQH2up/YnOzXAT1bNJLZWd5fr4qfE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WJdp8q4muWxAVCU6T7lFyunhHB1e5bhreQNXzYPKpH3ZztBJabzuD5usn3qg6VtoT3/5/04SWtRF7yY8rgYLq3FBjdGhwt08Rw86mOJPcntHs8vd72ihkEQRI1kYd6afaT4VWwj8xo9O7xTksYcolCtRSobcfwkG2lnMVpb0vso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d586b968cfso81696395ab.1
        for <ntfs3@lists.linux.dev>; Mon, 31 Mar 2025 01:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410285; x=1744015085;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0XhSko76xS6dQwKlFvNn8gcZwIvFYVJaJFOWmgG6Uk=;
        b=g0ARyXYv8HYjFEYsh7fhyx9RyDnRbX2Qr6Zx1wzk847WdF3dS+A4A89SLgibsRCoZj
         J8NOHLBxsVFhEVUe1dFZjQHVxSmyGN0L7MWj+AklYRQWyjWgWu5Oriy98j6BbFeaTAxy
         q5tsLL1VbNBhJhP93t6Z5O4G4KGTHOvdg+utj0WMmp1zGBgmXv5I7tEis4u2wOKvdw3v
         KKR0F/rt9D7znB5b8+6NRKq/26S1i4SZkShsR9E7HRL1vcz6cNFS/odymDuWxQHehfgk
         2iIIKLXpHQw2HMm/uT+yjaP7ZHFKzqNv+4K+zTHivLifvGVJlgKHSO3YZo8goq8c9//T
         xCxA==
X-Forwarded-Encrypted: i=1; AJvYcCUla/PwlTkRAiHbFh5VZHCor34ldJb+l3ZusKj6EAx9IseOli64N0V+xNCUNfeQ3+7VrPn9Wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YythytakKpQbIjbGv8/qiHQ2OdZ8PoJpKbwrUQrAi3DcAcg9grk
	4F8OoCm8rcRMzxNILDFVrifvyc4X9X+sQn31jfjA6grkOz0iAsXbeylA5TQ/thOqn+WrzJ+XLoB
	7AUjohY8rfJa+aVnRIQT7ApSBa9hMK+DUbWBavq/viNAKoqgxxcOIG/o=
X-Google-Smtp-Source: AGHT+IFRG3llkE9n2azczEn0soV4LS4Any9aCQkZdRff7a4WzuZUPNjvO7/Xv7ywy67eNnJsy44xehqHoy4lXBXylBjy49Kb3uLa
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3386:b0:3d3:dd60:bc37 with SMTP id
 e9e14a558f8ab-3d5e0a045cemr92625735ab.22.1743410285527; Mon, 31 Mar 2025
 01:38:05 -0700 (PDT)
Date: Mon, 31 Mar 2025 01:38:05 -0700
In-Reply-To: <164841.1743408370@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ea546d.050a0220.1547ec.0124.GAE@google.com>
Subject: Re: [syzbot] [afs?] [ntfs3?] BUG: sleeping function called from
 invalid context in ovl_cache_entry_new
From: syzbot <syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dhowells@redhat.com, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         4e82c870 Merge tag 'rust-6.15' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1045c404580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56c806e1bbb36dee
dashboard link: https://syzkaller.appspot.com/bug?extid=54e6c2176ba76c56217e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1569c404580000

