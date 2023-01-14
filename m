Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DDE62A
	for <ntfs3@lists.linux.dev>; Sat, 14 Jan 2023 01:54:46 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso26102286pjo.3
        for <ntfs3@lists.linux.dev>; Fri, 13 Jan 2023 17:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4KUc5JrrEgEAQMR+uacJMHg3Y0KdkEVSfddBY4EelSU=;
        b=pYh5aapWlNYGi2AIwHdCGiQBs+8o/UIxz4QRV9NCxbXcX159Mpi9iMC9hnCYDkvoTy
         DXtxwWyzgJwbxuAXgsQ81AHj89saiLU95mUNQ1mIs/Pn5U7jcxkJJGVkjgb8CJAcuupy
         JXl+H5BgWTPvJ68NmjLv7tCpMmQis6ISkSxe+wm308fv4bfoOqgUHikogG3wHbBnIouN
         Ku2FiHRrwiq+nkwh283+ApmG5niZ9VS3sS6t60fbIuXXMFoFQ8lNEfFch/pPnXzHY9IB
         xioAi/DfW9RzdZXVFFxV+HLnzz1w6KZZD42sM8q4KCxAqVmsbMN3MipqUf1MCx3LdpFa
         W92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KUc5JrrEgEAQMR+uacJMHg3Y0KdkEVSfddBY4EelSU=;
        b=rTBSJegu1gl6LgS4N3R+whsYzP/lRa6st3EP6eyj9oERt/WWQTcMAt9r2nf18NLV86
         EoW3MnfaBSpvuM0QPYd+HiCE68E4gSUrKW0mFerkO+oZ9L9mUPQseNV1pEAeIFzxelQY
         igtT9fMZyBTce8JEWPyh8+07ivoIXtoDseik3RNY3/O/ZVkV43T4FjlZlKVqtmQCF9IB
         uYWp/ejiqcFQATk4bKH5Bc3TIog7Fkt1XCBs1n1I2txlxQASETgWA/GBJE/zA2No/yT+
         4Cuq9DKuJFM/Tr+zfzcB74jTMiwIBstOZqHIUsMyCIi7fkYlWZCZ0uKCSA9NRuq2PSM5
         4Rwg==
X-Gm-Message-State: AFqh2koZnD+fKJgEk9e+ZuMlbFr45dkD6qB4RMH83MONpigdVSbdKnC2
	B3y+PSweyLbiPgG1jitZzPk=
X-Google-Smtp-Source: AMrXdXufjNASMfWxEUn8LZafdceOW19Mo9MoJdDhfu1pintXKLojiA5d/ydsUQxFmCJidyi3TAeUaA==
X-Received: by 2002:a17:902:db05:b0:194:751f:3e89 with SMTP id m5-20020a170902db0500b00194751f3e89mr3483782plx.63.1673661286141;
        Fri, 13 Jan 2023 17:54:46 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.142])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e80600b0019251e959b1sm14781028plg.262.2023.01.13.17.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 17:54:45 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	edward.lo@ambergroup.io
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia-Ju Bai <baijiaju1990@gmail.com>,
	TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH resend] fs: ntfs3: Add check for mft_ni in mi_read()
Date: Sat, 14 Jan 2023 09:54:41 +0800
Message-Id: <20230114015441.777119-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a previous commit 2681631c2973, the parameter ni of
attr_load_runs_vcn() can be NULL, and thus a NULL check is added.

However, in the same call stack, this variable is also dereferenced in
mi_read():

mi_read()
  ni_lock(mft_ni);
    attr_load_runs_vcn(mft_ni)
      if (ni) -> Add a check by previous commit (ni is mft_ni)
  ni_unlock(mft_ni);

Thus, to avoid possible null-pointer dereferences, mft_ni should be
also checked in mi_read().

These results are reported by a static tool designed by myself

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
---
 fs/ntfs3/record.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index defce6a5c8e1..9c5f922543c2 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -144,13 +144,13 @@ int mi_read(struct mft_inode *mi, bool is_mft)
 	if (err != -ENOENT)
 		goto out;
 
-	if (rw_lock) {
+	if (rw_lock && mft_ni) {
 		ni_lock(mft_ni);
 		down_write(rw_lock);
 	}
 	err = attr_load_runs_vcn(mft_ni, ATTR_DATA, NULL, 0, &mft_ni->file.run,
 				 vbo >> sbi->cluster_bits);
-	if (rw_lock) {
+	if (rw_lock && mft_ni) {
 		up_write(rw_lock);
 		ni_unlock(mft_ni);
 	}
-- 
2.34.1

