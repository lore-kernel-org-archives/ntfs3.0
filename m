Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D023B3
	for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 20:42:11 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id d19-20020a0566022d5300b0065499cd4a73so4065666iow.14
        for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 13:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=QTaJFCvihcUmHDlw/ICH6QwXqyikackCR6G4w+KbOPs=;
        b=A3owbmxAHxRAO5f+HSLFE9dDa1xzfKKhqWFSDKNjQUx9Hgi1jzM81V7jLzvDzImAYa
         VNZAnOL0L6wFZnxyKMGNPjeKmHF2VV1yyewhvjjwXIMWREpsykAKj6KSxC75sXxUEsJ0
         1xt7I5+dxCiUDGPRA3CC81kySaF81DHdC0ASZdvwFaz7NTvSZsbum4C8XuHybdsvuxdd
         Q4fu/b+ibOUB1oAGHj0IzRjOielriculDTW1TkjSWWwRBD1xUWkOAi9eXzHdfYswLdME
         Yk2ySFwfPDMztCqKhaYdkK+rZXCTc3QfUNjk2s7GLFyOMKWUmMKbaSormYORTZDTCL40
         syzg==
X-Gm-Message-State: AOAM530AORANCnXNQ/ihzeB2Z84BeQPoegKgL2SDhfHcD1Eg9Z5lc/Ne
	MtYsEFxHp1R3d8F3KkT3VvPsQyhs5PX+TQhiSUYVNFa/PiD5
X-Google-Smtp-Source: ABdhPJxeuoyMPdfv0cavfLIcjxEa18/sMT287zLocnJIrQ8M+pc3e5eXNK/A7/Agt+HpAbdAM8QtmHFfrvF1ro0LqjWafQzEoQNJ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1bc1:b0:2cd:5db6:d9e8 with SMTP id
 x1-20020a056e021bc100b002cd5db6d9e8mr689285ilv.276.1650573730916; Thu, 21 Apr
 2022 13:42:10 -0700 (PDT)
Date: Thu, 21 Apr 2022 13:42:10 -0700
In-Reply-To: <83061bda-5a91-6123-a006-aaeb5458d5d7@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e8321c05dd30241a@google.com>
Subject: Re: [syzbot] general protection fault in ntfs_update_mftmirr
From: syzbot <syzbot+c95173762127ad76a824@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, paskripkin@gmail.com, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+c95173762127ad76a824@syzkaller.appspotmail.com

Tested on:

commit:         b2534357 Merge tag 'xtensa-20220416' of https://github..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4cdc9619f45633df
dashboard link: https://syzkaller.appspot.com/bug?extid=c95173762127ad76a824
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1778ee1cf00000

Note: testing is done by a robot and is best-effort only.
