Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C035A3A759E
	for <ntfs3@lists.linux.dev>; Tue, 28 Apr 2026 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391190; cv=fail; b=Moqm5PoyiHLXhbI54MhLxFttG5LFEnK+Y6P6ZOG5LHHf6O5e+wUFey/RroQV0QuOgd3wYvR0m0eUS7AWQ3prWpTD9GdTbbk0uZBDTgq/+S0lpfTO2esAjlsNJVviTHv6nqf2FrTfe4LCL7/buZ572hYLRyr1nakXeMhh/N5v+lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391190; c=relaxed/simple;
	bh=oS8EgiyJ9083ceNj42An8X5t9CzRfey+N7Y38luEBYA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YzNPbj0Qavx/5yGxEVWI2uJU3zyApdY0RUY+JgqE30EOTsJIApab9vm740uLis+8u0ieJ/gsrUbZih/c5/Cb5ZmTNXzgfthxJ0jlUuqmUvm77AeZK6XPBxVzKV0hmOmZ0FBuxxC6wSQ7WILZdkMcRRXTqSzJBb6jPXxOyQjrlX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZfWGiQV9; arc=fail smtp.client-ip=40.107.209.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZfWGiQV9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8Ofu9LJTPQdDuDwSuofYJSu7CNXqIUuJB1rTO9QiK8fXU5PS4syiioFhj1+ow1lE3Cdcoy5fyLuo6VXFTQWQnsTjh3CRL2Auezzf9+ZZ0FrE+r0mGj6GXjRb21HicNorDavCqFW2EhjE+9r4dUhl+wnloxBj4dDVU/4QcBd0jS5mg4WD7tRuytz8tsqdhy4/JMZhxKvrjt1Hm6q7qWqQwme1spW/K1EJOyD1U6dwC91Y5jTNRSQ4oVJT1yNuO6zyZLSa8XZsHRlR/if2HR+syWIzk7ml9H2vTpyG9UpbqUhCZ8OznRH4pznjbc1rJudx9mq20cYrCKOV+F1KhORQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugXUmWT8iAjzqGs/XdCqlE1m3hlYMyiUg8U6kVzqLkw=;
 b=G9yCPrwuYW4n4DTuTeiEMvR0MZkIZlTZN/91lkYZ79BM+d6iJCRyRI+o8iFYkeTap6NrVALup9kEgnq04LVWpf8JUYBmgnpUgFP39HGuTWTsznZZ5unGgOHq5AbKevpFoySmYQGO2K+b58FGYPnRV3zsWvXbXQ2sI+v9y8jVdL+mTrlHuKV1WZ7lTslZZJDNS/8WjqNnPYqgtsAkD8jmOhACkaRKx+Zcwj3/EMVhe/du3tY1XXJIoh8vPSUZcSSq/YK9Da+71NXdF7KQPPCjQLqfophZsKP49o3HvzAClzlXPF/ntC3cJmcBuiztWl3XGPUE/MgSpR9QpYkkIJEetg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=paragon-software.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugXUmWT8iAjzqGs/XdCqlE1m3hlYMyiUg8U6kVzqLkw=;
 b=ZfWGiQV9bJbkGjdWraKVVsbBlA94Db/UnqHAUpwE6NQ+z75Qrw5Yb62fvhLIS0d/QHlR9GMoIHMKAUX6cYXl+p0oDYJG+mgHq6WqCaw3/50cRdV9WZ3qHefi+ceOWf66WRNLJFFdwDEUBfLDiIOtUfElj6v2Vqo2KVcWl0UC6Sa4xWno7258u0ea+aPgk0D2iIsDB2mOiMc2Co9cstnBhA95XW09w9uDApjZWoVtWoB+RnZU7FAemVpGaKwo7pHD01b3gxqwdp2/XsG+TAZCPim2qBtll2Fm3b4BKa5lc/ichGUOcl5KcBuKJ8rqE/pm6trWYFOJqqJeqZo6wl4K7g==
Received: from SJ0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:a03:3a0::23)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 15:46:20 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::f8) by SJ0PR03CA0258.outlook.office365.com
 (2603:10b6:a03:3a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 15:46:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 15:46:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 08:45:56 -0700
Received: from localhost.localdomain (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 08:45:55 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: <almaz.alexandrovich@paragon-software.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<jamien@nvidia.com>
Subject: [PATCH] fs/ntfs3: fix mount failure on 64K page-size kernels
Date: Tue, 28 Apr 2026 08:45:49 -0700
Message-ID: <20260428154549.11902-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 9498eaba-0d05-4149-ceb6-08dea53d4a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	imRk+grvG9zPSuIPMWeosSgERcKpsNQkfGMsWj77ZopSmZ79Ix6zBVm8twCTbPTmo8XWiiqqTKPa7mRNCIY+V0RZktsgEVBaB4CtOfvRKk2U46kKEcrEkR5OtpxD2PlCA3V1NdS44NWdgFu3OK7q0CO9DeQJRzlheaFNEKaw0oDDKEeN0ZEUGwjB06yha0fWa5wQ7nznEkrBfpEtpF5/2fnezZ6BHseC7oFfFWUK5otgN3l8DOPkEaGa5Lqfc0at8durEQldwddiQlkdFb/YdQqEmhGbrxKu04aNg7clEcOhJ9C/5HYj2b4734+ibdoziuusNkV7bW+h9FzSQrjzS50zHbVYKgVTupUjzvidn/BkcvxNieCsFA/kNngW63jHwdrCyAiu9So8t+TS3c9nSBDZ0F0DDk+nnjzuKLHcAbxsRWl0Xk/rdgQ0RekSP6j42TRkwxnFRFT5IivVOfm+fleU0xyBDicVOi+IL0u/WIXcDGWh8RpKBAPdVVw7qxoKehxtfQFElTqcHUjnOdc8NK+xPHcg6VWKhuKLRXlpTFzItGEbglEYY6DHwQVCFu7DfZRkA/3qMTht1zjzaqLpF+2kbvcFNzHljge6Pu11tJbMQkfpqw9DJQ4+YEVWeoA7C9cUZobF1eYLO8Rl8yGXHAxilpIq6pb3Vdb0yshiVMo6mbC+DHw4y+rvBEkZqPx4Al1+tAoCgbSpVp67gmwVY1TqyskweH6IOpZhGLSBY3icVstibeim6lCDmmSV9/elgvKbo0x6FLHwQrvXaW8OXQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5AUrVo7HACV2XpzH35G0v5i0Jmd/iuvUrdn3AiBPEC1+xGw60AMnpHRpRnswbVSOR6ukqwFZNPsSljADH6kbkZDqxrPXgPPFi0xQKI9FgkuXpdgyPxKLKSfTqqYXclfjSNRuPTSlG4/VLAx+YpOk+MJvOwAwoCjk3vWGouE3+a7nqe2gC0dfKLeIoa+ZJWp4hvA9Ign1gfdUKkY70Lci1Td7G1qq2eQDHUGyEC9TbHAJLQeARUstlO8EWiapt1ve0kfi18O0La3frVB7aP1r8wDHOvUodH0lBy/txxOxfBTSJGwB3wU/08NiMtOKfIBHpl3HIBVvk1+WXm3WOxeEQmRFcFyexEP41hEWJuO3y75Qkey6ViO/afbGImV7bu4+EEMdai41FOJC0uAeWEMS0ylAXpij1lKw+z1axwjgPRFUcrObspGxtoJ9WpalAb4B
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 15:46:19.4862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9498eaba-0d05-4149-ceb6-08dea53d4a87
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

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

