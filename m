Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0E014F85
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agi1fNL+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F110C433C9;
	Sun, 29 Oct 2023 22:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620365;
	bh=pt3OFPe5XCJhIqZLC3h4VkJBZJFyvIu2/H5vJBzxskI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agi1fNL+U8/7Wsuf6JfvJTO6Tcu3xdqH/WdBLrOIa8sBc7DO0IiiMpyuMDbyGW5L1
	 Wz4WBZWsjckGvJwtVW5b2DEHrQauj3TUKmJ9jUzLOX2zVkSl5dPvUAExuv/taXNb0s
	 0LS0590DSL24Z8us4WtjGMwqfctb6+XZ7JuOykAMiabIHmKJlBnzxxYQYFpD+vsvpu
	 q1Jfdf/oEDI9HPG9poMyyu6vG2+JMFn24wodWYhLQ2d1Fl3NAe2AD4tNyDLewVRFk5
	 7/jRBuI7fAoLKRkRn27SHLzJDZjRgmda1Os+Db0t+MILBsclhq53jQSMLsdOnuGBD6
	 I44p5J7NwPMKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 06/28] fs/ntfs3: Fix possible NULL-ptr-deref in ni_readpage_cmpr()
Date: Sun, 29 Oct 2023 18:58:41 -0400
Message-ID: <20231029225916.791798-6-sashal@kernel.org>
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

[ Upstream commit 32e9212256b88f35466642f9c939bb40cfb2c2de ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 73a56d7ac84b7..b02778cbb1d34 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2100,7 +2100,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct page *page)
 
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
-		if (i == idx)
+		if (i == idx || !pg)
 			continue;
 		unlock_page(pg);
 		put_page(pg);
-- 
2.42.0

