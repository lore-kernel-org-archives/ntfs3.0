Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313CF3FC3
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 08:05:03 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17P51eD6000899;
	Wed, 25 Aug 2021 08:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=A1unPiP7Y4qyoUmV8DRNdIu4iDdn1WPU+wW4XwHQ0og=;
 b=LqGCgnexSQ1SfFMth/MF84opHzSZRFwKudn3CVThUr9KCtTlKYOo4KmD6CBTGdP46tQU
 MIY1xZ3D+40svfSOUy98oOYYl1kcQTfHP4lSBP+nhfkb0CxWGqtM3lDdYbOZovRAlKPA
 h5pqCL6Mc4l3IgNd38lW4NgKQi3jHCa9CPedUkKkBJGx2l1g4LguB8fmsosKbuMDweO6
 qKCuLU0ATikbTGdyqQ7t78b2n2CGM4tr+4qTI0SrAHC55ZCcDT4ZI21nAxDOvAWHY1fq
 BCKF6h2vl+YZgu3NC3wPvfI1aPSOCvsKkyOBRmeyYdhzGNRRsMeiVrzCX7BHP3CHDI3T CQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=A1unPiP7Y4qyoUmV8DRNdIu4iDdn1WPU+wW4XwHQ0og=;
 b=ptvyNV7itDO5GHhACMlwjOfSkIe6aP+Bl47Ilgxz2mAS0UeaIYh5QSeBL777+jTnfwSc
 rITqfUqTVoEPbrsDE35djLW36iwT9C7226tAeWw/+rf5VwAVrZn+SXBANfKT3nTlkW1T
 BLJV9i+JSVDuZyr8S54yFXk2GC760HRASkDb6NOYioWEkxu5H6U0FJUvYsmETAeEOMvr
 a5HWP3PyoIFIXJJ/Pnw3opaOKKBFaz/cjbNjKJX9yDFSe5MYnbZNoNKqefBtNsgg64TE
 R3abZyxvOwiU7hCs67+WrMHhkLLJbjopT9ilcV7hx2zF8tjOjBa7ISwnPWqM1rb6tzmS vA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amwpdanwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 08:04:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17P81QXJ056106;
	Wed, 25 Aug 2021 08:04:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by aserp3030.oracle.com with ESMTP id 3ajqhg6an6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 08:04:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpzkRH0Z03sHsun4SM9jQLdzBYghCp9fPtc6KHTpGuVAUDVXvfJWXKBXMucv1H8hVkLAlzOBlVcOxltNWiWDBtu9AxYC8sFI4gYlzOCZmnkbYkefFlFP869PFcMtyTAYguYpRcdZ8sG1/BEfE9av/aUOabaRhsam9oQVWiMkiYUPM999Jfz9q6Y7CNF3vIK8EJU7Ix2ZqJfSeWD2FztE0aLgKWVDoPuNuwYfmvdhphnvYoCvVeBtV8OrKLwCJhmcwAa+vOjTQrddXn1IEsf8aw1JGWqg7P+rLVZn4F4I8anJSJsd/BPzS7Vb2h6WB8qJkzxdDGZAvSAo0Bz3Qn1C5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1unPiP7Y4qyoUmV8DRNdIu4iDdn1WPU+wW4XwHQ0og=;
 b=hWzDWyh9EQEeJLV7YuX6MTXahcD4QhZGvMY1KRbwusyKTM7o4frnmb4jhtqH+tEF4SoOvxAFGk3MeslUEVRqQwwWRTTyd+DtQ0ItLt3KM7GrbYw3yJ3QGahGna2thDDGmx/fg2PyFGVLFDBkSnIFEOXOGVCffVYUNo8fvVGCm6wkWWxfNRecs9jNmfP0fdw4AX00P44DnpfIPGDtqpJv0Y2U7HXU7YBhuRi3nZtN4QXcVLPUlLrjmloHS26pPhIW0v1MhwQJ9Tflv13FtHndMGzAXgTw9d9rnkMx4v8tsdu6KGbVifJ8z8nWbDAsE3IjMZEjFlxELBbUgCL9XGxO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1unPiP7Y4qyoUmV8DRNdIu4iDdn1WPU+wW4XwHQ0og=;
 b=Crdw/Cy0ex7A7DJx1jZtrvW+i+Jyp1mRvCvHm60+dleTYDLo6gmXCkWiepc5RMnVsLoh5YF1RE2zAVTq1356kRLcD28A1TNes5MwUcel0TFaAsILQVsshMsDCCludamtCH+SLZ4kUPP24U0kTb9ojIzQ6n3UOaeUkmqUlgjvu7w=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1549.namprd10.prod.outlook.com
 (2603:10b6:300:26::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 08:04:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.018; Wed, 25 Aug 2021
 08:04:52 +0000
Date: Wed, 25 Aug 2021 11:04:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: integer overflow in ni_fiemap()
Message-ID: <20210825080440.GA17407@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM0PR08CA0026.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::39) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (2a02:6900:8208:1848::11d1) by AM0PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:208:d2::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 08:04:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 779f3bcb-90bc-49d6-42cf-08d9679f0449
X-MS-TrafficTypeDiagnostic: MWHPR10MB1549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1549114E2D6C0BD7BD42991C8EC69@MWHPR10MB1549.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GOjeErVbUCH1ovd68HdiQES+nNqCVidNy0m5bAyj02blSYqCDVw24sMW6QpFsoHES3rsLubzRTWn8Mhe/w0R1ydlFVs7+mEQqrFb4J4MLZXv9GiiovpoFJ5ivS4Xj/2u77WGxuGQBl3eYJ7aILO6lf7ag189SXKD7hqgXxeU6YsltQHxzbuc1MvqCWw7gCjDJrtQ5mxj5ra1BGC5QfQvoDpk357ITOCimolwkt6LCOMIrLmBDh8MW2G/1/TKx1QC4qyeR4lk6i02xO4qcseeYLq+qd0JYDoBVWU9N8Z+kVqqHsJEb+fFS0oEUIFuTlaMxSmgjz5cojQN44impXsCGI4vG8OsxudXsW3zL7HoJvsfXCzuu97AId8WT0CRIco7aJIsv50n2QS75BLeIKbsH+RA2aeeg3H1SMWkaYDenF6lMLCHzXXlRjijfAOPo4NQgoKZxkatgxoKYATDW1y2nRWqCI5Ug6nZmdDEdl3au0kpakm7UEbgqFHpOqTb7LwPWmvKvOEGn+I+ni05SJQzTzy3LZCmlIP3SjZWvFPe/PoujmzLx+9VDORwDdnUMFi3BQvRDGK9rUgK0iX2Lu5nBcBpj0UHjoKq1pEVbsn3N9YZ+2MR3UHM5nFw3vNpVGQnWhUztxvW84pfZljMQHSJ6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(6916009)(66476007)(86362001)(66556008)(5660300002)(508600001)(8676002)(33716001)(316002)(66946007)(52116002)(186003)(9576002)(83380400001)(8936002)(44832011)(6496006)(55016002)(9686003)(38100700002)(33656002)(4326008)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9O86pSM1jeKQUD16KaAPbypR8d08x/XAr0REuJX2Q7oJMJT4gfvBV+HXPdIe?=
 =?us-ascii?Q?+ADDss4PhZHe+Es0pFx/vT0c4pnPoG3KjiOGVbj4BpQibkyOzmcNmhEBCL+Y?=
 =?us-ascii?Q?ciC90ahl4C2+fHl9bRgjMBRH1cbm6s0AXeEFtEzpAAAITKrDKZ1tr5h0I6l+?=
 =?us-ascii?Q?EePwnLAw0zqsTgqExUaVruHM7zWSyYzVTz8bH9r8i2lt1cPNCW1cDYLoytwh?=
 =?us-ascii?Q?zJLw8xNQnwvdxMHXbO1rjNB8p11OfnEBWpgCnRLf960FQ7Nat/HKDC+MjWe/?=
 =?us-ascii?Q?zMHSCLhrNJBPBMQOEVx5VezjWaEaiGy16HEVHXMsPB6/5YyCDSjOKSHIEr2o?=
 =?us-ascii?Q?6embUOMksCA02z8VAVSW+Av9osm8sMBLEjaJt+BZ6sBmdZMef/dcBMdyT9EI?=
 =?us-ascii?Q?XKbJeNmpWl0VJUTHU+9fe8iU1PozxV+Hi/CmEQnLLQQwp3zXcNa7ELyuPV4b?=
 =?us-ascii?Q?1jKSEfWyvdK0sBrom/rF//ElbKtNZKgmntZRDLswNuy8Bozk1AhzLTLk+ilv?=
 =?us-ascii?Q?9DKivkwbvvWiOyydnU/esjvSugpQ0H2jbNh1nxbknOxBWJqiek4bGokNFACH?=
 =?us-ascii?Q?anMvqlUz3ZRWG+EJknMdttJo4zvq8fsUS/V77wxYeIqHmG+8djvDvxKLO8ZX?=
 =?us-ascii?Q?DdS08V3sJ4dWS9iSm1Z6WRDGf4l/OHPwm1H0OkT/qGIDLvzUsdt+29SoTv1P?=
 =?us-ascii?Q?nS3mcmjfiy4XVvXVOPhZuMArb+NVmsmzO51IhYFpZ881qzVuYXMZYuwV396F?=
 =?us-ascii?Q?vVPl3PeZzywtD5J3Ul2XkUrxUZVSeKmGLLbZpdrVJIxqcYvDQbvjMyph2keY?=
 =?us-ascii?Q?qCuLlo1YewbaKBC4H5BHjXj0xl9/AASQCPfMSxHBGgQ+3zAd5uVTdvJs4kW/?=
 =?us-ascii?Q?Az0/T7FCn9JZrpxSJyuNsKb8FnhwL8SVJj9SpGzZnuL/uap3YJAxNJPoCwpK?=
 =?us-ascii?Q?1ggY7qwRoqd2LiTSd9GPSICxaQMHdMRCFJKZd/Tn6cCWR1r9TwIMa1nLOGML?=
 =?us-ascii?Q?hvoOte+ksDyezOU8gNgiRV57XKoaEF38zkT1DgkOSq3HdXu8etBHJO0UoS2t?=
 =?us-ascii?Q?loQVmzaI5JXTIl6RjQ55kezdDJa1z3yYnSvtuDmoar2dQs8oBRcnMWgjyY9e?=
 =?us-ascii?Q?VKBKUsZ0jtqIY6XY0rPsaHclJBxoDqMpHoaAYNZzurbRl0O0X3QHIRVPxl61?=
 =?us-ascii?Q?5T0skPKfeZgdRY8Cvr/BJZ36lqMhsTAoAoHiRf6+Oy2PzvLffihnkp8YS/wB?=
 =?us-ascii?Q?PPL8K+TfLsrto/zGMi89AtH8/6xFEhCxCHilqdON2dlYVHOaS+ssr9c36QBe?=
 =?us-ascii?Q?N+vEl5SsCxoPtmDpFXy9HSMz7nJ328tbze4wbyML/4Ll99mDzTidcOhiwHPB?=
 =?us-ascii?Q?Am1JGRs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779f3bcb-90bc-49d6-42cf-08d9679f0449
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 08:04:52.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVUGt1qu+al2Gggo3mQZDPtWgVWoK+k+hwjGyeIDMWlz2lEjLUGuuonLT72uJroArjS3PjpSoN9+m0PEgJ45XK1MoQ7uQ8g6YTLmY5yeCqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1549
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10086 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=878 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250048
X-Proofpoint-ORIG-GUID: QAFtu8SSat13kDj98xfvCyqyZ1npeV_a
X-Proofpoint-GUID: QAFtu8SSat13kDj98xfvCyqyZ1npeV_a

Hello Konstantin Komarov,

The patch 4342306f0f0d: "fs/ntfs3: Add file operations and
implementation" from Aug 13, 2021, leads to the following
Smatch static checker warning:

	fs/ntfs3/frecord.c:1894 ni_fiemap()
	warn: potential integer overflow from user 'vbo + len'

fs/ntfs3/frecord.c
    1843 int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
    1844 	      __u64 vbo, __u64 len)

"vbo" and "len" are u64 values which are controlled by the user from
ioctl_fiemap().

I looked at how BTRFS does it and it uses the fiemap_prep() function.
To be honest, I don't know why fiemap_prep() isn't used in ioctl_fiemap()
because that seems safer than relying on filesystems to do it themselves.

    1845 {
    1846 	int err = 0;
    1847 	struct ntfs_sb_info *sbi = ni->mi.sbi;
    1848 	u8 cluster_bits = sbi->cluster_bits;
    1849 	struct runs_tree *run;
    1850 	struct rw_semaphore *run_lock;
    1851 	struct ATTRIB *attr;
    1852 	CLST vcn = vbo >> cluster_bits;
    1853 	CLST lcn, clen;
    1854 	u64 valid = ni->i_valid;
    1855 	u64 lbo, bytes;
    1856 	u64 end, alloc_size;
    1857 	size_t idx = -1;
    1858 	u32 flags;
    1859 	bool ok;
    1860 
    1861 	if (S_ISDIR(ni->vfs_inode.i_mode)) {
    1862 		run = &ni->dir.alloc_run;
    1863 		attr = ni_find_attr(ni, NULL, NULL, ATTR_ALLOC, I30_NAME,
    1864 				    ARRAY_SIZE(I30_NAME), NULL, NULL);
    1865 		run_lock = &ni->dir.run_lock;
    1866 	} else {
    1867 		run = &ni->file.run;
    1868 		attr = ni_find_attr(ni, NULL, NULL, ATTR_DATA, NULL, 0, NULL,
    1869 				    NULL);
    1870 		if (!attr) {
    1871 			err = -EINVAL;
    1872 			goto out;
    1873 		}
    1874 		if (is_attr_compressed(attr)) {
    1875 			/*unfortunately cp -r incorrectly treats compressed clusters*/
    1876 			err = -EOPNOTSUPP;
    1877 			ntfs_inode_warn(
    1878 				&ni->vfs_inode,
    1879 				"fiemap is not supported for compressed file (cp -r)");
    1880 			goto out;
    1881 		}
    1882 		run_lock = &ni->file.run_lock;
    1883 	}
    1884 
    1885 	if (!attr || !attr->non_res) {
    1886 		err = fiemap_fill_next_extent(
    1887 			fieinfo, 0, 0,
    1888 			attr ? le32_to_cpu(attr->res.data_size) : 0,
    1889 			FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_LAST |
    1890 				FIEMAP_EXTENT_MERGED);
    1891 		goto out;
    1892 	}
    1893 
--> 1894 	end = vbo + len;
                ^^^^^^^^^^^^^^^

This can overflow.

    1895 	alloc_size = le64_to_cpu(attr->nres.alloc_size);
    1896 	if (end > alloc_size)
    1897 		end = alloc_size;
    1898 
    1899 	down_read(run_lock);
    1900 
    1901 	while (vbo < end) {
    1902 		if (idx == -1) {
    1903 			ok = run_lookup_entry(run, vcn, &lcn, &clen, &idx);
    1904 		} else {
    1905 			CLST vcn_next = vcn;
    1906 
    1907 			ok = run_get_entry(run, ++idx, &vcn, &lcn, &clen) &&
    1908 			     vcn == vcn_next;
    1909 			if (!ok)
    1910 				vcn = vcn_next;
    1911 		}
    1912 
    1913 		if (!ok) {
    1914 			up_read(run_lock);
    1915 			down_write(run_lock);
    1916 
    1917 			err = attr_load_runs_vcn(ni, attr->type,
    1918 						 attr_name(attr),
    1919 						 attr->name_len, run, vcn);
    1920 
    1921 			up_write(run_lock);
    1922 			down_read(run_lock);
    1923 
    1924 			if (err)
    1925 				break;
    1926 
    1927 			ok = run_lookup_entry(run, vcn, &lcn, &clen, &idx);
    1928 
    1929 			if (!ok) {
    1930 				err = -EINVAL;
    1931 				break;
    1932 			}
    1933 		}
    1934 
    1935 		if (!clen) {
    1936 			err = -EINVAL; // ?
    1937 			break;
    1938 		}
    1939 
    1940 		if (lcn == SPARSE_LCN) {
    1941 			vcn += clen;
    1942 			vbo = (u64)vcn << cluster_bits;
    1943 			continue;
    1944 		}
    1945 
    1946 		flags = FIEMAP_EXTENT_MERGED;
    1947 		if (S_ISDIR(ni->vfs_inode.i_mode)) {
    1948 			;
    1949 		} else if (is_attr_compressed(attr)) {
    1950 			CLST clst_data;
    1951 
    1952 			err = attr_is_frame_compressed(
    1953 				ni, attr, vcn >> attr->nres.c_unit, &clst_data);
    1954 			if (err)
    1955 				break;
    1956 			if (clst_data < NTFS_LZNT_CLUSTERS)
    1957 				flags |= FIEMAP_EXTENT_ENCODED;
    1958 		} else if (is_attr_encrypted(attr)) {
    1959 			flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
    1960 		}
    1961 
    1962 		vbo = (u64)vcn << cluster_bits;
    1963 		bytes = (u64)clen << cluster_bits;
    1964 		lbo = (u64)lcn << cluster_bits;
    1965 
    1966 		vcn += clen;
    1967 
    1968 		if (vbo + bytes >= end) {
    1969 			bytes = end - vbo;
    1970 			flags |= FIEMAP_EXTENT_LAST;
    1971 		}
    1972 
    1973 		if (vbo + bytes <= valid) {
    1974 			;
    1975 		} else if (vbo >= valid) {
    1976 			flags |= FIEMAP_EXTENT_UNWRITTEN;
    1977 		} else {
    1978 			/* vbo < valid && valid < vbo + bytes */
    1979 			u64 dlen = valid - vbo;
    1980 
    1981 			err = fiemap_fill_next_extent(fieinfo, vbo, lbo, dlen,
    1982 						      flags);
    1983 			if (err < 0)
    1984 				break;
    1985 			if (err == 1) {
    1986 				err = 0;
    1987 				break;
    1988 			}
    1989 
    1990 			vbo = valid;
    1991 			bytes -= dlen;
    1992 			if (!bytes)
    1993 				continue;
    1994 
    1995 			lbo += dlen;
    1996 			flags |= FIEMAP_EXTENT_UNWRITTEN;
    1997 		}
    1998 
    1999 		err = fiemap_fill_next_extent(fieinfo, vbo, lbo, bytes, flags);
    2000 		if (err < 0)
    2001 			break;
    2002 		if (err == 1) {
    2003 			err = 0;
    2004 			break;
    2005 		}
    2006 
    2007 		vbo += bytes;
    2008 	}
    2009 
    2010 	up_read(run_lock);
    2011 
    2012 out:
    2013 	return err;
    2014 }

regards,
dan carpenter
