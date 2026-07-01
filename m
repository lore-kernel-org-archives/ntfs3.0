Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760393368AB
	for <ntfs3@lists.linux.dev>; Wed,  1 Jul 2026 01:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782869463; cv=none; b=pjGbrdHYngALW8KM7YjYrI6eu6TM4RL9h5LemM7XjgFdKrpuQqoImdXIU3M8fp6BAtZH3rNX7QEEFZUL217SdCoYRdbN92++295HMbMVuvRLqrq8IP2uL3MzRZjWEOsqXvoFGuDHkQgciIxA/uq9+83m5MneklRcGdzY92xxmF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782869463; c=relaxed/simple;
	bh=yNgWg8FaZzdw+8aDrb3C43w2a5jGJEjPSLrCL/qKy8I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MlD34iw1/ALmcoGbMBN877e+OXFZwnBsQaEhjrXmZBpxYRog5vOityGTSdrCmuL86GhRSdtG1Q472x6rMxix1eiCWsMaguaHm/BJB6A1TYPkybhve8H+/LK0uGObN2UR3I3Sj9270EUy7AHXzkEsIUOpmz7qFw5AV6eZv5iEPpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=XpgiorTy; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="XpgiorTy"
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6610aMDl2254293;
	Tue, 30 Jun 2026 18:30:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QnaentONWUMZdafK2Tc7xt36v7Avl6XVpzTXAeT758w=; b=
	XpgiorTym4xcY06jZTWfNu46HBS1sam+eJrL4gx2JzM4J6fJdpEq0cTNrL96lqSz
	2YcthzzQat/1ifEebbvjIhkSWdgcLWQ1E0o0gPaq36yRbwnHdOQW/rSUTCjHcvps
	YcoDvQNRGfTsx7Z8w8bCV/0ofDe9BUynefGEt3kaPF1Yaiw63EVWsKQ0BPvomsUY
	O9czu4c8LVzLY2QqtUwQkRceu8kBT0tMeJzFoyQi82q1jPj46/7SHEFqaSyyDlH/
	TJo/zay7RR8JhOTEvKcXw/ItadQOXcBLSHw/9Gu4bhXTlY2jRtnybkbw1SqpfrCE
	bYl3vrvI+XJzycQ2Q5dy2Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f29symv1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Jun 2026 18:30:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 30 Jun 2026 18:30:54 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 30 Jun 2026 18:30:53 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <almaz.alexandrovich@paragon-software.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <yun.zhou@windriver.com>
Subject: [PATCH 2/2] ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix deadlocks
Date: Wed, 1 Jul 2026 09:30:49 +0800
Message-ID: <20260701013049.3141386-3-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701013049.3141386-1-yun.zhou@windriver.com>
References: <20260701013049.3141386-1-yun.zhou@windriver.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ogXgoBPgcKY1TFZ3WIv38CswOaseBNv0
X-Authority-Analysis: v=2.4 cv=HsJG3UTS c=1 sm=1 tr=0 ts=6a446dcf cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=YcPwLfEUQg3Q83aZ1WwA:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ogXgoBPgcKY1TFZ3WIv38CswOaseBNv0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxNCBTYWx0ZWRfX+a7g4oANp7Es
 +eFq0PBaMQzPsK222lGJhOUXAAABAz2GZ9lZgJxx8hiT8uGZ9E3canGPUTXIpH1i24xfROryZdB
 874G4vrpQ6/cnVWUQWq2/WStZqGH8Qh3lVxZ2pUNrbuiMfSzuQZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxNCBTYWx0ZWRfXz5sC5MhV7rNV
 g6fbYvnR+XVkyPRcksS8uZ772TwqbjpJNeC6WpMVZg4ShIxmdXV0Q/hD+XXA1jkVKtY+X+UiBfG
 4nDi79LlH5k8Q8IY5TSF+NpM//OQ67GYv7ZWriRIV5v4B6aCOofIzN4uZDWkteZcKXOelH8ERjE
 C8qXOJDNMa+dXJwijAyrKhlBRMFDSKlL+L/Efvau0UezB2TGzpLiQIih6d67i8EK0XPgWlOqisx
 qLx4ZfgW6SoSftZnSUJbmHx0ARPdB+4tonvIFcHwqzqNJ2HYe9Y3o1fkCrc7lVQBCFcPHdFEm+M
 R/s3ckxDScT4XaolmkwBGtUhmAeuZMZe4Jh1aYYp4TyxnbfFmazlZvQqpmUV8UXGAvOii+3nzll
 JtS07TlNOngtP/x7MT8syjDOvJmaqrmMpYKWTxBFn1bcDv6UQz8EgoT02GDRuLX06DT9HTLvaG6
 4/46HEiQlh4kROwBLtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010014

ntfs_readdir() holds ni_lock while calling ntfs_read_hdr(), which calls
dir_emit() to copy directory entries to userspace.  If the user buffer
triggers a page fault, the fault handler may need mmap_lock or
mapping->invalidate_lock, creating lock-order inversions with paths
that acquire those locks before ni_lock (e.g. ntfs_fallocate, mmap).

Fix by releasing ni_lock before calling ntfs_read_hdr():

- For non-root index nodes, indx_read_ra() returns data in a kmalloc'd
  buffer (node->index) that remains valid after ni_unlock.

- For the root index header, the data lives in the main MFT record
  whose lifetime is bound to the inode.  i_rwsem shared prevents
  concurrent directory modifications, so it is safe to access after
  ni_unlock.

Reported-by: syzbot+7736960b837908f3a81d@syzkaller.appspotmail.com
Reported-by: syzbot+262a71e9d2faf8747085@syzkaller.appspotmail.com
Reported-by: syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7736960b837908f3a81d
Closes: https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
Closes: https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
Fixes: d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata walk")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 fs/ntfs3/dir.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 07de564a2c47..65883409689a 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -491,12 +491,22 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 	if (pos >= sbi->record_size) {
 		bit = (pos - sbi->record_size) >> index_bits;
 	} else {
+		/*
+		 * Release ni_lock before dir_emit (which may fault into
+		 * user pages).  root->ihdr lives in the main MFT record
+		 * whose lifetime is bound to the inode, and i_rwsem shared
+		 * prevents concurrent directory modifications.
+		 */
+		ni_unlock(ni);
+
 		/*
 		 * Add each name from root in 'ctx'.
 		 */
 		err = ntfs_read_hdr(sbi, ni, &root->ihdr, 0, pos, name, ctx);
 		if (err)
-			goto out_unlock;
+			goto out;
+
+		ni_lock(ni);
 		bit = 0;
 	}
 
@@ -525,6 +535,12 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 		if (err)
 			goto out_unlock;
 
+		/*
+		 * node->index is a kmalloc'd buffer, safe after ni_unlock.
+		 * Release lock before dir_emit to avoid lock-order issues.
+		 */
+		ni_unlock(ni);
+
 		/*
 		 * Add each name from index in 'ctx'.
 		 */
@@ -532,7 +548,9 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 				    ((u64)bit << index_bits) + sbi->record_size,
 				    pos, name, ctx);
 		if (err)
-			goto out_unlock;
+			goto out;
+
+		ni_lock(ni);
 	}
 
 out_unlock:
-- 
2.43.0

