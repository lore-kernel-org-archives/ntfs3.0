Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D46186B
	for <ntfs3@lists.linux.dev>; Wed, 31 May 2023 04:14:29 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7773a91a912so39494639f.1
        for <ntfs3@lists.linux.dev>; Tue, 30 May 2023 21:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685506468; x=1688098468;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ8lccKkDI0BWu9z1HB+e7MlGRULvpuKC8oP5Znml6Y=;
        b=Ao/y7GtozFM+pLotRuareeAuE58l6w5+BMA64Mx58ivK+ksscJZDnjDkJwh5T9YDHB
         uoUU7RpUb8LXMord2JQUBKEWmXj2pCwv8OMEgpmB3QObsoLNPxa9tti+A/NoxHPYhxeK
         0Z7bJGaWrn51PqDE8kfdzew/FnNWhK9LtNjvwGMRGc4H1L6q4RwwOyM5Pw0e8tPuOmdl
         TZSbhdanxjSCQrFd2weuDedy9ikMGSGvzUPLDL7Lg1pGxuDSArE31x+IHekaOTJzLksb
         Wd93/UJhWOJmYY1EtB+cdAu8XW7g280bpe27qIoi9+7SvJZbCuSAq0EmnrXXGn3u/p38
         boOg==
X-Gm-Message-State: AC+VfDxT6AljKYWytdeID3vUyLKI49s8Ru0hkTMRNv5Ws3G/19q7Y1Kr
	RuhnK+x+5fXNbNcMpgeIlsnjP/n6j59rdA1FO+G49mahkjDE
X-Google-Smtp-Source: ACHHUZ6ijLZzEZwuH0NsIQsxc2DP3wZIt7NQIH+V0p25HtMvQGsTBm7wIgmvAtUsrUwp+QLAYA9eicuP9Hvyt6mCmRqtQ6uApq/A
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:a19d:0:b0:41a:f4a3:9884 with SMTP id
 n29-20020a02a19d000000b0041af4a39884mr2015057jah.1.1685506467298; Tue, 30 May
 2023 21:14:27 -0700 (PDT)
Date: Tue, 30 May 2023 21:14:27 -0700
In-Reply-To: <000000000000030b7e05f7b9ac32@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000040020d05fcf58ebf@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in attr_data_get_block (2)
From: syzbot <syzbot+a98f21ebda0a437b04d7@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 68674f94ffc9dddc45e7733963ecc35c5eda9efd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Apr 15 18:47:06 2023 +0000

    x86: don't use REP_GOOD or ERMS for small memory copies

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12de3271280000
start commit:   ffe78bbd5121 Merge tag 'xtensa-20230327' of https://github..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9c35b3803e5ad668
dashboard link: https://syzkaller.appspot.com/bug?extid=a98f21ebda0a437b04d7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=139dca3ec80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a55a35c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: x86: don't use REP_GOOD or ERMS for small memory copies

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
