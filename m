Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75962F2A
	for <ntfs3@lists.linux.dev>; Mon, 12 Sep 2022 15:09:06 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CF4wAa010791;
	Mon, 12 Sep 2022 15:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=7mSvfsFPmVIHF6pvN2AQWshrTDNMvVNirVBt1GIdi5E=;
 b=Fgf4U4up3lAI/iX50LnxiYdPbIFFIq/5x6OajJADRHvJ/FJdfJ+RHeZncf6uICnvmy3w
 dv+/5eUrrIMM29ReYZdK6STQLuXFPDBKcOcdyuBAlMP8ic5E0n0sp1O3PbXJfUaJbU78
 6U/gVFnBhvJt6bJMIqizTJseLCN57TfqP8b/jP6DtJUVCh+mlo8XuSqHrv3A5UrDN5D5
 hEsrQJQrVhOG9jcVzgYJI9d3SA5ubgOPu8C/+6jlOwYYfU+z2XRSiS8SRATZYELhE7XE
 nint6yHJH69jkX5zKmDmw5ceA8JYR+ShsOI19GqOuauSHiuWdm7JGAPQL0b/rgGNGSyq 3A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jgj6sks1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 15:08:59 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28CEt8E8014670;
	Mon, 12 Sep 2022 15:08:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jgk8nbc0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 15:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/+LlpP71rDiZTDpRexzlgDdc4hC2iN5eJetu6ynZA2V0dn9RKVvwj7qqaUdwAl+RuboTrJ62LHcqllUAeKdREZPO4Kbjseo6p1peNpbZ7vqhgT7FgivVjQ/KJ74GoxXa5cDeG6qTnshqTOxk8mmtGMslBTHjZUMCBHrub6BMqliN8Q01uCSeeIF3RDVW34vQxxSV/6z4J3LKtXL7tEtMy2nvMo1/228Ycxfb4pd3cMbdXDsUhAx6htrA7IaVrh8NWrXxENK6xGtjAgG332nEmg4GmXWB7t5WwGRAOdl7/d/eFNieGTep7nD2ja73Ds9ymmnv7ZKPKJh9H2MOm0ufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mSvfsFPmVIHF6pvN2AQWshrTDNMvVNirVBt1GIdi5E=;
 b=V+kXUv69Xbj1DfLoTKl+5aiGVrWvmj+dfEjlZWOKXXtGy4N6aHNrs+QMRMSjQp3R7Jmcx1E50mGFwXVO3VL4ZL0DSVlx9lq1nNmROMPhGn0LailsVz6QhUbXBdY9PTyZN4AVhWcSC0/u2Dnu8806U/ryX+aQQxjXUjbLNjUwmxPCCGyTy/CUUT1HZ3HL/pFwIl1YCAL/zj34e96oDewRsI2gJneRfXHsu+e90TyEGZzi8xNR924wh/g8HosmrCAzQE/CZrenBVf2lnqZqrlLrs4vBXeF+qo8KOuQbF2iiV2zE9E6QenaMBvVji/oiR0/MSO4q3rj5W5YUcXMzqhTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mSvfsFPmVIHF6pvN2AQWshrTDNMvVNirVBt1GIdi5E=;
 b=OQ3GXVAiwmKt3pWg+Jo90179f5zscLju+d4H7pjTNOTxAxfCP7yMTz63+DV2SwSgX8G58y8iPWnXlfDbAV5OREv2j7xzuLNblX4rQOBwh6IiAv6baeXuwvl8aVsxIEU/GPp0Qxai01W+zTeNVGSzqafeRekLVWPNLB0LUcsAG/g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH7PR10MB6250.namprd10.prod.outlook.com
 (2603:10b6:510:212::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 15:08:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 15:08:57 +0000
Date: Mon, 12 Sep 2022 18:08:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] ntfs3: harden against integer overflows
Message-ID: <YxIGoOgUtaUP59FK@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR2P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH7PR10MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 5522c5c3-ca16-4ebc-3ab7-08da94d0b6fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PnDsLkqu3Z6yc/OP7XmAZQSe/EuZnIfYjyK1D1e+B1U5A6Cybr0koIdbcAeZVmT4Wggs/RywNHjeCZnpeEcfH0DdyjAYW3DCjqfPwlPnFyiSAhG1/TGpX7hgjVsCbbpZ/xbOyHlZbbSsB+NKo+Gwc11BgNGMF4iryu1DxdZgJk2cPXaXAYFf7z3Nsug6B6ECqEkyo+7C/NHtvBcH53jdvU/7pLFYAzbJDrLC/3ixX2TuL9Hql3U02SZ/qHo3jymi14ABjBNGCLLSovppkUih5MPJISRfR/x7o1fTAeXp+c5kuUCCUFdFp5/o1m6NKqIoxZ6x0dPnh5GfedQoEqEYUwSWRNbF6u18eG6G3aT/o7LrFVfad7DMalnngBZkkwWLrmZtJZ8mZtwePkgVQkOLX4cayxXmHWKeJlrdGLlMq9/O+tLbcPGA7dlcsbYxuLDlahEzDllBWzeFmWk8cvglGvOG2/+78rf7R97/uj67+GvnliEXh4qu5ZzWsbv3jNtEU1tuIVw4WgJBK6bvubKedP3MKWwY5B34sdzdhA5uGce81fpwU/07Tn+6eu5V6JCMe5h2sxas0gOvKY8KgBK64TlfB//JM6/aH1s5LOW1rSOxQAKhDlcPcES0AVJpEXp8C+LEm3r20hNqIOsUeREu0AAUXNXGWGOxCnoFmNQxPO+uCIUhqJlQS86yP93P+8LNq/6s+1NGtYbSE6qS7A7Ghg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(376002)(39860400002)(396003)(366004)(136003)(8676002)(66946007)(66556008)(66476007)(4326008)(38100700002)(86362001)(83380400001)(478600001)(6512007)(26005)(9686003)(6506007)(6486002)(41300700001)(6666004)(316002)(6916009)(33716001)(2906002)(186003)(44832011)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uVV0gGwvlWUAZlrS/CX6Kr/oQxZm4mASkgmwIMRelUNOR9Y4f0+UzO8HtPoO?=
 =?us-ascii?Q?qE3IqcYc3bysONEQK6Cv7qaWo3vmIu1tryJnGR53KJqWIldHe3QWFWGZZElG?=
 =?us-ascii?Q?e7N7mQfabOsyQWBViox9w0D3mMwfjlCK5L6pipfvUP1LUvMGHEdsa1+Kdmcf?=
 =?us-ascii?Q?X41So5Kqe79PtVpVYHIkh8NCwcemVngqGycUeLhvM+86FOHu2nXQpqm9PlfN?=
 =?us-ascii?Q?502jC0+Ghw19neL/lpI7HnRdBvSavdADyg/uZqLQ559sBJYJrzzBY2WecPNT?=
 =?us-ascii?Q?58YD65vV7gAYRE9cXC1Nlr1OfTyqPXnH+T+3h5F5fEIf0oKtBD7QMdlcQVyi?=
 =?us-ascii?Q?AmOO8RDlDA6RBEH1moZ9LRfG/P9L9PyyCcv1U0ukYekUJxhWPPp4WgIDnCu+?=
 =?us-ascii?Q?dO9XjNHY6zorYb201k+oyZE7iitMxEN3oaaD4g6+LOxbupizALLWgcMcPuA5?=
 =?us-ascii?Q?QR3ThrSPxaZw0+7iVnEOlzDOij31uBPofAKM2G6Oqq35oI9A+4xqIdvcOzqI?=
 =?us-ascii?Q?P2AcjkFXIfdU9xg9W1asUdZPoUsbsiGRBqQWh8WHI7KP0DHqCz5GCVEnnCYw?=
 =?us-ascii?Q?OE7yWntNCJuP5FPkC5cj3zTlrdnZeebWz33uK7nv2SzEEijG1wOQD6VQICxH?=
 =?us-ascii?Q?F49g2CfMro00hIDk1PN+bR9r4WI/143yelLI68F9zj8EaS/9EuKCNKqDe//F?=
 =?us-ascii?Q?16nDz5h0mSs2Hco4IdD1zVCmM5PuAnPapmHSoq85FShPr8wsAsC7jvKtjFAe?=
 =?us-ascii?Q?j/49olWBgt5frUy70AEK+SWHBhujmcoyBxCzbUf2Eck4f5oA7ERQMNF22l/N?=
 =?us-ascii?Q?a9xfH/ZBx0IxZGdBI6up1v2GfprWl5iTTEeA6iAsRWXf0LaxPaa/E4SQd57G?=
 =?us-ascii?Q?7s4PZOwhaLMdy6PPKDgmjP5049cGvhhbbYzjFozc8oxUDQvS/YGMAFvEvCqR?=
 =?us-ascii?Q?Nbuier80sBJ4cA9iHboRGNm57c9u7MCgTRp4ihTR4wRak8dQtlwn31Yf5gOo?=
 =?us-ascii?Q?gAiDu5XIpK0HxFVt0d7+LqC+yHRe9uxOXATXo8c2bLJZ9FFNX5gw7NSsGPCp?=
 =?us-ascii?Q?6cNw3T2BvhotKVHYL7Me4wCHNTWdPwV896bGyn/OUy1SzlOpv2YRvT2NOlDH?=
 =?us-ascii?Q?N/zdXL/rGdrrHdOONU9YwsC1b4hbDTuGcLa6rlhdh/y4qYGXFmtIbS6wvFx+?=
 =?us-ascii?Q?bYKtjs7kFyIje6l3JxZ0i1ir/zKi3P7Gw9jpCKt1UycjG6UsqqbaPMFF/dwn?=
 =?us-ascii?Q?fE5O8wUf3enEp9iPOvFxkX30b85/jFeKUFz9JPMR9QJSzH+Hs7vdv4H5OrbB?=
 =?us-ascii?Q?iIoB82tT7kwfptg3moBbFodWGYbuS/3RUgyFEWMhGZ4RROjXjI5sTRUVH2qq?=
 =?us-ascii?Q?2cf9yBSuf30EJh0QR9yl4Fy1a+KAyx1SBULnIKgv1KSx3Iukn0B4yOhvYWNO?=
 =?us-ascii?Q?3iXZa1pDa9RMzWy9GZQ0YYq4VyjvGEwbfvJPpFhsYtrrwSz2EHDbJ1m6Mszy?=
 =?us-ascii?Q?1NYoTwxZcsYY9d5fUNpL7FUQC7TekQRJGSe37RqiSoRlG+e0c4VCoL5uNqh9?=
 =?us-ascii?Q?s2Vc8zS0B/+nCvH2XVbV+qVGk6iffGX7FeEv8a6DFABspoEPlE9TC3zBu9Dl?=
 =?us-ascii?Q?xA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5522c5c3-ca16-4ebc-3ab7-08da94d0b6fe
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 15:08:57.1975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiFwiPFpKr21CAWYvacZrTenBlrHseqa9BpWRi6Xv2EkyKBwI7ElkFUGiRY3KN65h6WKGy2FWTPhPzy/kNPSXAVseuVEG9Nt9h0FNS1di10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6250
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_10,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120051
X-Proofpoint-GUID: 0XdqxCpM3PMGSViGTOu9juvWkEc7nGUK
X-Proofpoint-ORIG-GUID: 0XdqxCpM3PMGSViGTOu9juvWkEc7nGUK

Smatch complains that the "add_bytes" is not to be trusted.  Use
size_add() to prevent an integer overflow.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The add_bytes variable comes from:

	add = ALIGN(struct_size(ea_all, name, 1 + name_len + val_size), 4);

This is problematic and has inspired a new static checker warning:

fs/ntfs3/xattr.c:26 unpacked_ea_size() warn: using integer overflow function 'size_add()' for math
fs/ntfs3/xattr.c:290 ntfs_set_ea() warn: using integer overflow function 'size_add()' for math

The issue is that the struct_size() has an integer overflow and we call
ALIGN() on it, then "add" becomes zero.  Is there a bounds check that
we could use here?

	add = struct_size(ea_all, name, 1 + name_len + val_size);
	if (add > SOMETHING_MAX)
		return -EINVAL;

Otherwise the limit would have to be if (add > ULONG_MAX - 3) { which
is ugly.

 fs/ntfs3/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 7de8718c68a9..ea582b4fe1d9 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -107,7 +107,7 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
 		return -EFBIG;
 
 	/* Allocate memory for packed Ea. */
-	ea_p = kmalloc(size + add_bytes, GFP_NOFS);
+	ea_p = kmalloc(size_add(size, add_bytes), GFP_NOFS);
 	if (!ea_p)
 		return -ENOMEM;
 
-- 
2.35.1

