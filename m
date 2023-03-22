Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAF31FB1
	for <ntfs3@lists.linux.dev>; Wed, 22 Mar 2023 08:12:38 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id q17-20020a056e020c3100b003245df8be9fso7919616ilg.14
        for <ntfs3@lists.linux.dev>; Wed, 22 Mar 2023 01:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679472758;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=o1lEWlmZB4xr9woTW6wnsVKnRT8QH6HVF6W4l+jX6PPICi/KV6hylc5yNN64i84GdE
         PVaSPKAPVBHdihvIP6RuKQkTb0rSBIW0ImEDYRirAQs3PsQz5l2w3PlTWo5eqeZgKSwz
         //y6U+7fJEEGUZAtsBUU9ru6RHXZuTd7GxUZsTYT1GsYhbMGqx2wiusBpdkzTriH8cQQ
         9NLroCE4HLjnBisvkYyRnxl2Wg5I2zttLLSS3msKiI9xaX4vPipkTW9l4TfDzUpItt/T
         wGvN2WQe/tAtgd1peqxj/2elyS9E/C7pasYHaSE5csMsulkaR8VLlaMUncIJnkoa+W7x
         59eg==
X-Gm-Message-State: AO0yUKVDGa8pYMXZQV+LGWnDZnpxQ1tXT6lIKcX2xw7Ew8zQ4GXyfGV+
	d8tsRwWuvhyE+22YXQ80y7rsz7HaZzT65MBZ1TH6a9ZVnv1V
X-Google-Smtp-Source: AK7set+OeAVbohPc7fpUZXumhTbjxoLQEP7JyCfjRAlXeHVD1nz99SDwJbphcHiy2E96tJ+2fMwLwaeYs8l51/MGknUjMu6mQ3lk
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:128f:b0:313:fa72:d9aa with SMTP id
 y15-20020a056e02128f00b00313fa72d9aamr2273525ilq.0.1679472758036; Wed, 22 Mar
 2023 01:12:38 -0700 (PDT)
Date: Wed, 22 Mar 2023 01:12:38 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000027262305f778b938@google.com>
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
