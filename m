Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E01619926
	for <ntfs3@lists.linux.dev>; Tue,  9 May 2023 21:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42B0C433A8;
	Tue,  9 May 2023 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683667207;
	bh=vOnm0VFDx6huUZMeiw26JbXYZTo0TG8euLcvo1YuJZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iODz1hbwiOL5Tr0WK2lLabpKW0UwSPUY7L4B0OVNMC4bJwzvszybq3Y4yH2ROa724
	 6sJwtmjdd+0AiWxxMWMjWUwjMJzqYCVMRZW1J65He4FsnEK00h6G2LZc0rd8Bw8cqc
	 m/4Xpxyyy5Pt3C/pPTXQ3D/pPlk7a3P+uov0tuBpvC2FdD9a/0VEUPQUlXM+yRHxm4
	 8bpfXQFBPXvHvR/bQ2hPDpeM+sJqAgxIhzpg4V4QK3RV00DkEX0+7aca2RMKOQjGVQ
	 0C/Lz5IaedWOQ87CDNI6VdCKZJ+BFqbBzOjjnKMW3a5e1CGN244+qYxSEVAQHII16W
	 4EIALWTdHwxhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>,
	TOTE Robot <oslab@tsinghua.edu.cn>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.2 09/18] fs/ntfs3: Fix a possible null-pointer dereference in ni_clear()
Date: Tue,  9 May 2023 17:19:47 -0400
Message-Id: <20230509211958.21596-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509211958.21596-1-sashal@kernel.org>
References: <20230509211958.21596-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jia-Ju Bai <baijiaju1990@gmail.com>

[ Upstream commit ec275bf9693d19cc0fdce8436f4c425ced86f6e7 ]

In a previous commit c1006bd13146, ni->mi.mrec in ni_write_inode()
could be NULL, and thus a NULL check is added for this variable.

However, in the same call stack, ni->mi.mrec can be also dereferenced
in ni_clear():

ntfs_evict_inode(inode)
  ni_write_inode(inode, ...)
    ni = ntfs_i(inode);
    is_rec_inuse(ni->mi.mrec) -> Add a NULL check by previous commit
  ni_clear(ntfs_i(inode))
    is_rec_inuse(ni->mi.mrec) -> No check

Thus, a possible null-pointer dereference may exist in ni_clear().
To fix it, a NULL check is added in this function.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 912eeb3d34717..9f3c4f6a2a343 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -102,7 +102,7 @@ void ni_clear(struct ntfs_inode *ni)
 {
 	struct rb_node *node;
 
-	if (!ni->vfs_inode.i_nlink && is_rec_inuse(ni->mi.mrec))
+	if (!ni->vfs_inode.i_nlink && ni->mi.mrec && is_rec_inuse(ni->mi.mrec))
 		ni_delete_all(ni);
 
 	al_destroy(ni);
-- 
2.39.2

