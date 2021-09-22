Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C343FC7
	for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 16:20:52 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 1DFEA1D1D;
	Wed, 22 Sep 2021 19:20:50 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632327650;
	bh=nzKgLZFLmGFZYS2r/7vIgqQggi3AOg3FFmnvTlnlJhc=;
	h=Date:Subject:From:To:References:CC:In-Reply-To;
	b=onjZzTDyL0/JYnwFmb6j5Igko0laCFI2LEcWix9BakDuq+PKLclBFcDszct9/ToUr
	 /5zltobvGc83nC/HBaLvz7qvAK5SDU562CchPRnkWratl0eFLad/thLgf6yE6Q+aW1
	 L/6CztogpUS7qTwQ03UdOvQF7zEghz0Y0bwLnXXM=
Received: from [192.168.211.195] (192.168.211.195) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 22 Sep 2021 19:20:49 +0300
Message-ID: <ed6426f4-a579-86ce-a54f-ac356991a797@paragon-software.com>
Date: Wed, 22 Sep 2021 19:20:49 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: [PATCH 5/5] fs/ntfs3: Refactoring lock in ntfs_init_acl
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
References: <2771ff62-e612-a8ed-4b93-5534c26aef9e@paragon-software.com>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
In-Reply-To: <2771ff62-e612-a8ed-4b93-5534c26aef9e@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.195]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

This is possible because of moving lock into ntfs_create_inode.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/xattr.c | 55 ++++++++++++------------------------------------
 1 file changed, 14 insertions(+), 41 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 59ec5e61a239..83bbee277e12 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -693,54 +693,27 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
 	struct posix_acl *default_acl, *acl;
 	int err;
 
-	/*
-	 * TODO: Refactoring lock.
-	 * ni_lock(dir) ... -> posix_acl_create(dir,...) -> ntfs_get_acl -> ni_lock(dir)
-	 */
-	inode->i_default_acl = NULL;
-
-	default_acl = ntfs_get_acl_ex(mnt_userns, dir, ACL_TYPE_DEFAULT, 1);
-
-	if (!default_acl || default_acl == ERR_PTR(-EOPNOTSUPP)) {
-		inode->i_mode &= ~current_umask();
-		err = 0;
-		goto out;
-	}
-
-	if (IS_ERR(default_acl)) {
-		err = PTR_ERR(default_acl);
-		goto out;
-	}
-
-	acl = default_acl;
-	err = __posix_acl_create(&acl, GFP_NOFS, &inode->i_mode);
-	if (err < 0)
-		goto out1;
-	if (!err) {
-		posix_acl_release(acl);
-		acl = NULL;
-	}
-
-	if (!S_ISDIR(inode->i_mode)) {
-		posix_acl_release(default_acl);
-		default_acl = NULL;
-	}
+	err = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
+	if (err)
+		return err;
 
-	if (default_acl)
+	if (default_acl) {
 		err = ntfs_set_acl_ex(mnt_userns, inode, default_acl,
 				      ACL_TYPE_DEFAULT, 1);
+		posix_acl_release(default_acl);
+	} else {
+		inode->i_default_acl = NULL;
+	}
 
 	if (!acl)
 		inode->i_acl = NULL;
-	else if (!err)
-		err = ntfs_set_acl_ex(mnt_userns, inode, acl, ACL_TYPE_ACCESS,
-				      1);
-
-	posix_acl_release(acl);
-out1:
-	posix_acl_release(default_acl);
+	else {
+		if (!err)
+			err = ntfs_set_acl_ex(mnt_userns, inode, acl,
+					      ACL_TYPE_ACCESS, 1);
+		posix_acl_release(acl);
+	}
 
-out:
 	return err;
 }
 #endif
-- 
2.33.0


