Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AE51386D4
	for <ntfs3@lists.linux.dev>; Tue, 27 Feb 2024 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709034606; cv=none; b=UL69yaFt7j1Eh/2JZ4STfrMzRWn0n0Fiyv/mmMqgiFXWMFLlv0DQ5gPycGRsh011PgvXABP5L0La2fheQyBCMTfUqMCfsyPo/ydVuIZk1MRgOsMxuQgC2Jne45yS4CaHfE4UNhm85DWgCjxLfJeKokaGmMO4g9albs2Yw69+pzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709034606; c=relaxed/simple;
	bh=d31DUdbEAP3glDQzF+uAueVXLU8enodsFh7WNYdtTsg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NAOLLcjxBAg0RlNgHjUnxMU7FK6Ha2sbrBpCLR19QHFpxfPhe6A/UaQ3h9DDqK3I2TkSmgV5UzOb/RcEglMYxvQcCv+kQjX1VrrTZkPvJan50NG0+t1wLn3S+4IODvG7h1ag7VhcfPDI2Ooqg6FFxwAqJzMDgDCRL1YDXVPMr+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3653311922eso33647385ab.0
        for <ntfs3@lists.linux.dev>; Tue, 27 Feb 2024 03:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709034604; x=1709639404;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tH203RrzLyAOiwyFP5B31fo86XWdWzsP+OL8gKwsz6A=;
        b=vDxaaI1SdIbASwbgz6bLS3vqHAVjuOZPmw/D6kpdHT2FcHPdkyvsFr7Kt4HgzBHA54
         KXPqpIEb7LtzTDvG5uS+1ySP36mEowAqFQkTHtQXK5RVotfg/2RBM+Lfqfnmqf0V1ND7
         TnzeIW2mDtz5RA7oW8VOixZWAI8453b/Exqawmrnp/mxm+kZV+qpsxO2TLeN3eBn4b6/
         w1/NWjOkCNlzeEwecs9XePAC5G+drfZN6io7m22aSryxEubBI0X98jqz+GywVoFr/eCX
         XRwz7GcOdb8ikC0eydH3HB9ayTHTAM99dL4O692LtOoxKwTpM1h131tNhk27z94QAqpK
         vaDg==
X-Forwarded-Encrypted: i=1; AJvYcCWVLE6I9rxFKYuGMq4rByPtXMWZiwYtiescXMn0h9uXB91qyYagONcEGwfNVH9nWYi8mtZFk6IDcQKAi8knKXZAxxIk8tk=
X-Gm-Message-State: AOJu0YyHIqmRgvolCFPTDeLMuBqM3UB5NaLwrk7v/3MmQMAXwr5NuNV0
	/0Fua9EFP+36uItTk/5Earopk0zbt4WOEq/zlKNFBaT+/eg0qR3TSsJC5KVDP4IElquavj3C13X
	z2sYEIKbGxPfzwBQc+x0+GG4a+5V5VSiGlNTJEg1jdjTl7lZu6dOJsUI=
X-Google-Smtp-Source: AGHT+IErUXetTcqvT7hKSEl4qfD4Oi1EaI+bTCZF6SZx92+OOHC9FGESt/LzHWLlFekaHASkBANwL4udJotYzCs33lO7v8FCTsQL
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1808:b0:365:21f4:7030 with SMTP id
 a8-20020a056e02180800b0036521f47030mr743713ilv.4.1709034604595; Tue, 27 Feb
 2024 03:50:04 -0800 (PST)
Date: Tue, 27 Feb 2024 03:50:04 -0800
In-Reply-To: <0000000000009146bb05f71b03a0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008414ba06125ba07f@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: use-after-free Read in ntfs_read_folio
From: syzbot <syzbot+d3cd38158cd7c8d1432c@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, linkinjeon@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a70f4a180000
start commit:   ac865f00af29 Merge tag 'pci-v6.7-fixes-2' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=655f8abe9fe69b3b
dashboard link: https://syzkaller.appspot.com/bug?extid=d3cd38158cd7c8d1432c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12769ba5e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c2b97ee80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
