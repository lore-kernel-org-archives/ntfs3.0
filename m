Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD9D376E0
	for <ntfs3@lists.linux.dev>; Wed, 11 Sep 2024 01:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726019903; cv=none; b=dIwrRxQ4vRfaWoBNZctnH+9omIHqlvdp3r65IWKZVz7ENJd8YlA8MzZOVkEv9+JBHztHYFpURRdXGVK7xWZQifaqy8L0w2xow6mk6fmuQ9+m5PjNiZrCBhzSAhQKh/Xrmc2u+79HwMc6ReYXAa6gwoLXOqyDGr1hVnoZTSRGw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726019903; c=relaxed/simple;
	bh=0EFMw3SRkvYMgNTA7vSI8wJ9KODSpg0kCS9jWVoDcmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W+I6yxPINDG4P9PQiZQUe4/EhvwEnm/sR/u40vB5jC6k203boseot7/0oC3QPYIuu8pk1Xx4tyxX1PFf3qF2ongK6O5V63giBd1SWQHVHMNjDQjn3A51RN0xMWXDIFt45+Y31ZHpVZyHW23FAxhGuSXXCczXr96ZzlVp/81xB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fk/uFrpl; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fk/uFrpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=J6AXG
	gTxHDU2guXI/u7d3q2TLw5oNU6irbtQtNAV3lo=; b=fk/uFrplVHi/4SGiYsrCX
	igCN4lDO63uqq3f1s/FAQKXHMjIpKdYa6NWchDq3P6Wy5s3GBX5go3M1zqpdx3ix
	IvZIq8xMqKRJEKYHUGWoQNuOBA/R9+Q4tiUJxgqyxyr/ur9Xu6MyNfWy3ENxNVic
	Cf+Lhnga5qRG+zMTiUMpP4=
Received: from iZbp1asjb3cy8ks0srf007Z.. (unknown [120.26.85.94])
	by gzga-smtp-mta-g2-0 (Coremail) with SMTP id _____wAHDtws+eBmy2yaDQ--.33363S2;
	Wed, 11 Sep 2024 09:58:05 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] fs/ntfs3: Remove the unnecessary 'if' statement
Date: Wed, 11 Sep 2024 09:57:54 +0800
Message-Id: <20240911015753.49513-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHDtws+eBmy2yaDQ--.33363S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrCw4fCF15tryfWryDCr13twb_yoWxArb_Ja
	42kF4rK3Z8J3WI93Z5Kr4YgrWqqFW8tFnYvw1xtF95Cr45tF45Xa4qqrs5AF4ag3yDZFZr
	G3srCFW7A3W5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_db1UUUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLxlXamVOGP6WDgABsf

The 'asize' was already checked to be less than SIZEOF_RESIDENT.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 fs/ntfs3/record.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 427c71be0f08..0f400366231d 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -268,10 +268,6 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 
 	/* Check size of attribute. */
 	if (!attr->non_res) {
-		/* Check resident fields. */
-		if (asize < SIZEOF_RESIDENT)
-			return NULL;
-
 		t16 = le16_to_cpu(attr->res.data_off);
 		if (t16 > asize)
 			return NULL;
-- 
2.39.2

