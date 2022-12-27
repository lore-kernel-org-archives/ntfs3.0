Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B763B6ADF
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E66C43396;
	Tue, 27 Dec 2022 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173196;
	bh=5coy2AkHf0gVJ0ubfvUi/qaEtWUDktNUB6z9Ia7EXUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oHhYKfyXho5RGtn/dktcOESSCsYCDSZN4eAjqZgb6F4gfBISxDhPxc3EBCtciDNjQ
	 dX3Dp1R2HxE9e2PuWToH6c7J/XPGl+Q06qZQp7noNEdNDxhkG+qR8SurwcSzp3qlrh
	 KTQzLFacsc7DoYkvXGlOsPrnBs6thXS15TFbnLhrDqzwUCHzo8ujEEb12MUJKhWR83
	 jxpMe/u1RvrjhEZTiAmsz3n/pKO9p97kjFwRcKmlQ7wrOqxxblbPzNayN935uhpFFF
	 tZmLoFIeoGDmmHiTxLTt6xFwcoHWD0sUJiRWgR9z4WxS8aXeuzZk2dRcSYGVdm/9GO
	 AGFXrNO8Bp6AQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 17/28] fs/ntfs3: Delete duplicate condition in ntfs_read_mft()
Date: Tue, 27 Dec 2022 15:32:38 -0500
Message-Id: <20221227203249.1213526-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203249.1213526-1-sashal@kernel.org>
References: <20221227203249.1213526-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 658015167a8432b88f5d032e9d85d8fd50e5bf2c ]

There were two patches which addressed the same bug and added the same
condition:

commit 6db620863f85 ("fs/ntfs3: Validate data run offset")
commit 887bfc546097 ("fs/ntfs3: Fix slab-out-of-bounds read in run_unpack")

Delete one condition.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/inode.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index d98d047c778c..e352aa37330c 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -374,12 +374,6 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 
 	t64 = le64_to_cpu(attr->nres.svcn);
 
-	/* offset to packed runs is out-of-bounds */
-	if (roff > asize) {
-		err = -EINVAL;
-		goto out;
-	}
-
 	err = run_unpack_ex(run, sbi, ino, t64, le64_to_cpu(attr->nres.evcn),
 			    t64, Add2Ptr(attr, roff), asize - roff);
 	if (err < 0)
-- 
2.35.1

