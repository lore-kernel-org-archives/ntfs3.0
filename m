Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD97C
	for <ntfs3@lists.linux.dev>; Fri, 19 May 2023 00:27:34 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-763c341d627so212637439f.1
        for <ntfs3@lists.linux.dev>; Thu, 18 May 2023 17:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684456054; x=1687048054;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wS4yRst5lIZOEFwOGopGmG/PFz9tJWrMaN/Ir/080P8=;
        b=Kxrnr/+AtZIvuP0TwT+Vm+GfnUP4aSLvCXW59pzAoaI9YVZOtcxwmiKF1bT3Z+muK1
         ukFDsYKCfw7W836EDb+F6RXeHqFeO/gpf50D2ObQ9an1m/GJ9Gil6wAfOa3VhgahddyM
         Wm1oSsDuDnj94+34wia8EhVlqDWMRxSLPvGD5ZXEID0PsVTcEurAKCgHE+g+oBsnlYJV
         hvk6JuEu3zx0YmCT1rcbMAwA2JbMmGgdbvV2k1/eShdLWxqOTttSJe8sKgozVXxbu9KF
         G+1UzDt+hXeOnse1fd3T0wTBVfQlPzCXYW0rVmAsJ4WmZcBh6JCHtCmxjVswrfIkFYB9
         ba3w==
X-Gm-Message-State: AC+VfDzfwh4mP8NIc2uBnkb3dwjmhBi1Ar1bX6+LjV1TB/jxo6wSvOGq
	11J4VzVpsbdhwHIbB2lyYzDanSvjIlZKmF0DCAZGIpOwTH2z
X-Google-Smtp-Source: ACHHUZ4uvwIW/3D56BvXGaHQPr33ch9NlqQpk3LuznfAGWdZ3iL/anO0zW2bQ/xBVbTceVtGs4NO9Yf0CRaEkLPozBhj17OS6ICr
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a5e:9409:0:b0:761:22af:1e36 with SMTP id
 q9-20020a5e9409000000b0076122af1e36mr64161ioj.1.1684456054078; Thu, 18 May
 2023 17:27:34 -0700 (PDT)
Date: Thu, 18 May 2023 17:27:34 -0700
In-Reply-To: <000000000000dd4a6405f5336cbc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000be442905fc00fc78@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: stack-out-of-bounds Write in ktime_get_coarse_real_ts64
From: syzbot <syzbot+91eeffac5287c260f2d0@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, ivan.orlov0322@gmail.com, 
	jstultz@google.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, sboyd@kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 267a36ba30a7425ad59d20e7e7e33bbdcc9cfb0a
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Jan 16 08:52:10 2023 +0000

    fs/ntfs3: Remove noacsrules

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13793a5a280000
start commit:   3ac88fa4605e Merge tag 'net-6.2-final' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7bfeb3e8d4df76ca
dashboard link: https://syzkaller.appspot.com/bug?extid=91eeffac5287c260f2d0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a7a4ab480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=151aeaf0c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Remove noacsrules

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
