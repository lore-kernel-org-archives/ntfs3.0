Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F703FC0
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:41:49 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O8iCHR015031;
	Tue, 24 Aug 2021 11:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=0o3L7SNx+miC9j6923CMubd/COJyoBkSb8TWuET6UHU=;
 b=umdzqE1piXPBMQdy1xICunO8bXqjeON/RqvGNS/LXhTLpq/ZXY/cN2IJQSWNsf20EcY+
 YVsSYYR8icy2u/xRyrYStSveM2jwYDigAKub1H88dwZxxoucdK+DSeXXHONZF/wlpm5C
 BHsmtlce/wb2EYU7tZueg9RUTDKwBVfqXu7coHf2yF/TCCEwEkmySYB8y1nht55VaIDB
 SjeWN5gFRehKJIYZKX0I++cM/lB15T7V5bIwAi4jIuZ2yEeXukUPHaFUFW/tjtIFCqd7
 McPcpwu2kgE5126G5Kky7etfwf0vmhvX7LUKXyKGkfUEkdOJMkV8KPjcmnC5avHWd5BE 7A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=0o3L7SNx+miC9j6923CMubd/COJyoBkSb8TWuET6UHU=;
 b=eXuMDeGeVdDLF1Tnh3n4m9/UWGTHi4lT9wYL33kzFwqxdo7OpxUNxdmXYmZoKu4bgXxm
 gQjGii2+tOltYlVOcXVQI3bnIw9ZYgW4KesVHSscavlFjVZOKrOmzxrZFA+odpYXlkuz
 RYSahdSPEKZ0pqvX1VAQbkqPplJ2Sc57LDjNtgTwfqR6/dFJuFKU5ssn/jpYmXBUjsu+
 usBKyY4MEeFkv0ShFzb5n9Bbk0ids9HA/AGIC+Xs1zGFdGZdEzAZPTVqQ+qEGt44P6fE
 goY34CnZcM42HhgEMA7qCD3X/Rtj3lkk5KgR7pnRlYqC6f44zo5IBSkXYQQTbC1bvnAM Og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amwh6gc2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:41:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17OBfFi2091157;
	Tue, 24 Aug 2021 11:41:47 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
	by aserp3020.oracle.com with ESMTP id 3ajsa54mvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:41:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbbT0ojMZIH0QrvAXgcNjacPcWPTK1Uy4bSSVqfpeqfYZmCDVdged7Hj1TuASrDZw3HoSJ448Q9VevoJ33yUL21pSFqmiZvlRDmBx/LiK9ohMn54l9yXgFwp3hozyf0Cr9KQOxroRgPhgO5nTaRQKocvcHeOA/aUeLnM48LrEk4+94Wy2Dm53rvo3z0uDJt4S9SGB7wQCWEKqR0bHCulnk5PhKlNTH5w68kHqnpJb2/SDly/gkqy5R+Q5TEQEM9UfKZLznzIGaGuIIr5ClF/j+SO4nuFyf0a/kR6+xIyJhQ6vjg1emEejRsMvwzVpslSR6NcbG/uhTtep8fTv58nzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0o3L7SNx+miC9j6923CMubd/COJyoBkSb8TWuET6UHU=;
 b=D/gLOij0hpilnwA2COf8IcrJCKlu4RXnqOJVx1rIbjzATKXeYrY7Zs7L5ieapDvOTq8/Jf2YsEID1qvoJOjA7bZFHOU7IA7z8bIA7fRvwkSJHSu72f6Gt19ajuSFhYDOYmY7exkA/nkz/1OP6pQeHNONZfAqqa23V89AuIZvVkPphdGmzsMj+LaY+Exa+r1WsXi2n/DIhxs+qA68DVZg0WFmUkTvU15ZYMXVNEF195oXaSKK3Eh37kHv1rtrLn+1Ms5Ve8FWZLEK/SUS3YtiJ52IDNbAvO1KeCPXs5o8iltVrDChb+gYHYryiKMJIhZeeM+dCLSiikN5Oo1f6vO4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0o3L7SNx+miC9j6923CMubd/COJyoBkSb8TWuET6UHU=;
 b=mKGgSNBXR94JXovP16dwufEohTXraLVrfx6fY1npOUohhyz0gGug9Od9XWmdWOevYUXbPsAp1dixSZJSXOO3fhhCjsW7vjkTOPc8nUx+cLjCfd6tRSN8bA/YQzn139uApZjq83Cs/aPfjwmY1Es+oE55uKd3tp9xnsEH1qGlMsg=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1822.namprd10.prod.outlook.com
 (2603:10b6:300:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Tue, 24 Aug
 2021 11:41:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:41:46 +0000
Date: Tue, 24 Aug 2021 14:41:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: inconsistent NULL checking in
 ntfs_read_run_nb()
Message-ID: <20210824114136.GF31143@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:41:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f8411a6-fc8a-4adc-489d-08d966f426be
X-MS-TrafficTypeDiagnostic: MWHPR10MB1822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1822C6A72675DC735325E8ED8EC59@MWHPR10MB1822.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B0pgxqdlFori8GipdcDCpHKBzBduKgzYPMQ5PumyOIDG0oaEnTfVtNV3l7e7gLw5LWtbuRJck419Vuv9c8EjSfZ4XHTNuZj593FUEehOGXf3IpEpUIQg9Ckgu2NG4Mmo6J4p63SGp8X8gHx+X0CS1N8ySv6ndy/YHwBQRxLXFi0Eynk2Fa8RCTgt7FBNA/Y7IM9EROR0XDO/pK0F3ZF6jO0L/zkK+UuW+Y/8rWSElhUcKpMEGLJACJo16PwwTJANi2VJtwEfnWAvq3DDPaqxFjiYReFApS3c6FVunIi01yQtvGvtHB+T2/lYZ70PTex8eWCC5wOqCsetX4xZR8FyW7wzuqaCU3BYfG0FMJ0MubLDbjcft+nIyiu3eKp7EwRbOjYJOu1AbBBrMDYEtrWJ71ecP28HsLBUstwqw6SySl5pP9xcPbAhhAIQj0m5JifxZUaJbeL0SuU4tgwr/nMm3nsNzbn37c+djYGb+45LWJ/5htgdO0VKTvBGUcBGtnVBjxMqN2Dlr8NJmlNzApo/1sY6kTeEYcK6ARDWwX/JB8kpDXRyvu+FSCNfhryE7VJVjdmdY2Dd8xVOUwJ1oO0nBhGb++0jS+CFDEGh7uUHujgRTRegI/kLlyb4AqCEwd2CpgEBOlxGWWUloFti7SlJdnXPiGr+XGwG04ncDpcwA6BO/r22WQ1hMwx638u40bT06UbQCJNvCAyrlonzwsgXpQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(376002)(396003)(346002)(84040400005)(6666004)(8936002)(66946007)(55016002)(83380400001)(66476007)(4326008)(478600001)(2906002)(1076003)(186003)(66556008)(9576002)(6496006)(38100700002)(5660300002)(38350700002)(316002)(33656002)(956004)(44832011)(33716001)(86362001)(6916009)(9686003)(52116002)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K8bwCvW4om1x1kcu5xYXoo1kpTS/ATbyFYHoCjWqA6eAZi3J7H6GlaLJB7Xs?=
 =?us-ascii?Q?uzkTMKFco7TIxbyCqreCm9gflnhNLBKsZDS4ZNGpVlX+i33jVqBqa2l3L+ge?=
 =?us-ascii?Q?hOHDTI8YP1HiLZhVHD38Z7DXmGCWaNu5fy8p+12DY2dUpz1rJqlnTANRb9Ih?=
 =?us-ascii?Q?c1SJrTsULTCrCaFM3jxru/zXT8zAr2hiAzF5xAwRItVsmWT/9Wq+EruWa6x8?=
 =?us-ascii?Q?S6TpTpu0njVCN35t38Z1OeStcWRGe8Ec44PXmffZR6OT04HycS8lZzu9A/OX?=
 =?us-ascii?Q?HfzKR7dtToor2Wj3hYsEl3saruoOV5jv3fcwJzbj8eVOA6ip+qhTWaVKSOe3?=
 =?us-ascii?Q?FXwWEx0wB7Do5EO+TFsUcsJTs5wauabopk82T75ZRNuUOtSvHwdm9wSoQTy7?=
 =?us-ascii?Q?pGFNNQ4UYUuIXMxYzq3VJNbXEbxru96BTU7iCXteVnZM/XPbYbihQLGg5nRW?=
 =?us-ascii?Q?1/a0R8MaWyZUs5NiwGjgCgoQEJl8z/DyIGd+liBycHuY38wbHl4Sc2MwZja2?=
 =?us-ascii?Q?dvVr4YIOzPP5DrtrDI6MUWaDgD393z7KYKguicNbfkQ2mTTtF7iuZFaffYrc?=
 =?us-ascii?Q?EDmf1G1Gjrdz7zNKeX2HE6IHJYOBw4uyTh6Opp7/LDnO3YpCe/7mrN2e2upi?=
 =?us-ascii?Q?YwFUEy1081XaAVChUmS0Cu3zOYF3kGGc+rz9SK7Y5WXfBKIQBef20PMSeEdZ?=
 =?us-ascii?Q?qzJkFnJmlViDfvDFjt2Pr7onnj4GVbOWbU5SCPjzRPafzUHfenVbw5b/hPmf?=
 =?us-ascii?Q?/VkZDm3wAw3jRPQhMHRn0hkqeYwTFQkRueJrFOn3tjOpOlbXPxKCLJ7GpCZM?=
 =?us-ascii?Q?zwm7bo4FjXkmziMsmcFvWFalRN5nIRpJB7XKHnGkmLMFaEToikTa7LAH5v71?=
 =?us-ascii?Q?/GxpD94sgTlIhECtwIGBsPTXKUNARuW1D5XGTXek1UDdLawdqvS8Ygl0sfFq?=
 =?us-ascii?Q?U6PAocMq+hl3klSRnCxmYNUKCtAUQCf5yg5kc95Fhdx+p0/Vl9opudWEyTPU?=
 =?us-ascii?Q?hfe9jXgnsiPO89GH5gaVsbKmBZi/SoE3n33krIN8uUfVbTkXzGoLMNiP4XvN?=
 =?us-ascii?Q?0AQj02AxJyyOElzl32suaf24VC9KVPpG0jhIOTjaXkNvMYJCnzSEXBhoCPU7?=
 =?us-ascii?Q?nq5pUT5889xtHEtTiU8eYCvL6FxTC1xl+yzAJeb17QGVDVoKBk67Ou0jPE3L?=
 =?us-ascii?Q?gh64M0LPhISI827pxJbCKz5BAsn/WpVk1Md4wnYPZ65I/btsmIQvQ73Px07N?=
 =?us-ascii?Q?bfjOTtVJTqdSVV35Wtjbfralei/S4MYHEv/ylEYP8v1O5Vo450UD6g7Om8Ix?=
 =?us-ascii?Q?XXR+Iet82HBXlK/W6aLbjkm0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8411a6-fc8a-4adc-489d-08d966f426be
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:41:46.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0G8bIM9tCg3WQYjv3Dt2Nzae2HYyXZvlTph1BTu5+YcJ7Uh/rIYWfshYd0/H47pwR6EIEdsmA5mMaV/BXKz5ashS+5SisxufMbLBBMJE4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1822
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=845 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240078
X-Proofpoint-ORIG-GUID: a5wt7uYSyUvKMXnBJyMjUNg4UHwmqtaV
X-Proofpoint-GUID: a5wt7uYSyUvKMXnBJyMjUNg4UHwmqtaV

Hello Konstantin Komarov,

This is a semi-automatic email about new static checker warnings.

The patch 82cae269cfa9: "fs/ntfs3: Add initialization of super block" 
from Aug 13, 2021, leads to the following Smatch complaint:

    fs/ntfs3/fsntfs.c:1265 ntfs_read_run_nb()
    error: we previously assumed 'run' could be null (see line 1195)

fs/ntfs3/fsntfs.c
  1194	
  1195		if (!run) {
                    ^^^^
"run" is NULL here.

  1196			/* first reading of $Volume + $MFTMirr + LogFile goes here*/
  1197			if (vbo > MFT_REC_VOL * sbi->record_size) {
  1198				err = -ENOENT;
  1199				goto out;
  1200			}
  1201	
  1202			/* use absolute boot's 'MFTCluster' to read record */
  1203			lbo = vbo + sbi->mft.lbo;
  1204			len = sbi->record_size;
  1205		} else if (!run_lookup_entry(run, vcn, &lcn, &clen, &idx)) {
  1206			err = -ENOENT;
  1207			goto out;
  1208		} else {
  1209			if (lcn == SPARSE_LCN) {
  1210				err = -EINVAL;
  1211				goto out;
  1212			}
  1213	
  1214			lbo = ((u64)lcn << cluster_bits) + off;
  1215			len = ((u64)clen << cluster_bits) - off;
  1216		}
  1217	
  1218		off = lbo & (blocksize - 1);
  1219		if (nb) {
  1220			nb->off = off;
  1221			nb->bytes = bytes;
  1222		}
  1223	
  1224		for (;;) {
  1225			u32 len32 = len >= bytes ? bytes : len;
  1226			sector_t block = lbo >> sb->s_blocksize_bits;
  1227	
  1228			do {
  1229				u32 op = blocksize - off;
  1230	
  1231				if (op > len32)
  1232					op = len32;
  1233	
  1234				bh = ntfs_bread(sb, block);
  1235				if (!bh) {
  1236					err = -EIO;
  1237					goto out;
  1238				}
  1239	
  1240				if (buf) {
  1241					memcpy(buf, bh->b_data + off, op);
  1242					buf = Add2Ptr(buf, op);
  1243				}
  1244	
  1245				if (!nb) {
  1246					put_bh(bh);
  1247				} else if (nbh >= ARRAY_SIZE(nb->bh)) {
  1248					err = -EINVAL;
  1249					goto out;
  1250				} else {
  1251					nb->bh[nbh++] = bh;
  1252					nb->nbufs = nbh;
  1253				}
  1254	
  1255				bytes -= op;
  1256				if (!bytes)
  1257					return 0;
  1258				len32 -= op;
  1259				block += 1;
  1260				off = 0;
  1261	
  1262			} while (len32);
  1263	
  1264			vcn_next = vcn + clen;
  1265			if (!run_get_entry(run, ++idx, &vcn, &lcn, &clen) ||
                                           ^^^
Uchecked dereference.

  1266			    vcn != vcn_next) {
  1267				err = -ENOENT;

regards,
dan carpenter
