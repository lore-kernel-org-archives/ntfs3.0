Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E404B14F62
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJt9aIom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FA5C41679;
	Sun, 29 Oct 2023 22:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620366;
	bh=WU0J97Fdli6EBxzCO48flt+kntH/ojIaUPc/tSonE2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJt9aIom7YQQFHGC5zZKFQ1iMtAzKGh6YjjkIVznO99I0nXvec45M+bmSMayeZCwx
	 lChEct2QVj4j4p25DdVJHrLQMAPvm1nHWmEbLAf+V445LXAotpRBDm0bSPclizkNis
	 bBaXPwGR1Y4fixRhyzdn077OMtDZSAoEUea1NQK3rJXL1EDHeLZiJ8P0rTsgqgjXfz
	 EZkBAZKem1f5xtMLhTDmSeSKST5J37ovJN6TLSyzN4XL21nTZzYD8aAycCoF3HdzWL
	 q1ZB71jlwhHy3Gn4iGhTknO/F76Uc/HTKCVdcoC08yNWdQkyy3RI7KxBDeCboP03+V
	 OqhFiwsHsDY7Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 07/28] fs/ntfs3: Fix NULL pointer dereference on error in attr_allocate_frame()
Date: Sun, 29 Oct 2023 18:58:42 -0400
Message-ID: <20231029225916.791798-7-sashal@kernel.org>
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

[ Upstream commit 9c689c8dc86f8ca99bf91c05f24c8bab38fe7d5f ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/attrib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 321d55b3ca17d..1d5ac2164d94f 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1583,10 +1583,8 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
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

