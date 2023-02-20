Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DD7EC8
	for <ntfs3@lists.linux.dev>; Mon, 20 Feb 2023 06:52:33 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id i9so291308lfc.6
        for <ntfs3@lists.linux.dev>; Sun, 19 Feb 2023 22:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6CWW5uGUlAt6Sd8nKZj5npU45hxB5kJkdPJ1fT9sd6E=;
        b=HhDvLYpHdjrALFMb5xlqKhWe9yGcFu5oU2QNjnJWD2wRBlenuRENihTwmVFGGr0cDw
         6Gh/mT85lH/EFBC7p3aC4uGMGxL4TW8wFzRZNALajqXXMW8hJkRwRRH4gMKgxzRRNVD+
         IA8nbh6f76/4MkiJLQlUWkf0cQuo5fm2bJ93So7L0zkCnhAHpBCAfW6PV+X72hUomvEM
         qCrha5ZgXEo8ytn037Mvq1wXzMsGSzqwKfwa0Bmss0n7LGFbZB0r795eXn8i2ElUgdG3
         7lFz8newb/Ol1wnh1B4xl/QQ1K/3zok2FqtToQLyitNkBnR7LF9M525EhcJYLeo5CD/Z
         j54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CWW5uGUlAt6Sd8nKZj5npU45hxB5kJkdPJ1fT9sd6E=;
        b=ZI7qtEkN1dTIKGSo8XqvtRbwstauEJRlg2k6fxtuAl77JWJNzSWwSvRjJa4oqFZM33
         d5jwbTbLPz7VUWkj3PwIFItH6qUWBbFsMnaP/QY4RISdcluqXoObrkIksanAEaO7GDO/
         TfbmsvG5O9tVBAiXlhAhaNP+JicJbJxlOsE4PmoMM/bgfWapnW/ZjeAFZKWJsYlqW4Cy
         9AOCEhb5R4l9Z89l0WKovV+yWK9TrnTOSeNwcMWzJohZwy3adekgD80ZXMoiKGH7XGBE
         rxIUZ+/b6Y0VCmj0hvVCdflQlGbXmvmUDJWFyy1hMegqJtNHKqVuuLSSl4mHrSj8AHgB
         PrIg==
X-Gm-Message-State: AO0yUKUzSdJ//uvDbzqiDtn0az5AkTP2zyW9RDV2TsW4zkIKaTs+/079
	htOdqB8Zk2crrqkUYIp+Q5LNVsSbACAgS1r4hoiFSA==
X-Google-Smtp-Source: AK7set/FzkeRlCVFqlhSE4tboJRsOG7fcq2tajzcz2a+xN6YH+d4hlwiy9+UW4wTwa0/G7MThUOwOqFUTAPHI81esdk=
X-Received: by 2002:a05:6512:3d90:b0:4dc:7e56:9839 with SMTP id
 k16-20020a0565123d9000b004dc7e569839mr867321lfv.5.1676875951338; Sun, 19 Feb
 2023 22:52:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000008f00f7058ad13ec8@google.com> <0000000000009fddba05f500c785@google.com>
In-Reply-To: <0000000000009fddba05f500c785@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 20 Feb 2023 07:52:18 +0100
Message-ID: <CACT4Y+asA1zb6A4SJTDgF+rpNyZoHmE27xjfQd5pqg2_wyhErA@mail.gmail.com>
Subject: Re: [syzbot] [net?] [ntfs3?] KMSAN: uninit-value in bcmp
To: syzbot <syzbot+d8b02c920ae8f3e0be75@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, davem@davemloft.net, 
	edward.lo@ambergroup.io, glider@google.com, idosch@mellanox.com, 
	ivan.khoronzhuk@linaro.org, jiri@mellanox.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	petrm@mellanox.com, phind.uet@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Feb 2023 at 23:16, syzbot
<syzbot+d8b02c920ae8f3e0be75@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 4f1dc7d9756e66f3f876839ea174df2e656b7f79
> Author: Edward Lo <edward.lo@ambergroup.io>
> Date:   Fri Sep 9 01:04:00 2022 +0000
>
>     fs/ntfs3: Validate attribute name offset
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149cdbcf480000
> start commit:   b7b275e60bcd Linux 6.1-rc7
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
> dashboard link: https://syzkaller.appspot.com/bug?extid=d8b02c920ae8f3e0be75
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164c4a4b880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=152bfbc9880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fs/ntfs3: Validate attribute name offset

Looks reasonable to me"

#syz fix: fs/ntfs3: Validate attribute name offset
