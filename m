Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60648C2DF
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbedU2Wq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF35C433CB;
	Sun, 29 Oct 2023 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620266;
	bh=w7zIj0XQKMS+IcxUMKCn+DPPlG4ZSR3j2YvVKeVcfcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lbedU2WqH9K3kL1w/q0KO267aOWDjPDz4C010EFTIaGCu5FKtIVhd/g3ixVSSflCD
	 N7V32ENUsSGk1Kx/SZHMGsmWugazfCfJsbpnRAbXxRVf0mhTrfa/tmAZ8uI2ZApmBV
	 mpNc6atovqFvtzkTqsRjx89VfyxJ68EQbh5v+jx3BtO1ztVHXvyyhJJt9kcUDeXvj1
	 I1BK1uN1NtbMXRPHOurWE9bz4IHm4A9uWpHi3mYHa63REQMUiD/JtIgNIRQe2aAfk7
	 /ZAgEo+lMISaMcOqMYCFpE/HxkeR16gn3SSjKJmYQvWIpi3XXzJtTYTgOhtpKaKZVA
	 +gC8fUseTs7uw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 03/39] fs/ntfs3: Write immediately updated ntfs state
Date: Sun, 29 Oct 2023 18:56:35 -0400
Message-ID: <20231029225740.790936-3-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225740.790936-1-sashal@kernel.org>
References: <20231029225740.790936-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.60
Content-Transfer-Encoding: 8bit

From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

[ Upstream commit 06ccfb00645990a9fcc14249e6d1c25921ecb836 ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/fsntfs.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 829b62d3bb889..4b79232aeb59b 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -953,18 +953,11 @@ int ntfs_set_state(struct ntfs_sb_info *sbi, enum NTFS_DIRTY_FLAGS dirty)
 	if (err)
 		return err;
 
-	mark_inode_dirty(&ni->vfs_inode);
+	mark_inode_dirty_sync(&ni->vfs_inode);
 	/* verify(!ntfs_update_mftmirr()); */
 
-	/*
-	 * If we used wait=1, sync_inode_metadata waits for the io for the
-	 * inode to finish. It hangs when media is removed.
-	 * So wait=0 is sent down to sync_inode_metadata
-	 * and filemap_fdatawrite is used for the data blocks.
-	 */
-	err = sync_inode_metadata(&ni->vfs_inode, 0);
-	if (!err)
-		err = filemap_fdatawrite(ni->vfs_inode.i_mapping);
+	/* write mft record on disk. */
+	err = _ni_write_inode(&ni->vfs_inode, 1);
 
 	return err;
 }
-- 
2.42.0

