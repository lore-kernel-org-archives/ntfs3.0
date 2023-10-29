Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7301CC2DF
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTiUQRAx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65270C433D9;
	Sun, 29 Oct 2023 22:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620265;
	bh=jAHUril8lBS0BRD6a5/QOtzXJLQsnqbARQUT4v575to=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HTiUQRAxiIUAoGVjii4C5OhyuxhLdNtGTXtZfi9ekGSFlnJRvGou5XWEqc2ZNBbFc
	 xbaBcxiPp5DHy6USEryhLmFeMup9twRvSTLf3fS4zmHhq0bOzD16LphT5oNF3+ntwm
	 Ani2VmvO/E1dFa8SMxmRCf0+elRZnEEO7vkV61ea9/E4jFr+1ryMTOJ75FwntjZYSD
	 4F9kGH+En+vMmJb4BM09LQfOp/Om5pRE7WAK5QwCv/aaBoZ15SF7rJ4lJi9npe8Ikr
	 MJg3fbNkw/hTgJWcnixsqfwRe5nn6y5yPD/Lt80mMnVHU7x+veS+tTOaoAMbi2j5hs
	 vT9ZIcpAKnh7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 02/39] fs/ntfs3: Add ckeck in ni_update_parent()
Date: Sun, 29 Oct 2023 18:56:34 -0400
Message-ID: <20231029225740.790936-2-sashal@kernel.org>
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

[ Upstream commit 87d1888aa40f25773fa0b948bcb2545f97e2cb15 ]

Check simple case when parent inode equals current inode.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index dda13e1f1b330..166c3c49530ec 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3198,6 +3198,12 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
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

