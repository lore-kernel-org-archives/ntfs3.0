Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AC572
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 09:53:24 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O7LrxU030422;
	Tue, 24 Aug 2021 09:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=zBR6Auuw8TDb/kJQJmnYoxdABn16affgVeJptk+hYxg=;
 b=aFBn7O1X7wUv/Ns3UvEkeYD+JnK+qMxp2frl3Rtnk6D7FtbeJ9ooEvXtxC+QjpWBn8yW
 Wj8Dn7zAXzlTPEEF8+HS8fvH92ZLmfOA1543jRM0P3lf1VgD7RIVhLLEq4jZAo/CtwqS
 fBGXZznQ//N60r3ibjamT90vsitKilSk8cVWPis+iHyKn4WMo1PTp6UTVJb0sBoYdGHI
 4Zxo4UlELyBd9avrja1S3OhwDzG88JvY3fFt6U+ZrwF0eE40agg3NwAxHVzU7/TGPQjf
 lfMKAMZGru4YE3mx6RaLyIAAgg91ad0VsNe97PdDMRV9d+qY0rtjndOBLYrfPliw/7oe OQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=zBR6Auuw8TDb/kJQJmnYoxdABn16affgVeJptk+hYxg=;
 b=gwiUqhwF4zqilnlOvmjocJzmU3ffsADO7EGMa/YKbykrlu2gnpIE4FAUgeHYyKNrYqZD
 XAxsDSsOcl3nCk+sU+sAPouAhjSZSejZ4VrBhEIK5iqRHUbqqjLeiftVZCvdHe21Dx+Q
 BlSU79nbBNB8UwhLfNunymAddc0xr8MKlQsYfoUhQWFix7uHVp/CwsQ/LyTPzZt8U9ZP
 VbwCYrHeeO/wjKO4RavrRY+/sVYj8mjGLy0Wp8nSWeKthaAAZniD1FuzhXUOuViOfUFa
 gNMMmJj2XQHKn5nSregBtHn8LDM5kQpxG63yF1EmReWm0V1UPI6ehnYvbGNsMfUJJzld eQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amv678d29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 09:53:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17O9jKmw011381;
	Tue, 24 Aug 2021 09:53:23 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
	by aserp3030.oracle.com with ESMTP id 3ajqheas4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 09:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyFO8bc+S72pssrs1mhsh7z7v+YQIL1nFwkB927ZKtbM0OACG8L8VwSIFENIZyMXEUqzrJLdJ+mAHz/MqQtflVh1e+pkfcMBywbZGyHPeU7PADhevQmNfdaO3XdnbttNr6Ud+DBKzaKdn7NUexIbEuPuTGeBYOKeA9YCFRz298R+xLmY9iHJAvo/cMuZZPTDwvaLDf6WzXebBphjZYW8bFnaiuuS3fiO0KxcC1EBDHU10xmRBpHHRInEOWTJzM+QVoMibAdkttvBlucKUa3cj44QA6tD2AgcFHENAzpUYjugrMy5CJI5UjoikP+IM7xf8YwXnH3ZWA6+UZU8OabEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBR6Auuw8TDb/kJQJmnYoxdABn16affgVeJptk+hYxg=;
 b=K9VWdoFDhxKAK2eD498vKgoaWg0ObHvIwAshZTGNQhyQ+hSppr/MO2ZxbA82XGjikcXmZzCLWgjrYTiRMhtNcN6dnn8I9RdQ4Hanv5fpx46+IutuIdIlH+9Z/+izu961uuxYgHLZua4Ksohz0DjAy8A10hZquPxdhs/94QUxStb1aF9zG3NYlLRQot8qyJfA9CUupwey8XuarvI7fsBG6GQkXrAXW/g96/TzZGFMk1m/4W6E7rxONf0pPZ9nvVYe2WrZpn6hE6motFB1hWRB0N2ov85fageV0jGqUvF/tl/ToyQUZ772GKPMvyMXnsGaBrass+E8nOIZIG7ciJfsZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBR6Auuw8TDb/kJQJmnYoxdABn16affgVeJptk+hYxg=;
 b=xNRhLL3mjURqZ66jHDlRvl23dcwKgozCuNvqTEbRsIof0aPSOSUvqK0oWi8PvX6XRq1r2UD6L9kVu3pRG1F8LhnPkpw/E3R7c/AfvTPa7NosKu3WrEfugGuK2GwV+hlX/cj8QJO4Q4TdpoJ/zQ9s+9TRh1f73M0GBSyGhbfimuE=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1246.namprd10.prod.outlook.com
 (2603:10b6:301:5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:53:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 09:53:21 +0000
Date: Tue, 24 Aug 2021 12:53:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Add attrib operations
Message-ID: <20210824095309.GA23599@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZRAP278CA0013.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 09:53:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce7834ae-4557-4cd6-88d3-08d966e50180
X-MS-TrafficTypeDiagnostic: MWHPR10MB1246:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB12466061D86F205531C4DEEB8EC59@MWHPR10MB1246.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IFWAMAYAVNc1Y0b+vd8KdK6UEfsN+OLF75TN60mRbCSrLb8WDVme3ojIOsoETXDE02r8gC9ZOBDsnJZYoJ5oXIZ6EKb/ze8SRaZedWSRSWhOrhdp+Sy7ewD/olMC7ystp8JIF0b44/uyWoE7ro0bA7NLFCHbI97aLIpYsggRjzf4td0+vLwYVBnZL0Pp0251P/86RiygzckeWXZwruMgT3dxRwxHI0fYp6fY+u6+OHruCP5yrbAqkvmdawtCG6DG2wS7PjRdV6hK5eBdsth6jUfm2WmREvrYmadTWyRtiYXSLMQ3dnXweJyiCflksaSKRJVXIojUPlEHXvqRRis7XbuCixbwFu40wlODW6eMUELhQEBi1GImnAhQjZxqB6hKpLus8GM28eiCi8meJLQdJYhPST0EZ4bXeK/TNSn5ZKvWLe12pHiErDdxx66IwINiwgPObIbd35BA41WwOif1MM2pKRBJIxRmQBIm6WAB0GwFt6xFU2vh5iRpHbqGjNUFZRfb5uGXzVFEUpgmc2t3weJsjJ/2ZLH8YkGyr1mTN3ECTwUnpVxrpkkclj49tldsUgT3pJKK+iiSV8yhQC8nIfu2kTurEA3+bJtPRSFsNVWNsG1UXLCwGrgol+fxS4DX1sLsLQbslt5x8FhniradjhUrqugb0C1UuD940wI/fYfv8rJuBRmb2CMKcxtjU9TUZa5SW8LrNk/h30LzTXoOrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(39860400002)(136003)(376002)(956004)(478600001)(52116002)(38350700002)(38100700002)(1076003)(8936002)(2906002)(44832011)(5660300002)(316002)(6666004)(9576002)(55016002)(86362001)(4326008)(33716001)(66476007)(66556008)(186003)(33656002)(26005)(6916009)(8676002)(83380400001)(66946007)(6496006)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S8/sOn5JUQz8o82oTF6RtxLgwHOqrBKi0Z6NLsvzNXHF6x2S3HwEAwJUPXLH?=
 =?us-ascii?Q?nNvbgP5ZnwueYSZgY4x8iiDNbQxBUwGOjDAOEr+Ey8ysCNnvLiZiyeen5d5X?=
 =?us-ascii?Q?wD4hsIYhcnR5atam1LzQonnFqYH48bbgSLLWdQz7s3qsupBgv7k7By/qHk2L?=
 =?us-ascii?Q?2op/ylOdqsDXovZRTLmfeSpZrU5fpbAOnOi4KNduvpxjhOgCgdX+jH3foEFf?=
 =?us-ascii?Q?G1zD0XK0tj3MGX4yttCkStIGZowhpKKLgi/qBfccPu+IjyApg346WEh4FFUZ?=
 =?us-ascii?Q?j/VUAkViGMaT+5XeNcDO2SlYnFP4eahJY0ya3uxSoP8zYaa1xZkXklK6btg6?=
 =?us-ascii?Q?LFARPV3BFs2npG/bN+pfGX5RgqlBzS1IqOw2KFE9asOa+JO7j7LQfY7GtSN7?=
 =?us-ascii?Q?leqm6dfQD6k+E0WtxUOV+K6gyarvwNMB+JTyUOZTSlUoC0CCDIELIlYUufaI?=
 =?us-ascii?Q?m3l7LDjTp998zGQyWZgDLacRppp0AX9+OFpcso515W7QeQ6SvLN/bivuXp2S?=
 =?us-ascii?Q?GD5Q9O71pgKmFUCWzfbayzVQzR+HGC9fP6/bWOP5n39nYqmAiLP7aT922deX?=
 =?us-ascii?Q?QKvSH9MjI9NYviyjfkU9dhyu2czlsBXXhyxm4NHnUOafSGmmLOH+xeXIB2q/?=
 =?us-ascii?Q?KfDdoBH/ll6TSxK/v7kZISMan6PirImxi9AHt3zu01rSawGh2sXweplhsmfg?=
 =?us-ascii?Q?/oU2sTw4ROrdY7EiF/zPEWvs1mexqesdefXUlsTdptf2vOKi7ca+19qSlfFq?=
 =?us-ascii?Q?IPgcmvl5jLJgcmBYFmQi4RT44sifo+bn8cIxeulw41KRxq5Ust6Cjf3WMN6j?=
 =?us-ascii?Q?cPhSx+cC+IKxcUIQKdJdzWxinubS2EWlokD9t4rY8g1XXeXC+Htc94FhzCq1?=
 =?us-ascii?Q?DfPzbRSgA10WeQBnqWHiDAX9VVhW7RWoXEqRqsFMDHZv6oUTQnurJTlwXb0/?=
 =?us-ascii?Q?M4LBj2ke5hGJE0jfhM0QiB6Ww2WnWw6zsHXtUqqc+j4RB9YWPi/vXxvXnjo9?=
 =?us-ascii?Q?Jbkh9dxbppU6RU8illu18Yf3C+L+Dz47WVCFTedGG6k1SPBWi+ZXkDkigSir?=
 =?us-ascii?Q?ufmM2yEI/Ik9Q3hvGT/iJue7LnyGsebr3ljNPYWiW48bIaSyvgJBQkX59U79?=
 =?us-ascii?Q?95c9caMkew9ZctWQXulVG8TfTJxN50IJzxpoxebot3DxvTmLCqI2VZZUvoUp?=
 =?us-ascii?Q?qtryzo8hhsJfmTTw+SymffijnDt5pK27lblgxavwI6Ga5S6X+htxQ6QL0cG5?=
 =?us-ascii?Q?BAEmYDr/naXXk7yLm3CpT1ua8mswAIqvi5FbEiWzHS8JsgDcFAnKoIg3DTna?=
 =?us-ascii?Q?/SriMiBnSKRXvkXVcHZt13nG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7834ae-4557-4cd6-88d3-08d966e50180
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:53:21.1388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: su1D3zkNDUReyBzUQUjpe785H8nAwfp6AWJ3MlyTB+k4OAWNTtF8yug9hGoVWr4Sw5wqp6+v+XOOBjq3I5aHYjJfXLmf3EXoNccAZ1svAZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1246
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240064
X-Proofpoint-ORIG-GUID: LUX28XXoZbPu9jtyxMm5sJBbjKMX1kr6
X-Proofpoint-GUID: LUX28XXoZbPu9jtyxMm5sJBbjKMX1kr6

Hello Konstantin Komarov,

The patch be71b5cba2e6: "fs/ntfs3: Add attrib operations" from Aug
13, 2021, leads to the following
Smatch static checker warning:

	fs/ntfs3/attrib.c:882 attr_data_get_block()
	warn: was expecting a 64 bit value instead of '~(clst_per_frame - 1)'

fs/ntfs3/attrib.c
    823 int attr_data_get_block(struct ntfs_inode *ni, CLST vcn, CLST clen, CLST *lcn,
    824 			CLST *len, bool *new)
    825 {
    826 	int err = 0;
    827 	struct runs_tree *run = &ni->file.run;
    828 	struct ntfs_sb_info *sbi;
    829 	u8 cluster_bits;
    830 	struct ATTRIB *attr = NULL, *attr_b;
    831 	struct ATTR_LIST_ENTRY *le, *le_b;
    832 	struct mft_inode *mi, *mi_b;
    833 	CLST hint, svcn, to_alloc, evcn1, next_svcn, asize, end;
    834 	u64 total_size;
    835 	u32 clst_per_frame;
    836 	bool ok;
    837 
    838 	if (new)
    839 		*new = false;
    840 
    841 	down_read(&ni->file.run_lock);
    842 	ok = run_lookup_entry(run, vcn, lcn, len, NULL);
    843 	up_read(&ni->file.run_lock);
    844 
    845 	if (ok && (*lcn != SPARSE_LCN || !new)) {
    846 		/* normal way */
    847 		return 0;
    848 	}
    849 
    850 	if (!clen)
    851 		clen = 1;
    852 
    853 	if (ok && clen > *len)
    854 		clen = *len;
    855 
    856 	sbi = ni->mi.sbi;
    857 	cluster_bits = sbi->cluster_bits;
    858 
    859 	ni_lock(ni);
    860 	down_write(&ni->file.run_lock);
    861 
    862 	le_b = NULL;
    863 	attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL, &mi_b);
    864 	if (!attr_b) {
    865 		err = -ENOENT;
    866 		goto out;
    867 	}
    868 
    869 	if (!attr_b->non_res) {
    870 		*lcn = RESIDENT_LCN;
    871 		*len = 1;
    872 		goto out;
    873 	}
    874 
    875 	asize = le64_to_cpu(attr_b->nres.alloc_size) >> sbi->cluster_bits;
    876 	if (vcn >= asize) {
    877 		err = -EINVAL;
    878 		goto out;
    879 	}
    880 
    881 	clst_per_frame = 1u << attr_b->nres.c_unit;
--> 882 	to_alloc = (clen + clst_per_frame - 1) & ~(clst_per_frame - 1);

In this config "clen" is a u64 and "clst_per_frame" is a u32 so this
code will truncate to_alloc to a u32.  An easy fix is to use the
ALIGN() macro.

		to_alloc = ALIGN(clen, clst_per_frame);

However, I still had some questions below so I did not write a patch.

    883 
    884 	if (vcn + to_alloc > asize)
    885 		to_alloc = asize - vcn;

If to_alloc is too large for asize then make it smaller.  Is it still
ALIGNED?

    886 
    887 	svcn = le64_to_cpu(attr_b->nres.svcn);
    888 	evcn1 = le64_to_cpu(attr_b->nres.evcn) + 1;
    889 
    890 	attr = attr_b;
    891 	le = le_b;
    892 	mi = mi_b;
    893 
    894 	if (le_b && (vcn < svcn || evcn1 <= vcn)) {
    895 		attr = ni_find_attr(ni, attr_b, &le, ATTR_DATA, NULL, 0, &vcn,
    896 				    &mi);
    897 		if (!attr) {
    898 			err = -EINVAL;
    899 			goto out;
    900 		}
    901 		svcn = le64_to_cpu(attr->nres.svcn);
    902 		evcn1 = le64_to_cpu(attr->nres.evcn) + 1;
    903 	}
    904 
    905 	err = attr_load_runs(attr, ni, run, NULL);
    906 	if (err)
    907 		goto out;
    908 
    909 	if (!ok) {
    910 		ok = run_lookup_entry(run, vcn, lcn, len, NULL);
    911 		if (ok && (*lcn != SPARSE_LCN || !new)) {
    912 			/* normal way */
    913 			err = 0;
    914 			goto ok;
    915 		}
    916 
    917 		if (!ok && !new) {
    918 			*len = 0;
    919 			err = 0;
    920 			goto ok;
    921 		}
    922 
    923 		if (ok && clen > *len) {
    924 			clen = *len;
    925 			to_alloc = (clen + clst_per_frame - 1) &
    926 				   ~(clst_per_frame - 1);

We re-assign to_alloc here.  And it's smaller than before, but it hasn't
been checked against asize so it might not be small enough?


    927 		}
    928 	}
    929 
    930 	if (!is_attr_ext(attr_b)) {
    931 		err = -EINVAL;
    932 		goto out;
    933 	}
    934 
 
regards,
dan carpenter
