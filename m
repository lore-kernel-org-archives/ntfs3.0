Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC3358AD
	for <ntfs3@lists.linux.dev>; Mon,  9 Oct 2023 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2MapsqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696864408; x=1728400408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bqgDsoa1BRXJuvxgsgl17/J0vD/b9uhc2mRnMLP/Gq4=;
  b=L2MapsqOv7vEJatIZlgA8Hu0STAUwmRiinlnslR7k6L/7+Vf+BjWUKG0
   G6egoB+AKo+LDdqW2XQyNi++K4gSoyuLmoDb6Tayx377VjlapvtvopQ9h
   3seCBOlqqwy7HkkgJErkU6Ye+SmKQr77O5ZIIgFBew0dHDnMtKHuksezP
   4TqQO3AqVBwF3KpyUDoXihJvDQHyJ3eK5kKMoIWosjjJzuI2I1BetgBoM
   UU6sQpqm2SH0eFx6MmHfg8fELnaXNrapmfwI8VFbMaTfg16nGPLcTgp2h
   5Oo3/VMKfJRqmmGtIXv0iSjK0nRRbkEn2wW55PEFuDPJ4pfMBw8VyakSU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369232170"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="369232170"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869288023"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869288023"
Received: from newjersey.igk.intel.com ([10.102.20.203])
  by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2023 08:13:22 -0700
From: Alexander Lobakin <aleksander.lobakin@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexander Potapenko <glider@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <simon.horman@corigine.com>,
	netdev@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	dm-devel@redhat.com,
	ntfs3@lists.linux.dev,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] fs/ntfs3: rename bitmap_size() -> ntfs3_bitmap_size()
Date: Mon,  9 Oct 2023 17:10:18 +0200
Message-ID: <20231009151026.66145-7-aleksander.lobakin@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009151026.66145-1-aleksander.lobakin@intel.com>
References: <20231009151026.66145-1-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitmap_size() is a pretty generic name and one may want to use it for
a generic bitmap API function. At the same time, its logic is
NTFS-specific, as it aligns to the sizeof(u64), not the sizeof(long)
(although it uses ideologically right ALIGN() instead of division).
Add the prefix 'ntfs3_' used for that FS (not just 'ntfs_' to not mix
it with the legacy module).

Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 fs/ntfs3/bitmap.c  |  4 ++--
 fs/ntfs3/fsntfs.c  |  2 +-
 fs/ntfs3/index.c   | 11 ++++++-----
 fs/ntfs3/ntfs_fs.h |  2 +-
 fs/ntfs3/super.c   |  2 +-
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 107e808e06ea..a2e18f13e93a 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -653,7 +653,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
 	wnd->total_zeroes = nbits;
 	wnd->extent_max = MINUS_ONE_T;
 	wnd->zone_bit = wnd->zone_end = 0;
-	wnd->nwnd = bytes_to_block(sb, bitmap_size(nbits));
+	wnd->nwnd = bytes_to_block(sb, ntfs3_bitmap_size(nbits));
 	wnd->bits_last = nbits & (wbits - 1);
 	if (!wnd->bits_last)
 		wnd->bits_last = wbits;
@@ -1345,7 +1345,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
 		return -EINVAL;
 
 	/* Align to 8 byte boundary. */
-	new_wnd = bytes_to_block(sb, bitmap_size(new_bits));
+	new_wnd = bytes_to_block(sb, ntfs3_bitmap_size(new_bits));
 	new_last = new_bits & (wbits - 1);
 	if (!new_last)
 		new_last = wbits;
diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 33afee0f5559..7a14d2347f27 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -522,7 +522,7 @@ static int ntfs_extend_mft(struct ntfs_sb_info *sbi)
 	ni->mi.dirty = true;
 
 	/* Step 2: Resize $MFT::BITMAP. */
-	new_bitmap_bytes = bitmap_size(new_mft_total);
+	new_bitmap_bytes = ntfs3_bitmap_size(new_mft_total);
 
 	err = attr_set_size(ni, ATTR_BITMAP, NULL, 0, &sbi->mft.bitmap.run,
 			    new_bitmap_bytes, &new_bitmap_bytes, true, NULL);
diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 124c6e822623..ab53a4b6ddf8 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1453,8 +1453,8 @@ static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 
 	alloc->nres.valid_size = alloc->nres.data_size = cpu_to_le64(data_size);
 
-	err = ni_insert_resident(ni, bitmap_size(1), ATTR_BITMAP, in->name,
-				 in->name_len, &bitmap, NULL, NULL);
+	err = ni_insert_resident(ni, ntfs3_bitmap_size(1), ATTR_BITMAP,
+				 in->name, in->name_len, &bitmap, NULL, NULL);
 	if (err)
 		goto out2;
 
@@ -1515,8 +1515,9 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 	if (bmp) {
 		/* Increase bitmap. */
 		err = attr_set_size(ni, ATTR_BITMAP, in->name, in->name_len,
-				    &indx->bitmap_run, bitmap_size(bit + 1),
-				    NULL, true, NULL);
+				    &indx->bitmap_run,
+				    ntfs3_bitmap_size(bit + 1), NULL, true,
+				    NULL);
 		if (err)
 			goto out1;
 	}
@@ -2089,7 +2090,7 @@ static int indx_shrink(struct ntfs_index *indx, struct ntfs_inode *ni,
 	if (in->name == I30_NAME)
 		ni->vfs_inode.i_size = new_data;
 
-	bpb = bitmap_size(bit);
+	bpb = ntfs3_bitmap_size(bit);
 	if (bpb * 8 == nbits)
 		return 0;
 
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 629403ede6e5..93333156aac6 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -961,7 +961,7 @@ static inline bool run_is_empty(struct runs_tree *run)
 }
 
 /* NTFS uses quad aligned bitmaps. */
-static inline size_t bitmap_size(size_t bits)
+static inline size_t ntfs3_bitmap_size(size_t bits)
 {
 	return ALIGN((bits + 7) >> 3, 8);
 }
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index cfec5e0c7f66..b1fb6efe7084 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1285,7 +1285,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* Check bitmap boundary. */
 	tt = sbi->used.bitmap.nbits;
-	if (inode->i_size < bitmap_size(tt)) {
+	if (inode->i_size < ntfs3_bitmap_size(tt)) {
 		ntfs_err(sb, "$Bitmap is corrupted.");
 		err = -EINVAL;
 		goto put_inode_out;
-- 
2.41.0

