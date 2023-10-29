Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5812E51
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqFjaY+H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CC2C433C8;
	Sun, 29 Oct 2023 22:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620096;
	bh=LaarqzJZ+1g+WsV+LxIqOT4Rcludj6V/0oFfui1OCCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GqFjaY+HI0yz7mAFQzuxiipHum9slGWoSglhicb9YZu8Px/HW8ZUKAPmIokA1tmmv
	 ZZcCM0RCIkaRCpssPXCtwaXBMR+71rhMM3jKk1/Dej2IO9KaJ/wC7+Z9aWa9H03xqc
	 5jZT7SqYaQ1Tz53SL8HqgYaCXr1vT1fYoyptoexE1JsmeO/H02rzj3mIS0MCcQo0pW
	 vaWhvMDAO/8m/jV9VpK7ds/QKxVRuCU/sHofzy32Ep3U/84tjlkjkakgtlECJ6NjB2
	 9HCrA934gDFSPvRNw6JAS8f4PYbXNaj1Su/ShIcC8KwsYvERuZwOjllU51aCwx/CSo
	 D6FPYOA0KaPKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 08/52] fs/ntfs3: Fix alternative boot searching
Date: Sun, 29 Oct 2023 18:52:55 -0400
Message-ID: <20231029225441.789781-8-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
Content-Transfer-Encoding: 8bit

From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

[ Upstream commit dcc852e509a4cba0ac6ac734077cef260e4e0fe6 ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/super.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 18a8bc73b8e2d..98545060580ac 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -838,7 +838,7 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
 	int err;
 	u32 mb, gb, boot_sector_size, sct_per_clst, record_size;
-	u64 sectors, clusters, mlcn, mlcn2;
+	u64 sectors, clusters, mlcn, mlcn2, dev_size0;
 	struct NTFS_BOOT *boot;
 	struct buffer_head *bh;
 	struct MFT_REC *rec;
@@ -847,6 +847,9 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	u32 boot_off = 0;
 	const char *hint = "Primary boot";
 
+	/* Save original dev_size. Used with alternative boot. */
+	dev_size0 = dev_size;
+
 	sbi->volume.blocks = dev_size >> PAGE_SHIFT;
 
 	bh = ntfs_bread(sb, 0);
@@ -1079,9 +1082,9 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	}
 
 out:
-	if (err == -EINVAL && !bh->b_blocknr && dev_size > PAGE_SHIFT) {
+	if (err == -EINVAL && !bh->b_blocknr && dev_size0 > PAGE_SHIFT) {
 		u32 block_size = min_t(u32, sector_size, PAGE_SIZE);
-		u64 lbo = dev_size - sizeof(*boot);
+		u64 lbo = dev_size0 - sizeof(*boot);
 
 		/*
 	 	 * Try alternative boot (last sector)
@@ -1095,6 +1098,7 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 
 		boot_off = lbo & (block_size - 1);
 		hint = "Alternative boot";
+		dev_size = dev_size0; /* restore original size. */
 		goto check_boot;
 	}
 	brelse(bh);
-- 
2.42.0

