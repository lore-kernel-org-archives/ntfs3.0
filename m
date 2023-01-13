Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E36ADE
	for <ntfs3@lists.linux.dev>; Fri, 13 Jan 2023 13:13:08 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id jl4so23388963plb.8
        for <ntfs3@lists.linux.dev>; Fri, 13 Jan 2023 05:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4KUc5JrrEgEAQMR+uacJMHg3Y0KdkEVSfddBY4EelSU=;
        b=QcMnMEk3LEKnssiIzikEyB6Auz31cin5hOdWestRkhiTFyN1RqlvNMhymUOl7NgSgx
         yHes8XO5JE/NQa9WKpQnJ5kIB86000Lk2sZNf02tjXEg1d4hF74ZbJMS1MxQyp8VXyaP
         oMSfg0KTOTLTAwrdj3bqZS51euz2LLb7pf+qFHrHrOVqgGkLVaQtHrwJYSvP1RA01Gbq
         aMEnFmMUq4goj4o+iu1yJwcwjy/ob8Dq7WwimCxlEc4eV9srx1Eq2DAwYgZkvbXHngkD
         bwqROmENaeH4+SXna1fmDHnd0AV4S9YJejLh1BuITRPVe1EiZgN/njLSwKUxYFaXmPBN
         QOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KUc5JrrEgEAQMR+uacJMHg3Y0KdkEVSfddBY4EelSU=;
        b=y65ZMqKHqH4WXoX9+/lMDK/h+AZ1gNrJD8OL5mkMRrLCrUgIkSWYT7q47AOXcFAI8r
         qIRHTLgO7A/jwc7rz3H0TbcJ4VdCaAfI3+aPidRdy47cCzHWWe2IVbDmfi3nkRGjdeWl
         3MB9HFfKPMhuw4fM6NcfVjRHafb6Yrll+WpyXGfJvI0dS0sPkF7TjjUnDito1xDVRfXD
         AqBREwcNgTpWeww0KtSZYZ40OQXe9UriS2mBhAaWcwfMLL8us95JwS7fuMsvKKnngs4c
         xOWUBxWtCwobK1Phy0PXQtZFoCfUsxFLUgGNA9PiDwT2DZKJFETNeLzzjUbBYCmrwzyC
         ldhw==
X-Gm-Message-State: AFqh2kpuhsT7Y8MTDaap2Gt6XVIiVS3OmYaEqmUEwc02lRXZVKe8WX+a
	PKhNBMz4g77GcqTvbAzbwK8=
X-Google-Smtp-Source: AMrXdXuiiip+ouWeSYMH7cgxi+SoCGgf2LIXdaZG/nd2fyGQeTyfKrXV2Y7KLkkwQ7eDcbHrAKfrDg==
X-Received: by 2002:a05:6a20:c193:b0:9d:efbf:8175 with SMTP id bg19-20020a056a20c19300b0009defbf8175mr12625364pzb.62.1673615587935;
        Fri, 13 Jan 2023 05:13:07 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.142])
        by smtp.gmail.com with ESMTPSA id o189-20020a62cdc6000000b0058baa6586f3sm2673696pfg.135.2023.01.13.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 05:13:07 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia-Ju Bai <baijiaju1990@gmail.com>,
	TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] fs: ntfs3: Add check for mft_ni in mi_read()
Date: Fri, 13 Jan 2023 21:13:03 +0800
Message-Id: <20230113131303.761464-1-baijiaju1990@gmail.com>
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

