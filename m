Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721E412E7A
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbgBNm+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40C8C433BB;
	Sun, 29 Oct 2023 22:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620269;
	bh=/hoZrSFkrFBTJcCRbT2QPw/OfnnvF91P8+vYphp+inI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GbgBNm+BisdRej34qGSfghRm81bAUho/yXHr8b4WPrWNzr1Grms8cJrJU2i+/OgqE
	 wMoEd1fxypXUGKE015h9HObEBGsy3Nc0DvQHLY9MB78X5f6KzECl84UO+4s34Vzkyo
	 qcMTebxMfMD5rsgLkwoEZpWZNahGohhku1dgYtbmDKm/J1HWELct0rLNID48chPeZa
	 CDsnI5DcZETPc90pPpHKlkCnY4BBbsKjYFabZ3RAlLCcwXNSZPYU1aWp+4v0CIMRl0
	 HzJU8/5UKdQ5Hw0DpYfncf1Jg19sczu4zOjrpprCzek7NJHIXKHotYB/n8j3H3AyIH
	 D6Lr+AySYNvLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 06/39] fs/ntfs3: Fix possible NULL-ptr-deref in ni_readpage_cmpr()
Date: Sun, 29 Oct 2023 18:56:38 -0400
Message-ID: <20231029225740.790936-6-sashal@kernel.org>
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

[ Upstream commit 32e9212256b88f35466642f9c939bb40cfb2c2de ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 166c3c49530ec..bb7e33c240737 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2149,7 +2149,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct page *page)
 
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
-		if (i == idx)
+		if (i == idx || !pg)
 			continue;
 		unlock_page(pg);
 		put_page(pg);
-- 
2.42.0

