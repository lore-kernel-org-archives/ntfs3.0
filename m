Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE8138F
	for <ntfs3@lists.linux.dev>; Wed,  3 May 2023 08:13:47 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3314c25ae45so11810415ab.0
        for <ntfs3@lists.linux.dev>; Wed, 03 May 2023 01:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683101627; x=1685693627;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=Lixrf6SY/0YBrN1DA4L76qvLz+2Z0pfJlkMmQsaGWtysNiH7Y1C0A5E5bgxO1c13fG
         Rdlk+dFc+O5ODCvIPXP5SYausgpS2zcT7zCCBm+cMnRYjVOxh4jX+EBkzw7whNqbCX/J
         Nvobu2HM8msccel5ca/VJ5Bz7sKWmTkVbQy4La0n+jZpQapMT92BNw3yF0iYtIpsWIqT
         hjZxeFlPU282xjgopokTTTqHmEyCo5lrbN1PegPfC1IGmJf4+ghfZ0b+ArsSjHVRvkzO
         NcGUxEN2aqm66wI2asg21PrpRrZA7TLBSymA1oaWVzR0poAVa++/ZgrN6CONL704Xo51
         qkDw==
X-Gm-Message-State: AC+VfDwMEd2uSFJD1JtXBMkm3+8I7X6JV/j+stlEJCCWEfLJCdrWcz3Z
	1+bcckIoUVQPsioA0ZIlLbyHVJjKvz3FK+QNCwhD9D0FoBF2
X-Google-Smtp-Source: ACHHUZ4NVzKP5o5qLjz8lnTbsNdZPzLd+UgjpGHxihuqz06jFvkDRLvZe3mMdYN+wHv4ymgQ9efnXeYiDcMRaRtdZ2IP0Ji28Jka
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:d484:0:b0:331:57f3:6af3 with SMTP id
 p4-20020a92d484000000b0033157f36af3mr1042879ilg.1.1683101627167; Wed, 03 May
 2023 01:13:47 -0700 (PDT)
Date: Wed, 03 May 2023 01:13:47 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009bba0005fac5a2c6@google.com>
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
