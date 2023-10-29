Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE05C12E51
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2rGCCz2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B6AC433C9;
	Sun, 29 Oct 2023 22:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620100;
	bh=AKxOtT3QqFrG69RF7cmdei0Apow5y+b6LogocDbTJdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E2rGCCz2moVjbFZmJ+3sJPL1IS4AZ66umW1defuubCvOrWoKWk1fgUk2T5gvxRIM/
	 sU87LgxPU7/gnCesgAzoKa0zJhjxjDLL5XhTeNbG/L0oPYzylA7AOTmhWW9ZbF7LH1
	 jZdxoj3UKd6wGQu55CqQJzsTbg7X7QtvNnR2+9APpUepu65oSk05xKA9GJNFJBHCnd
	 reyik3BoBqi46x6chQP0ReHDN4ut+15OX9n61QG9OaUAitXuFMCyrLMhd8hDKmWXXj
	 Wp3HvdW7uxxZZJxLqdbhInEpUXkLIAB/ENL7XDi8uAEVgvatt8yeKyXOEzGCgOB4Ye
	 8JyFSpPymDv0Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 12/52] fs/ntfs3: Fix NULL pointer dereference on error in attr_allocate_frame()
Date: Sun, 29 Oct 2023 18:52:59 -0400
Message-ID: <20231029225441.789781-12-sashal@kernel.org>
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

[ Upstream commit 9c689c8dc86f8ca99bf91c05f24c8bab38fe7d5f ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/attrib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index a9d82bbb4729e..0b52bc9681085 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1736,10 +1736,8 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
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

