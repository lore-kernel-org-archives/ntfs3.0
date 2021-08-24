Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A83FC1
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 07:58:33 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O7LqHl030409;
	Tue, 24 Aug 2021 07:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=zF3Xi1BNL0IAeAvlhOHJ2R8YHMpTbm+3H8gzvlc8vh8=;
 b=oF3bDZYnrnDpIOye/SvcU/wSVyeUUv8Z4wCTQ/WfYxdngD3fXc7Oczdtc5hN6abu7KqI
 /u1uJhVsBM05kii/RBEauO1ShIaJmWMUCX7a2QfkXf9HH1ydEv9mJzFtFILBYrZtnJcI
 aZ/9RT/3L+f71NUU/SYu3U4ZW07YIiZD/zSjmgrOE57rKI/ubrIhYvkNYPoFcArvBwTX
 xensFSgi1Z/ybNYnUK9M/B4m+b6OWoxNPNoCJKjKkTc3vpNjBPAGfreM8VTpBU4ckHk0
 emdrncfFvzDQDwD3VhlIOecGlm8o3skLG+Ln5MkoF00zBjmIdJ4KQ9OUQXsRXE/OWLwz Kg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=zF3Xi1BNL0IAeAvlhOHJ2R8YHMpTbm+3H8gzvlc8vh8=;
 b=Iy2djzt67HQuHomJLBbhVomi0WCZvtszyJU52C5XG2aw70QHuHrD2/oweZiv1GnELScy
 I0zcOp5RqKiLuN/Q1I7X2PzUSdk/8tcp4/8l+zSIGW0XIvEI4yAL+pW0L2fBlnBmuMcF
 HoSjru0CR6WdA8hy3eVDv6EOQycgXN8SNGC23Mp2JkjTn2jL4YdrAj7hHoVCZXJ+M7l1
 3ErxLCGklJ4DhqvpiaRJOSRQUou3JAAkodRITuzjXOpsrgz1ICcxoP1A07HHUNGsgqSA
 Bn/lJ3BfgK3T4Wnq+fjTKDKqTgXffURikxw6CQU+PLQjJrnuZXOUdeTHjfAo/8uwQvDT lg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amv6782xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 07:58:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17O7tEFO169734;
	Tue, 24 Aug 2021 07:58:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by aserp3020.oracle.com with ESMTP id 3ajsa4u2v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 07:58:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYJ2LbCXp4izq6/VKfZ7ZUGjK2l0AYct8Wf+WHVpR/nS0rIigbuBmyuHm19S/jOAFoJwWKmQd54Za5DaHb/+0fpud4nW9+AnyOFHqugaMExwQ2jBBgg0xOXkby5qSKBr6bUVmMCu6cPzPI2HSNoPZmPnog+0vnFggOr7p96kJFRSzngzYAJdiSZmiFUMVgTgXn2dGU5QIoSRP2y5vf/h8UIAwgbbECCaC5/wOA1pL/lhDAd4OZf+z7pymxhtfl52QhmQCkhmNji0x7YlR8oCQ3KB5JdCzYWViODlfMhzZ+76YSKVYNpP675Ct0FXwzHNDf0Oq8LL+HlPRJd6Jon8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF3Xi1BNL0IAeAvlhOHJ2R8YHMpTbm+3H8gzvlc8vh8=;
 b=GuAUDsYIwvpuHKJtV+vH3vs5Xh8J6p1WWf4ChkDg7WFQ1lw4RwxJP/PgOSNOTdDOoWax7b95Cs6f65S62gpGzI3jbGsF00z0m/hscsRJa2CPZL2AmI69W/ckCvSg5vbQiKYjgLe6IpW8abz+djBinV1C0WtsnTHp/NjP36ZRjXWgcgvztIgT6Uf8cRC3lNdiVnFT7Lu04lUcYmkqperFZ8SswcWS7pCmLOhrAyasfvWHIhwCZ41LVJXdCVhUKs9N/wGdQP/AN7WsRHjXGbANLoNiPauHFXphXahbbssFHhIMKOW3v8MI5K7uHbmHX6GQpDxK0jEhLhWZf+1bdvIMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF3Xi1BNL0IAeAvlhOHJ2R8YHMpTbm+3H8gzvlc8vh8=;
 b=AZU9ko3rX7u/mp6WPubZ5ieCEgu0lKo53M80r9f/cSGz5qsnuNFyREyTfQQfzq7jXwLpi7zGhajfY3TyK0SyKcGg2INnEYrx+YXw1SggngISqLx++XDUpf/w//rNbsahDWSIlhe3L2c1KfliUggM5xfyMxEZCYFY6lKusOz4auU=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1661.namprd10.prod.outlook.com
 (2603:10b6:301:8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 07:58:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 07:58:30 +0000
Date: Tue, 24 Aug 2021 10:58:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Add initialization of super block
Message-ID: <20210824075819.GA13628@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 07:58:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f794cc-2eda-40e0-52c8-08d966d4f665
X-MS-TrafficTypeDiagnostic: MWHPR10MB1661:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB166183C46D1903FC6AE02B3C8EC59@MWHPR10MB1661.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BH7Y+/PG6XmTZmV0P1+02KnNqVsFYvivWYCyV0pobPjTek0WFd9IwytG3NcR0c16xYO4RCu2yN7rsMr1bDcojJNl0MfFD2X3PoMuvZz5U733TNsb7DYJzpku+HeC80irToI6/g3686uq1S+Ie3uosKLTphsx0gNhyAHXILyQP1epAM/UfXgdk2CmzjW2RZYv/uPul7r8KZdIYkAxsLly1F5n9YX2k7LUOQHitcCtAlHFfYpHfzDiSCzi4Caf1zuZSAp2l3ObA56BihSkpI7MGhMnPhMySPkh/cdWJ1wLbyd8LuQBAPPoB2JKJZL7hDlpTUMwQUO99S6lpfVFU6/dhrWmzlRWWLIQeBk8Pj+gGyrPYk6cmhuyabvPDm8DI9p1vR+IBbMRE3Cd08x5HgUc45A8XrxlkrHY0nzxm8uErtGOUFgOuu6fxJ7V6wV8Q0bETnmbqrwqT0w2iD3gAUbN/W+2Kor6S4+RZG/2RC7r8JNQ5mfk8FH4UXIDrS92bKP5oBqp5LcG3E++smAy6Q5gh9g1AL3m2vysUzOSSZKsfvkGAftmv5QD/wUWObsX5lgY3FwJBwdmC+whN1T9KGZ/0/bj9N03qkxn51V1dkAeA4/N/vaRqiXVEvHYpvlLKIZ+SxTd0KacUOPcPTovfSZSSca37wTaQgLXI2WEprqC3A21oYYkw0y0JZsKvZdgc43Tx9nScOgoZjebhCmiksKHHw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(39860400002)(396003)(366004)(26005)(6666004)(4326008)(66476007)(66556008)(6916009)(33656002)(2906002)(66946007)(956004)(9686003)(55016002)(186003)(86362001)(1076003)(33716001)(38100700002)(38350700002)(8936002)(9576002)(478600001)(6496006)(83380400001)(316002)(8676002)(52116002)(5660300002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/boivM4sy/36qaBT+8WeOGuXjw5kLXzXEKQuym52S47GbklBiMhLER9HOfmP?=
 =?us-ascii?Q?YYapyNBvIA++jp+4YcVJapUEL7o9y7XQnMonqghx6YD3wk5ljxbPrOCiIzVV?=
 =?us-ascii?Q?PKZ0W26GUlLyDSVpaW2gtbV+79kJuJcnCUWwCyrn8kzXGaZ7pMpLInqztufL?=
 =?us-ascii?Q?+iaqSRaAkWqxvUR4BGZfWJSMBPv06QHzT8umt5gjZ4K2UqAhUmoVOozYFoq/?=
 =?us-ascii?Q?J7IqLjKF3mXS7b2tlOD25masNgjMEvXOI7T9NQjxLEv7mnh/KeevaIIY4npb?=
 =?us-ascii?Q?LplnYfloPQ5AiFMLjczoiYb/R0jMl5EMm6SQJcdmiBqn67upO8ET0Orx3KnR?=
 =?us-ascii?Q?23u61Ugwm+KLdh8GsaKIeLbxoyqGfDyE9JH6yo7dfGgC9pMazTEwUrNxgOwv?=
 =?us-ascii?Q?HsTF/66jjg9VB/LRLLIBuZ5sG2qodIWRzmNjC73nWqbwjSbQTKk4TlEIDWAx?=
 =?us-ascii?Q?f7fquuTmNRI3fQUNi3euU5kq7pqLI7KRk9GpF8PnZwnxHfr2UAw6B0rQxog6?=
 =?us-ascii?Q?AmdlR3btB0c+CECzgx2UQS0eA5VCzkwEZ6qjWEl56eiHELwY2hu/dFSfbKA9?=
 =?us-ascii?Q?AiK9IpckVZZ5olu9yFgRjxv+sK6mSJ5VrA/NXon2PEvvgpS3qcPgQOg2op20?=
 =?us-ascii?Q?ldudUIBxvQtYc2lJHfkvYapkYBYfYC+mcsCOLmEqZoZSs9qr2aIE4dZIEE5g?=
 =?us-ascii?Q?CjC3JlHjb3kSbRXwM2FLNMb674QLvTWXB55+ncjuMDjUUvgHZN1N1Xv5k3kO?=
 =?us-ascii?Q?ToSpxldBmIoLfzjLKnBG/EzgHNIXXmE9AwC1PFNLkfl50gKRL5iCd0bimSHJ?=
 =?us-ascii?Q?7VPUogMmjpdyMXTjJ2u/djCMcBYxkggnZGjCpqfX8Hoi2zrRHiedg/2jSc2R?=
 =?us-ascii?Q?ndWeXUdKuVuiOjf7U/0dprj9fPW+uklfV0HjR+ikRxP2w7+/fxGiWm/35WL5?=
 =?us-ascii?Q?xVRdELyP3VsRrqp4LWZrRj49yYhDV69KxtK1idMtobzuc8o4eK6oMIYLPn1T?=
 =?us-ascii?Q?fuqxWkNkCUD8Uyyz/Y/27mCnxVafZ/DJDo26gETfwsKl/NwckZkrJbIRjbQJ?=
 =?us-ascii?Q?NstKFtqoG02IDz7vf5M97Vu4lcTrkcBC/LBuoqHWzpHYgmlA8Nz5T5urygNL?=
 =?us-ascii?Q?OMRmp1MbSvzaYMaQF3Bq7WRKiN5m/jjmmE5BaJl+T2Vhr+wZsklFna8fK9GU?=
 =?us-ascii?Q?TZjB7bxcWZwavub8YUDA76y8lEO5tymdS2zjeCl1VuZsusOt7QeWlEezGPF9?=
 =?us-ascii?Q?T+thzAfRme3/3mB6OtJ/Wr0KXGJt9xVgVNxGBvN8jz7NyFJPmdM1ZyBoYV4G?=
 =?us-ascii?Q?GoywZzj3EzXmglVPUZ4HQZV/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f794cc-2eda-40e0-52c8-08d966d4f665
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 07:58:30.3980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0nGDJXhGGq6ibxaY1682dMdklgBP1Tun6+oNImwzo5hqOyWvR3Th5dBKaf0EkDX6oifgnriXInyr/rlSSY2D/HdNGDzTYfOhcD8wmR0fjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1661
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=914 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240054
X-Proofpoint-ORIG-GUID: _pOzIGKGfp5LVmN_HJgIPx6e-eHZBaW4
X-Proofpoint-GUID: _pOzIGKGfp5LVmN_HJgIPx6e-eHZBaW4

Hello Konstantin Komarov,

The patch 82cae269cfa9: "fs/ntfs3: Add initialization of super block"
from Aug 13, 2021, leads to the following
Smatch static checker warning:

	fs/ntfs3/index.c:238 bmp_buf_get()
	warn: 'bh' could be an error pointer

fs/ntfs3/index.c
    229 	data_size = le64_to_cpu(b->nres.data_size);
    230 	if (WARN_ON(off >= data_size)) {
    231 		/* looks like filesystem error */
    232 		return -EINVAL;
    233 	}
    234 
    235 	valid_size = le64_to_cpu(b->nres.valid_size);
    236 
    237 	bh = ntfs_bread_run(sbi, &indx->bitmap_run, off);
--> 238 	if (!bh)
    239 		return -EIO;
    240 
    241 	if (IS_ERR(bh))

This is not a bug, but it is wrong style.  When a function returns both
error pointers and NULL then the NULL return is means the feature is
disabled.  It's not an error.  Just that the feature is turned off
deliberately in the Kconfig or whatever.  Don't print an error message,
just continue with the feature disabled as the admin has requested.

But here NULL is just an error.  The ntfs_bread_run() should do:

	bh = ntfs_bread();
	if (!bh)
		return ERR_PTR(-EIO);
	return bh;

    242 		return PTR_ERR(bh);
    243 
    244 	bbuf->bh = bh;
    245 

regards,
dan carpenter
