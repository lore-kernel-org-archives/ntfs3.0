Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197420E3
	for <ntfs3@lists.linux.dev>; Tue, 31 Jan 2023 09:27:18 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id o10-20020a056e02102a00b003006328df7bso9101195ilj.17
        for <ntfs3@lists.linux.dev>; Tue, 31 Jan 2023 01:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=baRMDYfh/xlZwZGAG0yWHlpzuwaFuMZN9hC0V7iVjuc=;
        b=6qCpHe9VH7+N2G2r0nh+U0SHraDe/+cs2cdkM9o4tzJhMigh9RcH555bCygfw0nIzx
         mT0Qowh1pWoAJeA8T6aq8BJWxS0X2uAP+odbvFJ69x3Te6nv+D0/Oy1mUi1YyA1GSLox
         CrKUaldy7FjD3TdDe5VaUnc8KMQ/dGyanNfcPSmgV8ssUlrMJMABIqGzXe2i1V1A9U4r
         +NWOT2V9Qtp+f8G22DmCpxmDoPrh2MXCimnwR9ZKlRkETKT/9sUxLbGwF+J1S83d8viB
         9bKFAycft0n9LXgTd7N24KiFRNWjojHW2Z9I0zX2b9OHtkNmQ4c8Z3e/EzDABaKWUqZm
         l/sA==
X-Gm-Message-State: AO0yUKWmGxrMtaFf55vQ/VW3nfRlNP2KcDyYkCXY+P6uIiL9wSIRNp5Z
	+jSX6i/qjtPB9/pK/1Eli6ccVbwB6pv9gTM1RoXgd9rReKEd
X-Google-Smtp-Source: AK7set8u4spgzHnLNJ4gN0tBiiWYVG3rnp0zIzeRaLeYX+acTnMe57OUFWUYS0D9NU/MPHWLIEUKjPHw+7whQBTcaEL3mtKntMHa
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:3f04:0:b0:310:d43c:edf1 with SMTP id
 m4-20020a923f04000000b00310d43cedf1mr1923200ila.34.1675157237600; Tue, 31 Jan
 2023 01:27:17 -0800 (PST)
Date: Tue, 31 Jan 2023 01:27:17 -0800
In-Reply-To: <000000000000d7eced05f01fa8d0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000171a2805f38bf07a@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in mi_find_attr
From: syzbot <syzbot+8ebb469b64740648f1c3@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, edward.lo@ambergroup.io, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 4f1dc7d9756e66f3f876839ea174df2e656b7f79
Author: Edward Lo <edward.lo@ambergroup.io>
Date:   Fri Sep 9 01:04:00 2022 +0000

    fs/ntfs3: Validate attribute name offset

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12e74535480000
start commit:   e2ca6ba6ba01 Merge tag 'mm-stable-2022-12-13' of git://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a6133b41a9a0f500
dashboard link: https://syzkaller.appspot.com/bug?extid=8ebb469b64740648f1c3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fb2ad0480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164513e0480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Validate attribute name offset

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
