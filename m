Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC41BDCD
	for <ntfs3@lists.linux.dev>; Sat, 16 Sep 2023 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694887144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uxC3KkgcEVk/woa2gOxR4oEmhN+ppIRoS6d7Lsp8+jk=;
	b=Sm8sNZXa7KAkkTTC72o6uoGWNashr92CqAb3DHqHOSO8NCJB8HGA4yqV0JHkyCUezJZfij
	WOXSnzz6oUF6jOn5vcrs6FA1dn8XXjcs0A9WJBLPvIjLuB2d5STScis+74Wmsx8Cuo1ua9
	zfAPe+tHFgjtHh8Kjh03S0ElTQuD9IQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-zs2rCZIfMhaAddY0DmOHrA-1; Sat, 16 Sep 2023 13:59:02 -0400
X-MC-Unique: zs2rCZIfMhaAddY0DmOHrA-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1c43e6ba8d1so12164625ad.3
        for <ntfs3@lists.linux.dev>; Sat, 16 Sep 2023 10:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694887141; x=1695491941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxC3KkgcEVk/woa2gOxR4oEmhN+ppIRoS6d7Lsp8+jk=;
        b=mBTexJR3MPe1m7+BkcCIAfCSSyHVXq+GcQZsFhBAYIXNZFLyz3+Jb4kNXlm4zIC+TI
         OTSyGrPDRSVTf/P5YVAROdRszvL3r70b8Taqc2wygBwxE28OtzqMNs/P3irlWLQiJvtr
         Ju5Xw2YElvrDNYqE3B02tsD2QGwTzhO6aD+FgDbitcclqMJKpTqGmpu4yki9Mr9gLuJ6
         ZT6o45QGrwdLiqpXn/2mmNIM/OXLhKXN4/9KX3m4C+t7FnKrBPeLYL1k3qPoQ8ByYtUn
         PKzYwYvKvSjV43gEXVaGHOxVcI7q8tzTcPk5hepuI7x9HhRXMWocffbXCsctND8Ip45t
         6ETA==
X-Gm-Message-State: AOJu0YzrRyvUZBzgT29dOdTbJ8NZn4NRrJt3g0uyRkY5jJN9UKf2MsO9
	bx6cq+nQLMZDPNChORM0uqXO7TDR0yp6LvmTU5E1pTIwlPlwnxl2P3rOsbFD/Ie3NKNPMpMtFyn
	bzF/pqCM18NyXVFc=
X-Received: by 2002:a17:902:b284:b0:1c0:953d:58 with SMTP id u4-20020a170902b28400b001c0953d0058mr4864513plr.0.1694887141106;
        Sat, 16 Sep 2023 10:59:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPk14frCdL1OB9hOXeYU8B5nEszOYgyqoW2r0dhAy/z9+/X7Gm77SjyEdqKN5zCh9sOkGjJg==
X-Received: by 2002:a17:902:b284:b0:1c0:953d:58 with SMTP id u4-20020a170902b28400b001c0953d0058mr4864503plr.0.1694887140831;
        Sat, 16 Sep 2023 10:59:00 -0700 (PDT)
Received: from kernel-devel.local ([240d:1a:c0d:9f00:245e:16ff:fe87:c960])
        by smtp.gmail.com with ESMTPSA id jw16-20020a170903279000b001b016313b1dsm5345546plb.86.2023.09.16.10.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 10:59:00 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>,
	syzbot+9ccdd15480e9d9833822@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: Fix memory leak in ntfs_fill_super()
Date: Sun, 17 Sep 2023 02:58:52 +0900
Message-ID: <20230916175852.1607269-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

syzbot reported memory leak in ntfs_fill_super(). ntfs_fill_super() calls
wnd_init() and this allocates memory. So, we need to free those memory on the
error handling path in ntfs_fill_super().

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-and-tested-by: syzbot+9ccdd15480e9d9833822@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9ccdd15480e9d9833822
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 fs/ntfs3/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index cfec5e0c7f66..a9610f5f4cc0 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1563,6 +1563,13 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	iput(inode);
 out:
 	kfree(boot2);
+
+	if (sbi->mft.bitmap.inited)
+		wnd_close(&sbi->mft.bitmap);
+
+	if (sbi->used.bitmap.inited)
+		wnd_close(&sbi->used.bitmap);
+
 	return err;
 }
 
-- 
2.41.0

