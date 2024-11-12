Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85551205AD6
	for <ntfs3@lists.linux.dev>; Tue, 12 Nov 2024 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731381789; cv=none; b=S3iqer/sae3vy++CCuT28+YAdlc4eYIAJVfcRQqhOifG5uHJfQtHweFG5uRsn/l37XHF6q1wqi8FQlZ4ZSxUrvHnSQdpir7NgKnl0x6yQ6mqZPoMJ5Fa3/8MPuKWCFy0vKx3hGcbcslzo/NsTtVGxNanFdzXOcQrz8KFClM3kKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731381789; c=relaxed/simple;
	bh=c59rq/7n3PHZV+Suo9gZ6Sof0WvUW1q/ji67zSE35eg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gZk6dSM4nKc0AqjJ3eJqMR+40nGnAByFdqk0RI8cwEwedYRBNBs7lpLgPaKUrZRqkpxKTRVvBaenDcUfJfQ37ARuSFL8xUJ7bUjCX+XEuuT7KvXOJpGLeI3lRIytH6sriYqqwhFw0UcfipQqEAGe3tpGEgZTRSiByHKs6bU7xK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a4e41e2732so70500365ab.2
        for <ntfs3@lists.linux.dev>; Mon, 11 Nov 2024 19:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731381787; x=1731986587;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmAGIQngpXa/1+2VC6uEAt5s/OZNY5/G7HFFw9+3pkI=;
        b=ceVC7106xXLvTW7qKkJsdGXn8WVB4uQF02deA22rQIG7MShxWDuSuJ32ZehXrVDEj8
         KUigm45+LzMiwMNzyKX92+mwB+V/OI5iqslZhP1UJObeZbYuYvUkZEPD9IfoUNOrOJkl
         KWbhaQfRejc/sf6vqZTfn08YWwTtr5bNMky3OWPk4C47aPPRDA9lQOqpYMgTsaId8/cj
         uTfCxcHVgllXFrv/TDW89aYROUWEE4VLQi2/ccSgvZMihYGD0lazmTD6b8hcjTIuovrj
         CE3SfVLXsTYPgnBAtbNOtwbjWkXg7J0Q8czTWJOp27asCLtmIgSslBODT/Wf6KTMwIzg
         lXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdqYkEdmCvlYqjxKF7mNmEspRp3I5k3vJzAJ6rytjzyjfPrjxG9gCXihDhTgtLbgm6J1CxQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAyhyzAl6R6lsqFGPCWHFlssQ/ZU2FRZtnMHhcxQVr0ZRXruDR
	y0AGad7vBks1D7KYdlp3BUBx4AG71fasKaQgWgj23M+mVkvf0bT/OzfvI3ARnKsCND9bYWLuOFz
	j/o8VrLrxv40NPr97LSkiEtMsSSVYRcEwxw2OGgVBrgIvB+1wjxCYM/A=
X-Google-Smtp-Source: AGHT+IFnZynlEK9QhImG9NWvPseVWbTnlWM+8+8PwejoxDtnQc2IgH3PqxrpxZ8IU6RvIxJs5G11NXwh3DX79PwcdetZgOD4vPjM
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:348c:b0:3a5:e5cf:c5b6 with SMTP id
 e9e14a558f8ab-3a6f19e2641mr168214415ab.10.1731381786682; Mon, 11 Nov 2024
 19:23:06 -0800 (PST)
Date: Mon, 11 Nov 2024 19:23:06 -0800
In-Reply-To: <000000000000307a8e0615918f2b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6732ca1a.050a0220.1fb99c.0162.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in attr_data_get_block (4)
From: syzbot <syzbot+8e034d7422d389827720@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mail@seo-local.net, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 1fd21919de6de245b63066b8ee3cfba92e36f0e9
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu Aug 22 11:43:32 2024 +0000

    fs/ntfs3: Stale inode instead of bad

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17d5b8c0580000
start commit:   fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1a07d5da4eb21586
dashboard link: https://syzkaller.appspot.com/bug?extid=8e034d7422d389827720
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=171bf3a9180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1084f189180000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Stale inode instead of bad

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
