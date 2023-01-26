Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DECD1FA7
	for <ntfs3@lists.linux.dev>; Thu, 26 Jan 2023 08:13:17 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id n18-20020a056e02101200b0030f2b79c2ffso782445ilj.20
        for <ntfs3@lists.linux.dev>; Thu, 26 Jan 2023 00:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEfpfP62XIqchPRHLndjuTCyLWg79Hv36f/NXAdlpAs=;
        b=ghHce5rc1YwAZ46ubHe8PGCoCIKL2I7bydTtbNFbLATEbKkTfN0HHRXVgFZRWAxus/
         qtiTzIX4p4EulR+ZbxJXKCbz2iZXogJUXYaA1bdR8az/xbserzUPY9OJygBAENrL25dW
         DV4XeBrd4pWctjFZ7aVjYYP/4x9Sr0WVDY3ef8Nyz0rAgunu8a0rOevITp4he5VfOjSN
         /+hn+uHkPlVsrZ2kHhTidE+c1TgbmWmlzTyvBOz+iLaTX0l44nIhcjA9c1ixIj0S/EZ3
         SbSBX3CVRYtgSIiV5jDIm7zDCRfRCYwBvAHAFYNU+/yjIXLCAEl2Em1nzYMh5mUteS9e
         YZsw==
X-Gm-Message-State: AFqh2koEY2V476g/JdxY/nE8fy0q9C1r9x+vpeAQmexLYmNLaZ06QemC
	+ojeZFOOtiVUeRC/3aus/+QhkkJ/5OpwIYMkEXfMMoOusaJg
X-Google-Smtp-Source: AMrXdXsQG5JQdoaLSZYANWYd/5p96G8xroKqzn7EOH/B///qz3B0WtGEa/YaV/oAUEqZ9dapP40iNAIaLjwH/eN2pWh/x7CIJWVN
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a6b:e019:0:b0:6df:5aa3:393c with SMTP id
 z25-20020a6be019000000b006df5aa3393cmr3225578iog.81.1674720796499; Thu, 26
 Jan 2023 00:13:16 -0800 (PST)
Date: Thu, 26 Jan 2023 00:13:16 -0800
In-Reply-To: <0000000000005af92105e80510f2@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002c692505f3265254@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_get_ea
From: syzbot <syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dan.carpenter@oracle.com, 
	eadaivs@sina.com, eadavis@sina.com, eadvis@sina.com, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, lkp@intel.com, llvm@lists.linux.dev, 
	nathan@kernel.org, ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	pjwatson999@gmail.com, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Oct 10 10:15:33 2022 +0000

    fs/ntfs3: Check fields while reading

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15cc6199480000
start commit:   fef7fd48922d Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7341d0f941b3356
dashboard link: https://syzkaller.appspot.com/bug?extid=c4d950787fd5553287b7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133d4479880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f05e71880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Check fields while reading

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
