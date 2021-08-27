Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A372
	for <ntfs3@lists.linux.dev>; Fri, 27 Aug 2021 08:58:12 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17R6IhwE015020;
	Fri, 27 Aug 2021 08:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=JfDQ/eLvsXF4cnLqAradqu0vrZq+aXUDDezolzSUdes=;
 b=EM1WR/UcOSotXo0VSx2X0hx0f7MfV3Hl+I9cb+SvSippvAXqZttWPQNbISDSXLiyuyqB
 QmcsghRZHf9J6h1amVu1IoScmp2/8/skrSuodfmLLE+oiPB/j5W/BNeGWyBJR4tP/izo
 xgJ+wYWW7YqCUUvDZIZkzk9RBsVZ1NdadVprCkz1eV56Ps0o0XvwyuEiU2z3+lDILJPV
 xz3xKCp01cHf1xVb/WiwjTyNlWAYJ5oXr8IhHvic0eC+04pxyTa1Q7Ue05BnnKmmls4w
 9Co1EMtjKr7TcjYD2Mk5PKVXy8IAizutMvdEz//WcsgHhvSvgXunZPzQ9vl07q6iy8FR mw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=JfDQ/eLvsXF4cnLqAradqu0vrZq+aXUDDezolzSUdes=;
 b=OqWuX+Rm0EGVp4Vno6UhdC3BXt/4PKX01njm6v+Q4x9++SfqKYIWz2YacqaWh+akFdRu
 oKAdE5CaYIg3qex9MzSt9SL66TnZEstUBrCjuFYVoGguDC++hQv7UepBuybvm7r6S8OO
 GP9dpakjvzosJN05vkLlF5k1u7+mC/QhOXNSKCWER1VCjPmJm8fBw+Q0/YxTH2QcI/5f
 VOF8H1kNJ9/YD/f+mmvivjESSxB9BxmNsPdF/sEWKw2fPY5pbD7l6/oZUhB6BovoK5DO
 so56CoBajns7IwCiqbfWPwU3pEDqa+0JoYsd9ZuUK+8Rs0yxnkEAqQbp/posfX/5q1ve OQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3ap4xv31n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Aug 2021 08:58:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17R8tlkp103740;
	Fri, 27 Aug 2021 08:58:10 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
	by userp3030.oracle.com with ESMTP id 3ajpm4am6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Aug 2021 08:58:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAPs8OfxHGTW2Kk4BBAZDqO9AuejWmbFvvgdeciHX4/4/pWUMgvhYr34bbfAJlxLNEoMXrC6qSPmsGDQa9DxbllcuHSpu0mkObsKHP8xRpCKBR1QoWhAOo1ZHzxRfFMJipodMGQe8q516MWQsPBfWokQJaJ/O5ge4nHEUqzmVEbk2EIuT8ON1AaZgj9QdpjLu+p3N3fkeB0lW8wu77shkkgY/dMhdLZWAMCB9FIREi6+q7sMCXDXL/0mjisiuglPh+aly3mS4DXWM49/2lZOQoVPJZTOl5pW4CtlXIoAXAYZDNuM3x/5FuBi+tjvW8nglvKC4HyeNeyotYaVQyiVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfDQ/eLvsXF4cnLqAradqu0vrZq+aXUDDezolzSUdes=;
 b=SJmKbNXaqLzXvXiW8bsKLHv1jMadQwcBeRKwZ0puIfoZJzIOthhYBnOw4bgqsgD9PMg544ZP1sdebHMQvn0Zb+yAFTDsh4bHNOJ7Z34ybTBCgidr7EHt/hcs1EpEj8zaBn9FqeiCNsMmvcnk1HPjdoj270lJZonaVo1O/etDtA5wu3rO8FRvInCZYeOZJXMkq8Ur0Rrv7ru3Mfd2CBqWp/no1cJKX8E0SvtS/Xuz/5ygsA/U2esZb/75Qf7aGOOEiVQGv0LAcAqjEncM7gfPiaZVk7MkurExqVWUFv84HQvJj6QeNhqiMoDVJ2kkw9nlvRjyjhSxD0cYMpXQkmmsig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfDQ/eLvsXF4cnLqAradqu0vrZq+aXUDDezolzSUdes=;
 b=abYbyKvAQU05QrIWKazpVTtP3Hm/yzNHsuW5MRxFzGSBOom/ZiDgLpGaZhfIN+4A1cSzzAVRatx0ICO4OBE8YytZTVd0pv7/S02nBaqnuSdV28+FrUQZEFUCtQ4hCYCPEqf0HW+rLY3gaOjobT3JF6sHPBgXx9euepqv9xbzJgM=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5412.namprd10.prod.outlook.com
 (2603:10b6:303:13c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 08:58:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.019; Fri, 27 Aug 2021
 08:58:08 +0000
Date: Fri, 27 Aug 2021 11:57:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: missing error code in attr_data_get_block()
Message-ID: <20210827085757.GA9449@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 08:58:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3721735d-a847-426e-12ef-08d96938c9f7
X-MS-TrafficTypeDiagnostic: CO6PR10MB5412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR10MB54123988A73D8AE388A0C12E8EC89@CO6PR10MB5412.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F76B5AahnH8hMHXYz9AMW7f2noJcLVORbhInt3LpdEoMQwhYZunZV/Q1TDH1VH4QhK6UZCSt4m6uVBuqXDGWzakf335ER3C6RSY0hw2aQoxqHJFgU1otV5KyPsU0gUqC1aRKIslCCP7GBguPhXVHk09qAhXim1nY8Z4LLFanu0mTPtCva3DKupd4IoQrXY4Q4B8VRYX3sar9hxLnydyXuatmnUFcZAjNRfT3ILmALxYi4fGzfJi6K5m4zEVc/j41HFtEGsWxeZxt9xsk+4Q8xWwqfj3ZtdFQB7bANcckSBjemDWX2DzO53t8GRagbO8VH19QzfttvW94/0aTH6zvCmzpUBeNRo9jEy2o8YNXo2TsWmH0qfStCVmPhl2p+QNhNhA+yOd03DtuqcaLhWsbF8BCYN6w66As7csnF7cOCD2qD+/oi/IEa1PxXd35FEbp45kNXQr0UEVmlsIE4wO4vgBRfh+EYPges15T3GZbBmpzLgb0pOpVFDUdLFe7ba2EtRINrWlgPys3O0OWXoGsmvg+6tT78Z1VXOWk1FHSFfdW+zyHNxfBfSxu0IBhSgrij+IALAiY47hPFBUFkFEYSjw9iFjB97PL7vLTyTRQyYbAURCWk9xeuqp70htf5PvpGCIr4r0RSINi9AsmEeFpjwoo1/rj3ieD5GKroKLAcpuasudV9+LfftzSvcmbkDtTTXeVW66SyrRYXz4RENPmhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(396003)(366004)(376002)(346002)(316002)(66476007)(66946007)(86362001)(66556008)(4326008)(8936002)(9576002)(52116002)(6496006)(478600001)(6666004)(33656002)(83380400001)(44832011)(55016002)(26005)(6916009)(2906002)(8676002)(33716001)(186003)(9686003)(956004)(38100700002)(1076003)(5660300002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fsd7DJIRlEL2su/5bwHcyrYzCf3AR/xrSbMra/bIGTLhnnhviCO16WyoRv2D?=
 =?us-ascii?Q?0zL2D/0ugzh3z3lz5XR/p4zQfz2ArAu5JY3bz6FlkEugfxlksUeBygVu5kjd?=
 =?us-ascii?Q?zonfK0Kpg8ZZMvaVwKzgKr5MzcADLYhg+mNszn8X90Phe9xJNg4nUcBKIBXI?=
 =?us-ascii?Q?CpUlVXqjWXmXMuaJw1gUKUFuqMgLxaK2H3lKFFQwVAoz+iQwm7BKrL9t9Dx3?=
 =?us-ascii?Q?o9A3vWsPY49ebN0LwirpYaYwkvgjqc/P3jRhgszKDEaqc7E9XMd9P7xPh9Ch?=
 =?us-ascii?Q?7d7NBFmIcR7YlcVQm9W0ZBMLzH7tl1CoDFYmPR/WicupmvA2JC2gXoDHfw9n?=
 =?us-ascii?Q?kX9GUQcd1WpE/lgunDuux8eDrRW5iyWXlPLK/3+9cTcNA6LfE5jhNV0TqFC8?=
 =?us-ascii?Q?zsI4bAVKYYbyaCQY4XcLH1D4GM7O38JlX9WCP2yNINLMOifMZRDJY9RS2XPS?=
 =?us-ascii?Q?oQeUNeyYXt4DpEdKirbUx0r2yxSsjV1l8JcHlqS0cBQSdEAncDGp9FTxRM/W?=
 =?us-ascii?Q?6faC6V775LbuZjOTmLTP68kryWXFBv+cR66MNZZflU8Qa1t+bd9EdEXdEdDN?=
 =?us-ascii?Q?h8ALMRl2YgRb/8TTsLkAOZLwkFDFZBqpxCAsfkHaZerekKR2nCHmZD3uviaq?=
 =?us-ascii?Q?DvsLkor57Uh4gFgG6+k+UyFN1XX8A6AD9vbZodfCniNxPUmLVxFmdWlNDGJP?=
 =?us-ascii?Q?VqoCdGvCpqS6InF6V1BMSouMaMDK39EJ0V1Bvz2YbhqIRyhVVYEgYZz0j7tB?=
 =?us-ascii?Q?x8QybVC/4t17LPS1GRek+IJkrsSj7Fw5IXIO9d5fPQSU1EhhKt1Rb+VWqKxV?=
 =?us-ascii?Q?Lc8C+QD60LvXrZ2TN9J606zGEuCpwK1HQJ64Oe6jtfK8klMhNaXPY4jiQ54M?=
 =?us-ascii?Q?8SSHcsZi3dcUeM55TzSc8sphDzscZ8A6Fz07puPwna5ifTMFaa1+070MDIoo?=
 =?us-ascii?Q?qxRQwxMKUsN7v4ZwqKbOkY1QHQLwnNQAjK8LE1MH+LV/7qsWoBvmxTXrnMgj?=
 =?us-ascii?Q?kStw9ZEj0X6Xgo2zz8dExS1ylOU9o/eN7b69I/Sn1XxmjOavzJHRmfkGAvio?=
 =?us-ascii?Q?PJ//IGhnCY8EVlm3Zga3iS4YHAMlDDCr5yvtQqUujr4R9nbn9axmvfPN1pWf?=
 =?us-ascii?Q?WCOPoj9zgD+5l/5wk8LhB2TB5j8Lu7jSx9ywhh8hLdoSDeLgwuD9FbtrcU2e?=
 =?us-ascii?Q?AzBDud8d32QPa//34TXpkFE3YAv+wnvOZSnjSYc//2kIprZefEN/jyOStdPi?=
 =?us-ascii?Q?+iAdIQy4AaIX99yqgTzIhPO2ZSeAEIj/eIfUWhWNPKupQ2UE/tdycrXqdNiN?=
 =?us-ascii?Q?ebbSsYBlzfuIP8orj0hJ0ILv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3721735d-a847-426e-12ef-08d96938c9f7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 08:58:07.9928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VakZ+Hh72t1rAZihSpJ67fxJd04vbk07z/2u79CAMrvzCCe8lJJBAG+vzrICkURdIMtU+rca0VSqYBHabBqAD7y5vtdV6LhYWMizFh17Hbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5412
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10088 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270058
X-Proofpoint-ORIG-GUID: U_suEtqDS34eYLYZSbjPBmCJuWxcHTbC
X-Proofpoint-GUID: U_suEtqDS34eYLYZSbjPBmCJuWxcHTbC

Hello Konstantin Komarov,

The patch be71b5cba2e6: "fs/ntfs3: Add attrib operations" from Aug
13, 2021, leads to the following
Smatch static checker warning:

	fs/ntfs3/attrib.c:1031 attr_data_get_block()
	warn: missing error code here? 'ni_load_mi()' failed. 'err' = '0'

fs/ntfs3/attrib.c
    823 int attr_data_get_block(struct ntfs_inode *ni, CLST vcn, CLST clen, CLST *lcn,
    824                         CLST *len, bool *new)
    825 {
    826         int err = 0;
    827         struct runs_tree *run = &ni->file.run;
    828         struct ntfs_sb_info *sbi;
    829         u8 cluster_bits;
    830         struct ATTRIB *attr = NULL, *attr_b;
    831         struct ATTR_LIST_ENTRY *le, *le_b;
    832         struct mft_inode *mi, *mi_b;
    833         CLST hint, svcn, to_alloc, evcn1, next_svcn, asize, end;
    834         u64 total_size;
    835         u32 clst_per_frame;
    836         bool ok;
    837 
    838         if (new)
    839                 *new = false;
    840 
    841         down_read(&ni->file.run_lock);
    842         ok = run_lookup_entry(run, vcn, lcn, len, NULL);
    843         up_read(&ni->file.run_lock);
    844 
    845         if (ok && (*lcn != SPARSE_LCN || !new)) {
    846                 /* normal way */
    847                 return 0;
    848         }
    849 
    850         if (!clen)
    851                 clen = 1;
    852 
    853         if (ok && clen > *len)
    854                 clen = *len;
    855 
    856         sbi = ni->mi.sbi;
    857         cluster_bits = sbi->cluster_bits;
    858 
    859         ni_lock(ni);
    860         down_write(&ni->file.run_lock);
    861 
    862         le_b = NULL;
    863         attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL, &mi_b);
    864         if (!attr_b) {
    865                 err = -ENOENT;
    866                 goto out;
    867         }
    868 
    869         if (!attr_b->non_res) {
    870                 *lcn = RESIDENT_LCN;
    871                 *len = 1;
    872                 goto out;
    873         }
    874 
    875         asize = le64_to_cpu(attr_b->nres.alloc_size) >> sbi->cluster_bits;
    876         if (vcn >= asize) {
    877                 err = -EINVAL;
    878                 goto out;
    879         }
    880 
    881         clst_per_frame = 1u << attr_b->nres.c_unit;
    882         to_alloc = (clen + clst_per_frame - 1) & ~(clst_per_frame - 1);
    883 
    884         if (vcn + to_alloc > asize)
    885                 to_alloc = asize - vcn;
    886 
    887         svcn = le64_to_cpu(attr_b->nres.svcn);
    888         evcn1 = le64_to_cpu(attr_b->nres.evcn) + 1;
    889 
    890         attr = attr_b;
    891         le = le_b;
    892         mi = mi_b;
    893 
    894         if (le_b && (vcn < svcn || evcn1 <= vcn)) {
    895                 attr = ni_find_attr(ni, attr_b, &le, ATTR_DATA, NULL, 0, &vcn,
    896                                     &mi);
    897                 if (!attr) {
    898                         err = -EINVAL;
    899                         goto out;
    900                 }
    901                 svcn = le64_to_cpu(attr->nres.svcn);
    902                 evcn1 = le64_to_cpu(attr->nres.evcn) + 1;
    903         }
    904 
    905         err = attr_load_runs(attr, ni, run, NULL);
    906         if (err)
    907                 goto out;
    908 
    909         if (!ok) {
    910                 ok = run_lookup_entry(run, vcn, lcn, len, NULL);
    911                 if (ok && (*lcn != SPARSE_LCN || !new)) {
    912                         /* normal way */
    913                         err = 0;
    914                         goto ok;
    915                 }
    916 
    917                 if (!ok && !new) {
    918                         *len = 0;
    919                         err = 0;
    920                         goto ok;
    921                 }
    922 
    923                 if (ok && clen > *len) {
    924                         clen = *len;
    925                         to_alloc = (clen + clst_per_frame - 1) &
    926                                    ~(clst_per_frame - 1);
    927                 }
    928         }
    929 
    930         if (!is_attr_ext(attr_b)) {
    931                 err = -EINVAL;
    932                 goto out;
    933         }
    934 
    935         /* Get the last lcn to allocate from */
    936         hint = 0;
    937 
    938         if (vcn > evcn1) {
    939                 if (!run_add_entry(run, evcn1, SPARSE_LCN, vcn - evcn1,
    940                                    false)) {
    941                         err = -ENOMEM;
    942                         goto out;
    943                 }
    944         } else if (vcn && !run_lookup_entry(run, vcn - 1, &hint, NULL, NULL)) {
    945                 hint = -1;
    946         }
    947 
    948         err = attr_allocate_clusters(
    949                 sbi, run, vcn, hint + 1, to_alloc, NULL, 0, len,
    950                 (sbi->record_size - le32_to_cpu(mi->mrec->used) + 8) / 3 + 1,
    951                 lcn);
    952         if (err)
    953                 goto out;
    954         *new = true;
    955 
    956         end = vcn + *len;
    957 
    958         total_size = le64_to_cpu(attr_b->nres.total_size) +
    959                      ((u64)*len << cluster_bits);
    960 
    961 repack:
    962         err = mi_pack_runs(mi, attr, run, max(end, evcn1) - svcn);
    963         if (err)
    964                 goto out;
    965 
    966         attr_b->nres.total_size = cpu_to_le64(total_size);
    967         inode_set_bytes(&ni->vfs_inode, total_size);
    968         ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
    969 
    970         mi_b->dirty = true;
    971         mark_inode_dirty(&ni->vfs_inode);
    972 
    973         /* stored [vcn : next_svcn) from [vcn : end) */
    974         next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
    975 
    976         if (end <= evcn1) {
    977                 if (next_svcn == evcn1) {
    978                         /* Normal way. update attribute and exit */
    979                         goto ok;
    980                 }
    981                 /* add new segment [next_svcn : evcn1 - next_svcn )*/
    982                 if (!ni->attr_list.size) {
    983                         err = ni_create_attr_list(ni);
    984                         if (err)
    985                                 goto out;
    986                         /* layout of records is changed */
    987                         le_b = NULL;
    988                         attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL,
    989                                               0, NULL, &mi_b);
    990                         if (!attr_b) {
    991                                 err = -ENOENT;
    992                                 goto out;
    993                         }
    994 
    995                         attr = attr_b;
    996                         le = le_b;
    997                         mi = mi_b;
    998                         goto repack;
    999                 }
    1000         }
    1001 
    1002         svcn = evcn1;
    1003 
    1004         /* Estimate next attribute */
    1005         attr = ni_find_attr(ni, attr, &le, ATTR_DATA, NULL, 0, &svcn, &mi);
    1006 
    1007         if (attr) {
    1008                 CLST alloc = bytes_to_cluster(
    1009                         sbi, le64_to_cpu(attr_b->nres.alloc_size));
    1010                 CLST evcn = le64_to_cpu(attr->nres.evcn);
    1011 
    1012                 if (end < next_svcn)
    1013                         end = next_svcn;
    1014                 while (end > evcn) {
    1015                         /* remove segment [svcn : evcn)*/
    1016                         mi_remove_attr(mi, attr);
    1017 
    1018                         if (!al_remove_le(ni, le)) {
    1019                                 err = -EINVAL;
    1020                                 goto out;
    1021                         }
    1022 
    1023                         if (evcn + 1 >= alloc) {
    1024                                 /* last attribute segment */
    1025                                 evcn1 = evcn + 1;
    1026                                 goto ins_ext;
    1027                         }
    1028 
    1029                         if (ni_load_mi(ni, le, &mi)) {
    1030                                 attr = NULL;

No error code on this path.  Also no need to set "attr" to NULL.

--> 1031                                 goto out;
    1032                         }
    1033 
    1034                         attr = mi_find_attr(mi, NULL, ATTR_DATA, NULL, 0,
    1035                                             &le->id);
    1036                         if (!attr) {
    1037                                 err = -EINVAL;
    1038                                 goto out;
    1039                         }
    1040                         svcn = le64_to_cpu(attr->nres.svcn);
    1041                         evcn = le64_to_cpu(attr->nres.evcn);
    1042                 }
    1043 
    1044                 if (end < svcn)
    1045                         end = svcn;
    1046 
    1047                 err = attr_load_runs(attr, ni, run, &end);
    1048                 if (err)
    1049                         goto out;
    1050 
    1051                 evcn1 = evcn + 1;
    1052                 attr->nres.svcn = cpu_to_le64(next_svcn);
    1053                 err = mi_pack_runs(mi, attr, run, evcn1 - next_svcn);
    1054                 if (err)
    1055                         goto out;
    1056 
    1057                 le->vcn = cpu_to_le64(next_svcn);
    1058                 ni->attr_list.dirty = true;
    1059                 mi->dirty = true;
    1060 
    1061                 next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
    1062         }
    1063 ins_ext:
    1064         if (evcn1 > next_svcn) {
    1065                 err = ni_insert_nonresident(ni, ATTR_DATA, NULL, 0, run,
    1066                                             next_svcn, evcn1 - next_svcn,
    1067                                             attr_b->flags, &attr, &mi);
    1068                 if (err)
    1069                         goto out;
    1070         }
    1071 ok:
    1072         run_truncate_around(run, vcn);
    1073 out:
    1074         up_write(&ni->file.run_lock);
    1075         ni_unlock(ni);
    1076 
    1077         return err;
    1078 }

regards,
dan carpenter
