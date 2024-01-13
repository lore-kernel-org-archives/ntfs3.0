Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412291803E
	for <ntfs3@lists.linux.dev>; Sat, 13 Jan 2024 23:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7baa66ebd17so724998039f.1
        for <ntfs3@lists.linux.dev>; Sat, 13 Jan 2024 15:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705189384; x=1705794184;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVTEW8gc72M35iNvfDiHYtRKqIshGB2+jqJ982idX6k=;
        b=iYUf7S2dGs+miabM3MNdZPKkSjIOtw3DOIq5+/C+62SUtrwafDA6kqhnvZwvY9Enjp
         NtA2QEp2/XoOdgNSFr0E5JeaqbXnnyIMthrwLuJ0bSgL2yxb+4yJ+VHqyJzs2pNL0UMt
         hSfcl6jG8Up1eFJz4ILWQJpFxB9NrsG//f0t2TAwnXhqUUBcsyqKYnkAsrkn6aEZItod
         0BaqdN4WjUOZAfYOb+c1K4Xyg9w/G/xkFoj5IiFjrG8Z6s5voJMYJ+T1iGEJhuKBnLtd
         IBGrc078veXCXsRpNVG580kKS6yWyQwHFo857Zk7uasV1+dJn+lMdls8yk+QobCAz9wZ
         KXKA==
X-Gm-Message-State: AOJu0Yz5SmKoNuQhS6V80hhRn1wXoOaD12h2Lnqo3nYUeAP+7zdpRfkA
	2aORM6B7fajcKM/oIqPfQvMF+q8nOqYobdfSV0oEGwkf4Jg8
X-Google-Smtp-Source: AGHT+IEoE88xswoj1XMACKCuRvTqh3qvUyE+/ZEIUu0VnsFJvYaDtYF86Tu5LYULFTn2qTIYM66IXQwHIh12WrkP+WjTC6B3RfxB
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a03:b0:35f:affb:bd7b with SMTP id
 s3-20020a056e021a0300b0035faffbbd7bmr535715ild.2.1705189384468; Sat, 13 Jan
 2024 15:43:04 -0800 (PST)
Date: Sat, 13 Jan 2024 15:43:04 -0800
In-Reply-To: <000000000000ed1df405f05224aa@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008942ff060edc57fb@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_set_state
From: syzbot <syzbot+f91c29a5d5a01ada051a@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	brauner@kernel.org, bvanassche@acm.org, hch@lst.de, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, martin.petersen@oracle.com, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, viro@zeniv.linux.org.uk, 
	yanaijie@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10f71683e80000
start commit:   8f6f76a6a29f Merge tag 'mm-nonmm-stable-2023-11-02-14-08' ..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=94632a8e2ffd08bb
dashboard link: https://syzkaller.appspot.com/bug?extid=f91c29a5d5a01ada051a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15af0317680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10de04b0e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
