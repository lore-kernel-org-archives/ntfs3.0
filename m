Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F98158DB4
	for <ntfs3@lists.linux.dev>; Wed, 15 May 2024 18:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715797146; cv=none; b=NrLmdqsHnqPXxYJ9xa4K7XsPBVpXRZjyOTLG7PrOPtAVJyFA9DirXg9S9awF0c8Q6s7p4fMxT1OwZJZ/0H++7Ud78CPKF7JBocfXFL78PScKkeiweD2SlDijtrUvK6PQKdap2Qr8Gy8+GWtVJGl88FZYIzF+iRXxjEr8gG30NHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715797146; c=relaxed/simple;
	bh=5eudQLXKDiRsYY49Oc+zW6UDq5YXoyySbCrA4nZlq9w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nZj/8bgpsSRbyWRL5bAmLxYRlm7g6WSMataNZNQhOqrQH9+1huCX7Zq2eoq3/CKvp2v8BHsRoFcExL7UrybQLsMWqGK4YpKKXZM8z++IuGz2GH3G+H7b+EfCqfGLfeADg9RoS8Qc6MmnCMFFzhJyXd5JTWR/f/CT4jJwH087r0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7e1fe2ba2e1so219717139f.3
        for <ntfs3@lists.linux.dev>; Wed, 15 May 2024 11:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715797144; x=1716401944;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+tpDgK2JCqXeT0yDQHOxK3Y5nf0WqVOLoMtiI3Y/bw=;
        b=TB+mqNtaFHgPTrenbhBTLTy4WpB/RxyGXUvHX88jiu2ckKTe1+VJfZKdp5W4bMb6yX
         wGkNTmmgVQJaL7EmF6lRjO/ihCUSJZ/0pR6OxDZ9J1K+NZzbYR2gUZKFt/4TDPIEXOa2
         GQnKqpYe34P/E3CCjBBGlwiAVFnMcH6iah17oBDNFu2WYO6j2OLo3b9SW1ZZfVqHnjU/
         DPEjbPOl6wIdsLRsb8sfClRtrOrFAlymDisbwyDF+OiRM41xW5jJfAa1gakNQvt6/NdU
         siuquJ6ZRMD5bYr7FB8IlVyICobACIhkEqLze0j+wWD3JhZcADwzmqElzt5eCPccMvfx
         TNwg==
X-Forwarded-Encrypted: i=1; AJvYcCVkcFzvHVLyFvokn4qiBARDR50xnOiMoGq7q34Wh2vxLVE5uNrivA9TtKhcXzWjDjWVnAPXvI69CxwkHjIo9lmJ/7bP5ak=
X-Gm-Message-State: AOJu0YzoQC4Z1TXrqqPQTYT/n4oC2QRj4XEPqXgweAWyoz4a8LLAbJRJ
	n73DgpOCMx28WU2cinAuJPhOzNt/Mg+gIbs7ajMNcGHTGPYtNHbgttm7OGH9HGTca0823TfuzKA
	438JdmTFkFckwyF3jRPifIV5mJTtbjV2Bbomf3P+1AW/vPau/aWIQIns=
X-Google-Smtp-Source: AGHT+IEjNm55R8nOlSIvYdtT/+wPoKVbHS4MXBNSquAdO95DQ/qV9dYHkp5IQ0ROpBGxD/p/1FKq4FdnI5XNMO2HYBR0ez1OuwCN
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:861e:b0:488:59cc:eb4e with SMTP id
 8926c6da1cb9f-4895854473cmr1136597173.1.1715797144326; Wed, 15 May 2024
 11:19:04 -0700 (PDT)
Date: Wed, 15 May 2024 11:19:04 -0700
In-Reply-To: <000000000000c4b45a056a36872f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004b67120618822707@google.com>
Subject: Re: [syzbot] [ntfs3?] kernel BUG at fs/ntfs/aops.c:LINE!
From: syzbot <syzbot+6a5a7672f663cce8b156@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	axboe@kernel.dk, brauner@kernel.org, cgel.zte@gmail.com, 
	dai.shixin@zte.com.cn, ebiggers@kernel.org, gregkh@linuxfoundation.org, 
	jack@suse.cz, jiang.xuexin@zte.com.cn, linkinjeon@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-ntfs-dev@lists.sourceforge.net, lu.zhongjun@zte.com.cn, 
	ntfs3@lists.linux.dev, ran.maosheng1@zte.com.cn, ran.xiaokai@zte.com.cn, 
	stable@vger.kernel.org, syzkaller-bugs@googlegroups.com, xu.xin16@zte.com.cn, 
	yang.tao172@zte.com.cn, yang.yang29@zte.com.cn, zealci@zte.com.cn, 
	zhang.songyi@zte.com.cn, zhang.wenya1@zte.com.cn, zhang.yanan14@zte.com.cn
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=134d0268980000
start commit:   ceb6a6f023fd Linux 6.7-rc6
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e5751b3a2226135d
dashboard link: https://syzkaller.appspot.com/bug?extid=6a5a7672f663cce8b156
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=172458d6e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=120d8026e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
