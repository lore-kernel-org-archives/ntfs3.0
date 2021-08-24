Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4CC72
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 09:43:03 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O8q24a021191;
	Tue, 24 Aug 2021 09:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=yRKikx1elmcWMA54tugeZWJsY4HZeMEEjuQYPGJ43zw=;
 b=gYzCApxg5xOvuNzzpA7Bl24eo0Rw+Nv+QPrjnHsw//hVbdP18++srK4iY8wWbEngiVrk
 qTzncB4Z3l39O6VXd7lsszVYbRDkPfVCPq661aKD8b1SiCSezVm/NZq02iv4h9gI3H3F
 Jj9ymUblLhoMzFw8oVqnduOUfJa0wfFwbHSO/y2u78Lw0wKHqI3HzutSKUoF4KdzP4F5
 sHRliGlQ+uRxA0lesvYHAgR7Fuik/+feOLuH4yj512Vi29yhg/T6jMm9Qoqbro5nvk74
 zbMPMWMxTWZiyqv7xkwLH11JNjkrJhUDA0oP2FuQ5I0VpSSEImFm267lxpR8Q0iuda9q FA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=yRKikx1elmcWMA54tugeZWJsY4HZeMEEjuQYPGJ43zw=;
 b=ODetnqmT6TCbIWpl9CCInYpPycJ+sAvYm+M337GyYlZxrSHwnUQH6qGvvYx+8JV/KvoF
 iZKVFqDhypr+Sz1XWUZBBEUAAJ8JQJbS0EtaZRdf0CR0n4es83jdNzH+BxPe2blQK2bt
 zyd+XCo2ckQ8Pm/9/RhuebRPqTxz13DmXmI3qtiQaR/YDWSsxtNDolu5+4DK3lznlbXn
 9NZ2eaLjzdLfk3u4SX+c03nnO6JDqA/DvFBNDUCEsOkmXtCI+O10AfrHmZdrWd0+6R/i
 NSaNsMXEN4qMAQ9JapgEsSji81zJNk0PK104wciv+W/nJFN5si8EySKk7NNTU3NQdGIv 4g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amwmv84b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 09:43:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17O9fEoL119538;
	Tue, 24 Aug 2021 09:43:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by aserp3020.oracle.com with ESMTP id 3ajsa4ysd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 09:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV13rXStDrYzRQTZ0wLrFGeWzlLnatwwws8wlNZbHNXH412xTRVBLL6PDWpIvFyGr7lcWDkiouJl0dz9Mdlqyq45vuBfch8iNqy9ngO+HbsUtkV1salydIlt0EyZqGS18hV42v+605LTE3yPWvzoYJrOySK7TQCnTinV+nox2V80YddhqwAtmEn8ergtSmWWYy9f0JpQhGrWeDwgMcK0XLE+Bzoc/2dyjQUKSAvhfugRTrUoRnvCh85q92oONyFD+sxHYaqfHckk+eear6BMp5+mcYg+iW5G+2cDAUgLk6Unyt6OGX+7r5nR3YocK4uLxZGoev/0LblOd8Pn11WXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRKikx1elmcWMA54tugeZWJsY4HZeMEEjuQYPGJ43zw=;
 b=ao59yYoGa96nNYZPcQuEAA8q2xPskDxDAb50YU3+JoT0gMU58XbwpbuHasZU5O14z5hfFaR9fJ/Xg2ZKNhJ8udLWXOIMWaCojz8w/TbKSvMTFfFW3Rj/ol4OUw9Ek9aIONhAPUgb2lb/82ypw+q3WYKLXTdzrYSHNJFFXWJYwJdS4tcT/gCG+lo+ZXieVDkqvYGW++8nrpImGFZxWldi2tiace77XaA9iNg7T8N6CqW+yE6+T0lgUIto9feAMfBRaJjvMFDinRGEiHpDd+J7PGuBdQcmb4+kcMUhCsYXcJUUa8+Pgvp/XI566re8H9JtZGCdFoAurENgUS/xYUWpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRKikx1elmcWMA54tugeZWJsY4HZeMEEjuQYPGJ43zw=;
 b=tgPpF8f28pOnvXBYTNoW9lzFOrPKAEso4zGgpMZM00YQEOrfLnEj8+T5oD8v9TZrNllgndH13jux1MBq0MoTiXtVIMSOTHAPqxd77pFS5zXhoaadogdVoWVwpCPzZyOeZShGOW4vHyKYghSR1HlJ3UhHreqM99/eeutfcYhXCdk=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4500.namprd10.prod.outlook.com
 (2603:10b6:303:98::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:42:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 09:42:59 +0000
Date: Tue, 24 Aug 2021 12:42:49 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Add attrib operations
Message-ID: <20210824094249.GA22644@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0101.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0101.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:42:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73fc2f34-eee2-46b0-4687-08d966e38f1d
X-MS-TrafficTypeDiagnostic: CO1PR10MB4500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB4500823308CD1A481E3436708EC59@CO1PR10MB4500.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SHOvgQkavwpiRs5Y2IU0yoHQdoeB5LntWJa1MqVVFVbqR3UtDkqieLeUCR2YkMOnhUlMZx33prceRj6HEtn1DUYL9SXJ7Hx7grYtsS7+/9RekWmhx+QOLd30BOW3AWJlt/qbhRCWJywZByXXr/IN725uh+dtIXxoRVNqByLn5Z+Ao6x4tGDIc8QyWPaLMzDlE7Pvsfhee7OwSIQHQUmLMlOPEOC/NqIlb10azqeamPXc+gGaEtirUjKzi83sUuIi98y8e6bimoOyjvCPQF07vp5Gci0p4YOo09hoWVy8mHTYTJWZWd2V8JiEdGbvRIjlK2uXStettQ0aTCic3VtBfaqzFqVjwmTM3qyqtOWDePK7Dxj39tFHJXiSYQp5ywWci2yt5SFooNZ9VsWMTZAHmkekfsduXB8vDRpoCS0E8smxa57vdpBYLXhRye5R4WwTnOmLo+VBMfIq0yN4n/CIuJTtQSkwRMsvWoDwl5kEWhc7oyZNsdGiHt/0Ofyvj7leIddr0o7GiX6zYJ9ej+N8mFhul2fIcDm/SnwA1p5//oYkWsMw72jq9089Qv00tbr3JvkT2kLF7mD1O1H7SrIshC3ggQeUq/8wzn5jctdomJpKevYCpeZl2vKSi0Q2/yH4bSs1RI7iuRdvVwkM2s711JOaQU41fxPyQbKGT0V5Hqz5OHw03LsgCTZI88EI2weNsSRvpbLCGFtbyXYPbFQlUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(136003)(396003)(366004)(346002)(8936002)(2906002)(33716001)(66556008)(9576002)(316002)(83380400001)(186003)(44832011)(9686003)(6916009)(956004)(86362001)(38350700002)(33656002)(38100700002)(5660300002)(66476007)(4326008)(55016002)(1076003)(66946007)(6496006)(6666004)(478600001)(8676002)(52116002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2LaY1PseI+5O9Qky+Bo7xLrADNIEAd0FEevwBpVnDbCNZBKPX7Iw/8KAFQra?=
 =?us-ascii?Q?0rTs8V7l/YfY5adOLkW5ojsOjI3pU82sNJd5JJtl9YtNQ4o39I5YwR3+tbmQ?=
 =?us-ascii?Q?nOD07MwMKglr9HJ/YTwrWrJjMUtN1cU8gNGx1bzPm+y7oy+GQgF04GImY5yX?=
 =?us-ascii?Q?Q9nCHpIpC98RBNEL/6SuEi6JEw54dPhBPJiRsazUMX9lIlld8ZTWMKrQDOpl?=
 =?us-ascii?Q?M05yYi4Wp5muiktClCUNenIKXBmty4S1eY91cqR/fzNSkXgoiprtMOagw/dW?=
 =?us-ascii?Q?JBDW3OY6eFI23Wu58hX+rOrNchj7uelZQoSvII8g76tADqsilt1Rk6iiba7Q?=
 =?us-ascii?Q?cPH/1jubKaYvR+ZmPcd88ry7jq00Fr7x1DK5oMV6t9ANuwG0lIEfClm7fhFg?=
 =?us-ascii?Q?Hqxs9dShBDiYk+Unq5LHY35HAZoLDcUgvnZc0+SDepejXWvqMIS7Vfm4RmxI?=
 =?us-ascii?Q?BvJOibLLt3Pfjyg8ySTZh5uNZB/z5HLtS2Gj5h+l8gz0wevVsXaZsnZtrlDJ?=
 =?us-ascii?Q?vgNDrpz45fAEUdcAHTqYCDEFI9plyhHOHVi+cwjfPbAhqnejrkfwjPMxrzhZ?=
 =?us-ascii?Q?11daeKVIMGEizrYXjG7c2W2+TS8BxSQnsWPs3WrQ4hqPZIyPjCfBBB+byulh?=
 =?us-ascii?Q?/DfWPMf1WpxL3LwyiNBldNbAWH8udjesE33NcBb2HumoMbdO5s6hTUTqzNtl?=
 =?us-ascii?Q?I1tvg1crv/8q9JAIWPc0rYJAFzzcfwo/Z06Cz+mG2hFqdRtsmUnGNs5UD5Ac?=
 =?us-ascii?Q?ld4HGcAVJOTpD/izWYrIRcWQdpTop3f517AEYcMhMC5xWZhAz76g+TvjV00q?=
 =?us-ascii?Q?1U3XZ2bzEL3nYr2AMNj5qKv0arN2wGbIzGmCLeMlsry3c8kwMJIyH8Bhm5qm?=
 =?us-ascii?Q?0Pj1J89bJotwojf4jUebue3Ch9G8sx21g0jql2uGHEfyh+Cq+jSguKihtgau?=
 =?us-ascii?Q?cRe47Yv150p6CPiIg9xv3s97IOYx6mDaqN777gxkUQDlcbGSMhu/WjTb71xE?=
 =?us-ascii?Q?pTEePqP/1N9JuosFubKFnKMTFyfWZnrsBnvgd48qTx6/YsnOhU7LjJ9Fo61V?=
 =?us-ascii?Q?ptgqUQrV3ODu7V/w2WrusmUVs86JoFj1H27BvYg+yoreBquK9+pF84eFCeht?=
 =?us-ascii?Q?t95r2HwVXeQBHAPEXJ8gDPW6SkV6arqqEj/etvxPwssN82qfWRiQrN79E6xm?=
 =?us-ascii?Q?PI16dJe6mc6bvcoFE80J45Up6in5wX1KzJYVApQ2Qp9hbYBiATX/mjcp3xoZ?=
 =?us-ascii?Q?E5v2vigBENOo7V19qdoTKNSzr//0+zHRtYm8aiP5ZZVanE3LpU/A2hhRCdvp?=
 =?us-ascii?Q?h962au4lLzJ7Tf6htwFPHB96?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fc2f34-eee2-46b0-4687-08d966e38f1d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:42:59.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plmWLG1/K4L9h7BcCDLKyfOH35p7+aInSM9ksdbbrhWKHAvtBqQWqFeyoTeWe4Ux5whl+x9IO72MgTNQrWhcBH4O5uAOsH5ZKCShSNpaxSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4500
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240063
X-Proofpoint-GUID: PEp1VZp9N0JSan4igQFnXrgyw4I0tloq
X-Proofpoint-ORIG-GUID: PEp1VZp9N0JSan4igQFnXrgyw4I0tloq

Hello Konstantin Komarov,

The patch be71b5cba2e6: "fs/ntfs3: Add attrib operations" from Aug
13, 2021, leads to the following
Smatch static checker warning:

	fs/ntfs3/attrib.c:383 attr_set_size_res()
	warn: was expecting a 64 bit value instead of '~7'

fs/ntfs3/attrib.c
    370 static int attr_set_size_res(struct ntfs_inode *ni, struct ATTRIB *attr,
    371 			     struct ATTR_LIST_ENTRY *le, struct mft_inode *mi,
    372 			     u64 new_size, struct runs_tree *run,
    373 			     struct ATTRIB **ins_attr)
    374 {
    375 	struct ntfs_sb_info *sbi = mi->sbi;
    376 	struct MFT_REC *rec = mi->mrec;
    377 	u32 used = le32_to_cpu(rec->used);
    378 	u32 asize = le32_to_cpu(attr->size);
    379 	u32 aoff = PtrOffset(rec, attr);
    380 	u32 rsize = le32_to_cpu(attr->res.data_size);
    381 	u32 tail = used - aoff - asize;
    382 	char *next = Add2Ptr(attr, asize);
--> 383 	s64 dsize = QuadAlign(new_size) - QuadAlign(rsize);
                            ^^^^^^^^^^^^^^^^^^
QuadAlign() is a bad name.

The ntfs3 code has a bunch of bad macros like ntfs_malloc() which will
need to be removed hopefully?  I haven't seen this code before today but
presumably everyone has mentioned this already.

Anyway, new_size is a u64 and QuadAlign() truncates it to u32.  Use the
normal ALIGN() macro.

    384 
    385 	if (dsize < 0) {
    386 		memmove(next + dsize, next, tail);
    387 	} else if (dsize > 0) {
    388 		if (used + dsize > sbi->max_bytes_per_attr)
    389 			return attr_make_nonresident(ni, attr, le, mi, new_size,
    390 						     run, ins_attr, NULL);
    391 
    392 		memmove(next + dsize, next, tail);
    393 		memset(next, 0, dsize);
    394 	}
    395 
    396 	if (new_size > rsize)
    397 		memset(Add2Ptr(resident_data(attr), rsize), 0,
    398 		       new_size - rsize);
    399 
    400 	rec->used = cpu_to_le32(used + dsize);
    401 	attr->size = cpu_to_le32(asize + dsize);
    402 	attr->res.data_size = cpu_to_le32(new_size);
    403 	mi->dirty = true;
    404 	*ins_attr = attr;
    405 
    406 	return 0;
    407 }

regards,
dan carpenter
