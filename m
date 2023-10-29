Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07112E51
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftYWzWF5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FE1C433C7;
	Sun, 29 Oct 2023 22:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620099;
	bh=3ecTuxaFxXd+4WzH7yZUfyWhqhdE2zoYnEaqwcm2F1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftYWzWF5NlFV5fa/Hii9tnMigbGoXy2nl3p9xaX0MNuxgGhDXt9fVRtyf9UzO17mT
	 olwFHYtw+eujgLigw40G5lBA9qEstS0RAAGrYbMpXPSv4mkJJETf7oVmZO/7TqMZpI
	 HvQFLxqeLOddUp+aPeG6pshpkjwS8QE9UYQoOLbdQgIyN1x3XmqMpfQe61KTyn2RlI
	 P8RlNZmUEIWACjJ5FAfxjNZoQw7CE8yqUzHkFlQKrQ7vGQK8CrNUwF1h/RYtjse647
	 RoKdXUWYN2d2/EWZAt1/v3bUDqaBDkCxMDwWCT9a6WQp00/baqvw+gpXNwn5Zmb/8U
	 BmxzRlUB2jKXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 11/52] fs/ntfs3: Fix possible NULL-ptr-deref in ni_readpage_cmpr()
Date: Sun, 29 Oct 2023 18:52:58 -0400
Message-ID: <20231029225441.789781-11-sashal@kernel.org>
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

[ Upstream commit 32e9212256b88f35466642f9c939bb40cfb2c2de ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 8f34d6472ddbd..05fb3dbe39076 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2148,7 +2148,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct page *page)
 
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
-		if (i == idx)
+		if (i == idx || !pg)
 			continue;
 		unlock_page(pg);
 		put_page(pg);
-- 
2.42.0

