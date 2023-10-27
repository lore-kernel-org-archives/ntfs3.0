Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73124881F
	for <ntfs3@lists.linux.dev>; Fri, 27 Oct 2023 05:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-581df11b5b4so2407804eaf.0
        for <ntfs3@lists.linux.dev>; Thu, 26 Oct 2023 22:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698383464; x=1698988264;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYRbdaBgJS+wSJ4gmYrUGgqbPKYTSmw6Nqiyq4u7xTs=;
        b=waMcYtsyvIYe3XqAaKVKmBxzxstxcO/97r7LLIhlfyWipSR6tvNxjHDyXWfWpfEHrx
         +2083VXySEtPdLIY1dpHARklLKO3PC6YEcj+DF65hTNv21ejYL+r3509YdaacgrbLRHc
         oBRGwrME33pOLeRxU32UNO7eR9SAPIT7WRyVyrQmXD/KtFaiDCxrTerpwKkNGj0X1cTp
         yrkwHzlswlw3WaXZQFb8iDDJ1XIEfvzRMLtX3d/eM28oJqD6z43HFJ8u+HEDhbBeiVVx
         Myu0tCLRusmcriEnvM4y8G2xZ5eqfkkU2EBIbCjM0T97o+TcHklVfQWa9SoRsaS/hCkU
         39Lg==
X-Gm-Message-State: AOJu0YxuJbXxqhDQt5cbBhVGYlr4scuVwJedKchix8skaRA3l/vZcCIX
	VEz0eDmEuZPHuzRiF9mhL/6yv34lSJbOaR3CMyykUcYFl3nJ
X-Google-Smtp-Source: AGHT+IFdDepfBdz8j2YWRcZSFB2dfFx87KPOrv4q6e9N8Ug/QH/LE98GYKgHIneccbhlUkeKjg1dLUe+WtPm2/q9DIqUn81hzVTW
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a4a:ea4a:0:b0:581:e2d5:a088 with SMTP id
 j10-20020a4aea4a000000b00581e2d5a088mr478614ooe.0.1698383464607; Thu, 26 Oct
 2023 22:11:04 -0700 (PDT)
Date: Thu, 26 Oct 2023 22:11:04 -0700
In-Reply-To: <000000000000f3aeec05f025c6b8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000019b7280608abb7f8@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in unlock_page (2)
From: syzbot <syzbot+9d014e6e0df70d97c103@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, n.zhandarovich@fintech.ru, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 013ff63b649475f0ee134e2c8d0c8e65284ede50
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Jun 30 12:17:02 2023 +0000

    fs/ntfs3: Add more attributes checks in mi_enum_attr()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10677ddb680000
start commit:   18940c888c85 Merge tag 'sched_urgent_for_v6.3_rc4' of git:..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=acdb62bf488a8fe5
dashboard link: https://syzkaller.appspot.com/bug?extid=9d014e6e0df70d97c103
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15bf0adec80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1391fcd5c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Add more attributes checks in mi_enum_attr()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
