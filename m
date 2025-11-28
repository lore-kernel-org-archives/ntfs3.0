Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8747C309DAF
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764324849; cv=none; b=F2klEZVyIyx2j9p3PQp1Z9++iToa+L1kZmjOOTzrMS6I22gpFff6+qQFoXH35LMmdtSwaGFFOd/sCYOdQEGwXTmWhQ9uO6f0kcNipvllESgXAECHqscrOzxvI9HpvVtbwakmkZTJ9rV8xyISCqEgEdCAUUTq0tTr1/2tHwH132o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764324849; c=relaxed/simple;
	bh=kVr6DBoa/bqfAwZkgZNONZ5a6MNtPx0ck2No19GrBEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fzYYRdA/tyTbeqyk1YDCojAA25hoK/DfvaPUxpuBOtfuCUPNfTlF2hoeQ4GyuLC2HZYFgpK3S22rwxJQhhI28qNPNIQ/44iPApwMpOYtxMjdIwyfFzonWDVhFEp3JEfEnocKQ93JYIQyj4OWjGm6HbdiJSw7UDW8ZmcD+nTr3AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSCQgLL5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSCQgLL5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-341988c720aso1438794a91.3
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 02:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764324847; x=1764929647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVuhVMY/nTuaFLZ3xpN4cW4yIYVl0+dcLUX2HVwBwT4=;
        b=cSCQgLL5657EVB690POmwIQno9hljpNLQcG7BvSJRCWq0+9Aen1cp3iK5/IN65vd9x
         fa3DP32CtJ9md2iHh0YLT7aBNwLAZZmrfNbNKIX6Gn7mJ/RXGboDmhF+sth3wgO202V4
         F/JrsE9m0EgahQJw8jZR6YLCxJiZtV8g+xxyEPY/jfD9/zRD14CQAZXsr2WfrCNpjKhy
         RfXOB6jxZ41jn06aElTSQ4TwykTjIL0h4QXVrQPh/qvETtxTYQfAb+LY0BpbWSo3WO3T
         l8nnNqDStG+6AMwfW0RIMahxPbaWBW80dVixxnVxyMGiKGcoxtFkUd1XUq5pY+PNEAWn
         g1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764324847; x=1764929647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVuhVMY/nTuaFLZ3xpN4cW4yIYVl0+dcLUX2HVwBwT4=;
        b=BDucirux9ergTUC0fzwNadayh/nWX6JLnn2DB6BHA8kHzA6JgD4oD0uWIftAeQ9Hrs
         KMmcSUBofXKAkV6W6ih8GDuI0J/ZLLwKoXA4mc8FRGKbgNfMfXsV4bmkwvbGqup68wIq
         0t1ZRBqrno568V7ofQCGROT10rn8ubMbchag35SSgEuUMeOJsz2pLUx8OAL1i7qXgYio
         kiO/eJse0C+gZBw7wXzo2ER4+ZRMIMzI7jv5qYCENhaXeY3x3YPz9ALhq4IzlZUymRfk
         BF4W/JvksLDpabRN9/I38kQTw4IfNOGuYlgbOTJWmJoLNfbQQ7U5pNGkqBRtV6VjJ3FX
         r0EA==
X-Gm-Message-State: AOJu0Yz7PQ4N2+QJboeWUjF7Jzc+yghs0hOpFwESCGRdkyRGq6PXQuvR
	R8qXP/0T2/fgOV76+/Vz9rzvp0BziBQyF09f2cZ+UcRZLHFG3vq1V4V9
X-Gm-Gg: ASbGncu325jZLP9ktLFlsfvtFRpk4nonw0/Llo3mvJxTrbpS86nQ2/mIy68ZI2QJMJb
	X+WQw8WLezMZ0Y65Iab4GHcPG/i+tWNmLUUJNHOzVS795cgAgyVNg8LqsjS8cnOdHoo7hDtygjp
	UpZ7jqeScFW+3XFN+Xj/cA4aqA0o6pUxui2BgPk3HMzLLqYR4YPj8wxtdDalvjtQIYiU/GTySQf
	Od8bYQNsoiiwS3liDxpKqJTK7Z167hahQhT1Iw2oWR6eYXYByR++UxfBvqHNeMwyC2KvT7lMLZs
	0jxuFhhPlrNonH5lUMzdn+hbkJKWFiSE7KIhrQ7kfgQ3TEYKD1jBO5O9a03HdDRCn0OW0bODTM4
	2Sp8ydb1ips7V6iIFdW3m1bvXaytCdeVmAAfDwexfzLnYbHE1ONbjuydpTwjAut2ySXrQeMpHS/
	/juG+F5UPbGc6ixrPr4SYYlvDdABi0riFLDoQwYK6Iag==
X-Google-Smtp-Source: AGHT+IGPNQcoNeTmGBagvJ6Fu/LU8IZMnDRWO/fq/BjBDONgwBLHMQh5JHFx0V5ZcQr1wINP80B9gg==
X-Received: by 2002:a17:90b:5628:b0:341:194:5e7c with SMTP id 98e67ed59e1d1-34733f2d700mr25570078a91.24.1764324846664;
        Fri, 28 Nov 2025 02:14:06 -0800 (PST)
Received: from Dell-G15.SRMIST.EDU.IN ([104.28.225.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ff9fed2sm5421023a91.6.2025.11.28.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:14:06 -0800 (PST)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] fs/ntfs3: Use wait_on_buffer() directly
Date: Fri, 28 Nov 2025 10:12:56 +0000
Message-ID: <20251128101256.283353-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wait_on_buffer() checks buffer_locked() internally
before calling __wait_on_buffer().

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 fs/ntfs3/fsntfs.c | 15 ++++-----------
 fs/ntfs3/index.c  |  4 +---
 fs/ntfs3/super.c  |  4 +---
 3 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index c7a2f191254d..a6c155c691d6 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -875,9 +875,7 @@ void ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
 			return;
 		}
 
-		if (buffer_locked(bh2))
-			__wait_on_buffer(bh2);
-
+		wait_on_buffer(bh2);
 		lock_buffer(bh2);
 		memcpy(bh2->b_data, bh1->b_data, blocksize);
 		set_buffer_uptodate(bh2);
@@ -1069,9 +1067,7 @@ int ntfs_sb_write(struct super_block *sb, u64 lbo, size_t bytes,
 				return -ENOMEM;
 		}
 
-		if (buffer_locked(bh))
-			__wait_on_buffer(bh);
-
+		wait_on_buffer(bh);
 		lock_buffer(bh);
 		if (buf) {
 			memcpy(bh->b_data + off, buf, op);
@@ -1347,8 +1343,7 @@ int ntfs_get_bh(struct ntfs_sb_info *sbi, const struct runs_tree *run, u64 vbo,
 					err = -ENOMEM;
 					goto out;
 				}
-				if (buffer_locked(bh))
-					__wait_on_buffer(bh);
+				wait_on_buffer(bh);
 				set_buffer_uptodate(bh);
 			} else {
 				bh = ntfs_bread(sb, block);
@@ -1420,9 +1415,7 @@ int ntfs_write_bh(struct ntfs_sb_info *sbi, struct NTFS_RECORD_HEADER *rhdr,
 		if (op > bytes)
 			op = bytes;
 
-		if (buffer_locked(bh))
-			__wait_on_buffer(bh);
-
+		wait_on_buffer(bh);
 		lock_buffer(bh);
 
 		bh_data = bh->b_data + off;
diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 6d1bf890929d..763fc05d3ca7 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -252,9 +252,7 @@ static int bmp_buf_get(struct ntfs_index *indx, struct ntfs_inode *ni,
 
 	bbuf->bh = bh;
 
-	if (buffer_locked(bh))
-		__wait_on_buffer(bh);
-
+	wait_on_buffer(bh);
 	lock_buffer(bh);
 
 	sb = sbi->sb;
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index ddff94c091b8..bb6462d5569c 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1616,9 +1616,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		 */
 		struct buffer_head *bh0 = sb_getblk(sb, 0);
 		if (bh0) {
-			if (buffer_locked(bh0))
-				__wait_on_buffer(bh0);
-
+			wait_on_buffer(bh0);
 			lock_buffer(bh0);
 			memcpy(bh0->b_data, boot2, sizeof(*boot2));
 			set_buffer_uptodate(bh0);
-- 
2.43.0

