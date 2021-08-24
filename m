Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DEB29CA
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:40:01 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O8tJC7000899;
	Tue, 24 Aug 2021 11:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=LCFT40qxyz+XaO4RKcfa9QUrULwTlo5C7eRfmgkAAOE=;
 b=a4j/z07QwVFId0TiYMeJ6MTdQgmKbE2stgiq20UdGd0xIIms5mpAtDFo5ONaTDGRixQF
 rRgvM8YztAKjPZcr/9MH8owP0tSgFbcwZ/1ovrY/ltSiFHxdIj9QILdqlx8nAhPBKxSn
 O7HsVGTaZM3UsQnBjxGa3sqSrtnUqJXAZdfv3QnkrhChQEP6Gu15k0qVguGdZc2bqz/6
 6Lz6PQjhTyIe2kND7hd+8D+r2i9iNkngwmwtOLttqwSDEu/k/XPChZwD+g0UiotC3uC3
 iBrz24JAV05zA2CIHlYtIytjMI47QChWAxCzFvgQw7ECRN240V6lb8mPjemIWfVVUE15 fg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=LCFT40qxyz+XaO4RKcfa9QUrULwTlo5C7eRfmgkAAOE=;
 b=Wk9gSoMli3s6F0MpcLYrqwUpZW3sMBjWW7nFZ1L08hTZ5Ld61UrzdF+3ksw2rV6LZFml
 0QwZrYaeAUfoQb10CbJoohnG3k1b4Awz86+C7uDd5wFtkMOSa0GNmSDrLrNRNzOB4+Mj
 iS1LevNwd2XtVHvOF3/9WwB3bY3Sy/T+69ssyFBINzgWrKwZFHTTA1yOEd+XFWFvk0EQ
 X4/aDQ/N/gHwc3PC8OPzelwpfabGNd50N4tBjFckCgiEYGkg8YuG3goVPDx/df/R0IQU
 NI+fe8M3b4LO5P+v7rJt3hnnXh/RVXFo5hTgH0VjA+GtaLv6eiDWfdCraDPOkJnyQlsE Yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amwpd8agp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:39:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17OBVCMa058806;
	Tue, 24 Aug 2021 11:39:58 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
	by aserp3020.oracle.com with ESMTP id 3ajsa54j99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:39:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ1/07acOK6S4goXjT9adTu+WnC0D5F6TPrEfsGwEHTga8sdX2EpnF5tzyzdkCH4jgJJtsq3wmdNQP8dYB+WmyUDErYDqjmejYNanjSjRQdw+SNWGZaljrdtOTH6s8uuoYqtdqZ27GeLC9K4gWZXrqmKXc6vqn0PvpEhB1Vf1ZxJ77MyIv6qvD2NfTLXfpWgaSYHNg6HRkxq5p0I7LILLmSpkpwQwR93VdIMcEhNZ9bzxfnHMtLstUaVM0U7K2AgsomAtE0gY9YDutEPQSnmBaYKJOPjTBLeNoP4i6qVFaz4+Ti4mk9Twzcq3QKbAUb3FVl0URnrYG/ODgdM3vQY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCFT40qxyz+XaO4RKcfa9QUrULwTlo5C7eRfmgkAAOE=;
 b=Rytyc/+7ch/ODi7cwnENmjtiRqD6qEU+ypMN0uLH1D+FoDdlwddQ1pWKDJmukeND1bFOC2gWoEVRPSd+habVzzyIQlCBfCuoQye+Dj+/9FyH+9obK+muYM0QYdjLIB7qLQsdGQ5lqabPDlzKgyKqYgfhokKVy6UAVGGFNGDSVGOsIsQXhealBMKfBjM8kSAs2klT3dsNHNi9GW7trfaZl4Zlfl5Jti49XKh10lHiP+N4av02RQduR2rUTs7g8vEzudl62hhgMSgbMRtcqesHiuBBS5RRdNmlHft0bmBPQlHPlcdFT27RuQ949vXBqnr2D+Fx1k0KfK2y2ou0k2o0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCFT40qxyz+XaO4RKcfa9QUrULwTlo5C7eRfmgkAAOE=;
 b=m9EKWdVEOzi6QW/ABTieWRAFrcSMkjMvTGiS8GDjNSIThHlhM44k3Negm/StMGYPdcVQTuDW+LbspT7B3JTR1qVuSRPsYiiTLdZ3LnokKO/WH8OERY7J0CB3rgIAmT3vAWvmN7Bbkdat4vQTxOX2hBhKT1oRXOXlal57Au1TSLo=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1822.namprd10.prod.outlook.com
 (2603:10b6:300:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Tue, 24 Aug
 2021 11:39:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:39:56 +0000
Date: Tue, 24 Aug 2021 14:39:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: inconsistent NULL checking in mi_read()
Message-ID: <20210824113946.GC31143@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0081.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0081.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:39:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97522dea-d7b2-494e-0f7b-08d966f3e58f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1822B0C5187248B8510200FE8EC59@MWHPR10MB1822.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mug9FurelzA4k16eYbJfEJZ7CjgHVSeOElf36zjj5ifI+gqbRoIUIpefLGiv1JpZ9WIyAoIx1wWpjxmM/jGxSjEU34xAJ3cv0MA0U+UZK9CtUJCWoBXhLlKsR2YjW5sWjcJ+BugOhpEKTH34KBaoz2NOEqqcHUlBzUtWusJSJ8FGDxSkM1uHrcKPGobD+ZK9BGMeMMk9hpzR+TX5l+k97D40B1C7RPsX0hwqPfLdWkZ34WKM1zc2CT9BtnfRxiUyc1qlxF99lJevL4ikOLJhVma5EuOIJ8Ei12vSqSjvixgWFFW4t+Ks2eGPEvMLYl0Fc5y8Y4WF3THHzoENl+j/nfm/IVS4rcoBHtB7yXxcSyYvwhjSex/UECKtrDeVX9GIWXE2B02idzD7oC9EXwiv9izH7PcjH9XW0DYnzR6/PNNv9+yKeIa25myBB9B/3UInPrqgNQ5TNh1kV1KBvivxTaOhu8Iz/NCwO/IL43CS5A/h/GtzBExfGBNWhyBRblXi4P65fpg09LrhHHRtSr8+kpjFOzAJjMR5HZ0B1ybIYJfIPse6/lJtobViCIsKtZ+cJ7C52e0YIIT0YsWQ189lZdHxk0EOePB6wuuUFc09eWFGLW7+SgWtYSiEhkNOC6nXez+mCAH84N/VGvgc7c47XelCycvz4kT1SGwfdwuEa6Ta7/S+JWA3ZWxquvKmPxC5+M9WhLOeNxWAA5Apv5YATQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(136003)(39860400002)(84040400005)(38100700002)(38350700002)(316002)(5660300002)(9576002)(6496006)(1076003)(186003)(66556008)(8676002)(9686003)(52116002)(26005)(956004)(33656002)(86362001)(6916009)(44832011)(33716001)(66946007)(8936002)(55016002)(6666004)(2906002)(83380400001)(478600001)(4326008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lTWjzaJGXtDlfFwIadN9McMSPI2tXXtARRsVF+9YvcN3lpMTsASegZ5RiNal?=
 =?us-ascii?Q?3NvIM8RDNa+PgzFNfCVTtq/r9zUZTs/VkTgN7R6rawJEc+eY+Pe9a5A7grnC?=
 =?us-ascii?Q?iKS0Ot/Y74f3bJQO48p3NAdPGr2F/SHSMw8Hh8+zypkPb4kJnlC0bFtLE94p?=
 =?us-ascii?Q?w4EujPoDJ4GHFroSAVBP0C6lbaT2y/DJ0jSXhavSbJeM2cyynOo56WY/tvlV?=
 =?us-ascii?Q?wxKZWD9it8n71HOVD9qgYO4kGjBuW31TVpeKzoxMiH43afe7qA38RHGaYb3r?=
 =?us-ascii?Q?5AO+Y38R6iGV7VZ9clEO5VLhLagCfIcnDCwzdwurAwaPmenZ9Buzfxt8CJ3/?=
 =?us-ascii?Q?ssKItPTZCwB/p4UMMhBstj1NjqArDnX+WytcKoUUK/jMgLYsRc1Qo7oCl0ny?=
 =?us-ascii?Q?by3ICOph3M3V3QCHgGTTpOU6NlMWhgpapdASE3vsdbYBR51kkyr6KVdmM/+H?=
 =?us-ascii?Q?FoyCEdSQQYrmYjrxNXW9uzQYGNJttDvN+ctKxl7tPGg6ngpZio4bYwDwxrmA?=
 =?us-ascii?Q?a9wy96fQlRYrW4GlSY9GBUrcb7GYlKYezcLXkoRh/yo5wBs0CKXRKWnWrl7i?=
 =?us-ascii?Q?cNuFxGY5Bl4PrUxVs9A4Vw3gVAODUbRag6GgtK7EdFx5oB0/BjOz8el30DRD?=
 =?us-ascii?Q?mVRMRglRg1UiCwBgxeGu/NlVyjPefjZ/VD4RjJgYSjhoZZNc7ZguuV33anDL?=
 =?us-ascii?Q?tWZy8ZoF+0WZ3VlIX0ImRIDnZ4TvEjrPwrgQzGv5jiBhghVtmil5znzQYHcx?=
 =?us-ascii?Q?qoP8hU/Qc4yU4HqPayfiQrH/R1DC14rD6OklFuCZh2It8vwfoUF+89wgAXFe?=
 =?us-ascii?Q?QKpJrIO6BJPWqc9v8xbm5JU02YPUttbdOstiyzMDuW5afN5qkX7LFE62jH5E?=
 =?us-ascii?Q?eqaCJ5WnoRJ9xKU4zpmafM84VslmERgSuQRCEbzlhCS/jV3yUv/inrewUJZV?=
 =?us-ascii?Q?DVfPV46z72eE8PkcxLc23LbqB9DpxzaJ6YS0bw5T2ZCRumakvZTnyVkGBI3j?=
 =?us-ascii?Q?06ifDf89RyjXssF2qQw1wWbu0YcpFp36QUaUImzfyNodD7ApWanp7nAUbs+3?=
 =?us-ascii?Q?ap5UoanNPb+I2B75mAA54drxLw705F6OwNqANcUsPIHD9KrOSvTb/rnGntF1?=
 =?us-ascii?Q?YjS7k6o7i0ugFKtu/4bz7xvaDJY8WiL59V8eaHSG8SqXNHdcY9i4NJWsgTYu?=
 =?us-ascii?Q?2vZFk8WG5IR8wdKQ/Bth9w9ayRVgUoDYZm+V16D0/0AUbpedYfW7yJzWM+Kq?=
 =?us-ascii?Q?FdNz5P+lwdMcNCK0WPu4JLmGoCSTRW1GaaJRIuDPW30b07jdQbNSMXCxv/Wv?=
 =?us-ascii?Q?opFUsKm0/mVf0vuUaBOdREd9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97522dea-d7b2-494e-0f7b-08d966f3e58f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:39:56.5938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5Ox0OTSHxtlTZNjR7/3hSyzQZ2LITT3OAzXsMXgzvPGpQN6yM7SjCHCqJOeqpWbiLK8SAU5MGsvxOhkhC2EBzemljJhRb29hGZVo/tZ/BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1822
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240077
X-Proofpoint-ORIG-GUID: ZjtUYIL25D-WKr4Oswk-UQxx0qtc92uN
X-Proofpoint-GUID: ZjtUYIL25D-WKr4Oswk-UQxx0qtc92uN

Hello Konstantin Komarov,

This is a semi-automatic email about new static checker warnings.

The patch 4342306f0f0d: "fs/ntfs3: Add file operations and 
implementation" from Aug 13, 2021, leads to the following Smatch 
complaint:

    fs/ntfs3/record.c:158 mi_read()
    error: we previously assumed 'mft_ni' could be null (see line 130)

fs/ntfs3/record.c
   129		struct ntfs_inode *mft_ni = sbi->mft.ni;
   130		struct runs_tree *run = mft_ni ? &mft_ni->file.run : NULL;
                                        ^^^^^^
Check for NULL

   131		struct rw_semaphore *rw_lock = NULL;
   132	
   133		if (is_mounted(sbi)) {
   134			if (!is_mft) {
   135				rw_lock = &mft_ni->file.run_lock;
   136				down_read(rw_lock);
   137			}
   138		}
   139	
   140		err = ntfs_read_bh(sbi, run, vbo, &rec->rhdr, bpr, &mi->nb);
   141		if (rw_lock)
   142			up_read(rw_lock);
   143		if (!err)
   144			goto ok;
   145	
   146		if (err == -E_NTFS_FIXUP) {
   147			mi->dirty = true;
   148			goto ok;
   149		}
   150	
   151		if (err != -ENOENT)
   152			goto out;
   153	
   154		if (rw_lock) {
   155			ni_lock(mft_ni);
   156			down_write(rw_lock);
   157		}
   158		err = attr_load_runs_vcn(mft_ni, ATTR_DATA, NULL, 0, &mft_ni->file.run,
                                         ^^^^^^                       ^^^^^^^^^^^^^^^^
Unchecked dereference inside function call.

   159					 vbo >> sbi->cluster_bits);
   160		if (rw_lock) {

regards,
dan carpenter
