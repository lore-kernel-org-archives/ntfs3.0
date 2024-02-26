Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BA12EBF1
	for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708959606; cv=none; b=IN3xfm0Syv8Vs5VaTsdecLWESGHhw0EcGylq98LF1CAwa7yng4R/B+lQhacN5/ar2AwkrOB2IXdX/HIWW7TQp9FGy+LDFI8CQVu5kqbwgSAM2uBTAMYdUt5xxkCg39sVhRU65luK/80xuweTwYroao6rlYx3OyjQ/bOBSBz7ZHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708959606; c=relaxed/simple;
	bh=eHf6DhQsK0KZCPXgcrcFLMEU4s/axWJphZkoUqovX0s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rfsERAsWChIyW1gfWPfSTObxPzCyYsEOF71gRZDJt7FAYEjQ9dScpRKyqmjFXc6uXfkuHsBk2eoXaaKLA2bM8/WbV7hr25Iiz0BqbdIf1YXDQ918SG3pdAwtoiqQMMNCA/HGW7D4nxpT2OK2VAimXp8c5EsDCVqTG0nEXW2nND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-365810221f3so24793835ab.2
        for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 07:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708959604; x=1709564404;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWnimLAcCCtkR0KSTmxlZv4XKOQ8UbGKnAa9ZHp8bn8=;
        b=eqYoVqvCulThQaLcpl1uNhslQQeErf/R5/aWNSQxFY0fDHPy0F6qy5Wcouq0JTykGx
         OprbzyD5tAtdOsKGj5drPZeNPmGPmSFZTkWEeApv19+S9QCLd/KKWWUHltcmXKt+9Svx
         Od9EQ4i9SyeYDySx6uEhk1WdlhmrEjFnU7wAPwVas6MyhYSgNBbLoXEyv91cq/AqqKQP
         xofdWzI1Jqgz/I/dnRVOjJ/EbEYJO/WW5jErkoEobkUXcZfwGoK6wRUwttohBLfE4Nex
         E2+ioqc3XYVudtkWQNpzH/Zt/ArThTbd+OnqZu2NQuhjsKy/r2Rc2htPH2dTtF+3RBoL
         ur9g==
X-Forwarded-Encrypted: i=1; AJvYcCWSOE3d6E3ziFiXwNLhCdxM4NlJn2QjKjXB2BnwoSdgZG9OcoWVxxXdRdQZoNrC9rrCcWoFTWHXoazYvdXx7dGT6s5X4fA=
X-Gm-Message-State: AOJu0YyCOUK2XuqcA4WkmjeFG9C/9kWFuSHz5JP3XauOEeVpYQaEp4gM
	toPz+F6q0e5lOK6WM9d8GEKWLfFw1EAHAG6bWETSG1cImc9zW/TChA2nAsHUmuKPVlHtKzr9YWp
	qgQ6uvW2ZLfyJIyKaaAgzqlTPHUxnvyt4OdXWZXKpvQ0SF67vs5yTCaE=
X-Google-Smtp-Source: AGHT+IGzpCE2nfkAg7pqbTcBeh9cTuldlXFttxjcewZTsZ4GZdTghVX1twDE6ea2vwl4aPcyM9GMOXvl7BXzuKiAcjQlhh0h57no
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1562:b0:363:9d58:805b with SMTP id
 k2-20020a056e02156200b003639d58805bmr363419ilu.3.1708959604738; Mon, 26 Feb
 2024 07:00:04 -0800 (PST)
Date: Mon, 26 Feb 2024 07:00:04 -0800
In-Reply-To: <20240226120623.1464-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002d120806124a2afe@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_set_state (2)
From: syzbot <syzbot+c2ada45c23d98d646118@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, boqun.feng@gmail.com, 
	hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+c2ada45c23d98d646118@syzkaller.appspotmail.com

Tested on:

commit:         d206a76d Linux 6.8-rc6
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=10dec3aa180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fad652894fc96962
dashboard link: https://syzkaller.appspot.com/bug?extid=c2ada45c23d98d646118
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=163e9a9a180000

Note: testing is done by a robot and is best-effort only.
