Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1194A17EF
	for <ntfs3@lists.linux.dev>; Wed, 11 Jan 2023 09:01:10 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so16394119pjj.4
        for <ntfs3@lists.linux.dev>; Wed, 11 Jan 2023 01:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hH22MjJlonlUf3pw4amhoXJiwGBol6P2BAt5F7FxeN8=;
        b=bLYd9enpioScpAW9rVN2QjpJg/ygZyBphwjbIv39uvf7AxXiErdnD1z+W04o9CVAUz
         +V9gGs2G0CT4y0/w6MX8huwuHAUcdKVjAh3HSuzY2ldS8NmN3w20TKjMWU1ykamz7siY
         V9BmwSOLKFkImwQmNeS0OKqyB8fNpVrvPgBR2M1FDnytf14DkpGC9LR6GhFkXnQy4qdu
         Q32L2/lRfwxbzBsge82CYbRr5xKflUCrLLQqnYGfxJ9C13BXXVO2Gq4zWoYJRRcMXgMY
         4HjX2aGMifcysGmNsFFRfBDI+Q9CZ2ap3Q7CpqpD4tWvdjyfZMTrAi43DYc1puLuw0RS
         KeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hH22MjJlonlUf3pw4amhoXJiwGBol6P2BAt5F7FxeN8=;
        b=dOFQDPGoPyCCjIQu3i91+yVr222NBzumZdpFeI7peEgYpr28J3c3+j3/oQjkCpuJrh
         FS9osD0WvadfTl3uoSqFZCoB5X2eSt1Aq9HkafysAhtcUva5sIunCHeysCKZXnZyFIOs
         lSkPgTYuxLbS3RBcyvnj2Be9QrDwYEmtTHrzjfFFJ4yRmyJEcX9L025gbDQ5zednDamt
         npxNQoT2N3K339dQ802ehr2s+fjvyBboTPOdb5TPJ0ESHet7U4AIlyunKzAXx+LcInGL
         ZhLPOT+ayLqsCw9L97FWgGHxpudP8pbJEOH4Dh4ySeUgQzRHp0XmYkphVdPeq8y/YOmU
         mx4Q==
X-Gm-Message-State: AFqh2kqH7UBplOQsjc2qx+wWyfSpROBSjj86EX2QCiHRZSkv1XhDzPJA
	Oz2ldmrAiL2BcdSVRsqukV8=
X-Google-Smtp-Source: AMrXdXtf5UnKZ0rosBIS1PUESD95GZoICBs/0NwqG7g45YcyK3qfrmsMkWjNt3DirJMTQrsnpsJeyw==
X-Received: by 2002:a17:902:ef8e:b0:193:2bed:3325 with SMTP id iz14-20020a170902ef8e00b001932bed3325mr1910709plb.15.1673427670466;
        Wed, 11 Jan 2023 01:01:10 -0800 (PST)
Received: from bai-Lenovo-Product.tsinghua.edu.cn ([166.111.139.145])
        by smtp.gmail.com with ESMTPSA id s21-20020a170902b19500b00189e1522982sm9549749plr.168.2023.01.11.01.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:01:10 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] fs: ntfs3: Fix a possible null-pointer dereference in ni_clear()
Date: Wed, 11 Jan 2023 16:59:43 +0800
Message-Id: <20230111085943.1127-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

In a previous commit c1006bd13146, ni->mi.mrec in ni_write_inode() 
could be NULL, and thus a NULL check is added for this variable.

However, in the same call stack, ni->mi.mrec can be also dereferenced 
in ni_clear():

ntfs_evict_inode(inode)
  ni_write_inode(inode, ...)
    ni = ntfs_i(inode);
    is_rec_inuse(ni->mi.mrec) -> Add a NULL check by previous commit
  ni_clear(ntfs_i(inode))
    is_rec_inuse(ni->mi.mrec) -> No check

Thus, a possible null-pointer dereference may exist in ni_clear().
To fix it, a NULL check is added in this function.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index f1df52dfab74..046ec4179d75 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -102,7 +102,7 @@ void ni_clear(struct ntfs_inode *ni)
 {
 	struct rb_node *node;
 
-	if (!ni->vfs_inode.i_nlink && is_rec_inuse(ni->mi.mrec))
+	if (!ni->vfs_inode.i_nlink && ni->mi.mrec && is_rec_inuse(ni->mi.mrec))
 		ni_delete_all(ni);
 
 	al_destroy(ni);
-- 
2.34.1

