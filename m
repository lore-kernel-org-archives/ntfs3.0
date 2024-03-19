Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1457E10D
	for <ntfs3@lists.linux.dev>; Tue, 19 Mar 2024 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710846185; cv=none; b=l7BECZVQ59zNsjDnRmXYAhYocfr05zAsHEJqWVEHbHFQfsyWyKvriu/JZ9WOS1zasD/14MbuTu7a+jC3TBjMcupPZTGoQSWrJz0D04ze8cnTRlQAvlRsprJxtfgM4CDYExInnpCOrZn9FaYaNI7p1M1za9160q1i1qQqfxZN8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710846185; c=relaxed/simple;
	bh=slKjRaMkRRkHh/39qn7hwcXp2X2erWHCbqhQGdEu/ow=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sKVCXD2PqNeeepZVpO4iN959wVf6acDbkaatbkArvQ7lXSwsHg2emxBalXkyPM6ewC2patfwta+kUQEeB9Y62n1kyfwyurCszZU+gs9CahjG8pLw37lLewqc2eEaJNrZJduUxUsLJTZHGou8iV3O9hl+G3mhUIgsEn1J3q54v14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3684e301749so2777475ab.2
        for <ntfs3@lists.linux.dev>; Tue, 19 Mar 2024 04:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710846183; x=1711450983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NS31IZUVISj+9f5GH0XsvKxqqRb+tl8wJ9ZGlJagits=;
        b=Ia9hOaXsniuj1o2ANuoElX3LVwy2wX36C3qtRdiWroBY7ajUhP4oSecT6WnsI2h3DG
         VseoGr/Gf4Yc4qESdyve3QySiTy+FcyIj0bNNVsl76gWJiljh2OLmPI23VFiD4YHJfqN
         WojDCqgzlcso262mqDVArdCp5Prg68EBTe1eFy8cHH6KbpyL2I1AlB/EKuQ3I23qCOqp
         iRB5UqCOOPZGYQhi621vlwN6RjA+XT/+YBIE0TrSyyEvnmGUe5mD4DeijiZ7YIafsbZZ
         NQX39Li57GKXGNZNcTmK0qF+LF8KCtnDHQy+K3qhPNaHfO1l9qqsV5s+HG4PWZRiB0lE
         mMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWSD+T0jKJhsjT/EkzqxuPhELNzQtRO3ii3mdAMvyGiz02i2A7+qbabKSG6iTKvIbg3K1ZQuEaUb4W84mE+W8diQpXhY4=
X-Gm-Message-State: AOJu0YwSpRxQBZutH2O2SpOlaay60WfTSztV3wMODv2h4pvyPsHQzfqU
	fGAgyzEM6zbDwXlGxuZjO3Ba2gsJKi2iUtkxklRVHetzzAvIwwim8x80jXF2JrThGcTKYQxxUo7
	mNZ6YEqDh39k2q3yZc2+XLR4YQn3P9T+b7psz6lZtAs8bylmUnysn4vE=
X-Google-Smtp-Source: AGHT+IFiDK1WT/n8TCOKAH5CGiH/AJ5QTidJfxOX7D2n/lTfWZAch3GSOQ51Bj+zC4HRoLqpgpszLLuCibMY38T8UfSWzD9bvdOO
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c02:b0:366:c200:a9fa with SMTP id
 l2-20020a056e021c0200b00366c200a9famr121313ilh.1.1710846183604; Tue, 19 Mar
 2024 04:03:03 -0700 (PDT)
Date: Tue, 19 Mar 2024 04:03:03 -0700
In-Reply-To: <000000000000aefc5005f5df169b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000a1c180614016bc9@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: use-after-free Read in ntfs_attr_find (2)
From: syzbot <syzbot+ef50f8eb00b54feb7ba2@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	brauner@kernel.org, david@fromorbit.com, ghandatmanas@gmail.com, 
	linkinjeon@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 7ffa8f3d30236e0ab897c30bdb01224ff1fe1c89
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Mon Jan 15 07:20:25 2024 +0000

    fs: Remove NTFS classic

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11fafac9180000
start commit:   9d64bf433c53 Merge tag 'perf-tools-for-v6.8-1-2024-01-09' ..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a6ff9d9d5d2dc4a
dashboard link: https://syzkaller.appspot.com/bug?extid=ef50f8eb00b54feb7ba2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d79fbde80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14be4a73e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Remove NTFS classic

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
