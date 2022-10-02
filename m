Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3223D6A
	for <ntfs3@lists.linux.dev>; Sun,  2 Oct 2022 21:53:03 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1322d768ba7so3955437fac.5
        for <ntfs3@lists.linux.dev>; Sun, 02 Oct 2022 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uCRA476ZAmoARGY528Dr8G2lwbqlxMrHrdrYd8As2cY=;
        b=Vu8AMmr1rXWDuTzUFCxWM4PFvHSj7lqRHf3bdDHtGLs3oB1efx+kq+eZCQuUwmclP3
         4jUEhDv6NQ5zCSpozuwKHt+tbEwUJWjgZy+zoIWk+FrYEQS7tW0fbpAqEEf/uIs/nbnS
         FytV8O0ZL4Ji7bp1rpzXz7p1JU+DI2guvhxWhuBM86QCeN4cyZFF9QtgeTCBanpXAwDR
         FzvqemuiJ1I+ZiYnFUfOLi3VI31bPglQE4BQ5Sr5r1OwL6Albr5YyTGfYQFf52Iqfw17
         g42eLFpM0MiSF01Qdd44kxh57F9fgQoBGJm+7AfmQo0grqYe2UzGAHmyMiQppv9lVkWh
         LD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uCRA476ZAmoARGY528Dr8G2lwbqlxMrHrdrYd8As2cY=;
        b=sPLAU7N+YcfNm8xSTmkI7LESmehkXz7djPDVA0nJYaA11ocGJgLO4xyrwjBi3BCyYi
         0hV7rPynzV6VXWm7KTsjjPUD+Udv4RH7vWi2/1IyEuFJ5IJv21ewVnsXaUViX0mgRsWV
         kr9G8azb/SOBWKWVEBhl8YI6/byQa9OtaFUS3hqnp4hsGnv4xCCJ06lrRJEWgMK6bfU+
         DE+EJICK+VCGG6HGgoL58y4RKJpBtaO2Fl/SG/+rDHxhPRBKduE4k+cDKM40Y3wLS44W
         RqvLAndOrW/x3xOCwa6odKaMnC+mVfZteO10SuK9NufKUOguXgY3VrYR1EJAcN8heJyc
         zZEQ==
X-Gm-Message-State: ACrzQf28Yw1tB4qCtGa9QOUOv+Lilg6Oaaj7ufqsHxZFs2snY3RrWAA0
	S1Hy08IwOdKp75otaxEdLmxk/3xBR43ryFvvBlg=
X-Google-Smtp-Source: AMsMyM51ol9aCd1biy/P9mhuy4xTHsDitUqvKFHWQlKYgMTU/4iro6nWQPmY2SJBXmjY1UK/8//QaeGLTYMcdU6neB4=
X-Received: by 2002:a05:6870:d147:b0:126:d4a4:e99d with SMTP id
 f7-20020a056870d14700b00126d4a4e99dmr3698892oac.149.1664747582994; Sun, 02
 Oct 2022 14:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000c2333105e9cc7b1c@google.com> <0000000000001f464d05ea07e1ec@google.com>
In-Reply-To: <0000000000001f464d05ea07e1ec@google.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Mon, 3 Oct 2022 00:52:43 +0300
Message-ID: <CAC=eVgQSpoQq8qs=oioN0Rcdy=n0_YRoJ-R4=b0GJ2BdRpZLaA@mail.gmail.com>
Subject: Re: [syzbot] WARNING in wnd_init
To: syzbot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, pjwatson999@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

2.10.2022 syzbot (syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com) wrote:
>
> syzbot has bisected this issue to:
>
> commit fa3cacf544636b2dc48cfb2f277a2071f14d66a2
> Author: Kari Argillander <kari.argillander@gmail.com>
> Date:   Thu Aug 26 08:56:29 2021 +0000
>
>     fs/ntfs3: Use kernel ALIGN macros over driver specific
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11e776f4880000
> start commit:   49c13ed0316d Merge tag 'soc-fixes-6.0-rc7' of git://git.ke..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=13e776f4880000
> console output: https://syzkaller.appspot.com/x/log.txt?x=15e776f4880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ba0d23aa7e1ffaf5
> dashboard link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cad4e0880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1303781f080000
>
> Reported-by: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
> Fixes: fa3cacf54463 ("fs/ntfs3: Use kernel ALIGN macros over driver specific")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

I check what my patch actually changed. In my original patch I did

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index b5da2f06f7cbd..d4dd19b822bc2 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -900,7 +900,7 @@ static inline bool run_is_empty(struct runs_tree *run)
/* NTFS uses quad aligned bitmaps */
static inline size_t bitmap_size(size_t bits)
{
- return QuadAlign((bits + 7) >> 3);
+ return ALIGN((bits + 7) >> 3, 8);
}

QuadAlign was "buggy" so that it did always give a 32 bit result back. ALIGN
macro will give a 64 bit. So bitmap_size now gives different result. To me it
looks like my patch actually fix this behavior. I just didn't notice
this behavior
when I did the patch.

I have tested that if bitmap_size return u32 syzbot will not trigger the issue
anymore. You can see my test patch in the Syzbot dashboard [1]. That is not
prober fix imo, but just wanted to help anyone looking at this problem.

[1]: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
