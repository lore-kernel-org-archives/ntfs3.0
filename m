Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D94CDDCA
	for <ntfs3@lists.linux.dev>; Fri,  2 Oct 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961310; cv=none; b=ZaMvSrikzMu0bBzQdyA6qxCy63mVwEeqQ6xfOcMwaRMhox9ALEWkkRo5SFrtNOEib4NWuD40ftvYuAtgr3DY0TQ4ItU+Ay9zl23zOn0xjsxNIzLJOJdPLb+V3M2ONosYYL9Zmio4UyWXr44Yzz+XSVUlxpAykcx/ROxUUr0CkuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961310; c=relaxed/simple;
	bh=14EMFgsiFMdgbUFOogueXl4bVCClPF8xEpWoFi5WzUQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DvNwmU0jpkfaw5Qqt4GNyeb3gpMKOpJ9JnHfYPng37cmz6kV2IHFWR0rFxSRXcT9u+mzOOjYfXuufpg0ttUCAIkhpeAtdPnI/ItWbWCFY9bLgrRL9TZfWoxgNRFcssuKp2b23n42e69Oq77cKQ3ZEAl+MUn/8SDHaO9QwPXjv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-81447a16061so328284a34.3
        for <ntfs3@lists.linux.dev>; Fri, 02 Oct 2026 10:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961302; x=1791566102;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CBikqlH4+Pvhr/TPbSUYuPjAvbOJucjrVxXATrsZS9k=;
        b=qvLU8ev9feaIhEXWhfHT4of2IuSN7to7TMZ5PR08fbQ14lOHpDcXW8HcvpzcUF5D2r
         tvnE+Wae59Ky+8sGrZBjuWC75LQG+gVxmcpp8EQ+7VO7KlSex3xozIfLkNCAKkykQIQK
         oWen9JjF6E0qi0BzaqDVrhbmUx2mzNVwKILIlKREvIfukEEvDri7J8EobXvtYuA45qoY
         3q6xM7Pj06HmTUhR9PZ0/y9C53QD7+p2k0g+JatN85hZBj9gWNwc10IVkuNEVsExHbz5
         zb79HxI5BrK9CbjyjxRMxqk0kBtBkvfRA0asPMaJdvaRd8DXOHgOXr3llbJnnesuEmjH
         XzlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkLRjWQRHj8v+zZGWCBiFf0N82XF7Sw6Wtf5B6hbh/Na8JcReoyuRmuXo0d7Btng/0Gzn6CQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mzauhVgC/fLMxbU3cWEyqorYQexi3DXkbW1toNmpH4bnMCaZpi
	8Fqk2VDrWN7pVb4WTLRAzj69YJYia3wR2TE+MiRf+PoATkUdAZ8BycgJ4QyfS47UtVoxG0QfGV0
	QemRa+b2op99K89RepEP4kTIX/3nH6zy3efm+3zlqLNSIGyh2nZuEbE34xMI=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e85:b0:4f1:7c39:8a7c with SMTP id
 5614622812f47-4f52aeaa216mr2377157b6e.62.1790961302560; Fri, 02 Oct 2026
 10:15:02 -0700 (PDT)
Date: Fri, 02 Oct 2026 10:15:02 -0700
In-Reply-To: <6abc1c9e.00649fcc.35d151.00e6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfe696.7503fbd6.2d3f6.0024.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in truncate_setsize
From: syzbot <syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, fred@cloudflare.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, zohar@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit b80bed5c871a80151351342c065579405ce77145
Author: Mimi Zohar <zohar@linux.ibm.com>
Date:   Tue Jul 28 00:39:41 2026 +0000

    ima: Instantiate file_truncate and path_truncate hooks

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1302e035580000
start commit:   ce1e0223d8ad Merge tag 'devicetree-fixes-for-7.3-2' of git..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1082e035580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1702e035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=0e70362e1726b5a7502e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143da725580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113236c9580000

Reported-by: syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com
Fixes: b80bed5c871a ("ima: Instantiate file_truncate and path_truncate hooks")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
