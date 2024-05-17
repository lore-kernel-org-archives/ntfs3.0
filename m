Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF912FF72
	for <ntfs3@lists.linux.dev>; Fri, 17 May 2024 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715963346; cv=none; b=ObpnRwsvFKSjPdJHYTB+erznmlKJjGoW//8G2VdJAWS36gUNuY3T2HM2eAEvrKxema7ZJ4nh5SjZYU86MFbJkrXcs5myQAMMHJZlT3MVZbl8vredGNP6euuBUKCbGFurifhbk3VI5uF9zof9ujmR+WDi4I507nG7kiQ4NAlN+WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715963346; c=relaxed/simple;
	bh=A0l1biPmh781DV/HZQilyuVGfhQUzNsWAV/svLQy1H8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eWqxBrtNY1gSA0yCJIQMyQQ2SRBs+F3ogVa9KCcX5WrWGLW+x0tOH+9pLExUSUm1SDsC6iWzKSBggvcrBbqgsq7UlRP8TppGXxcwTrm6rMc9rr1qZRjkCAi9bg1Mew1b1COcbMa58YoMAuXqOxH5o5u+4FKlFo8wIfRr9+5cpbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7e1e409d1f4so631544939f.0
        for <ntfs3@lists.linux.dev>; Fri, 17 May 2024 09:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715963344; x=1716568144;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsObFqL+Ghmp/IYp9hQ0PuAh2qoGln/YEOD0/ZgXel8=;
        b=npGs6MftAlpuD/X+yegxX2ck60OdBxRjbEA9rlqbFs6YXsANy9AXKOEUihFlITRwCj
         SziAIq+QAYg1nUax/m/msN7xRFnaL10ZGh6O9zBugbY5YGxZWHz42nZ9csR3XWZ3Vh8s
         bJ3oN8wQnxnRkkQ4D0ovwgTB3+Q5VWcursilt22Jg6v5sP1sOmVctxOBMRED0olYCOdQ
         5kCSF/0KEC+n+ThSmVHz+OnAIgnF1TH3eBJA3lAs4ZpnTul5/3xL07R93z/PFaXDNy0J
         f+OlK0HFhXSwsOrOVwh0XSNXzuHzJFfMQxbH5ODAc+RIzcZcexdoGFhxvwK/Nvp3sVKX
         ESRA==
X-Forwarded-Encrypted: i=1; AJvYcCUMInDJTneqju9Ddh58/GIFFL+GD/batWx5a6aS3MJZovif1l5+Yew6dqD7/GnMi6kqay+YUpAvCPoiPbTQtBbDVaA5TG8=
X-Gm-Message-State: AOJu0YxSfq9513OxkPef8jiTYGtcKSgfLSEeJcDpQ1FLW9oAd0fwsJPI
	vWjIzMU12enooEzJWjBEWBzgXFiSfXi3zDzutkKYzJz++511CVEebd6trDg0hVtDzP9xsRXEJ2P
	jzqDo7ro1Ljyjgdl4mVQyDctiXNLvTc8+g49nTJpTsxCK0TWQorCHfJg=
X-Google-Smtp-Source: AGHT+IGJJGcpjdTLU5VW4ShRLcsJbiqzr+V2191f9uvaiH6IuWNuq02taQQQhJXzqWwMfkWPlghi3GdQAbaxORRhDagrnlcmNhQP
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:872a:b0:488:7a00:9343 with SMTP id
 8926c6da1cb9f-489589c27b6mr1543251173.0.1715963344596; Fri, 17 May 2024
 09:29:04 -0700 (PDT)
Date: Fri, 17 May 2024 09:29:04 -0700
In-Reply-To: <0000000000001a94c3061747fabd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009a41c90618a8d96a@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_mark_rec_free (2)
From: syzbot <syzbot+016b09736213e65d106e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit e0f363a98830e8d7d70fbaf91c07ae0b7c57aafe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon May 8 07:36:28 2023 +0000

    fs/ntfs3: Mark ntfs dirty when on-disk struct is corrupted

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1431b56c980000
start commit:   ea5f6ad9ad96 Merge tag 'platform-drivers-x86-v6.10-1' of g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1631b56c980000
console output: https://syzkaller.appspot.com/x/log.txt?x=1231b56c980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f59c50304274d557
dashboard link: https://syzkaller.appspot.com/bug?extid=016b09736213e65d106e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16340168980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=107e7f04980000

Reported-by: syzbot+016b09736213e65d106e@syzkaller.appspotmail.com
Fixes: e0f363a98830 ("fs/ntfs3: Mark ntfs dirty when on-disk struct is corrupted")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
