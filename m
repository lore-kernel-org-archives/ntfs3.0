Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C53072
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 09:03:09 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O8q3rK021207;
	Tue, 24 Aug 2021 09:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=+o6randfD36AGmxdxyQi7W/BwXHHh5jROIAY4ih9Y+o=;
 b=meSoRw5tQihLKxjKnzgKztU6FFCOL4ni/s5bXRMEQkIwxTRD7+DzsqQZq9LgkJs9Nb9N
 RLK1Pza9HDAWeY6TD3/4TdtBSDKJYk8jkEp4zD6fWNh27TpphoA8QXMFLYeD3eyAdjpc
 Ij/NrYQhJ9MT2DXCEmTuxoOhJG/WLgkMDrSxo+KvU5IvWiuhPhPB/qK5zKloVnhISR4s
 c498Dn771960ZY810FfpHb8qvPlTW7dDl+3cS6vuYHCoGr3zRIRXHKI0cpcPU/u4W6Xr
 JOCqkYLdTqjWAxIvJaTO3X2BZUHFU7fUNKC/lhVyLH80Es019zmMLWZDpzTodZ7DZ+eb rw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=+o6randfD36AGmxdxyQi7W/BwXHHh5jROIAY4ih9Y+o=;
 b=mmoRh4DksBlejsO3serpF6EpUM0bEj6Mbv4Hzm7zCzybl/p/O7o/hdrxCwAio1M05oJg
 QPjQegN2uPWxOxugdoXHu/i2kmWPAWpQxZNhcpRzMOk/cnkCcQw8eM2h2K5IhSW+ivID
 ArRGR1+2ylnGC5GIUT/wqO8c9sV2lDIXXySSWwyzx9AazbDWsblT1ZtrjfeQi7DV12Mg
 /CI+OH5hXyX6sbX8F9OyjLvQrAkc1Dt0eZ5ZAfWR9BYHKEV4m6Ul9YbJRF+ovTEi/ZBn
 vTlXsOHnzyNnczUAyUTn5gjzEmDK9JjnpjFdcIxfeefhCd7/KBFskbcUTBeLBtTTDPQQ Hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amwmv81fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 09:03:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17O91ULV005351;
	Tue, 24 Aug 2021 09:03:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by userp3030.oracle.com with ESMTP id 3ajpkwx1gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 09:03:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWi35BUawhL1iVcZicbQrYKH6widxLTQzGMW5EEUpcaXRl1ed6q8DPGylEsSdDuX9lJaV7mKbJRav41LnmlTR9Q65YQzQaGLw5B3MrrUs/eE9JzRRfo2zxzyssgbP4akpeUvzznZrR/ldNRsOCfTaj2jRV2vIppZgaCa05/d7prXM+EyAjy4ya06Zj+L4Tcoq8T8WCE/dsoQwrGfsy/3Z4n7ykCUsxkfgjNOTL9FOONi3zlGQHPaG7JS2vB8OylCiTTugAcBE0voIhXM7fVdCeh1SkR73hT0L0BaisZr7bHzlzBEjDx6oyqPpEIPMKAxSCSxxXhm2MyifykNzH5fnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o6randfD36AGmxdxyQi7W/BwXHHh5jROIAY4ih9Y+o=;
 b=TgNqIfvK+6+2jvrCq1xgtk9foUgoGF2ovqa0NadsKhyfZMnzQHig6N+fd+A5WQ5xtFEvi/43rTvT4EwWA9alLz/FuR3c+mpqymWQ8Cz/NN/4+6DR2VaQ1LhPGfQscLDAYUFmTC+j/EE4nSYyaKDUBUzls239e3YSavsF67Is5NGIvS3kNMGw4FJUk+2prbEniNX5dmXKl2NygxjRna0odKI4g34MeELCh15ntwVxtfNRQztJoHfCYi9C5v+O5SbySDWviy8bPYdgBXunCZKIu/mxVEv+JBSfO7clMUXu1ttNHlmp4IynO7IHi8C9n9xyphYVQ+XhqYjKZRM6ce+RyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o6randfD36AGmxdxyQi7W/BwXHHh5jROIAY4ih9Y+o=;
 b=XsqIz7miHgWaNHEicxyuiRrmpe9HL4Bl0gmAjA3k0VFAg0A/682XpUa8MS1dDroHbh8soD5nojdyi3/ys047TnMtOBzRvAsIJLrzFd7TjsGKYk16HZRNa+Iw+dnweWcu8zaDbWUxJvSgHvLNhu/stU2AAFGT8nqPilbcfI0p3FE=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4707.namprd10.prod.outlook.com
 (2603:10b6:303:92::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 09:03:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 09:03:05 +0000
Date: Tue, 24 Aug 2021 12:02:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Add file operations and implementation
Message-ID: <20210824090255.GA18518@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0126.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0126.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:03:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 260f75a3-0049-44e8-7690-08d966ddfbff
X-MS-TrafficTypeDiagnostic: CO1PR10MB4707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB47074FC29F84A90A988CB33F8EC59@CO1PR10MB4707.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oZx8azMSo10WzBJQPZGr4p/3qIhSRH2fptRI+iAaAWY8ULxMgWolxXxzhIxNx5x+gGNhyeaIFwN8FLR76ZxHKjtaGL2I0WwkcLBQokEycCQv3i8F/kl7eONaOt5hjj96n8BZmYTQOspXeUoSvheRR8atbDOyP6QwkDtf516cSbYUmdUYMjhyMoiNOkz4D8/rDVmDMVZLpWAt5TRX5cZxOlVrMZPi6IAaAKg3sMEPRuncrUgtCKcTOIERUerec3LIfNLEzy3j4mwGe/RbvSwZxn1AnFyCD9uqhNkSu9ifpgN6rBAESoCQGgW/tjcGWbrNYYafZIA2T73a7IE5bLwX5S008OFSwqmyCqUrVxpx/G63zsiBhKbinQcPMHoROg3+g3rPHWuchSg5fLBv9LM5r3/MczNfsgVdFeqrrO+p8/1pEHneNcXXbf7VaWmfSinwB2od2fPrzXMxMDaKBVk2QAv2vIKXWxwGu0y8F4dez+isLtEA0sJ2aOs7S2fWsyfc4Qqh+vamEa2pW7EKzU7eRIqzhyfSAas6Nw4io1Fq9Xzv39yW5NAKBWXGJWSoCLyEpFjNJIPUXyg5wudGHsRgxXKj2TzkwbUgQZZhCgVR8e/lUxgMO9uLDu7nvGjxUSW472njUHV0FmqrhxxnAA3CPLam4+OrHPi9Cc8WpPyqGYzoMiPTHKfodLqh+SZ0ejRoM0A4zBmPesbVrepvmf63SQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(376002)(366004)(346002)(66946007)(478600001)(6666004)(186003)(9686003)(5660300002)(86362001)(66556008)(38100700002)(38350700002)(52116002)(956004)(6496006)(33656002)(8936002)(4326008)(9576002)(44832011)(1076003)(26005)(66476007)(316002)(8676002)(6916009)(55016002)(83380400001)(33716001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w9tcioMO3OIP4dFEmSABzM94D8cB5im5qZIKJKqtpHad3kAl8fhMxLs99gTI?=
 =?us-ascii?Q?9WcoVl94JeJeaQfym6GY9dYCUHuPzO5vV9MesBlGafOUhN6UkhMu9jDcQk6E?=
 =?us-ascii?Q?/hl945JUBmfKID8vrMhtoUuZmUL8ysducPfF98RYQgSjRTdKSIjfXdtS0ATe?=
 =?us-ascii?Q?2z68+WVYnqbDHUdC3ngiWKh79ESrMUqAZOo6p6eOqVcMCnEfyxxscUn5cdkk?=
 =?us-ascii?Q?K1dwPPsQ3035y0eKThnK8+I2Yq4I7pu9r68ONzKxnhsVNt0ziCtbtqkU4G82?=
 =?us-ascii?Q?mBmOY9c5+9/NHnnwG9fXULjSqsdmVp1lSz2FPj/gxpHGCZNNPvtXIdWHJsH4?=
 =?us-ascii?Q?o0yrgPtVghoH8bjB7gicS8O4WhAOkjCbtRJUjGK/icvZzT+NRcZ7jzlLNrI0?=
 =?us-ascii?Q?WxkmZsqGY/YiAj3LdDgeqA9gS9Fpgep1iX96glnhhL+lPNh1/eYd7oPGyKJQ?=
 =?us-ascii?Q?DzvROft3z4CrTz7CiIfYYkDwy+TJnwpU6ITtvEl53b31XZ5iFZpbiw7irJ/z?=
 =?us-ascii?Q?NpsNqQ+GMDfOjmtTQitv+rFrw3na1ic4f1Cyoh/ytQBNu+QGO4rfVaalqGp2?=
 =?us-ascii?Q?YAauumHTCkmS8PEVWqoLh+b1AGCpPJAxwfC3YPZuAfuLztmNrvtGik0TIAlb?=
 =?us-ascii?Q?PKzFxUyWjaZWTjhWGl+tzPzd2KZJ4E1ATvBxccM2l2+E54PjktFSRmGA78cx?=
 =?us-ascii?Q?Y4rDL4jop15NBSzsyS3OI2a8SENRiFTmgUIYtH52ZrR0zR/w5E5IMSs0fVK9?=
 =?us-ascii?Q?MiniQN63KHR8QK6CJlhuWiIeoERq/JNEBChUwYpHY6tMP6kIVUkRYBqPfCB6?=
 =?us-ascii?Q?V7JtYsyAAwa621y3b5pd6QqCK6LOA4rP0Bv3dYtu3OB08dBtncD1SQYr/5eh?=
 =?us-ascii?Q?ZHocaSBz7AENJYgBW/ZTDVhIAtsFWyrNvt2ug3NWXQZ0a1aNR4weZAYYvSyg?=
 =?us-ascii?Q?VhXZy/3/Gv07qzgPWpL8aTxIqWlbWaXd9jRPr4D2Xakl7qQkwsmhnvZ9iFsm?=
 =?us-ascii?Q?gMxIzFognMO19YF6zqNV8yDceEIkAofeCeIA+8hi9vN4LdtODgJ05KnG8yff?=
 =?us-ascii?Q?ECh5nE/gSzelG/J2ad8KGAFUVyxMP1NLbJ052+0u6aa6xS0R7MFLgqBXxDwr?=
 =?us-ascii?Q?pxTE6IEcrPM3KTziHlao6hD+epaPuRIlMFtGQLYjFsOMPWc217jDi1ZMrsio?=
 =?us-ascii?Q?4MORPVo+BVCy4ElCzvFSwFob/g0e6SeAXKXSYoCxRBZnM7+620CIYfGj0Ehq?=
 =?us-ascii?Q?6x9UMAqxT74gpS8xHSNnTDY1ub8TbnnRFsBhJLKdMxsPMBodvWIHxfle1L+m?=
 =?us-ascii?Q?N37Cg6Z86mHy8IeMTCykP8RX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260f75a3-0049-44e8-7690-08d966ddfbff
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:03:05.2433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWuz2cDgHQhHhejYyBT73SLAbTB1jgblvneQjfVGlYQ2BleP2FdtBR53BloE9qnmc8q9Rm24vQ2H/pNEUflNemZenRwITv/ize4shNEiVlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4707
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240059
X-Proofpoint-GUID: bDNXaKNiVVRSXlFuzMJXyOfNoS8c7pCT
X-Proofpoint-ORIG-GUID: bDNXaKNiVVRSXlFuzMJXyOfNoS8c7pCT

Hello Konstantin Komarov,

This is a semi-automatic email about new static checker warnings.

The patch 4342306f0f0d: "fs/ntfs3: Add file operations and
implementation" from Aug 13, 2021, leads to the following Smatch
complaint:

    fs/ntfs3/namei.c:446 ntfs_rename()
    warn: variable dereferenced before check 'old_inode' (see line 312)

fs/ntfs3/namei.c
   311	
   312		if (ntfs_is_meta_file(sbi, old_inode->i_ino)) {
                                           ^^^^^^^^^^^^^^^^
Dereference

   313			err = -EINVAL;
   314			goto out;
   315		}
   316	
   317		if (new_inode) {
   318			/*target name exists. unlink it*/
   319			dget(new_dentry);
   320			ni_lock_dir(new_dir_ni);
   321			err = ntfs_unlink_inode(new_dir, new_dentry);
   322			ni_unlock(new_dir_ni);
   323			dput(new_dentry);
   324			if (err)
   325				goto out;
   326		}
   327	
   328		/* allocate PATH_MAX bytes */
   329		old_de = __getname();
   330		if (!old_de) {
   331			err = -ENOMEM;
   332			goto out;
   333		}
   334	
   335		err = fill_name_de(sbi, old_de, &old_dentry->d_name, NULL);
   336		if (err < 0)
   337			goto out1;
   338	
   339		old_name = (struct ATTR_FILE_NAME *)(old_de + 1);
   340	
   341		if (is_same) {
   342			new_de = old_de;
   343		} else {
   344			new_de = Add2Ptr(old_de, 1024);
   345			err = fill_name_de(sbi, new_de, &new_dentry->d_name, NULL);
   346			if (err < 0)
   347				goto out1;
   348		}
   349	
   350		ni_lock_dir(old_dir_ni);
   351		ni_lock(old_ni);
   352	
   353		mi_get_ref(&old_dir_ni->mi, &old_name->home);
   354	
   355		/*get pointer to file_name in mft*/
   356		fname = ni_fname_name(old_ni, (struct cpu_str *)&old_name->name_len,
   357				      &old_name->home, &le);
   358		if (!fname) {
   359			err = -EINVAL;
   360			goto out2;
   361		}
   362	
   363		/* Copy fname info from record into new fname */
   364		new_name = (struct ATTR_FILE_NAME *)(new_de + 1);
   365		memcpy(&new_name->dup, &fname->dup, sizeof(fname->dup));
   366	
   367		name_type = paired_name(fname->type);
   368	
   369		/* remove first name from directory */
   370		err = indx_delete_entry(&old_dir_ni->dir, old_dir_ni, old_de + 1,
   371					le16_to_cpu(old_de->key_size), sbi);
   372		if (err)
   373			goto out3;
   374	
   375		/* remove first name from mft */
   376		err = ni_remove_attr_le(old_ni, attr_from_name(fname), le);
   377		if (err)
   378			goto out4;
   379	
   380		le16_add_cpu(&old_ni->mi.mrec->hard_links, -1);
   381		old_ni->mi.dirty = true;
   382	
   383		if (name_type != FILE_NAME_POSIX) {
   384			/* get paired name */
   385			fname = ni_fname_type(old_ni, name_type, &le);
   386			if (fname) {
   387				/* remove second name from directory */
   388				err = indx_delete_entry(&old_dir_ni->dir, old_dir_ni,
   389							fname, fname_full_size(fname),
   390							sbi);
   391				if (err)
   392					goto out5;
   393	
   394				/* remove second name from mft */
   395				err = ni_remove_attr_le(old_ni, attr_from_name(fname),
   396							le);
   397				if (err)
   398					goto out6;
   399	
   400				le16_add_cpu(&old_ni->mi.mrec->hard_links, -1);
   401				old_ni->mi.dirty = true;
   402			}
   403		}
   404	
   405		/* Add new name */
   406		mi_get_ref(&old_ni->mi, &new_de->ref);
   407		mi_get_ref(&ntfs_i(new_dir)->mi, &new_name->home);
   408	
   409		new_de_key_size = le16_to_cpu(new_de->key_size);
   410	
   411		/* insert new name in mft */
   412		err = ni_insert_resident(old_ni, new_de_key_size, ATTR_NAME, NULL, 0,
   413					 &attr, NULL);
   414		if (err)
   415			goto out7;
   416	
   417		attr->res.flags = RESIDENT_FLAG_INDEXED;
   418	
   419		memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), new_name, new_de_key_size);
   420	
   421		le16_add_cpu(&old_ni->mi.mrec->hard_links, 1);
   422		old_ni->mi.dirty = true;
   423	
   424		/* insert new name in directory */
   425		err = indx_insert_entry(&new_dir_ni->dir, new_dir_ni, new_de, sbi,
   426					NULL);
   427		if (err)
   428			goto out8;
   429	
   430		if (IS_DIRSYNC(new_dir))
   431			err = ntfs_sync_inode(old_inode);
   432		else
   433			mark_inode_dirty(old_inode);
   434	
   435		old_dir->i_ctime = old_dir->i_mtime = current_time(old_dir);
   436		if (IS_DIRSYNC(old_dir))
   437			(void)ntfs_sync_inode(old_dir);
   438		else
   439			mark_inode_dirty(old_dir);
   440	
   441		if (old_dir != new_dir) {
   442			new_dir->i_mtime = new_dir->i_ctime = old_dir->i_ctime;
   443			mark_inode_dirty(new_dir);
   444		}
   445	
   446		if (old_inode) {
                    ^^^^^^^^^
If old_inode can be NULL we are toasted.

   447			old_inode->i_ctime = old_dir->i_ctime;
   448			mark_inode_dirty(old_inode);

regards,
dan carpenter
