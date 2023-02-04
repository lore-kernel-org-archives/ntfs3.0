Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BC23A9
	for <ntfs3@lists.linux.dev>; Sat,  4 Feb 2023 13:56:17 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id r18-20020a92d992000000b00313b6f93d45so522122iln.9
        for <ntfs3@lists.linux.dev>; Sat, 04 Feb 2023 05:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Emb63XsdDhrPAmiTP8mjO1WrwEK7/rhCpoRqKx1srC4=;
        b=y+uL3v3sPDt6VT313g9gaNU6TgsFXoPBKiWsCT0U7AHJvNzvCShYoVW2Vp4CJq1xEd
         2/u3gmj/sB54hW3lHNX8IGvODZ3KqE1Ycs+4t8tV7+gsQLKtMN8VhoA8Td1ACQBbRHT/
         1ph7gITWpxtaYvtvFGREoP5s1uy+hZft0f/s/H75lP/cEujlXLY9nCweppGTSdrn4REk
         v1DeJglgShXT9V35dfnDfbaKGpaXKeZhmDIdzQ9lgHAp9pZx8ldkK5O9hQPhU5tMBzgk
         1PnpvPIVrxh0VPJqA/PPe7I26HAVsg2oXAXvPjg62lDozZilf78U1P6KSWV+DQ9pN7KZ
         /gxQ==
X-Gm-Message-State: AO0yUKW02JsjYOK601vMfJ3/SUJaFhiO10raLJZbgmXfBhz2geJyhbtp
	p6iF04hdZ6dSUkK55nq0m/Pobf3XFmYaM+s4ZneBxZsjDjaz
X-Google-Smtp-Source: AK7set+CSbVY2liHAelhyVioAOv8bFi9fhdU7Wj4/2qemmhDU6DvfkHo5EsSrGGF9wo02b7P4lJDB/FVRbwnABoPd9k+dQlzbIbo
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:ac14:0:b0:310:c4b0:3629 with SMTP id
 r20-20020a92ac14000000b00310c4b03629mr2574328ilh.97.1675518976440; Sat, 04
 Feb 2023 05:56:16 -0800 (PST)
Date: Sat, 04 Feb 2023 05:56:16 -0800
In-Reply-To: <000000000000f61bdf05e79a7c5c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000067d34605f3e029f7@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel paging request in mi_enum_attr
From: syzbot <syzbot+28207acc70bbf3d85b74@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Oct 10 10:15:33 2022 +0000

    fs/ntfs3: Check fields while reading

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13c11ba5480000
start commit:   f9ff5644bcc0 Merge tag 'hsi-for-6.2' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c163713cf9186fe7
dashboard link: https://syzkaller.appspot.com/bug?extid=28207acc70bbf3d85b74
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1275aed7880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124f533b880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Check fields while reading

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
