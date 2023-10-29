Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADEC14AAC
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b93FJh1V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BC9C433BB;
	Sun, 29 Oct 2023 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620363;
	bh=MdrrgcrCDhq02f5qNoORDamBPU38Nb0dOAeVgx2jPIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b93FJh1VUnPeHjapaWNeVfxVim41UZowo8FuRNI7Nla4fRFCWjtRi1auW1dHCRARi
	 449TDMuE4ShoJJaZDFIPl9dZNF1YrZfylsOhZ6iHP7CXMxGZxuabeftwqK59lg5oN2
	 Hxwuq/gCVQ8AoKN8w4xulB7tIFJoWvKsGdQMUSq7KjEN/tZ5328ovV0d0z9YfC/BM7
	 PVEuT+BVKRLUP2A70o2R37i4ijjizmo/7AkR7V/YEbafGtZbIe+CW8+nsP420m4X+J
	 dX9t09dN4ga9WBdf1O+3KCo4u6LM1E+5K3ba5G7nONW3CrFexMmYxYKcviEkBsvHdv
	 JOcUnX4bmDfXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 04/28] fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)
Date: Sun, 29 Oct 2023 18:58:39 -0400
Message-ID: <20231029225916.791798-4-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225916.791798-1-sashal@kernel.org>
References: <20231029225916.791798-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
Content-Transfer-Encoding: 8bit

From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

[ Upstream commit fc471e39e38fea6677017cbdd6d928088a59fc67 ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/attrlist.c | 15 +++++++++++++--
 fs/ntfs3/bitmap.c   |  3 ++-
 fs/ntfs3/super.c    |  2 +-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/attrlist.c b/fs/ntfs3/attrlist.c
index 81c22df27c725..0c6a68e71e7d4 100644
--- a/fs/ntfs3/attrlist.c
+++ b/fs/ntfs3/attrlist.c
@@ -52,7 +52,8 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
 
 	if (!attr->non_res) {
 		lsize = le32_to_cpu(attr->res.data_size);
-		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
+		/* attr is resident: lsize < record_size (1K or 4K) */
+		le = kvmalloc(al_aligned(lsize), GFP_KERNEL);
 		if (!le) {
 			err = -ENOMEM;
 			goto out;
@@ -80,7 +81,17 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
 		if (err < 0)
 			goto out;
 
-		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
+		/* attr is nonresident.
+		 * The worst case:
+		 * 1T (2^40) extremely fragmented file.
+		 * cluster = 4K (2^12) => 2^28 fragments
+		 * 2^9 fragments per one record => 2^19 records
+		 * 2^5 bytes of ATTR_LIST_ENTRY per one record => 2^24 bytes.
+		 *
+		 * the result is 16M bytes per attribute list.
+		 * Use kvmalloc to allocate in range [several Kbytes - dozen Mbytes]
+		 */
+		le = kvmalloc(al_aligned(lsize), GFP_KERNEL);
 		if (!le) {
 			err = -ENOMEM;
 			goto out;
diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 3261b69cdac33..21536b72aa5e5 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -667,7 +667,8 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
 		wnd->bits_last = wbits;
 
 	wnd->free_bits =
-		kcalloc(wnd->nwnd, sizeof(u16), GFP_NOFS | __GFP_NOWARN);
+		kvmalloc_array(wnd->nwnd, sizeof(u16), GFP_KERNEL | __GFP_ZERO);
+
 	if (!wnd->free_bits)
 		return -ENOMEM;
 
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 33b1833ad525c..fbaf1c84311be 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1136,7 +1136,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto put_inode_out;
 	}
 	bytes = inode->i_size;
-	sbi->def_table = t = kmalloc(bytes, GFP_NOFS | __GFP_NOWARN);
+	sbi->def_table = t = kvmalloc(bytes, GFP_KERNEL);
 	if (!t) {
 		err = -ENOMEM;
 		goto put_inode_out;
-- 
2.42.0

