Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42FE72
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 08:35:47 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17P8U7vs021187;
	Wed, 25 Aug 2021 08:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=H/slXEIIYzS9NGZabOGJfbhvOw3a7v3r6xewjfXL1Xg=;
 b=y+57sjRkPxhtz/QATShLNfo934O0MbvkoekG9Q2vu41o+OHXGUu5S48JDTWWnYqGGyJY
 LKlUlo3TZmLvQo2yPDN3XkTaBNJx1DfUBqmAaQW6bsXwWk5zPlZSbjtPXRJKs/IjuMuR
 rTDr7xynYaNfCGRpH0KJu0OZLC2F/Hv8LT6ZViIbLLN+5GpkMG9d5MEqLv57J9og8Tt4
 hnH0XU18//rgwVDGFxB6NVvT+AlLFg0hKVD2dP7fIpqSQvae/hLx0dYL/HVs11NYXK2q
 Tnx4uRHavpAhhSh334VHJckmPv0z7CQWBmA5TS4qj2KmG1ChVZx/xMjnpk55Hr5llRyt 8g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=H/slXEIIYzS9NGZabOGJfbhvOw3a7v3r6xewjfXL1Xg=;
 b=At/TPJnUvHgzkW/pUzrfwxCGFoFEgEi9CkI3LTXXvjM+rOhwLJXnaafPioGQeEJqAX0f
 8F+j99+P6bq8Mp7jZfpXRhKCx7iN0orerDt+ed1cN/C7grtkUObpt4x4rCY+gyt8somp
 7wqcd32QqvUg1ND/I5A2g2In6d0mQLa2fJ32OHEY6wRquG+lpZpQNLnx1rnXwuW8J/Eu
 /hTFTWAvERlSoeHIlUtCn/TkI398HoB+TY5t2YSZLi0BMehFFIO+KV4iVww1nJGVsZE5
 tA5fB+Vc2jR9ky1nm4kd1pVP8JYef0d7O3NFCLqrxA3nsgiU+Jt7Qq5QGP6DE1dh+mif fQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amwmvaujb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 08:35:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17P8ZITK074682;
	Wed, 25 Aug 2021 08:35:45 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by aserp3020.oracle.com with ESMTP id 3ajsa6vvf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Aug 2021 08:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haj74hRa00ef1ioXwpgFTf0VEuqgji1LJx6NThDKgkG+0+gR/OuXLYnxmPRm0OOR5kaChgiwLwrk/AJtfljJyyTi2+A8ayrZltylm11R1Io5J4OkKDWBeykAIhRN+B1+yNGRlrbE5zMJlMo35O2WIWnaUP1cInfxaRbANj+rA1zhLgUYcuq3TF6J+Nc9PEbvToOKSukIw5LMTVBD6gBs1S73dtQpvOUtKG/Tqlk+E8gp4CAXstf5JHQC1h1fG0+zLd/CpswvWWCgLNbJktAb/lFX2TuOAuI1QjsMyKyNrxRjz43VWVZCBecEjMJYuKySf+ybxhZBcKDE0yUbFmJxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/slXEIIYzS9NGZabOGJfbhvOw3a7v3r6xewjfXL1Xg=;
 b=mj6dDXgijuFHx7vxcrBvjGVka5ZMbN/9fX4lVB9bkoiCqBBwiq6ISTw89NGIEFtWPlK8ZTZbdTTUIoIVJlRfs7Mmy6Jo/2+iMPhhMf+j08JndhntWAWPw/ccbOkFubkvxTaWqdc235MJCK+uNzV5FwcSKO/mQ0f2zfSSqCi5AVvCwyewyJoABc2v7hFB2a2KmGUSRn1Lng+nry69ID/VRSBk+xoh8ntnrQ/Q8370UyD7VKk5XvEx9NvACQ3B9kOVwKCmJgcd6W3L1DYVKBxxE62Q2CdNkicu1hVX8zuByukhlmtc3IgjZ9opFq21zWAhZyoesHf90PU76biNLrV4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/slXEIIYzS9NGZabOGJfbhvOw3a7v3r6xewjfXL1Xg=;
 b=AxdTbOrYQCgi8mVtHGzfSWytUustYoMDywjclRRWH3AZkLR2/kF7PlD6cCaU1bmfM3SNQLHxrbP2T3pVKSwgMCu930khza2gYl71V0aRtj1WCngftR87ZTWCqbaGmOL+Y4tai2Oi94oEijalGCugWPGdnX5zeCWlvk/maApx/zM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com (10.174.166.156) by
 CO1PR10MB4707.namprd10.prod.outlook.com (20.182.136.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.23; Wed, 25 Aug 2021 08:35:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.018; Wed, 25 Aug 2021
 08:35:43 +0000
Date: Wed, 25 Aug 2021 11:35:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Subject: Re: [bug report] fs/ntfs3: integer overflow in ni_fiemap()
Message-ID: <20210825083527.GQ7722@kadam>
References: <20210825080440.GA17407@kili>
 <20210825083340.zd2en66jqmohdy4u@kari-VirtualBox>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825083340.zd2en66jqmohdy4u@kari-VirtualBox>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0027.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::15)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JN2P275CA0027.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 08:35:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53a7a595-ce46-4fc6-ae15-08d967a35412
X-MS-TrafficTypeDiagnostic: CO1PR10MB4707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB47075DF61FF3BD93E5D71E9F8EC69@CO1PR10MB4707.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EcUgzluYta8AKeoEv/siWYLr2iJpD+VG1gRlb3+QX4f07D2hCrwzc8i/ZAKClFP5yp7SowM2fX92opI+zw8u/32QQAL/GcSnGFuNiZK5W70SfrUQCEPkDfLmYfdwBArJnNh04HYzxbrVc9UY8wywaLAGANg3VEF1dBs7hQdwdl6IH1Lj7ZAdn0r47vwQ+2bGnGwfvMh1mE6YuUa4J6D4v/0rWmq3yPii39gbXrLQYIYVOCb7FS+XJ4z8eBvastICSQNNYWcJencgenA+1CMBR5jI8elh4bUsBQYELKAdFiSQKk44Y6RnoYTS4zDZ6H5KCJq98JwnPe3XFWdr7pSkHUjFNb9llUkIG/XRVQuJHDKUC0EJg54VpPgk/XMETieD+Iky6iblPrvwfobh6tsjlRTzYFju8JsIdxz7KhSEZl/Oaco8pHn8bjbSZ+4JwOHU+hvSJm4dzVQ42yK1uWxucExg6MPIIqWBrPe5i23xKdEzl9+0uNy7EH62poTNIz50rBt1finRfNQJ2Izc/T/BITaY5Fl1CbMyYrE3RDRWG/JNMElaNISjTf9nmdoD8PExWaQJdKQJiG0T6gyTUARUlz/dhu/Yexp9A35hhqRIzFhIfbGBTyQUfTcOtM0AWj/yQfvDT7Z/AfsbuvXmPWnMOnqlTC/w9jbJ8S4AJm0U+FXEYeejXidycWQmxuUhC6TOJ0ryrlmfzUhbIHVSuBvldQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(346002)(39860400002)(366004)(66946007)(478600001)(186003)(86362001)(5660300002)(9686003)(6666004)(38100700002)(66556008)(38350700002)(2906002)(55016002)(956004)(33656002)(52116002)(8936002)(4326008)(9576002)(1076003)(26005)(316002)(8676002)(6916009)(66476007)(6496006)(44832011)(83380400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HVAoepty5tjJlISTUqslZX6pGmXWZz4BP3imk+wZxdYGMCm+Axvt387BorXp?=
 =?us-ascii?Q?VzxotykleRlBECTWKvfwhJZTsF7hIjiIbXRcmGD9Eb7Yry3j+QC+F3GBF2UY?=
 =?us-ascii?Q?xc1U5zUoL82NtlyBMDEGH7k4ZLee0GkMNB731h4icaODZOuGh091wf/KumA9?=
 =?us-ascii?Q?gdB7NYZwnuuIs9tYYqEkIfS/Wl18spX9xxuzOUtoh09Klucb9HgnrcH+ExHV?=
 =?us-ascii?Q?BaMOaSi0GfJvu5uMWN1SFegAcUraMGQXOtVlGnhkBo2Vqfc09LM82RNgCdy8?=
 =?us-ascii?Q?Fnw2DR6TUqtLf+bzBufDU3ZH3kk9ctSQ2emnkQ0rxzB+qcfnlSf4ttyFPrhs?=
 =?us-ascii?Q?q4vC27+HMU4cIO8bbDQKUMo6ZvKGA1tgyOKkOPV6+d3JdblYZCnniD5ZhdFJ?=
 =?us-ascii?Q?vcKt1ekiRklqCD3kr4PvIRzV/VO/vvfFaBcnNXl46VwQYMx01BEL/o5+gvAo?=
 =?us-ascii?Q?xQIfUkh6T63N1h9fKUXiQ5xibZpY34tmsbZ2AsMv+jk8AlyXbFq51qKbL6s8?=
 =?us-ascii?Q?OIO22kgVI+Fp1IqT4ojpUvtE7h50rT4eCxVY8IYIL/xmw438vACiZV/Wt8CF?=
 =?us-ascii?Q?k8EXn/O8X9kLxW2y679y4tDiCBovU43VrRdLdWBdhon5138uzvqNoC3HeF9U?=
 =?us-ascii?Q?B4Ty+YrOvQJ6Id4lulN18vVOgCT2B0gqWo/OgFk9aUVpDCQRwaA+tIYe5V18?=
 =?us-ascii?Q?wF7GWoUa7AyT9BQgqsuGkdmwrBqSYBygZrNikW+7Eyv7T66lTKfe02KOXlNs?=
 =?us-ascii?Q?3S9Nru9KbV52DqxJ8CjKI4Eb/l1ccMd162xZuA5Yw5PmA5SapXvu+QJ6i7aO?=
 =?us-ascii?Q?+if3i43jp/uygxJFa+by+4w/wkSVGFZnGMipA4F2PT0cbzl4yGqz6EzZeeN4?=
 =?us-ascii?Q?wUSi+qAEG8DH2wJH+7I8wJ/EsLOIS1V+ZuKZOXUQ0qDwPIiiJiZbv7NAlSPA?=
 =?us-ascii?Q?LFN6aOtgI/8SDR7ayHyJmWxkmMg//zBR0zAK00ZXdftaNKJukrOXkNa1w+md?=
 =?us-ascii?Q?5in2rwPe112qctI5r0Az8SFYHYFtu/MFvtp8Woa2T807t0HDOK8tokt1A4yO?=
 =?us-ascii?Q?GNJkrem+FKXbYPZxkeIyfw/4Jm4tsihH/6MBURuC4ePb/l19CAn7ZsuA1Bpv?=
 =?us-ascii?Q?4tUL/k+YfSNAmiKWkOpg7OYopXP33WInanL3dyYaqYUTFn6nqCnkYQO8YRKE?=
 =?us-ascii?Q?zxgC/UI6c8gnlNsJDH1TUopepVV1Xm4bV2lTgAOerLvHYeE/AeDFRceDD67a?=
 =?us-ascii?Q?VjYR47/VSE7DVf9t71EZZcrKOS2iiN7ItvgMelVRx3CB271RScuiXy4Lj6Vg?=
 =?us-ascii?Q?x8Gn4FEiz3qX52J5oU2enDS+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a7a595-ce46-4fc6-ae15-08d967a35412
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 08:35:43.8848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGo27xWIF67faMKmWZDGAsx5ellq9MwZrL3xd88hDGWcGD07PhzV629FWr3qsLXCdgoR6U0klJLZ0JOuCSaawS0RZUEEU0K5YNVBwTMOe4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4707
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10086 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=976 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108250051
X-Proofpoint-GUID: _Bj5I-e5Rk3W8j7ysTW6MWYAd7KRYm0B
X-Proofpoint-ORIG-GUID: _Bj5I-e5Rk3W8j7ysTW6MWYAd7KRYm0B

On Wed, Aug 25, 2021 at 11:33:40AM +0300, Kari Argillander wrote:
> On Wed, Aug 25, 2021 at 11:04:40AM +0300, Dan Carpenter wrote:
> > Hello Konstantin Komarov,
> > 
> > The patch 4342306f0f0d: "fs/ntfs3: Add file operations and
> > implementation" from Aug 13, 2021, leads to the following
> > Smatch static checker warning:
> > 
> > 	fs/ntfs3/frecord.c:1894 ni_fiemap()
> > 	warn: potential integer overflow from user 'vbo + len'
> > 
> > fs/ntfs3/frecord.c
> >     1843 int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
> >     1844 	      __u64 vbo, __u64 len)
> > 
> > "vbo" and "len" are u64 values which are controlled by the user from
> > ioctl_fiemap().
> > 
> > I looked at how BTRFS does it and it uses the fiemap_prep() function.
> 
> And we should too. This was already in my todo list. Just didn't
> notice real problem yet. I just though we should follow api as api
> stated
> 	
> 	Flag checking should be done at the beginning of the ->fiemap
> 	callback via the fiemap_prep() helper.
> 
> Do you want to send a patch or do I? If I do it can I put reported-by
> from you?

Yes please, I'd appreciate the Reported-by tag.

regards,
dan carpenter

