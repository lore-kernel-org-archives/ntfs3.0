Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365E84DFF
	for <ntfs3@lists.linux.dev>; Wed, 15 May 2024 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777945; cv=none; b=KR9S3IXXezOzoZz4A9+L+ahJH/JCjjJX3DlKQVmKj6GygetbL7Y9XKZ0dB/Uj3rJ0cXcnqqXKp/bEJYkhtok7hBBPOVqwrTaT/Oukeh0Z4eJpdtlEh2SJFEWrJsLxSqUoh5b8yAuyWsQbr1mNtLO+ETtetrJGd2XWMFhIXy6k70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777945; c=relaxed/simple;
	bh=pU0KDP8PaOrGc7nhuKl9eruKdWFqqXHiWy9Dth7iatU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WpmY0ff/UfgBgQJ49rsacbt99eQUa4BMWAwZFxkkYSIlTAljpuHkrqbPlcqtkOYBnsGP7drJexVR2cOmX+xniCLMKPY0VNnnOYUvH1IJGKoYE8kPPqTi3ToBIF/F6n2uJQpGHXqSiROBiCrle5u74Vi5NLiIWngocne6mCw4ORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7e1e409d1f4so367185039f.0
        for <ntfs3@lists.linux.dev>; Wed, 15 May 2024 05:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715777943; x=1716382743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PdFyk99KlLZYyjH5ckDM9d4Mbdv6L9rZe9o8cYGsMQ=;
        b=MiIqs4ogae4NHhNVSrKwZ2hWMscf/zt+qw+CHwTLeaBCWUJnsct8jzRbq7kE/cT5CK
         D8QFSC0mT2gKxw644+RxLLWMAGcXaXFjRlWgQ0AiUnsYZvo+util6sRZonZCrlwWNrvc
         a4HXdpKrcJRBrpt6iOlF/AUAoN8hVFub1Ld4+b2X8UpqTSPubT642vQDYM8D72T+Ff7H
         sgSPSYuGmoNZrNDDzMVGNqgCZ5Mmlvcmh60kltjVeG5PGe6LcxZPVrs61fd+/nJsnXhc
         lfj2SnWYHpw1ngX1w2O7Rtq52oAteXixmoH+dA5aBnaiNv59WhBY4jXP92HQ7XWNwOm1
         l6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVVPoehAaZWh/yUl5DsZbeRy2R+AssyH/A3ZYQDi0phOrcueFN3VVruBTPqisf75PMcFTpslRiSCVPJfVxX8g3bQ8IjyZc=
X-Gm-Message-State: AOJu0Yygn6W0mw6+3/VzUnY1aQgrq1oBcUqtUGpgsO7yLec5kBPuJW+o
	EV8LKEgSQWuq/6vVtoVtU+VwUBzliLR8wOznnYG7vEXYp25FTjKZrG3xzMXImPO4CrZTmjChgWc
	eoQWa8z3cFyTukkdNYCx/0ffSDd+9Vogi8ZJremoaMpEI4+5BuGuBjDM=
X-Google-Smtp-Source: AGHT+IGZaAUobKyp/kGTV7THt978f/NL99WtCI80kanlZYj9xf9fMiK/SHuTneYWfG0Bcc4mFoW2xRU0e7OFh7WGF+spPvbLpaY9
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8305:b0:488:e34a:5f76 with SMTP id
 8926c6da1cb9f-4895955b89cmr1154319173.1.1715777943434; Wed, 15 May 2024
 05:59:03 -0700 (PDT)
Date: Wed, 15 May 2024 05:59:03 -0700
In-Reply-To: <20240515123946.874688-1-andrewjballance@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d50ab606187dae67@google.com>
Subject: Re: [syzbot] [ntfs3?] UBSAN: array-index-out-of-bounds in decompress_lznt
From: syzbot <syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, andrewjballance@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, skhan@linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com

Tested on:

commit:         1b294a1f Merge tag 'net-next-6.10' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15998648980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c0cd0c5dbf8ea592
dashboard link: https://syzkaller.appspot.com/bug?extid=39b2fb0f2638669008ec
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=115b78f0980000

Note: testing is done by a robot and is best-effort only.
