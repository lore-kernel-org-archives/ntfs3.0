Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D5E191
	for <ntfs3@lists.linux.dev>; Sun, 30 Oct 2022 07:03:13 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id f140so8201777pfa.1
        for <ntfs3@lists.linux.dev>; Sun, 30 Oct 2022 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyF/R/2WTrLneukk7kSdKd5EhCLxrsOWmVW7ecTbbfM=;
        b=YHomcf2498kp/tmkp72Pt2Iup6sbFL7DvV7NfXwhPbU6ZLv/+4FHQvJrfvw1OnVN74
         hS0HUxVXnb9p4cnMisRtzLiXm7MwNcW2wohkuUgHYw6lmkjcwhc6n8MOmAhQ3ukz8gHk
         5WdR9Hp4Yb+eG22ZhGGT2A9rDn4cCLywl1cmQgCTMzQVlgle2lgtBNWz7cbtzv1SRy3A
         lN5O6HJnVkX4/MaHOiz62yHDtveVvJtvjsGJ08UBgyDx+QbKocB5xiKulJnZO/7XNWJT
         FHpQKOglixHOlQsUBejX/uy/50/kRwU19TwwORbqXZc70aziIfoNVnMYtCdFvlVnL0Rh
         Ls6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyF/R/2WTrLneukk7kSdKd5EhCLxrsOWmVW7ecTbbfM=;
        b=3+5REygEL9Il5yi6slsYTMKknV4YvRsvht5/fA4/WM4t7sWTtn7bVLhdx3zTZ/B83/
         akHmPQCz/vMYYECBj0nYOCaaEW32xq4XT4Z7ohcu24zpyQUs8dqQxWols8VH0RKZXIXb
         BcIJqChysWRn0xtgLTV00qY5vdNQxdBKTROArbhAMBEizxqKDNteahBpoA1nG38jfBRq
         VQ7PCwqlwEfoBxswmI1zeNYr4kZbdSR+cCioz7mlJdugdRQxMD30YbmqhH8/Z52c100s
         as6wew+PKCqXu/y0gtL0CIqz2RXWFpyGF8W6Eh5Rry/CBuuUIQnNw72BH1cFjGOLNMrj
         wQKg==
X-Gm-Message-State: ACrzQf1uJ8ABMOjr2MXWfiTipAaoWfEGSAqc/hRHnB9C5JBT4sZjFtP9
	qOinKxopALEXDlkG21RqOtM=
X-Google-Smtp-Source: AMsMyM7mtvGzeJGvFc/LlsYuZ38YYkGPpeb2EP7dJoxa51Wm848cYTSCAQcJ+BsuVUZojhzc9k+g3g==
X-Received: by 2002:a05:6a00:1582:b0:56d:4bc6:68c7 with SMTP id u2-20020a056a00158200b0056d4bc668c7mr1629218pfk.31.1667113393458;
        Sun, 30 Oct 2022 00:03:13 -0700 (PDT)
Received: from localhost.localdomain ([106.201.172.104])
        by smtp.googlemail.com with ESMTPSA id p1-20020a170902e74100b0017a032d7ae4sm2234195plf.104.2022.10.30.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 00:03:13 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abdun Nihaal <abdun.nihaal@gmail.com>,
	syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: Fix NULL dereference in ni_write_inode
Date: Sun, 30 Oct 2022 12:32:51 +0530
Message-Id: <20221030070251.614970-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reports a NULL dereference in ni_write_inode.
When creating a new inode, if allocation fails in mi_init function
(called in mi_format_new function), mi->mrec is set to NULL.
In the error path of this inode creation, mi->mrec is later
dereferenced in ni_write_inode.

Add a NULL check to prevent NULL dereference.

Link: https://syzkaller.appspot.com/bug?extid=f45957555ed4a808cc7a
Reported-and-tested-by: syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 fs/ntfs3/frecord.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 70a80f9412f7..e55bbd209ef8 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3243,6 +3243,9 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		return 0;
 	}
 
+	if (!ni->mi.mrec)
+		goto out;
+
 	if (is_rec_inuse(ni->mi.mrec) &&
 	    !(sbi->flags & NTFS_FLAGS_LOG_REPLAYING) && inode->i_nlink) {
 		bool modified = false;
-- 
2.37.3

