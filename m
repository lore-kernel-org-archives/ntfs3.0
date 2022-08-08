Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F3D7A
	for <ntfs3@lists.linux.dev>; Mon,  8 Aug 2022 08:35:00 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2787hthY018071;
	Mon, 8 Aug 2022 08:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=aTbLAIMfiIHwNW8kZ46FWpr46djdA8e2AN+cEEokPxU=;
 b=Zxmr5PC6zqiWWbHI2o+uCqrznv/1nSY0lCIVT2BMjIh/5v9l1jLxc3fRwzmRXMSoV8u3
 v96ZtxgnkIwi6AAigmnEW1ox33VbY2eiO3vu1U79dqf9H+vMhtcH214vy489cl9Sa4mz
 rmdkEYO0DRljDkkZ95c3wEFMjpuSZAZf1uVJmDg3LfcFQXpg3j9awywaBosRYiHUn7Y+
 ++EdBwbiwhfci2kkTtcAIPvNfcSRR2I7bj23m95wUK98eW4hqvwGjEETxXbPaLWyvpIF
 Le+v8vJhudGh5wkkA1oyYC1wprysSD0Oi83Y9SNmr30T7kpk8PBfjCo5XhYNjHENWX+D tA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hsew12w11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Aug 2022 08:34:53 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27863YHW004437;
	Mon, 8 Aug 2022 08:34:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hser1qqkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Aug 2022 08:34:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DY/oS3CkQqekBuaZ4K7Fmpd9T2fUSyyBhI00YG0RT66t0jkQrJJ/ctBvyPZOcHqwSGQf3bGEQOC3ltAScB/A29Uu08OBzNlkRfxuH2xNYKNCMN6gttKT0sjozeOQ5byNRDSS3e1ZvSpRakTz1cYOcLlRFSSKptM2JugIPtE8yzWAs2R4gTLoJsL+g0dcUDqjFAEvd+6IMzpOVSNpdmIBGQ8iu217VYtJh4FN+VXEA+PyYaON0XZa1hHpae5jzgo+zrdSx3tnD6c8N9t0x/Ye4z+stS7vluZrLmtNaOGDFGh7AAuUUpEwwDSlcgoRxIuTKL9t5QOLA7ajQgkFpqBFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTbLAIMfiIHwNW8kZ46FWpr46djdA8e2AN+cEEokPxU=;
 b=RKM9KimhV8WEEEZA0EY4gvl1YLSj6JCeA0fsqBhhljSNqojF0iRuPh3+ApN/+oP5CuKixWhMAGj64Rh+jf1eT6YE75C1Wmj1CFty4ql2+X2Rrm/ADlre1378n+PBmhwqLBGTTIs7LGAOHONrxC8tYYyhtsdW1+SWuGihYcMC00pY9q+Jf7zDyoWraOmzI+dwzzVaJIX+fIW0is5fM5/zN9Nm3dnmBEO5DTq75fgEun18/70KreZQqT2yoBBoRN6ZbFlNBOARDtlcufnJ3rTmMU9W2pRLCy8Q4mmSM+uJN8N54czBd7nn7ukClJizpnNm9oskJgaEBJHhmwQzXLuehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTbLAIMfiIHwNW8kZ46FWpr46djdA8e2AN+cEEokPxU=;
 b=a/N7hkgFlow1eM9p7vueDIEaSFTAjIj3edFIg/R9f7IKnvgrUJuT/YXdcyrBddOmwZZmLNEsEzLccRCAFrloPqbH1VlJSX1n67kNYlFPCq1lqK9riyCM35SebxxMz8mlhheXaQLyOPD/vL3fOmaT+tz9Y9dxYKeS5J5MDe6JeL8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1596.namprd10.prod.outlook.com
 (2603:10b6:3:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 08:34:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 08:34:49 +0000
Date: Mon, 8 Aug 2022 11:34:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: uninitialized variable in ntfs_set_acl_ex()
Message-ID: <YvDKoXqt5GuZNzzN@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43bf560-9f63-4d26-64f6-08da7918db98
X-MS-TrafficTypeDiagnostic: DM5PR10MB1596:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HXJ4Mp7kCfkCccarQHFooB+FRaxmbDyAq/OEQPrAN1pQKXFA7gMl7hyMeJVACXeC0qQS9PbofyaAmA7xNObUQqYq2ITPQi3fwtu/c3fyvNuWPd2QivkTf1ZKTyk0PDgB3ONFmbo8XOGd8PdHlzYrAk0tCUf5jjJSFOSeosevSXxbQipa7B0BpW+YDulD9UUWO5QcOZGjzbsuyy5mCz29V+fyXDT49rTsrF3ruDKerje+cc1B2zo1qDpBz6+VuVjE1EvHPj9Y+OQHwhHFAJlfjZfj8ryVdjoa7mx6eoAgu1VrmcxHcHXPnYPVzsFNa4yEqAT7HGP5dBmS1G/RZqQKbmmiK/vPJRcpE87z4xMUs7ICV11bhWaLGAY0odZ3/dwkkL0qtDMqXaVBbOVrSGSddWX7btiruqa82yj+m5djj38bAnbL3Es1Nt96O/Z9OCoLVs5pV9/MCU0wMFj71ZmaP4XZA8Ro+g6d7fiEsHGls2lJz1fD5I83jA3AxHn//h1DZFpfTppoIVzcDa04cK0BlbntYs3cDQZdhdDfEtckcB1khpw3p1nDafuEq5pTNuBDFi+oofcgbAtuXR0VcukBLGqcOkXmIaihp781GJWohvIU+ZQ4E8DW2qcu0q396XrcJL5UKbMBIb0sKXf+X6SX1FrUWSK1Oe+nV+0aYRdU+uHnDZ+YJVaFF08tLIH+A4o/By0pl4tkmPNnhIFof9M1YXlz2OZ7ZX3i4+gx7Kgnhm6hvWBE8f6q1nM8HhxKi7T1AWxm7AIQ8eHyKs7xlsEafUqlQm1mLGoG8HxD/hZhugs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(366004)(39860400002)(346002)(376002)(396003)(4744005)(44832011)(6666004)(41300700001)(9686003)(6512007)(26005)(52116002)(2906002)(6506007)(83380400001)(33716001)(38100700002)(38350700002)(186003)(316002)(6486002)(66556008)(66476007)(4326008)(8676002)(66946007)(6916009)(86362001)(8936002)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HQbIxYlHE8O2DJtCQPkz+GtCMZ+gMYyxvCWG9556vSAMpLP4suhJ8xyDvB1F?=
 =?us-ascii?Q?zPXQ7jU/pvIZ5c5fH3pKwavN3QYinhXwM2m3GPQH+luyv9HbvMp6b0pvkyJO?=
 =?us-ascii?Q?OeZCjlPwRXMvPbn9fw2AHI+0E+bS7uRqAGdi7d2v2fWl+hXR61Zl+dazKUG3?=
 =?us-ascii?Q?dUWjDwL7m7eQyq4KSiLGAG14OpJNNkTQpTzjYLWUmsk5tcVk08NhjJFYlWBD?=
 =?us-ascii?Q?oVy4aC5MjZBSyy8NdcdkR+WEAalZdCyxo0nl3dNdS2GUQHirEem3uE0sPy19?=
 =?us-ascii?Q?0HDp5+w/woVHdi4YvQ7YI1XTlD+e2n46FU4AJPsKwjG5JVh8n2GPInP7s0W6?=
 =?us-ascii?Q?Jc3AiGkQS1HAn4ahfEB6ZtR+Y/W4wg/LUI8BaTW+A/XK/Es1MxsDzsJsCArp?=
 =?us-ascii?Q?q3AUHU/plGTrTyVqcWf8b0FbWVTVeDWw+utsOJPOF9Bv9m1VKqKUB8czn30z?=
 =?us-ascii?Q?2eL+aeVh5ydfQEjS3wVeDd+9dphevGF/x7OIejudr+/d5NZjPKHqzQI3tD2D?=
 =?us-ascii?Q?EKlC7QMyA6+c7P0LYRAUSrnFltuHGUwpp1i+MZ8d9C5LXj7JePQ1Jr40Zoun?=
 =?us-ascii?Q?hG0L7CT+bQmHip75URMM9bk7HIl1GdWRNMvnOYBR5oTHbN7uYIoy7DMdxLFL?=
 =?us-ascii?Q?AOd6mWL1iKC9BVRQ3M9/bvAYCWfUF6Wmr+ZmdVkYuFpymashZuEitBCeKJkR?=
 =?us-ascii?Q?0VoPtEHMpQuCVzFdZipjszUHIHzf+WhyRgj3TzCe+OdREiZA7pT/yWJoSewn?=
 =?us-ascii?Q?h3nVvR4qxVM6sKPVmxiWUK3S3EwDZWGJ73eyQ/7dYGvGhHnySil0iY/SOp+T?=
 =?us-ascii?Q?m7ecabURpTLOF1c5C1ZUqaEFSfoIptzmb514JLM9vvgqOvhNk9clR2zsebl1?=
 =?us-ascii?Q?gX26kquXA1WGKGgAF5Y8N2DJnHaIj0aq12OwSW6DeXc+lNRkpJmznqre7poK?=
 =?us-ascii?Q?ELrM3F0ATOPfUfamPGpqUY2Hhc3wR3Rh708r3NXfYwTD3tzUCEXaT/pDj9U6?=
 =?us-ascii?Q?WymD5a5REoyzswOw7CRjTjgElsSFD+CWVYsjQ7/xrfEHCCiFSBL81LAx0+pd?=
 =?us-ascii?Q?9J4AFYA2TQ8ZsaHnUehYRooLg/1AtNLfuTEHgz5aK92V6zZU+Wev4UA+xNLW?=
 =?us-ascii?Q?aDJMdFolxLYDa7vh8/KXWrTmeh9VZNwVC8s5Job96CjU+nbrfKZZOP5cidQ1?=
 =?us-ascii?Q?Z5qHfp9nz32CR/teLnSMkBvNKtzQ7I45YVpP2tM7ndcSAbIMkzdQ8yOhDk4A?=
 =?us-ascii?Q?zliiUfSdN0rmfR5R31Ed8sM4MLJxVgBsU9zSNVgWWTE6FTpgo4m2kla5GuQ0?=
 =?us-ascii?Q?Zj19/9QcMFyRGxp2W3WJL7GO9ZFkYf04fP7W8nYgRj3jiRwltD2HftZiOEQd?=
 =?us-ascii?Q?d1B2dxT+zsG2RuyjN5dyF4x6QgoLooNohChtv6NcT+MBWM8SXk0mWcnRsk6h?=
 =?us-ascii?Q?EPJ3ASvJqy5wTLau4neThUBzmZ6HvTkXKnRuhutwAcejN1g6tyFf/yv5v3Ha?=
 =?us-ascii?Q?3gMSRiYYo3RiBOMkFnughwySiv8riJ4BU95rXYZxsKmde+T7GcGwjsYZwDpu?=
 =?us-ascii?Q?ppBUkHOQf3RecrbiKnyNwHUSqFKCRhDQRt6lJMnn?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43bf560-9f63-4d26-64f6-08da7918db98
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 08:34:49.8126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+vH39tChIgUkcJZ4iyURv1EQxLy+bhuNKgviDvzC4cFKGwdszs90xFG1/7nrg7qG2Z8qRSII+hb5K6u39U3OlAIiWP4xKW6avj/PUuB2YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1596
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_05,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208080043
X-Proofpoint-ORIG-GUID: Fm-9mV0Fu8Ni_HHeduYjt3fqLou6rphS
X-Proofpoint-GUID: Fm-9mV0Fu8Ni_HHeduYjt3fqLou6rphS

The goto out calls kfree(value) on an uninitialized pointer.  Just
return directly as the other error paths do.

Fixes: 460bbf2990b3 ("fs/ntfs3: Do not change mode if ntfs_set_ea failed")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ntfs3/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 02f6a933ee79..5bdff12a1232 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -568,7 +568,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
 			err = posix_acl_update_mode(mnt_userns, inode, &mode,
 						    &acl);
 			if (err)
-				goto out;
+				return err;
 		}
 		name = XATTR_NAME_POSIX_ACL_ACCESS;
 		name_len = sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1;
-- 
2.35.1

