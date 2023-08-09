Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6621CA06
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 20:49:25 +0000 (UTC)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-686baf1c2fbso263605b3a.0
        for <ntfs3@lists.linux.dev>; Wed, 09 Aug 2023 13:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691614165; x=1692218965;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiO1UYKz1KmGz5vyEYa20p8Kf9nv4M/wBjQ77gRnteM=;
        b=FpkRNokd8UFoFv6JF/kdRIF50vBVBn33XvYajD4hydGQOPE6YgxVpgZsqVi6IV7znS
         HZHOtZZjcCny0A5sEHyDwWv5gUwQ7chXcUuPC0VGs0xOux/X28R5lkROao+1jU3TobpI
         CNkbvxvWSJxAL3WMDITTy2BjxFTHP0CiY8ZZghjx/4ojImiJgNb+ABwfOyhIEF0r5tf6
         9Ko9VFAUEgdgTKRTMmSsff4U5iPzT7rgdB3srYSar83/9UzjiLhP79lQJZeK6KfYVT7E
         ub7Th0kDEFHNvFZv6I9HcK3Wtbru1+X12W1tm6zMYQo0Yf8j3IRGV552hrTWSH45B9H6
         c/xw==
X-Gm-Message-State: AOJu0YyioHSViauy/MHjCM6SYvU/FGn6/+BxGwk8bdMCkw1UrKHj2+n4
	KSB1i4WY+g9lAb13HR3Y+z9raqigteLwxHD0AJJhZ192Fk2y
X-Google-Smtp-Source: AGHT+IHM/PSrbeg1ZRWPQCHIWQxkAXmB84lw1plRrMW/1JwBCTdX+F8fk/Cvw8TeA/TVHtTefHpEhpbCSsRcdC5cgVKcXAmvAm1x
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:c8a:b0:677:7731:5edd with SMTP id
 a10-20020a056a000c8a00b0067777315eddmr162506pfv.0.1691614165376; Wed, 09 Aug
 2023 13:49:25 -0700 (PDT)
Date: Wed, 09 Aug 2023 13:49:25 -0700
In-Reply-To: <20230809191118.30721-1-astrajoan@yahoo.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006ca4a20602839deb@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in hdr_find_e (2)
From: syzbot <syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, astrajoan@yahoo.com, 
	ivan.orlov0322@gmail.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com

Tested on:

commit:         cacc6e22 tpm: Add a helper for checking hwrng enabled
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=1107f5a5a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=171b698bc2e613cf
dashboard link: https://syzkaller.appspot.com/bug?extid=60cf892fc31d1f4358fc
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11e4f5fda80000

Note: testing is done by a robot and is best-effort only.
