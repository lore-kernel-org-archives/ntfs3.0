Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3511A3BAD
	for <ntfs3@lists.linux.dev>; Fri, 20 Dec 2024 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733566; cv=none; b=aO8SlZ3Yt0+vDiCzk7A3k7H43H4SlpoBKX3Jy0h02jYusGR3lPpAixxAO9Gre3BQAf3AkXixLwD0ezej1fETG0bL6YUwW9aK059QaciMrvQ+REWfYkBEYkvzKwnbAEcZl3OiEUwfrrTNesAIxqpo29i0i/JWdpLXNuEv4yp5ssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733566; c=relaxed/simple;
	bh=tlA1xoE0ZwtwwYZIBUilAcdFv5OAyxFCiPyYo6KnVMM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=l9IyY/LSNiVpT3+kusvB+XTNj+L2mkfoCRWmqXaq/TN+fY+lvwhJRErRY5SYyhmj2QaUQpeBnEoGs7z0abqfxQATe3/Uk1Jg+vfsTWzxg762x9tycqWdRgOOsQ2SwDRPCzGpFtlW4/oYfxzSlgzrhIG7JTntyhm7fTLygufn/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ab68717b73so22000995ab.2
        for <ntfs3@lists.linux.dev>; Fri, 20 Dec 2024 14:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734733564; x=1735338364;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Rx3fNUurMq69PIQjM6g9cWQrXARh71BExw4C2cUzNI=;
        b=m9hYFMsSynlmNNjY7Hym1G8YwGHYh8llJX5B8qTpJKFqw26YvRv8JTLomA9tYlYAcn
         zilWHmSqoAHKFqwWdXXkRESR8tzkO7/9bxprm/uXWpQEYS/KGXDo5z6kO6iZxjKgaKOH
         8N3S0Lj+mkO5hZ/wTTiMHZrF4qcpsVFNl/QXHlnAHYGrRtRNy/kk7oJxJHemAqj7ddZe
         kBI1QcRuCn0yrJtBT5oM0FN53SmpjE12Uhj/pBwZlyhEIZML2gRLWzb7rRP1TPGggI99
         mfqd46bXFbsC+5j2N78lmuobAlGVKlAtwt+FEvx++hR3LgWO3nE193a7cRablQ95bdGV
         AQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUFeGSWrFXZhPYoBIqWl/Mr1HJbdjBMuoF/ow0zCo+0SxqahpujOwaC4ZcNu39gDNohT5up9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaVXG/M/BSIfRCL2O6tYhwNORijT2tzhZAI/XH0m6Yma8Jo57X
	4zrXX5mZonbeJWp5MDQJXMp3I542MDWxcua3y6lfJXvY2WZNaLAth1cY0cU+r3p12hWrsi9Pkk0
	MtoJB5vmk1OS/wYsqlshU4Pt/mCFq7HiW+nkYNE9FxaOFBkJgLdMQc6g=
X-Google-Smtp-Source: AGHT+IECOm8faufgNwCWsdaVlk8VT2b8H3xChbuPM7/dZ2ABf45szWCAXkI7l9uVDxRHS2zhm36NkW8oWc/9GbmZznFInjzyX5KN
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:219c:b0:3a7:98c4:86a9 with SMTP id
 e9e14a558f8ab-3c2d5915ea4mr51049325ab.20.1734733563824; Fri, 20 Dec 2024
 14:26:03 -0800 (PST)
Date: Fri, 20 Dec 2024 14:26:03 -0800
In-Reply-To: <672dbfef.050a0220.69327.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6765eefb.050a0220.226966.0000.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in run_unpack_ex
From: syzbot <syzbot+731b27ee9413ba859499@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 5fc982fe7eca9d0cf7b25832450ebd4f7c8e1c36
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu Oct 10 17:09:24 2024 +0000

    fs/ntfs3: Fix case when unmarked clusters intersect with zone

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17286fe8580000
start commit:   baaa2567a712 Merge tag 'mmc-v6.13-rc2' of git://git.kernel..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14a86fe8580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10a86fe8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1234f097ee657d8b
dashboard link: https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11660fe8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12ce62df980000

Reported-by: syzbot+731b27ee9413ba859499@syzkaller.appspotmail.com
Fixes: 5fc982fe7eca ("fs/ntfs3: Fix case when unmarked clusters intersect with zone")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
