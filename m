Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFBA64CCF
	for <ntfs3@lists.linux.dev>; Thu, 29 Feb 2024 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709202545; cv=none; b=jbyYSx1i5cjN20GHxwRD68kX4oa+Zh60rWyXO3vtunrbea30nka/hz2EyB78znRTQC+eMRp1bcjCufNeWavKZ0G3ylXUC3+Ehs+AmUaf5Jy4s8xBEGIa0vZBGyGbcGKdyDorUqU+1FijtXbpxf+cxRF+09iEcSyM9rfFjY4ftIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709202545; c=relaxed/simple;
	bh=G/v8tih04oAC4s//9EOGB31fFEFCAiSTHed4T5BB2i4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hYImIQO5wYtogmlSkhvct2cg07m7WCaMCY/EWjuAaHbkBFjDAJi9p59ce5NjRgZUvxBp5CXTMp9Iw1MrZyAnw1GPWes0U9fkCvu84UEi6dsXv23XF9TEjd5vHFp2uzyp8w+XdqiLIMjyEUj1N4PmW64p9g9pAAjrVDZNYHyDXmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c75dee76c0so55189339f.1
        for <ntfs3@lists.linux.dev>; Thu, 29 Feb 2024 02:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709202543; x=1709807343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=due3BSO2Q9QQy1tfU+DhYvgI9lxf7h7yLmfxg2bj9yE=;
        b=BUktUb4lPeBGgUiQddUx7zoNCyC5RHTFDtboJWivnsM8dFOCIll2c6ledbbYmwGlGd
         PB78eWq5N+lw2rH4vDxV37i4fK5hMnn9GMXIrDOo0Eo6XVRTux6NUw6nK36wSO1X5onP
         F6TPec5OXyjwHcPjQnKMgS1lY0eeznNHKaqUZ4j6wMbZbiXk97ekLbubRsyJgRBFlMnF
         0Q+y+OB4YJOKD9OB3H1EC7oCLvnQyz4iE5G2ejGj/uixY/nbYED/06XcxBkY6lx/ymuQ
         XFLWBiPrkcpvB3+/bReUIUe2NT55SHzWtTvRocyU054N/GY/JFbqlDPrQb5ysmGqh32j
         WQCw==
X-Forwarded-Encrypted: i=1; AJvYcCXPZfC2U3xbYWy2IQQnPMvCsYYOzHE+lvhesv1ZdTn/4A1qtUDlnqQL36MXxc76rJrgsitXeZzuH5rjXbUi4xfHivQ5jd4=
X-Gm-Message-State: AOJu0Yy+F7yJtR/DyQh3qBT7wrSmocsteJCAqNT1z6FhPYPkOMV9AeGu
	aq4vgVWzu3sv7Wy3k83/D2pEQsnuAwCf3d7kMunT/Og0mb5Lh3A+Yl/Xrt6sdNk4Acly2i/xd5p
	I22IF41qeQQht3tinTrPVT/s8Du7/nmIeH3I2LmhkXqZSHqD3BCtOVwk=
X-Google-Smtp-Source: AGHT+IG2pzGB/bSL5lyIW4of4SnG2AETh2eVcWNY2PjmAky9W70Ne3ilD1c0bgJEXD2NQSMBqAVmrCjpUxXXw1IVIbbE8VsD2goT
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3c45:b0:474:ba84:8ded with SMTP id
 bg5-20020a0566383c4500b00474ba848dedmr69269jab.0.1709202543676; Thu, 29 Feb
 2024 02:29:03 -0800 (PST)
Date: Thu, 29 Feb 2024 02:29:03 -0800
In-Reply-To: <000000000000602c0e05f55d793c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007717e5061282baa0@google.com>
Subject: Re: [syzbot] [ntfs3?] kernel BUG in ntfs_iget
From: syzbot <syzbot+d62e6bd2a2d05103d105@syzkaller.appspotmail.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=105d5a6a180000
start commit:   2639772a11c8 get_maintainer: remove stray punctuation when..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8e72bae38c079e4
dashboard link: https://syzkaller.appspot.com/bug?extid=d62e6bd2a2d05103d105
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1358d65ee80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10dbbe45e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
