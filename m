Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64E780F
	for <ntfs3@lists.linux.dev>; Wed,  1 Feb 2023 07:54:31 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id w11so27939696lfu.11
        for <ntfs3@lists.linux.dev>; Tue, 31 Jan 2023 23:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0diAaeCGuTZlOnZxWXSitLoB/1kBFfQP3ozqLMthdrY=;
        b=lF1UqyudEA09FkqGGF5NmMuHvah8KKfPO3eWxAubAvEp7iQ9LhiLV+T8p4K8BfqCkI
         o5XDl4XUegL87wDptfNUHusoDNEWwR3kFLY8uWxHBNe6XtsuzkcfE7wHub8jBpu78zJ3
         8u1P4xOeiohBEfpUULqu61VPZz9Xew9ZVJI6Yz75XRZe614dAnDNrWbqS7E5xSrbl2U7
         96TkvetBtlpEr4RcP2JS1DfMs9a6a2wTTGBG1810gECpndWZgdeP3309sd66sbxpUGhw
         AE378mpGhvx2hHZVLhvgMzMtgL07iSV3ITOMMuFfTEgj1ZCx285Z7z0BsGCManr5FYdf
         DJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0diAaeCGuTZlOnZxWXSitLoB/1kBFfQP3ozqLMthdrY=;
        b=KcQXUAglzkuCJhcBptuP3QtNmxUDKJ6BAXUvwniiwpaoj3MtKF+OoDnWmzjbDYaYG5
         qWJJk2oLQcqF6ziIl2a3AOmaN1bVHVPS7eN9mly23Kn3kxorb9X92xiFaoyldhLreFq2
         bqGozzVT1YRc9pOv6aoVeFgIru8ZUrVCkd28CYoDibkjAuNHoDwFqwgfGwSweL1MMzY8
         O7raybG8nd07YaN4aoTFr3MZ+6i5V/dHf9FlCwytLSJkSlyc2yPy/GHGnZyAfDiSmfkA
         UXqhzNKr9N1+7A0nNTRARKmycCiI0hMHqGMtL2g23E7lB4emEV/E6QrrEv5BEfUbgBVp
         jaOw==
X-Gm-Message-State: AO0yUKUU+GalDXIj5+6aM6zL9xVzKlK1mlbcc3womEOUoe5dXIsGzp82
	8SBYN2qQZ3vg6yYvh1L1Qjj5sqs+EtQjWkSdnTH1sA==
X-Google-Smtp-Source: AK7set/pcUtZ6NpoWDLM7Q0eQN46Pgx8dTWbO5ck5QVBIuUe66c4GmhgfonlDo7ZR0OVUA9vhbz0YNjfIAEBW1Cds4k=
X-Received: by 2002:a05:6512:b01:b0:4cc:8686:8c87 with SMTP id
 w1-20020a0565120b0100b004cc86868c87mr152383lfu.188.1675238069550; Tue, 31 Jan
 2023 23:54:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000008be6b405f01164f8@google.com> <0000000000005eca3205f391aade@google.com>
In-Reply-To: <0000000000005eca3205f391aade@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 1 Feb 2023 08:54:16 +0100
Message-ID: <CACT4Y+Ym4=mzMO6XNB0fYQJMo_QvUpYwkC1K7cmwr_XwKSdwzA@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: out-of-bounds Read in ntfs_set_ea
To: syzbot <syzbot+8778f030156c6cd16d72@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Jan 2023 at 17:17, syzbot
<syzbot+8778f030156c6cd16d72@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Mon Oct 10 10:15:33 2022 +0000
>
>     fs/ntfs3: Check fields while reading
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11d9c385480000
> start commit:   02bf43c7b7f7 Merge tag 'fs.xattr.simple.rework.rbtree.rwlo..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8c59170b68d26a55
> dashboard link: https://syzkaller.appspot.com/bug?extid=8778f030156c6cd16d72
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136b8f57880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=175ca3a3880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fs/ntfs3: Check fields while reading
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable, let's close the bug report:

#syz fix: fs/ntfs3: Check fields while reading
