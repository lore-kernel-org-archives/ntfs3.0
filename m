Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A76A4071C6
	for <ntfs3@lists.linux.dev>; Sun,  7 Jun 2026 02:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780799630; cv=none; b=ElNWV71YxsHh7MLHXemqwjmHFUqPEeLOFwkSsYGhNQXd0+RkLStFb9RVfn6Rqp9FYF/u4+d1KOXR3ttSenqVMmUKfb0J+4on/ZKjfz2nYOAw2hqEwi6lE4GP6GGUfuGcxfpVFIpVGv5lfVI0qeDDtGMcj+DDqQ/SuR78IdJxHQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780799630; c=relaxed/simple;
	bh=TYRFTol04DcTPCQsfZGY9eXn4uQ6nAvd6tpADfLwihE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j5Qg4ivsROXvjMO1ryZk0zIzlYeQ/2QSS8EfW/ynZmYfwOKBpCBol3W8VfxGkXYcv5RnpqAmA6u0hhaELUas15XkVOfcC/4SW/H38gfXk/Hn2csjZ1cNzCQbQvVG8eg7ih/vs+3Uq8UdMQcX+g7t1vhgnkVP1bgza+RZ473nuJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTtPsIu3; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTtPsIu3"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2bf1f074a12so33328475ad.0
        for <ntfs3@lists.linux.dev>; Sat, 06 Jun 2026 19:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780799628; x=1781404428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf8jhK6nc/0IRduDkKHSSZmTS2M+HMVohcyT9/mAbFY=;
        b=iTtPsIu3NZhOE94hYVfy6E3RQZ10ema6g30/A9jUr7plKkXEJSeHmy2QcVGqsIvBF+
         vPs1mr8TCmicEtb4KBaKM4xCdaRiOBHYVptUK1YWTsdJw0UGpCavka1iBLg+BDjehBim
         gVClXjZW3jtHPcYZmGyLjJWCsc/2USqx7f1lU1UfDB8BcGOgHSEotbgiWdnDxQPNBub2
         WNmerAZ8FemRNU5QvFzaNHiAIeHsMl1mPLu6883RsUyyiFrQPEbgEuB4QERg4UPgRadg
         8ts/E8/NotXJ2lSJbnBlGfUCyEQeoHXLFBglMGiQzsXlnnCb0XEr6yYBJwo4XbO7auMW
         PdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780799628; x=1781404428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sf8jhK6nc/0IRduDkKHSSZmTS2M+HMVohcyT9/mAbFY=;
        b=o/xtDUgDtvrhACE18mVeZxF74bKH2VI4curq0y3yzGJ2zNlozJEOa1n3ZSG57ko0F3
         dTU6rqemXrp3LwVBjk8MvylMmP1RvLcFs5UUyJoTTS7IKUxVU52ACWTjAg4WGSnq5MVn
         MqQ0htmXHEuEB6fxPlCPNCbt1erfTaaTX2lgFz4zvYuaRCHfT+PLGbQCxTQY3eGqFks6
         Q00rDnUKoXMQyh9KFh6gQlw6v+eZzPL7pBH0rVFklS89eqY8E768aXYpY6lMUL6ppPRG
         VXDGI807EgIt6/pCVI7lDA57WycjCql3c64uqEt7KaRs39jTdxXTGBAeIFxmfL2xmQsi
         uQeA==
X-Gm-Message-State: AOJu0YxGjKipzYJ40OTGpbKYmtot+ehMvREytyyap6I7+0XHIZTYR2uf
	Z9Y6gwCplIScd/dXmOD84wTswEg5wfctRtPkfcQpYYAY53vWUXDOaksV
X-Gm-Gg: Acq92OFecqeut8IMv4ulnBl5rzC1O4GDu4/Y5nYjHWy+pzDLOYOBVMzId3ypZb42KBA
	c4NWw1VxJbae0sOuoeHVO7P6oN4BdRDPuj529vXhJzQBV4Tt3AasQyrJQ+0WPC7YKX/Z4Wk+aEF
	yoNoyq4agv1XNY+OhUzFeN7iiefohimlaOlJM6iQ5cZynD3hbLThVasUIYb0rp9PmoSSc6vZZkS
	YWYo8MCoSh4R1n5eB2aiJVI1ZwTl63PRz+WAZRzDyiP15hSnoK1Mz3BgOqzd5h7Uf+u92Z1XKQG
	0foo8OFLqRxfSGgLPxykNduo4xWUnZMlR2ptFZgSvJ3+yA0HCgrHBCFMG2EnYg5AEszjFo1t4DD
	sF8qrVLfBEQI964oJGKBeGe5o/o87qT5tclC+pt7HxDV/J9zk5kOQxnIlHNXnbCS5DKWEdS2WCu
	ah7FqgB+AX5fgVhlY4lTaay/mLmcyV6pEcPUl63G0tXei47IrZeeJozclTY4DKrK0=
X-Received: by 2002:a17:903:22c9:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c1e82125f8mr106857595ad.11.1780799628294;
        Sat, 06 Jun 2026 19:33:48 -0700 (PDT)
Received: from LAPTOP-F6NHKUER.antgroup-inc.local ([8.141.222.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e636sm137611035ad.51.2026.06.06.19.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 19:33:47 -0700 (PDT)
From: Zhen Yan <sdjasjbuaa@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: reject direct userspace writes to reserved $LX* xattrs
Date: Sun,  7 Jun 2026 10:33:39 +0800
Message-Id: <20260607023339.6728-1-sdjasjbuaa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aiP-42fhOyMGK8Yg@1wt.eu>
References: <aiP-42fhOyMGK8Yg@1wt.eu>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NTFS3 uses $LXUID, $LXGID, $LXMOD and $LXDEV as internal WSL
permission metadata and reloads them into i_uid, i_gid and i_mode
from ntfs_get_wsl_perm().

Because the empty-prefix xattr handler also lets file owners call
setxattr() on these names directly, an unprivileged writer on a
writable ntfs3 mount can plant root ownership and S_ISUID on their own
file and gain euid 0 after inode reload.

Reject direct userspace writes to the reserved $LX* names. Internal
ntfs3 metadata updates are unchanged because ntfs_save_wsl_perm()
writes them via ntfs_set_ea() directly.

Signed-off-by: Zhen Yan <sdjasjbuaa@gmail.com>
---
Willy, thanks for the review. Replying to your points:

 - Tested on v7.1-rc5: builds clean (W=1, no warnings), checkpatch
   clean, and the original reproducer no longer triggers -- the
   setxattr() calls now return -EPERM and uid/gid/mode survive an
   inode reload. Internal WSL metadata is unaffected:
   ntfs_save_wsl_perm() writes via ntfs_set_ea(), not ntfs_setxattr().
 - Resent via git format-patch / git send-email so whitespace is no
   longer mangled, with no PoC in the body and security@ dropped.

 fs/ntfs3/xattr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 9eeac0ab2..0bc633025 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -851,6 +851,14 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 	return err;
 }
 
+static bool ntfs_is_reserved_lxattr(const char *name)
+{
+	return !strcmp(name, "$LXUID") ||
+	       !strcmp(name, "$LXGID") ||
+	       !strcmp(name, "$LXMOD") ||
+	       !strcmp(name, "$LXDEV");
+}
+
 /*
  * ntfs_setxattr - inode_operations::setxattr
  */
@@ -955,6 +963,11 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 		goto out;
 	}
 
+	if (ntfs_is_reserved_lxattr(name)) {
+		err = -EPERM;
+		goto out;
+	}
+
 	/* Deal with NTFS extended attribute. */
 	err = ntfs_set_ea(inode, name, strlen(name), value, size, flags, 0,
 			  NULL);
-- 
2.25.1

