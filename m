Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE541FAE
	for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 12:29:11 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id s10-20020a92c5ca000000b002cc45dade1aso2532877ilt.20
        for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 05:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=2LH/TUAXgyjFg87lmutVH/Zh/Ig4GTObkpnNk61xg+4=;
        b=RRhx6vabOw1G2VgXFsUYuM2F4bFb+URqQKeuE6ZH6T7DHUDGeqTUYPfJqzKyNs/k8M
         Qhq9GaNwjtTt9WydKeTE0NXC4HeVkJhrCGNums7nC93wFHy15D0gr7PNnZvWc+HQrars
         Gj8MoEyf4wnMKej3aKl61UI+jZ5fLwRNtqPfrkUDSSLspKuQht+uijx+fGzltMBbEDNS
         Hj9aBBkmj6RN8KB0f9Nwl9bj3izcWIWApezyk3z65r1u5/RS/00xjN9raYse+FmvxbYR
         7MCW0VTF/Qm2xhWBf6NZJQFdDH8NzvfrjptP2MCm+3/kfF+X0CpaYJ+91O41zyJxEbN9
         z+lg==
X-Gm-Message-State: AOAM5307V15rIZzN7D2KtYWeSxtxV0850R6ZtjXlWk7CbkZkhJ0Me+Dx
	PnThKovsojA5yz08VQsU2EntyYaUzi+Bio1s52oxgsn2ic37
X-Google-Smtp-Source: ABdhPJw9cDZEQPn7qRg5XxIXfP++kvVm4Mw1mTgznR6D5YpBs5CrAp8bCEiEqG9rWSv0a5q9ra/l7nk55Ugc5U+QM+RiN92OCC+2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1cab:b0:2ca:b397:a2e0 with SMTP id
 x11-20020a056e021cab00b002cab397a2e0mr10720692ill.104.1650544150570; Thu, 21
 Apr 2022 05:29:10 -0700 (PDT)
Date: Thu, 21 Apr 2022 05:29:10 -0700
In-Reply-To: <000000000000f8b5ef05dd25b963@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7ede805dd2941b2@google.com>
Subject: Re: [syzbot] UBSAN: shift-out-of-bounds in ntfs_fill_super
From: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, chao@kernel.org, 
	davem@davemloft.net, jaegeuk@kernel.org, johan.hedberg@gmail.com, 
	kuba@kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, luiz.dentz@gmail.com, marcel@holtmann.org, 
	nathan@kernel.org, ndesaulniers@google.com, netdev@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit adf9ea89c719c1d23794e363f631e376b3ff8cbc
Author: Chao Yu <chao@kernel.org>
Date:   Thu Aug 26 02:03:15 2021 +0000

    f2fs: fix unexpected ENOENT comes from f2fs_map_blocks()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=101dd0fcf00000
start commit:   b253435746d9 Merge tag 'xtensa-20220416' of https://github..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=121dd0fcf00000
console output: https://syzkaller.appspot.com/x/log.txt?x=141dd0fcf00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff9f8140cbb3af7
dashboard link: https://syzkaller.appspot.com/bug?extid=1631f09646bc214d2e76
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12e13cfcf00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=135e3008f00000

Reported-by: syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com
Fixes: adf9ea89c719 ("f2fs: fix unexpected ENOENT comes from f2fs_map_blocks()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
