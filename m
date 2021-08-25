Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924372
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 08:37:50 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17P6TaeZ030409;
	Wed, 25 Aug 2021 08:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ojCvK5juykaAFKFBHcHnybh7kb9NAOWev8VfUe+rTx8=;
 b=WDH6mlUAAbqIExA+BjpJzayNHADH+rZ2OYQWaE+C0A4BN6pUF5o/UDaKYEEsaKwXmrmo
 J8rrhgPUMIued+Z4yYOY2KZKWsArVgWUAtUZ7ULFdqIBUjwS2uuCWXyABw7hFAfYp2ju
 plMcLb9rxIUkvHeEr/+RdbBJa8GCqbhSTn9TXMOZDB5pCljsoLOOfRxfuwAKkTNORbuf
 le7JaVMguXDL5yMPxFe4/MpC6GntdEkbvfKSf2tDdJx65v9jHW8WVzeca6e4PoRUEdyR
 Z2cULNqqPHh+wwRl9+s7Eh++g3s6/uKXvjAAk4jPz2uQQOvb/FOHa5z8bqat0gmPxqHU Jg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=ojCvK5juykaAFKFBHcHnybh7kb9NAOWev8VfUe+rTx8=;
 b=Bc7DVafLSZFcy2qQFXYPQet1t2OHooXtmK3z37Vfif1vMyXPBRH4tGjdN6FqlLAusp1S
 fQDKS6YQN+dL7h1XbL0uFtTQQWBY0LUXj/zrshNbrjLWTxT7fXN1HqDXmn2azlkJQTPR
 ANM2nsOXUmk/1zQZaWomz5xd169Ft8f/93vJHskmWpqwksH8Fqq0xBrOe+NyV5W69y69
 3N1Fgt4ssZxQ8lgFxUXMC+XaP+QjD2/MZ+brEJYq/TwoYyYkbFKLqnTyBzGMZhtQusDY
 vbmIlaaZWlthAB+tHP4DZ2z3Q6O0qj1nk/JMtlVOiMhLIy3L9D6gBLZT/ZGulMat6Vpy eg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amv67b3as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 08:37:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17P8ZO5J006346;
	Wed, 25 Aug 2021 08:37:49 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by aserp3030.oracle.com with ESMTP id 3ajqhg7s0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 08:37:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqAGwP9ZDCnkICTyDTEZYYkUXGLixu/V95qgROlTiMW7Ld25HQdIq0IxQEDI5ua0zixLBRhCmc+gNwQIVh7Va84HM2K0cpe9jVX+w+oTDwPrUyNCdF2w1XSSi2FFLmiNR/V3OrOkjFUrHyi4Qu4swshqAVLHnXDsqkbwORqPLD9Z5q1J0MAlmT1+9wFlIhqsNbSV+cihxx948RzX2caJL9jcvr8xT8YipZUcSTamXRELlk1mzQ5+xtHyameeSbDxxcVP32/okjrTKZR01ZgybwS01dyrfex+16mbQUkhcMwnCw1fjSCWxIx5za7wBUVa+zLcAkiK+W6b7ysILMXuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojCvK5juykaAFKFBHcHnybh7kb9NAOWev8VfUe+rTx8=;
 b=CiUsnbKY2lr1K0mmoW8cuDne301YuTORcOLAdq1/H0ixe7lFcFzuAprjNfXUH7IQwSVs6KNjm7MpWrzc9nEzdepoMsuaIokKYX2KoaemUpEK4bS8hNlqEobGrg0TMyFvGAX4DRSKB9MlMM0JMqZaP/6+NkNE0nkzfdmG4LgZPEk/Llr3oF5+8maJw3gy9Cg+WuP9cImVu5CQaSM6HA3jo5pku1dRg2ZxGSbQFasOLS+7fRQgmitulfBwvsW0RhhzF2Q1BSKRj1AYhqVomCViu4GObewUXsPCftzFY7AZYcljZFrzLciBrzz/19k884a+RzpxgEbjKWOSPg12D3++KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojCvK5juykaAFKFBHcHnybh7kb9NAOWev8VfUe+rTx8=;
 b=ZogYa02D4IngQ4xKiW0zufPQEWEKAbKTTcHexCXvKhLNweOvhqctgLk6FeRVGlLrKil9xX2rX2n65XibQe2jEXzoUfdnpXJVo8nIAvpEDexr6neBlr2zocBBulnt+mfTKJpAKpdYoKnvkN0zsYpXUT1qWkylaiF+/T27A09xMfs=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com (10.174.166.156) by
 MWHPR10MB1245.namprd10.prod.outlook.com (10.172.52.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Wed, 25 Aug 2021 08:37:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.018; Wed, 25 Aug 2021
 08:37:46 +0000
Date: Wed, 25 Aug 2021 11:37:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: inconsistent NULL checking in do_action()
Message-ID: <20210825083732.GA23148@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM8P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (2a02:6900:8208:1848::11d1) by AM8P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 08:37:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58e9db72-6115-4cb6-4277-08d967a39d4a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB12457DE2A89711667E09E5F88EC69@MWHPR10MB1245.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:86;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ItKshIHPhVYOzVOgHHwJtg3SNICNxA5mRs/CSs5QcyE4ZgN+i4BB64znuzQnmWVqtQEwSoRbx258//A8bOBaqnK6nvmqDAL2KXD+B6qbu9k9xc+G7zYqUx7K09FzvlSzoS5PF+X0D4THpHemXy3j648ULx3gj3IgpVTCBQ790g+7EGW36OFQU8IQWPYUA5tcH/gA3S66KfCLxALUoiR4wiev3Wz+bHSPlzv8xViMoZqABWiUUJL4KiwzRpKkGrJrb7Usd+6c9hTvbd8GAsrlR1++bh31AvDQk/d11ScdhLZg/PxIThFNknfL8y8M81Onc1Es/HjrED+VWFpiGfB9m7r2T1C3z2ix6bSR4Z7SyHLOmq19TAT3iOMMkWfp8cQEdqF92tamL1HeqAG95F1XbUAhpb1NGFrdNs99Jqy8fC7lnvyZSB+9+14thjZH0oE1a7brk6JSi8juX+0UdiIBfaYQTQU5MFw1APwrGgEWQSP9+BZ0q7tuqPJhjEEU5LG/JhcRVg03wSzRiBPT8sx/57V62r7OFLGDjsX99JkTz3dyXWXCZG53plE4pKEHh/ZJqgEe56AVq/a8KFLYwYcd0To1V0Cu86X9u4c8JQBP6VWj5rcKctDXeDLfiB8wJgWyRDIrok9uuicfirjZM4cpvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(84040400005)(9686003)(8936002)(52116002)(4326008)(6496006)(33656002)(186003)(8676002)(478600001)(6666004)(55016002)(6916009)(66476007)(9576002)(66946007)(66556008)(1076003)(44832011)(38100700002)(86362001)(316002)(5660300002)(33716001)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MnL81m90DqsQq9SEmYO28kntSbErwQvJK9dYhR857V9dD+kMiiOQ9fQO0nLp?=
 =?us-ascii?Q?A62iiiAUt07U7pQIrP1ItMB3zKIA1RHiOJhV5KJjqsv2byrmcQuTIPPE39/3?=
 =?us-ascii?Q?uZIxRZVw3JLBgQOZ1RXdvk1b4D76Zm+hTzgmxNkDOLs1w/dTnmW83CzMR8g+?=
 =?us-ascii?Q?H2nhXQiqBUZDRCy2WDBBogAsaQ4MSi/DGta2Zoym17W4QZ3hdgr7GRs4/kcU?=
 =?us-ascii?Q?RoHXpDOPmBEW3lVIH+rsB4UkWjBIb/NPf5pIidNeOT7e2pLiDYOV75D1BmCj?=
 =?us-ascii?Q?7mqLcNZ7rpLIwSyVsDhn2e44oHQXEIOl+e4F362RpR5nEQ5uWXtclxfNSKe9?=
 =?us-ascii?Q?pYjSV/f4GTrtIVv4JhRes3TRYUv2ri+yIKkYKzM2Z9tTeIPtgitfSLg11x3M?=
 =?us-ascii?Q?K/RtIxqFcD1XbC0E+89a45wZpgWXkpvbL/tCtQxKCP/D0pVbcYyp4F6GCicf?=
 =?us-ascii?Q?mWsapMOrdSZpVT2Xy44oY2JHDn4GsyOiNRRzGLtvQNMGzgM44wpln5z9WVC9?=
 =?us-ascii?Q?M0TpyTpFdPgYwtd957RKiLELzonlf+UUPR1MNrhoPBcjbqzlZAoCT2EHn53I?=
 =?us-ascii?Q?jkTz4UKbYDfAdBUwaAwTZY3glDh4EtMBnzZsW/Vw6bESmIZGubgZRawXaWcm?=
 =?us-ascii?Q?VLbg684eSEotjjrFEQJ+o1UMy0skhQdo0exR8Sjtl9VxUhnB7VwrO9OcZ7Fs?=
 =?us-ascii?Q?F+l2nDllYxscAUfGZc/Zk0Truog8YjdRt/XOnoClUJGCdnc0AwWpQyBtLKvG?=
 =?us-ascii?Q?cg8cNFdW/DqUWvpNvShcDPMAFyWr0Ytas1/DCC2IcIJPm07jEtOEkF3kBmoK?=
 =?us-ascii?Q?1NLtElVWqULyaUuWxYUM0BUCHZQYE3HqJ0NS1rkq8WKjPevXc11ap48m7i2s?=
 =?us-ascii?Q?XRXYDbVPUE7vaSOxHVnygsV9g9K1qYEHT6crTpjeHCH6NO+Bq9ubIWGII9pt?=
 =?us-ascii?Q?h9rQDvbNrc9idjqYpuxns6dwwze+iZsqK1Wl3b8+p6iJAHEGosR0EtcaDAEj?=
 =?us-ascii?Q?e+MOIDeKMXOKDzExE40NpY2MjLx9IEoLzZdotwO0/fLn59Y1IF5o5/jnBGHN?=
 =?us-ascii?Q?3y3k1x3rcNzKVnW1ooGJddw+Xt601VY95fKo3Do+36gs/dY78iD4zQIJ4TVG?=
 =?us-ascii?Q?pA36n+PBPrVXYkmqzWT4QNcPpEKDdAG/RfBKDCPuCndCZ1sKC45BRHcqNYUr?=
 =?us-ascii?Q?x8aoSP3W9/QPYWKJIGyB0JZpODdW1iiZYKnbfVK5PUT6Qm3SMODXFbn044x3?=
 =?us-ascii?Q?dcSQV18Cd8mHCdoBqPojyqtMHoie10kahJqZzGxDG3CFn29fy2NqZHH0DwpD?=
 =?us-ascii?Q?AJCvoFvVXRDcUZvVCIqNnxr3ZElgBnW5BH6QfqyNAlibCZjhC14sjYSCgBQj?=
 =?us-ascii?Q?V6zJku4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e9db72-6115-4cb6-4277-08d967a39d4a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 08:37:46.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5VdI5WzV7nKoVSfQTdZgC2CltrN5GWLT192sa8KMvmFEpc0tnHLMVzdCjGqyAbPJ2PvHoYmBRFXnSWoST4C5Iv2BsDlAX21QpAsV/FTwtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1245
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10086 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=931 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250051
X-Proofpoint-ORIG-GUID: iUQ3nZTpzCgRAcQjSD3TUj2M4pmVfxPM
X-Proofpoint-GUID: iUQ3nZTpzCgRAcQjSD3TUj2M4pmVfxPM

Hello Konstantin Komarov,

This is a semi-automatic email about new static checker warnings.

The patch b46acd6a6a62: "fs/ntfs3: Add NTFS journal" from Aug 13, 
2021, leads to the following Smatch complaint:

    fs/ntfs3/fslog.c:3141 do_action()
    warn: variable dereferenced before check 'mi' (see line 3102)

fs/ntfs3/fslog.c
  3101			}
  3102			rec = mi->mrec;
                              ^^^^^^^^
Dereferenced

  3103	
  3104			if (op == DeallocateFileRecordSegment)
  3105				goto skip_load_parent;
  3106	
  3107			if (InitializeFileRecordSegment != op) {
  3108				if (rec->rhdr.sign == NTFS_BAAD_SIGNATURE)
  3109					goto dirty_vol;
  3110				if (!check_lsn(&rec->rhdr, rlsn))
  3111					goto out;
  3112				if (!check_file_record(rec, NULL, sbi))
  3113					goto dirty_vol;
  3114				attr = Add2Ptr(rec, roff);
  3115			}
  3116	
  3117			if (is_rec_base(rec) || InitializeFileRecordSegment == op) {
  3118				rno_base = rno;
  3119				goto skip_load_parent;
  3120			}
  3121	
  3122			rno_base = ino_get(&rec->parent_ref);
  3123			inode_parent = ntfs_iget5(sbi->sb, &rec->parent_ref, NULL);
  3124			if (IS_ERR(inode_parent))
  3125				goto skip_load_parent;
  3126	
  3127			if (is_bad_inode(inode_parent)) {
  3128				iput(inode_parent);
  3129				goto skip_load_parent;
  3130			}
  3131	
  3132			if (ni_load_mi_ex(ntfs_i(inode_parent), rno, &mi2_child)) {
  3133				iput(inode_parent);
  3134			} else {
  3135				if (mi2_child->mrec != mi->mrec)
                                                       ^^^^^^^^
Dereferenced.

  3136					memcpy(mi2_child->mrec, mi->mrec,
  3137					       sbi->record_size);
  3138	
  3139				if (inode)
  3140					iput(inode);
  3141				else if (mi)
                                         ^^
Checked too late.

  3142					mi_put(mi);
  3143	

regards,
dan carpenter
