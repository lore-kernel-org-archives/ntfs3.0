Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD512E51
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvlthHcQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D97FC433C7;
	Sun, 29 Oct 2023 22:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620086;
	bh=8jwIhSJNERUS2JXUA+b4m7u2invwoqI91nbQ4OlFJNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HvlthHcQ7ham7V7mBZwpARv++2o/2vCidZrzMQn2wrXdu/L/4fVj4E59kt2+IXFUU
	 wqUBJU5fFNqLLfCHAkm9qYzrYnV5HDdUMx9QTS9LeyYLKEyn/kvVPLMhAUFL/BBoDk
	 0zVzNAkJdyrfu1QbiqCij0yDnzrJXnI2CnC1fg54lMG4c66wKxNXJxH5pS/8eXIRtP
	 CiNWeKUussp4tNljj6uDOiYhDTCfaGJ1SrpB3ktBrn0lsPG+ZZz8Bfhjpqtdy9fmI0
	 B0d5IBp4hVuwETLYxJisAt1yEq/QiLm1uoIIPm2x+D0yCs1nEXuMP7JBRUEUF4sXKk
	 vizR1x4WNmVQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 02/52] fs/ntfs3: Add ckeck in ni_update_parent()
Date: Sun, 29 Oct 2023 18:52:49 -0400
Message-ID: <20231029225441.789781-2-sashal@kernel.org>
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

[ Upstream commit 87d1888aa40f25773fa0b948bcb2545f97e2cb15 ]

Check simple case when parent inode equals current inode.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 16bd9faa2d28b..8f34d6472ddbd 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3208,6 +3208,12 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
 		if (!fname || !memcmp(&fname->dup, dup, sizeof(fname->dup)))
 			continue;
 
+		/* Check simple case when parent inode equals current inode. */
+		if (ino_get(&fname->home) == ni->vfs_inode.i_ino) {
+			ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
+			continue;
+		}
+
 		/* ntfs_iget5 may sleep. */
 		dir = ntfs_iget5(sb, &fname->home, NULL);
 		if (IS_ERR(dir)) {
-- 
2.42.0

