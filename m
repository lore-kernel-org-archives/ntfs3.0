Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B86620
	for <ntfs3@lists.linux.dev>; Wed,  5 Jul 2023 19:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E482BC433C7;
	Wed,  5 Jul 2023 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688583806;
	bh=TY45/qxVQy5GwD4MUK0nAW9hU9YuqFqdo4bjfCKVLWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q5YkT3oKssEYp1IZYAITd8OOV6yhElw19ZJxTOnXqApHyge3ImKYjoVO8TWQXVC7K
	 c7wz+wwOGez5xi0rfzV5yW9ruvCLO1a86FBTYITX2YVrOGLZnpoH0TkpQ7YurobODP
	 bMTyuKQVK1s0qZw7kBgqW4Msb5FnjM3IQp+IISwpBukKE2R6WN4zMwumL77K6gCc72
	 UvPHm3P6xYVpn7jS6rRwjHfbkX0oXETbH8Gliu+IZOO0lfvgkjFwDnJ9CoijLClhlW
	 ecPkniQJCMr8yRDa5h8zbn2zqJzqzmHC+AezI9URr1qmySlFInP+u9RjTSrQE5jBun
	 I4KkezId9Jn6A==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: [PATCH v2 13/92] ntfs3: convert to simple_rename_timestamp
Date: Wed,  5 Jul 2023 15:00:38 -0400
Message-ID: <20230705190309.579783-11-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705190309.579783-1-jlayton@kernel.org>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A rename potentially involves updating 4 different inode timestamps.
Convert to the new simple_rename_timestamp helper function.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ntfs3/namei.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index 70f8c859e0ad..bfd986699f9e 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -324,14 +324,11 @@ static int ntfs_rename(struct mnt_idmap *idmap, struct inode *dir,
 		/* Restore after failed rename failed too. */
 		_ntfs_bad_inode(inode);
 	} else if (!err) {
-		inode->i_ctime = dir->i_ctime = dir->i_mtime =
-			current_time(dir);
+		simple_rename_timestamp(dir, dentry, new_dir, new_dentry);
 		mark_inode_dirty(inode);
 		mark_inode_dirty(dir);
-		if (dir != new_dir) {
-			new_dir->i_mtime = new_dir->i_ctime = dir->i_ctime;
+		if (dir != new_dir)
 			mark_inode_dirty(new_dir);
-		}
 
 		if (IS_DIRSYNC(dir))
 			ntfs_sync_inode(dir);
-- 
2.41.0

