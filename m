Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A821D3E4
	for <ntfs3@lists.linux.dev>; Fri,  2 Jan 2026 04:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767329946; cv=none; b=E5xP36dxYUAnNCyTTC8/S74QzePZ6UQOhmfI8aXRA5xBML/JHwIdhW855QmzakUZxZi6gz0UC3q2a80S0nW1c/5Wgm15ana9dvSRQQ/6ilYuSHFzVW67XeHbb2dK5/Y/zBc/MGLhDrXsUiAZI9BnXMYU2Ab1EryzDUukZu4ZqGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767329946; c=relaxed/simple;
	bh=MBOje/xYkrAFiRDonh/YjmAHO8oMKM+i0qoKKYV75xA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=apiIDw/U8sjzh8gmyUK9oDVeYPBdTgRyRgb7DzKV2Go+InqdfITh662uX4DgiOCO0qDgjFeVRCmmkZSF76vWbP/+kXR2tvSPbap3sMTrf/YzKArRyjRPV6vli8XuKK8/rQLQ1Y9SGAig2p3S/8X8swH0QXCEE5Pwk1NwV7taTSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-459ae2f7d41so10787246b6e.3
        for <ntfs3@lists.linux.dev>; Thu, 01 Jan 2026 20:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767329943; x=1767934743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+AmQB/qRhVQmFyRyvwyMexTVCJAt6poo+xGp2Hku+Q=;
        b=R9qcBCu7Z/h7kLHEq2E/jrLpih4bTWqp7EbyweBW1nkI9dvLmKuLpMK3/wl+xxanKr
         0fX2rdAKtNa81l9KRPIgLjaiyidZgbbXn4uRbAvWPaPsw3LTejKtn2FG2TL7g0txe9Rn
         HjuQxq+bnayh1dghkmcfAUVrkxtYP4LhIE9ee8cJKqpX5UZYGPfHTV9Llfntm24+SpZF
         bIdNF26f1ESL16B6bx/YZ48gf0QYhpV1xCqzf7xnj7+TxMA1gnbJxn34gORQEOkOVHMd
         gp/T51px8INs+K05bb+8lpjQWUbiHuTeNCgrx1cLbHNMOw/ouDPwsLCgHwgYtazj3i/O
         DAuw==
X-Forwarded-Encrypted: i=1; AJvYcCWdsP1rANy8cQ//GGN8WPXMqBVabsFU1z2hfckc/KLf7/i0IZA6d6v5rbF4ySXBAqMnceREXA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yww/tfOMr+Q6Acigcb6AMdBZi9kc5erCdnBtc8WTpuTHZw+jczD
	NOhOFL5mZCIqn4Ub6ROLhdN8pBO9c4XG/K7ZleNKCVcW7tn01pNT9LmA0Png0bv4q3gdsOnQSk5
	RwX3vTrglIyXj/czP7uvcx9XZf5NezDyk4xoQ/PLq5fSzJUE/yx9dOIoBr8o=
X-Google-Smtp-Source: AGHT+IEJOgw+s7C7AFHLDe3b3IkHaaHTh3029SB8ead8YTreFqPPvVrzrv1UEJCmDyn+ROr5A06dXci3QJIZd1diC5oXY2KitSLw
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2229:b0:659:9a49:9026 with SMTP id
 006d021491bc7-65d0eb10455mr18137360eaf.83.1767329943245; Thu, 01 Jan 2026
 20:59:03 -0800 (PST)
Date: Thu, 01 Jan 2026 20:59:03 -0800
In-Reply-To: <68ed7606.a70a0220.b3ac9.001f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69575097.050a0220.a1b6.034e.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] INFO: trying to register non-static key in ntfs_setattr
From: syzbot <syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dan.carpenter@linaro.org, 
	eadavis@qq.com, kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	lkp@intel.com, ntfs3@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	oe-kbuild@lists.linux.dev, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit be99c62ac7e7af514e4b13f83c891a3cccefaa48
Author: Edward Adam Davis <eadavis@qq.com>
Date:   Tue Sep 16 05:50:13 2025 +0000

    ntfs3: init run lock for extend inode

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=113ff222580000
start commit:   98906f9d850e Merge tag 'rtc-6.18' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=af9170887d81dea1
dashboard link: https://syzkaller.appspot.com/bug?extid=3e58a7dc1a8c00243999
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f4e542580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e5e9e2580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ntfs3: init run lock for extend inode

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
