Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289A257C
	for <ntfs3@lists.linux.dev>; Wed, 19 Apr 2023 08:13:38 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-32addcf3a73so121727145ab.0
        for <ntfs3@lists.linux.dev>; Wed, 19 Apr 2023 01:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681892017; x=1684484017;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=b28pOauG0fbq9kidtfjt160Lp7IM9Jr2W03tOwypAnlwkXqKy/K/0r0TOD+LX/1exB
         1wwzYprWwQ3b4rrSLvnTdgopFptKXHzPGeo3+qrct9QdhW+rqpbWTBCwXRlUi1sDRlb9
         Y1pw3bMv2m4i2hjaRf03shZDeI4jvd+cPtCUIezMH5XfOATEHuaWARaqV8z1TxKdcTDD
         nogwOcLz0L3EasRIBsPZEy4fHtyE/8Q7jQ3DOgPOeJBB2Ce96Rw/naP0hUOXg8vEWM8e
         lqulWR9WOD32oe0jRcsh9zf4bRkhMvFAg11sf+aMNmbfCVbq9JfOyP2/tvs6HbDdQ/AN
         QwMA==
X-Gm-Message-State: AAQBX9d/fOuQNd+lvXpmQt2Ha2vJ4qfHiIrbzfMSV4OpNO5h0oIaJXPu
	GNw4UiPFEXKR+s3+rRFvheCIlCMxRX3Gsu7aq4ln7tIvkkSN
X-Google-Smtp-Source: AKy350ZxM+Xb9GNBN83504bkL3uq/X7S37Mg6zCrCUERbs9vz+Iu5OHFeTeyO3L39/R+jUYeAVh6qHLpNsIhMXAdoXULMXlBIadJ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a6b:cd4c:0:b0:760:ea29:2594 with SMTP id
 d73-20020a6bcd4c000000b00760ea292594mr1190040iog.0.1681892017330; Wed, 19 Apr
 2023 01:13:37 -0700 (PDT)
Date: Wed, 19 Apr 2023 01:13:37 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003e62ab05f9ac0071@google.com>
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
