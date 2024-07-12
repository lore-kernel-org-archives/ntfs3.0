Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC10176AC7
	for <ntfs3@lists.linux.dev>; Fri, 12 Jul 2024 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720804205; cv=none; b=OP7T3++iHhhGYRMk9NVcwZUzq3iJa7xgx3IAnueuax+JAqKLI4+Aqj4Wm2oyCtmUFutZ2X3dXBTZ/7h+1JgGiHbHofbtULC94f9mpuGHN3aIU5F46DwJoTRugmzEmGbcr2Gg+5dIxDqyRSU0UA9RK3tQ3dG7XyyBEK+8NE5JhCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720804205; c=relaxed/simple;
	bh=16jfph0RZCWtvIyndElAe3dvIat1XCr05PdV7AU7tV8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sg0mF0FxPq+Nk3e4iCrGeyzxfhtWo5oa9KKl+lq+I7DpHn25AWmK1wK3eNtg09G33Lmkwb2bi0DkM/2gjWhO+e1sZW4hs+zD5ZWgBWJ2xaCTJVN6p0B/VZXDapTu9HwWddXyECo+wgD6jZQwhRlGrg36r8dBf35rroaMF1FF4Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3810df375d0so25237265ab.0
        for <ntfs3@lists.linux.dev>; Fri, 12 Jul 2024 10:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720804203; x=1721409003;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMTg6foxnmww8UGT4+LezD+QiVNDfhqGjXbeHbYDlWQ=;
        b=wxLYlRsFfAJ5l62ZcECgPjRRkff+Idg8bsFwFg/uR0DtruFuWF1MwZubkJ5aYRwWqx
         dgp19TB11K1OWH/3pFV8r+WoOcEF9l/V80UxloCeKU9tPwbHJu9UoUdwr/uCr55ydXvA
         sxN4Uk8+8UVmh3C9A34Ng++FKlNFkSKRGk8OWOAFS5jhl6+GnWAz3xlcNSF5xz0IDUvE
         w3gbdiMXNapPTWS+tCOX0BICpgK5k63pi0RgWTbrg4NCeo+1i9A2JlaA87ZW+Ht9iEYh
         Z10PHiD9Zw5ZvdYWk49bLAs5I4uRDZyx10d65Vdwg+PHDt/I03cvFbxpKTqhew3nWFlK
         Yh4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXENi9RDIX2qUSj9lSA0FqhENBtSMPH2TKuUwMIrQZDFF40GcKAss9bhXieeRjNYoU6pSvZ13Dd/nxV89SEhex6eByuD78=
X-Gm-Message-State: AOJu0YwmU/E0B/TrkQe9SRQO7qoswV2kOn8JU3345DyRAW5bY3jdBsRl
	AGAKKO7wioOiwA+42qu0A5NE4EtzZ/Oq2oINGdT6qnJpGpdnTva7AOWW2AB4aTJm2W9nWheXe9i
	/Xt+nJx0AkFS8Uugm0c+ogNSIIBn/e68uxbsO8xxBbzXY2wtu0U2A6AQ=
X-Google-Smtp-Source: AGHT+IEJZjuf2gYy+pY3NG98U4qzYz9im6X+ZVcZFK4JUGIwyXYeq3SI6ARl39NV5HXFsilDRS+qHnJ5t/xjG8gxi5VZZXF3EzeB
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152f:b0:38b:462b:8dd with SMTP id
 e9e14a558f8ab-38e62268c4bmr2588145ab.3.1720804202911; Fri, 12 Jul 2024
 10:10:02 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:10:02 -0700
In-Reply-To: <0000000000001e3b8505e9f95e3d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003e26e7061d0ff386@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_read_folio
From: syzbot <syzbot+8ef76b0b1f86c382ad37@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	brauner@kernel.org, david@fromorbit.com, linkinjeon@kernel.org, 
	linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 7ffa8f3d30236e0ab897c30bdb01224ff1fe1c89
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Mon Jan 15 07:20:25 2024 +0000

    fs: Remove NTFS classic

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17bc0ea5980000
start commit:   2a6526c4f389 Merge tag 'linux_kselftest-kunit-fixes-6.8-rc..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b0b9993d7d6d1990
dashboard link: https://syzkaller.appspot.com/bug?extid=8ef76b0b1f86c382ad37
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117f19fde80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ceb0cbe80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Remove NTFS classic

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
