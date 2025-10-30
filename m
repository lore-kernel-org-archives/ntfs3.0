Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CD12D12EB
	for <ntfs3@lists.linux.dev>; Thu, 30 Oct 2025 16:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841254; cv=none; b=RfaCrKdCEruYRnc1moZAl63R0uerEndi7yOtQkhl1K3fu41nPAkAGjtV4eYV66Ovdzh4bHt00FHI6qWMlfFfvSSgo/UmtYlca02AncijUivR0dGZxI4DBZcihVSKxz+4GXC1CncOxIQpwiGsLVivTk+zqDFZXVwGve5BdtQ5ThM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841254; c=relaxed/simple;
	bh=yhBI48V0wmlBwA6nlzAZ6b3XU7gtXK748W7KsFub0fI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IfvQ1LsrU+76Rbcj6jTmohpEKQVIZFoRVgzy+CrvRpx0paLxhe2iGDm0XsMXxpX9uVjB2iNrXjKZ7flUVL0XTjxkA+Mbh7qzG0Iof7xGKNauVq7cqNf1Gok1odK74s9ZhY9cUlUtA+vsH0twApqkNsDyCtZtsuDZxbPStXwqtJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmqks6e1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmqks6e1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7833765433cso1753203b3a.0
        for <ntfs3@lists.linux.dev>; Thu, 30 Oct 2025 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761841252; x=1762446052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr4bXWVpbyanB9ZmKdE3YKsrObBxhl3NbLS1jm+yp90=;
        b=lmqks6e1ufX7yZkTkCrh5pEnSUXauGA8muHF51IAbxFUP7M4lxdI58ankcKGW8SPP8
         OBzc1E76IXyaYPTGUe0eMTtK456KfhJWlxRX3Uh9UWfp1H33xTu5sddw9WuWcM2fNSzr
         YywLPhsBCfWGlE1NF8Kgto+ANSkW9ybfqabsSwXr67OGTIxHIY0KI4eEmbOcv1hq6eOh
         1MAX0tAkMG5bzJKlB9G1nKzXAJ1U0mA+YDhcB9S/9TYFBKlWdZdsnxpizEx+bc0QceDu
         W60av75j19+POCMP5Chc7GyLTrUDPrb1uAAU7U1su5cJDMq0vyZCkO2R5+nxW0BDGR0y
         ZQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761841252; x=1762446052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr4bXWVpbyanB9ZmKdE3YKsrObBxhl3NbLS1jm+yp90=;
        b=muQgsIol2+xep09+nE6OyOAdE5HQxfvOJyAMZnCygeJCwMR8FZK27pmhr1d6EWJAIQ
         IPWQmx1d35utHhcAJThj1ITXcZ11XRrrAIP3XVERT4/N9dH8k6fBLTAYuyA6v3THqWTj
         qlNGCPV9fxNsiB0NFiDM+ddnTf0pbpHpN/1BfdY+tr/0UNb4Ov8HLjOBQR4AqD2TILwO
         Ot/G9RuwfLrrjYtgi7EjtfHyw6BLkyBrU1+d66ezUsflOOxdv2PMkU5DXndFl4+FehAk
         W10kmnNbsFjnQk1vDkfNtXEV/B1tW00/ZYzPwcCw+qFFZNKUp6NdII1f7OrNfNnq5ZLB
         sqrg==
X-Gm-Message-State: AOJu0Yy+3q5oPuWe4AfZXgFdR/r9HQQu7piTqUZ8V3lmwwq+xeLbgO0i
	D1/LMpdlUPuxJP7aJq0IaQHOXuR3YG/JaqYGC9iRoEWCGHkvj4d+tiKc
X-Gm-Gg: ASbGnctToHs8h5tEOpGIkU/7qgNouIEY1yb6dQwYLFtDRqWReDriRIuzsI00Z3z8l0m
	veRlthp9JdtOCD/vntjlQl2rsvJXJvG8/H8D0+OsMUhtHauHckXC7uK+60YfFaQmIkvh6XNBv3l
	bkyJNfhHECdM4Iz3zwYtO1+kxYW4Xn8ITvgQJNjq5UIYUl9sJ3B3CzsZtX6SS6x/dmdkzaVMnsJ
	QjfjvP+epxq1uz+eCAgHcxW+DKgKtxJusTHwnL9SUM4kcOyOlLcpGp9Dllfn6BHe58rXJtzYxke
	AmIAw+dXcINHku8hXKL/tXlZ2Jj2Bic5vkS70htUcrBQXyikKitlgmTxHsq7gqeYN5x/XuyPwXd
	CI2RT56twv2MIueHGyVLqqPeNoqLq30IKiKDOO6ZKBqE8wlPaVRnWh4qptw0ppQa+FwCeBWiDjh
	R8gOuGLNL0Cw==
X-Google-Smtp-Source: AGHT+IF+ELkof7ycUjT9m5QQlipuUDB6aaber6YXfw5ImcMWfAD7q2Det7dq77zeD9X5Z1cHTeAHSg==
X-Received: by 2002:a05:6a20:734b:b0:33e:6d4b:608c with SMTP id adf61e73a8af0-348cc3d95d9mr217460637.40.1761841252189;
        Thu, 30 Oct 2025 09:20:52 -0700 (PDT)
Received: from yangwen.localdomain ([117.88.134.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140530d3sm19534338b3a.40.2025.10.30.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 09:20:51 -0700 (PDT)
From: YangWen <anmuxixixi@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	YangWen <anmuxixixi@gmail.com>,
	syzbot+cc433e4cd6d54736bf80@syzkaller.appspotmail.com
Subject: [PATCH] [PATCH] ntfs3: fix double free of sbi->options->nls and clarify ownership of fc->fs_private
Date: Fri, 31 Oct 2025 00:20:45 +0800
Message-ID: <20251030162045.27813-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 02f312754c87 ("ntfs3: fix use-after-free of sbi->options in cmp_fnames") introduced a use-after-free bug
due to improper handling of sbi->options in error paths. This resulted in crashes when superblock cleanup
is performed in ntfs_put_super.

This patch ensures that the options structure and its subfields are properly freed, preventing the memory
corruption and use-after-free errors.

Reported-by: syzbot+cc433e4cd6d54736bf80@syzkaller.appspotmail.com
Signed-off-by: YangWen <anmuxixixi@gmail.com>
---
 fs/ntfs3/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index aae1f32f4dab..5d4ca4c10116 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -705,7 +705,7 @@ static void ntfs_put_super(struct super_block *sb)
 
 	if (sbi->options) {
 		unload_nls(sbi->options->nls);
-		kfree(sbi->options->nls);
+		kfree(sbi->options->nls_name);
 		kfree(sbi->options);
 		sbi->options = NULL;
 	}
@@ -1246,6 +1246,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		}
 	}
 	sbi->options = options;
+	fc->fs_private = NULL;
 	sb->s_flags |= SB_NODIRATIME;
 	sb->s_magic = 0x7366746e; // "ntfs"
 	sb->s_op = &ntfs_sops;
@@ -1671,7 +1672,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 out:
 	if (sbi && sbi->options) {
 		unload_nls(sbi->options->nls);
-		kfree(sbi->options->nls);
+		kfree(sbi->options->nls_name);
 		kfree(sbi->options);
 		sbi->options = NULL;
 	}
-- 
2.43.0

