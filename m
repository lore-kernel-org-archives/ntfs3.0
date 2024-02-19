Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC054BEA
	for <ntfs3@lists.linux.dev>; Mon, 19 Feb 2024 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708381084; cv=none; b=pnDfxaqB9T2OH9WIqvdYfL7zqw/QvPLcPkr1d3LytHcqckXDPANBG2HUtzVOt0hjVp/M/PsQYlptT71L6a5DWPyPHS41p9TMIQoJCUxtTpJuNpP3pmF6X/w2oTtj+RbnfIkOUZEd4XY4kxMZAIjR1r9fjaPHqkpmB3C+mtvKX4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708381084; c=relaxed/simple;
	bh=c+0qPs8TPZcmXIQHMEQ1YzES3Yy34XuavJSQTscSXBY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Rs1J17Bzr1tvyeS8C/2vpVK4BBsRP+wCEx5TcMgO5W6wQr8G1focstgzb4xbCABR9MrLHx6vjtSXDDW66Kg6tm3IVPAj/GTnPSh6xgQ9CH+ud+vjxFhdD3Z4YiMJgIpeJXuskshBzNCZRbqsoGB8W7ibLTQtHxdclGuZ6Gj0Cmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3652d6907a1so14592445ab.3
        for <ntfs3@lists.linux.dev>; Mon, 19 Feb 2024 14:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708381082; x=1708985882;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4t2paFm5bNQPj52rT++RcxCOeC7mO3UVObeCBKBufjo=;
        b=t6CuvmWDKhKZUP+5a+zgzgUZmRceq/yK0AORS+PZ2VWZ2WA3/jSmHMgkSQq2hkZMOV
         hF8RMJSy9sHexktkrPQJCMh59isVRid7711ZmgRX+d/1VdVYGOjm2w06wP/Nx7DMMgdH
         HJ099OnMRk8ll+cUAiHC5E5wi/3OnaP/uXhZYHgSTH4lT0DbzNqwpO3dV2l5wqkMnWlF
         Ng6jr7LeNvA1U458TXFZnj5t7jf4d3cU9ZqOPnI/RwrKzqQ2St2FcFQpta1p2vs2iS++
         LhOqFVEuEGqYb8a7wzzArPvJpnqn54NH53uJJo6XoITue1BIlL5Tt8R6gDNqsbKHVr8y
         MPkg==
X-Forwarded-Encrypted: i=1; AJvYcCWwg4ce/lnm3HP7zpZlHQzuLViEpNDdj1r8Fm2I8vIVPpgMt0bW74JIJ8omxCdzuE0SAJXYcR6SpfUyZLhRv8dkY9AGQwg=
X-Gm-Message-State: AOJu0YzAT2t5CiqbHVT3yN7vriof7NzMmv4Zcuo4c3LY/+xWMsx+j+rn
	bpyYAc/13F5/4Y7+EkHqbzPatD8sHa+6Utcohx6wNNV/zJr3nLU2jRZte8df4C4/mDPakOc6qdd
	7kJ+a48cVrb3RAOusBRSJiCJs72cM1KA7UUNI9ZPHeOc2QoF1J/fJU0A=
X-Google-Smtp-Source: AGHT+IHNZ6BqQ00QXj4UQF0JzF8saHr7WBqtNu9rPtVFrdB+5HO6tIDSXWfK6Rsne2Np8ab/YzyIPk0B0OVZ7io32bkJWQ3CGOpF
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:c26a:0:b0:365:1957:551a with SMTP id
 h10-20020a92c26a000000b003651957551amr646218ild.4.1708381082710; Mon, 19 Feb
 2024 14:18:02 -0800 (PST)
Date: Mon, 19 Feb 2024 14:18:02 -0800
In-Reply-To: <0000000000002f18b905f6026455@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000937d8c0611c377f3@google.com>
Subject: Re: [syzbot] [ntfs3?] UBSAN: shift-out-of-bounds in ntfs_read_inode_mount
From: syzbot <syzbot+c601e38d15ce8253186a@syzkaller.appspotmail.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11390158180000
start commit:   022ce8862dff Merge tag 'i2c-for-6.4-rc6' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7474de833c217bf4
dashboard link: https://syzkaller.appspot.com/bug?extid=c601e38d15ce8253186a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11bd01dd280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13678475280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
