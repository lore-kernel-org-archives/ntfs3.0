Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE0DEA2
	for <ntfs3@lists.linux.dev>; Thu, 29 Sep 2022 03:19:24 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id n16-20020a6b5910000000b006a3570db9a5so8984410iob.23
        for <ntfs3@lists.linux.dev>; Wed, 28 Sep 2022 20:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=k8pU7Bh5RwKCMgP211NYW62QI4BarLz13ohY+19epW0=;
        b=8PWVaMTFNbLyBGESru/iYkLywajAfNL9lRH3aUexsegLlOPm42yYgKXF+xrkV6R9L9
         6P1olIwQFIaCruI3T6Uap0xFG5RNwUaYknDFVx89H+WR5ntrmHjlj0Iiw7KiAJl0OcrB
         eDfhK+JdhYgI1tJi9FRqy6iY+UVWEW67INX6thR7xeA6hyC0M5LfDvpu0yoCNweTZDNj
         9DWoOoEygF4bhf+i35z3ysSD+v43vhG3mWWXsEsWHiYiLsCYJwoFhcmOeKh10KskRfD3
         TInU10e7JsAIHy691y9tJNOzo1qAIH6frl94CYXZbCyoWGs89tcUtxUCrW8Qq8PqCcBl
         6gUA==
X-Gm-Message-State: ACrzQf2Q2QTFkzFIM+4sBq4vWndDFKgHAuK334xrriatOPTmwR3onKCI
	318KpOsSSHvkeo+llilw1KljvCxe9ECKXyRZLiJtC0WT88FH
X-Google-Smtp-Source: AMsMyM73L6FgJylk0iC+1Mc2BfeKqe7z1SflMa2sORht4O2Tt4LB2kJresyTVU7i/apJI9cN304jMPltHzNz6DJOOZrL3jEh4Xuc
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20eb:b0:2f1:dc7a:c50c with SMTP id
 q11-20020a056e0220eb00b002f1dc7ac50cmr530227ilv.269.1664421563277; Wed, 28
 Sep 2022 20:19:23 -0700 (PDT)
Date: Wed, 28 Sep 2022 20:19:23 -0700
In-Reply-To: <000000000000fea8c705e9a732af@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000092f3105e9c85857@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in hdr_find_e
From: syzbot <syzbot+c986d2a447ac6fb27b02@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=162d662f080000
start commit:   3800a713b607 Merge tag 'mm-hotfixes-stable-2022-09-26' of ..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=152d662f080000
console output: https://syzkaller.appspot.com/x/log.txt?x=112d662f080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba0d23aa7e1ffaf5
dashboard link: https://syzkaller.appspot.com/bug?extid=c986d2a447ac6fb27b02
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ffc374880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=102db9ff080000

Reported-by: syzbot+c986d2a447ac6fb27b02@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
