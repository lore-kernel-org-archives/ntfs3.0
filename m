Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675EB4C80
	for <ntfs3@lists.linux.dev>; Wed, 27 Sep 2023 02:49:27 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3aca0423310so24033220b6e.0
        for <ntfs3@lists.linux.dev>; Tue, 26 Sep 2023 19:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695782966; x=1696387766;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eni7pjGsCnR02TmbIEYy5GXxjpcD0RnfDvpYlq3rhaM=;
        b=gux7JEZqnEqnBU0BIWnoa2tImZzT5QeWAhUTMvsB4ADywBl+k9DfoGjqU5ZoDUSnI6
         YPJgHByTNNIXeeG2kpWjYKa2iyhcTHIox0knLVypF3VbhLpMutQyxTi1u6+ooRnrXI0d
         fxNTBejJHGLD8UBb5AVst+pxO86MKK86cPrw5iJZ1ipPPbubF5pXun08gpmUt+Dwz+JK
         w1ZDENY8cLg29v3k0Jsadt0To/94VV7b58Ej8bvI8TdKfZ229Rd35J1qdW7XVAo6jHTF
         pkPnWAnL7s2xDchapBpyKq5QahDYfrWa2TTKmozb7tp5uccBMQyTeQmJzLZfVUQtuzzo
         qURg==
X-Gm-Message-State: AOJu0Yx5FcFs8huYu8nPVOgY8wnVkgXEmR4jWehJGIFdG5dB+bQ2ywgs
	FWBkv1uq8VKS2S6l78DoLez/0JCo+MMIIx3YX33ZeXCsePXk
X-Google-Smtp-Source: AGHT+IFdbdFxnvYAoAwEmTvSKD9vV+LpoXdQyVZwGa9sq+8SBaVDHo7TFv5DlnRNou+NS6gE4mptqHru3h/s2UnlArnbPjr31pdR
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b11:b0:3ae:1e08:41e9 with SMTP id
 bx17-20020a0568081b1100b003ae1e0841e9mr404808oib.3.1695782966473; Tue, 26 Sep
 2023 19:49:26 -0700 (PDT)
Date: Tue, 26 Sep 2023 19:49:26 -0700
In-Reply-To: <0000000000006777d506051db4fd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000553a2106064e3d86@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in ntfs_write_bh
From: syzbot <syzbot+bc79f8d1898960d41073@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, brauner@kernel.org, hch@lst.de, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 5f0fb2210bb34ecd3f7bfde0d8f0068b79b2e094
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Aug 9 22:05:44 2023 +0000

    ntfs3: don't call sync_blockdev in ntfs_put_super

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1671b51e680000
start commit:   6465e260f487 Linux 6.6-rc3
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1571b51e680000
console output: https://syzkaller.appspot.com/x/log.txt?x=1171b51e680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb54ecdfa197f132
dashboard link: https://syzkaller.appspot.com/bug?extid=bc79f8d1898960d41073
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14aa4e32680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=171787b6680000

Reported-by: syzbot+bc79f8d1898960d41073@syzkaller.appspotmail.com
Fixes: 5f0fb2210bb3 ("ntfs3: don't call sync_blockdev in ntfs_put_super")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
