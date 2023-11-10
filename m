Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332E93B785
	for <ntfs3@lists.linux.dev>; Fri, 10 Nov 2023 20:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sBF5L2r2"
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 1Xf2r9Jy2UC9i1Xf2rWXK2; Fri, 10 Nov 2023 20:59:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1699646365;
	bh=JGFpthYiqaRPY244yP6qRl5S2GlMr+W8XYeFguG1JEM=;
	h=From:To:Cc:Subject:Date;
	b=sBF5L2r2secVj5RLVeh89KKXdDCnhOApxbEbYwQRDf1TWzlHI5fsZX1tRpwS+a6kp
	 5xMS5UHKIUUFVCAaOrMXVP0WhcOjgw3Cg5GN/aw6TAp3he1AFKRmtTx9+PaqL88KS2
	 AtSdDLpy/oNvAanGcvAsUDhwtbO2xHBd2+TUvVgan2wvtql3yedRnmJOecSTe5E5CD
	 mNFlN7ZtEZwIAF0Y4u41JNYiG2FYkgUhwbShqWsxKgt2sK1wB4yaPbwPB+sT+K1xwS
	 McmyOJEWVkT90BY25TYuubZpD4CeR2tn70bf4mVftWPCA7nnH5fgMZSbwjubRitrHI
	 bYXOVBY9pzKZQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 10 Nov 2023 20:59:25 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	ntfs3@lists.linux.dev
Subject: [PATCH] fs/ntfs3: Slightly simplify ntfs_inode_printk()
Date: Fri, 10 Nov 2023 20:59:22 +0100
Message-Id: <8c9196e6d3b4f5416183a498d3c9ebcf84f22ced.1699646339.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size passed to snprintf() includes the space for the trailing space.
So there is no reason here not to use all the available space.

So remove the -1 when computing 'name_len'.
While at it, use the size of the array directly instead of the intermediate
'name_len' variable.

snprintf() also guaranties that the buffer if NULL terminated, so there is
no need to write an additional trailing NULL "To be sure".

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ntfs3/super.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 9153dffde950..dcc8984a10a4 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -122,13 +122,12 @@ void ntfs_inode_printk(struct inode *inode, const char *fmt, ...)
 
 	if (name) {
 		struct dentry *de = d_find_alias(inode);
-		const u32 name_len = ARRAY_SIZE(s_name_buf) - 1;
 
 		if (de) {
 			spin_lock(&de->d_lock);
-			snprintf(name, name_len, " \"%s\"", de->d_name.name);
+			snprintf(name, sizeof(s_name_buf), " \"%s\"",
+				 de->d_name.name);
 			spin_unlock(&de->d_lock);
-			name[name_len] = 0; /* To be sure. */
 		} else {
 			name[0] = 0;
 		}
-- 
2.34.1

