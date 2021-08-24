Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26FF3FC0
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:39:21 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17OATU9Z025062;
	Tue, 24 Aug 2021 11:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=XjcEgNAAZIU+S9fsApcxYoEmf/CgrB4aQeLywhgEB9k=;
 b=lTxvNmoHGcnejL/5x8rqGK6+p1s0kCEaOmUdOLngHq73HsE4huNC2L4WaEYGkUy1SOei
 sIR3bf/mx3qlFAVb7uryX5DreQaaOPrQU2410ngmPyjC08KXCLkF4/RxDjRYiuclppCN
 doMY6vJztdUrDvf2yrmUT7ACYkiXTT9QvR4ZeNx9agwq7jAVjUF4kXRI/87w+5KDjIvZ
 tJOBJBl9GCWaHzfnBzpi/c2J2GSKjjo4ovGcvIIPSAacAYcTyYVmPZjHdTK5rldj28ew
 zgQ3R8NuXSCsJ+ZbqRb7nngLrcW0eUnl3JY3ibf34xeP5PLLAM2rUXl8d3PSE9Zk++PG EQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=XjcEgNAAZIU+S9fsApcxYoEmf/CgrB4aQeLywhgEB9k=;
 b=0FJ9n8j0YsRmYw/VkVAIKm/aXGh5UgfQAIkYGsi160F06DkWt6xT0SClU3BMaPhr3jmy
 8fEA6Q7NCS8eZ9xN4MysaeC1Sr8PxfSIWLT6lS8EqdU7vcLFARvsDNs3P4RvCjBe5irt
 hY5gl83iiY83Tl8LgkDe6exgMQ2/5LpJqh3uDdG6z1yx0xCopCSVXN1XyE2KhaKFLquL
 xZC9/bKPOBqXQGFKuhIS3PMyW/UlL7BKmULz6U+7MpjKYb2rVNYIk0FBlsQgaeJ+K1jt
 hSq45xUw0gZo9/Sn59znupemmCDfyIPEYL0/UDLBxeKCdHCsem2P2goTGNOT16MSbd1c 4Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amu7vrrnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:39:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17OBVDcg058889;
	Tue, 24 Aug 2021 11:39:13 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
	by aserp3020.oracle.com with ESMTP id 3ajsa54h2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:39:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERbZrRIxGfgmvVe4gaIpIvIVDxAtbGvcAfdH+xLuuIfGHZA9hIHJczgq1IiKb4CyjVFaXhVvvL3vRnPeUFkXQVFq/iF1t6Qld3Vg6MSeavqv43wGFvnVIJw7bDZ/ZGgGcDlhsEJl+Al+oWVJm+shEBrb/j9EcTffiDqFYK5k8tiv3d2+W/43yljgc1fDuYtbTHnAF30kUj58+B1hfwLCQBgw1rpF3UElWzrjqQLuWL8s5VLueY+idsrEf93bDccuQ5W2UVAFtsPwQ4W2jKdImJSuy4WXfGdVJKT4HDdAE7O+vAHGIu5o7UdhYofctbw+8fjVCtBmNW0Jd2O9wRmE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjcEgNAAZIU+S9fsApcxYoEmf/CgrB4aQeLywhgEB9k=;
 b=esyLZnGICeEj+J110ZN7BRgPW2JCtYIkomxKtCe26ZrFG6eVKkWjvAMPdkjGYdD/YIgFIY+aECEM1tKYJyKAYd7mcK2g4ejLqUffRUzwiIdVwQgMrUTRQs7pID8BAdjXUrz/1CzPO0EdgGMNm2BxFgj1Afq8iZAHIVyo9I+02kpzMzMp9y/pfYMZgZJmUE59wwUpDS845wzWE5NN2W84a2FMB5Ag9+eTOan53xi8GoLiwPJ8l/qhIBxrgGVhYw/B+slVuvWxljgsZZ8IbF3T/Ku2no9lhKMF15Cb6cG/xvUIOk6fefOV74jgpv2Q08cVzCiAi2AbBY3tAH7ruwuEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjcEgNAAZIU+S9fsApcxYoEmf/CgrB4aQeLywhgEB9k=;
 b=REqrpAw2C6U8BmigxPoEj4NnczzDricplqu+goAYdm2mycNDmf79HhffpuH6aen3sLV1XnpjY2wPqPVEMyAQE7QrkIk0q71YMU9pp6Q3Z4yORzJ/NVEaNs6fc+0/G/PxL96GuPm03nE2oyi1dM/4mpldRAslEDijrBCr6/i79uY=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1822.namprd10.prod.outlook.com
 (2603:10b6:300:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Tue, 24 Aug
 2021 11:39:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:39:12 +0000
Date: Tue, 24 Aug 2021 14:39:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: mask truncates in ntfs_compress_write()
Message-ID: <20210824113901.GB31143@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:39:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0a43185-6cba-4925-c557-08d966f3cae9
X-MS-TrafficTypeDiagnostic: MWHPR10MB1822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1822410B0177BE7E7B8BD35F8EC59@MWHPR10MB1822.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+NkLwJiNjp+Pr4QoyO+3HBBJajHm3A+0uFpQX6Wrkw7FcNuL9C9O0/TaBGd59qwrqjmIrE8joa8pu1dudF02llLh/vbsVEyzKUrrPDHZyaq2RUl983Z0NVfuapsFaE38AJ3P0SiC8OdDS53DGe16oa9632ZLSexpq5udgL0PU4bwhaLS6MSGj2iv+PrHJ/IXCm5Qu3mPEjihPnA15fxPE9xZ4Dyit1OkHfq0GxtVLeRsu+2+VyNGBFtT5NTNZ3/R2vA/Y6e4DDniY0wmYYEGMdYyhb3VyGHaglbt1Pxyn3nz2nO47LhMIKJKcWk7J/jW7vJ1TvDri5sicPLjm/ue9Jpw6Al0m1tIXYaNlDoi1UsfFmoy8x3rpShXH10Bp0bfX4SO+XnyofhrKPhrH+pLuZlgtQPAJsT6LuM6o7J960fBNmVQmXpda3AVcLuwWO/m44A1lgKdMSXnD3qPwEDmQuHzxXc2OxAuUoUJpWKuMF5DIf7PsEJsZAR0hpXhlz5XZzP0+9eiIfL4SI8L+Dq9KmINJRu/a9JoBUqfvhOKecbThSCXZlS8RtRkmSHTYGXRDJx5fgUWEvexh+Xmv3DGgs6gDhvXLAo48ieXjSZHh/XsohL9XntEnROdKW6jHkhZ3fDex/pyC4PcFvOHzLrzXtRZLjSlTJchTDYsvLrUWUBOmrO6Q+pydGK0qp1TGvAtQ1C4TCdHUQtrSs69DYPUqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(136003)(39860400002)(38100700002)(38350700002)(316002)(5660300002)(9576002)(6496006)(1076003)(186003)(66556008)(8676002)(9686003)(52116002)(26005)(956004)(33656002)(86362001)(6916009)(44832011)(33716001)(66946007)(8936002)(55016002)(6666004)(2906002)(83380400001)(478600001)(4326008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h561vNDasumJMbj+ZeqdYdVmt/meHqUJGNCxQkmgcfDsv1ylFYFfokyceY/A?=
 =?us-ascii?Q?SPiuWGnotI8AewKbgHMllMeOVZ7DZBD815Olav0eXDLHuEb+PXyeSfsp9zhT?=
 =?us-ascii?Q?xUYQYAQ9uh4OC5tbCrptbuczC3UNvqqmN8rCdSsicwRUdT8BfKUtqRrnghil?=
 =?us-ascii?Q?qH2Brr7SF8fXyvGAmM7q51TYxbtSqEN4eMs6+HqAJyevHG/vYAIPT9Lp6cYA?=
 =?us-ascii?Q?OtbUxYFq6Eb/8SFMiTFm7XYkCNRSIWnKhRcTMYaqRM+aaTsbkWmB2rfDoQ3f?=
 =?us-ascii?Q?RPYJznGs6SH2iiredDQ7PHa1xB8IldkdKz11nIixkxi2T859Rn+XM6IMA8++?=
 =?us-ascii?Q?1gts7+Y/XO6f9534Zq8yqroLMd/CUOKIOYp1JS0wJ6XyaTs2kWQyUF0ekdEd?=
 =?us-ascii?Q?C7X9QGtKW5AGSIO9IsqPDJUMMo28ZIq25aIVq/sGOK/Lfaw41RxsnC/3Yfbb?=
 =?us-ascii?Q?PlubO222uRawnHaQYVsOYsroJRuj66gGkjLb0shV/gJsRAb40uLZe+Oqp3MD?=
 =?us-ascii?Q?vVMWEG90ik+qddIV2jTnxosQYK5gWzGlzIb8xMbFLSCckJTXbnqm6iV2HX1Z?=
 =?us-ascii?Q?tsuYE9M0+UzTuqp5EBjBoWs6K6kXuFVZ4eb3g3QN1WCugUWqeFIRPLpO77m7?=
 =?us-ascii?Q?XhppXGZ0t3ed7ZDXMKn7RpofGASo93SWgnIRJ5RbrP9PBjUUEIii6Yo3KLmO?=
 =?us-ascii?Q?oLqbmaM4mD75z6/inm6elPgk/RjG3LNCX+sX7oudfktCztgwGM+UBFC/a4EQ?=
 =?us-ascii?Q?QQ4REXWf7e7t4C8ICcv9Jd6oKkX1829A77ATHiNMEKtzpbmqDwKKOYlp/k8t?=
 =?us-ascii?Q?kIj75WF2k689Crv1Ee0VEq3z2OxqXxuQwL6U2RFVzJRPgM7Q40nVPmJGYYuj?=
 =?us-ascii?Q?kTcQn/6KWBFiWrigHgaHVd6b06+9K7DHBeJ7mGcodjBz330+8kPQ2nUNWZwt?=
 =?us-ascii?Q?DXb/gs/ECPCmYzpdmPKkc/05gIktto93gcaJ3Zdsy/83lAWQ2eMAw9ezx6S8?=
 =?us-ascii?Q?+ZwfsOSWAM/4pElemETHXtRGVugXGp82kkmy9TfZ83kjVnW3OQY3pD/zotes?=
 =?us-ascii?Q?bZJHxaE8XJpgx/AKS1Qnyni8LCdZvhB6I4XUkN7uDR/A8zFfD7Abbk5UFpjR?=
 =?us-ascii?Q?Xk58YdXnY47/MGeKM0vMjhrCojobUB95MlpPxR9uOehgZEqVdxWRWL1x/rJx?=
 =?us-ascii?Q?QJSFccXWY0YIaDzAfjSm+zGNYKnOGNbU6oin+2Lw4kiO76atZDa0F6K1Rmf6?=
 =?us-ascii?Q?C8TOfSXoP2JZn9kBZ8nUhJ/L3Ht1CS2y11vEWewz1yA38Ft9qvkwGhNv2W8Y?=
 =?us-ascii?Q?9cNV4D1MoOxFOIfY+EDgxyf0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a43185-6cba-4925-c557-08d966f3cae9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:39:12.0248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bawmCzyNCxU0BdQA0nGt/Lf6tq7iE9P7QPwlG4Q/zAC2MER2ZrB2HQxQ2cQIEi2NEVOQqzknq+GRnL0JG2qIKuqk0cVyzvbGdLdEIxHqjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1822
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=952 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240077
X-Proofpoint-GUID: bYo7eI66NsKD37z2EwCsQlDkrycESJpU
X-Proofpoint-ORIG-GUID: bYo7eI66NsKD37z2EwCsQlDkrycESJpU

Hello Konstantin Komarov,

The patch 4342306f0f0d: "fs/ntfs3: Add file operations and
implementation" from Aug 13, 2021, leads to the following
Smatch static checker warning:

	fs/ntfs3/file.c:921 ntfs_compress_write()
	warn: was expecting a 64 bit value instead of '~(frame_size - 1)'

fs/ntfs3/file.c
    871 static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
    872 {
    873 	int err;
    874 	struct file *file = iocb->ki_filp;
    875 	size_t count = iov_iter_count(from);
    876 	loff_t pos = iocb->ki_pos;
    877 	struct inode *inode = file_inode(file);
    878 	loff_t i_size = inode->i_size;
    879 	struct address_space *mapping = inode->i_mapping;
    880 	struct ntfs_inode *ni = ntfs_i(inode);
    881 	u64 valid = ni->i_valid;
    882 	struct ntfs_sb_info *sbi = ni->mi.sbi;
    883 	struct page *page, **pages = NULL;
    884 	size_t written = 0;
    885 	u8 frame_bits = NTFS_LZNT_CUNIT + sbi->cluster_bits;
    886 	u32 frame_size = 1u << frame_bits;
    887 	u32 pages_per_frame = frame_size >> PAGE_SHIFT;
    888 	u32 ip, off;
    889 	CLST frame;
    890 	u64 frame_vbo;
    891 	pgoff_t index;
    892 	bool frame_uptodate;
    893 
    894 	if (frame_size < PAGE_SIZE) {
    895 		/*
    896 		 * frame_size == 8K if cluster 512
    897 		 * frame_size == 64K if cluster 4096
    898 		 */
    899 		ntfs_inode_warn(inode, "page size is bigger than frame size");
    900 		return -EOPNOTSUPP;
    901 	}
    902 
    903 	pages = ntfs_malloc(pages_per_frame * sizeof(struct page *));
    904 	if (!pages)
    905 		return -ENOMEM;
    906 
    907 	current->backing_dev_info = inode_to_bdi(inode);
    908 	err = file_remove_privs(file);
    909 	if (err)
    910 		goto out;
    911 
    912 	err = file_update_time(file);
    913 	if (err)
    914 		goto out;
    915 
    916 	/* zero range [valid : pos) */
    917 	while (valid < pos) {
    918 		CLST lcn, clen;
    919 
    920 		frame = valid >> frame_bits;
--> 921 		frame_vbo = valid & ~(frame_size - 1);

valid is u64 but the mask truncates to u32.

    922 		off = valid & (frame_size - 1);
    923 
    924 		err = attr_data_get_block(ni, frame << NTFS_LZNT_CUNIT, 0, &lcn,
    925 					  &clen, NULL);
    926 		if (err)

regards,
dan carpenter
