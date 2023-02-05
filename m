Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92102F21
	for <ntfs3@lists.linux.dev>; Sun,  5 Feb 2023 19:46:18 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id r18-20020a92d992000000b00313b6f93d45so2161213iln.9
        for <ntfs3@lists.linux.dev>; Sun, 05 Feb 2023 11:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyVpInRmcNvlIB5ckskfYghTIH0/4E9ydL9t6KxI9Oo=;
        b=GnZJaB7fd4exPBqcH2Oqik4caBXnlfSvxzYCEP68eUTWvILavJ8a+F51gliU3FAHYO
         PJXq5Lom0TWTXu7hZqjoMVjhqCVDZ93s1p37Ip6Yg/oWz9+5yMgE16iuojTor51Pml/I
         8mXB/BngroFzxB/8qLxuC44xKGE/3WTdOdpKSZEeZPwqevRyZX2lWv15WFD//d4IWivD
         KfLSbkB6im7u7E1G+ZrtO7yUZtnxvmrFLD3ZOd0DIk9jrrjeIP4SLiPvwBNjYtc2viIg
         kl/KAlUegaOzom11X4fz+Qd7DMMc8LHrLZ3MSpgJUEcDFGM+Z+heDc1/Sa+qqCQkaR7S
         vHhg==
X-Gm-Message-State: AO0yUKWEZpqJ7EoRNf5p+982pC1caK7n1iXh7MBXN4NXd85sj7xNVQvJ
	Vf30iwCjhQYEiPFV3aitQ7898xfzZOnKnIygFkvGKwD4vFP0
X-Google-Smtp-Source: AK7set+m/GB/TobA2eHc5fdm4Edu22FyaWsREpkFyjGb4IASdMtFte+baW25gpzfLu10/N6BmHOAVZ19d2JWqbP+FAzuqt7cMSK6
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:597:b0:39d:234a:8f18 with SMTP id
 a23-20020a056638059700b0039d234a8f18mr4461620jar.123.1675626377990; Sun, 05
 Feb 2023 11:46:17 -0800 (PST)
Date: Sun, 05 Feb 2023 11:46:17 -0800
In-Reply-To: <0000000000009a318805e6ff48a4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000009570005f3f92b86@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in ni_find_attr
From: syzbot <syzbot+69d15cab6309bffae739@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, edward.lo@ambergroup.io, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 2681631c29739509eec59cc0b34e977bb04c6cf1
Author: Edward Lo <edward.lo@ambergroup.io>
Date:   Sat Aug 6 17:05:18 2022 +0000

    fs/ntfs3: Add null pointer check to attr_load_runs_vcn

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=110ad78d480000
start commit:   b7b275e60bcd Linux 6.1-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
dashboard link: https://syzkaller.appspot.com/bug?extid=69d15cab6309bffae739
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b3fb9b880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101313bb880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Add null pointer check to attr_load_runs_vcn

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
