Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A639C3B47F5
	for <ntfs3@lists.linux.dev>; Tue, 19 May 2026 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779219777; cv=fail; b=N/Bp4NkGLqgRIlf02D0WxcGnCUoTZW303vvPDkozrgQZHzyd4vNbnnV8BwSst1B3O5EAnpjKK2ag7ZegOQ9BIJ8VDTmgZNITzMI7LAmk1+3lJlyODNz5qYvYTMLAElXZM5dcX/jz414KOmE9Ive7p0mIZkyUFBuPpBweVTyRfwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779219777; c=relaxed/simple;
	bh=Q1MrHT/iT/9jM+wTnvm+DnjOreOOfe2M0A0AvKFi590=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GIWJnWp8a9Xkmu7s0dsdx3PCql7iNwhjzII3T3q2tgb3NESmMqIB4w6zj9bPwKQdHEHjLazY4dRsAZnYZAkBnln1mORoJtlIRK1x5LxNWiAFjrukLJdkZasGa01KhyYpkB61V2a2H9+lP5/Yz5zljBondlmqCm/g8iiZb1oE94s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fRu4iXPq; arc=fail smtp.client-ip=52.101.53.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fRu4iXPq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4yfxCqzfgYCd+AaHYQyFz6R9C+AhSfykAJY6ksKqVh9vbWaVjIUpwd0QdY9WiN+cuhldg3iFF/8ExgIgh0Y1CiNBybSZC6JJUFjguG0xb5+2Iuwfq3Eg8UPvaK0dRqtT3Vs0CGVU2X+8A6If/4KYPzvAm5WdmoVOEnKSjNLX8n7G3K/pQEmy2omLiri18qTt39JhJi48XIR3yQjAYwZgynyCoNo/sLAFaSId5QjYf/QdFEfCxPKcSBi7d6Qn3OawuCcmOcjP5uyxRKVmELbccXQ/cWrhWxVu9AR/R/YE3Zc5hbvb1Gxaj60+trvddU3rj4MDKSZ7F1f2vxHy5/VKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOmfw19KhH2+K8dfk/rtNCsPvQlP+3NieowWamXIbxY=;
 b=Hn85Yd6LX7Cbf1tQmVINv+n7o27AfsT1GX5Xjv+eNGDQGy6xBp2xV7yMWoTpE5rH97EcA+sG3g/2l6sTMfOVsdR1Gmf2ryKMIE7L3AzEo+Do74NqfetHFC5DkaKiCsmc0vfDG3aOR+6zcCKl56x+x9s45GfPFKWXP5RHdMiWw2naux6kwHMqFjawvoIFj9A1p0Jp4jkgmI+CCR9pLgBl36LNWzTiFJ8L+zbN2+uFxfeLLokJEo+bK6Arfxa98Ke2fWInm12qGHsfTjsTkXDnXfjYokFoXCB1ac2FsycBzUA76nmNimJt7Bea2CTJ2I2g8NpwdIjr2rD5XJaVNSwgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=paragon-software.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOmfw19KhH2+K8dfk/rtNCsPvQlP+3NieowWamXIbxY=;
 b=fRu4iXPq4EsuDP1mgI4+enMvefto/B3XPi6PsUn+G9y4yLpWfp6dSb3xGDek3O5YmBg+fjub2QxIS6uF4z7aF6Qxul2H/r2Lz+cIbQFHQSAaXnzUc8J5zvLUl0+3dA2kNscmXtNs1+0R0hhUSoZxD6EBv70b12F/+9XEqaejZX0cR/g/uTAc4l30emhHWEtMFaAbAKR9dUiqD82ojKlI45NcODxQ9GSBIHnAc/yi86d0/Fno/RZFyhEGv4fL8826JoT1xWixhONpvg6q1FrA0TeT2p2aHOjh9Cad9sf9XThqTsjl+gkHRnZoyHpbIVi9kK0I9G7NBZeYwTDFpdR66A==
Received: from BL1PR13CA0449.namprd13.prod.outlook.com (2603:10b6:208:2c3::34)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 19:42:52 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::aa) by BL1PR13CA0449.outlook.office365.com
 (2603:10b6:208:2c3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.15 via Frontend Transport; Tue, 19
 May 2026 19:42:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 19:42:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 12:42:34 -0700
Received: from localhost.localdomain (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 12:42:33 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Matthew R .
 Ochs" <mochs@nvidia.com>, Jamie Nguyen <jamien@nvidia.com>
Subject: [PATCH RESEND] fs/ntfs3: fix mount failure on 64K page-size kernels
Date: Tue, 19 May 2026 12:42:20 -0700
Message-ID: <20260519194220.58114-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20260424203111.77214-1-jamien@nvidia.com>
References: <20260424203111.77214-1-jamien@nvidia.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bfbca13-e906-4fc9-6c27-08deb5ded0ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lR/T2o0hRP3lOBuVcV8TUgyOfINK/8eUMBcRAqF/zsTYvUwkHV7ZSwGzftQpy8fx4O2CAn4PkG9NlE4hThoXc20tHTccrgzBpQw67UyGqgj/xn6lHoy0JltOYXOj1vmGxLEqmtPfJNJGwfHkAlTvoHVc6jIkNLEPH/F4daTBc9a+aw5ts8Wu5MLo3oz1usl2Syc3knD8O5GJ9odiQf87buaIPKn2Seh4MGK/laxv6LiP7LA2M9hV61NsPn8ETB5FU2BRsBoIFi/HlOqahDVa1y5sXz9x9YnTEDTNgpI/5AJNAvRyU9i5HInnZWqVGzqoPehN1U+UzQUPm2iC33blA7RlA5b2bmCjrLwcH9QiPU+AWWntsswgNMGvy4VO5vWBXrTsh6E7FWxY34q13mc2bd6tiJYQh/VbpqfuZtfs0du7k+qmMy6I9YCTlunTeHItrh4qbMmfZFjE/09GcgiiVAIP4NIBRDhm27mwiBOK6jiRQ87MhGyACLB8/ROElNHMaJ7bjWsTaJRu7gFriC1sVAO7pnbilid+JaBSrURXCJDw7unksUwvixrG6DjFkjxun267hufXfpLhxAsxohGYl2iwxvTVVk0wsaa0/AbUbajta4ww2aEVQY0RGUNzgpNr8eb7ek1JrjpBNG3iNS++gR89ud6/KcCQtWaPJWPGdX0TsDcvTCA+oUViWCXSfuxjzP/PZ0XIub/SfIu5SxY56drV++RNZsNn4+/V5Y38Qr8=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tes7jKMCq15zF7amQuCmDdBBLwjbXzc/kjn4OHauKuu4bMc5cmPuyN6cxlCNBPwyxo3CblQuHVwJHS3DXYIfH9Ex99N0nzYBl25dC3qdv9GJBWisgqLW9058T23vZ5v/QPrtsnor3GCg9RicqvwcaxCQRvgkTlHz5xTGtHv6wumYsOcUrSzWXArKJPGR9klrbuC5wZ4GxrPhJU4RMuB+iugcd29Fh1h06/U/M80clCMwPfgcIMPShxq3uJ+qEXtZZJk/jchGqngIMTdf3KDDxjcqK41t06qNpF2WKohjzDdtKwdlkny2IivxnVQ1fnipctuesFSi0U288eWU4TMNo0p0w+1PKQ/nevYHFcOKzHwWVnno4rbbxHDDqD6oAWNtJJnPuP0BqN2aS41jVUp2tu1bEmzdHdHhT1lONdI2TyUT3acBI5i3jTMRUiAWet80
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 19:42:52.0566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfbca13-e906-4fc9-6c27-08deb5ded0ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245

On 64K page-size kernels, mounting NTFS volumes smaller than ~650 MB
fails with EINVAL. The issue is in log_replay(): the initial log page
size probe uses PAGE_SIZE (65536) instead of DefaultLogPageSize (4096)
when PAGE_SIZE exceeds DefaultLogPageSize * 2.

This makes norm_file_page() require the $LogFile to be at least
50 * 65536 = 3.2 MB, but mkfs.ntfs creates a $LogFile of only ~1.5 MB
for a typical 300 MB volume. norm_file_page() returns 0 and the mount
is rejected with EINVAL.

On 4K kernels the #if guard evaluates to true, so use_default=true is
passed and DefaultLogPageSize (4096) is used, requiring only ~200 KB.
This path works fine.

Fix this by always passing use_default=true, which forces the initial
probe to use DefaultLogPageSize regardless of the kernel's PAGE_SIZE.
This is safe because, after reading the on-disk restart area, log_replay()
already re-adjusts log->page_size to match the volume's actual
sys_page_size.

Also fix read_log_page() to pass log->page_size instead of PAGE_SIZE to
ntfs_fix_post_read(), matching the actual buffer size.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
Tested-by: Matthew R. Ochs <mochs@nvidia.com>
---
 fs/ntfs3/fslog.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 38934e6978ec..4a6cfa3441d9 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -1170,7 +1170,7 @@ static int read_log_page(struct ntfs_log *log, u32 vbo,
 		goto out;
 
 	if (page_buf->rhdr.sign != NTFS_FFFF_SIGNATURE)
-		ntfs_fix_post_read(&page_buf->rhdr, PAGE_SIZE, false);
+		ntfs_fix_post_read(&page_buf->rhdr, log->page_size, false);
 
 	if (page_buf != *buffer)
 		memcpy(*buffer, Add2Ptr(page_buf, page_off), bytes);
@@ -3782,11 +3782,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	log->l_size = log->orig_file_size = ni->vfs_inode.i_size;
 
 	/* Get the size of page. NOTE: To replay we can use default page. */
-#if PAGE_SIZE >= DefaultLogPageSize && PAGE_SIZE <= DefaultLogPageSize * 2
 	log->page_size = norm_file_page(PAGE_SIZE, &log->l_size, true);
-#else
-	log->page_size = norm_file_page(PAGE_SIZE, &log->l_size, false);
-#endif
 	if (!log->page_size) {
 		err = -EINVAL;
 		goto out;
-- 
2.43.0

