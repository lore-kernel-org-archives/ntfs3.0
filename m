Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9309A10A12
	for <ntfs3@lists.linux.dev>; Wed,  4 Sep 2024 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725418504; cv=none; b=pdT04Zx+iOSL7vVt+MAINPhhFMFRWSu2zwDBFf4stqf3nW9F0ew2sVt/3F48K5WB1cPcDblNsekok6HOEOQJf6J7Qnv0rtjNIvt3Jv1yrUDXma5aAdjEdAH/rllwIawFZC4hssiXj4Zv8HfiFoLomlrA0KEUM6G8ihuskybPxZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725418504; c=relaxed/simple;
	bh=dFt6bhuzA6jrjXoeg7I7jO9jE7J6LNj7D968IHxZuAQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JyPJ1A1kRt1Y7fLc5c+l95KJ5asiCy0bcQbj2vhAucB6zhkILyrYJWxTOsDRd2UushskYYUwwMhcs1B67XLpieWAc1JSJtftiAk8gjGw9otarua00LiRj7CvX5W2Rp1IVu5QzD3w5gRq3O6xHmPnONHfl+iic3a/c0ZTMMz4vSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-82a32368e13so550832939f.0
        for <ntfs3@lists.linux.dev>; Tue, 03 Sep 2024 19:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725418502; x=1726023302;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8+0FXw9SaP5q+KG5hfPrYh/4DlAELwos27XVrdnfwI=;
        b=Xbi+GWxlschsOj26V/rGD2xfRcYAZpsL/HdEFeAI1bIGl8tfPq3Mj6x3QoZaTn/mjg
         8abzllIMls0xPTJkxKyDrExoZADLApyM8IsaHeYFzCP1GfJwZYd5BvMno52lQ45VR5pz
         wMQMqGHmszdvJLP8gq6e7poeTVHgyVyuKVZ/9CWeJ1g7Oee2P3jBmMQmpS1sQZlDKT7A
         2ki5Lfgja6jY09wY7S87WzgusOOMoFr/QrkAXb+YiNxW013zKy1Tg0yV0RsuuAIXwdDO
         nU60HgtlWjGOT8lUuSUSr0uuKc+4ciYyGFSI1SWzOFDlwD7H6mE8mZ06kGUsbbvc7ohW
         XaCw==
X-Forwarded-Encrypted: i=1; AJvYcCUI/SYKyXDPza0XaveDLC5/4fpCzPngEuuZHPMf8ebQIdcgRNK5l0J+uWEGt2kb6xxd0hBu9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKRNksDwRxAFv1UwZnY30b+6j/yxWJTPqks7PRVZlaXokACr8F
	e1wog4AXSxRfho13iRl/xNPtFjK/SlrOoRTLB9uvlBkNsKdhK1vzs2UhFX5SiJUKhvXvGivFPT7
	s9g8MecyEHIEdy9ADaAlVB9Fr6n60c1J9jUHznSYLFgdYx6z9bfUJ4XQ=
X-Google-Smtp-Source: AGHT+IHyCNbA9TulbsWy4V/tefjdD+dbryxlauNSC6v8C3qr1955cAvIaA2m/4xgCzTGjZMYy1EIy68LtZfcSmwOcj5kR7l8sNJf
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6d89:b0:81f:c103:3e70 with SMTP id
 ca18e2360f4ac-82a2631ae6fmr69711639f.4.1725418501675; Tue, 03 Sep 2024
 19:55:01 -0700 (PDT)
Date: Tue, 03 Sep 2024 19:55:01 -0700
In-Reply-To: <tencent_A84BB764577146D01363A3640961A3B06405@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e1acf50621424c79@google.com>
Subject: Re: [syzbot] [ntfs3?] INFO: trying to register non-static key in mark_as_free_ex
From: syzbot <syzbot+3bfd2cc059ab93efcdb4@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, eadavis@qq.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3bfd2cc059ab93efcdb4@syzkaller.appspotmail.com
Tested-by: syzbot+3bfd2cc059ab93efcdb4@syzkaller.appspotmail.com

Tested on:

commit:         88fac175 Merge tag 'fuse-fixes-6.11-rc7' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1587c0b3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=660f6eb11f9c7dc5
dashboard link: https://syzkaller.appspot.com/bug?extid=3bfd2cc059ab93efcdb4
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1277c88b980000

Note: testing is done by a robot and is best-effort only.
