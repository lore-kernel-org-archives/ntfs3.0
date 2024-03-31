Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AD6144D3E
	for <ntfs3@lists.linux.dev>; Sun, 31 Mar 2024 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711899665; cv=none; b=c0bJLwskbxMWSO55gj4EYAZnQtp5nmQuPqbP/RgakdtFeagCSKlSYS/zDUzm6nzyWr8UdQrjRnKlx7MvhglKSIETte/ctgZvRon95yHNd7uWh26Wd6OvKKNYJLinUt82Vc50vydiIbzxK9QWnw7/kFXhUSsahf1hiZl2atd1S0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711899665; c=relaxed/simple;
	bh=Qz+nEJwMajHbpH7CBV1E9kYkMSV/cyOeBB4MlSGQNy8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FDMhc/lodpWggQ8h6Yo5NTs5sLvSwNJqgeMp5j/ywdJI3ON5wnU+ECRjuZ+0Bc+nNb6aVHamCsvB5b4XC3en/CNmlBD7G8wJHr15qZycYqCfihRXl8BGsFexfkpepy/SGfp+z+7BEPTeWUaxuQUKwq4oPmh7JI86Qwu2yY3wMRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c88a694b46so298216739f.1
        for <ntfs3@lists.linux.dev>; Sun, 31 Mar 2024 08:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711899663; x=1712504463;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RMPIvofFZ0pzeDlA+dJFHUiRuMTw5ZBBa6f9TDeB6IA=;
        b=gGxjLMnIkqpmurFKycqboSeSAd5HK5sWh58GG/+xquCK7bl6Cuc3HRywYoIikg2u1B
         4EEh6cZG1FLt5lkro1r1eSCB+lF2GjUaqJTzn7jHIkgwFkxs9714TF87lEN2hB+Ov3aw
         tVxJ5wc09EZYJAgqh4M5uwVtfnh3/xkyahn6IifSfJrCuj3A62ZMqmBuooJYlaFoNXc3
         TVgzMLVbTKDAbW5fIRIhudjGugTQuMRsKmg+BU5U2Hwjt2+qTFooZ+KxMm0+QC92kq35
         /z5t0R9bi+/tZpCmZbmZ+d6A9HM7FQj6O8WrEW4PsF/vYoYbCgGk+NIMw8YvfS/miwGR
         I/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSLzaa/DK5sGkJ3n4/JcyyCrNY7B3zqULSewFl1Z3R11Ya06zTXrgo52JT0qCvDBD35vzUU2Bv41kHu9Ty5BPMZNyqzkU=
X-Gm-Message-State: AOJu0YyFSfpIjdlfIhltCdwbjrPJrH3AAuDTjsE6MsHKAODeYoUkAuaP
	k0Rlk6uz/kM5r/UcZmJoDfYrGMgNE9Mp+pMXK4wnCCnycBDUv2RYIOM2FywMYUknk55hK3U7RQ0
	NWHz6EATPpUS52v7eRqiidDzHcowjrM931UerMW1BwmtYnOwhrvzdFKY=
X-Google-Smtp-Source: AGHT+IEs3YkKutFNOonb15d5RKFj0anpMUEzpVWKAAfIa29yd9R+rbNaHMJtBfq5H3RMplyKrtWIE7u7ls65Czyj4h0zrEBkTqeb
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:140c:b0:47e:b7a7:f4fe with SMTP id
 k12-20020a056638140c00b0047eb7a7f4femr286348jad.1.1711899663146; Sun, 31 Mar
 2024 08:41:03 -0700 (PDT)
Date: Sun, 31 Mar 2024 08:41:03 -0700
In-Reply-To: <000000000000e05bc805e99789e1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000504d0d0614f6b3dd@google.com>
Subject: Re: [syzbot] [ntfs3?] kernel BUG in __ntfs_grab_cache_pages
From: syzbot <syzbot+01b3ade7c86f7dd584d7@syzkaller.appspotmail.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1636d11d180000
start commit:   42dc814987c1 Merge tag 'media/v6.6-2' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4ca82a1bedd37e4
dashboard link: https://syzkaller.appspot.com/bug?extid=01b3ade7c86f7dd584d7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=118cd46c680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=136d04a6680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
