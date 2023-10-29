Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4BD14F85
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFFFiT80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04457C433B9;
	Sun, 29 Oct 2023 22:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620364;
	bh=oDYk3PAqthxQobNCFCETdOG2KpUFwa6d/m3xZ/ez1t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PFFFiT80pIdMPDPCHKvpmuk9z/4Se5zqSrXZBLNv+7gZtnWoShz5XIyHVbTmODc4e
	 0GQjzJkcSrkorrgpVKWwZujcT4tHEXyNpKDQaaqhHC9u/Rj2KQXjZK8EqaidUdc+eX
	 Vh2gdxMcWTFSCsyFk+RWLhkzBXAltr9CgKuc9cnzPNRrnDq434AFvWNwTq+MVS1CjF
	 BtBkOYJpKoCW2Zod4w+FZYtZ5J1YnN9y6H48x0FRbD2/DC6zt1bTmggqSR21QUwXIs
	 /wW9JfTyOqe5DKgLxxwWjClHAJKdC921xfDt/YTXDhHGmaqXHzvG9NBMaQFqe4pGb6
	 R95GAaMWvtoCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	syzbot+e94d98936a0ed08bde43@syzkaller.appspotmail.com,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 05/28] fs/ntfs3: fix deadlock in mark_as_free_ex
Date: Sun, 29 Oct 2023 18:58:40 -0400
Message-ID: <20231029225916.791798-5-sashal@kernel.org>
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

[ Upstream commit bfbe5b31caa74ab97f1784fe9ade5f45e0d3de91 ]

Reported-by: syzbot+e94d98936a0ed08bde43@syzkaller.appspotmail.com
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/fsntfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index e32a678861ffe..4413f6da68e60 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -2451,10 +2451,12 @@ void mark_as_free_ex(struct ntfs_sb_info *sbi, CLST lcn, CLST len, bool trim)
 {
 	CLST end, i;
 	struct wnd_bitmap *wnd = &sbi->used.bitmap;
+	bool dirty = false;
 
 	down_write_nested(&wnd->rw_lock, BITMAP_MUTEX_CLUSTERS);
 	if (!wnd_is_used(wnd, lcn, len)) {
-		ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
+		/* mark volume as dirty out of wnd->rw_lock */
+		dirty = true;
 
 		end = lcn + len;
 		len = 0;
@@ -2486,6 +2488,8 @@ void mark_as_free_ex(struct ntfs_sb_info *sbi, CLST lcn, CLST len, bool trim)
 
 out:
 	up_write(&wnd->rw_lock);
+	if (dirty)
+		ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
 }
 
 /*
-- 
2.42.0

