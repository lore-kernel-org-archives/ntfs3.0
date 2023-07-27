Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461B68484
	for <ntfs3@lists.linux.dev>; Thu, 27 Jul 2023 05:33:29 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6b9ef9b1c66so1098288a34.0
        for <ntfs3@lists.linux.dev>; Wed, 26 Jul 2023 22:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436008; x=1691040808;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACCQJS1yNDOg9N72wtfvjjkCfEbgk/h272KX1jaBuI8=;
        b=CF5V7RIl7Mp5ZVXYZZeahVARC2zn9LYMErbXRQPY9llkZXV5ThP8KBihNCXv6j/oX+
         kUEqUwsZvY8177CLA5fWmzJ1CoI5dEeNdMRQMD3rt9nboGhU1PKYQwaLR5Yh9Q9232Ip
         rhoVU0xyl4SrroZmcNw/MaASKTJDx2Y2Q/ZregJBbnOKy8b2p2QKbo75RfM9SncaKlJD
         Ja9nBRMyUg/AVrw9cmFqGwR0qzsfPtfvbTf+y3qowarr9za2V2zAopY2zGIxoHDbD7gU
         dhyP9h2znkz45E1PGfvC8Fy1vGJobJeTcfjJByQZRZ+NEwkd+YPgUCP4zoFk+SZybI23
         tovQ==
X-Gm-Message-State: ABy/qLbtfrZLE1GleQL7S6vUX7cvMFbPRmsft2fogQvw8j44JwiO3pWV
	FdvyclYoWUlOHYiK3DPq7lsGLPQg1HxfOnni8tz4NDdkSM77
X-Google-Smtp-Source: APBJJlERGUD5LQ82IZmIMYfnXRXSirkzOqmaKhkhvfCMNRb7PUbXIrlMigrCCdB5aZywpNhcqkm81YBBEkCGhS8uEJq5ZEnxHL8q
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6830:1043:b0:6ba:169f:f425 with SMTP id
 b3-20020a056830104300b006ba169ff425mr6494875otp.2.1690436008287; Wed, 26 Jul
 2023 22:33:28 -0700 (PDT)
Date: Wed, 26 Jul 2023 22:33:28 -0700
In-Reply-To: <000000000000a0d7f305eecfcbb9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ca24700601714dd2@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in path_openat
From: syzbot <syzbot+be8872fcb764bf9fea73@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, bp@alien8.de, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk, yazen.ghannam@amd.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 00e4feb8c0476bbde3c8bf4a593e0f82ca9a4df6
Author: Yazen Ghannam <yazen.ghannam@amd.com>
Date:   Fri Jan 27 17:04:03 2023 +0000

    EDAC/amd64: Rename debug_display_dimm_sizes()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=157a6f81a80000
start commit:   c1649ec55708 Merge tag 'nfsd-6.2-4' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=319a3509d25b0f85
dashboard link: https://syzkaller.appspot.com/bug?extid=be8872fcb764bf9fea73
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17c604fe480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: EDAC/amd64: Rename debug_display_dimm_sizes()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
