Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28493209
	for <ntfs3@lists.linux.dev>; Fri, 20 Jan 2023 20:43:27 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id q12-20020a056e0220ec00b0030f12525001so4509651ilv.10
        for <ntfs3@lists.linux.dev>; Fri, 20 Jan 2023 12:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RsJ1Nljpon9SLJurOmoC1BIAWmEt4UdFJ9FMAmnjneo=;
        b=gpSQ+0c1pOBATXnfCAwS+yym2pbd9uYHy0AFHF3nJA6YL0tHV2PbKFg6SkrI6bdpHE
         lf2TTh+ba8+PYyBT2DAZBfG32a2nTjlXeO+TRCeQ/UaZwk2HO/CzU6HHhaXevSPWxpej
         GNEwJtWXWexThDsSei1/5jRsLYtaW2ItPGkLmINXgnlV57MXXufYCpE6rLYHekg+95LZ
         shma2G/8v6mQAiUHwo1QnseGqb2e3P18saLO3n0mzWgipqB/s20/Ebn3Vfxsp0HhJsMs
         gcG7hxYZyM1DD8ampuV3ffcLveWpIM2nReM2zrSOHAIpiQgRw1Espb4tqLON2/A6Z3wH
         n9Aw==
X-Gm-Message-State: AFqh2kokHpJB4o2gQNJ5Ijmj5u7gtzjm8nGKFx7rQ5ySqRv2WdO8O9UF
	Vna1CW6tcqScZqoEIRLfTVItTJl+UXy8KQeaQ9ScrKP/5eXg
X-Google-Smtp-Source: AMrXdXugkmh4J5oclZpzPC4l3wq8MtWaI/4oNpFKdaoU/Q/TQ1+7KkWo6QQNdvY0vIjcfwY2XI3t/sIuf/zDdHaUGdeTDCuRUek7
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:515:b0:3a4:a464:27f1 with SMTP id
 i21-20020a056638051500b003a4a46427f1mr1390769jar.253.1674247406806; Fri, 20
 Jan 2023 12:43:26 -0800 (PST)
Date: Fri, 20 Jan 2023 12:43:26 -0800
In-Reply-To: <000000000000fd3bbe05efb0d1fd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f2f0bc05f2b819c6@google.com>
Subject: Re: [syzbot] [vfs?] [ntfs3?] [tmpfs?] WARNING in walk_component
From: syzbot <syzbot+eba014ac93ef29f83dc8@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	hughd@google.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=156b1c56480000
start commit:   1f5abbd77e2c Merge tag 'thermal-6.2-rc3' of git://git.kern..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=176b1c56480000
console output: https://syzkaller.appspot.com/x/log.txt?x=136b1c56480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=46221e8203c7aca6
dashboard link: https://syzkaller.appspot.com/bug?extid=eba014ac93ef29f83dc8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f5d83a480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1727f4b4480000

Reported-by: syzbot+eba014ac93ef29f83dc8@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
