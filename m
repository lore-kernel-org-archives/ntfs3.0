Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9158CAD29
	for <ntfs3@lists.linux.dev>; Tue, 31 Jan 2023 23:05:18 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id d22-20020a5d9656000000b00704d3bd8c07so9168675ios.8
        for <ntfs3@lists.linux.dev>; Tue, 31 Jan 2023 15:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4iyyOrc6238HvaMcaieQzTGBVMZ/RTQVCphLPtOjNc=;
        b=Atn5Jz+jezBigMaovc8r3YyTx+1Zr6+F7OzXH9hYrNjPba4xGcRMkq86+4kg+qL5qO
         0bVGShwMnW77zits3CNRocNDdAXcqSxv0w1LQrHUaeQDwD0DLiZy/tCWcrjU2putyRVv
         BGmJsM4oaIeqjQJG/uiXWbCKiazwYeDnVdcv5zVHbHpwEkEwWPiftXCZ0qDuOhY/zpNy
         +5uvw8KHOIHHnV4rns+K6z4lH+zkkCg7c5vusKkG8Xim1ISbPig2SRb0t7dNdioPc1F6
         Wl71w/d+YweLwgiqNFMlc6rxWc2+fb99FpTarrjldiCqC/gl1oOgP9Obn9fiG0JG6VU2
         IWow==
X-Gm-Message-State: AO0yUKU7yHb3v4kex/VE0n4qi4jsYqGOCUHqo7zzeZInvm7rO6o55Jn/
	PZBIu1WsZDiXli6ZsazWHilPoDpMcTpcjY6f8zkt+ltrmgYT
X-Google-Smtp-Source: AK7set+xfaVn822GQwLvNUzcEtvC3HGMC+oo8z7EbMNQNTmnEoZst/FpfJ9IhQkBtyJiDdL0yd/or5pNXLdpAGKb8zNtzhHh62Kk
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:f08:b0:3af:cb24:3f85 with SMTP id
 h8-20020a0566380f0800b003afcb243f85mr2387710jas.104.1675206317689; Tue, 31
 Jan 2023 15:05:17 -0800 (PST)
Date: Tue, 31 Jan 2023 15:05:17 -0800
In-Reply-To: <00000000000010d44905f01bf8e7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007dd57305f3975d7d@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in ntfs_sparse_cluster
From: syzbot <syzbot+deb631beeb93bdb2df4c@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit c380b52f6c5702cc4bdda5e6d456d6c19a201a0b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Oct 7 11:02:36 2022 +0000

    fs/ntfs3: Change new sparse cluster processing

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1377b979480000
start commit:   e2ca6ba6ba01 Merge tag 'mm-stable-2022-12-13' of git://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=276eb8ff64eb2c27
dashboard link: https://syzkaller.appspot.com/bug?extid=deb631beeb93bdb2df4c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d8601b880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a09c93880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Change new sparse cluster processing

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
