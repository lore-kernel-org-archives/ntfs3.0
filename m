Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8128D5CBB
	for <ntfs3@lists.linux.dev>; Mon, 29 Aug 2022 23:30:20 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id z30-20020a05660217de00b00688bd42dc1dso5620040iox.15
        for <ntfs3@lists.linux.dev>; Mon, 29 Aug 2022 16:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc;
        bh=2YEU8MGiYyA7ikKAvgdFuLoxWCy3ALSR6+S8uCZED4Q=;
        b=TH8qnvlblFQ2VTuVIfZCQc6oJdQn6JCpNdBbCBceow9cJD78jQrT13qB7t6TwDuZ5A
         vRUBh55iQTVt76VoAGyoGG+3cyJ84cMmhVnQAQhd3lJXfNqVbhMwki9Lr3Y/08RQb5OA
         c36w7utNKJCqZg8wEa6sGUYDkzonTZCY+VykiMSGsxgA43LyacIeAxc0sBKmIvVvsseI
         zGLvWLGsI7zs5FoU/qp6Qof2f7WVlxAOwCVcO5FhTpSN6YMudtSm9Fc48bLGx3o7YVeI
         BAgTEJjThqnzsw49lJfXTU2nY/gsATy3CzKEAFoWlzOPL42mzY8hdKdd3tAaxYdsH/c/
         xU8A==
X-Gm-Message-State: ACgBeo097GWWmT4HaPYPsaraPUlvqJewY6RUlWqElcjQWpKeAuLViOb7
	QzLhXaUh0GO4Fr6W7eaduAaF9J4BW77XZ+zACMtA9KGlFTDY
X-Google-Smtp-Source: AA6agR6xVVuoLZ6/rTXKMNjxQX7n3CTsaH4W4fuQFpeteUbda0GnuX//1nO3ExzfAKYk4br6zsttFv8iij72pEhhc3oQfbYm8Ggm
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:371f:b0:349:cfb0:89a9 with SMTP id
 k31-20020a056638371f00b00349cfb089a9mr11317806jav.151.1661815819682; Mon, 29
 Aug 2022 16:30:19 -0700 (PDT)
Date: Mon, 29 Aug 2022 16:30:19 -0700
In-Reply-To: <0000000000009a318805e6ff48a4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009d4ad705e769a5c3@google.com>
Subject: Re: [syzbot] BUG: unable to handle kernel NULL pointer dereference in ni_find_attr
From: syzbot <syzbot+69d15cab6309bffae739@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1458787d080000
start commit:   8379c0b31fbc Merge tag 'for-6.0-rc3-tag' of git://git.kern..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1658787d080000
console output: https://syzkaller.appspot.com/x/log.txt?x=1258787d080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=911efaff115942bb
dashboard link: https://syzkaller.appspot.com/bug?extid=69d15cab6309bffae739
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110d306d080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17409333080000

Reported-by: syzbot+69d15cab6309bffae739@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
