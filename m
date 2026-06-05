Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F842253F13
	for <ntfs3@lists.linux.dev>; Fri,  5 Jun 2026 04:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780633200; cv=fail; b=UyWtegp7gDw2ZDFPFvfgynahiHk4xH+P+mh+L9BVM9T4U/WFjPl2iLo7BTS32D9vVX/iE0P2DkYeYymJsQcac9461nCwl+N1MMR1aZt5mnvZMhd0HWhXpHVV0Pm1UJvMrNtpBOhi7Vzz9yapU8bkGoJQybEYXgfGcvY5F+ua+bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780633200; c=relaxed/simple;
	bh=ViCHdqAbvBXI2sGr0xiWsw20P/9thRkd/hQgxT2fG1Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h7fQceLo1AUy+Zqh92ET5e7rtrkNLw9oHKbxbKS/PcQgOKYtmNhhQkKjCkK7AIcBmhoDCGJb065Q9oFlyF1UJ/YWYqrA1iOyner846eBIZkIjYt8853+n0/C2j6McOuK7h7JrNiKpm+kq3woghrDwp0jXFM6GQAaKods9LL7vNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dh1bNO42; arc=fail smtp.client-ip=52.101.57.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dh1bNO42"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAu6QvUGp1zICviShiJgC59rzyY20Iic7nESFfRPbDegDKMwcePYG2UWPWazAZwJmRjxZqdc5MlBr/333kOa+Jf7plQN2CZy/PrZn8gWHecHeC1U04a7TTQGTnOCtKSk7oBFp1VPpDkEQBKo9o5/LqEPR+DKXrvAOe6l0j3CvC++c7JDvG1iDG3S3H1gFsa12gNU9kpHT/39IG3KMnw3BVgteE2jUC55r03r8e6Wgj1A6vYJHXt0Id/hrpQyqwXZ/F154yPI6+3/08f0tipIFJw7O0bg43H1jrq74YxyzrgWB5Hlr1PjqKDBxsx9WrKat4VjrMGG7fE+UoBOjAzFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc6kRudaw429lJkWOlZ60GIZyEcyvK4h/Hp0vfrSO4A=;
 b=sWxLOJ3cwWSoKEmt/0+zn9XQZ4I7AfQxi/WXiYSIpVWvcWoY++MYCLiaCZQaez2/XQ8LO0sZP5uf+JsfW9v/vvTvS8Tyb0o1X41p0NQJ4GLIdKHbmxU1wAwNSlb6/F711cszHQZG8HDGFdd6TKL3183y6yXHJ+0wxZzawGLfFm7wxgCepEPNwIjFdV1e+k6Qv+VcMAY+hAcOjHQHfeLdpjTZK+/aDjdvz+cFFGX8O7WDW/ZgvO7msapg/gBK5EzoVxYmSxd1Msj2YU+H7hGfo5FZs8YmKrjJcUmSz7zCY1ifhdmH3PhfOg12qcDyZyyO1/hdcfh0TS27VGDiuKe+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=paragon-software.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nc6kRudaw429lJkWOlZ60GIZyEcyvK4h/Hp0vfrSO4A=;
 b=dh1bNO42yAfhC5Z7T5E+5mADnjZDUgXh9JYAsYy1M0N+rrSYDUaX4XsxHWOpPuaGnRa5OlEieo8ntLJlyxwXmcxQUnhEZW5LdUT8NTC3ADIIsAy/7UfrauSfLC7hrcLaitygKSe6dIrk4apra6+CYOvBkqQs3dRfS1Xg2PODYZiqUzLS8jqRVVN78O8EVZV4tRlcUB3MbPAAY0Ln0zHbkuVS5/OrGO1RNG/NFJrEKAQkDUokdnPEhCeGaiHlz+ExiD+gzkX1RcllZfJZjUu6WM1p7XoVNyp7X/9cpH6Ue9TkT+dYAnEj/qj+1Ssh30KZClgIPdMrRfJLv7VxOCEOAw==
Received: from IA4P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::7)
 by SJ1PR12MB6099.namprd12.prod.outlook.com (2603:10b6:a03:45e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 04:19:53 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:558:cafe::18) by IA4P220CA0006.outlook.office365.com
 (2603:10b6:208:558::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 04:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.2 via Frontend Transport; Fri, 5 Jun 2026 04:19:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 21:19:40 -0700
Received: from localhost.localdomain (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 21:19:39 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Carol L Soto
	<csoto@nvidia.com>, Jamie Nguyen <jamien@nvidia.com>
Subject: [PATCH] fs/ntfs3: resize log->one_page_buf when adopting on-disk page size
Date: Thu, 4 Jun 2026 21:19:30 -0700
Message-ID: <20260605041930.68817-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|SJ1PR12MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: a1adaea9-52e1-4568-4ba3-08dec2b9b0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	oGfso4sytOO1LWg/lv2bCEN/zZJp4XGTji8pzI5OkQO4GdpRTCAU7RTNYUQ7y2YYdAt3fqTAXBVFv5Ab7KW4T5QcwUzFljCsLGWO6WJ1ivFWmvHGb+y8XJSVQqHKZVqqmNFtgyUyCIwi1Gcx+HykAx14BaM7T20VjEnfg/SfJfzrtkXcdewhkJLacejSNJLKLMrX32XaYQrFdqRtZ8QXhzLWODUKgJ6Df9b4iXK4YjUfUWPgg7NhC7ELELou8f5AcRECi871UtMrNbEBe251gfdiz0xl5bMCdyw3H5TV5FaN04LZrPcBEgVmtJSBBBt+wpRvxQIlVhdqYjRMxk3rOG+/yqyEHa6Nrn6tVk5Aa8vVBWiQ0X5sywuB6NMh+iziCafF+ePICHR1CBX9k9gDhBPNuATj4+PP7kjy8o68uOfM7hEGXD/BOHGNjpkwf8hJcBm296fKA8J96Ik5SpylibG3qlHU9j/V6mjY0Qf/1jCqAfORSMy/DaXt66yNTeE/vH3achLqFWnhZea458+g52TZdnrMIa4hVjopK4UbZxk5e+jHAzNNZynLfP0LVHJo/PlAjHegDG6WmeHCmc+nIjpZ+phUgdw0bUU1xmY9Hn/7A0yybRkv3CqKjhtjNINyDBgQpWam0rSHxkVXdds3yPG1a8u2Bxelm+/WMpk6QbSonycc/zWlLJK4LeGWU1KIiw4MJBkzwIECfaBJa3iDUSWEMV9dmIr5uKBqurH61Uk=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	daq1V0ti0OVFJBlVOaEsF/1Lv+bZaiWHYDDHXumeRlOjmhNwKKAKLDuh10h+TRI9uQpn3U8O10wa62TrV9NueifReaTQSEw/yupxrlc1jVWZa1G5LcPlc1GF73hG8gO9gBZqQ9UFTKRobW8JKi+bM/XiwZr67Cb0zKwUG6lXAcGdNmurp8rT/+tlOuC5pb+JpVow5SW4tMOrnn05WleHJgPV6lhTGkJ9WkrccTCYSRzjAk8VlsXdxKFx2X3SF23B8nIN35ZOsrlbKqIK2V9SshudYfb6mCL01QSSweYHE0txhaoWRd9xzOTUJFNgAqIGmfgyPdvMM4RN6G4lVRm4WMxi+RjyYHbobTSNsgMhCadzCyVK5eIw+nJEzHfLSFe9Rxs8gplzzV2Ls7tqUgk7V+nSKBfNKkA1FtRzp6KrBx3rt3ANgdnEuuFEguxk5lPU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 04:19:52.2043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1adaea9-52e1-4568-4ba3-08dec2b9b0cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099

log_replay() allocates log->one_page_buf using the page size that was
chosen from the host PAGE_SIZE:

	log->one_page_buf = kmalloc(log->page_size, GFP_NOFS);

Later, when a restart area is found, the log page size recorded on disk
is adopted:

	t32 = le32_to_cpu(log->rst_info.r_page->sys_page_size);
	if (log->page_size != t32) {
		log->l_size = log->orig_file_size;
		log->page_size = norm_file_page(t32, &log->l_size,
						t32 == DefaultLogPageSize);
	}

If the on-disk page size is larger than the size used for the initial
allocation, log->page_size grows but one_page_buf is left at its
original, smaller size. A subsequent unaligned read_log_page() then
reads log->page_size bytes into the undersized scratch buffer:

	page_buf = page_off ? log->one_page_buf : *buffer;
	err = ntfs_read_run_nb_ra(ni->mi.sbi, &ni->file.run, page_vbo, page_buf,
				  log->page_size, NULL, &log->read_ahead);

overflowing the allocation. This is reachable when mounting a dirty
NTFS volume whose log was formatted with a page size larger than the
buffer initially allocated on the mounting host (for example a 64K-log
volume mounted on a host that allocated a 4K scratch buffer).

Grow one_page_buf when the adopted on-disk page size exceeds the size
used for the initial allocation. On krealloc() failure the original
buffer is left intact and freed by the existing error path.

Fixes: b46acd6a6a627 ("fs/ntfs3: Add NTFS journal")
Reported-by: Carol L Soto <csoto@nvidia.com>
Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
---
 fs/ntfs3/fslog.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 95e1cdb47..b44bcfd31 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3976,9 +3976,28 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	 */
 	t32 = le32_to_cpu(log->rst_info.r_page->sys_page_size);
 	if (log->page_size != t32) {
+		u32 old_page_size = log->page_size;
+
 		log->l_size = log->orig_file_size;
 		log->page_size = norm_file_page(t32, &log->l_size,
 						t32 == DefaultLogPageSize);
+
+		/*
+		 * If the adopted on-disk page size is larger than the size used
+		 * to allocate one_page_buf above, grow the scratch buffer so a
+		 * later read_log_page() cannot overflow it.
+		 */
+		if (log->page_size > old_page_size) {
+			void *buf;
+
+			buf = krealloc(log->one_page_buf, log->page_size,
+				       GFP_NOFS);
+			if (!buf) {
+				err = -ENOMEM;
+				goto out;
+			}
+			log->one_page_buf = buf;
+		}
 	}
 
 	if (log->page_size != t32 ||
-- 
2.43.0

