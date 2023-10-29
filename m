Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11AB12E70
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROZn2zlK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B832AC433BD;
	Sun, 29 Oct 2023 22:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620270;
	bh=tbrn0vobqGBLRWpHyZ3h5Akng6s3kKHk/godsb/JcSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ROZn2zlKfZBg8ysx3WA91Oq86nK/foIkzh5QgpMdNkr/X9z+WjAntawrfEh0/uLNY
	 KstpBrN/CXIfvE2cRnf74UFhSfOspLoS9qIF24kiyCqO39fSW5pkCRPHKAutobJiz2
	 eAM/7qL4EPZRCpvEFsQh0Mh5EpU3YxmIi3DZsLZDvRa/wzVpQ1+d89E8eDkClDuAuC
	 lnV/7NVL2GQvk5yQ6SRVpv2aREA93ygBXy4Xzs1N2Mmrz4Q/YeFXf/48vQPw1bxxfS
	 yq3rq9XSoACC4DHwMgxF1D+ljgjJ/rJNm51fa4ORUTlJ6HSqb7eVpqzTaNfVl2sL6S
	 Ou1e9Dk0hOBWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 07/39] fs/ntfs3: Fix NULL pointer dereference on error in attr_allocate_frame()
Date: Sun, 29 Oct 2023 18:56:39 -0400
Message-ID: <20231029225740.790936-7-sashal@kernel.org>
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

[ Upstream commit 9c689c8dc86f8ca99bf91c05f24c8bab38fe7d5f ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/attrib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 63169529b52c4..2215179c925b3 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1658,10 +1658,8 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
 			le_b = NULL;
 			attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL,
 					      0, NULL, &mi_b);
-			if (!attr_b) {
-				err = -ENOENT;
-				goto out;
-			}
+			if (!attr_b)
+				return -ENOENT;
 
 			attr = attr_b;
 			le = le_b;
-- 
2.42.0

