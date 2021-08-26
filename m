Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28072
	for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 08:36:23 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id y6so3738400lje.2
        for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 01:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACgkWCKwF/Ed6sQZAHX+dVeKUJeJvUfwNZpntSmnQ8o=;
        b=IGCwH1mx+kjEja/5htKO73W8tRblt++9oAJKOgqP7mGqVIH4qQttERYuaXhbQB3AzT
         FPgAkC0oz/tiZyIxdID80EAadPSl2poX5/5I226ZNDE81XvCILI1NCLk0YdIZi+KthCQ
         tBPy2pBfeKY5yY9pvk6QKO9lr8r3q6HDuFtv99zQpd/217iJRycJcZB4pmHB8rOif7wS
         1lscSCg/C7N8ix1Qc9NdS6jOc0U92WeTe0/yhtu/n7L0jDjgvNlzrqSc9MfITwrv3WMf
         yg3zBJFvm1sxIxX1z0es2c5vD1Czuv+Dp8hRMnXzKw/gaWnpUwzfAJraAS44olafHISX
         c1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACgkWCKwF/Ed6sQZAHX+dVeKUJeJvUfwNZpntSmnQ8o=;
        b=DiRyhmUXc28R3aUzbs7YgjbVbiDkxU88g0LlNRS9IfsI8yCb+vYbgSJ+rrG86Ug0aE
         hTZNJ/+4Llu97CC3CfQTvN+jd6++Y992iMQH+udx9gCsf7S7PbO3/gSXHWCwY+KOOjYN
         oZCVifilmEPTJ7ayZmFTa0zCNIJTmX/gCh/KZX/TIJAoBxYZIUcLCfAm6SIv6frMvLOS
         NrMyUFAat9WQq+elIr2CwYs3mL0vDRvoSW1kIJlz4RnvBXCWtabg2fQ5x9jFocy6DoKU
         ydLPGZFGW2lv3aEoHPB01pxrsaB+1tP+Wb2ci9VM5+HPYpCEIEP24XRLV5B4PUhUVJDQ
         kRCQ==
X-Gm-Message-State: AOAM533WRQgfjtKdJsJz1y1dbZ9J+gMErW9e8u43Onf4uvPiB7UBPMgZ
	9///M9IbGgnyZTPgzNxbuZ0VcIJhKQE=
X-Google-Smtp-Source: ABdhPJw5zLS95TxhHuiFmvWLOvAnsgtMf0RVXsRTlp5WR2Flfcpe20neUt/KvLvQXWblopb4QsSs2Q==
X-Received: by 2002:a05:651c:158f:: with SMTP id h15mr2096170ljq.249.1629966981835;
        Thu, 26 Aug 2021 01:36:21 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id bp25sm251936lfb.51.2021.08.26.01.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 01:36:21 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>
Subject: [PATCH 2/2] fs/ntfs3: Fix missing type checking in ntfs_get_acl_ex
Date: Thu, 26 Aug 2021 11:35:49 +0300
Message-Id: <20210826083549.1565173-3-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826083549.1565173-1-kari.argillander@gmail.com>
References: <20210826083549.1565173-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add default path for type checking. Comment says that this is checked
above, but for fast eyes I do not find it. We have this check also in
ntfs_set_acl_ex() so let's be consistent. Also other fs driver had
implemented default path. Some are even throwing BUG(), but that feels
little too harsh.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/xattr.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 944557d3a769..5e86bea7e0ab 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -498,20 +498,24 @@ static struct posix_acl *ntfs_get_acl_ex(struct user_namespace *mnt_userns,
 	int err;
 	void *buf;
 
-	/* allocate PATH_MAX bytes */
-	buf = __getname();
-	if (!buf)
-		return ERR_PTR(-ENOMEM);
-
-	/* Possible values of 'type' was already checked above */
-	if (type == ACL_TYPE_ACCESS) {
+	switch (type) {
+	case ACL_TYPE_ACCESS:
 		name = XATTR_NAME_POSIX_ACL_ACCESS;
 		name_len = sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1;
-	} else {
+		break;
+	case ACL_TYPE_DEFAULT:
 		name = XATTR_NAME_POSIX_ACL_DEFAULT;
 		name_len = sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1;
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
 	}
 
+	/* allocate PATH_MAX bytes */
+	buf = __getname();
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
 	if (!locked)
 		ni_lock(ni);
 
-- 
2.25.1

