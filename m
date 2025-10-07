Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D142AA3
	for <ntfs3@lists.linux.dev>; Tue,  7 Oct 2025 00:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759798025; cv=none; b=ZNPXGkMhv1ErKc8vxeYVKDFj21HwRAOGWRJnLkPEB2M+C7tGEjckBj+/bNCsEMcWYYkG8E9kvOKFrA0sThXyBhjRv5cPu2h7JXoQEha1E5gjYF3I93XJCDxyvVGqTBKJT9JRlUtH3b+bEN6P+gSraG9tTx2WefKVmUrtmUtoA88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759798025; c=relaxed/simple;
	bh=/edHMvz+Y94IkGIsLIBbfy4ZTCY+RKCL1yC1EXnf1Mw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RRGyhxA4aFfOQ5FVzBl/ax5JhnBhcw5Sjin82G/Ny21nlgZP5UOZgsOKfHwLsdA0WXqEu5ReqrQr18/oZr99vhXT2l2UxVJGHpCl5tvtPeVbEXkXof5RWXwxGCQQAsnh3ZKktrYNAOGcjegEf8G4G7YMyAD/fUVJLibWRj5RRwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-42f64261ab8so85774215ab.0
        for <ntfs3@lists.linux.dev>; Mon, 06 Oct 2025 17:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759798023; x=1760402823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PbGjzVRxtTuYpOOcutOEgeT9EIRHwUbach4rkxczu8=;
        b=GAYvC2ogrSG9+y/A3y0ht4WBKrOAajDj4jsYnaR8Yb6h4NjIn5JrCxzMI4iZ2fUCCM
         vsG+BYNQemFxhGpczWo7HYSaUqCvNev2xV+5br3/S0YRTLptOWnxYgy2kB31ilwurmHr
         BiLoZ3wObDDRX2NmkpcrKrd1dS81jVGyGFk5au1uD14dD6gqFGiDU6yvR6z7Duwp1Tor
         hx0ebYFDlZOAnQCj4FXZqjAQMl2t1fTsttzOMXfAiVwHLge2zZ3DkzVEHguPmc520HY8
         MlhV5hdbFp1ksUMMFgUrD3MXYT1ivRcJNraExjA/vEpA7ppHH1H/0UcRj0ujqqgHsAbt
         TY9w==
X-Forwarded-Encrypted: i=1; AJvYcCV0PxqULXXf3GuY7jGogvmCh/UA1KGp+UOT4eljqCJQqAB62HHIxeRPJnFqtI5BA51UnVolRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJdKsJ6AIfaf02uwdfn0IJr84/47fbw5V05w487NN/YTBnfIAa
	KPcIA9765SZnXOhh0aquQON/+SAfsztSR188pByurlbYgyJN/5jXOP2cOnR/1caMDL0/ttPFH6k
	3vf5jTK+EqpWIIBm3QOozLFose2dh7dFhS/QxsjxusCHm8ldO4h8XCjMKylc=
X-Google-Smtp-Source: AGHT+IFuQmXH2Y1R/sHKs/tHlrWglwesCLeiRlwymjn5Hs9AoFRCepyxaawNkimFNHgnmEwnlFaj0zeCnge1l6GKUHCHKJSkJGqF
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e02:b0:42d:5d48:acb9 with SMTP id
 e9e14a558f8ab-42e7ad0501dmr176812735ab.7.1759798022940; Mon, 06 Oct 2025
 17:47:02 -0700 (PDT)
Date: Mon, 06 Oct 2025 17:47:02 -0700
In-Reply-To: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e46306.a00a0220.298cc0.046c.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] KMSAN: uninit-value in attr_set_size
From: syzbot <syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, nirbhay.lkd@gmail.com, ntfs3@lists.linux.dev, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
Tested-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com

Tested on:

commit:         9b0d551b Merge tag 'pull-misc' of git://git.kernel.org..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17a855cd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50fb29d81ff5a3df
dashboard link: https://syzkaller.appspot.com/bug?extid=83c9dd5c0dcf6184fdbf
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1609f942580000

Note: testing is done by a robot and is best-effort only.
