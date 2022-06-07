Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9507F
	for <ntfs3@lists.linux.dev>; Tue,  7 Jun 2022 17:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333ABC34115;
	Tue,  7 Jun 2022 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654624698;
	bh=h9I8z9yfCsj9WKik3+U8sz5LvflAmBBSL/fxUrdruoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uz7tkK3AjxgxK/ZhgzaWejkr6VgtcxExCxy8mhWG85J2x24km9HyQUjeWORfkSAxw
	 TrDT7BxRykQdYeJN0Js7AS/lxpbSeRCXozMc+UfnorziV6iVfjK4FDaiM3/fJCwn/a
	 v5fImAuJ6pa8QpuLzRpimvg2c7R/SyFRM2GZgvSfYop2k+QBCU+aP+pRo9k/94VfO2
	 qS40Mkft1fH+3cuDQYrI/AeDt3kKlUBtPiqFqNYGhnMTfJiMTcTYjT1tV8VLC4aFP2
	 Fw3dYWc6xpcjXzGVjRWxcun4t3kXiy0hyT3cmcJDc6CbtDbnoOY7o3VXKd38yEpmJu
	 sA5++ouRKsHLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Gerald Lee <sundaywind2004@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 47/51] fs/ntfs3: Fix invalid free in log_replay
Date: Tue,  7 Jun 2022 13:55:46 -0400
Message-Id: <20220607175552.479948-47-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175552.479948-1-sashal@kernel.org>
References: <20220607175552.479948-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Namjae Jeon <linkinjeon@kernel.org>

[ Upstream commit f26967b9f7a830e228bb13fb41bd516ddd9d789d ]

log_read_rst() returns ENOMEM error when there is not enough memory.
In this case, if info is returned without initialization,
it attempts to kfree the uninitialized info->r_page pointer. This patch
moves the memset initialization code to before log_read_rst() is called.

Reported-by: Gerald Lee <sundaywind2004@gmail.com>
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/fslog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 06492f088d60..fc36c53b865a 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -1185,8 +1185,6 @@ static int log_read_rst(struct ntfs_log *log, u32 l_size, bool first,
 	if (!r_page)
 		return -ENOMEM;
 
-	memset(info, 0, sizeof(struct restart_info));
-
 	/* Determine which restart area we are looking for. */
 	if (first) {
 		vbo = 0;
@@ -3791,10 +3789,11 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	if (!log)
 		return -ENOMEM;
 
+	memset(&rst_info, 0, sizeof(struct restart_info));
+
 	log->ni = ni;
 	log->l_size = l_size;
 	log->one_page_buf = kmalloc(page_size, GFP_NOFS);
-
 	if (!log->one_page_buf) {
 		err = -ENOMEM;
 		goto out;
@@ -3842,6 +3841,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	if (rst_info.vbo)
 		goto check_restart_area;
 
+	memset(&rst_info2, 0, sizeof(struct restart_info));
 	err = log_read_rst(log, l_size, false, &rst_info2);
 
 	/* Determine which restart area to use. */
-- 
2.35.1

