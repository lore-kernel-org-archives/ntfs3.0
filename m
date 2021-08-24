Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4738129CA
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:40:34 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17OAKkRU030422;
	Tue, 24 Aug 2021 11:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=xMMph4KYl3IVfhWMAl9EthDTt6ZvN7yMKrKlEZwMMi8=;
 b=lo9OuTWS7FaKmKJD9V3oH9cveRPyXx0xuH9N7/WxYqC2KMdTuEu3/NWMz2CTgxRXB9Dj
 QQqZxfcAWZJDsAZB79c80mX8tKo974Uxc7h1sQ/Gib3psbea6YzFDpGe65G5L0jfEztd
 6d2VXcBm2LzPrkZAqQffdnAtGU7GLB2S4OOfSxcJFJHj0WLOWQQp1zebqL1312N/Ecbb
 4BQq6TXRAexS/gfhjuzMQ2P0pn8BUhYoMOYo6Ub0dIDng7ny4weHsEu7lbnJndz4n3I2
 +Zgaw9T0tWTzxT6zwvURMzO52We3MgU4l0DVfb3nFLTWTLn5+5xX1P0r5Ps6g73vA+wN AQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=xMMph4KYl3IVfhWMAl9EthDTt6ZvN7yMKrKlEZwMMi8=;
 b=hPS4dIkQCMj4ti4wdiBuNE0iX86e1KGmIGNCwWo1oGi+PTq8VFnZZqiEzojIlxmMGaPi
 70DKfVnZ0TgKecFNpeM9gBGmpt5EUdVS+YKS41/DGKT65SOSmlYW7yj2Ei/86Y2cnlDV
 gEswxuKwiNIu7AvhA5KVepoGCpGQr/wMUY+uouNveYh3fK/5POSVBefLYGuihZh0bEEx
 Ejn6ZJU7U3rOoZhxjBTyPoSE0gAPoUvRkEBnVlyncCFp38KIu1B164WIB9qQtOVm/O0S
 G6F9y4qbnLNgIplibVJDKKhO27/TyfX9pGAbMWXncZ2aNHlJL/rjyJBkB7Y7rGpFzc+c bA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amv678kwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:40:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17OBVDdP058889;
	Tue, 24 Aug 2021 11:40:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
	by aserp3020.oracle.com with ESMTP id 3ajsa54k96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:40:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfxTNijfp4kbJ9FNQK/ktp4lmUh3v9L/5dQ3D7g0lHUv3avb3C/yGy13naa4W0HR9UxhmdRWppl+Zq996wS8hwkg7ClUvl1XuUdPCeh9Fzdy9k9Y1OVE9PY4KAuTm9RGQgO63zNw5YVdPdZ7nyUSr2owVp0I1w+9FfeZ3PavKkbftEnxheyKXFu2wuDopgZ+FuRcD5RQ8dqf2LxiCxes0UsQWtx5gCEMAXvE4puaqdAgeEdN3vusKjkbD1wmzKt5/c1m4IgNyGXRoglFffNzzn3Nabzj9HOjiIGpgTK1YWuPDwDn/LkHy9ABmQXQE5c430vsRQtldrwYfoMqJIdT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMMph4KYl3IVfhWMAl9EthDTt6ZvN7yMKrKlEZwMMi8=;
 b=FJDzGs5ZsRXOD50qk+UCkXt5UtEl9lyiDuW8j++t1h8sWoefzfZYI7Z4MQQaCn7o/GFLa8yZxpnVOtE5g2t6KWQ+v+JohqIRyci8He3F6UnRtXlo4JPutKA5aWDvRpB3j5h4YDhjLvYhSgIoEhTD5vYOAJpgUwqhq7sgAK1SFuiMpCQ7ZYv1HH9A8765SV777KaGlOSNnAGN73oMAZwkYBpGUE82Y9cu2cKgZD3f0xgcwr8diX6PfZ/SdopE8U2KKg4SxkQGGnN4oCyZ3Wf6iSlpBEkrJ4ozog7/WzhOPZKo9PJYQK96+xCm2aKuumsyWTwOPP1kS7xcVX/7Zqs50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMMph4KYl3IVfhWMAl9EthDTt6ZvN7yMKrKlEZwMMi8=;
 b=cO7s2RgzUH5hOlXiaYiGncZE74fhz3oGatKhdCJyDDfSUAPiGmkXJBbw4oPXI1HJDBvDduLktpOtXv6nRDeQKJhGdIPOSK5YucLL6c5+S1O2Vjl9hQYPhERujRIBg/3YEQXeX4WFb5knSmvw9z5Y+A2//mpuv4iRQpHhg58MXF8=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1822.namprd10.prod.outlook.com
 (2603:10b6:300:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Tue, 24 Aug
 2021 11:40:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:40:30 +0000
Date: Tue, 24 Aug 2021 14:40:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: inconsistent NULL checking in attr_set_size()
Message-ID: <20210824114020.GD31143@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0038.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0038.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:40:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc1cfbd1-e081-4c34-fbc6-08d966f3f98f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB182271C8C8CB41CA5D213AE18EC59@MWHPR10MB1822.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vlDNODGZmdmqBiAj0zfIVyiYh9BCYjW+36hpiL97TfTy9Dl3VgqAPUb6lDtOpXzj9rPEVBPfpQZTipXTSd0nwod2gluyD+z3H8t1E9vk+0amr8Q9SEKIMN4N95fQxkM+zZtzZukR3jwS+0ZDbC/g8dqYTl234Gnq3KR5L1JOT2G/413qeIi4R6XjLltJW2+lMqdddEnzLd2X2ZooK0f2Wz3lFyLc9nUwCVpSVO6qt1z+EMcV/GAat+Ihva4c2FTOoyYbQ2quaZrAXp3FcIoGtkN8hNq/0q3g4bifDi/rAuT3yx+EOAlzQ6sD7lQwlFBidEXmf6bjOQcV6HGlfpm/Wr9ty2Vs+3HvnqMUghbKaWhS9DTWcls9WVR+JgFAje8IURVd2j/w71Y+Gv5QTrk07dsYHiMLBOVBiGu5qHB0Q8qqyAgJ7nC/9IOsDbMuQPCl+uSH3k6DPPNxr+o0bnqPUuiUFhXoRHedccjsR3sKa4OgKEeGccyT/bpmHlgrBvdO/WSOVAZSID2it9hpVe9h2mEUUCc4/46OVd/90QjfzxvbbCufyf7yBC7KhPn1/fe+fknmryfDq6p0SMNfaFtqGDhRPAf2wAEl2fhoc6uixDzAeGnt7hqhmTNnX2i63pWlBoMNtqS5jZRMtwHUhZpPuw01wX2w33DRWWr5j3pHxkSN46kTUy3qIQRmk9wYXbMZ7uifcwx6LS8VxiErhXh4ig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(376002)(396003)(346002)(84040400005)(6666004)(8936002)(66946007)(55016002)(83380400001)(66476007)(4326008)(478600001)(2906002)(1076003)(186003)(66556008)(9576002)(6496006)(38100700002)(5660300002)(38350700002)(316002)(33656002)(956004)(44832011)(33716001)(86362001)(6916009)(9686003)(52116002)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4QvH/ng1jx8qx8Br1wBaRf087dKZt75jo8ScBOSnvIbG6TgFcrvUs91l41dF?=
 =?us-ascii?Q?/EqA8tjjkfmFKF6+T/ppVotjF3uBAzomckMUvKziCAIK5Hgou/hIjb8HSttU?=
 =?us-ascii?Q?CZVVJC0g9cOcsfwBaYUqe2gLnaj0w6NIg/hb/daDRt7cq/NiG7hEiNcyzC3Y?=
 =?us-ascii?Q?rLiNzAa6KkHPJGfE5wa+i2uCfheaUIu0wKHtTHhT4QgImXzM4SbmbxrV+RW7?=
 =?us-ascii?Q?a44e/DD18n8KvKXlm8+8WdwxObWKHBlDq0/P8B/T5IUNpvsRzZaMh+GToD6z?=
 =?us-ascii?Q?zDn9cfLLhcEkx3+G5KATIVz59ICDEROhPf37tcCuL+HNuoN+3Ore8v1wdW9m?=
 =?us-ascii?Q?a6PRW0B0ReX/Nsz9Xs6PKBXR2B4dxRZuLHq9yQiD8Is/BasFuWzdOyWuI0vY?=
 =?us-ascii?Q?4uHwWGfF+ZW46nCfc6ltACQoK6gOZwKkmqzSsnMMSxqQYNETnTcqSJJrMCic?=
 =?us-ascii?Q?Cg6lcKGhWLeXoEsAiG5w5sE7n7FNMSPBCoQw5TceR9pcbDyQSczFUEJBGSX3?=
 =?us-ascii?Q?5U1A8AbzGNYOIkTJKxmamcThZTASFpCckZJeyE0Wad0z2NrZBgCfA1Zq1Kc+?=
 =?us-ascii?Q?rBk4dEnGQvT5hXpb48Q5e8puIX0BN95hLGB+bTOtlCCSaZp9MGOfiA4akugR?=
 =?us-ascii?Q?4lwfsSpvyZ/vu9iGKX41OMNu/kYGxWnu8gbI2AbYvDKLgQAbZRvjFvQrl1uI?=
 =?us-ascii?Q?naFrjRAL0pNOulsYXe6wL23aEWVmdS9/JA7grZfRlGmDvEG7NsKjTcvc56JT?=
 =?us-ascii?Q?+E6EQWt33Jo8GoCUUr08ROCbwTuRjadUkiSmaH1YgBi20tFKp7Dt+7HCeg+A?=
 =?us-ascii?Q?qDL5DopytxMXYUOG0y35IUJLEnvPsjvrpxunSDb4P3//YVD4dMNdjKMo6wcD?=
 =?us-ascii?Q?G8qunMH2xapsXqTNJjllYCBx1jz113mzqH6NPHj6IH5RaBFrzh0ExBqXA6fy?=
 =?us-ascii?Q?bbV+YzAipaGPhUACW1FxbVI5d3l2jNwUXwgkjJ723GdV9+Stwm5S4hxy5fYN?=
 =?us-ascii?Q?eXL0ApD0QMnlKmf2dUbXPQTzlsdimd60LW5w+Qle4ovp6eYccMukT43Yz6qm?=
 =?us-ascii?Q?Y5Spo8nouFYns9YTxmEh3Px3Aentf8lDLbiOIqGnvYgjWhEqOH5afOaEb+pf?=
 =?us-ascii?Q?DWfQk+M+2VyMdjdvLMDXl9PIWDKZxl0ocPL2UWVVyN6pKZqkdMMuxzAsQksQ?=
 =?us-ascii?Q?un5rOynamulwKPB3+Qa+iPs+/DaatAFGo78xLPj6rYqM70W7cdHcUS8zbv9J?=
 =?us-ascii?Q?rf9i0hLfsfaH8erS3BKKHyLZ0eaZt/tZN1uQsgyiR9H4JhufBm2Kv8pI2n+8?=
 =?us-ascii?Q?uvchsYbQk0EMwaPtuKueDyMQ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1cfbd1-e081-4c34-fbc6-08d966f3f98f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:40:30.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qp04qQmcA3T1quUaSWSTSJMKiijqH/8QJqns1uZfXu4CQSmPDNLhs7oOwGnWeFu1mhVBnWET7wQEL0fYjClTKXWgb+oIhvNofMaRG21oNVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1822
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=883 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108240077
X-Proofpoint-ORIG-GUID: -afXhYEMKQrZ4YJl-Kn2ApLek3Dq_NGZ
X-Proofpoint-GUID: -afXhYEMKQrZ4YJl-Kn2ApLek3Dq_NGZ

Hello Konstantin Komarov,

This is a semi-automatic email about new static checker warnings.

The patch be71b5cba2e6: "fs/ntfs3: Add attrib operations" from Aug
13, 2021, leads to the following Smatch complaint:

    fs/ntfs3/attrib.c:764 attr_set_size()
    error: we previously assumed 'le' could be null (see line 703)

fs/ntfs3/attrib.c
   702					goto out;
   703			} else if (le && le->vcn) {
                                   ^^
This code assumes "le" can be NULL.

   704				u16 le_sz = le16_to_cpu(le->size);
   705	
   706				/*
   707				 * NOTE: list entries for one attribute are always
   708				 * the same size. We deal with last entry (vcn==0)
   709				 * and it is not first in entries array
   710				 * (list entry for std attribute always first)
   711				 * So it is safe to step back
   712				 */
   713				mi_remove_attr(mi, attr);
   714	
   715				if (!al_remove_le(ni, le)) {
   716					err = -EINVAL;
   717					goto out;
   718				}
   719	
   720				le = (struct ATTR_LIST_ENTRY *)((u8 *)le - le_sz);
   721			} else {
   722				attr->nres.evcn = cpu_to_le64((u64)vcn - 1);
   723				mi->dirty = true;
   724			}
   725	
   726			attr_b->nres.alloc_size = cpu_to_le64(new_alloc_tmp);
   727	
   728			if (vcn == new_alen) {
   729				attr_b->nres.data_size = cpu_to_le64(new_size);
   730				if (new_size < old_valid)
   731					attr_b->nres.valid_size =
   732						attr_b->nres.data_size;
   733			} else {
   734				if (new_alloc_tmp <=
   735				    le64_to_cpu(attr_b->nres.data_size))
   736					attr_b->nres.data_size =
   737						attr_b->nres.alloc_size;
   738				if (new_alloc_tmp <
   739				    le64_to_cpu(attr_b->nres.valid_size))
   740					attr_b->nres.valid_size =
   741						attr_b->nres.alloc_size;
   742			}
   743	
   744			if (is_ext)
   745				le64_sub_cpu(&attr_b->nres.total_size,
   746					     ((u64)alen << cluster_bits));
   747	
   748			mi_b->dirty = true;
   749	
   750			if (new_alloc_tmp <= new_alloc)
   751				goto ok;
   752	
   753			old_size = new_alloc_tmp;
   754			vcn = svcn - 1;
   755	
   756			if (le == le_b) {
   757				attr = attr_b;
   758				mi = mi_b;
   759				evcn = svcn - 1;
   760				svcn = 0;
   761				goto next_le;
   762			}
   763	
   764			if (le->type != type || le->name_len != name_len ||
                            ^^^^^^^^
Unchecked dereference.

   765			    memcmp(le_name(le), name, name_len * sizeof(short))) {
   766				err = -EINVAL;

regards,
dan carpenter
