Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06003FC4
	for <ntfs3@lists.linux.dev>; Fri, 27 Aug 2021 10:05:43 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17R8SK8E015338;
	Fri, 27 Aug 2021 10:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=no/FDc1aatHCB+2e5Do+ceFlEkU5/j/aHpVdi1zT1pc=;
 b=Cwvw5GRSl49ba7n4qPavQIoJO/NWY/T/GPdvN7RJn7KhsDZelPxdyL0zSAj++4020d0+
 6pw8+JB06R7u82IPX/nY5lInAI4F238yFTkHShONGdaL/oh791dR4tpns7sE+9t5G1Sg
 rGeKjact0h5FrJpObJb5QjGLvb+DWXv+jm0Xd0WMs06NOX4UxSq41Z8q5XsooDqliBiK
 sDE+lVyySI9LT6ZipbBh5ZCcwTyQe9d2oei0BlfSkTk02KEdVoSe4M/baOrdS4UVzkgZ
 DOhhKO8q3C4dXpClbWYDHD4nln3K25c2jOUKvgPNZkW7Rz4oZ/12KacRbE+fZHte+0+p 1w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=no/FDc1aatHCB+2e5Do+ceFlEkU5/j/aHpVdi1zT1pc=;
 b=A0JEcF1jwRvP7vaqPxH862+nycuWY9Yb8IBBQ3LFE60VfDUnsRmThmL4d5gQgmM2z+46
 PJ7IrfhuGVXZcHTmwK1d2cS7EG0m+FkxEDQ9lFSzKvJu5TRoCE0tXh2YGstcZ7GTxl3F
 RjAtl+ugbXI7Uf0QVxbs4Gj500zqktGaicvNWh6DpfxFV+p+YQb/b/91HqrLnC4R8LPX
 vGatRIF4we5LVyd46AHM7iyT8WE2rv68oGHwF6DERz6uae1Z/UaV57LgQR/JOxQjV+ZR
 hzEMb14fo6kKpR6Qt4tQIAntI1LUdcKyDLYa956zAf65wNvd8ltO0TkDuYATYLLvaARU 7w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3apvjr07pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Aug 2021 10:05:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RA5YJt035585;
	Fri, 27 Aug 2021 10:05:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by aserp3030.oracle.com with ESMTP id 3ajqhmapww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Aug 2021 10:05:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJsv5fRkzdK3DVG0/5g3e6uOrSIqng0Gcgvp7lny5e+DrQsuUfBCDMZxpgzIh1xREUy3mS4kcElxuFls16QMofYAEW3dhPR9aTXbSJA9vWz2VMsYuReHYKrQmRgk5jg10Tbjgtew+gMGi0znctOpKqNtXPSE85Ek46Pe5HWBgPitbp16O8jNzWKrHY5nZhPmGKeuTffIDmNH+JfgFpf4/GVDPZP4tqi+0ZzD3jEzUTP6oNr1j27Waoq0BI0men7x7AJag5KpmDBRnKa7RVsSmpLsLIrzVG6Da7i6rAASmZNAIt+DLlZy8rH0SnIPr8aHMo8TnRFZ3Is7KcmPEpw2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no/FDc1aatHCB+2e5Do+ceFlEkU5/j/aHpVdi1zT1pc=;
 b=K8NcQcYwEUCv3rayenO2vY6hthWGyO7ibFxzOBaCOvIUXcdtlzwseDLINVc5+QJCidCnqpDz6gILkToK3rSb6sH1VR12aZHMWLxpDJ+qsK54hITvehXGbweayZxj2cen02Zmkj2hNC6GceNrq5MXA0WTFignnYk2h69bJaieUpByTxOTQUoeY4Va5A7KJMmr05tDsBZUZ44jUdpgrVMq7v3eR4NWjx2uz9gcA6cgtFe2BHVw0PUXJ7rGwxndfXi6YsDeB6emxjVuZgmqWhQlvrumuukHhNsmbbfgWRrip4dlwu/X93dGJdiHcogZWVMpGruHvjvjijmmN/jExeH+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no/FDc1aatHCB+2e5Do+ceFlEkU5/j/aHpVdi1zT1pc=;
 b=lko81CD52Wqv0Bbzg7CTrXBbOedLi7PkMgK4ITnY4MmwfssVg7qZlgax4HovWgD7Yma4jK5ODenU4wcb3uHnrP65posJ4ycFjbaAL0s+9ubsu0uYg+DF3TNbsZSRL4bLbkIFqtZ3xQvjnGcQNEdnaii/IvuLA5OE4LSkdMCBTMI=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4689.namprd10.prod.outlook.com
 (2603:10b6:303:98::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 10:05:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.019; Fri, 27 Aug 2021
 10:05:40 +0000
Date: Fri, 27 Aug 2021 13:05:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Delete dead code in ni_write_frame()
Message-ID: <20210827100528.GC9449@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 10:05:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83184276-29df-4ad3-7074-08d969423946
X-MS-TrafficTypeDiagnostic: CO1PR10MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB4689C3E7C3E7AB5483CE1C9D8EC89@CO1PR10MB4689.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	izriqGpp14sRcJpoPIwxTxD81ass74YtGF8Djd7FkSMNGgJu4UMEXr8xPwjpWxEfWhRkoMVPFlAe026UYmlt6Uxn3FELQ3scyJoMH2f9VCA/LhqRHPdPB4MeuxbWvytu19Y45ajzGpOVy9SHC3MSkjiyZk0ObOjkzR0/EFGjmyIcKiCWIsXS8pmXQraK1RodQP9hVsCOSeYLtst6rycv+RPBBKQ5h+RFEP7y6bHM0wY6dXrzCtdPsWYvBbcOg4DrcoP567g4TKKOt1lYSrITMT6Fi8P98QchltxmO2bEO6Hfqu70U4uyWdlWzvaOKFoOsFUTMQtxI95052yABTe7DMpMR4/RdwBE1dVNA6A2FLZFbdcqioL+AR9suHCO0HeFA3CtiWlYlr/mtB3tTi+FYx7eB/qK3rreWO2bgbcFlfsaKXV35Bu5nHpHqm7p40AfPwShqShCO3UwvHM5vqbcHBRLmrsNFojVElfb/2fFzxBGH1Aw9F3nqudwIAsgm/Hpd9B5Vgs+qlSZNaOt+38QvOFTkThjf8h2GX5Ml/dtDTL11rXo9+mewNHOA6gXQh+IZ6Spf26A9PVZcw39e6g6kz+53+iF/aumItubrAp/VVgI4XBihJ2eq9Hn6dKFkSQpi4r4qXNxjYdgsI9187vE1NYH+8idDmIfSMHYzE91PK/8ymrMVjel7aPRfgzgRIdc233RW/Mtqf6b4Yl5AlEIrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(396003)(376002)(39860400002)(55016002)(66556008)(1076003)(33716001)(2906002)(9686003)(4326008)(83380400001)(8676002)(5660300002)(44832011)(186003)(33656002)(8936002)(6916009)(52116002)(38350700002)(38100700002)(478600001)(6496006)(66476007)(26005)(66946007)(4744005)(316002)(6666004)(956004)(9576002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZJNaBjeHkqL5CE7ubBMIlWX+C+mbN00jodMQVpCzbuHcp/PdGTXxaUG9Pd/H?=
 =?us-ascii?Q?NMwSMNwefyFrqfjJN2Lx5atsdG/Peu4XUeTUMXtgarIhdZ43mbmz7vmrZxpe?=
 =?us-ascii?Q?QwKY+8DqDpwIfqVLPIGLI6cObLayYEwfMnPalHifZ9/VyLGSI9rAExgGi6mm?=
 =?us-ascii?Q?m7+0iZqo6189zbSxHS2CsSt0GnOr8xb/o5VkkgQKfrW3on4PQKV4WZJ87mGl?=
 =?us-ascii?Q?Zebn38c31/uRBN0VP7nOZFhws4LejBt+Yci4xnTA/k9PhOqSX4PR2marQhai?=
 =?us-ascii?Q?MAFQNvxN/+mRT6ptd+qorTxosPkaqJm5+vsHRqAhW4C/MggRc4Nrhf72jp3Z?=
 =?us-ascii?Q?EzcBecTnZRNsqWsuKVEvNIvsRwGAOJL3tPmLaNN3l8L0gmx4K5qu4dmrfl0o?=
 =?us-ascii?Q?j9H4Ee3Chg4snMwiPwf+G1TfkZj71kZWv1FsSSj4DRbXdCQqeX8BS1+0+Ngx?=
 =?us-ascii?Q?To8kN81uv1qaQi8HWHuTH4myPxDW4bKO8YCzHXE8gDdkB54qjIj43yScWo53?=
 =?us-ascii?Q?ZyzjM/NzHWriK5wQfAdbydSXZVrdWpGZXDWQZRu/gxg4jnT0KFHk91g13Ay7?=
 =?us-ascii?Q?OlgQL9H0uj4OaTcN/YC50mQ4vNMyXtH7FEXX/xH5nhoz0YuqKy7164LbtBDr?=
 =?us-ascii?Q?oRzqHUcBwUd24kwX1KzknMNuMSs1h02+deh2cZXauvdUN+FGIUSmVYI6gmOK?=
 =?us-ascii?Q?WQor1FnZ6Bz3HRo5DO7muyqi9pkvUhkR378tk2rsejhU9IlkLSjUIGHwuvvf?=
 =?us-ascii?Q?4aaDrYRkX+xLNh7hbForPNLFLNRcPTCg8BiUK2sGbj9J7CZGdJua2z9lQVkl?=
 =?us-ascii?Q?WhBaLpZtPbHgB0jL0RqqkAySRiUWAMGnL02IyAe9HF0Pgqm7TSc3rM/JxI96?=
 =?us-ascii?Q?raGWBXD6+CbSMOMwtpopbMDTNssqRX3HcTaxDJ24vTlV+jZehiPlrqdPfnI3?=
 =?us-ascii?Q?3afa4i/3Vtt37m15smrpx+mFo09ZUR5+1xz3xIEyiLXNeYWbD04S0I0dJw4Z?=
 =?us-ascii?Q?5Fy7TpC8DkdRXY6QAqO4R8Lc/vnSBFN53XVrLAy3FgcDO8vBlaHHltd7MMmY?=
 =?us-ascii?Q?c/6PTAie9tklSFOyS8aUrqRHPrBQoJDnpgloTWbnET8UhI6qEir8Lkm7Z3iX?=
 =?us-ascii?Q?/SpSEAsWDoEUzFOUvIWPjNDBGeG8l9rFymwaat9xEbwfixKXggSA3QoWXfhq?=
 =?us-ascii?Q?mfZaaFTZR1LKe/8t1Wc3HZ29S4R5kJWE+amEVwYJ9pI6EDqjUXLaG9bTf3CJ?=
 =?us-ascii?Q?c0tbeX6AW+9l5WO8eyaYoSYw9f2K+uzuuhlQpIiqFFj3awgWP2euZYg6KpE8?=
 =?us-ascii?Q?7iEQtGK54zdP8EgLi+tt1bnb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83184276-29df-4ad3-7074-08d969423946
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 10:05:40.2355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 208rdw0NL0e2j1SR9HEi+OoNzLqQT0eG/gD7sQ5ctMYrggOGlleKDhEjFxGDMQlkP0oE3/Dsq82yw5fSR/59yH0yZ6AuBxZQ9Sz5W+capCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4689
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10088 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270064
X-Proofpoint-GUID: gRSUFUjxtjUV9i965rL_rcWZSkVaP3FD
X-Proofpoint-ORIG-GUID: gRSUFUjxtjUV9i965rL_rcWZSkVaP3FD

This code sets "lznt" to NULL and then kfrees it.  Kfreeing a NULL is a
no-op so delete the code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ntfs3/frecord.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index c3121bf9c62f..c1a9f124f771 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2742,7 +2742,6 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
 	}
 
 	mutex_lock(&sbi->compress.mtx_lznt);
-	lznt = NULL;
 	if (!sbi->compress.lznt) {
 		/*
 		 * lznt implements two levels of compression:
@@ -2758,14 +2757,12 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
 		}
 
 		sbi->compress.lznt = lznt;
-		lznt = NULL;
 	}
 
 	/* compress: frame_mem -> frame_ondisk */
 	compr_size = compress_lznt(frame_mem, frame_size, frame_ondisk,
 				   frame_size, sbi->compress.lznt);
 	mutex_unlock(&sbi->compress.mtx_lznt);
-	ntfs_free(lznt);
 
 	if (compr_size + sbi->cluster_size > frame_size) {
 		/* frame is not compressed */
-- 
2.20.1

