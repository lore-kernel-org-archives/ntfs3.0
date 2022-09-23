Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8AA28F6
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 10:45:33 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id f11-20020a5d858b000000b006a17b75af65so6370508ioj.13
        for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 03:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=guRptB1aXuokekh75LtENExgpfDq4mFI/7AbvWfVv/M=;
        b=QKFxl5jqLm5Mj98AxMZjOo7ePAZQhPuyazN7/Km5LPtVlFkKWL9EBoLJAWaK18IAIX
         vzAgvWTu3oA9IBQqLzaEizbXFcCHkUcvnKrbr+srPy2OZJUljwoMEJh24KyEY03KJeIf
         YcfOp0VPbJSw9HzCFYSRB6bsWwceN5LrZMd0Nls/i7QbKT8XuR7HfkPVFR9VZZZJiV+K
         9Rd7glfeIOsYJxwIvdQAxVWXWT+u0A+SChSb7lGNMNehskxH/M2FNMyT+A1/mOcgDuOI
         vDcz/MNKpjwLjxzSvo6j7RpbOmeZJgrfwlCvwxfng8NTr3vWD7PznylnCxLPStSca1ZO
         4row==
X-Gm-Message-State: ACrzQf39zyrm2p3rCWNZCx8BaRnHukRlXA050fbXuJ4tP7H/GfRjBdpO
	nKAnHjsVkydLsUXm2w+v/Mogdl+fGPHo8WhkNZ/0jmCUWv7Y
X-Google-Smtp-Source: AMsMyM64WcmyQDU1KZt1/6qeLP738A7l/2qN8DRXfYKEQt7krYETdXMcFgefoFrCAm6ylWAxiAtyWJynE/alVTjnVwLhRvACSf52
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:27cd:b0:669:3d8d:4d77 with SMTP id
 l13-20020a05660227cd00b006693d8d4d77mr3683010ios.216.1663929932655; Fri, 23
 Sep 2022 03:45:32 -0700 (PDT)
Date: Fri, 23 Sep 2022 03:45:32 -0700
In-Reply-To: <20220923102721.32425-1-yin31149@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009134ce05e955e0fc@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in run_unpack
From: syzbot <syzbot+8d6fbb27a6aded64b25b@syzkaller.appspotmail.com>
To: 18801353760@163.com, almaz.alexandrovich@paragon-software.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, yin31149@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+8d6fbb27a6aded64b25b@syzkaller.appspotmail.com

Tested on:

commit:         bf682942 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=13c704ef080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=122d7bd4fc8e0ecb
dashboard link: https://syzkaller.appspot.com/bug?extid=8d6fbb27a6aded64b25b
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1476bc18880000

Note: testing is done by a robot and is best-effort only.
