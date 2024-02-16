Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B195125CD
	for <ntfs3@lists.linux.dev>; Fri, 16 Feb 2024 04:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708059545; cv=none; b=vFkRwz2W2OypC3T9OnspNGCZMI80ZErg7RjDNtq76z9VMqk5oUxhQvhXxB5Hct9OntOB+ZtU1kwXojOM/c+5fp89iSANm0YoUyZkD6ce3U+bk01UVi22bm49kUHBNK5EaDktxX+s2vLjoQBlrCNMGx1sMzLFx76eOLVX20PqaA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708059545; c=relaxed/simple;
	bh=+AGLJ+h6ksQ1LMrUfaPJw1kfoY13+VERfmtwUV0/xm8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ax76+92K44iu+M/+pobI8GqHCd8+yVPDmrPW4DGfYF/4wSC+eSq+rQNpaCGrIE43yN/JNQNdGz7aHw/MUIoWzv570mCtoYOyNDKiFrJyN1F6SqeNZkY+Grmlpzzwwtp/1lNQisyilL0wnt8NJLRPbySmVZPIBd/Mis1bNXDLH4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3650bfcb2bfso1667175ab.1
        for <ntfs3@lists.linux.dev>; Thu, 15 Feb 2024 20:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708059543; x=1708664343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JculTRychqwIzbiVTR2hbbWMlo9K2vSRcy7NOSpjdFc=;
        b=bOvkiwbyEAyTRJXOBAa2e2ii7cjHyhSoAzY8SjUjPRTqfYnHJvchrNJsGfC4NJbcVA
         +FvW0QaAhbNxDLSmsLoGwNmiJvKG3B96x26lkPyAhZHax9WfnOX0TJYFKcKdhs1LPCC/
         kNZGpLxyhNt/KWwsNvHICbZJxxFlqKPuITW1eoNYKwFeTtuYoM7tnH0qpIbaJeDSGH57
         Px+RWL/w/85m3gGuxGWSnlhSrYjK22/PatZHOGipl4nPdnr5EKMKPO+hFpqENheAGEYR
         LwTp20PjLrh7DaT7MOtXmgtES8xSviM1TbmVaGtFOHzXG6s830HvPoLHOhcPIUjLDrFL
         udfA==
X-Forwarded-Encrypted: i=1; AJvYcCWpoJLcX0nm9mY1qE4f//+Sn9emAb1X7vVhVhbL02CxN/6tIbCW2Ux9kuDSulxS0qMe7up+goQfbtZ1aksthlraipJSpmI=
X-Gm-Message-State: AOJu0Yx09idrFTj9X6Z8ePz4zSPBrhhAK4LIi++eQ8I2ibx7tCYnKRLP
	XogdM24wtNqXBAZc4znRkCW6wYQ6E/ZDyYoOqk504WjTUCNZ4OruoIu0ftJDIDbFgGs5wog8nIy
	3cUE/2BqY9mqhRBY4ibi4VB4TISTol66qea+Futd2t7N15njF9WYP1ac=
X-Google-Smtp-Source: AGHT+IG8V/bytoc11b1/xnBwTe9cwikfexDe7rGUBOXKjOIuOWeIt138WrdbT0Z2LLvL3fWDIHkULxgTTGnYyB59KvUPbLFgzdS4
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:c568:0:b0:363:8b04:6df7 with SMTP id
 b8-20020a92c568000000b003638b046df7mr297584ilj.0.1708059543346; Thu, 15 Feb
 2024 20:59:03 -0800 (PST)
Date: Thu, 15 Feb 2024 20:59:03 -0800
In-Reply-To: <00000000000096592405e5dcaa9f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005626e80611789a1b@google.com>
Subject: Re: [syzbot] [exfat?] [ntfs3?] INFO: task hung in __generic_file_fsync
 (3)
From: syzbot <syzbot+ed920a72fd23eb735158@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	brauner@kernel.org, david@fromorbit.com, fgheet255t@gmail.com, 
	hdanton@sina.com, jack@suse.cz, linkinjeon@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, sj1557.seo@samsung.com, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=131679fc180000
start commit:   200e340f2196 Merge tag 'pull-work.dcache' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3f4d6985d3164cd
dashboard link: https://syzkaller.appspot.com/bug?extid=ed920a72fd23eb735158
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15dd033e080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16dbfa46080000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
