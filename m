Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17284181
	for <ntfs3@lists.linux.dev>; Wed, 17 Jan 2024 00:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705450025; cv=none; b=WbK9jorZ+phO/cLfuJGxIrgA7knvkxCZ5vaQtKOHZ7wuou0z840ej3H6ZultfhFaXiaVq7XCpvyL2oNBDO/kYpKZBCRfnWpMrwwoW0fv0EHRsAxwbgqAnaTUcKenR4r5Ar3d//Thy245Nt23ZFftHdfV+413x9GIWttjLKVZeME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705450025; c=relaxed/simple;
	bh=/tcqdO53EdXfqW0OELgFT/QmOAc6RYeo7trY0MclCwM=;
	h=Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Google-Smtp-Source:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:
	 Message-ID:Subject:From:To:Content-Type; b=h4Ic+H9O3SnrTGG1coqlMOB9haHt6MQBkbvxNSbVXsVshXzYGV8jy8IYilUc+pcFbBNf587VB3SEN2pXD91RIH/gLYHEb+SKsjun8GkqWitAc3zCvQ5DyohxBOyW6AP3UCLSjYB5oeXHyD2ht88qqkDZ+XubLnljtwMCkX2rnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-35fffb6fe5bso103127105ab.2
        for <ntfs3@lists.linux.dev>; Tue, 16 Jan 2024 16:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705450023; x=1706054823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlavUvMAdUpiOr4arKZ0pSY//J4vx90QCJcxBwABNio=;
        b=CZm85BQNTTg1ty2j2+gu5K08tSas1YLUf456fjO5e8AWQ2FcJ6+/zqIly/m2q3PoIJ
         dKIypbfeQQ9T7Fuevqqf7CuA2vxtAEhJuvB30V0oAqNH0AyLW6SHCCGt7eTAwzfqag8U
         UIyf7fgU0RuzG2BmQuJG78lEyfnxibG6yEzxYZV+9z/IQq1CUBl3We9zA6FwHdAY0rLz
         5hxumQlipF4KpYivIpz9fWIH38dQI8mcTozg4g1ntLNH6WO8ksoMbNTAEJYLtt7l+AZl
         WgTTSfaqDfqw4+nl7X6DrowmRExVj6RwHDrQAAHEI/F/CPuwl3q1nSVq1Uvw26kHIrGw
         5D3g==
X-Gm-Message-State: AOJu0YyHgsnYt5qVtSSVhdz26hfknop0cmqCm7MSmwyBEQOfPcc9Uc1h
	VfKcTCmqgjgnjd1AigbtAgu7fqh6Z8ItkcOljo/nRBOHkV4N
X-Google-Smtp-Source: AGHT+IEkpFYmbytpIqhwd1doRIHX/Gj50g1X8BedK7iVLQEUMWfCZTSu2xEHtDALyvBTcEkp9QZtU3Hr8jFD2nxE7jiMWlQ/UDXJ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1baf:b0:361:94d2:6ecb with SMTP id
 n15-20020a056e021baf00b0036194d26ecbmr54961ili.5.1705450023356; Tue, 16 Jan
 2024 16:07:03 -0800 (PST)
Date: Tue, 16 Jan 2024 16:07:03 -0800
In-Reply-To: <000000000000af650105f0e7a9e5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d31227060f190634@google.com>
Subject: Re: [syzbot] [ntfs3?] INFO: trying to register non-static key in do_mpage_readpage
From: syzbot <syzbot+0ede990fe8e46cb5711d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=102de4dde80000
start commit:   090472ed9c92 Merge tag 'usb-6.7-rc3' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=52c9552def2a0fdd
dashboard link: https://syzkaller.appspot.com/bug?extid=0ede990fe8e46cb5711d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d4a3cce80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=160ec6e8e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
