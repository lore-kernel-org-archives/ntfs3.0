Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B97B
	for <ntfs3@lists.linux.dev>; Wed,  8 Mar 2023 08:11:40 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id k13-20020a056e021a8d00b0031bae68b383so7216215ilv.18
        for <ntfs3@lists.linux.dev>; Wed, 08 Mar 2023 00:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678263099;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=yasGr2UIUHv954DTSsSn0GjzJli6bYrjP8z3zDVKtSoi8+A7WvomhV+LdF7SZY3fOp
         ee8z/mr49OzxagXTP77Gm3zUkX65jG2FWuRDrMcwClHr7OdBeWArKGGQ21S4pe+P5vXB
         sYLIb9h6JxWeUa/KxMB6Tg6fc9DFxAeNS34aZI4z9U7ZbVqSyhTjk2JJsKkZYm78UW0U
         B0d9msNtByJP8S9a+n4dXb7npu3QHGsut/IPgdIbMPYA6pxux2F4FfEWZK28DXx5sG5w
         TLqowdvbM+xIpgjAcAgMX8z8hh9eEoTPoYKi60FoEYu2mL1P75CoeuK5L3c1MpmeylYX
         fuPQ==
X-Gm-Message-State: AO0yUKW5SQTM/N7nvnlOikGP1Vru5HqYglMo56LjxI+PiZ4y8JghlpIX
	udjb/NSbdyyBnTF9FVg23PJmR/yD23qgJUNb2KE9T0iBwBFq
X-Google-Smtp-Source: AK7set8ohvqpuNRL/JIS3vEqOiqVUfpwiOin574uHv80eNG3CnFwykdH8snjl4FxakBYbcLg+wDx8C0yoczKJ+W5O7OoK+osDiqq
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13f4:b0:313:fa72:d9aa with SMTP id
 w20-20020a056e0213f400b00313fa72d9aamr8342532ilj.0.1678263099703; Wed, 08 Mar
 2023 00:11:39 -0800 (PST)
Date: Wed, 08 Mar 2023 00:11:39 -0800
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e5c94a05f65f130d@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_listxattr
From: syzbot <syzbot+9fcea5ef6dc4dc72d334@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dvyukov@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, zengheng4@huawei.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
ntfs: fix panic about slab-out-of-bounds caused by ntfs_listxattr()

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=9fcea5ef6dc4dc72d334

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 10 trees can be found at
https://syzkaller.appspot.com/upstream/repos
