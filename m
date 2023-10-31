Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEBE2231F
	for <ntfs3@lists.linux.dev>; Tue, 31 Oct 2023 20:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b2d8caadfbso242013b6e.0
        for <ntfs3@lists.linux.dev>; Tue, 31 Oct 2023 13:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698783723; x=1699388523;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABxS/Y/dEawUUeKH6gAmQ1oQDLcOIlAS+uqExwFT3Yw=;
        b=F7rGNgxXj+yQcBNMIuYHlZHFm+BNSMLtK8/+WsPRKjg1t6Q8mygxlvusNWNj3QIjTh
         yYf06ICIzQoKCNGEMgMmTCDR4WEbRIx0bXvqXoO20yYD+s9emRSteq+fxuaU23UeTpwk
         LP4JLeGCGf7NIUKlv6rMJlFssxxvhXgCPlyncI1ZbRwEw4oDCtXdIWZ/4Q1OUSAr2VV0
         JBY9rz/0ZusEKQbS2xmCaNDIrO6xz1rpiSHV2cBTApX78iPDhkHtlrgxReUHeK1/lx/Y
         2eUhcMSbhxNpumode2WbFcQSu3g3ghSyuoW6sN9DwC0RjEqKGMLO1Hd7lEN6ttZqN6Bd
         pC9w==
X-Gm-Message-State: AOJu0Yy+pED6a7mNPpS63uERA7d3QuexN8yZWagJAWWwoUnCCjX+9YRQ
	10dYTfqCSApRxFO41LKz3Fv7AjdAGxSmhONGlk5IAtW4yHu7
X-Google-Smtp-Source: AGHT+IGb7b5+s5UWXuPaOfwbI5gjTxsrXeswNqM5+abNosVgXBYVP27oyqTOzSqlnYSpScnMXbpfJavMqzWhIqrVn1kjNJ71QDEp
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:150e:b0:3b2:e7b3:5fc5 with SMTP id
 u14-20020a056808150e00b003b2e7b35fc5mr1621301oiw.3.1698783723868; Tue, 31 Oct
 2023 13:22:03 -0700 (PDT)
Date: Tue, 31 Oct 2023 13:22:03 -0700
In-Reply-To: <00000000000019db4e05e9712237@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000695613060908e8ed@google.com>
Subject: Re: [syzbot] [ntfs3] kernel panic: stack is corrupted in lock_acquire (2)
From: syzbot <syzbot+db99576f362a5c1e9f7a@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 4ad5c924df6cd6d85708fa23f9d9a2b78a2e428e
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Sep 22 10:07:59 2023 +0000

    fs/ntfs3: Allow repeated call to ntfs3_put_sbi

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=125d173b680000
start commit:   45a3e24f65e9 Linux 6.4-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e74b395fe4978721
dashboard link: https://syzkaller.appspot.com/bug?extid=db99576f362a5c1e9f7a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1734eb5b280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12ddb22f280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Allow repeated call to ntfs3_put_sbi

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
