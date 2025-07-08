Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7121D3E8
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752012666; cv=none; b=qUIdOX5vvrcnKr+JSVq6MoL/xxJlObD4Bb+bI36VVwsI+QKhmpkKeaiv5WEvCWHy9JYjZu8LFCxQEkfJtCbMjvGoGepd7IalyhbK9qDDOVyynonaulbUaA1XMCyGn1cJNoFULCMOAYMPlCJ4IzJw6/Sbnig7RvYM/O6GEuCONDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752012666; c=relaxed/simple;
	bh=KXDA83ZiDXISN4tZBtQNbfUmGJROqq3LQYJ87Wpz870=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jSkf6aVb756InPqpE95kP5QjXrSD6MByyP5nRyGHfnpnm53YBgHSdUUZA8b+Glp+sfUxxpVe5zuteETvqXZEn8rpCRexo3/LEX0NAl8guMkeJkIIemF1gC4pgHAt1XEU9i/dyuoAE4INglYlx0S9xVtddomZr07MDVGkhf4a2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8730ca8143eso44024339f.0
        for <ntfs3@lists.linux.dev>; Tue, 08 Jul 2025 15:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752012664; x=1752617464;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbxIKRYiLLlWIozFDG0FU1H875efsEVNFgyk7i+C5sc=;
        b=tT9dPGGJZGqmMADIBtKGX2/a4izk4fTJMAJSnwuPsE74BfYx/MhC9nXavHe9BCKn8s
         ilClr1Cloc6fsib1GJHJ4upEX4MDcYdoFoKz2R0pL0rJA6NU/JTUFN8rqXPy1sSuX/Qq
         SGe6FfSvpkx5wwmP7/6RLmoqiVpEbosYM1Yjrx2ETRh4fShYeAHTDJw15AIQM5MLi7Qy
         aLMXyBIc9QSg3Beejobf6itG+EDPjJPw/MwpSeXVsA7PGtwAM5f+0igUw8o4Q/wuVZeC
         IoeDn+d1DnlCZnryAXjIrOhDoLLm74bfX9HLj5yFv27ZGD/O86SPG+4Am9prlIyNOMic
         Ap3A==
X-Forwarded-Encrypted: i=1; AJvYcCU5TyNu4b2fKc7mln8WX6x3zSJIjx2mXrr4Xt03VUhiA8p0FZT22eMHa/C1ve77W/O+2riQhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz5eJlDlyWLpUedOsMp+Z6B4+fA5fhoeUbBc2b/t5VT3dtofrN
	sX5nUb0GJbjhId0o8R52k8RbKag9T1V2iFoI61mWpLinJvPDIfVYZlC8htUKJIYtt7DO+GQBTCS
	gcAGzmqccAcIADpypHPW4xbXirclQEEsyAYIoDU5UAGlIQGURYPOLZvf0hT0=
X-Google-Smtp-Source: AGHT+IGBSDEPV7Qs0MTDCe42aw07FiTwokLQKCj/RmSQ+xcnhy82G/Dqlo3GGGcVJk7at4VE7sVJSLcP4Raz5WJB2Bm6SpubsqGI
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1747:b0:3dd:bb7e:ca89 with SMTP id
 e9e14a558f8ab-3e154ff233fmr49433975ab.10.1752012664123; Tue, 08 Jul 2025
 15:11:04 -0700 (PDT)
Date: Tue, 08 Jul 2025 15:11:04 -0700
In-Reply-To: <CAF3JpA7yXEB_Fj3AMtFG1OYLX2g9P3LFQ5f3qSSEcheB4axVKg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686d9778.050a0220.1ffab7.001f.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	moonhee.lee.ca@gmail.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Tested-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com

Tested on:

commit:         58ba80c4 Add linux-next specific files for 20250708
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=122fd582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bac86b8500d50c98
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10dc6bd4580000

Note: testing is done by a robot and is best-effort only.
