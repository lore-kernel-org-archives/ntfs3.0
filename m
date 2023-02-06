Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB3322A
	for <ntfs3@lists.linux.dev>; Mon,  6 Feb 2023 10:21:02 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id g13so784341uan.7
        for <ntfs3@lists.linux.dev>; Mon, 06 Feb 2023 02:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OeqUBf5wnWMgK5bQ3i9vK8qME5Qe9yR54Mq4WwOswZ0=;
        b=oqdBL/0nO4ayR2sHB2g8ZoJ/XpkmutFbpiVA9R3cG3qLSySLNK2laPi3Nai9r8b1MX
         wyiMylSja5N9hv4tH2OaT1k1JnkZ53U36QjzxpRpFhXn2Did3fJPmn6EeNNyID4Y5PZC
         rEKtFHTL4oSZouHAHYozzrYqxqE6WBtDKVubTv8P925FWmXWyPfHH7aSEX6jlBVPSDHi
         VKiXAbin/mSELXZ0Ke2WYurg4+gjzE5AOO8WUuTlhO6rkjbtV3dMU71yarLmqGl14Aoa
         mOYEBYFLgxlvOr9X0zvOQtMVCTh6Uny+DHSGjjnntv5U6E9hWsrayAOA0IcnLFE2vsT+
         RBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeqUBf5wnWMgK5bQ3i9vK8qME5Qe9yR54Mq4WwOswZ0=;
        b=Ggp7Kpl2UyGIy9mwFq5K0jMSfnWbbv2bNW1L/M09wrVyN7UDB7s1TKDEb+Rk8c1WPC
         dqo1GwjPGaHnCojyiFdlkEsD3n0cCPIGrEAg29jC47Gkw0k0VC/QSORJ5+7Q07MDAw15
         1gka8WAkycXDjY+pdUjxP/tRI4lZGLZvMnQ1KUiQ8zhRdPhonVfiZFkYhmFziUq8pL18
         KzegS0rKcT80s7oILmTZqTVP6niaqlhadzgxbiurVxGMCKyYNuhjp2IFzeceH6rABXOq
         cJmQxKgwOKKZtPgsskf/vjSTU9ANQsnpYNrEIs0jOlfGmn0uzzTYOaVoDtwICioXE64+
         Jo1Q==
X-Gm-Message-State: AO0yUKV3c6B3VC/T4LuUAg1GZMkoeNNn5SBI/k3l704Rls7aor0u69k0
	L/65rF+fijfsUYmLufMybfZwKw+YmiEe9GLpAHbapQ==
X-Google-Smtp-Source: AK7set/qRKnFrqx1vRhHLjmK1fGBoeerB4wIelaOaOYs+BJ0yf7p9HBZYntx15dGAPCrmF2R4FtINGq93+2AXWpQ9mo=
X-Received: by 2002:ab0:2618:0:b0:683:cba5:ad90 with SMTP id
 c24-20020ab02618000000b00683cba5ad90mr66938uao.59.1675678861528; Mon, 06 Feb
 2023 02:21:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000009a318805e6ff48a4@google.com> <00000000000009570005f3f92b86@google.com>
In-Reply-To: <00000000000009570005f3f92b86@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 6 Feb 2023 11:20:48 +0100
Message-ID: <CANp29Y4vi+5X+3otv3JzWG9Ph=hVuUME9O+NZERsXvyZDq0z1Q@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in ni_find_attr
To: syzbot <syzbot+69d15cab6309bffae739@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, edward.lo@ambergroup.io, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 5, 2023 at 8:46 PM syzbot
<syzbot+69d15cab6309bffae739@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 2681631c29739509eec59cc0b34e977bb04c6cf1
> Author: Edward Lo <edward.lo@ambergroup.io>
> Date:   Sat Aug 6 17:05:18 2022 +0000
>
>     fs/ntfs3: Add null pointer check to attr_load_runs_vcn
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=110ad78d480000
> start commit:   b7b275e60bcd Linux 6.1-rc7
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
> dashboard link: https://syzkaller.appspot.com/bug?extid=69d15cab6309bffae739
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b3fb9b880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101313bb880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fs/ntfs3: Add null pointer check to attr_load_runs_vcn

Looks correct.
#syz fix: fs/ntfs3: Add null pointer check to attr_load_runs_vcn

>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000009570005f3f92b86%40google.com.
