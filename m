Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B1BF4E7
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 09:37:27 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-39ca3e1728fso905629b6e.2
        for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 02:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689241046; x=1691833046;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/KWHPeqYs83RLpJCQk4X770LmbcxpeUbYJZczIbA8Zk=;
        b=K1Y10Vo397huhT0Ed3Z9jdPz8LrhfgGvPoGbd13MHT7Rz0sMjMQPcvQCmrPbo/N5v4
         f9554Y4bYh4NXaLTLx1e6lkxbmKRS49XHxZ61GhiwCpGQVAka+1yCdzCDPJPpQtYTlsq
         oXzmTsJMEHu9TTGd+UlTMIlIQpjEHRO/qHxzIBW5qnqbv9wEeZuTon8/wKm40g0ZyK5K
         MuTJG5Yil+gMWB+0s/iANu7dMaFLl9ntwvI+1iqhsDY9FG0izwWYi9OPhQTVaOb7/DZ9
         Cqncp3yVnsG+/cQPD5nPJPocY3aHa7HQdKkdpavjUSqkzelqMBlZVz4Rk050webR5VmA
         N8OA==
X-Gm-Message-State: ABy/qLYzyXTL59xldUsMav/HEAI5LroFwRRevpal5NaZ7I2zaISQTfA0
	5YasjJjJ+dwCkwfLxY6qfbyMfN25EWVSo/LxnkgzJc++sDFm
X-Google-Smtp-Source: APBJJlFZ+k3bwHzCz46y/eYpJf6R6cCLa5axYPD6JDKJCB12y166+xp558SQKzwK0Dlpi5J58QXr8+KIEBjNH/wOYJLzmbq9lEL4
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1592:b0:3a3:c493:b971 with SMTP id
 t18-20020a056808159200b003a3c493b971mr1397311oiw.7.1689241046552; Thu, 13 Jul
 2023 02:37:26 -0700 (PDT)
Date: Thu, 13 Jul 2023 02:37:26 -0700
In-Reply-To: <00000000000009408f05e977da5d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000085151506005b1491@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in d_flags_for_inode
From: syzbot <syzbot+2f012b85ac8ce9be92e5@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, hverkuil-cisco@xs4all.nl, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit c43784c856483dded7956175b5786e27af6d87f1
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Thu Dec 8 07:51:32 2022 +0000

    media: v4l2-mem2mem: use vb2_is_streaming()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17e7d1bca80000
start commit:   4da34b7d175d Merge tag 'thermal-6.1-rc2' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea03ca45176080bc
dashboard link: https://syzkaller.appspot.com/bug?extid=2f012b85ac8ce9be92e5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17834f9a880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10edf526880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: media: v4l2-mem2mem: use vb2_is_streaming()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
