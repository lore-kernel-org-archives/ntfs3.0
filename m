Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E4328680
	for <ntfs3@lists.linux.dev>; Fri, 26 Apr 2024 20:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714165024; cv=none; b=X6+HT8v3Xbcp/WQQnJQzMVlw0NanxCHICgCygCrLLLZkjJSyenl5cMAzDPnmtUCs4Dswv6srJqvUMd/HgLSTNXUcn8S2RM7nCRy2ePoos81V4CjX06t/9CoJfUJ/YTzHaPY/EBm6Bh10I1WycjcBlWOaodOWVmEj27I1VmPkErk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714165024; c=relaxed/simple;
	bh=ColKp8LTeqV3MomYovw1AaLOb4uUmnU2k5nxP/XTD6M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qFcWuaD831Wtw18KDXM73G5Xq+XdiZiDga/os2kwhUhen6lvYuEZYbafpRw/l1keItbsCFhdKQ1QFuEyd9LquPqHiVpkOxNhyKFcf8yhbHD7j90mvGF4yDCti175qqI1PSb/2bXpvW5C2B4Z73ntkSy6z5OkmWhew75diHiQxhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7dab89699a8so258581039f.2
        for <ntfs3@lists.linux.dev>; Fri, 26 Apr 2024 13:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714165022; x=1714769822;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wmPxjA1cjQgQAONaZgBDFgfHJ2vCvymGfali2ADE1s=;
        b=i6IHrj2mhdv+zQkQ026nVaQ/iiaUb4A9SuGoVnCbXr5Zga1/YTKC+L3tF5w9G+jmYE
         FefvlgrSIZP5ewaW3LJYYBgKQZV9hXK1jbMJGGanHdrcYDLHLssSgMG5avP/fXr4d0WE
         tMqkQzPdN0MtsBIe75YImGkg1XYFubRm//JtmlZHuCqLBAsKut+RpvtZq4L+TXBaPsds
         zbc9ODtxMVccASEoTBnmB+QLTvHLUbbc0sR1xj4hRGhn/tBJBJQTSpu42jaGOCvtHEkE
         QlC7lnOuqQ4Xel9heDK9cMJYvzVN711l1GTOj016OSWyUo2+Ki2TdgL8VWgmIL/CXlc2
         R2qg==
X-Forwarded-Encrypted: i=1; AJvYcCWoPWpwdP0D3wm0i+wq1iWgNsvuqxt0aPvewxWEQPyC6InHsB2iJ53M1m/uZqibntz8ihQtWLGVUIf0cPfkRoYGuqZVH1A=
X-Gm-Message-State: AOJu0YzQpbf6YVV0T/dc4ruMuJLl9CEQjI1zwqU/8ZB0Z5gurgsBFcmE
	tvwXd7RuwLVKzQcqzQpx3dnAbIgIXL6XO2bk+I3qSrDnOlZsTFvzVs3dSWyy90uQNpBe29m2JOT
	8AISbxpF/TtxwImpo4Nr58p9zadFdvnCo/pyah/v5rOIct7zT1Jp4/aQ=
X-Google-Smtp-Source: AGHT+IHBare5qaUO/kJwI42/lbgUs9Vos7M9Tuo43dypHaC5WkLmbSXOx39jMzLVqNXtInVCffs3LOc42jWH6h5bBadKTSIgegTA
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1451:b0:487:1189:3544 with SMTP id
 l17-20020a056638145100b0048711893544mr312104jad.3.1714165022327; Fri, 26 Apr
 2024 13:57:02 -0700 (PDT)
Date: Fri, 26 Apr 2024 13:57:02 -0700
In-Reply-To: <000000000000f386f90616fea5ef@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003e1ae2061706252a@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in chrdev_open
From: syzbot <syzbot+5d34cc6474499a5ff516@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, 
	clang-built-linux@googlegroups.com, kari.argillander@gmail.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit ef9297007e9904588682699e618c56401f61d1c2
Author: Kari Argillander <kari.argillander@gmail.com>
Date:   Thu Sep 2 15:40:49 2021 +0000

    fs/ntfs3: Make binary search to search smaller chunks in beginning

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=144f18b0980000
start commit:   e33c4963bf53 Merge tag 'nfsd-6.9-5' of git://git.kernel.or..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=164f18b0980000
console output: https://syzkaller.appspot.com/x/log.txt?x=124f18b0980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a05c230e142f2bc
dashboard link: https://syzkaller.appspot.com/bug?extid=5d34cc6474499a5ff516
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11655ed8980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12499380980000

Reported-by: syzbot+5d34cc6474499a5ff516@syzkaller.appspotmail.com
Fixes: ef9297007e99 ("fs/ntfs3: Make binary search to search smaller chunks in beginning")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
