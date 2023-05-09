Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFAB14AB9
	for <ntfs3@lists.linux.dev>; Tue,  9 May 2023 21:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE19C4331F;
	Tue,  9 May 2023 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683667205;
	bh=BP3OLBE5mP9F2Tv3wjhBdu4qIMZy7h6rrkt2NWbrCL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OTseNe27LXGzo8VaRKEIxfL/Ujc8lG6+vWNFB4g1k1IP23J1IM7HpF1MTKRuxkkyA
	 r3PgbFsbH5XI/2hxIFt7H567A2IxGsoZtIDVv3Hvv+2HKJj1pqtwyfs3VIhmoQKfGT
	 ofNiO5NcLmzjJwVGvidBgOE4xI3IN564jylOSAaQoVaDwyrriu0/ClBXp+ClrQUCLg
	 4RtFVjKZsYOQJ63+1C6rpr1krRLhsdO0AY3nydJT5ZHk1GjHwPoQ6oFzTL/8hXbw7w
	 KkvDtb5JniXRaeh3vuZ6CYrwrNMDngah5yxoIL4qXWtGPm/mVLZWg3LTy3gnOucYla
	 gAR1reonqWpGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.2 06/18] fs/ntfs3: Fix NULL dereference in ni_write_inode
Date: Tue,  9 May 2023 17:19:44 -0400
Message-Id: <20230509211958.21596-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509211958.21596-1-sashal@kernel.org>
References: <20230509211958.21596-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Abdun Nihaal <abdun.nihaal@gmail.com>

[ Upstream commit 8dae4f6341e335a09575be60b4fdf697c732a470 ]

Syzbot reports a NULL dereference in ni_write_inode.
When creating a new inode, if allocation fails in mi_init function
(called in mi_format_new function), mi->mrec is set to NULL.
In the error path of this inode creation, mi->mrec is later
dereferenced in ni_write_inode.

Add a NULL check to prevent NULL dereference.

Link: https://syzkaller.appspot.com/bug?extid=f45957555ed4a808cc7a
Reported-and-tested-by: syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index f1df52dfab74b..912eeb3d34717 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3258,6 +3258,9 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		return 0;
 	}
 
+	if (!ni->mi.mrec)
+		goto out;
+
 	if (is_rec_inuse(ni->mi.mrec) &&
 	    !(sbi->flags & NTFS_FLAGS_LOG_REPLAYING) && inode->i_nlink) {
 		bool modified = false;
-- 
2.39.2

