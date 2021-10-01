Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02622F80
	for <ntfs3@lists.linux.dev>; Fri,  1 Oct 2021 16:02:14 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 446A782280;
	Fri,  1 Oct 2021 19:02:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1633104133;
	bh=aEdd+7SJXNGYXsfP8rxmvKaY2CfuJOEXmN9SILRmG5M=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=RJLB2QdJTgvJbuvIO9/Es50YfzbyoyyzkjjqrhdGPTyShvz0rrdw1vAPOnqP8A8Bz
	 K/HbcUcZAkyyEBjwGTgGdWMv2xpmGi781FWJ1OlZdlg4WNgMGkczDiK3hZw3NLSSBF
	 GV6mtYIU8Ys20B2fbZyI2h21/C8A3UpO0VNtrKTA=
Received: from [192.168.211.98] (192.168.211.98) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 1 Oct 2021 19:02:12 +0300
Message-ID: <2ce78ab6-453d-d7bf-9969-eb47b7347098@paragon-software.com>
Date: Fri, 1 Oct 2021 19:02:12 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: [PATCH 1/2] fs/ntfs3: Remove unnecessary functions
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <992eee8f-bed8-4019-a966-1988bd4dd5de@paragon-software.com>
In-Reply-To: <992eee8f-bed8-4019-a966-1988bd4dd5de@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.98]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

We don't need ntfs_xattr_get_acl and ntfs_xattr_set_acl.
There are ntfs_get_acl_ex and ntfs_set_acl_ex.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/xattr.c | 94 ------------------------------------------------
 1 file changed, 94 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 83bbee277e12..111355692163 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -621,67 +621,6 @@ int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
 	return ntfs_set_acl_ex(mnt_userns, inode, acl, type, 0);
 }
 
-static int ntfs_xattr_get_acl(struct user_namespace *mnt_userns,
-			      struct inode *inode, int type, void *buffer,
-			      size_t size)
-{
-	struct posix_acl *acl;
-	int err;
-
-	if (!(inode->i_sb->s_flags & SB_POSIXACL)) {
-		ntfs_inode_warn(inode, "add mount option \"acl\" to use acl");
-		return -EOPNOTSUPP;
-	}
-
-	acl = ntfs_get_acl(inode, type);
-	if (IS_ERR(acl))
-		return PTR_ERR(acl);
-
-	if (!acl)
-		return -ENODATA;
-
-	err = posix_acl_to_xattr(mnt_userns, acl, buffer, size);
-	ntfs_posix_acl_release(acl);
-
-	return err;
-}
-
-static int ntfs_xattr_set_acl(struct user_namespace *mnt_userns,
-			      struct inode *inode, int type, const void *value,
-			      size_t size)
-{
-	struct posix_acl *acl;
-	int err;
-
-	if (!(inode->i_sb->s_flags & SB_POSIXACL)) {
-		ntfs_inode_warn(inode, "add mount option \"acl\" to use acl");
-		return -EOPNOTSUPP;
-	}
-
-	if (!inode_owner_or_capable(mnt_userns, inode))
-		return -EPERM;
-
-	if (!value) {
-		acl = NULL;
-	} else {
-		acl = posix_acl_from_xattr(mnt_userns, value, size);
-		if (IS_ERR(acl))
-			return PTR_ERR(acl);
-
-		if (acl) {
-			err = posix_acl_valid(mnt_userns, acl);
-			if (err)
-				goto release_and_out;
-		}
-	}
-
-	err = ntfs_set_acl(mnt_userns, inode, acl, type);
-
-release_and_out:
-	ntfs_posix_acl_release(acl);
-	return err;
-}
-
 /*
  * ntfs_init_acl - Initialize the ACLs of a new inode.
  *
@@ -848,23 +787,6 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 		goto out;
 	}
 
-#ifdef CONFIG_NTFS3_FS_POSIX_ACL
-	if ((name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1 &&
-	     !memcmp(name, XATTR_NAME_POSIX_ACL_ACCESS,
-		     sizeof(XATTR_NAME_POSIX_ACL_ACCESS))) ||
-	    (name_len == sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1 &&
-	     !memcmp(name, XATTR_NAME_POSIX_ACL_DEFAULT,
-		     sizeof(XATTR_NAME_POSIX_ACL_DEFAULT)))) {
-		/* TODO: init_user_ns? */
-		err = ntfs_xattr_get_acl(
-			&init_user_ns, inode,
-			name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1
-				? ACL_TYPE_ACCESS
-				: ACL_TYPE_DEFAULT,
-			buffer, size);
-		goto out;
-	}
-#endif
 	/* Deal with NTFS extended attribute. */
 	err = ntfs_get_ea(inode, name, name_len, buffer, size, NULL);
 
@@ -977,22 +899,6 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 		goto out;
 	}
 
-#ifdef CONFIG_NTFS3_FS_POSIX_ACL
-	if ((name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1 &&
-	     !memcmp(name, XATTR_NAME_POSIX_ACL_ACCESS,
-		     sizeof(XATTR_NAME_POSIX_ACL_ACCESS))) ||
-	    (name_len == sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1 &&
-	     !memcmp(name, XATTR_NAME_POSIX_ACL_DEFAULT,
-		     sizeof(XATTR_NAME_POSIX_ACL_DEFAULT)))) {
-		err = ntfs_xattr_set_acl(
-			mnt_userns, inode,
-			name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1
-				? ACL_TYPE_ACCESS
-				: ACL_TYPE_DEFAULT,
-			value, size);
-		goto out;
-	}
-#endif
 	/* Deal with NTFS extended attribute. */
 	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
 
-- 
2.33.0

