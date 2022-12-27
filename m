Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32DA6ADB
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D693BC433D2;
	Tue, 27 Dec 2022 20:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173195;
	bh=rI6R7y2PesWCHbqBzXxTOdib5qkgoi3AQAfKoyr5yAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MyU192SqBZQROmTOotx+wxwmXKPg1zXhdvC5xVOnLBPi6fVyH+iTGLILEVyLHLA1Q
	 rUSuLIzbCx+H3khNsBAtKtb0QFKMp/WrF3TbpwcZYX8KlRKtSDv+wWzuBrtEINuHzr
	 td6gkbP4t3ms4PO4Eak6Lgo3q02eJQDZbcrWl4uLugMswje+wtPtswcxHwRXFwSZag
	 ZindyXkhaEYJErLhqUe+8dm0Eh4672IP2sKKByMnKkKwuqpoPDbEaXCDD7wUzVAk4F
	 TwqTL7dUWQ3G+ZA8CocVSSOwopNDk8+npZrLYxrMXx2rjhig38a+BsmKM8T5qr6g/J
	 obdMwFU0Ac3bg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzot <syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 16/28] fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_fill_super()
Date: Tue, 27 Dec 2022 15:32:37 -0500
Message-Id: <20221227203249.1213526-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203249.1213526-1-sashal@kernel.org>
References: <20221227203249.1213526-1-sashal@kernel.org>
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

