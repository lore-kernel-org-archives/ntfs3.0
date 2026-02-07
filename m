Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C522173D
	for <ntfs3@lists.linux.dev>; Sat,  7 Feb 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770475561; cv=none; b=iTi80JurNpyX4vcxy89tWt1TmAwwRJjpoUvZ/oP2m/SyJ3qLeXOGB/e/Zd6TeAPaaVoLGaPh7ex1XECsgumvAsE1vOdM6tohrVjq9iQbC/SeLRfsdtUagnaCvABDl303oU1WpeTbew6PzP2b6LGN65zWMbqOAVRKl8fOWsHV6Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770475561; c=relaxed/simple;
	bh=JSVkV+kpw6j52+88N+QfRdheyCwuYYp4nV1ZKZkhJvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASC3kFBPqxB4FjQg6yvi/NRcOSRSfK+cZ3XT4fsdsJWNejgdog6Km9MxPMeQIrtku9fUAgdarf+V5GH6DCWvWOJoGV3GuwxSUzvfsl0mmFvQKWsIk+fDNRVPVjMp0wlcv54OQv2don41Z1AwVguegoGKo2njAnjVU159bhTctSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9LQDHuQ; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9LQDHuQ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3090312eec.1
        for <ntfs3@lists.linux.dev>; Sat, 07 Feb 2026 06:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770475561; x=1771080361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IonYphKR0CQp0rm1ICLqevRTebRTstcO+T+JXtAhtbE=;
        b=D9LQDHuQoY1RQOBa72oZ7LEqtwSZcvRjNyiGWthpLsr+3lfvpe6nBnJeJrhbImbImR
         1/X2VTA/2Ip6fDcDgguIEhwmG/6HLrjkYgsoPDoyHTuxxuauNSfl7YIHB06DT3zk6h10
         ur+5aP+CRgzQA3BqUJQdoOYwtBzrT/KTOZWnsv0PamAHpBRTDTx/25G98GqZh5Tuk7ZW
         5e19ZIZ6SaJqAqNHmMuvklByJDNxTZxV9ZBPQy+eAJ6ZTv6f5qYQj9PAnvzR81SstsNZ
         FOpVRE0gOaI9+frg2NDXHVWv0LryDULD7ynaLvBCxsRc0ibsWyQt8hKbEqpQwD/gJSvv
         fcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770475561; x=1771080361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IonYphKR0CQp0rm1ICLqevRTebRTstcO+T+JXtAhtbE=;
        b=clEFgY+WonDu7B+H36sDij9ednSFExmz1AqbvA1yP/0y14X52Q7RbfoeZVlGd0527P
         ZO7XsWgR7Dx9YLnLxmTu/dvMWwdWDWzzwQLv0UO4XfL6uhTrGei1Yo656e0qE507SgEY
         Hf8W6Gy7PKrLWr00NFY7RBRhE06M0Kq+iWJ1pFdOsZbdfPWq4LKgSN1p8I/UHK/g5rs8
         LF4cuZdHNkUoRd+KelDzvxRQomPG094ONxFZXn6q+ipOw7RWhv4Ue8H88zuh68x/YsSb
         gvBDHjvcBUjvq4mShZrFL10XvcVSRrElL+to13g76ko0mqQv1H9IzO9ZGsSMrRAjTQ1l
         rjBQ==
X-Gm-Message-State: AOJu0Yxxk64ov7hA8DbezF08Qd8VAXC+8I7FIrNrPB8fxiLE3Yr3LrmS
	3JDwd1bcRpoKrI5YmcPrI3VeiPq7o5i7gC2wkcDz9O+SwZlQp+pSB2XlCzL1OUBA49Y=
X-Gm-Gg: AZuq6aJ24llD8bgQonxIEgxxokW1veGp1FMj66uEhKrboNfW69cCRjn1Y5DNqG08nI9
	hqrh05q9u925zt6S4P/RoW0lZBHbEc5aXoXYQW+J0PXTwzrdj7awF2shE+vkOxbUf2fXUB8Z8s6
	3lS5KAgtlvNglnaZU0Ih1HcRAI8bemAsAJY+af/1csQJLcdDGvE/8WQX9o0fY8O1imnnLsezaUs
	63tzTUok6LljyaCROwt1nd/aGDKds9I1GYE9uFNXQM/5VIgYZuo3OMFjn3smOHtQqwrW9p4ywQS
	13eLK6dZ7zq1A3uDlKbnUTkcpUDDEemcSmGJmo5i6+5M19TApMUTZx0oQQ4COH3lB2eMQai6eSH
	shssE39e1Zh6A6PgKu9fIDTVWnrXdVBXtQUFwvbga18V+NUSe48Szub4EUExKIQQyczICVc9CrW
	OZRs2l+8Ep2eFrEev81yEQY5xajC8YIidgCrzWTGXvDVpBtA4c5Nqkj3qaXQGc/gAHhvMbZ+gaO
	dHfSxTMNA==
X-Received: by 2002:a05:7300:724e:b0:2ae:53da:979c with SMTP id 5a478bee46e88-2b8563d948bmr2732277eec.5.1770475560570;
        Sat, 07 Feb 2026 06:46:00 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3c846sm3856122eec.16.2026.02.07.06.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 06:46:00 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2] fs/ntfs3: return folios from ntfs_lock_new_page()
Date: Sat,  7 Feb 2026 22:45:52 +0800
Message-ID: <20260207144552.2322468-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205094934.10500-1-sun.jian.kdev@gmail.com>
References: <20260205094934.10500-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_lock_new_page() currently returns a struct page * but it primarily
operates on folios via __filemap_get_folio(). Convert it to return a
struct folio * and use folio_alloc() + __folio_set_locked() for the
temporary page used to avoid data corruption during decompression.

When the cached folio is not uptodate, preserve the existing behavior by
using folio_file_page() and converting the returned page back to a
folio.

Update ni_readpage_cmpr() and ni_decompress_file() to handle the new
return type while keeping the existing struct page * array and the
unlock_page()/put_page() cleanup paths unchanged.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
v2:
  - Fix build failure in ni_decompress_file() by switching the local
    pointer to struct folio * (reported by kernel test robot).
  - Reported-by: kernel test robot <lkp@intel.com>
  - Closes: https://lore.kernel.org/oe-kbuild-all/202602072013.jwrURE2e-lkp@intel.com/
  - Closes: https://lore.kernel.org/oe-kbuild-all/202602071921.nGIiI1J5-lkp@intel.com/

 fs/ntfs3/frecord.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 641ddaf8d4a0..6169257cf784 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2022,27 +2022,31 @@ int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
 	return err;
 }
 
-static struct page *ntfs_lock_new_page(struct address_space *mapping,
-		pgoff_t index, gfp_t gfp)
+static struct folio *ntfs_lock_new_page(struct address_space *mapping,
+					pgoff_t index, gfp_t gfp)
 {
 	struct folio *folio = __filemap_get_folio(mapping, index,
 			FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
-	struct page *page;
 
 	if (IS_ERR(folio))
-		return ERR_CAST(folio);
+		return folio;
 
-	if (!folio_test_uptodate(folio))
-		return folio_file_page(folio, index);
+	if (!folio_test_uptodate(folio)) {
+		struct page *page = folio_file_page(folio, index);
+
+		if (IS_ERR(page))
+			return ERR_CAST(page);
+		return page_folio(page);
+	}
 
 	/* Use a temporary page to avoid data corruption */
 	folio_unlock(folio);
 	folio_put(folio);
-	page = alloc_page(gfp);
-	if (!page)
+	folio = folio_alloc(gfp, 0);
+	if (!folio)
 		return ERR_PTR(-ENOMEM);
-	__SetPageLocked(page);
-	return page;
+	__folio_set_locked(folio);
+	return folio;
 }
 
 /*
@@ -2064,6 +2068,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct folio *folio)
 	u32 i, idx, frame_size, pages_per_frame;
 	gfp_t gfp_mask;
 	struct page *pg;
+	struct folio *f;
 
 	if (vbo >= i_size_read(&ni->vfs_inode)) {
 		folio_zero_range(folio, 0, folio_size(folio));
@@ -2099,12 +2104,12 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct folio *folio)
 		if (i == idx)
 			continue;
 
-		pg = ntfs_lock_new_page(mapping, index, gfp_mask);
-		if (IS_ERR(pg)) {
-			err = PTR_ERR(pg);
+		f = ntfs_lock_new_page(mapping, index, gfp_mask);
+		if (IS_ERR(f)) {
+			err = PTR_ERR(f);
 			goto out1;
 		}
-		pages[i] = pg;
+		pages[i] = &f->page;
 	}
 
 	err = ni_read_frame(ni, frame_vbo, pages, pages_per_frame, 0);
@@ -2190,18 +2195,18 @@ int ni_decompress_file(struct ntfs_inode *ni)
 		}
 
 		for (i = 0; i < pages_per_frame; i++, index++) {
-			struct page *pg;
+			struct folio *f;
 
-			pg = ntfs_lock_new_page(mapping, index, gfp_mask);
-			if (IS_ERR(pg)) {
+			f = ntfs_lock_new_page(mapping, index, gfp_mask);
+			if (IS_ERR(f)) {
 				while (i--) {
 					unlock_page(pages[i]);
 					put_page(pages[i]);
 				}
-				err = PTR_ERR(pg);
+				err = PTR_ERR(f);
 				goto out;
 			}
-			pages[i] = pg;
+			pages[i] = &f->page;
 		}
 
 		err = ni_read_frame(ni, vbo, pages, pages_per_frame, 1);

base-commit: 2687c848e57820651b9f69d30c4710f4219f7dbf
-- 
2.43.0

