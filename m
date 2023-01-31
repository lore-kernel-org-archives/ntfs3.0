Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6848C15
	for <ntfs3@lists.linux.dev>; Tue, 31 Jan 2023 16:17:18 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id i8-20020a6b7908000000b007132e024fb5so6279607iop.0
        for <ntfs3@lists.linux.dev>; Tue, 31 Jan 2023 08:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiAqoUAhSbXRWu7WwqUljNKrMQeqVBW7GAniuAjL2v8=;
        b=vD7VUm/C9MkAIlwPyH3UkgRnVYPKOzLTKXqeoJz1Xh0btz0FXth5O4/Ym7cgCV1N70
         cT1ihxBLiwjJ8MTQtBTEQbH6Ym1lzua4b6bLIfJfmb6J33pQPVMJ6MYN++TO1EBbRpp2
         prO/kzWLlRwGN3s3Vdt/9aotuCzn7A0h/aD0jnlZ3OcS6C5D1YIM1CkifJDB65aOj88z
         6i08X35z7ZIv/9Hj1wDdcjvkoIzlzjQ57L97mJ3ExTQGJxbm/0nKzXfIQJBrrSUnvpp4
         wt9JA1TwiXvC0NJSqOaL73aGe3SmTjp43/+eWsn2wFbkJzVYQXNb6e/w8MCJbSn5wtlP
         Bv5w==
X-Gm-Message-State: AO0yUKUdfaDSUqhcOHj8A4Es7NV8SyW+s7JZRGB4C+RV0orddUeCTIxx
	nchk/Q2X/nZELEPhCO0HMr2NhXzRuKYsHKWJQ7tTHz0eyUip
X-Google-Smtp-Source: AK7set/OHuRu/Wj6tf33O1Z3bSTQrgB1o8gZPL+3utcc+aaXpdr8cyGKqn5K0ftPFAMPNtpPy5ckI+3V6HgyfU38NTkTGcFgjtrJ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:a418:0:b0:3a9:67b6:18bd with SMTP id
 c24-20020a02a418000000b003a967b618bdmr3800070jal.46.1675181837697; Tue, 31
 Jan 2023 08:17:17 -0800 (PST)
Date: Tue, 31 Jan 2023 08:17:17 -0800
In-Reply-To: <0000000000008be6b405f01164f8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005eca3205f391aade@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: out-of-bounds Read in ntfs_set_ea
From: syzbot <syzbot+8778f030156c6cd16d72@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Oct 10 10:15:33 2022 +0000

    fs/ntfs3: Check fields while reading

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11d9c385480000
start commit:   02bf43c7b7f7 Merge tag 'fs.xattr.simple.rework.rbtree.rwlo..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c59170b68d26a55
dashboard link: https://syzkaller.appspot.com/bug?extid=8778f030156c6cd16d72
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136b8f57880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=175ca3a3880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Check fields while reading

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
