Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A53D2F47
	for <ntfs3@lists.linux.dev>; Mon,  6 Feb 2023 10:10:11 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id q76so5843239vkb.4
        for <ntfs3@lists.linux.dev>; Mon, 06 Feb 2023 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9sQMrFnmMENqVwum3WBrvUwEv6xbguvnHSWE1XksF40=;
        b=QckFQSxzR3wuDfcrAnpGUJK+a1QzLkCX1PebBrZjfM1SvG+AtHmttCDanhj4GQbDPb
         lJINsJ53yGWTG3k4bVqpSJe6Ww+LtGv7Mjl82fAmihoxVCaeOZluanWWzgB67iwCoOwD
         dnAPOy0/Juojy/zOT4zq+hTzR4RxUzkOSxmXSgEuuNzo+9UgN74KtcLDripWzQkk9G+P
         KgAY7POG0FMUcLeIWCujtFlvB+R2xLqKHAm3nvK9fNsk9532m8dP++tOrW/Ic13morpY
         xHWHVSDMDAT6hiddExqsasfhg0cXy7jDrRQWDkQOcSkfaPqAVzonAGT11hE9FvdgzbsE
         wztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sQMrFnmMENqVwum3WBrvUwEv6xbguvnHSWE1XksF40=;
        b=rSL52hv4xbnUB9kVqLk2XKguc7ll0kH2z1Q+sIeVXo5Q2xlutv8eCgBFlIFltlrlD1
         I1AFKYziNmIFtS6eEFLvb1SJ8hWC8M9x/cjqi+GvMp7UqBc4ziAqn4Hwubb8Hhcjj/Dz
         NMiTI8ZTJcmgKWAi+vlg/oV5QkX9bFTRitfCK4B+AQ5hmPm0TsmyutBHG9tvWFQGH6wP
         QWjjLza42RIsONY9W6I3AgITA4pLA8/NpM67hlxoOWwEmelpRsKpWub+BmLnpOMJp6h2
         07llRfBzjOrcGI1IaPgILcHNv35ueTUTPkmSkPNk6bT26E3jG5pa1CzxLu9WxRk7vgGK
         eoOA==
X-Gm-Message-State: AO0yUKUQndBMvVQ36V8PHyX4AFHtPb1QUMeY6KHLheYsnqzuMjIpZHob
	RqLxUz1sqkazcJ0VAVR326j3SCSYlks9gzLoxDcXoA==
X-Google-Smtp-Source: AK7set+IO7RGPUC8CK4qGlVLQF1uUvlP2D0BSP38Ka5fcymFzCVWNn/4LzVaurjDtuT+h4aBkUZL4o2ZeqRedf8r0LA=
X-Received: by 2002:a1f:98c5:0:b0:3f5:ef5e:ff80 with SMTP id
 a188-20020a1f98c5000000b003f5ef5eff80mr989627vke.10.1675678209951; Mon, 06
 Feb 2023 02:10:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000f61bdf05e79a7c5c@google.com> <00000000000067d34605f3e029f7@google.com>
In-Reply-To: <00000000000067d34605f3e029f7@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 6 Feb 2023 11:09:57 +0100
Message-ID: <CANp29Y72b7Vd5JpU8aiZLxqhyMtF_Y04bR8-+AxzS9Oj5S6EVw@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel paging request in mi_enum_attr
To: syzbot <syzbot+28207acc70bbf3d85b74@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 4, 2023 at 2:56 PM syzbot
<syzbot+28207acc70bbf3d85b74@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b
> Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Date:   Mon Oct 10 10:15:33 2022 +0000
>
>     fs/ntfs3: Check fields while reading
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13c11ba5480000
> start commit:   f9ff5644bcc0 Merge tag 'hsi-for-6.2' of git://git.kernel.o..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c163713cf9186fe7
> dashboard link: https://syzkaller.appspot.com/bug?extid=28207acc70bbf3d85b74
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1275aed7880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124f533b880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fs/ntfs3: Check fields while reading

The reproducer was mostly triggering a KASAN: use-after-free in
mi_enum_attr error and the patch indeed looks like the one that could
have fixed this problem.
Let's close the bug, if `unable to handle kernel paging request in
mi_enum_attr` is still not fixed, it will pop up again.

#syz fix: fs/ntfs3: Check fields while reading

>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000067d34605f3e029f7%40google.com.
