Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE35872
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 14:28:53 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id f18so19861677lfk.12
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ap3Ek0dwbDdcBxMpX/E/tBfL9VsP0qgFOKYYOZ32dic=;
        b=IufpyzN01y9PYsuUlyIhgSFlzS8AUFqBjndA9eLCzRg+aw/aAM2xs7lxlQqgKBgoiJ
         0QV96F314zGdDlwew8AKyzdr3Y+4Wak8xUSDWYeI9UAkhSdF9vMfW4rfUlh2INQv1zMP
         wE4m3zZ1SrBTs6jgcluIdiWZu3I5uN7MyhsGvzA6R/M940eA5w15rIZ9g0qi5Xtxe1Do
         CxcWNHyL4qbpGe+4drQFy9ohyU5QxI/LC99aDJlcBp818yFQYb4PhIavaQWmnew5gbSi
         YUwqB/HGI/akz/O5tJ2VYKuBc1qGTEOyYpZWUzCf3whlrWr91C1tZAfQHUQLR5DK7h5x
         QoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ap3Ek0dwbDdcBxMpX/E/tBfL9VsP0qgFOKYYOZ32dic=;
        b=XNc0e6YZurtaL7FIQWgtydAJbD1yLEvkxpbOzmiI3ZY69EqMhtq7lWPqkV/V06n6rt
         zpgxhpawPZJz77glc+eGjrLUKdc0ZAXqkxED9GWOW6XdVaX2To9ZiAfdzfVPpBr4APqR
         jblKAkBRYS8aBFx39lja0dEA8Z9Ap0bWdFzT8vBOY//3SryHr86xTNImyBtKuFdY/UXW
         uoSfmX+SKKjgnxFFbxPhOb4sCvPxf1bHjS60Piwt14vw90tvBRoMoQ8CyksWKicOBZ/G
         /4fatnN4Tyk+8q9Oqxp2UGEJaDqZ/n0tqdyJeo1EmVBh2VAGlMwZ5FZhhAORayBAhwbX
         MNHA==
X-Gm-Message-State: AOAM530eJC5bvU7CagP3/5mBpo8Qn0zcI+ubreAK8GiVWFvmQLEbTk67
	QpnXTgDuIn6SNE9S39Yymtw=
X-Google-Smtp-Source: ABdhPJz3GQc60kv01OsUnASO7RJBsl8OLdDeOluwSraJtaoRG+Yrm7PvhBZathPp3d7Yp9G7Q0/ouA==
X-Received: by 2002:a05:6512:3c8d:: with SMTP id h13mr12777235lfv.657.1631024931942;
        Tue, 07 Sep 2021 07:28:51 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id l11sm1014251lfg.39.2021.09.07.07.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:28:51 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] fs/ntfs3: Fix ntfs_look_for_free_space() does only report -ENOSPC
Date: Tue,  7 Sep 2021 17:28:39 +0300
Message-Id: <20210907142842.133181-2-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907142842.133181-1-kari.argillander@gmail.com>
References: <20210907142842.133181-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ntfs_refresh_zone() returns error it will be changed to -ENOSPC. It
is not right. Also caller of this functions also check other errors.

Fixes: 78ab59fee07f ("fs/ntfs3: Rework file operations")
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/fsntfs.c | 51 +++++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 91e3743e1442..ae7c6435d7bc 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -358,7 +358,7 @@ int ntfs_look_for_free_space(struct ntfs_sb_info *sbi, CLST lcn, CLST len,
 			     enum ALLOCATE_OPT opt)
 {
 	int err;
-	CLST alen = 0;
+	CLST alen;
 	struct super_block *sb = sbi->sb;
 	size_t alcn, zlen, zeroes, zlcn, zlen2, ztrim, new_zlen;
 	struct wnd_bitmap *wnd = &sbi->used.bitmap;
@@ -370,13 +370,15 @@ int ntfs_look_for_free_space(struct ntfs_sb_info *sbi, CLST lcn, CLST len,
 		if (!zlen) {
 			err = ntfs_refresh_zone(sbi);
 			if (err)
-				goto out;
+				goto up_write;
+
 			zlen = wnd_zone_len(wnd);
 		}
 
 		if (!zlen) {
 			ntfs_err(sbi->sb, "no free space to extend mft");
-			goto out;
+			err = -ENOSPC;
+			goto up_write;
 		}
 
 		lcn = wnd_zone_bit(wnd);
@@ -385,12 +387,11 @@ int ntfs_look_for_free_space(struct ntfs_sb_info *sbi, CLST lcn, CLST len,
 		wnd_zone_set(wnd, lcn + alen, zlen - alen);
 
 		err = wnd_set_used(wnd, lcn, alen);
-		if (err) {
-			up_write(&wnd->rw_lock);
-			return err;
-		}
+		if (err)
+			goto up_write;
+
 		alcn = lcn;
-		goto out;
+		goto space_found;
 	}
 	/*
 	 * 'Cause cluster 0 is always used this value means that we should use
@@ -404,15 +405,17 @@ int ntfs_look_for_free_space(struct ntfs_sb_info *sbi, CLST lcn, CLST len,
 
 	alen = wnd_find(wnd, len, lcn, BITMAP_FIND_MARK_AS_USED, &alcn);
 	if (alen)
-		goto out;
+		goto space_found;
 
 	/* Try to use clusters from MftZone. */
 	zlen = wnd_zone_len(wnd);
 	zeroes = wnd_zeroes(wnd);
 
 	/* Check too big request */
-	if (len > zeroes + zlen || zlen <= NTFS_MIN_MFT_ZONE)
-		goto out;
+	if (len > zeroes + zlen || zlen <= NTFS_MIN_MFT_ZONE) {
+		err = -ENOSPC;
+		goto up_write;
+	}
 
 	/* How many clusters to cat from zone. */
 	zlcn = wnd_zone_bit(wnd);
@@ -431,22 +434,22 @@ int ntfs_look_for_free_space(struct ntfs_sb_info *sbi, CLST lcn, CLST len,
 	/* Allocate continues clusters. */
 	alen = wnd_find(wnd, len, 0,
 			BITMAP_FIND_MARK_AS_USED | BITMAP_FIND_FULL, &alcn);
-
-out:
-	if (alen) {
-		err = 0;
-		*new_len = alen;
-		*new_lcn = alcn;
-
-		ntfs_unmap_meta(sb, alcn, alen);
-
-		/* Set hint for next requests. */
-		if (!(opt & ALLOCATE_MFT))
-			sbi->used.next_free_lcn = alcn + alen;
-	} else {
+	if (!alen) {
 		err = -ENOSPC;
+		goto up_write;
 	}
 
+space_found:
+	err = 0;
+	*new_len = alen;
+	*new_lcn = alcn;
+
+	ntfs_unmap_meta(sb, alcn, alen);
+
+	/* Set hint for next requests. */
+	if (!(opt & ALLOCATE_MFT))
+		sbi->used.next_free_lcn = alcn + alen;
+up_write:
 	up_write(&wnd->rw_lock);
 	return err;
 }
-- 
2.25.1

