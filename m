Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4421123B3
	for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 20:53:49 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id p12so5245894lfs.5
        for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 13:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B4VBOlm6iLOGzQv2TEwbkAlQp6pIkWL2NhOTXS+7ZNY=;
        b=fdLo4s0Nu2zUGhClmHv8PKZgp1GL9H9AbH4jUaDUyIpGOsuxxDZNuAUWwM6pymGBqo
         Hh7rWHGt2CLMO46r+IDFRUBjgL8+R10mpiAC2qlVvgI5oofaPA6N4YM5+QQT/hcMwT7M
         JxMB9yKo/Ldr+Kv5PoeNQhXVG6UUfh1QDhz8ofxxrNwus5uj4WUH1qhmW+0uC5Ctk5Kx
         L7SlfISj2Rr3kGv24ALM+khZcuOm2eFWFo11dZjrZMo+MMD+WS/8A5bVfeEIKwyv7gAX
         Z+m5/tMtYt+0sNX8H1uhqw5iV1r9mmGvMZCspuV8XmSSQIofoOdPe9Fe09WQJpb9WdZg
         pUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4VBOlm6iLOGzQv2TEwbkAlQp6pIkWL2NhOTXS+7ZNY=;
        b=p7cN/AZv25xBEvm7Th1lyhlB42NvB/ZYOVFRN5ojH+8sQDj0TeogpEPTqMn18cKlK9
         c/aIOVYrzuanHFHvjZfm8ATDjtMD5dKkmGBE9E4f+u6DJ+vWu+o3ZF9IuAtYpTqlCtuh
         2YNgB3FdgLLUYfu9QkpDwHL6j7JZvpBxYyYrDdBymL0+hBehxYyKNqPgJTmqV+f/oLBe
         azyb+Yv7WO7bnf3P1HNOQzwuxWtIfJmySBJuNm2VH6i7OZDg3mzKkvhwIseh64TDhHlX
         p7z3NbbMf0Jt0b/lOmUNqEV9Tz/FHxgSep9P2lJsm7qcLdd8cZbCZRgfJFBAsVcR+UK9
         leEg==
X-Gm-Message-State: AOAM530BTs4ZBhdVobwIcC8bEzJdB3UGydoO1HOhsDY27GglUqXle5kG
	ZjRXHOl8g4CaqNJ5SL3bw+uxk5GTuLwpfA==
X-Google-Smtp-Source: ABdhPJzIbPyJ6oyHi/bK9nnaXuZ7z14Vq28pCBJBiE15yzKRuOWBae1IN3O2XYL3K0hksKoI4OVT2w==
X-Received: by 2002:a05:6512:3193:b0:471:8eee:44d6 with SMTP id i19-20020a056512319300b004718eee44d6mr848240lfe.439.1650574427190;
        Thu, 21 Apr 2022 13:53:47 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id m21-20020a197115000000b004719502fb63sm12703lfc.77.2022.04.21.13.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 13:53:46 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 2/2] ntfs3: make ntfs_update_mftmirr return void
Date: Thu, 21 Apr 2022 23:53:45 +0300
Message-Id: <a6b74fe2eb5a15eec42d3488d289e105bffb94ee.1650574393.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <85293dd018cae78e4d48d74ca77710b11eed59ba.1650574393.git.paskripkin@gmail.com>
References: <85293dd018cae78e4d48d74ca77710b11eed59ba.1650574393.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

None of callers check the return value of ntfs_update_mftmirr(), so make
it return void to make code simpler.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 fs/ntfs3/fsntfs.c  | 20 +++++++-------------
 fs/ntfs3/ntfs_fs.h |  2 +-
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 891125ca6848..938acb246b58 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -827,7 +827,7 @@ int ntfs_refresh_zone(struct ntfs_sb_info *sbi)
 /*
  * ntfs_update_mftmirr - Update $MFTMirr data.
  */
-int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
+void ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
 {
 	int err;
 	struct super_block *sb = sbi->sb;
@@ -836,12 +836,12 @@ int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
 	u32 bytes;
 
 	if (!sb)
-		return -EINVAL;
+		return;
 
 	blocksize = sb->s_blocksize;
 
 	if (!(sbi->flags & NTFS_FLAGS_MFTMIRR))
-		return 0;
+		return;
 
 	err = 0;
 	bytes = sbi->mft.recs_mirr << sbi->record_bits;
@@ -852,16 +852,13 @@ int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
 		struct buffer_head *bh1, *bh2;
 
 		bh1 = sb_bread(sb, block1++);
-		if (!bh1) {
-			err = -EIO;
-			goto out;
-		}
+		if (!bh1)
+			return;
 
 		bh2 = sb_getblk(sb, block2++);
 		if (!bh2) {
 			put_bh(bh1);
-			err = -EIO;
-			goto out;
+			return;
 		}
 
 		if (buffer_locked(bh2))
@@ -881,13 +878,10 @@ int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
 
 		put_bh(bh2);
 		if (err)
-			goto out;
+			return;
 	}
 
 	sbi->flags &= ~NTFS_FLAGS_MFTMIRR;
-
-out:
-	return err;
 }
 
 /*
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index fb825059d488..061dafbdcedd 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -592,7 +592,7 @@ int ntfs_look_free_mft(struct ntfs_sb_info *sbi, CLST *rno, bool mft,
 void ntfs_mark_rec_free(struct ntfs_sb_info *sbi, CLST rno);
 int ntfs_clear_mft_tail(struct ntfs_sb_info *sbi, size_t from, size_t to);
 int ntfs_refresh_zone(struct ntfs_sb_info *sbi);
-int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait);
+void ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait);
 enum NTFS_DIRTY_FLAGS {
 	NTFS_DIRTY_CLEAR = 0,
 	NTFS_DIRTY_DIRTY = 1,
-- 
2.35.1

