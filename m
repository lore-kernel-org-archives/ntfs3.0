Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3FA17BD5
	for <ntfs3@lists.linux.dev>; Tue, 20 Aug 2024 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724118665; cv=none; b=nPyF7fkYoco1oBt1ntjG8fZ02NJNdpUtYTHGnTTsEu5a5Imogt6lyf93UXIu6/iWr1EtRdq3LW8zFivLT77BFLmbckUlrQkEgm+hnBzwdfsVAAHzvC1n34+ogjnHVQ1l8sZJgD8UcmZ9rKP4phJlL+sm8fCcidWT2pRImaFCH2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724118665; c=relaxed/simple;
	bh=gxwgkC4k7LhKrDiQCelOrocqVsr3XdMiu9issbRRE7U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Cavwm8ulHv6t2by4btoOi8sjTc9M51Ia6EOP8nq0NTCS/J4/Q3cqW/sJuuYJGy7O5is+itu95yfcz5d4p6H9ulT70Oervzm2jwVcDxnTq+JzG+t2Dtk9JXBs+4/u/j3jcAeYmwIUw+/B4smreewQMwI8EpwKcbmBfl/NPV9KYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-39d3061c2b5so34654525ab.1
        for <ntfs3@lists.linux.dev>; Mon, 19 Aug 2024 18:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724118662; x=1724723462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfXe1U4CqkltrMEzBmw/eZV29NzSNayMVkqz3VwUfPE=;
        b=Oc8CMp3ollzwkJU8yZiLRygk5zoDtLw7aaLovQGm2g1nBG8d+6H+l3poBkUtq5Bo+n
         nOkSAnM3p+4ni4pkTKSKVAtyoNXVnO5vCJQRbwvPmPcKecjlM02eN7Gp4W37Zs18JANY
         Ub5awoN74Byf69ArW+QMzAul1fTQEHgRRMpclSb0E1DAH5/I9lvOQrObxTOjDlFv948H
         mAXhj+TxdAUhK3gDo66SckkXMrbscO9oaSEpqpPUIEnu0misz1+QEmmojsyhWmsv3Fqy
         uqrnlztAMSWV5uc+kWWXzLfmcgf6OwxdW36xk2VrQHT+84lTOziizts1vo03DAbEC7yl
         TkYw==
X-Forwarded-Encrypted: i=1; AJvYcCUOLKLXZG6iFvhQBAbN4JPtZIGGBQ18KVlrG0pzQOEw2uaq/uqNeD5RzEh23/LF3NF5Bx7bNwkZSYFeuXpfw7AQKNlwhYs=
X-Gm-Message-State: AOJu0YzQdJqXDG9Xikl02v4272lhH5VuYcsV+IWRMfxYhOl5q4Qd/vt8
	LxjJgK1V4IdBhiE27JcVT0ESk+l7kH0qoykXFnfnhcGEuwEqtcxTBaDEgS9mq8pyXSwhdkRlSN6
	+DufojeBYMeFDWkVjbaJhhEy7kTAYEHg70j4uSY7BwLdQ+tADhxtI1dk=
X-Google-Smtp-Source: AGHT+IHhvwkvDZCaadZdhsiSqjoOtcaRdE1CJ0o5t5ee6FqeceFHMiwVUdrM48dac9WFU/VpvbQqRQ1fJHNq+mYrNYueGDnokCDu
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c26:b0:39d:20a4:f42 with SMTP id
 e9e14a558f8ab-39d26ce4072mr5909245ab.2.1724118662649; Mon, 19 Aug 2024
 18:51:02 -0700 (PDT)
Date: Mon, 19 Aug 2024 18:51:02 -0700
In-Reply-To: <0000000000005b04fa05dd71e0e0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000703731062013a8cc@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: out-of-bounds Write in end_buffer_read_sync
From: syzbot <syzbot+3f7f291a3d327486073c@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	axboe@kernel.dk, brauner@kernel.org, cmllamas@google.com, elver@google.com, 
	gautammenghani201@gmail.com, glider@google.com, guohui.study@gmail.com, 
	jack@suse.cz, konishi.ryusuke@gmail.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com, mingo@kernel.org, 
	nogikh@google.com, ntfs3@lists.linux.dev, p.raghav@samsung.com, 
	paulmck@kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com, 
	ubizjak@gmail.com, viro@zeniv.linux.org.uk, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 6e5be40d32fb1907285277c02e74493ed43d77fe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Aug 13 14:21:30 2021 +0000

    fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11eaec05980000
start commit:   cc8ed4d0a848 Merge tag 'drm-fixes-2024-06-01' of https://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13eaec05980000
console output: https://syzkaller.appspot.com/x/log.txt?x=15eaec05980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9016f104992d69c
dashboard link: https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14146f2c980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12400be6980000

Reported-by: syzbot+3f7f291a3d327486073c@syzkaller.appspotmail.com
Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
