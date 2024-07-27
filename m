Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA0742AAD
	for <ntfs3@lists.linux.dev>; Sat, 27 Jul 2024 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722115806; cv=none; b=ZGfZ0TjZApMzg3b9PmfS52hSG64gbyxJrnNTHzcIDXKFa2V2+KBc7glURyBLBFglwA7O3+PBoJS/opUJOXBnkFd16wu9uJAds7U3hOYNbVRE4uC5iljv995eNp2PL+qQxTeKehQ8fKnyYJiqDKbmNpZ/r/4V9EgEPmuUa8IhI98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722115806; c=relaxed/simple;
	bh=aVNeDwAcH3nhinn8KN74yp/VldGnmgYK31tdROz90MU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ge4fwcU/YxxZj9TV/+1na3jIGZnesusSdfghGfSYzpR8gtLeY/TyE2ehK8JClhpVwwRR3TvR2AWpC1pBSPrdlVSZE/MM799FfM9Er5vdqoHttZ/ME0UP5lNsaK97cEB5T7ZTJk4OPs52ZITinWn3CUSLpWSkIV/5QE8eLk1c6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-39a29e7099dso36573065ab.3
        for <ntfs3@lists.linux.dev>; Sat, 27 Jul 2024 14:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722115804; x=1722720604;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fsdRpaghEJ+/Dj0wdbkeHYQLI2pmFwp1Jcpptz5Os0=;
        b=uJHVe06PsqMxrvb721+nYCQJ5wVQgxr+r19l/HhI37KdWSSaRdFCP/GyGUGJoaoEF4
         A/+bnMp/7wBr97e61gAkWOBe4z6NTsYydNaNhF4ww4yppBxJQlHyEw1u3JLg7mxvoSer
         zmlGBS1SGS54rjWqlpOramT6w8+R6MSIfN7iE0t5XyDORVhkO9HAMTGMxu7a9ghBdKHN
         A4JvnpUmqF1e+w7nH6KgzNYx2BQnc6t1T9GRT38uUZvpg4y1rZdOZa2ij32ETaKK3gbc
         U5l0cnX/WOHbUplX+lPgFd3NA1nynhFEhkIlcfHQ9NLesQpL/r+iMRSETBpKJudFrA2h
         Oy/A==
X-Forwarded-Encrypted: i=1; AJvYcCV0pKCy+11uVkYoy92w7p9HPoHl4UXcb3xE33IQI4Nwvoe8c1Ffdp/50ZKW9nhLbfqcNNvlAeIP7JAunWyjIz+C88bGxjY=
X-Gm-Message-State: AOJu0YyF8AmMT8oPe8DTysh64fhm8CnWgltKK3ve5vRRDuZLafCmnOXF
	imgrHAm83zd6NncdiFbestEMCE/wrFVYFN+IskZgj/uzz+l7LZ0XDdK7YwnPxtnpyZL+FwmL90T
	fC6mNLJ0OGk3GkEsLZqdNBr4cNBr7436S9jhmJGmTHg50AtxDwP5GLjg=
X-Google-Smtp-Source: AGHT+IEUvhd20vFaJyfB7vqzeeapYRA2ugZRDA9EUzCJ2ga1J1o4joW8dZ5gt42Tjtt++7T/3t4KQ3D0k6wJQCAiSA7/YhflOq40
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:c56e:0:b0:397:2946:c83c with SMTP id
 e9e14a558f8ab-39aec41b90dmr2735975ab.4.1722115804535; Sat, 27 Jul 2024
 14:30:04 -0700 (PDT)
Date: Sat, 27 Jul 2024 14:30:04 -0700
In-Reply-To: <0000000000002488fc061ae886f8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000caad4b061e4154d2@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_file_mmap
From: syzbot <syzbot+c1751b6739d83d70bb75@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 69505fe98f198ee813898cbcaf6770949636430b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu May 30 07:54:07 2024 +0000

    fs/ntfs3: Replace inode_trylock with inode_lock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17772623980000
start commit:   2f8c4f506285 Merge tag 'auxdisplay-for-v6.11-tag1' of git:..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14f72623980000
console output: https://syzkaller.appspot.com/x/log.txt?x=10f72623980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5efb917b1462a973
dashboard link: https://syzkaller.appspot.com/bug?extid=c1751b6739d83d70bb75
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108328d9980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e875a1980000

Reported-by: syzbot+c1751b6739d83d70bb75@syzkaller.appspotmail.com
Fixes: 69505fe98f19 ("fs/ntfs3: Replace inode_trylock with inode_lock")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
