Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636548494
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87736C433D2;
	Tue, 27 Dec 2022 20:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173247;
	bh=rI6R7y2PesWCHbqBzXxTOdib5qkgoi3AQAfKoyr5yAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsdNZ/A2jdwUWyjCwps3e5KXGtQGrmDleG2pCjYSRRx40h4gJRr8caCDWqgBMbv+X
	 vOonvpGM/Y5lwGBPAHGitGWpntJl7RH5pMe25zPbztgHLtsDuAtstHCrFAXp+euLTG
	 3cVc/zHXw66nHl1nyC9OEcw6CCua8AmmZb9eXSx0Iu34Nlb+F6y0Y3qJDs3iX4+rKi
	 jSEwS2dbRuEV61Wz3mpxhbfjGkeQk380df+xEdO4eOOXUrK3DZCdYr69ZKtNzsR2Fr
	 mGWH4JS68JFrT9k4z74RU0C3HvFZcs25QQlimyt7somyMftUVAzF1DGRxJNg62vbsf
	 dQZrO5k2o4C5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzot <syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 16/27] fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_fill_super()
Date: Tue, 27 Dec 2022 15:33:31 -0500
Message-Id: <20221227203342.1213918-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203342.1213918-1-sashal@kernel.org>
References: <20221227203342.1213918-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

[ Upstream commit 59bfd7a483da36bd202532a3d9ea1f14f3bf3aaf ]

syzbot is reporting too large allocation at ntfs_fill_super() [1], for a
crafted filesystem can contain bogus inode->i_size. Add __GFP_NOWARN in
order to avoid too large allocation warning, than exhausting memory by
using kvmalloc().

Link: https://syzkaller.appspot.com/bug?extid=33f3faaa0c08744f7d40 [1]
Reported-by: syzot <syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 0c8dd4ff5d7a..bc6a41d254ba 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1141,7 +1141,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto put_inode_out;
 	}
 	bytes = inode->i_size;
-	sbi->def_table = t = kmalloc(bytes, GFP_NOFS);
+	sbi->def_table = t = kmalloc(bytes, GFP_NOFS | __GFP_NOWARN);
 	if (!t) {
 		err = -ENOMEM;
 		goto put_inode_out;
-- 
2.35.1

