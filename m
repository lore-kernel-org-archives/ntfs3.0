Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADA11DDF4
	for <ntfs3@lists.linux.dev>; Fri, 12 May 2023 14:07:20 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-33142b54417so147629095ab.3
        for <ntfs3@lists.linux.dev>; Fri, 12 May 2023 07:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683900439; x=1686492439;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMsA1OvUqk2tsx55m7tIfaPeJf529B0QdbQS7E31h+k=;
        b=DX6VBmd0M6W5rnXOGy0Kky/SUWWZFUv7gO1fZkmN6GbiAjvjlpvDTaB1Fru9v8k7n+
         cETvFvn6s6/O9P7RSXCeWdKcOjTvBH9LD/ckvrlv0L2Ajp9BQq020eeK2QyxbajvZven
         sW3eBwpahj96km80hQJXP7B+rQ+VPO004GIT2hcYSg5Q2wg8a+SQGdS0xXz/AWAy7cNe
         OUDVgFcwTIq3O3KnD5f4QETpSx5fvQ+gV9TVjcrS17C7avzJ/3pKJm/309vebMgnhn4N
         PIPojDKHsxc7tSivkJqybjLBrPUUF9yiQHZp5I3LLN/ShYsc4wQn+0HJx6CtDt60HT3N
         JT9g==
X-Gm-Message-State: AC+VfDzsaIsd1ORtUyZRMJ0q/w0js0gLRuDvB/YPNGXSVu2SvtVoAZ89
	gWBGu3XcKP3Qwa3aER7OwYDsZ1x0n+VcpRZueLRYbxwmWOa2
X-Google-Smtp-Source: ACHHUZ78MXlEJPSlarcif/f+n4E+wXrSeNZwdz4IonDEPpF9krYy99Fg2BkvtT1Pz45rvxB1dwiGb1hHl8Vm/hIK24b49hIDwO07
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:860e:0:b0:40f:7382:e4aa with SMTP id
 e14-20020a02860e000000b0040f7382e4aamr6776856jai.2.1683900439423; Fri, 12 May
 2023 07:07:19 -0700 (PDT)
Date: Fri, 12 May 2023 07:07:19 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000877b2c05fb7f9fd4@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in ntfs_listxattr
From: syzbot <syzbot+9fcea5ef6dc4dc72d334@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, 
	clang-built-linux@googlegroups.com, dvyukov@google.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	zengheng4@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1587a32a280000
start commit:   8ed710da2873 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1787a32a280000
console output: https://syzkaller.appspot.com/x/log.txt?x=1387a32a280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b83f3e90d74765ea
dashboard link: https://syzkaller.appspot.com/bug?extid=9fcea5ef6dc4dc72d334
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e7ec29880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11829e23880000

Reported-by: syzbot+9fcea5ef6dc4dc72d334@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
