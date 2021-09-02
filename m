Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1A72
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 10:26:13 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1827OUUk017087;
	Thu, 2 Sep 2021 10:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=2dExNh16uAZALMj2eotelpy5R460NCMeWYCjCCIachM=;
 b=pxxTjjLAMwYFi146k/SF18WQNvILREDBNG5jLs6sZ1H06oAlTIc7EZ8bFvmzWCUwfP4m
 SwH4P2VbOlXG4dHUBJfUGaIdTP5bV4TMv6DLz9SZqaKVjIosGEvkNNCBigeRS7dUpa1Z
 zr4i68hG/PFB0LjW+AFVsI/CKjoMPAXGdZIWhzXMraYKowq8p+tdZ8k5rY5Rbo3CowtA
 mSwr0Z/qX1X8MEy3/2CbwPa8XRJOoYSeZloBDTItzZwjzeAXmSLUTM9dey73IlXQdJ0C
 KKCBITBxkFzctpAzaSszZE7ppcE3jPa3EAJGgmnIcIpNIIPPM8P8/dl+Ud95ej2xZCKw 8Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=2dExNh16uAZALMj2eotelpy5R460NCMeWYCjCCIachM=;
 b=vG/sR2TJ2qJSSQ5qI4d7h2ravWOpNx2G+a2qtkmaYn+Gnp4KurpDjNdHu1AD2WP6GKra
 GPHGfg4/6N9N1uxM9D96pN1i7/fzkzIVP2Skg7Cs5Zd9Ua7ibr08evZO2f+EpGUU/pZ0
 bqDSVj9DVvpVd9HgKvC1eMtMyfkC/NbbG5kRn82MK+vI0u1FRPWb9gMKhCGvFkg5W6l3
 hXJHC/Eo6UYc5H+W1yi62/t6MD8ERaPhzhzsYWPhMPzZKkW/K5NdlOiBJ9Qw62fjURxw
 ZwL4MndyyykwaKZ5BAHL/iLVXr7B/O47hGOLF58Alm0zKbLRxsAnkx4WYFMqtRoHywId yA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3atdw1a7dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Sep 2021 10:26:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 182A9sJU055505;
	Thu, 2 Sep 2021 10:26:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by aserp3030.oracle.com with ESMTP id 3atdyws2m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Sep 2021 10:26:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxVRkiFyuFQix5tYbG3u5Kv+WRqfEiVYd/hBouP82+b85xzjtaQPE6OdThp/b1KGlV/BbmHMSWdr+Jj1T6MGOkSqEnrUmjaoksCk3DfmvCk5nZKo8PzNxs/PuDgrsz4xrrH+zV1cvKxRKPUJSRfauGjA7T39S8HHhJNXMeTJVJXMHjgkalxN1u6ImRVXiLQP9wgpHELuEQwD4HqrBYNlZNj+9ku8x19krtBrGuU1AI8uwy6O5ptpZkZ9bUhQO3Hi+zqwBMUA3E8+xKbPLsAum+LLpmUK5aEzjcGI8SnSgspNSz7043T2pC4B0zqbLLxANX3ph8oznQJcLSojzkcGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2dExNh16uAZALMj2eotelpy5R460NCMeWYCjCCIachM=;
 b=D5Dd3xZxG47XqaNsxgTFjoFbKzJwqehV0wUFFDuXtvcJkglafo7eHAOY6uUpXek/uh0V6j8Q3Rsouqz2cjNbrUTOI0zgGzGi+fPK3OiSUQnMkJeYI8rJvhoVSIP2xFHJ2v7kIk6hM6lgxgEjV4EcrC3qX/1RmCsYFuLqZGkcFa5WE4xb8Q91ai7TS2R7SYwXAMIx/qsvIdAM0WyeyHgK+81sbiJB5ecRFr10W5yIGN+Zkh17dM2K4VG59jE2LhutSrutOlq6UDNAEqeprMEvpI0Lqfr9v1HP8A8VY2w6URKLlo7oivnia9Yk9tUdCiQ/pDbi8qgALFdUWUvxaW/YVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dExNh16uAZALMj2eotelpy5R460NCMeWYCjCCIachM=;
 b=xXJPBqkwoU/OsKblLgVTC0mlLGPRpEtmAsHbe2XlWg9atguBNdwyPtCjWRZIJDtoVaapJooVx/eVKoPf0bXUn2PihWH7O4SqlyxygesrUeoVUKX96/vSJeQ2UaYXgaP3YK3usKaxHigeiCBCDbHNHQM+7/64OE9KYzbQDK/0pzk=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1245.namprd10.prod.outlook.com
 (2603:10b6:301:9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 10:26:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.020; Thu, 2 Sep 2021
 10:26:04 +0000
Date: Thu, 2 Sep 2021 13:25:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Rework file operations
Message-ID: <20210902102528.GA7209@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0112.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0112.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:26:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 591897e0-df66-4757-b845-08d96dfc112a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1245836BD25C041DAE99710E8ECE9@MWHPR10MB1245.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WTg8XJO/EWGH+CJbok2833VCKJxtnUl7w99H1oJNwYStCVl3UFQGR4F/97ALBXFyOW+Ro9+leaZWxQSJjE6s7sG3hLPkbtriy1DiWguwVlrjydZSJ+Gyy3pCbnSYeP3Wx0ifUVh9EcqEUXjePqz89frodI04xVCRWbVO8ff0HOKI2eCw/hR86cBC1Wi2n6Yhw0EWo9GxPC/1c77L++YSGkp+oXxXtcT786iEBGEJWNbGoxX1T84+oQtOw7Fxb3auZOPtb3SBwDnJy1NcePR03T+1bZ2YISD4LYWsZUmGhX32WbXwGB1jf30Cc8rXcFuOjbzA82tOnIrCkBprt9S+R3U1jPjb2DrhO0ifLlT4cFqfc+9ljryapte/SikvWMBWafDNt2tHllc0skYKzK0Y/wdqGc18ib1W7y5ZSjM4ufTDgdHa2WHHk5+4cl1v6JQ4PhkcLm+HLyvBcr9Jge0YfM9PKxKqNO0tyvCdXCACD5PBrjAv+23kwo72aAw5JhigL5BgXKuiFCkb45fjHE6s7fhIBBqvJcU8y8dlSeYE51Y0Jl5PIpkGJYL9JeU7OpKNEGVMQNnXfG3hke2X4KjHk+F7gKNQlY1jbA67rzCWNasVonPbrcCJ5qT0D+yHP7Ld7QrO+SlSMudiOkc3hwCsbxTc/aA63kOYtGl0YxxwUQb1i/gow8Qb/31RjC+KVw7K0sWQFFkowkAi70arCRIf1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(6916009)(33716001)(52116002)(8676002)(66476007)(956004)(4326008)(5660300002)(66556008)(316002)(6666004)(66946007)(83380400001)(26005)(478600001)(186003)(9686003)(2906002)(44832011)(38100700002)(38350700002)(6496006)(33656002)(55016002)(1076003)(86362001)(8936002)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5eykAPYT6NOQr8l8ZLAWOrBag057ch872u7vlsBiTI5TW3tY3CuvaGZzasco?=
 =?us-ascii?Q?FzDP2XCA7QgYWE8D5skkXZTaUW9w2oq5w+QlkisktdS6m3oyY9GJ7RssmGNa?=
 =?us-ascii?Q?AGbYauoefketDQPmGY9GwxV/DFBmfEAAEWOrfcsiDkXmSXDqnbfIjp0M8EFo?=
 =?us-ascii?Q?nLm9qZiQ3sXbFKzA/+3BzZS7gW513tseLt633ppoznzqUU4u9+kk1Fk939fQ?=
 =?us-ascii?Q?gB2aPjgU4+Nwk0J3ptz4Q+Xw/tulLPdfDbyoWbzGi3aRYJneb15FopNEnWRl?=
 =?us-ascii?Q?x7RHCzSoT6XdYOtu9hLEphmX9X0GlAKKN8DcGZ96NDBM0iSZHwzobOG7kvms?=
 =?us-ascii?Q?e48aBDllTrXNo6t4/2LzTNMtixyNeHnPHBux9R8/NQT0wwDcm59YgffTGXrJ?=
 =?us-ascii?Q?1+/luQ9WiUX6fp9o4G/hysfQtHJOGKtLwWsKCMnzqOh3+fnIK6SuXGfxR+mv?=
 =?us-ascii?Q?RsaLVHRtu7dqPDZrvBHNkHpEvFR1jxlPPrvKJLZXwX7vMS589K6KXL5GZsJH?=
 =?us-ascii?Q?L1dnFWrNIDSzTeMDEOHEvRA2aRxjP9JQhJlTgaRDmM/EnG9TgCh4xOPcKmKp?=
 =?us-ascii?Q?pCFZ9e6BKpHNZCYu4V0U8CFgKRZ6V+MRrET7iT6uGAoc1oL5mClAtW0NoxCi?=
 =?us-ascii?Q?pE9yFFQV5AV4RNDhJiYA8bky5m5KGUUJsvxKTW5NdEjua7jYVz0JgjWIW6e7?=
 =?us-ascii?Q?0JBYmk6tieWioi5THql+940ebsgijWAKSRHx3Dx/t5MTL7dhmGHQam815MTk?=
 =?us-ascii?Q?ylF+8c8pBY6no+6Db8AQ2ZDXlCCzpXT541ihCk2B19WEIFvPuMysN4y/UM0U?=
 =?us-ascii?Q?WxbXDS+LPlbaDHG2Je2pMAAXXgZYgIxB3kwAX5EHaPK2J964+X2uIgUd4Dlm?=
 =?us-ascii?Q?frCZ3k7M5NzOCFii4lV7Ky/FF2Q17JMZK/rN2v0MYSrROSfTB0L1cAAZUkrJ?=
 =?us-ascii?Q?WDghOEoNaUwUlX1fq15szMdj1PJAw5RoAK+wwEoahkicZBkm84NBHfnskCZU?=
 =?us-ascii?Q?c7w1KLv4vF+KToAELmYD6HcrvDXmxIlkiQNH0NrsBDqAloWoyQxZ8JbdxVUc?=
 =?us-ascii?Q?edmUMl5PXEapJfcm0DJIJ9VUygPmbjlTCJoQU7zG1NM23pf0Yr4nRm0SHqLt?=
 =?us-ascii?Q?XaIB4TSqOlQ3LwzgLZO6zap5yAgbSim/iiIVlwz9fQOc02iBV6bAb7OmiigQ?=
 =?us-ascii?Q?FTc1SDffJNYB+MgHRbOFN1nP9HhdXoEZ+edQgGgptwu97TzebQOqyE428ae/?=
 =?us-ascii?Q?81hUq1SZZfDUiiA4PIkc3dfldd9p676VahO2o3zNs9eFQ2C1n50J2RQV/43e?=
 =?us-ascii?Q?s3B8Z64SVwExqrNnb6QYWmIO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591897e0-df66-4757-b845-08d96dfc112a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:26:03.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrCLfLRu8LyOJ85pgHCjsrPQX/b2kqSeYolbrv/N9jamihRqKxaQB/tu1rg7GLLCrZ/6cQn7kGikATy725xh2H0Eo7W0zmEcAh59tg8ejfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1245
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10094 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109020064
X-Proofpoint-GUID: 9gA12M5ONnrcyZALEln1q_uWLF5VQLMJ
X-Proofpoint-ORIG-GUID: 9gA12M5ONnrcyZALEln1q_uWLF5VQLMJ

Hello Konstantin Komarov,

This is a semi-automatic email about new static checker warnings.

The patch 78ab59fee07f: "fs/ntfs3: Rework file operations" from Aug
31, 2021, leads to the following Smatch complaint:

    fs/ntfs3/frecord.c:2887 ni_remove_name_undo()
    error: we previously assumed 'de2' could be null (see line 2876)

fs/ntfs3/frecord.c
  2871  bool ni_remove_name_undo(struct ntfs_inode *dir_ni, struct ntfs_inode *ni,
  2872                           struct NTFS_DE *de, struct NTFS_DE *de2, int undo_step)
  2873  {
  2874          struct ntfs_sb_info *sbi = ni->mi.sbi;
  2875          struct ATTRIB *attr;
  2876          u16 de_key_size = de2 ? le16_to_cpu(de2->key_size) : 0;
                                  ^^^
This assumes "de2" can be NULL.

  2877  
  2878          switch (undo_step) {
  2879          case 4:
  2880                  if (ni_insert_resident(ni, de_key_size, ATTR_NAME, NULL, 0,
  2881                                         &attr, NULL, NULL)) {
  2882                          return false;
  2883                  }
  2884                  memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), de2 + 1, de_key_size);
  2885  
  2886                  mi_get_ref(&ni->mi, &de2->ref);
                                            ^^^^^^^^^
Unchecked dereference.

  2887                  de2->size = cpu_to_le16(ALIGN(de_key_size, 8) +
  2888                                          sizeof(struct NTFS_DE));
  2889                  de2->flags = 0;
  2890                  de2->res = 0;
  2891  
  2892                  if (indx_insert_entry(&dir_ni->dir, dir_ni, de2, sbi, NULL,
  2893                                        1)) {
  2894                          return false;
  2895                  }
  2896                  fallthrough;
  2897  
  2898          case 2:
  2899                  de_key_size = le16_to_cpu(de->key_size);

No need for this assignment.

  2900  
  2901                  if (ni_insert_resident(ni, de_key_size, ATTR_NAME, NULL, 0,
  2902                                         &attr, NULL, NULL)) {
  2903                          return false;
  2904                  }
  2905  
  2906                  memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), de + 1, de_key_size);
  2907                  mi_get_ref(&ni->mi, &de->ref);
  2908  
  2909                  if (indx_insert_entry(&dir_ni->dir, dir_ni, de, sbi, NULL, 1)) {
  2910                          return false;
  2911                  }
  2912          }

regards,
dan carpenter
