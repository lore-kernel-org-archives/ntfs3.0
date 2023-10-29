Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C6C14F62
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rImgzZsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D21BC116B3;
	Sun, 29 Oct 2023 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620370;
	bh=z7g4cy8EIdaCJBFUX3nJN6oUmWd2wWoU40jn8ZriTjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rImgzZsYFPfIA6LpxioIAoK793k0BoZAO2wW4JtEnQa5blguOPfUi0Hx9WlPqJIlD
	 0g4KDJbSKH+VGzVV8omUfz32+ywskfpbhVkEd1py6jrM1gQ6nFGB+OTIu+d4U7XbTE
	 q7AxEsf4mKkkHmy4lWfqJqc+eMc3kTOxqzLZC5s++dfOBzJDm4j2lAb3hW3s+e9C5j
	 +r+03kOPUfa9qUfIkPhZLAQ8a9zwFKPZZiyA7MDkMdPrZeNVcpBQlB8qLrk1WnrR6W
	 CgJcP/Om/Ve0xQ0jNXxy0PYaIwnZPvFoIKllS3Odio6lW9FNIYyYXg+I1BxT9vvwj5
	 Aexdgy3tVkIhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 10/28] fs/ntfs3: Avoid possible memory leak
Date: Sun, 29 Oct 2023 18:58:45 -0400
Message-ID: <20231029225916.791798-10-sashal@kernel.org>
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

From: Su Hui <suhui@nfschina.com>

[ Upstream commit e4494770a5cad3c9d1d2a65ed15d07656c0d9b82 ]

smatch warn:
fs/ntfs3/fslog.c:2172 last_log_lsn() warn: possible memory leak of 'page_bufs'
Jump to label 'out' to free 'page_bufs' and is more consistent with
other code.

Signed-off-by: Su Hui <suhui@nfschina.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/fslog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 59f813cbdaa8e..8b95c06e5a4c5 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2169,8 +2169,10 @@ static int last_log_lsn(struct ntfs_log *log)
 
 			if (!page) {
 				page = kmalloc(log->page_size, GFP_NOFS);
-				if (!page)
-					return -ENOMEM;
+				if (!page) {
+					err = -ENOMEM;
+					goto out;
+				}
 			}
 
 			/*
-- 
2.42.0

