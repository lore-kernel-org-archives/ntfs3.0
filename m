Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147818F
	for <ntfs3@lists.linux.dev>; Mon,  1 May 2023 04:31:16 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-32f240747cdso147887745ab.1
        for <ntfs3@lists.linux.dev>; Sun, 30 Apr 2023 21:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682915475; x=1685507475;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMopvbnl/gI/YDHKMUQoJhnm8zsxWuaap4+5arlbB+g=;
        b=S3geWNoc9CuUOKibs0Vr7rZjaC/84qS/QzG9Neff7wJufBvCy20x7E6hMdgfrODSDf
         1ANbOy5yHCoFKiREKh4NIS7vqAwi+5S4fnK6EsgcQsl7YM/kn98dEvN6kFrRW/xsbBQN
         gtNc80O6RhC9sTq1MAA0lyLqZAQhEPQreKzi7Wz2Q6S1i2GfCbtgba5cWwwjiatdBegd
         safPDRNyemqIB4RpGg54sIM8qnSUN7/rZLBZq/DmNOWkn8RaNJvxFTCwAJqsZur3BPht
         NGQtMKnll3ojGVFl1h1H+fFDMzI7moKjTiJtPv8FlvAw8pDXM+VdDNEoBeULHt158sqK
         lRBA==
X-Gm-Message-State: AC+VfDwbKZGKU/iqblaF3/2z+hJMLvE5n17bpEpUVTasuaYjb5/drnqS
	KFQ9/CStDJNPXxsT+lwp5kqEMwb2TPXTKV0wgLuWZt+v2xGP
X-Google-Smtp-Source: ACHHUZ7Q4rjTeGpf85L1LGOh7wLdCEauIqOMBHRiBNJYJKx9Tuq8Qab9mCWymwv/5AvWALVhHrPjoTTQ0jQIJr2WAoX/JN3/Rsxj
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:95e4:0:b0:40f:b984:ca85 with SMTP id
 b91-20020a0295e4000000b0040fb984ca85mr5812640jai.1.1682915475766; Sun, 30 Apr
 2023 21:31:15 -0700 (PDT)
Date: Sun, 30 Apr 2023 21:31:15 -0700
In-Reply-To: <000000000000de34bd05f3c6fe19@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001ec6ce05fa9a4bf7@google.com>
Subject: Re: [syzbot] [xfs?] BUG: unable to handle kernel paging request in clear_user_rep_good
From: syzbot <syzbot+401145a9a237779feb26@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, clm@fb.com, djwong@kernel.org, 
	dsterba@suse.com, hch@infradead.org, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit d2c95f9d6802cc518d71d9795f4d9da54fb4e24d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Apr 15 20:22:31 2023 +0000

    x86: don't use REP_GOOD or ERMS for user memory clearing

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13636ffc280000
start commit:   ab072681eabe Merge tag 'irq_urgent_for_v6.2_rc6' of git://..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=23330449ad10b66f
dashboard link: https://syzkaller.appspot.com/bug?extid=401145a9a237779feb26
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13b3ba9e480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: x86: don't use REP_GOOD or ERMS for user memory clearing

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
