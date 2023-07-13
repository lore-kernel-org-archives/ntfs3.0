Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF6214F1
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 21:47:36 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a044f9104dso2064798b6e.0
        for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 14:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689284855; x=1691876855;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUG8RKD0pfrG2394ON25fkHyWSD9eo4LkpOPF3F2CCs=;
        b=EsMqdE1TWaEn7G/KjLS3WWn/Qmg3Wyy1/E2RBGiUer4ohPVCz+N2CoElbx4iNGtJV8
         ZWnPgSWj71q32Bg/hNZEa0apiHJqOUb0tqoBPLiA76nRlTOkDMmmvvlzWh5e52TS7IiG
         eujqMKPLS9f/pXOiiUWBONNYWMEkCxQcsETt5+dhFmbvzKHIiMlqpEoWO+PvTEaaXfR9
         A0gVczC/Y6LIwHxxbmomiLpSlPiqofYtFq4xRNMiBOCZHAEUzCTl3WWMEpsS1V2JakiX
         1y6i14KS15yl0dIN6wYPA+s2BlM4TKjPmovs7PH+znObJRGvEmfMMRZlNZWyQFfVLhOt
         JpzQ==
X-Gm-Message-State: ABy/qLZAcBk+Th9ylPeFDkV8x6wQ0gQFdnMo1OuniHlHaqwsb8jk4eyL
	Q/XgFZmKjRoXWnVJmg3e99N+pkWA2/+W9rQVpkddYT2m9TVP
X-Google-Smtp-Source: APBJJlGoKW4zDGN2PvlsuktwYSqHm10JrHpVzazG0QH2nNwFSt1OcvwTZuQ5Nuj4JGXZ1da1F/RXi2zeYqC0EbyD4QYj/9abyOQC
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1810:b0:3a1:f1ce:10e2 with SMTP id
 bh16-20020a056808181000b003a1f1ce10e2mr3841051oib.0.1689284855603; Thu, 13
 Jul 2023 14:47:35 -0700 (PDT)
Date: Thu, 13 Jul 2023 14:47:35 -0700
In-Reply-To: <b85911af-b7e1-0ef4-b102-1bc9c602a936@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000be2656060065470a@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: use-after-free Read in bcmp
From: syzbot <syzbot+53ce40c8c0322c06aea5@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, paskripkin@gmail.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+53ce40c8c0322c06aea5@syzkaller.appspotmail.com

Tested on:

commit:         eb26cbb1 Merge tag 'platform-drivers-x86-v6.5-2' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=119e1bd4a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d0f369ef5fb88c9
dashboard link: https://syzkaller.appspot.com/bug?extid=53ce40c8c0322c06aea5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1405dac4a80000

Note: testing is done by a robot and is best-effort only.
