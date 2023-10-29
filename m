Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6727BC2DF
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0/aT/iJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93786C433B8;
	Sun, 29 Oct 2023 22:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620268;
	bh=flMynxBOlvcAvl2dtixiORz6/+bk9Trbkz1X6lpFP78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0/aT/iJ1XOp4bgdyOFE8vw2l28jKiOB3NrjOFTKxW94nsvnTmEbtwKLqSdkltu6D
	 Ek0bn9fDGqmy7vNcOTw03O4Yfy+QvY63ZHvWYSvQGEaUdVkRk3UQPQKGdJFapcdWid
	 DZqvbtMUU27EvyJLVw0fpc8+YyaGgyQdJ0s97mOtjjUGld7JDy/EXd8Xkr2suOkRlr
	 1fKtnGDvODUxM7Hygr0A6/1IHLm4eTbrqwJo2YsiOf0zI0Ik7joptMQ3AJSBS230Q8
	 96SRmTRJkN0cR3icry08ecL4vwK+7uOQHwP0Ikd9zxP8bJEW/X9kv5Cep6vCqqO3Oz
	 vPAHpOKu8zlBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	syzbot+e94d98936a0ed08bde43@syzkaller.appspotmail.com,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 05/39] fs/ntfs3: fix deadlock in mark_as_free_ex
Date: Sun, 29 Oct 2023 18:56:37 -0400
Message-ID: <20231029225740.790936-5-sashal@kernel.org>
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

[ Upstream commit bfbe5b31caa74ab97f1784fe9ade5f45e0d3de91 ]

Reported-by: syzbot+e94d98936a0ed08bde43@syzkaller.appspotmail.com
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/fsntfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 4b79232aeb59b..873b1434a9989 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -2421,10 +2421,12 @@ void mark_as_free_ex(struct ntfs_sb_info *sbi, CLST lcn, CLST len, bool trim)
 {
 	CLST end, i, zone_len, zlen;
 	struct wnd_bitmap *wnd = &sbi->used.bitmap;
+	bool dirty = false;
 
 	down_write_nested(&wnd->rw_lock, BITMAP_MUTEX_CLUSTERS);
 	if (!wnd_is_used(wnd, lcn, len)) {
-		ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
+		/* mark volume as dirty out of wnd->rw_lock */
+		dirty = true;
 
 		end = lcn + len;
 		len = 0;
@@ -2478,6 +2480,8 @@ void mark_as_free_ex(struct ntfs_sb_info *sbi, CLST lcn, CLST len, bool trim)
 
 out:
 	up_write(&wnd->rw_lock);
+	if (dirty)
+		ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
 }
 
 /*
-- 
2.42.0

