Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E37620
	for <ntfs3@lists.linux.dev>; Fri,  6 May 2022 03:47:04 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d25so5248226pfo.10
        for <ntfs3@lists.linux.dev>; Thu, 05 May 2022 20:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0GBnsUFI480KyuDDKiDj6EO0c5V7IXRlhq6lrsQR2EY=;
        b=k7uvdMBTxQMDq6M3LascyGTaiuxi2yT1elp1Bszljqv5oQ019q15F7QRpLZ+v1AwDR
         lO7ycwTQEmQQSfqcXkDIXY3Diu5PwWZmmgNHECwmCVNcXktbcpsr/CEtiOvs6y2orAk/
         SkMqSa4AXgPTI36JKkzNiGI47w67B2KjdIxEy/jk2jiLCJkAa7CQGY/OJdehRZLn72ca
         aVBe6NaCeqffUuvNNxvTBYNjI+uipnvNQKhXi5Uo9qhgPv6zfBIdVlFT7pX7Xwy2z8u/
         PqAisoU/4c+03vj7Hb2QgV8gxPPQJALYjiTG/WCMwlXqqjtNTK+IxyJ1rUt+uzsKqnmJ
         A1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0GBnsUFI480KyuDDKiDj6EO0c5V7IXRlhq6lrsQR2EY=;
        b=jfgtcYgHqq4UpjRWbpxWjm5ReBhCZtrE1Qm3R+0PgZOPeOrGGVtjBhZGJY5iHqr165
         8CXaKZOUrcU7EEMT6LgMqf7V9swvbal7iZlT0HJ7lh42trI7VFyctYlNJ+5HJF8VIhII
         iqP4QrUfE3nkfw+iOx5UexxPjPyI2tRKapOu70cBxChf57QmDhc23JdI1kxM8MSE9jgZ
         dxEFQqyFZJ54Sra8P7MzL4NooVA6Vq6bVRtNw4uoiOctIAa45+VppaYTNANwx2mTMQko
         oxAh9YZNzBQfOtjBPVimerAfhWhk65ggahXvtFYGBb0ae60vGtKXK1gWmZFhdmcgZw/F
         PYpw==
X-Gm-Message-State: AOAM530hGLaozAJlKvUIcatZ0costssgJkL/EWUXfov//XuMBMrQYZ0c
	dqq+UaXvhz3XznONbYdDofPewipwoY9RBA==
X-Google-Smtp-Source: ABdhPJyzdQZ2piTp+gk+/6EcJp5EzxsQPyiqNKXt9xJG3Eh1hHllS3jVdx2Ud8lyihP6lkN3sbk42w==
X-Received: by 2002:aa7:962e:0:b0:50d:5ed8:aa23 with SMTP id r14-20020aa7962e000000b0050d5ed8aa23mr1602069pfg.43.1651808824217;
        Thu, 05 May 2022 20:47:04 -0700 (PDT)
Received: from lbmac.lan ([119.28.81.66])
        by smtp.gmail.com with ESMTPSA id p18-20020a1709028a9200b0015e8d4eb2cdsm398139plo.279.2022.05.05.20.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 20:47:03 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: ntfs3@lists.linux.dev,
	almaz.alexandrovich@paragon-software.com
Cc: linux-kernel@vger.kernel.org,
	Liangbin Lian <jjm2473@gmail.com>
Subject: [PATCH] fs/ntfs3: fix null pointer dereference in d_flags_for_inode
Date: Fri,  6 May 2022 11:46:56 +0800
Message-Id: <20220506034656.50038-1-jjm2473@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_mft may return inode with null i_op, cause null pointer dereference in d_flags_for_inode (inode->i_op->get_link).
Reproduce:
 - sudo mount -t ntfs3 -o loop ntfs.img ntfs
 - ls ntfs/'$Extend/$Quota'

The call trace is shown below (striped):
 BUG: kernel NULL pointer dereference, address: 0000000000000008
 CPU: 0 PID: 577 Comm: ls Tainted: G           OE     5.16.0-0.bpo.4-amd64 #1  Debian 5.16.12-1~bpo11+1
 RIP: 0010:d_flags_for_inode+0x65/0x90
 Call Trace:
 ntfs_lookup
 +--- dir_search_u
 |    +--- ntfs_iget5
 |         +--- ntfs_read_mft
 +--- d_splice_alias
      +--- __d_add
           +--- d_flags_for_inode

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
 fs/ntfs3/inode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 9eab11e3b..b68d26fa8 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -45,7 +45,6 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 	struct MFT_REC *rec;
 	struct runs_tree *run;
 
-	inode->i_op = NULL;
 	/* Setup 'uid' and 'gid' */
 	inode->i_uid = sbi->options->fs_uid;
 	inode->i_gid = sbi->options->fs_gid;
-- 
2.32.0 (Apple Git-132)

