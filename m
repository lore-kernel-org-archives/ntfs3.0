Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095643FF2
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:10:01 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id f2so4380511ljn.1
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xyyx98ohvBGLtu/RXBFKIsLv16m8Wp4VyNHMtY264u0=;
        b=VzYjqIkohug8LcjSPPZbKDhi+RnOICZQIhj5CQdOX0jebUnadgBAvGoOsliXZ6/swK
         LquJdWA/OJWavR/uAeFfuJ4FVHmmV82X7i9EssOEVeA39xGw94dmYlkD/nvXZv0ahHFU
         JHl8TX/O+e/Rkb2GGen7mLyy0Il42Sl09fsgL4Uq1M2uAYI0KNHexZzixSAZSsHFyu4y
         3yqeUgOxofqcnfGa+92r4sIUTIevbTs9+jHaucbyvwLVPbnw/IK1shfSwNMmL0WFCU+X
         IeFf6zK3gcHbBJliSNkZpXTrqo/dXQHVRNk6vBpH7XcbAUXcOXku0EhmIL5PdBqlN0Zt
         KZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xyyx98ohvBGLtu/RXBFKIsLv16m8Wp4VyNHMtY264u0=;
        b=g6Ij2rv+BGGwTYAxk3T207H5ZoSh7DhnqpgX9ITfmqgbGl34vGuQeDMl0GaTOyxrlu
         ynLrNJRjOY65TZx81KM7yS11k3SNFmkTZBnAod9ro05dF1CUOThPv6WkdyJlMTEG0sKT
         4wUrthtzkSlScg+l7myo6ofcZwIjlkIKhgoZV0v7qyWynuP5+cr1lsVfy//5x9ChlTzE
         0CNHvmr0ryHjxKnAWad20EwCtnq8dIiLYDZmaxuTRzuykpYKe5VufJu6PDdZIGpUNeX2
         FWNVrsYQo2tjuim/yUX6DwFUIMtfz9Lrvo5C67g7neTYQ9wZwldILmMUArXuY6BzW7Xb
         3BHw==
X-Gm-Message-State: AOAM530uEzpkqhrqMNPijJYsTgqdEMyogeykkdAR97d9u5X50cIew8+X
	7BscLhmt0PkPvUxKGQA56oo=
X-Google-Smtp-Source: ABdhPJyrS8ytRV+reeTGCs9+kg8U+/JVQ78r1mc/Dny6y+bu4yOKYC1AaVHhu/K0FRLqs2peASq3Sg==
X-Received: by 2002:a2e:9607:: with SMTP id v7mr863208ljh.405.1631210999293;
        Thu, 09 Sep 2021 11:09:59 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:09:58 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 05/11] fs/ntfs3: Remove unnecessary variable loading in fill_super
Date: Thu,  9 Sep 2021 21:09:36 +0300
Message-Id: <20210909180942.8634-6-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909180942.8634-1-kari.argillander@gmail.com>
References: <20210909180942.8634-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unnecessary variable loading. These look like copy paste
work and they are not used to anything.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index f3c3c2bea6ca..2eb1227bbf5a 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -879,7 +879,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	struct block_device *bdev = sb->s_bdev;
 	struct inode *bd_inode = bdev->bd_inode;
 	struct request_queue *rq = bdev_get_queue(bdev);
-	struct inode *inode = NULL;
+	struct inode *inode;
 	struct ntfs_inode *ni;
 	size_t i, tt;
 	CLST vcn, lcn, len;
@@ -979,9 +979,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->volume.major_ver = info->major_ver;
 	sbi->volume.minor_ver = info->minor_ver;
 	sbi->volume.flags = info->flags;
-
 	sbi->volume.ni = ni;
-	inode = NULL;
 
 	/* Load $MFTMirr to estimate recs_mirr. */
 	ref.low = cpu_to_le32(MFT_REC_MIRR);
@@ -1013,7 +1011,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto out;
 
 	iput(inode);
-	inode = NULL;
 
 	is_ro = sb_rdonly(sbi->sb);
 
@@ -1090,8 +1087,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		return PTR_ERR(inode);
 	}
 
-	ni = ntfs_i(inode);
-
 #ifndef CONFIG_NTFS3_64BIT_CLUSTER
 	if (inode->i_size >> 32) {
 		err = -EINVAL;
@@ -1190,8 +1185,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		return PTR_ERR(inode);
 	}
 
-	ni = ntfs_i(inode);
-
 	if (inode->i_size != 0x10000 * sizeof(short)) {
 		err = -EINVAL;
 		goto out;
@@ -1227,7 +1220,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 
 	iput(inode);
-	inode = NULL;
 
 	if (is_ntfs3(sbi)) {
 		/* Load $Secure. */
@@ -1261,8 +1253,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		return PTR_ERR(inode);
 	}
 
-	ni = ntfs_i(inode);
-
 	sb->s_root = d_make_root(inode);
 	if (!sb->s_root)
 		return -ENOMEM;
-- 
2.25.1

