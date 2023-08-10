Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307122F02
	for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 22:14:38 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1bbac333f2cso19843515ad.1
        for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 15:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691705678; x=1692310478;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iSfVQKiy94ihvevaPz7mdBT1Zd/e8n0em7o/WIjuQ0=;
        b=UTlO+kqJo2Oqpn5ol0oex7fy7FrpjnGWb245X7FG8hmI95vVZuKvMuSelH2/NBul/N
         CCbLh7V/OyvaY5UEntVtrNHreYe7hoLC17/17CUhWyJ7xfHVzUIu1pKK7vo5j7wTETlU
         JpLuArX5tfP1dbBwlg0UxoKlTCGpnzEyRAfh1XfsOlZVqjPnjeP3hAVTnibkd2dHs8Le
         6riVDviBFwMVX8t3wcdbRZIUG8a+s/G6eGbhbkSrnHrKSqUiH0PIJiisufuRlH+k7ils
         u9xRJWT0zNxuYC93GNTqF0BgJxuO/ZTlDljpJKQP0Cms4/v4wqXn0ZJZeINUd2TanAJp
         eG8w==
X-Gm-Message-State: AOJu0YwCY/rwXUspPEXSbzxTdS2capOXNnXTWXziZOSDNrwL1B0Iff10
	+g12Rdr6RZ6Y8Jx2WYiNfLXBr5DoVtapst1Y5o9VdlperJIM
X-Google-Smtp-Source: AGHT+IHTzTABqpJVuLtnELQWEcoBDNkcI7acDmY68LAjTTfOxK2QXJmkSMtIbz4lbKeoczQf+GCJ8xGSG+P8VQnPmUL+jm88OSVl
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:902:e748:b0:1bd:9c78:8042 with SMTP id
 p8-20020a170902e74800b001bd9c788042mr13632plf.11.1691705678229; Thu, 10 Aug
 2023 15:14:38 -0700 (PDT)
Date: Thu, 10 Aug 2023 15:14:38 -0700
In-Reply-To: <00000000000040e14205ffbf333f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000003f591060298ecc6@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in wnd_add_free_ext (2)
From: syzbot <syzbot+5b2f934f08ab03d473ff@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 3880f2b816a7e4ca889b7e8a42e6c62c5706ed36
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Oct 25 15:31:28 2021 +0000

    fs/ntfs3: Fix fiemap + fix shrink file size (to remove preallocated space)

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=168fd89ba80000
start commit:   f6a691685962 Merge tag '6.5-rc4-smb3-client-fix' of git://..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=158fd89ba80000
console output: https://syzkaller.appspot.com/x/log.txt?x=118fd89ba80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1e3d5175079af5a4
dashboard link: https://syzkaller.appspot.com/bug?extid=5b2f934f08ab03d473ff
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13f56679a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=118b8eeda80000

Reported-by: syzbot+5b2f934f08ab03d473ff@syzkaller.appspotmail.com
Fixes: 3880f2b816a7 ("fs/ntfs3: Fix fiemap + fix shrink file size (to remove preallocated space)")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
