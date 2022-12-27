Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D658495
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC400C433F0;
	Tue, 27 Dec 2022 20:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173248;
	bh=IjhfH3J1WRtIaQ/yEXBvv4S9dLxKy2P2jmU/NjuRMZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KN02jh/fGof2hmtL/edcvjbElOTHjo3Pj6PYXhHldZYFAPcrSCVG+etcFmoYsdPcL
	 5ZfMHiBc3w5q9YMtTw6bS6/Nq24iD2ieel9shUgV3ILB6B3aMNp0W3qqEAi8NLfx0W
	 FcnTbP96yI5Q3x4am8/Hlrqzt7rU0NA1mZeptvSZ0NrPbMs+mCq8Rt+go2trei02t+
	 bsHEM5E9eVKiocNSK0kLk2vbt1SDQ/Nu1VhZ3WQWc4Fm9nNtpcFk7nrukImHvt6o/o
	 /AA7nRQYGw0bCYFLoXkNkGo8ZHCYDlHeVhq4vnPwPalJH1G/A4WWmyGXyv6Ncm89e8
	 FG7Je0pS7iVvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 17/27] fs/ntfs3: Delete duplicate condition in ntfs_read_mft()
Date: Tue, 27 Dec 2022 15:33:32 -0500
Message-Id: <20221227203342.1213918-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203342.1213918-1-sashal@kernel.org>
References: <20221227203342.1213918-1-sashal@kernel.org>
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
index ba2005c12ee3..471ea4d813ad 100644
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

