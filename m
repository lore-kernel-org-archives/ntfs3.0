Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579191377
	for <ntfs3@lists.linux.dev>; Sun, 10 Sep 2023 01:56:33 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1bf75ca4e4fso39465015ad.0
        for <ntfs3@lists.linux.dev>; Sat, 09 Sep 2023 18:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694310992; x=1694915792;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1AnbtdmHLxtYiw5SSlT3Mzclo1imdNxgM3fzBo8Y6I=;
        b=NJrKn96hUAvjfwsHhH6H/bDpGVuHfi82r0jgNmOkLTm+YEK1ZWnHeXebA+t+mJv3xf
         Hv6xncPegovwsB2icOsO183k87Znwn44MNCtCS5KM/dKmG1ZHmSFQTDVbs/YYwjBRlZ2
         K+ys1xOpDCVfl9OUAY55IRu1JS4LTjFNwQeiViZ8PAAqZ8msZdREcwbygtt7I2/hyNzS
         KiAfaMirGUpd8+ZPkadynVz+mWJ3Ps1t6+yvzNascRrNRcDQg53edD5BKtJ1XErSjAs6
         m72KrhxgpGKk339+qbcYlEE2+hZx3QF74YgsAFl9VNAZgPGc7cCaH51S7SZLyZ8X00JZ
         NYLA==
X-Gm-Message-State: AOJu0YwY2vcz9NLdidMGAFnCFBUhqHRjYaD9GgjhuwHVuu3mkY5rEG4i
	zTTJ7TkLx+jdHoYQe5sYj+3NlhcwuVLYuiAFD6qpvyi5K/+M
X-Google-Smtp-Source: AGHT+IHiUFnYR5e4ZxlOCvxRqzDbIqM/FX2HwdXWmfaqC03/C7L5M31f5pyYJ99GJ9Mjc0cInXFJjLtDqAyIvRPodQqxHEOcKuqO
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:902:eb8c:b0:1bb:cdea:d959 with SMTP id
 q12-20020a170902eb8c00b001bbcdead959mr2473963plg.0.1694310992663; Sat, 09 Sep
 2023 18:56:32 -0700 (PDT)
Date: Sat, 09 Sep 2023 18:56:32 -0700
In-Reply-To: <000000000000885d8605e91963fd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000db589b0604f784dd@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: stack-out-of-bounds Read in iput
From: syzbot <syzbot+870ae3a4c7a251c996bd@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, elver@google.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, leonro@nvidia.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit c1b05105573b2cd5845921eb0d2caa26e2144a34
Author: Jakub Kicinski <kuba@kernel.org>
Date:   Wed Nov 9 18:32:54 2022 +0000

    genetlink: fix single op policy dump when do is present

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17eb48a0680000
start commit:   105a36f3694e Merge tag 'kbuild-fixes-v6.0-3' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c221af36f6d1d811
dashboard link: https://syzkaller.appspot.com/bug?extid=870ae3a4c7a251c996bd
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17274404880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: genetlink: fix single op policy dump when do is present

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
