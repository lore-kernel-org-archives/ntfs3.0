Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE1F43634F
	for <ntfs3@lists.linux.dev>; Mon, 10 Aug 2026 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386904; cv=none; b=HHd30LMbIkeTjye5ORL5mDhZYOjU6Xe0I5XwcpsiSQBo9g1icZL9uGtx4lU5ZIlA4hXLMW5KY7Yj+GWKZsLYG1BXnPiFtEvaJZiOCEgRaNe9VlfarexmGIPZaFerHVr3V7skiN2gpIMRF8MckqFSOntfwR6XY5xmDnvn9A3sreA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386904; c=relaxed/simple;
	bh=x+fWtxlNaiJvjuYVYcXM4gnB1taPeu7t7BSZ9JkbVzA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=laWW6/2FAkxgqL1BE8YoXqtsPukLh/cvdFAEU+aB5r28IKCeGdNsSFF0U07FJbsw9U+3xhzpFO1peSEyDtghwJPapbdsNquaP+xaDi7UwpwV9Cb+2qX2HIxIHnynSidZXUhT0xO3Qq1CQhJCuLqZkQWn7nl0j99WBE/D76HvyXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a485034d01so3279385b6e.3
        for <ntfs3@lists.linux.dev>; Mon, 10 Aug 2026 11:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386902; x=1786991702;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K7uKpe4M8mbcOSEAL2qZIxK+YA+YklNLgZvtiAydeSc=;
        b=DXuT0QR4RcTbA/WWk5t5fOv2+dGIbmk0EJuLWB2UVi3pTrORNnYxT3A4DEJAZUvSVs
         hQre1b8kn7ZcWKgT0r0NfRKKteONl1QLe/l1CdG/JvTWz6hlAaH7j6QBT/SxTBf13i3D
         WDI+m3H3ZOyZjerMGpMyumk6ibTxFp0CHeMRHVOncezUhUfEmquB3QyKPawYvp3z42Wb
         Bo6qHWZp2dAJTekOx8Et6KuGG4ovQRJVQUyuFVRExukb9kelqO+mV2sTi5G/oaj0OEs6
         dB4Rd96VbHM4tX8TNNY5Gmg6RM2VCEsnqhCAt2t6WaGKAZDlWcYaGd8T/AFGgROH9Wig
         VEow==
X-Forwarded-Encrypted: i=1; AHgh+RrGnIsweovS/zHHceEUrJPcE22efZ/4V0/Wy/nkTADfovnYv3LwPNdu355eoypbUnKDKklCQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhIi9vv/1sAKNTyfgwSzegQ7WtN9ul6Yemu/0vyGydcnhZyNG+
	Krc1SsXADyGXCeaNB+e1qq+qfMX+heiSYwapyUrWjr4vynO7QB7g0maArXlub4y+f422wOORC3W
	eDerFIQsG7OgxpIlkEx6ePODXkptpDVsFVe7Ui0P3QAYZ2QxuGcNxfYhz7d8=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6703:b0:496:a36:b5e5 with SMTP id
 5614622812f47-4b1ab9e3c75mr12458498b6e.17.1786386902031; Mon, 10 Aug 2026
 11:35:02 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:35:02 -0700
In-Reply-To: <68dea1d7.050a0220.25d7ab.07bc.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7a19d6.b50370da.49fe0.0058.GAE@google.com>
Subject: Re: [syzbot] [jfs?] general protection fault in rtlock_slowlock_locked
From: syzbot <syzbot+08df3e4c9b304b37cb04@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, axboe@kernel.dk, 
	dave.kleikamp@oracle.com, eadavis@qq.com, hdanton@sina.com, 
	jfs-discussion@lists.sourceforge.net, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	ntfs3@lists.linux.dev, shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit b15e4310633f90072d66cc9b6692acbf6b4d7d00
Author: Edward Adam Davis <eadavis@qq.com>
Date:   Tue Dec 16 13:57:51 2025 +0000

    jfs: Set the lbmDone flag at the end of lbmIODone

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b1a079580000
start commit:   6bd9ed02871f Merge tag 'cgroup-for-6.19-rc8-fixes' of git:..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=151a39927f1e10b4
dashboard link: https://syzkaller.appspot.com/bug?extid=08df3e4c9b304b37cb04
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ad7322580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: jfs: Set the lbmDone flag at the end of lbmIODone

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
