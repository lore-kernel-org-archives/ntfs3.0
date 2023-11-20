Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92FD374CF
	for <ntfs3@lists.linux.dev>; Mon, 20 Nov 2023 23:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6c33b1175adso7654233b3a.3
        for <ntfs3@lists.linux.dev>; Mon, 20 Nov 2023 15:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700521266; x=1701126066;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUHvZqUtxIelqOkhWJ/rNyIb+FyfEgnajsCDcd1770s=;
        b=wpAcRX1zPdvfW4sND2Ocd8fbXJvHe6E5AehVB55Nt3dVS91qfqaeDEVWNGqftSxKYd
         VdQiBA2SFJv7X69llgL/Snz3w2zmZJUnejeNfAPWiFNrqXLW7TLjsqJ78K8/DbuE+qeC
         PZGzlemQJltKk2eUSgZ0nyjxuJfEIKrvL/fWBJDc9zC2bDzPj5Vi/voL/5xJc0Pqo9lo
         bO1JcEK485S2WqZZQInuPLF4cPvmHlEDrMWUnIYUHPNmbEhInql+BAE7TZ2mGI8YAnyO
         MagN1dVgxZZs7fiSwKq1zDEilbGUdC6bZhIvO/YQgJa2YqjvSqkgcugKFdgNvOoIfS65
         QY3w==
X-Gm-Message-State: AOJu0YyofF2e8rug1+8t9mX7PAH7vWzACpl0BAYDOGq+ifHkDPLtbIhT
	Gp6iTtbjuT9QB0hBe+7vYML54K4DqdgBFcEB8n3Enje9CFgp
X-Google-Smtp-Source: AGHT+IFsaThVJyrbPxGaoq/F9sa+Xu+ULx9VWg5KB5Glx02QEN86inWnAmqiO01cPY08/Uhz2336VuPkShrD6jBlKUSQfiVxsIQf
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:8115:0:b0:693:3851:bd82 with SMTP id
 b21-20020aa78115000000b006933851bd82mr2186063pfi.2.1700521266007; Mon, 20 Nov
 2023 15:01:06 -0800 (PST)
Date: Mon, 20 Nov 2023 15:01:05 -0800
In-Reply-To: <00000000000040e14205ffbf333f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fe54ea060a9d752c@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in wnd_add_free_ext (2)
From: syzbot <syzbot+5b2f934f08ab03d473ff@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 4ad5c924df6cd6d85708fa23f9d9a2b78a2e428e
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Sep 22 10:07:59 2023 +0000

    fs/ntfs3: Allow repeated call to ntfs3_put_sbi

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15283368e80000
start commit:   dd72f9c7e512 Merge tag 'spi-fix-v6-6-rc4' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4471dbb58008c9f2
dashboard link: https://syzkaller.appspot.com/bug?extid=5b2f934f08ab03d473ff
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15665425680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1618cd9d680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Allow repeated call to ntfs3_put_sbi

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
