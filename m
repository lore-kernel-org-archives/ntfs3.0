Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5015A8
	for <ntfs3@lists.linux.dev>; Sun, 10 Mar 2024 02:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710036306; cv=none; b=kpo7pGCZOy+xr459icsDB0XIJdeXsWIcFsEkPp/mhkmbYir4yxrmfmeki0yRJyNgUBXBd0vJWVmDy2OpJ9f18oSkuKah2b1asaQGAyEKzjL8HNNOxCtOCQEX/E6xMwm3Co+BPoO9f58cxfS7bGEVV9653aOnOAh6W5EP4IZRUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710036306; c=relaxed/simple;
	bh=AB9oIgX15HDPukZy2QrbAYWK+ICd94A+UY4Tldqk2xs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qSR/vJwHZmWrMger+0iDsGEPT5iRUaMahm4nMWM0BxWQfKfiCKPjC5y+qcM1lDbATQkGyhcAgdE838Hz+AnCz6pq6D72u/Pmp/PNHaO7/4kxGhRJrEe0J4YD7xOnmHiqIvveUA8p49Q4xXsUF8ExTMj9fXeTEPhHriB5ur9t6V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c874fb29a3so328109239f.1
        for <ntfs3@lists.linux.dev>; Sat, 09 Mar 2024 18:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710036304; x=1710641104;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAtcZ0jcmff76E8g+uUmd6ptddX0gjsk2MQCSo48DN0=;
        b=qAFxdRSHtDUOOWbjJX6dMTqP50Xmg31ggQo6Aci9ZPNsMx1vZme5UnzOdnCNFh8Clj
         PUcfti+nL35LfEmlWrgKdPLSrNMLilJMnzm7HoUYKgswBMyqtsdrmjURhW4fDpYkkGc0
         gFe0k0jgDew+RoJToXYaARrXWRTwIvwnlGLU+HY3qs8bwZowTUVAkhts3t51wdVqFyE2
         miw0EVcuJMakeNNF7vN1d0TV2cWkV7R5PGyLGiYILJ+TUXJxVNYuTOaMHhVPyA4UOrT4
         qPmIvo3u392KySkA9DUsrU6i2+29vXpnm0rtPfXos83qGvvBvAJ6spZs/MOJDg6o+1tN
         LrgA==
X-Forwarded-Encrypted: i=1; AJvYcCUuzZktcEgEuJkRooFvzKu0J0ZSlErTvAPRtBR4AwBiV86M5iZIA4YH/seU+wiD+ASV3nn/myf5fypNvUeclUqzR8CnRe0=
X-Gm-Message-State: AOJu0Yw62dREU06T0HHSRO8ywnFPzMki0wz3PzmSOmRaQXEtBSYnK59z
	vURwL0r3REULBrlv6y78OAr5SwG8NuC36tJMrCetuys1o1HNxZaKdq/zQniOBrh6wmPfiljNbNE
	7hpoqahqvnHGa7Xi0EdJKzXgN98QWiXnPvXiknI223D+QOh/4bFWMHEg=
X-Google-Smtp-Source: AGHT+IE6e/IIewGxQAV4bqB6X0atmmjTjDjRrTeEujE/9OhtcHQe4bLNbPc1G6ogefC3EoR0pjUbedvrrFrSIyeg1cQ727HyyOZJ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2dc5:b0:7c8:b219:4547 with SMTP id
 l5-20020a0566022dc500b007c8b2194547mr3316iow.2.1710036304535; Sat, 09 Mar
 2024 18:05:04 -0800 (PST)
Date: Sat, 09 Mar 2024 18:05:04 -0800
In-Reply-To: <0000000000002a6cba05eb5c7fbd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007c3484061344da08@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in map_mft_record
From: syzbot <syzbot+cb1fdea540b46f0ce394@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, anton@tuxera.com, 
	axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b28b99180000
start commit:   e4cf7c25bae5 Merge tag 'kbuild-fixes-v6.2' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=68e0be42c8ee4bb4
dashboard link: https://syzkaller.appspot.com/bug?extid=cb1fdea540b46f0ce394
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151db82a480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10f0e670480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
