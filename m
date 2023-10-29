Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8D12E70
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqEA0TeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209BFC433BC;
	Sun, 29 Oct 2023 22:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620274;
	bh=K/mT4QuTUvVk9to52xcdg9lhEdRgAE0eHzTWjWvm/i4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bqEA0TeRQfSPHTNmYlExwNMRsNAOlWxsFgqY+W54cYIJfG7SqebzGzrK2nOKMdlzb
	 ts9vvIXJvgSw+NdlkUHoL9BceCKu6nvOelOaCJTJVyaipHOjPiGSCXmPJ50IOfBKDJ
	 eh61vjkG1ZLlBmg9qgwFdIu9MHw7OU3O3XtW81DyZt+iZZX/KfpymuJYHrXq9+lriA
	 N/Pk8Csr7dpU86OJPPUQ8B4Cw8mq/X2/ft+9OmaGU2spSwi0jNMFcjSaIz/EStCc5g
	 no1jTAqiXFAfGitN/1HOOZoUaOzqrvfrWVB/TUUdJSrApzfXqa5h+gJmKc4ra4kG6Q
	 4lJikKrFtEqhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 10/39] fs/ntfs3: Avoid possible memory leak
Date: Sun, 29 Oct 2023 18:56:42 -0400
Message-ID: <20231029225740.790936-10-sashal@kernel.org>
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
index 00faf41d8f97d..710cb5aa5a65b 100644
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

