Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78304A21
	for <ntfs3@lists.linux.dev>; Wed,  1 Feb 2023 07:55:00 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id o20so28016916lfk.5
        for <ntfs3@lists.linux.dev>; Tue, 31 Jan 2023 23:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhWiO+p9x9WvJVlyCm4UKDXTp9wp+AugKSgLzsEWkSM=;
        b=OdJg2J6Fq6RC82L5qiRdzhcICkRaa401c3XJ2z4UaFlMfxJKql91GEJx7wXFlJVWE9
         0A6Om5ynV19o1g4U4YEgXL3F9N3M2qWRW235OQjFfXjasRJ6/l0jk8NLK0KfiL4rrtdU
         Pf9qXK4GH8MMjaWRpP7xFI2T5uA1Kq4pPdMej6r+Zd6XVOc3U/u4q8H0oVYNnFUAdLJK
         kW8F9YgI5S9MNzkGn0k3dA0kbR/dejUsXZF2EpBwuhpXbp6cp+S0JHdpLllffej2Yxv+
         hrzcJLTbqGW2N53Vy5oy40/ehsFCWUFmVi3Ps7oGUo90bHhBIwfDnTHGH4s0Z3Of5RKH
         XVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhWiO+p9x9WvJVlyCm4UKDXTp9wp+AugKSgLzsEWkSM=;
        b=jiloHkJfo26TZbHNd5/XDcJ/adfbX+zpK5E8nUVmgfoQET9Y8u+TnQQmiz41oScdaK
         Srl+OX9PUssNRQsvQfzUKvVT7RuAg1dqroMKh1BIsATgjiP8u2VKwScS1hl290CEzL86
         KH+oJ+Eg+wt0svQhZLShcjJ53VBNJRPBiDYECUGNqazTUel9MDHlPq4Qj8IjRTkF0srS
         4/WUXxcaWbzmjmJi1JNYK9au13QAN0APuyNxVpa0l8+HDWZs+bjzjN7CPjKSvyxP1RTF
         OURMd+0ueRYXB/MNsa3uRZhdixIDyrlz4bQzMklRP1TGHFK3aLkUOJ3Z/ToxYwUvD43x
         BHQw==
X-Gm-Message-State: AO0yUKXyd09cIb44KysVShi0ZxUnIPQBjKtl5PyrWa9iFORpwOoq2pV7
	fq8EiMoV1mBYxM4ktKeY1wm+xqdfacbv/81qtvbtmg==
X-Google-Smtp-Source: AK7set8NtXvm0jBebiwKSfALgi6I403BGuRww4o1r00RYIWc+fbOyjqqE766o8ePH49oxCqyY/IBFexla9RPfxtC6LA=
X-Received: by 2002:ac2:5336:0:b0:4b5:2aed:39be with SMTP id
 f22-20020ac25336000000b004b52aed39bemr206347lfh.195.1675238098213; Tue, 31
 Jan 2023 23:54:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000d7eced05f01fa8d0@google.com> <000000000000171a2805f38bf07a@google.com>
In-Reply-To: <000000000000171a2805f38bf07a@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 1 Feb 2023 08:54:46 +0100
Message-ID: <CACT4Y+ZRU8PZVNEyuWr_CMqyGHtV8O9vG_kf7zQK3uhbQ=0pKg@mail.gmail.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in mi_find_attr
To: syzbot <syzbot+8ebb469b64740648f1c3@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, edward.lo@ambergroup.io, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Jan 2023 at 10:27, syzbot
<syzbot+8ebb469b64740648f1c3@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 4f1dc7d9756e66f3f876839ea174df2e656b7f79
> Author: Edward Lo <edward.lo@ambergroup.io>
> Date:   Fri Sep 9 01:04:00 2022 +0000
>
>     fs/ntfs3: Validate attribute name offset
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12e74535480000
> start commit:   e2ca6ba6ba01 Merge tag 'mm-stable-2022-12-13' of git://git..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a6133b41a9a0f500
> dashboard link: https://syzkaller.appspot.com/bug?extid=8ebb469b64740648f1c3
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fb2ad0480000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164513e0480000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fs/ntfs3: Validate attribute name offset
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable, let's close the bug report:

#syz fix: fs/ntfs3: Validate attribute name offset
