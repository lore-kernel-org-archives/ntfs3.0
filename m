Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2D3FC3
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 07:44:47 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17P4JUjV015024;
	Wed, 25 Aug 2021 07:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=/9HXSRVTAHKh+Nr/rviBNBCTmHz374DZLRVAIeu6RQI=;
 b=MY5T0SwMWw3z49sWcIUcK0HIVFtZ2PVuUfTIiUA1o5v2TG1ALUZEBDGsgu0eEHbm6QpV
 VqPMKxPW+dbwfUa3mb5z0cTJHpsrRBanSDq4VpZqO+ROoh2vAsM8aQHdazdcycDVJl6J
 R/8J+Ma8WzSOR0X4bDjjyQJQ6sSCDhHXjcsgekd8eIMkY48iL7HTlVU5gFIYgpdFY84t
 SOURX0R0iT+PXAHHqhqWHDn2Rc+zcCTHdecKurKnislvM1WVBlF6GnbPyQLahEYS+rLq
 ggPJHCaukoc9EClQtr6t7zAi9votSeaoM+ntyqUVWBdQMiT/UK1ubamwKK3oxA//uBxD Yw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=/9HXSRVTAHKh+Nr/rviBNBCTmHz374DZLRVAIeu6RQI=;
 b=bDbDxAYa4CjmY6iDQDxd4m5vxlyGcg1K4iSl2++mRcBIEoHu0rTa4LT5tfMCYzcnA02d
 PhJeCy8XoRRY/DDEdhcNxX59GdcNqWKhjaNInf83IdBop4yzOb89SlogGIZVdCuETtOF
 8C9FO8g3TfEJK4LQU43FvNvxkBuuLGC8yKbwHUtATkXsKZStGEExjtFhs4GDP5kzkzMv
 Gi+9MIbcvYWkTCTwDBpROLRuGJSo8xN9FPVsT3BZjHH2IlXj9mVihCS6vSzwX0/lfoc7
 cnz553zuVc6qbFAJSGs0zL5O8wDmHgZ/k5vPNjaCixfR6ADEsGW7cdJolBdlFr8mp22c XQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amwh6jnxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 07:44:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17P7fcQU172809;
	Wed, 25 Aug 2021 07:44:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by userp3030.oracle.com with ESMTP id 3ajpkyw8w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 07:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOcGoh65R1DeVNon98/17I1NBcHdAEBplVaZmxIJUvrWzWSRHCSMt6AZZn2qQGt/Y7Tbu4v8uos/nEsrBBKC1NBsbjHbhY+f/fQnbfSTV2xvg2fvn1fkCxkYmEWB6tV1y/CArN+kDOVJf0DuQdHKQAqPUpfbzp7/igpfFwF89aRxbCsglsFU3qfgTiX/RIPreTiOgw0Y0owsdxvDU9oylG4O7r0NjzXWSVxlZboCgcikKl2oSjAxrZUdnXeCrVUixk5YaVShP9iEf8VhJownq/4UC/BtQxdTMrmtDmMCaG9Dlgbzgf0lKD8f1G/eZ9suMCvLThEBP6ZSD22PouyB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9HXSRVTAHKh+Nr/rviBNBCTmHz374DZLRVAIeu6RQI=;
 b=SWeLCMiD5xEyRcBLRJvLeIi5elGevdRyZSStk9kB/c+WHWEaSc+lk3PmbqC9zEyY4M4A+I7I/cUUW3COWmxDKvxT0qwBkU+QTCyjwmq8W0htNq00a3+icsRtiIEdMJzMMz102Nbp5BQUAIKUullGXHn0DOxgVCwx+JpQ6faLtOJM/zSCLznFfbW9E+Xmkx3FLPZ3eGwxlRal+yRxoP5lO5/n6wl+w+k+zx4fzSyAQowhSdmeVlLMKYOFaqlx3MyAvgKJ8kcBKwvxpQPd9niTx9c6VjZ+5z0U/10pg7OzuCZHBv23XaaPPEma8AWRDpi+95L2XISOXCo1w41IDMiGBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9HXSRVTAHKh+Nr/rviBNBCTmHz374DZLRVAIeu6RQI=;
 b=WYRLtZ5ESFUtXu9m/aD+I+cuCgr85S/L90B75DT8283M1g203EldgrTnSGycyXCz4EBT6uhjGqkB9TLZvt+Zz+qiAdXyki8I44MM9StoWJ2xOKmS95bSPK8ctpBnlu/X5/I7YYudD7phVKdjBc0PAuDeGjPBG8zq4jwyLIWxexM=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1374.namprd10.prod.outlook.com
 (2603:10b6:300:24::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 07:44:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.018; Wed, 25 Aug 2021
 07:44:40 +0000
Date: Wed, 25 Aug 2021 10:44:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: inconsistent NULL checks in mi_read()
Message-ID: <20210825074428.GA15424@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LNXP265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::35) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (2a02:6900:8208:1848::11d1) by LNXP265CA0023.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 07:44:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94c058ba-0ad5-45b5-102d-08d9679c31ec
X-MS-TrafficTypeDiagnostic: MWHPR10MB1374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB137400469FB794F2B609DD248EC69@MWHPR10MB1374.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z1f0uv6ODR0fIFjqadBrKnEi5S6c2bKkF87Y9GWi9Ma7GA3j8Xs+7KN+IdWv3hEGpbAoHj+8Cq/XjqyKM5brPhv/KUrggTy7SPjVpqj5qeGKxjGTGYK11oXMwGFVpg/dfjKH+0Z5td/DaYwJh4R3kVWvUmT+IPsdnMxtmjXIujUWKJVsqGJ/P3UL4WpADaCNAFjZWYxolFvz22HA1O5jycvjIkdtLDdF+4CQKlvbXibNFr61TGBEIBHzkZoEeqd9hA/6sptQTWq0Uq9C641nK3WdSkncPZ1oGnw5M7daHelCT5AgwbLguQc30qIgg8NHsXgpGuTuA9fI6kYbvwJ++lDFyRVdb9jqgxe2l/X/IdHaWpq9/Pn8eV+yDiVux2okQvZHEwtaTDsDGW3It9pszQzpKFuLEhqQ6I5OmpZfqTtmefRqPPx46qzPvUuA8elX8mT8nV+swMWBkxTojJv64/IvxfeT5IHX72UZG/lXGoyq6hkOcJcEqNciWfNNO4adZ2sN1Z+wMA/3hAGFWkqN0rRHmzzsVX8u1OdZmgDHA8YPmWfSomNX2yadwC2GYsEQNhHiup5gRAnYsCwIa9GEsRNyMDYht1eI3rCOplgltYWXQ5s5o/HE6kJFfw/0nvJa9uxuWnodBfMBfEGw4BmwzA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(376002)(39860400002)(136003)(9576002)(38100700002)(33656002)(66946007)(6916009)(66556008)(66476007)(83380400001)(44832011)(1076003)(5660300002)(4326008)(6666004)(2906002)(186003)(33716001)(316002)(8936002)(55016002)(478600001)(52116002)(8676002)(86362001)(9686003)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hyMr6jNhyIa6/Km+rQrDZZvF4swc7N8ZW3FB0ajJOS5W15G5ioGm8umirtWK?=
 =?us-ascii?Q?ck5wJJ4SGtBYUlGUcFw7nJ25f+twwLzx8fjDw+jkX5aph9PhGu2CSibcJQkC?=
 =?us-ascii?Q?Ix3Mvv5e/lQdvT0bZjkSKJjtlSDcweXxpKA92JCvpNmRyABdKuhyJAEob8HW?=
 =?us-ascii?Q?z0pvOCoe4UZjCY3mam3/bwkT/0G1jLNhEaRqjxNWyB7OmwJ7hyCt2Ytumgi4?=
 =?us-ascii?Q?OMgi9PimdnS/lpqZCRmxs2fLiCebfoxS/HguBAKc3MJNJ4KNGKzaINclkCQU?=
 =?us-ascii?Q?o8AHnJDcIKsYCG6GY7WwbVDgYF6RiL8lyy0Qr4P8h+cSUqjC5jwpkw/SL1GT?=
 =?us-ascii?Q?Q8olKmqKzUGDWrtfVf7oi1RjJ/ETEWOE4RvLR1UPDhb+z6bz6dRptILddM+z?=
 =?us-ascii?Q?9XzY3O6H0iNu8RspfidELFJXtcpRjjKEwOypEv0692DxwQhi/V00hKcuYktP?=
 =?us-ascii?Q?iYGs1d/5X25TR11WVrGtkbAzx5B1DGBxqlBMZ/xpITLRqvBul5/UuemY2lmY?=
 =?us-ascii?Q?lmp+hNZs0IUNcaSO5ZcoT+KISDb9m0edKXleZax7f92RkCSQ+cxmmST5bsuV?=
 =?us-ascii?Q?df97ITog+nRBU1p7Euw1gnlK8cvNZ/DgS6F8UUdsFlwfH8Jou4Ai5L6n99gP?=
 =?us-ascii?Q?0e41lOzvngchCFWIzrL0i+nsYas8Z+NBbVUdj36ENj3VJZK8eZ9xBfDcWzA9?=
 =?us-ascii?Q?4K5wN6WOMpQckpopRbWUFRsOXur0Ka4Y5l0Abhj83oNaOu2pFT9YnZ//dHJZ?=
 =?us-ascii?Q?SpI17yFLp0rFEfHHgQUUbyRgPK6Cima4e+i6Be6RGLzjZ9hF8IVwyCB0sD4v?=
 =?us-ascii?Q?pHDvdeX2m2wZosGl3hoFkIpIgc5StdCPWhfpfKjwmN0ROryAadjZDtQFl4Tn?=
 =?us-ascii?Q?FJGbiVgn3oTkynuWq9MuOG+++HPqcWFGbPDFss0iXcwFrhY6VewDCh9AXqsr?=
 =?us-ascii?Q?KSriXPIJWSoJ9ODmgj1g0U48Wc6NI+egleeDvE0XxRwOoCQMOHuS13n215Uy?=
 =?us-ascii?Q?kpFmJa/r408A+SyND5hRXOxXHVYWeQZE3RC/li+uvmV2szkUrLcGJb2bKdtC?=
 =?us-ascii?Q?pnRZ8c37zqCnvWYDnvWOt4fvYfeW3lshKmeRidgUWsRxwB528Ug2S9dNlT10?=
 =?us-ascii?Q?HXzgOJRvdkYnFTzFxjU2J5R9eP83nPOVD87gyw1oyGkuTF1A1QL7tzvmbnw5?=
 =?us-ascii?Q?GecYkGonvilf7eh0/ycefVKQOwkTRpi1PgTbgb55+FhkF2PrK82pcwGo1W89?=
 =?us-ascii?Q?9CshnHYMBjioD9PElD+vCUO2ehTeDcNYXDEnGasDb0Li4BYbLfCF1tsfqneJ?=
 =?us-ascii?Q?xFXYJqD7aXtkzFWhpCK0VoDW2DSs/chhaoXlqDtcr1JxdK2mpZC+0FE1pQwI?=
 =?us-ascii?Q?2kZU2DI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c058ba-0ad5-45b5-102d-08d9679c31ec
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 07:44:40.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23ctC8ABeIfLoSaFxV534P+/ByDv6wbcfe2DIn2pYv4y7wz77I+5vt1Xiv8tffgW9yMyNk0W+6c3iz/r3dLtmoL3OeIQuHDDEYHaAMt2OcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1374
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10086 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250045
X-Proofpoint-ORIG-GUID: bYoA7R9H6IPoygJMOGY9GJ7V7gaSgn_q
X-Proofpoint-GUID: bYoA7R9H6IPoygJMOGY9GJ7V7gaSgn_q

Hello Konstantin Komarov,

The patch 4342306f0f0d: "fs/ntfs3: Add file operations and
implementation" from Aug 13, 2021, leads to the following
Smatch static checker warning:

	fs/ntfs3/record.c:158 mi_read()
	warn: potential NULL parameter dereference 'mft_ni'

fs/ntfs3/record.c
    122 int mi_read(struct mft_inode *mi, bool is_mft)
    123 {
    124 	int err;
    125 	struct MFT_REC *rec = mi->mrec;
    126 	struct ntfs_sb_info *sbi = mi->sbi;
    127 	u32 bpr = sbi->record_size;
    128 	u64 vbo = (u64)mi->rno << sbi->record_bits;
    129 	struct ntfs_inode *mft_ni = sbi->mft.ni;
    130 	struct runs_tree *run = mft_ni ? &mft_ni->file.run : NULL;
                                        ^^^^^^
Can mft_ni be NULL?

    131 	struct rw_semaphore *rw_lock = NULL;
    132 
    133 	if (is_mounted(sbi)) {
    134 		if (!is_mft) {
    135 			rw_lock = &mft_ni->file.run_lock;
    136 			down_read(rw_lock);
    137 		}
    138 	}
    139 
    140 	err = ntfs_read_bh(sbi, run, vbo, &rec->rhdr, bpr, &mi->nb);
    141 	if (rw_lock)
    142 		up_read(rw_lock);
    143 	if (!err)
    144 		goto ok;
    145 
    146 	if (err == -E_NTFS_FIXUP) {
    147 		mi->dirty = true;
    148 		goto ok;
    149 	}
    150 
    151 	if (err != -ENOENT)
    152 		goto out;
    153 
    154 	if (rw_lock) {
    155 		ni_lock(mft_ni);
    156 		down_write(rw_lock);
    157 	}
--> 158 	err = attr_load_runs_vcn(mft_ni, ATTR_DATA, NULL, 0, &mft_ni->file.run,
                                         ^^^^^^
Unchecked dereference inside the function.

    159 				 vbo >> sbi->cluster_bits);
    160 	if (rw_lock) {
    161 		up_write(rw_lock);
    162 		ni_unlock(mft_ni);
    163 	}
    164 	if (err)
    165 		goto out;
    166 
    167 	if (rw_lock)
    168 		down_read(rw_lock);
    169 	err = ntfs_read_bh(sbi, run, vbo, &rec->rhdr, bpr, &mi->nb);
    170 	if (rw_lock)
    171 		up_read(rw_lock);
    172 
    173 	if (err == -E_NTFS_FIXUP) {
    174 		mi->dirty = true;
    175 		goto ok;
    176 	}
    177 	if (err)
    178 		goto out;
    179 
    180 ok:
    181 	/* check field 'total' only here */
    182 	if (le32_to_cpu(rec->total) != bpr) {
    183 		err = -EINVAL;
    184 		goto out;
    185 	}
    186 
    187 	return 0;
    188 
    189 out:
    190 	return err;
    191 }

regards,
dan carpenter
