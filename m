Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8E815
	for <ntfs3@lists.linux.dev>; Wed,  5 Apr 2023 08:12:44 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id d204-20020a6bb4d5000000b00758cfdd36c3so21561804iof.0
        for <ntfs3@lists.linux.dev>; Wed, 05 Apr 2023 01:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682363; x=1683274363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RRpr/2enZpSN+Pqs5p0qwijporxRiSMR0agGaaar/U=;
        b=CXM/b6IsT6VpbiYpctsykqhTj5kCZworj259d1YjcPLFHNeap01XJ846JwAHW3JOmP
         VnP0vR/hTlDV1DkHNSCn63SwW9UBfB4vTqvXU0EYf9Y1i1IiN+6bl+4P+nCNvvZMYhkp
         A9wl/r5Z/+2HGlzS5ltVDMtry0Abyx8+NECnJL/KI+w8Z34atx5YBXNs9CqZnr0/3D3m
         wV7Hzh1KHXaNEYurV4tL7mtQj+G9hYwHkaYFxSbfm/zgd/XDe8dgUZxfCMnrTf+EHIdY
         p3TJ5D+INpzfjK4kykIhAjdELO5Q2sfGUpZIhISTsyymDtXMP7Zk3NEoMMGm408pbWCy
         yYHg==
X-Gm-Message-State: AAQBX9clZPatAHgDZcpWugzTT8n+Bbs5BKZaUTuLtv+pbIA1lG9+HoK/
	6pbQVmrVog8TgtJFZJdUaCdS7u56lzngmWmP2n0WLDeIsmNf
X-Google-Smtp-Source: AKy350ZyVVhmfk37CIGtaHVEI8ebtCHBWRXU7IGTuYY1ef3zGWS13ZFf/61/y86g7vr0rwkMISqHAld/pmURWrbxbO0dO3eRblY8
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a5d:8881:0:b0:753:2ab8:aff7 with SMTP id
 d1-20020a5d8881000000b007532ab8aff7mr3011620ioo.1.1680682363776; Wed, 05 Apr
 2023 01:12:43 -0700 (PDT)
Date: Wed, 05 Apr 2023 01:12:43 -0700
In-Reply-To: <000000000000ea3c3105ef377a12@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000045f34305f8925bd3@google.com>
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
