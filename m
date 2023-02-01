Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F32F2E
	for <ntfs3@lists.linux.dev>; Wed,  1 Feb 2023 14:55:24 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id r11-20020a6b8f0b000000b0071853768168so6550158iod.23
        for <ntfs3@lists.linux.dev>; Wed, 01 Feb 2023 06:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHi5bo3BzN4qPZ3mH6tPOGWzgbCBFQ/FU5LJ+gZiS0M=;
        b=nSeIcRYC+KeOENxBJ1Ct+ttJ/5yZ7c1gTOMEshlO/XciMEyMrBffbtB297vaM91OeD
         9Kpt5ZAl0VtJrYJMbELWlgJzrJrcLin1XtF7O9qBe5fwexGaCSyvl7bGz+mLGOT+KuAL
         6VzZkaIXs0zDuhqvRctST4eqTJg/fWu+JshxrH5sHIaGQFZH/9wdN0Ewbd8e3hmI50Z7
         Kh4ww115uANsid/j/tcBTeLTaUJdU/v3ZZu0n2bj1n6kkccCmSMjJdvLvWc2AVAzbgxW
         NuOsSTSJGYSDGphDn+LSB41mx0eH+ywZa5FxcDhtW9lvPmOckIi4fzN7MzDAoaKr1XOR
         KZgA==
X-Gm-Message-State: AO0yUKVMWsKN11wYtBytyH+eAnpsIi/epw9dZKiJaP3QnxPyU/T89LX2
	8YKa2hVuftIwS5Y0wCNmR4c1htj9gJToCBB8DBceFBM8ZX4m
X-Google-Smtp-Source: AK7set+UGIpl3wTKHaXpzg2fKL3h3H9zyaLxeaTVojjCe5oJvNoD9IYP7owJ4jx6i4ZQp7jUcj6Al1H/hidiUGa7GTzzorVtLAFy
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:9468:0:b0:375:c16b:7776 with SMTP id
 a95-20020a029468000000b00375c16b7776mr540197jai.54.1675263323110; Wed, 01 Feb
 2023 06:55:23 -0800 (PST)
Date: Wed, 01 Feb 2023 06:55:23 -0800
In-Reply-To: <000000000000fea8c705e9a732af@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000047848f05f3a4a32f@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: use-after-free Read in hdr_find_e
From: syzbot <syzbot+c986d2a447ac6fb27b02@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, pjwatson999@gmail.com, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Oct 10 10:15:33 2022 +0000

    fs/ntfs3: Check fields while reading

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1268739e480000
start commit:   55be6084c8e0 Merge tag 'timers-core-2022-10-05' of git://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=df75278aabf0681a
dashboard link: https://syzkaller.appspot.com/bug?extid=c986d2a447ac6fb27b02
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164e92a4880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=126f7ac6880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Check fields while reading

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
