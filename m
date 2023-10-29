Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DD12E51
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsWyzZq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED797C433C7;
	Sun, 29 Oct 2023 22:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620097;
	bh=8/W2tMtUn0iLmvzcTTSUm1YwlPPgP6dMcQenQMiVERQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsWyzZq+PRxhc93gpLn9UpkylFVGVd0IAXqaGOOTksBDNXw1SZVGcijwrhm0UTd+J
	 gbShrwqFaOKpS73nU1xGfuOohOR00xp9EkCNQpWikEYWrlcmNHCfvhRB449pFvtIfS
	 pQwHl3eEqxVBkRp6iGbw9KfVJH7ECSnqsW7NswD4g94Z63YqBS2kNHzHeaFL8gerlw
	 N7czYeO6EVXzWb6f7o6GihoYaVgQYqsvSJTq5jMihaSnNUDAcylsbb0G0BFE44kDsj
	 CMd8ntPFZ6OFWeW6PcX79UagTvO/SBZ5AMsGSe5e+gtx6Z8rsMS3H/b1Dc95sjGxRw
	 dLmLu0ZxoZYJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 09/52] fs/ntfs3: Add more info into /proc/fs/ntfs3/<dev>/volinfo
Date: Sun, 29 Oct 2023 18:52:56 -0400
Message-ID: <20231029225441.789781-9-sashal@kernel.org>
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

[ Upstream commit d27e202b9ac416e52093edf8789614d93dbd6231 ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/super.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 98545060580ac..055c3764af26e 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -453,15 +453,23 @@ static struct proc_dir_entry *proc_info_root;
  * ntfs3.1
  * cluster size
  * number of clusters
+ * total number of mft records
+ * number of used mft records ~= number of files + folders
+ * real state of ntfs "dirty"/"clean"
+ * current state of ntfs "dirty"/"clean"
 */
 static int ntfs3_volinfo(struct seq_file *m, void *o)
 {
 	struct super_block *sb = m->private;
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
 
-	seq_printf(m, "ntfs%d.%d\n%u\n%zu\n", sbi->volume.major_ver,
-		   sbi->volume.minor_ver, sbi->cluster_size,
-		   sbi->used.bitmap.nbits);
+	seq_printf(m, "ntfs%d.%d\n%u\n%zu\n\%zu\n%zu\n%s\n%s\n",
+		   sbi->volume.major_ver, sbi->volume.minor_ver,
+		   sbi->cluster_size, sbi->used.bitmap.nbits,
+		   sbi->mft.bitmap.nbits,
+		   sbi->mft.bitmap.nbits - wnd_zeroes(&sbi->mft.bitmap),
+		   sbi->volume.real_dirty ? "dirty" : "clean",
+		   (sbi->volume.flags & VOLUME_FLAG_DIRTY) ? "dirty" : "clean");
 
 	return 0;
 }
-- 
2.42.0

