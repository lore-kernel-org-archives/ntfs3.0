Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A7880F
	for <ntfs3@lists.linux.dev>; Mon, 18 Apr 2022 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5TWxT
	7bym8Vmbnsljn4lsCK26Buj4mJpdtv1WgDZOv8=; b=mjankSH4VNRAbdW6f/rn4
	W3/DRbGxdJIUjJxoRYkjOY/7s+5RtAmCbQsEoV4VUViqhLu8ua096RiVPjjzcw0X
	k+fbut//SDC7TNJZ3vidBrxO1HsP/1s18EUcb1WVKMoW9tDKyb9O3QH9HhDthMCp
	mN0y9PK7vEKKhzGt0Hmt50=
Received: from localhost.localdomain.localdomain (unknown [115.197.34.188])
	by smtp7 (Coremail) with SMTP id C8CowAAH1plwaF1idaWcBw--.27175S2;
	Mon, 18 Apr 2022 21:32:32 +0800 (CST)
From: chinayanlei2002@163.com
To: ntfs3@lists.linux.dev
Cc: Yan Lei <yan_lei@dahuatech.com>
Subject: [PATCH] scsi: fcoe : fix leak of memory fdmi
Date: Sun, 10 Apr 2022 14:11:23 +0800
Message-Id: <20220410061123.4048-1-chinayanlei2002@163.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:C8CowAAH1plwaF1idaWcBw--.27175S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF15KF4DXF1fKr1DGw1UAwb_yoWxAFb_C3
	y0qF92gF4kJFy8Aw18trsxZ3yvyr48X3Za9F1Fqw1Fv3yUZr1kuw10vw1F9r4qqrWDJFZr
	A34DXr1Yyw4UJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU18hL5UUUUU==
X-Originating-IP: [115.197.34.188]
X-CM-SenderInfo: xfkl0tx1dqzvblsqiji6rwjhhfrp/xtbBshzmLF75djY-ZQAAsZ

From: Yan Lei <yan_lei@dahuatech.com>

Signed-off-by: Yan Lei <yan_lei@dahuatech.com>
---
 drivers/scsi/fcoe/fcoe.c | 1 +
 1 file changed, 1 insertion(+)
 mode change 100644 => 100755 drivers/scsi/fcoe/fcoe.c

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
old mode 100644
new mode 100755
index 44ca61102..dbc202f2f
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -829,6 +829,7 @@ static void fcoe_fdmi_info(struct fc_lport *lport, struct net_device *netdev)
 		if (rc) {
 			printk(KERN_INFO "fcoe: Failed to retrieve FDMI "
 					"information from netdev.\n");
+			kfree(fdmi);
 			return;
 		}
 
-- 
2.30.0

