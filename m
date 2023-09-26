Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D418E1B
	for <ntfs3@lists.linux.dev>; Tue, 26 Sep 2023 09:57:41 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5441221BC;
	Tue, 26 Sep 2023 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1695721909;
	bh=s8rZE6xcXKLHN8Ppy7AnwtG+R/usQmbqqKjeBuQwDZY=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=MHDIJ4AtXPOYLBeeoxB4jBb4KS/F5sja/tP5M1Rk6+iGEasCpT2S+bzvb0xAzDAtq
	 Nq3ZKXuwHJeXFcd9dzFSFbPoD+f5kINThcXzrnnA5rKEKnYxeTiIgUR4Hv2Omp6rWr
	 jvJ3sFLzT7cAF5kYDQtBdiF+K/JU4AYeFJ9Q8XRo=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 9B4441D45;
	Tue, 26 Sep 2023 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1695722259;
	bh=s8rZE6xcXKLHN8Ppy7AnwtG+R/usQmbqqKjeBuQwDZY=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=k2j+Lznppxo8BnNnw8gXtJjteGBTL1nm9pTMCmJptbhGLpSsJj26Gx+TzdfQrC9RI
	 eOS0UGpEdLfWQJC9SluMmDby71fahpUEX9I3L7zWFCsep/GTylbiwKZSYvrfuwW1Pl
	 Yy1CN7MyAIBSIbAbhHgBZzpi17B4YQdBFf14nOQI=
Received: from [172.16.192.129] (192.168.211.137) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 26 Sep 2023 12:57:39 +0300
Message-ID: <b3237e38-bcbb-4408-a4d4-0983d0cc048f@paragon-software.com>
Date: Tue, 26 Sep 2023 12:57:39 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/8] fs/ntfs3: Fix NULL pointer dereference on error in
 attr_allocate_frame()
Content-Language: en-US
From: Konstantin Komarovc <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <7c217d7d-6ee4-4603-b5f1-ebe7b68cf430@paragon-software.com>
In-Reply-To: <7c217d7d-6ee4-4603-b5f1-ebe7b68cf430@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.211.137]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)


Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/attrib.c | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index e16487764282..63f70259edc0 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1736,10 +1736,8 @@ int attr_allocate_frame(struct ntfs_inode *ni, 
CLST frame, size_t compr_size,
              le_b = NULL;
              attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL,
                            0, NULL, &mi_b);
-            if (!attr_b) {
-                err = -ENOENT;
-                goto out;
-            }
+            if (!attr_b)
+                return -ENOENT;

              attr = attr_b;
              le = le_b;
-- 
2.34.1

