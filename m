Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7958E6FB7
	for <ntfs3@lists.linux.dev>; Mon, 16 Jan 2023 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OF0xfiZ2S/SF8gIlq2iqzM6YU/PabQiNCsv2X1aoxmg=; b=a9SMmT1N58/cMM5OJE6bzmwSJ1
	qTqmakFhtKy2odC0NIZdBGTJbOlqIcqHtcso6Xeohwt3BNHr1TWeJQeAtvBW1mS2k9aG0T3QSGDwn
	xd3w2CggnL5GeFkumWhSy2LGtaSDV9bPsqA7s2L4OeOEqvvRYBBg6IjqGnLkBOARaxFqPBKYR4AOT
	Y0vV8+deT+bjWgxdyz44DS8ONIQQGl9nQV8wR+SyuWIFyeNxJXz3bkKB5NCWhEZBROGtq6nY9gV5I
	qftHreuefo27TtpXqpxryS2+7ZKv0wL0s4pShSl+hBZxRVwqG38U1V2Bd5I1nUIbTnuI1mrewFg0/
	XXIcngOw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pHVvj-002EHl-2O;
	Mon, 16 Jan 2023 20:18:07 +0000
Date: Mon, 16 Jan 2023 20:18:07 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Peng Zhang <zhangpeng362@huawei.com>, kari.argillander@gmail.com,
	akpm@linux-foundation.org, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, sunnanyong@huawei.com,
	wangkefeng.wang@huawei.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH -next] fs/ntfs3: Fix potential NULL/IS_ERR bug in
 ntfs_lookup()
Message-ID: <Y8Ww/48pwi8RbTIv@ZenIV>
References: <20230112013248.2464556-1-zhangpeng362@huawei.com>
 <808288ae-bf1a-ccc6-ab37-d1b2022b44b5@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <808288ae-bf1a-ccc6-ab37-d1b2022b44b5@paragon-software.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Jan 13, 2023 at 02:05:56PM +0400, Konstantin Komarov wrote:

> Hello.
> 
> We have added a patch with this check just before the New Year. (here https://lore.kernel.org/lkml/ee705b24-865b-26ff-157d-4cb2a303a962@paragon-software.com/)

See upthread for the reasons why that's wrong.  Incidentally,
mixing logical change with a pile of whitespace changes is
bad idea - it's very easy for reviewers to miss...

Other observation from the cursory look through your namei.c:
ntfs_create_inode() has no reason to return inode; the reference
it creates goes into dentry.  Make it return int, the callers will
be happier.  While we are at it, use d_instantiate_new() instead
of d_instantiate() + unlock_new_inode() there.

Incidentally, control flow in there is harder to follow that it
needs to be:
	* everything that reaches out{3,4,5,6,7} is guaranteed
to have err != 0;
	* fallthrough into out2 is guaranteed to have err != 0;
direct branch to it - err == 0.
	* direct branch to out1 is guaranteed to have err != 0.

I would suggest something along the lines of the following (completely
untested) delta; the callers are clearly better off that way and
failure paths are separated from the success one - they didn't share
anywhere near enough to have it worth bothering.

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 51f9542de7b0..3ae4ad329b51 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1197,11 +1197,11 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
  * 
  * NOTE: if fnd != NULL (ntfs_atomic_open) then @dir is locked
  */
-struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
-				struct inode *dir, struct dentry *dentry,
-				const struct cpu_str *uni, umode_t mode,
-				dev_t dev, const char *symname, u32 size,
-				struct ntfs_fnd *fnd)
+int ntfs_create_inode(struct user_namespace *mnt_userns,
+			struct inode *dir, struct dentry *dentry,
+			const struct cpu_str *uni, umode_t mode,
+			dev_t dev, const char *symname, u32 size,
+			struct ntfs_fnd *fnd)
 {
 	int err;
 	struct super_block *sb = dir->i_sb;
@@ -1642,18 +1642,19 @@ struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
 			goto out7;
 	}
 
-	/*
-	 * Call 'd_instantiate' after inode->i_op is set
-	 * but before finish_open.
-	 */
-	d_instantiate(dentry, inode);
-
 	ntfs_save_wsl_perm(inode);
 	mark_inode_dirty(dir);
 	mark_inode_dirty(inode);
 
 	/* Normal exit. */
-	goto out2;
+	__putname(new_de);
+	kfree(rp);
+	/*
+	 * Call 'd_instantiate_new' after inode->i_op is set
+	 * but before finish_open.
+	 */
+	d_instantiate_new(dentry, inode);
+	return 0;
 
 out7:
 
@@ -1678,21 +1679,13 @@ struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
 	discard_new_inode(inode);
 out3:
 	ntfs_mark_rec_free(sbi, ino, false);
-
 out2:
 	__putname(new_de);
 	kfree(rp);
-
 out1:
-	if (err) {
-		if (!fnd)
-			ni_unlock(dir_ni);
-		return ERR_PTR(err);
-	}
-
-	unlock_new_inode(inode);
-
-	return inode;
+	if (!fnd)
+		ni_unlock(dir_ni);
+	return err;
 }
 
 int ntfs_link_inode(struct inode *inode, struct dentry *dentry)
diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index 53ddea219e37..f98d0252a785 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -107,12 +107,8 @@ static struct dentry *ntfs_lookup(struct inode *dir, struct dentry *dentry,
 static int ntfs_create(struct user_namespace *mnt_userns, struct inode *dir,
 		       struct dentry *dentry, umode_t mode, bool excl)
 {
-	struct inode *inode;
-
-	inode = ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFREG | mode,
+	return ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFREG | mode,
 				  0, NULL, 0, NULL);
-
-	return IS_ERR(inode) ? PTR_ERR(inode) : 0;
 }
 
 /*
@@ -123,12 +119,8 @@ static int ntfs_create(struct user_namespace *mnt_userns, struct inode *dir,
 static int ntfs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
 		      struct dentry *dentry, umode_t mode, dev_t rdev)
 {
-	struct inode *inode;
-
-	inode = ntfs_create_inode(mnt_userns, dir, dentry, NULL, mode, rdev,
+	return ntfs_create_inode(mnt_userns, dir, dentry, NULL, mode, rdev,
 				  NULL, 0, NULL);
-
-	return IS_ERR(inode) ? PTR_ERR(inode) : 0;
 }
 
 /*
@@ -196,13 +188,8 @@ static int ntfs_unlink(struct inode *dir, struct dentry *dentry)
 static int ntfs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 			struct dentry *dentry, const char *symname)
 {
-	u32 size = strlen(symname);
-	struct inode *inode;
-
-	inode = ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFLNK | 0777,
-				  0, symname, size, NULL);
-
-	return IS_ERR(inode) ? PTR_ERR(inode) : 0;
+	return ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFLNK | 0777,
+				  0, symname, strlen(symname), NULL);
 }
 
 /*
@@ -211,12 +198,8 @@ static int ntfs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 static int ntfs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 		      struct dentry *dentry, umode_t mode)
 {
-	struct inode *inode;
-
-	inode = ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFDIR | mode,
+	return ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFDIR | mode,
 				  0, NULL, 0, NULL);
-
-	return IS_ERR(inode) ? PTR_ERR(inode) : 0;
 }
 
 /*
@@ -358,7 +341,6 @@ static int ntfs_atomic_open(struct inode *dir, struct dentry *dentry,
 			    struct file *file, u32 flags, umode_t mode)
 {
 	int err;
-	struct inode *inode;
 	struct ntfs_fnd *fnd = NULL;
 	struct ntfs_inode *ni = ntfs_i(dir);
 	struct dentry *d = NULL;
@@ -431,10 +413,10 @@ static int ntfs_atomic_open(struct inode *dir, struct dentry *dentry,
 	 * Looks like ntfs_atomic_open must accept 'struct user_namespace *mnt_userns' as argument.
 	 */
 
-	inode = ntfs_create_inode(&init_user_ns, dir, dentry, uni, mode, 0,
+	err = ntfs_create_inode(&init_user_ns, dir, dentry, uni, mode, 0,
 				  NULL, 0, fnd);
-	err = IS_ERR(inode) ? PTR_ERR(inode)
-			    : finish_open(file, dentry, ntfs_file_open);
+	if (!err)
+		err = finish_open(file, dentry, ntfs_file_open);
 	dput(d);
 
 out2:
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 2050eb3f6a5a..cea0b8a3a38a 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -707,7 +707,7 @@ int ntfs_sync_inode(struct inode *inode);
 int ntfs_flush_inodes(struct super_block *sb, struct inode *i1,
 		      struct inode *i2);
 int inode_write_data(struct inode *inode, const void *data, size_t bytes);
-struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
+int ntfs_create_inode(struct user_namespace *mnt_userns,
 				struct inode *dir, struct dentry *dentry,
 				const struct cpu_str *uni, umode_t mode,
 				dev_t dev, const char *symname, u32 size,
