Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446C3FF0
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:10:08 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id i28so4344300ljm.7
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfrA7yCk08W+f7B0nV9XF/ban1tdbk/AFjE2kKZi8vM=;
        b=gXRl8n1oVEqv6QME3+YMOvq6Q4UOsv7LjHe/4l0LoymvfAzhCgs327dt/IlHS2fK2O
         b8bHa1ZKxTNDMKDdZhzTnhIGSJRaC1Y5G0O+gMfNwFknyltqEeBT7KiDRq7RbbVwkd4N
         HPwdfVTwntP5k380neVU1rXbdmQrtjqIwAU/21Hf2BR4JmfW69JBYtXjK1wErI0Kk3+f
         /J7cSGczo4/cNMkzsM4amVbxOfP4HZpu8JxFXRb4vCBiX0q1fEsfIOPhHI90BWj2Aolq
         vqafwbtfsKzo/EmwLlJ9Zk3MOM3GkJDDISZPHslLDxrXkkCVEbbFleChsr7genDk4tmV
         2ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfrA7yCk08W+f7B0nV9XF/ban1tdbk/AFjE2kKZi8vM=;
        b=IA20s2goRMJDo0QfKLfLo4JZVylf65mqeOP6VqLJHzn0TRa0pJkno69N/VStcoD0Tn
         qpHXugrM8Wc4RDM+aNkRRs8mhFWWpMga+Y0dn/vZ4J/Q/bauW0mddRRo9VQKCxfdwHbA
         oQniclAcgAtwLFVMaUC0K1nmXfSzYZ5jsF4BuqOegDEe8Ao+aGQIz19BVj0KatXcRyZj
         IOGWvDesT5Hh5kcK07PZwZfppLcnxu9zkn6s8+dMAn/9GFmpt2u039d+BNnK80+EuYXP
         f7c7Dp57D8IeqQLG3xuiY7TV23xE2Si9rNRf/uyi++oxP2Ha6L34P7Qe9MO79LJkZnM4
         XSgA==
X-Gm-Message-State: AOAM531LYPGKzHZD0F1qOmFvhl2i0rV6yJQwve+4YmJFsQGXWZIB098V
	sCRJsiREC7QCLBhIyi+fdh8=
X-Google-Smtp-Source: ABdhPJzO5AbxW8rsSSsYaIEyqzrfURNFAAQCUZr66i+EvdRtrGKaLJsuA6nbdBGlaqfPYQnubOBubQ==
X-Received: by 2002:a2e:a26c:: with SMTP id k12mr919173ljm.17.1631211006881;
        Thu, 09 Sep 2021 11:10:06 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:10:06 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 11/11] fs/ntfs3: Initiliaze sb blocksize only in one place + refactor
Date: Thu,  9 Sep 2021 21:09:42 +0300
Message-Id: <20210909180942.8634-12-kari.argillander@gmail.com>
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

Right now sb blocksize first get initiliazed in fill_super but in can be
changed in helper function. It makes more sense to that this happened
only in one place.

Because we move this to helper function it makes more sense that
s_maxbytes will also be there. I rather have every sb releted thing in
fill_super, but because there is already sb releted stuff in this
helper. This will have to do for now.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
I really would like to initialize all sb stuff in fill_super and I try
it but it did not work out so well. Maybe if we do more refactoring
then maybe, but this should still be better that these can be found in
one place.

---
 fs/ntfs3/super.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 321fcfce64e1..9ad04fcf535a 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -842,8 +842,7 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	rec->total = cpu_to_le32(sbi->record_size);
 	((struct ATTRIB *)Add2Ptr(rec, ao))->type = ATTR_END;
 
-	if (sbi->cluster_size < PAGE_SIZE)
-		sb_set_blocksize(sb, sbi->cluster_size);
+	sb_set_blocksize(sb, min_t(u32, sbi->cluster_size, PAGE_SIZE));
 
 	sbi->block_mask = sb->s_blocksize - 1;
 	sbi->blocks_per_cluster = sbi->cluster_size >> sb->s_blocksize_bits;
@@ -856,9 +855,11 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	if (clusters >= (1ull << (64 - sbi->cluster_bits)))
 		sbi->maxbytes = -1;
 	sbi->maxbytes_sparse = -1;
+	sb->s_maxbytes = MAX_LFS_FILESIZE;
 #else
 	/* Maximum size for sparse file. */
 	sbi->maxbytes_sparse = (1ull << (sbi->cluster_bits + 32)) - 1;
+	sb->s_maxbytes = 0xFFFFFFFFull << sbi->cluster_bits;
 #endif
 
 	err = 0;
@@ -913,20 +914,12 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 			~(u64)(sbi->discard_granularity - 1);
 	}
 
-	sb_set_blocksize(sb, PAGE_SIZE);
-
 	/* Parse boot. */
 	err = ntfs_init_from_boot(sb, rq ? queue_logical_block_size(rq) : 512,
 				  bdev->bd_inode->i_size);
 	if (err)
 		return err;
 
-#ifdef CONFIG_NTFS3_64BIT_CLUSTER
-	sb->s_maxbytes = MAX_LFS_FILESIZE;
-#else
-	sb->s_maxbytes = 0xFFFFFFFFull << sbi->cluster_bits;
-#endif
-
 	/*
 	 * Load $Volume. This should be done before $LogFile
 	 * 'cause 'sbi->volume.ni' is used 'ntfs_set_state'.
-- 
2.25.1

