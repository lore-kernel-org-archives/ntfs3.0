Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703A91426A
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceLwewGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0369C433B8;
	Sun, 29 Oct 2023 22:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620361;
	bh=Gjd94d2ss7HH/gGzEfkZRCCNTYNmLQtnhaouJ28zSao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ceLwewGXP57Kls5ftiKeRlSfsGMf3eL6agU1KN1s4+duhu95DFhYLBqlMFYSWK4H7
	 jDXf++P7g9ShZrUwJRM+Z9ULPIfSmlIsIu+CbNtB0DMSC1ocnJ4HA7uczge3w9Lk8H
	 fwvZj5JZPJ/8gYBrAOq2gWbpbOOZ6yGc9aOiOn8tdQljnYP7231Knc0mjofFG7wxAI
	 nTY30KD0NYFWSSnzXaXbWMYNkdHzIAU1d5ITmx1KFWKYE+1RFypy5qg77Rz52etc8w
	 35c1gwIwPxGkwLy1RurrJcd1TJBZdv+w9wu29SR2zBEGgXvNlgvDZaYgb20dLnyyW2
	 d6ET4luGUlYZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 02/28] fs/ntfs3: Add ckeck in ni_update_parent()
Date: Sun, 29 Oct 2023 18:58:37 -0400
Message-ID: <20231029225916.791798-2-sashal@kernel.org>
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

[ Upstream commit 87d1888aa40f25773fa0b948bcb2545f97e2cb15 ]

Check simple case when parent inode equals current inode.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 9a1744955d1cf..73a56d7ac84b7 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3144,6 +3144,12 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
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

