Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9F372
	for <ntfs3@lists.linux.dev>; Sat, 15 Oct 2022 08:29:15 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29F7vq0w000491;
	Sat, 15 Oct 2022 08:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=fFHS39a4Qi+ljqVn1N2ZT5WIK8kSfLM97eBEicHJYv8=;
 b=OaK1EnWeHuGKsJknX5/V24LO/XDFhg1j9+OKl/3MB9eJuJUJjxPBRSlN87/D2LPEEJtN
 CS/G8MS5gYBQJBQO9HrTReE3tYp/mru8H20k8fdSBV8dEO+ReARb7i3lHVmEHYtMsADQ
 pFbkvZHMB+2O2iZjPRFgy9+qcWUBdcYLXuPuUPWcn5InXIljqK28rvECAouBSEvcQJCj
 vo80R1nf3pk0ywYXBh/0o9nP+/vrJ4HXvZLQs40olIL01p22YJ/ETkyS5PjjBULjXBEt
 s1WCCus5aXBIcaWAuEydSbfNpj0MDhV7IHGt490c23YrL3uSoVup7JGNJePnRwBcu8S1 aw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k7mtd08kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Oct 2022 08:29:11 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29F3DIb1028553;
	Sat, 15 Oct 2022 08:29:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3k7ka24yp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Oct 2022 08:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq1uWZXXAK7CgAWzTJWYT0tQ9Zw3aCVhj7wyhI4s86+vZw/1QREjKmGQLHrPh4Z1pDEtJZWL6GiwZNtMlGWs1KzoHznC+vMpFzrNdP+vYol4HZF0S2XyLBuBznwVwduJmD3SrLHUtdZnwS0TQhOLXudDnnqDzT/UWA2lGTER1Se+7rGQCQRdOgRcsm0qn0dbvOrkLu9a8d0A6PlJOcNL0cgUgerJYa6ff9prBN5ic5d/rfCq2jgszxeswNF9WUWXdLTQvTHoEU+Vff9T5Ek11Ip+QdeFBZP2CHcxOW3Ibw1XOfIlFjfGjxV2CCUl/qGr1ozPWSDBv3viEWrtb/U6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFHS39a4Qi+ljqVn1N2ZT5WIK8kSfLM97eBEicHJYv8=;
 b=OayB9rN64P1Udn7oHxdHa15g9oKzdUgqncyYESsMUN8V6IcDfGIK3aSpRH9TLsfDdwGYJrZpI7iyWlHoDYb8Z9CZhXvggClM/Vy4taduZmFLVwoO5TtF/weVjREBlj4HeKfNUGWgx0UwucLOutsS7i+0c6+SYWCKg81Zi6aVBOAhdWzNAlFaSNkxVRoBOl19D3O2Ur7ClW+vGDbhsTniH06uEh3EEzDuBwsrG8WDkcrHUigw4Hm3tZxNZkMvZnoqZnLuMSS1CVRKkLJw/wdiQyRu5eg+UEWjIyV8tJ/Mv/WtD1jhnReE/+cYvWLpyk3y4/gtKminUzqd7EMc3NdoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFHS39a4Qi+ljqVn1N2ZT5WIK8kSfLM97eBEicHJYv8=;
 b=qTqNG2qyAMuEf984rTWqKuqiN71m1ox3+wi1CE2B5pPcHW9nzDcuLZuRXXZSLH/9BjRThbvYQisIEbKKPpytbv1QlQuZSVaJvlYqShslYhUMYkLHEko5n1pehXmWHJx1/rDWauGleLb02uU6p4xSUycgjmqQVbIRIUQJ7RxyFk0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB5595.namprd10.prod.outlook.com
 (2603:10b6:510:f7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sat, 15 Oct
 2022 08:29:07 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Sat, 15 Oct 2022
 08:29:07 +0000
Date: Sat, 15 Oct 2022 11:28:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, Edward Lo <edward.lo@ambergroup.io>,
        Hawkins Jiawei <yin31149@gmail.com>, kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: delete duplicate condition in ntfs_read_mft()
Message-ID: <Y0pvRzgu5FiGhghL@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH0PR10MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: 71547d0d-3e41-4830-eed1-08daae87535e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q8SdaPVTz0Ao4nKQzRxfhpI9XhQPi/goFFeBGk9iyMZiFIixG/b0YmzdzFhcybg0S5i4B5o3zcJ5BH8nfv8Mt1YoyRdN/6yqH6EvLxrlybbaV9rl7WF/KP6ng/MFLp25qKTj/tcQu+o06V4yBvS98iF05OoQamd44mpPPXCRAvDDG3Cb1gD9fq4vE/yS1h9sqIinyc8GC2QEcMXZt5nNcw6SV79OK8kLZeE5La7ilGT2lvBZIVaJ6IZI+KUChqUmG4PI6fnfexEMFTb3dqemV4EMf/D4Vgv0jqeJ7zabucAkROZf9k2XMi9/86oo2je4VQyq6LVSGqEdNxVuHoXZ9bbt/pWaCBq+LFekvem1+DVytTdqaTXY35YFUAT3nm5OdMnYBVdH5j1vNNGXA8CuqLumt+myG0pmVoeH1I1Q004H62Rq6Y0SBSV0Nsy+Znpgc/HtJna7eldaY/nilZnHxtMUlQKejZ2QmI7ylFM6MQ1jcI5Z/KWprVEEPO05kJXSXLNV8o3iXDbrqRQF+AlIif0PSB9rxf8i0+5sB1NOzmDdJzpoy63SMfzs22dHlccqq5ktAUgj5wcALBTtGQwBkbCHuKZejPRDeIYuamCdJtPMUIlbciq/FzcDxi47RiZ5HdwR9KCBqv73Uj9/+PkbnwB2Bje2+kugng4DoSiUoTTsQ6OUwtEZKUE7W+CeJGFD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199015)(66556008)(6916009)(54906003)(8936002)(38100700002)(4744005)(5660300002)(6506007)(186003)(86362001)(66476007)(316002)(8676002)(9686003)(6666004)(83380400001)(4326008)(6512007)(44832011)(478600001)(6486002)(33716001)(2906002)(41300700001)(26005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FS+Crolb1PM+v9LzowEU6cqS9at/b5IKjIOKeqeQ2D+SV4Tv1UrfURnWpbcY?=
 =?us-ascii?Q?2gmjMDs+AZyzD0nBZsFdjmtKSsrL+FOk9yTPycVyCT43drOfNRTZnXe59I/a?=
 =?us-ascii?Q?Ral/f6LzVdtikpKOK0imtRXm0sS3NHx+xw3/mmdL264pbdIAnGNPdH2Krwsf?=
 =?us-ascii?Q?kXA/WnUjRuOKA/oLefiIGfhkABGKlEPbgY/bR8agCanRv3jYCP1eUmQ8cDbI?=
 =?us-ascii?Q?aS61HekLX1f/RAPdbtLDITb+8O+9fdvVf7yCrllbFwgDTF4fmqNO+5PTJRD+?=
 =?us-ascii?Q?toCrw5ZT9rA1/zhJHbRu8qU/RY8w9tGdppYOv0EIUEDGFvXXkJelRW9ELgWO?=
 =?us-ascii?Q?eorG3DTRQQuWP/K5mtGxCBN/96dvm0zcsEBuweCJv0S0Wsr8Bz+GUCvkgHy/?=
 =?us-ascii?Q?nvCgFOh4mvuYjygVCJhb3S0q9A4aMByUaQfCYj5W5cj89x7hfALmbE3XW4tC?=
 =?us-ascii?Q?ju6kXlszsZkk5XhuNcd6MmQja5h+mc63HOmBnC7VF2cYoNhcB5pkmFonR9Z2?=
 =?us-ascii?Q?YVT6aVtiuJq6wBzXN821IXQSMiMFFW+zdVjHxMjl+58rcFcDkTgOQpgrZTTv?=
 =?us-ascii?Q?mzrCOkAhxhY24TJWhP1T95toWHNEnRwtrquoJTJ9L7VcWcbUv+vbImZDKOuP?=
 =?us-ascii?Q?un+tOgJapmE0ASidCaG6O/gfD5HDRKQ82ZgkkHV83V8ixOsBm7y7cWRtb0Zh?=
 =?us-ascii?Q?Onb3Lx73pBI4g1cbyZo8ye2relRm+B7hJRxgLMje6nTEBG9bkUBZ+CEExAX2?=
 =?us-ascii?Q?DgxU9RfX8nZrzP2+jqLUAFfRQLcTZldYWncdexawmB302HjnlnUVWNJ2bn6H?=
 =?us-ascii?Q?pQR3RMImZJ3ep71UWeAKmmDWfIe8QJ5f2hbIw7qxbWXxd5eaACLdOSuh/HxK?=
 =?us-ascii?Q?uUuDCeajDts0ys6Bcm7x9c02vZcLZLmqZ7bPf3KWxSdDUq0StsdbLjRp38PX?=
 =?us-ascii?Q?7xkI6GqwEW2EyGwrT030VTnIX/AEXXTAGBjcXmFMLADQdptdvvIoaDQMvM7j?=
 =?us-ascii?Q?OUB2X2+m3KEmtkT4XCzZBMSfDDt+vcMdw11vhU2G4IYIY6/7bvst2qOKK7Zi?=
 =?us-ascii?Q?QjjglYb4Wmi4NYFdxO0MQrpq3V4AHvulfw+mZxtdBxzBwG7ZXPAwPzjYsiaY?=
 =?us-ascii?Q?fXE9c5MR3J0RMUuLNnbJ+YzEe2/q/LIYeFqY3/EddN1/35sRx5Vf2Pco6hqZ?=
 =?us-ascii?Q?9Pmg5/mRed2VI54DtAot84C4qPuChItldq2gmsOCxHW44gAN4AytrjzchqOo?=
 =?us-ascii?Q?V8fsrDY4uBXzIG3Ip2p5So/+u2x1p5GWa9oWD3hivN6y1Y1ppv388sMZ3TOx?=
 =?us-ascii?Q?LiIre4LAnBRJWu1jlShiKvpzNezdyRFxYLTQ6fzsEKVQIFJvT2wXIK13lbWE?=
 =?us-ascii?Q?wZ30Vy39BwhQEZsvCw2XrVdbX3vccl81PYfQ7Y5m3NrY6eIIzku9XFiuRCkF?=
 =?us-ascii?Q?xv3arkQKLeGf06DTloskiIIIMlfCoT2WroGF4+dn8Ppj1WqN6eXCRo3C8tYw?=
 =?us-ascii?Q?+TRzOz1APcCYvF6OtQseSnwtFJi6Ct6oBM+wxu5sNfL4B0B2R+AG6W3yeKbp?=
 =?us-ascii?Q?+Fhrq8VhP3mIQA57t3HPeVjlo4dFvJu1R1h+YtOOx0Gq4UhSjiWNPHlMHeHq?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71547d0d-3e41-4830-eed1-08daae87535e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 08:29:07.0457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rh1Pb4jlqNDeBd2jBEXyPFD2CeMCW9dLJu/JJ6h14O0cC7pX3u2x2woBpZL2zVNDWCyoJrZIlUzZgWHPIVe5kVybnS5WELESYTs2S5Kbrh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-15_05,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210150048
X-Proofpoint-GUID: 7-yv9ABAcLRgxZzNrNkSLsDnTfN2IXoq
X-Proofpoint-ORIG-GUID: 7-yv9ABAcLRgxZzNrNkSLsDnTfN2IXoq

There were two patches which addressed the same bug and added the same
condition:

commit 6db620863f85 ("fs/ntfs3: Validate data run offset")
commit 887bfc546097 ("fs/ntfs3: Fix slab-out-of-bounds read in run_unpack")

Delete one condition.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I deleted this one because it was further away from the "roff = "
assignement.

 fs/ntfs3/inode.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index a31474d697e0..e6143da5b4d6 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -374,12 +374,6 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 
 	t64 = le64_to_cpu(attr->nres.svcn);
 
-	/* offset to packed runs is out-of-bounds */
-	if (roff > asize) {
-		err = -EINVAL;
-		goto out;
-	}
-
 	err = run_unpack_ex(run, sbi, ino, t64, le64_to_cpu(attr->nres.evcn),
 			    t64, Add2Ptr(attr, roff), asize - roff);
 	if (err < 0)
-- 
2.35.1

