Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020381398
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 02:31:37 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a1e869ed0aso312075b6e.2
        for <ntfs3@lists.linux.dev>; Wed, 12 Jul 2023 19:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689215497; x=1691807497;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ULMbfN3/nTfJ+25ppVCP/v7aeJsW1OOHpSx1JvllrA=;
        b=lbFh2Cz94n7vrWR1/4+4YhPHyQXbDux9VGHdCEv9gvWDWqiXcjFgH6eAGtLbzO8+Id
         mD9GGq6izqLt8AajsysAPK40b51FYmxpidUWp3rl2Jnbaw/s0VFI/GTFXmACByenp+In
         iqIbhwtwnOX9b/mHLN+2YBmGnzCCbKYMKIIdISYqlcsHvwZuccDhg2KBijaFEy+invAr
         Yq/fgfRWK9itAdTfuVzl4N2cYcBLpHDwH+p/i5X1H12PmzO2klvV519KfCIQ5LVTw+Ts
         7CC1KnXEGbQTPQllR327DLQ2Kt6PZk0GmdFEaiNOQQKlHwwzxCbPmz2z0Lde14kDTChV
         j5Dg==
X-Gm-Message-State: ABy/qLbfD+jPanw8/fX3zMLwabAmDN7d9N8SEkUuG2XJvSmh8G01j0Oy
	zNuMrKvCVrJiUE24mEfxORlEh0kaMQYrK4R+4KvvAfwY7aFH
X-Google-Smtp-Source: APBJJlH2K90jYu1C5y22SOZVw5Knm8A76T+Khq2Wzij5kK4T+YdlLIq/oPDVEuOx1Q49MiRQmeYaP51o6El+K48URannynX2pxY8
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2119:b0:3a4:1265:67e6 with SMTP id
 r25-20020a056808211900b003a4126567e6mr383381oiw.8.1689215496998; Wed, 12 Jul
 2023 19:31:36 -0700 (PDT)
Date: Wed, 12 Jul 2023 19:31:36 -0700
In-Reply-To: <000000000000fd3bbe05efb0d1fd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a5d5ab060055215c@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in walk_component
From: syzbot <syzbot+eba014ac93ef29f83dc8@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	davem@davemloft.net, hughd@google.com, jiri@nvidia.com, kuba@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit d772781964415c63759572b917e21c4f7ec08d9f
Author: Jakub Kicinski <kuba@kernel.org>
Date:   Fri Jan 6 06:33:54 2023 +0000

    devlink: bump the instance index directly when iterating

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12801432a80000
start commit:   f3e8416619ce Merge tag 'soc-fixes-6.1-5' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b83f3e90d74765ea
dashboard link: https://syzkaller.appspot.com/bug?extid=eba014ac93ef29f83dc8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117d216b880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: devlink: bump the instance index directly when iterating

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
