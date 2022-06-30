Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3AD3D7B
	for <ntfs3@lists.linux.dev>; Thu, 30 Jun 2022 13:11:08 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UCxJsC003455;
	Thu, 30 Jun 2022 13:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=KawHH2i2ie/ia7UXrVYxFhMoDhdyF7crrpw9U44adPE=;
 b=yleHJodk5W7kXjF+wyLfZ8W3Wx2kCtYgZX2QuhlTHpehYeO6y9MgRRTYm14E+7AwDhQo
 9WfjQqQxp7HtHtB0Bw0BHF8fNSJf14JNjlsW6A4H58Yxe1UpUbn3Cu0NMY5QWJYTuA/I
 FPeNuWQtCiu1Ganp0oqX1M8hgv9gOx0fs1h+ndNA/158TVMPqNjS0YPErJLIHsT9/Ree
 vQ3bkrHESZ/W1i5Yp6hwMmqRlRqcAbwirP211dLqPgodMxh81bTe5UhIg6SGmYnr9TLK
 9qEPsK0bTuLyLc+n1dxjMz3XBAlFsc8xnSSS4z5beClHbHehYGy3oT4/83wsvGdXvwBt TQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwry0m7pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 13:11:07 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25UDAvjM007131;
	Thu, 30 Jun 2022 13:11:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gwrt477xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 13:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IliCHX9xc3Hgbc6n9cV/5cLeKPB/97WZioR+wQNgpURuNHtWlaeN5+G8V/6PRjLm3j1dh22UpiJPx0nywpmCDuvcXiIGYt9RMQeIlX8T74P7a30O06x0Jc0YW1zbYuFv+CU0RKQ5PS7mmcELV9rG5cJRnOQWZsDqvKb833ywKpB9Wttue02j94Rq93Cf2AdlbncMHo8G8fO6vshxRSYzB+0GlYH+EomFikR/Wp/tg8I8GvLMY94hjwXAeEjfgvGrwBabaVNIqGL97Db6TZrF/jcRaoGMSBLDrxhQORPNo7QcMcocfClkUE1Io2IKf4vSP3ENdrUcriX2TZsuLtBajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KawHH2i2ie/ia7UXrVYxFhMoDhdyF7crrpw9U44adPE=;
 b=eqv+t57uyIUK2/ETQD0+jK2NuINMDVk073X5IcsyxgrsgMm1VK8fuaiKt9NCgcIBoxxCg0IhRSyiS2WieytLj39HssKSE+/h5LVCUGimFig0Zbiy9bh3am4YIZ1sLgGadW7zBw6Jks+vEQwf2qGJEuODD/FeFhhSMV2jo4SJ/2Xx7fPFHKiz3LXIC+u0R76GmuVm80t4KcLQdP5M2/H4Z3PwjK9b9owimnyd92rj5U+CbmkffN2A7dqwPulFURAw5jSNoGSNybO2dQQONL0g0Oy9Gz2/Ibmj0X6xe4hyCkpISpfJod29LuaGJElgrXZ+1XsBhWSh5OgS74VbJEQeTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KawHH2i2ie/ia7UXrVYxFhMoDhdyF7crrpw9U44adPE=;
 b=khJuF5TLL5bXNiMTNwoRoAjaQQtcd3ktWTnAGzASokzceXuzmIfgfnZ+UU4FN0MxOC/zu1vJU3SRKCu66HcRb8kCIjFQ2xUS/+h9rnuHLO3TFIHaCctTbOFMncc3ZFRfsSJVqDfQGqBe08wuynrBkualQHSa1NwJ+9BDsc2yEHc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4477.namprd10.prod.outlook.com
 (2603:10b6:a03:2df::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 13:11:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 13:11:05 +0000
Date: Thu, 30 Jun 2022 16:10:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: unlock on error in attr_insert_range()
Message-ID: <Yr2g4N+3Xf9X7Hgn@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0132.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b131fa91-1e50-4cbb-3f06-08da5a99fd24
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4477:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	80OQLZ4NYD5Z/xXIHghOJTRJgHGS6YSnHkyRvE6NyYf6QPiojR9MoUm0mw0gFNC8EcmtIgWXDFKoTNncheuVtvuyfUcVsYWhyPtSuZATobrC5xZ/yMkXzpYcphmaGG6MBJCi+fJuw2RYez3aVHF4f3sKO8oHW++oSjjp8hvrVl3qr+PVr9MGD2CeuQbClbHZdv7aBxqzJA8SqNI6mAC1Jg+TuZc1agwQAvuIb5NpljSXE6FVlm/mTaATad7ixgJoMmpUv0Jn4/gfvMuvYgx0NL/HIdb6AjwNc9/QghnVK7FfWAbf8+572igae1ugIcSTeIDPPtFqpENrj6MItVtya7fv0gvvmMT4vGedlJqMbQc17tzIn1Z/H0WbjwieR82bz0R9y7ruhTUvkKaGUCPrE5UicKtbT8lzwQfuXgWFrnh+BLlH/C4UqgNMXNcvPVXpqgkY3SSjG2YnRTTcvILKbGmULo7Ud2d35efc9SEfCDfV+1zksTpA1nKtwKLWQE5RD31MAys65kFQ+L4iLME6/UwQ5eHsMtX5UcBkjnVL9vPd903VRDjjcQX987keFK1G5KaL0wrDqfZj1cEegIiVT6CTW/F6sihUS9x3ggfIUOIk6bAxo1BwziOeXG4a/N3whVcbWMEkzlVLzNqTACqmtpSYbWxswv5DJoNu1ljPUsXCHGYi78S3RrrPfEwRigGO8MJtPFYFPj5Qh94YU1WUgqKqughza9lQ2qWcJD3ojyLBgON0T64swh1WGoqxdhQzqKQB1Af/Zgw9isGQEQWER1FOYlE+swrm+ub89RvGzG6Eyw3QmyNS8l2DwkqZFzuQtfWh93llF6fsR2c3d10zQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(346002)(396003)(376002)(366004)(136003)(316002)(38350700002)(38100700002)(26005)(33716001)(66556008)(66476007)(66946007)(4326008)(6916009)(86362001)(5660300002)(9686003)(6666004)(41300700001)(52116002)(2906002)(6506007)(4744005)(478600001)(6486002)(83380400001)(8936002)(186003)(8676002)(44832011)(6512007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dg4UXXWyJ+2KkSsq2JyDtFWOco5UrhM1mh6peAihvw4slhbJ9aotiFlThkGd?=
 =?us-ascii?Q?13TZ6gjXrAo7AoBMFGQTiKA8e5HCEBfcD3dzM2xU98OgjmDQsKYW5Afpxa6Z?=
 =?us-ascii?Q?rV3qvnHVCupAwdLsH8K+iI31n3oKcTiNHGD24/VJZ9IwIJVkcJOl8aunwg06?=
 =?us-ascii?Q?g6Wrea2fsvFB8hUli2nl2Cc4CWvwNC6uZjfQy6xn8KgowUhDCJNOGwzAVQD4?=
 =?us-ascii?Q?a9GJmYuTMq1XvN+XULInNPm8G5SXTDP0TEp5FsCz6ZUkCKswG8zZd/MyzzJ3?=
 =?us-ascii?Q?fpw5gHmleTYqNBK/o9H5J0W/l1/A8BkZNKD7WwE6NEzTrrsGzQRkiymLmGCE?=
 =?us-ascii?Q?XpeWqfbQj3dKNx1KcxsaZDW0lOSan4T/dDI3HSbODDWPJGgOKtGFIN/bgS56?=
 =?us-ascii?Q?JGq2ZxrvdxTusLBz5YupxiwUGW7N7kEE//MDYYdhcEt4qpoNSpmUkhE32CVK?=
 =?us-ascii?Q?4uH2q3CXQjZevYeCmkLOh/JCx1n/V46PbZjDDutjSxLH1KxK34UWQS+i+Ybh?=
 =?us-ascii?Q?OwGASLG1i8Zd6MfuQ2C+6OIOPctvu7YezvV0Q+gdQ5IeEUyZJObkpLu7UK2Y?=
 =?us-ascii?Q?ST7aFE9dSAt4tkcNMsirvdbSatkbim2qMRQTt/T4GJwVQ2HdrdowroHQTw/l?=
 =?us-ascii?Q?l44idlX/hAjsdhW8c6G09SN5D3wMOk2r9foG+RXFCB4hdDrN+gokoe9Bs2vN?=
 =?us-ascii?Q?qigSRmrZdAsgJ/fbUImbXQ16IjHAAr+zLSQhR6sf92U2QjvGy0SbB4DcmP+m?=
 =?us-ascii?Q?x5HnJAj6y4rYsLKlPyPng8H4AnYNeN9zlQC9Gk+C151JdvhCBGLFCoS6NRlX?=
 =?us-ascii?Q?fliLl7AsYdJYGEKxYQbNhrvEOvELrwhFyvIB5qbk7x42UiNmuItCcdcZ7iF/?=
 =?us-ascii?Q?3hBuHTcpH4S+3IhdNqPO8VQ2lWGftg5r6h6L8RVyWS6WnIFMmQCqGYIsMsh8?=
 =?us-ascii?Q?djcXumr/9f+lbk6kuX4ytc4/CiqSjpA8pPVSChp9c3G0CA+IfbwWFhcJaI8H?=
 =?us-ascii?Q?2z6nHb2/bArc9LYUh46n0oTuWnMZsFas1SLSJA2n7DhTVJPm9xSEF7ianelt?=
 =?us-ascii?Q?S5FjvKTMRPnnxTOmTapd9ixwYwJ5dGj8jAm86FrdkXB3rc7nZdRpuf2kMpM2?=
 =?us-ascii?Q?TAFUsq5cWFIHeMq9XjALng7OS5l7GWJuQ2eRgfB8fo1B06PzPF7qPa5Deuhg?=
 =?us-ascii?Q?eKr783c0zL30SKj+tNFXvCPT+40aCV5Ran59ZxHVr7V53LKx9sgKKmDB4ywI?=
 =?us-ascii?Q?R6ctYP2r4AgckDCrYCf41csKG7W+qnJ2tW6hYl/PFdxebG1RVurCTPAq9siY?=
 =?us-ascii?Q?HAKleEpFE2PipNPTHbL95OeBo8xM/Y11wPEdmqRxF4vijx9YdgJ4xMxQXF8r?=
 =?us-ascii?Q?si6Kw2o9nv/wnLJZmNTgZBXBEQsHDFzAYojC4PAc2Jggm3QwvV6+x/oSQUJE?=
 =?us-ascii?Q?iHgAFcVmLruCEAnlG8SedbCtB2siCyYhebJpfd9QwreYEN/dIdbK1as52RUv?=
 =?us-ascii?Q?mtHhJsumDkXMnCM3xaB4f51xLiQvMVztlYLDEdnaXU3ReweFk+E56I3cQu5l?=
 =?us-ascii?Q?3ko3tLMPEKHQpgUMQKlyh6c2fLZWfglaDyoHJxact8OnMIxvAS3VnUt5n81b?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b131fa91-1e50-4cbb-3f06-08da5a99fd24
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 13:11:05.1103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3KKaakw4Fno1CDnpjgidK2qDbjjaBUGMvJ40AuOyVLMxWY8k2Qbmpai3Jc8RFT+NWmfbWjT3RzYkqv+dXSDb8DFB9e/VS2+wXhbAEeq/Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4477
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-30_09:2022-06-28,2022-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206300053
X-Proofpoint-GUID: HHe06r-8ntwbMwKMqoTGeEbwEjgadmvm
X-Proofpoint-ORIG-GUID: HHe06r-8ntwbMwKMqoTGeEbwEjgadmvm

This error path needs to call up_write(&ni->file.run_lock) and do some
other clean up before returning.

Fixes: aa30eccb24e5 ("fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE) implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This patch is based on static analysis.  I'm pretty sure that unlocking
is the correct thing and, of course, I try to not send patches that
introduce bugs.  But it's untested and needs to be reviewed extra
carefully.

 fs/ntfs3/attrib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 86e688b95ad5..3e9aefcb3e6c 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -2153,8 +2153,10 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
 		le_b = NULL;
 		attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL,
 				      &mi_b);
-		if (!attr_b)
-			return -ENOENT;
+		if (!attr_b) {
+			err = -ENOENT;
+			goto out;
+		}
 		if (!attr_b->non_res) {
 			err = -EINVAL;
 			goto out;
-- 
2.35.1

