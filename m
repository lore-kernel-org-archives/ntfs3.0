Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857872
	for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 08:36:20 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id f2so3747761ljn.1
        for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 01:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FE3acVUbkSC/dTUhKBHt8IkEjhKNft9YGI3LqFxGPJo=;
        b=qfAAZJbFmy5C63Q31UdVaDZ02npQwvMZabAVgMgSUvAy2k7e56mvq2dLJgj5LYgI1w
         SYPmdYEIfDB71QjI/uLli4EBOewMkU+UzCGFHJ1r+vRFHpNmr2V9NeGAvXGnqe8JRuou
         iB539svppQoGw29Ze6d0owCtpI0OpUHQYpFbfy7doBoMV3DuL7fZkKQwbuUWuH1BuQzu
         uzT3U06I5gCWMbcu/GVTBPLPA+6+2xPVYU760/vVBunSjSzskj+uFMbiPvSnRhlxZugs
         P/Er/ONVbIDW/3tH4dneNXHYJ1/kCy7RQwWS2QS2l9p+qTTW41ZWi0SSzjRTwW1CtZrD
         zUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FE3acVUbkSC/dTUhKBHt8IkEjhKNft9YGI3LqFxGPJo=;
        b=i1GNk7gEclImWzJiwRug9CYnrcxRAaf7hxSdHQbbwCORAMviXsRq46claFkhvlz9sm
         so+rAElYCbK31YGhWhlFsl7Bflq0Al3gIiu15LfvLnYU6X2Gkjd5WUHRkqd2DihrPN83
         Cz2bD7Uibd9DFO7o7WnX0Oa2gr3QcdF9Qto3CNfE7WrydC9os23c+jLpiLHCZl/GWeSI
         bvO0HvSsXrRRb0fISdKdF95BbrnXQPe1bLyCFcuGcYhpylRuBsAQtnsx/U7G/ChqkBh3
         nemqWrYEiDdRjjgJmmawyDC52IfIMXv4ss/DerrTJP2Tcx83BjZ6GdoT/0Jvrtq9zCx6
         xpng==
X-Gm-Message-State: AOAM53265ffDrggP7eaTbnQHW9b1AMG85xiT32bivKsCz1gXJg0/oHRV
	9/EZ/WCfAhpFqPp3ar1iE+Q=
X-Google-Smtp-Source: ABdhPJwqo+utRQaTlVSxnSPipbapEyak5ULV9QmacaEhzG2NKUzUBpzpodKYvRalgwOaCyqhy2O+Ng==
X-Received: by 2002:a2e:bd84:: with SMTP id o4mr2118839ljq.380.1629966978954;
        Thu, 26 Aug 2021 01:36:18 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id bp25sm251936lfb.51.2021.08.26.01.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 01:36:18 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>
Subject: [PATCH 1/2] fs/ntfs3: Fix pass zero to ERR_PTR() in ntfs_get_acl_ex
Date: Thu, 26 Aug 2021 11:35:48 +0300
Message-Id: <20210826083549.1565173-2-kari.argillander@gmail.com>
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

Fix smatch warning:
	fs/ntfs3/xattr.c:529 ntfs_get_acl_ex()
	warn: passing zero to 'ERR_PTR'

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/xattr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 98871c895e77..944557d3a769 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -525,8 +525,10 @@ static struct posix_acl *ntfs_get_acl_ex(struct user_namespace *mnt_userns,
 		acl = posix_acl_from_xattr(mnt_userns, buf, err);
 		if (!IS_ERR(acl))
 			set_cached_acl(inode, type, acl);
+	} else if (!err || err == -ENODATA) {
+		acl = NULL;
 	} else {
-		acl = err == -ENODATA ? NULL : ERR_PTR(err);
+		acl = ERR_PTR(err);
 	}
 
 	__putname(buf);
-- 
2.25.1

