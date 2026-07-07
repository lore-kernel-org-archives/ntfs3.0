Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B61314B9D
	for <ntfs3@lists.linux.dev>; Tue,  7 Jul 2026 02:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783390507; cv=none; b=Anr7JiwFAit5f1RPahFjrrojdEJrACS3FbfS+kj7Ionyme79vfYfOFTBxA+JBtlAhCvTWtI5A25N2IwaPsRtJAuSZ79ANHckO2E57aNArMjnm/1Ydk2baamBb/fAGgXxYRCp5bwdif9PIdmmmkXzpDjs81l+gBQ66p5Jr/BMT8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783390507; c=relaxed/simple;
	bh=qxBlU3fNC2VUsZpWLEM+oQRHnmTwDC4LS+JfCWyNjRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cpQqbuSv2mbzxbbkyA5i4CxSQRu/16AA7X32gLDeTtZH83StOBIoP6voMd1lOcleKDI6K5tCHqnAGyJ0lnRxjJ3CDk9HlMwqjDZqc5c0kKL4eKnPLqAqioLnUwGZfMCUTO0gskhTxfT6wDt86Wv+4HVeA3xl1GYmB79PFWkNW2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a772cd4879a911f1aa26b74ffac11d73-20260707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:338f1e4a-ec05-4d9a-837e-6d20df2b476e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a023b44dd6a5debd43d6e3e33282de6a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a772cd4879a911f1aa26b74ffac11d73-20260707
X-User: xieyi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xieyi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 237251584; Tue, 07 Jul 2026 10:14:59 +0800
From: Yi Xie <xieyi@kylinos.cn>
To: almaz.alexandrovich@paragon-software.com,
	linkinjeon@kernel.org
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yi Xie <xieyi@kylinos.cn>
Subject: [PATCH] ntfs3: fix resident attribute handling in run load paths
Date: Tue,  7 Jul 2026 10:14:44 +0800
Message-Id: <20260707021444.57163-1-xieyi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't dereference nres unless attr->non_res is set.  ni_find_attr() can
succeed with a resident record on a corrupted image, and run_unpack_ex()
would mis-parse it as mapping pairs.

Fix attr_load_runs(), attr_load_runs_vcn() and attr_set_size().

Fixes: 5ec75546dc71 ("ntfs: fix WARN_ON for resident attribute in ntfs_map_runlist_nolock()")
Signed-off-by: Yi Xie <xieyi@kylinos.cn>
---
 fs/ntfs3/attrib.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index c621a4c582f9..248a6d68eac3 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -61,11 +61,16 @@ static int attr_load_runs(struct ATTRIB *attr, struct ntfs_inode *ni,
 			  struct runs_tree *run, const CLST *vcn)
 {
 	int err;
-	CLST svcn = le64_to_cpu(attr->nres.svcn);
-	CLST evcn = le64_to_cpu(attr->nres.evcn);
+	CLST svcn, evcn;
 	u32 asize;
 	u16 run_off;
 
+	if (!attr->non_res)
+		return -EIO;
+
+	svcn = le64_to_cpu(attr->nres.svcn);
+	evcn = le64_to_cpu(attr->nres.evcn);
+
 	if (svcn >= evcn + 1 || run_is_mapped_full(run, svcn, evcn))
 		return 0;
 
@@ -555,6 +560,10 @@ int attr_set_size_ex(struct ntfs_inode *ni, enum ATTR_TYPE type,
 		}
 
 next_le_1:
+		if (!attr->non_res) {
+			err = -EIO;
+			goto out;
+		}
 		svcn = le64_to_cpu(attr->nres.svcn);
 		evcn = le64_to_cpu(attr->nres.evcn);
 	}
@@ -1444,6 +1453,9 @@ int attr_load_runs_vcn(struct ntfs_inode *ni, enum ATTR_TYPE type,
 		return -ENOENT;
 	}
 
+	if (!attr->non_res)
+		return -EIO;
+
 	svcn = le64_to_cpu(attr->nres.svcn);
 	evcn = le64_to_cpu(attr->nres.evcn);
 
-- 
2.34.1
