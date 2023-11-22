Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF14D13A
	for <ntfs3@lists.linux.dev>; Wed, 22 Nov 2023 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cf539f3a8cso59271895ad.2
        for <ntfs3@lists.linux.dev>; Wed, 22 Nov 2023 06:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700664493; x=1701269293;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfUef9tj9kWRG/hnj63YvOvnIkXS0rMCQtJAytUlGk8=;
        b=mrVIOrPa/QTfTHvZWO6sYcazU8LCg9GDa+h+qKvrcuYMPqTLzFhdUigxKQNLXF7E4B
         BEbCfmzCL9Men0yI4czVWpxRcAAfJYaW8ax3qMYnoL6TuBppDWUEigxgtkYuUTPjYJYr
         rh9REhqs0IaK5rMxLVYIqglBj85IbcbZfQfO4R0ySQEwpK6ppYQBt1Hkw+/gaIKF+gwu
         IZhQ0pgMUgGjiS6YuEmEAQszrpL94t/NpHHQ9N8EHMMUV0dkqMWtiq8BelEGpZrZi2lg
         W7+j0t+OTteMDgM/MrcRgr0LRDShd8VPKInH4xRh5fJFVBr46kTPQBx9jC1IILbdsJde
         xeog==
X-Gm-Message-State: AOJu0YzPnRASvojk97jc56ZR7Rtv/quHwyV5cufo0YIs65oXNOAaaNg1
	30a8iC0ogeFrz22EwaDG8WgT+HY7WvkWJXXpaI1F1kpTr1kg
X-Google-Smtp-Source: AGHT+IGq7r6T25A3qPazOzUj0YDkw7al03zhP0GBv38qY3FOLZ1Idk9W9LaKs0J37RKiQ9EjayKjiAW3KL9Qkt9T7aav4YO9BgNV
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:902:dac8:b0:1cc:3147:6937 with SMTP id
 q8-20020a170902dac800b001cc31476937mr655370plx.4.1700664493183; Wed, 22 Nov
 2023 06:48:13 -0800 (PST)
Date: Wed, 22 Nov 2023 06:48:13 -0800
In-Reply-To: <0000000000009b49ce0606fd665a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ff9bd1060abececf@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in attr_data_get_block (3)
From: syzbot <syzbot+a9850b21d99643eadbb8@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, 
	clang-built-linux@googlegroups.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, tintinm2017@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 4ad5c924df6cd6d85708fa23f9d9a2b78a2e428e
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Sep 22 10:07:59 2023 +0000

    fs/ntfs3: Allow repeated call to ntfs3_put_sbi

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17484614e80000
start commit:   e402b08634b3 Merge tag 'soc-fixes-6.6' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=12da82ece7bf46f9
dashboard link: https://syzkaller.appspot.com/bug?extid=a9850b21d99643eadbb8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b684e6680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ede4d6680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Allow repeated call to ntfs3_put_sbi

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
