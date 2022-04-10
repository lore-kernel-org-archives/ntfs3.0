Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF5B80F
	for <ntfs3@lists.linux.dev>; Mon, 18 Apr 2022 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=SgYsk
	9HHy10Hmtib43Pup2X8cI2QRs5cREPdgYrHsgw=; b=UIHY8qeo6OvoCCigyzz3L
	G+OJOh/xWGguU7b5iI7+2jy1fY9jdlnQcgG86rqLSMgGUanjzPkdl5DWkt5/Px33
	OI2Wlsd7Yf93V/K552ajLuwH6AyIsGFEVdHjxBm7HlvU5kaXoTrOIWiK3y1wWGps
	K8uiUIXezAGhRxHrR3DzYc=
Received: from localhost.localdomain.localdomain (unknown [115.197.34.188])
	by smtp12 (Coremail) with SMTP id EMCowADniBMTaV1ishFNAQ--.2947S2;
	Mon, 18 Apr 2022 21:35:17 +0800 (CST)
From: chinayanlei2002@163.com
To: ntfs3@lists.linux.dev
Cc: Yan Lei <yan_lei@dahuatech.com>
Subject: [PATCH 4/6] wireless: marvell: fix leak of memory skb
Date: Sun, 10 Apr 2022 14:14:20 +0800
Message-Id: <20220410061420.4064-1-chinayanlei2002@163.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:EMCowADniBMTaV1ishFNAQ--.2947S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1UZw17WF48CrW3uFyDJrb_yoWkGrX_K3
	s3ZwsxGr4Ut3W7Kw4UAw1Iy3sYk3yrXFs3ua4xtrWxZFW0vrWqvr93uFZ5GrWYka1qyrnr
	Crn0kF13JayUXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU18hL5UUUUU==
X-Originating-IP: [115.197.34.188]
X-CM-SenderInfo: xfkl0tx1dqzvblsqiji6rwjhhfrp/xtbB0hXmLGEjbBj9CAAAsO

From: Yan Lei <yan_lei@dahuatech.com>

Signed-off-by: Yan Lei <yan_lei@dahuatech.com>
---
 drivers/net/wireless/marvell/mwifiex/pcie.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/pcie.c b/drivers/net/wireless/marvell/mwifiex/pcie.c
index d5fb29400..38f73a769
--- a/drivers/net/wireless/marvell/mwifiex/pcie.c
+++ b/drivers/net/wireless/marvell/mwifiex/pcie.c
@@ -811,6 +811,8 @@ static int mwifiex_init_rxq_ring(struct mwifiex_adapter *adapter)
 		if (mwifiex_map_pci_memory(adapter, skb,
 					   MWIFIEX_RX_DATA_BUF_SIZE,
 					   DMA_FROM_DEVICE))
+			kfree_skb(skb);
+		    kfree(card->rxbd_ring_vbase);
 			return -1;
 
 		buf_pa = MWIFIEX_SKB_DMA_ADDR(skb);
@@ -1642,8 +1644,10 @@ static int mwifiex_pcie_process_recv_data(struct mwifiex_adapter *adapter)
 
 		if (mwifiex_map_pci_memory(adapter, skb_tmp,
 					   MWIFIEX_RX_DATA_BUF_SIZE,
-					   DMA_FROM_DEVICE))
+					   DMA_FROM_DEVICE)) {
+			dev_kfree_skb_any(skb_tmp);
 			return -1;
+		}
 
 		buf_pa = MWIFIEX_SKB_DMA_ADDR(skb_tmp);
 
-- 
2.30.0

