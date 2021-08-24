Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B713FC0
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:41:24 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O8iB1i015021;
	Tue, 24 Aug 2021 11:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=VhQR1zEZHXLSlm05T2gri6mV96O+nqOhCIwKL4BsgBc=;
 b=e5nVLDG9ZqWXcC3e1ETM4j9V7ImVgj09JcFl7kFmgtWs54uozToQO22amWrUkcX/IPQC
 zn/PVKwY+hRdYEUiubCel/h2j7mWadXwSCtMTJcdA98dSHI+inGZD+rISs5O+RmkDmUe
 kM+w9I6Ejl+6Damy+/122kIlh1WlXAShXFlVZFMO5wKwKXhQhQ7OBbVzbZpXAoOzjUgO
 up0xyofLtbFhvlFEQcXS3vShr33V9GKWW0Rg2D0WwtyDCLNak7EQoXL5dCORa6jB5ttE
 W7WKgkwd1+UenGN0XXaXi3+Jg0TNXPQryMjndGgqabmUqbj+aXQvECHI6t39BhwNVNgG jQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=VhQR1zEZHXLSlm05T2gri6mV96O+nqOhCIwKL4BsgBc=;
 b=ypXynUEmGtOPh3M6aUKKaK2EsNnBYqQArJtmKcIwFlTFityQJKSCz8BT7Wa/joktVjOs
 CEKyjF6iBZ5aLRyBvqdSnGHFDbOtotlqBYS2URPuMi7+/d7x2u2R4Pss4sdg0AD6cjL7
 HkjECA4Mbf0wWnoYA5yHwr3Hwjfv9Y8lgC8uTrU5fd43WRVrNh92cKDULUuhWqV9/sP9
 oCUVmivSBtnnbb4EdSPpQLVorbY/uEfA+mtyg+Y3+09jYaBUt7EKuzhfOrc0GKCHxlhf
 TEawUfsW2Gn4+MxfkDM+5W8LNFlxFDFfpVZlJDYXJ8o/DkgrdCtoz1yTwTZvehzKYo+B Nw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3amwh6gc1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:41:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17OBfK0Z182433;
	Tue, 24 Aug 2021 11:41:22 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
	by aserp3030.oracle.com with ESMTP id 3ajqhefbfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 11:41:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANId7xdMfrnW9sLJPcGqz5X6UM0OJeTqYzdVehfNNWC3A3h51uIAjPGrKDTQSWxGir4GTbShi5IPd1qJmIZJymqbyDG2Gt+faABg8avHdcTDGVN7VNGANbYY9S4BG54Kw9OWN+KhXOPt9AqpskSBpM2IJKbaRQbRVifhFk1XHY3MdCCY+LpQf9dgB0fGZZj04YfO23Hp0iBe8h1uBJXrwEofCFffRVnHEp0VaopZvWahqGjYR2yOOKxRzMpNtSyN4IU6dLYgwChnUz9SD1gDAakII0pPK+YSJ/qzeKjwqlifluLfX9Fm4dOkIgIX8lA7s1pSBJ0Jm2yjRavFAUrzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhQR1zEZHXLSlm05T2gri6mV96O+nqOhCIwKL4BsgBc=;
 b=Pv9pKVcBraYrqw2wD7vknnBd0+I43ywpagbBjZlnu8A4d1I557CBiqu+Mf3rPtufWme1s1ZV5PBi1WvzM+RKO6nZv/HcWrBXBw2Si8Zw38GQlXv5AN2V8raRuOCJPIuIvO1FGIItia5jDOckaw0Sfc7HvFzCe1ZmkIRuQ2dJHdhFMi5csemtTQHO508cSEQxNmU/w8Z5tRGWzWyooG41HVjpLyO35HrcZSR6OmLQZxV6y3U81CfxJeSSUM4bQMg0NvBHEZSF2SzC4JM+Yz1BfN2cafK8n4FTwOv8irwEmGjZ2Aa/QTgYLt2bbeMqSySAEBOzvg57FKEaV3MpaVxHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhQR1zEZHXLSlm05T2gri6mV96O+nqOhCIwKL4BsgBc=;
 b=VxgfdzHRls/Kh2xbGwivfJRNOrmHYoTVMzZ8MK9x2/vT1tcxvkaTux8sB/Pcpgzx0C/53gI3x9psTvvqlzZYJhe9p8rorXyXpFw+EBoE8V31tI3TMiSnGA1X40B+1tsaA9VaUljXVn7BzsihXm/kJD4vNQt4gzpAix5HrDLClfk=
Authentication-Results: paragon-software.com; dkim=none (message not signed)
 header.d=none;paragon-software.com; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1822.namprd10.prod.outlook.com
 (2603:10b6:300:10b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Tue, 24 Aug
 2021 11:41:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:41:08 +0000
Date: Tue, 24 Aug 2021 14:40:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: inconsistent NULL checking in
 attr_allocate_frame()
Message-ID: <20210824114057.GE31143@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0142.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0142.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:41:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2703b1cb-900e-43c6-c5b6-08d966f41058
X-MS-TrafficTypeDiagnostic: MWHPR10MB1822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1822F6398801024F11C4FF4F8EC59@MWHPR10MB1822.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2LiQ9Kc1s+RzobtINW/zsS88FHfzuXXN5RCjweXuG6o0jtE7Jwp+ujxF5qGOli74+oEiNWUcJ3/LZBDz3TqJQg1sJehB/GIJlrj3hONTUry0ylTuJKirv3GVbbSazd6vipIehXbYg5fOqw+bXhKEUTkOJJJj4w1Ci4/Yo5UxIzduN+/WOK23vGQh1MVKx7avrGBDFAONNNeTQLmxC87CxF+VJyNq4XajJF8M3wXO6PG8Z6Y9nNUt3YAj7IzjhZ/scBzlu5uQaw+cFjPlguCuETsEo9Jnanlr9x3BBOVGScCn//4svHRirpeouLpmj0s+R3c86hvFphSUrxTCqg/iTSb/l0BcbFE7dwXpRcm3NHtuvTXJB7D/wRVK+kw5Rtfi9mZZK1EF9SkeZB3sZgxT6sfo5+D9fwKJWaR6cmiY1WOlW6lQgFvqCbzymnHf5vVMYySByV+mPBvU4VZ4iwGMKKvKZtj74DaN6rG/Ge9bG4WHTb9s5UzOGbFX/hCmWAAKu63KZnTcvyX+6kVWnaRUV3RniJwyRkLxM3E9NyNnykJ4BCMKNe/jsa9Y5dmYLOX4yomOlyWFLaK75mRsWMtuaf7nSKPRlDklUXsOWrISTAhDBI5x1Ue9P4+KwjG9hpafXOVIaGP40rD1pJZQjwsUlWAiqZdIqy05wqhVN1R6pDK8i8fcg9H2/oae2U/Fayww2Xp4I3kktBhsT0+rhVJd5Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(376002)(396003)(346002)(84040400005)(6666004)(8936002)(66946007)(55016002)(83380400001)(66476007)(4326008)(478600001)(2906002)(1076003)(186003)(66556008)(9576002)(6496006)(38100700002)(5660300002)(38350700002)(316002)(33656002)(956004)(44832011)(33716001)(86362001)(6916009)(9686003)(52116002)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KoFc/tEH1170/f33uTFc0DXpW+QX85c7zIJ09RCGXTloV9mKgqrtihFfWKnH?=
 =?us-ascii?Q?GVC3ohp7RZ6toHR1/38UQDpjR5TpA2HpcyRz4D7bEzk+uxfMoqzUnpqu/ztQ?=
 =?us-ascii?Q?wHijWt9ODmhs7WSz+XZBVH7HjqOLq3oQ13SU3slldGoO1Oxeud7tcrHnNzcG?=
 =?us-ascii?Q?SDXSVtBg32mZIRxlHRNnmb7+qA+WiN7szqWCEJ9Sx/80gv+fjwcvIFjewDfb?=
 =?us-ascii?Q?SLwqBzweVYI/yOrckDrvY5JG/0r37DvdsK9K+Yl58WtuNLT8A9xOBC7AxY44?=
 =?us-ascii?Q?zRpPpNYa/l0TJ7/c/VMkWLO3ty6JMSuGc8UIpZZ9sxYLp5zfR2DfjRSLEAlQ?=
 =?us-ascii?Q?/u/NfJiKxzxjDs8F/MZXvo43p/iW7Hw/3VGRw6Aq0TDhVkEcXim/AjKweCeM?=
 =?us-ascii?Q?jCUy/0Ihlb066lUzbB0vRxo4Bfx6fVJfCvibQCxxP8dvpB4slafd3AO18tcW?=
 =?us-ascii?Q?b9oOp/xivTsqUkezyepcbQ6eCxbKa36+cnr5m7RK1bcParnM3Grm1YDfgUJW?=
 =?us-ascii?Q?lR6nn9124UXEir6AhTkWUxUifnPLvDQegrTNW15+MRyku79iwyWJ65858xeO?=
 =?us-ascii?Q?QdXii1hGaPnyUEg61+K8yxMrLAOMfqH6mZRw+qOymlOmnTzL+F2iSWLHFyxQ?=
 =?us-ascii?Q?c47SuLGivNP6TcO4qxBFFYfrVYmVatM8XM+67wWR2Xez8Brg0FJYwSekJjpC?=
 =?us-ascii?Q?IdvPpX47qVZOuyoCrnUoAVr79jIt/JkyNbbMEK5p6tOnR1hWqlKN0q5NcYSh?=
 =?us-ascii?Q?p5rIIryDBScAyvK1snS4mBPwBgGzN+sutc1IZBNJ6Cb8o+6s1OpVHjiZvvfE?=
 =?us-ascii?Q?9AqVqCsOG3p/O5XE3Ub+kwb0NHTwz/iS0RvhyqrXTPvOTMrX0qnaINjsrOT+?=
 =?us-ascii?Q?tanW3WaHCQVHMB0JsBrAv0aCPQtyjtO754gexYVnwSzubr6AJYQcCg326z4W?=
 =?us-ascii?Q?93PZtbjoJp+spyFS11iFCS5Fl08X5YidtzbQcrbgvO6+RP6nqGcEng+ThaHH?=
 =?us-ascii?Q?JWqFDm44FS8NTT54NFhyAHwO6HNBwTyoEDoZzWOaX82MfZQc5IcZqBRJykKS?=
 =?us-ascii?Q?kE5kV+SnUfb44G6jLI+uISPJG5b9OHGHtkvgU6VZMZw1NKSC19s/pMc/8zgB?=
 =?us-ascii?Q?Lvq6PKyhpW7q8iUMEVwAqx+3/v6167LnG8oMch6eUP1vWEhNO6Fwpb4lxNsG?=
 =?us-ascii?Q?H6fuv8nIpQwZvxe3/MKAeb0Qqih0eVKhNyVXHO+LkDi9jddGFTV06q7V1gdx?=
 =?us-ascii?Q?Uc2Q6wew+M9luEriBPDKsIvchLgZk7Ef4W1i4A/NMQ2R9Lq21IbtyzBzE3jN?=
 =?us-ascii?Q?9h5aLTSOKfaAkrjK2YsT7gY2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2703b1cb-900e-43c6-c5b6-08d966f41058
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:41:08.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEJ+teiEwT/um+83BgMIBo106iTqefFzyOT0dwou1/1qTxbNPbgdabeC4JNfkeDY3dWGENgcfmGG7wwxeMK5P4PQxJhDlqjL6hTaxR8DQKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1822
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240078
X-Proofpoint-ORIG-GUID: FMgT9zArZyDM6bt-EHkW-5u4sjNvsPD_
X-Proofpoint-GUID: FMgT9zArZyDM6bt-EHkW-5u4sjNvsPD_

Hello Konstantin Komarov,

This is a semi-automatic email about new static checker warnings.

The patch be71b5cba2e6: "fs/ntfs3: Add attrib operations" from Aug 
13, 2021, leads to the following Smatch complaint:

    fs/ntfs3/attrib.c:1678 attr_allocate_frame()
    error: we previously assumed 'attr_b' could be null (see line 1591)

fs/ntfs3/attrib.c
  1582                  /* add new segment [next_svcn : evcn1 - next_svcn )*/
  1583                  if (!ni->attr_list.size) {
  1584                          err = ni_create_attr_list(ni);
  1585                          if (err)
  1586                                  goto out;
  1587                          /* layout of records is changed */
  1588                          le_b = NULL;
  1589                          attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL,
  1590						      0, NULL, &mi_b);
  1591				if (!attr_b) {
                                     ^^^^^^
Check for NULL

  1592					err = -ENOENT;
  1593					goto out;
  1594				}
  1595	
  1596				attr = attr_b;
  1597				le = le_b;
  1598				mi = mi_b;
  1599				goto repack;
  1600			}
  1601		}
  1602	
  1603		svcn = evcn1;
  1604	
  1605		/* Estimate next attribute */
  1606		attr = ni_find_attr(ni, attr, &le, ATTR_DATA, NULL, 0, &svcn, &mi);
  1607	
  1608		if (attr) {
  1609			CLST alloc = bytes_to_cluster(
  1610				sbi, le64_to_cpu(attr_b->nres.alloc_size));
  1611			CLST evcn = le64_to_cpu(attr->nres.evcn);
  1612	
  1613			if (end < next_svcn)
  1614				end = next_svcn;
  1615			while (end > evcn) {
  1616				/* remove segment [svcn : evcn)*/
  1617				mi_remove_attr(mi, attr);
  1618	
  1619				if (!al_remove_le(ni, le)) {
  1620					err = -EINVAL;
  1621					goto out;
  1622				}
  1623	
  1624				if (evcn + 1 >= alloc) {
  1625					/* last attribute segment */
  1626					evcn1 = evcn + 1;
  1627					goto ins_ext;
  1628				}
  1629	
  1630				if (ni_load_mi(ni, le, &mi)) {
  1631					attr = NULL;
  1632					goto out;
  1633				}
  1634	
  1635				attr = mi_find_attr(mi, NULL, ATTR_DATA, NULL, 0,
  1636						    &le->id);
  1637				if (!attr) {
  1638					err = -EINVAL;
  1639					goto out;
  1640				}
  1641				svcn = le64_to_cpu(attr->nres.svcn);
  1642				evcn = le64_to_cpu(attr->nres.evcn);
  1643			}
  1644	
  1645			if (end < svcn)
  1646				end = svcn;
  1647	
  1648			err = attr_load_runs(attr, ni, run, &end);
  1649			if (err)
  1650				goto out;
  1651	
  1652			evcn1 = evcn + 1;
  1653			attr->nres.svcn = cpu_to_le64(next_svcn);
  1654			err = mi_pack_runs(mi, attr, run, evcn1 - next_svcn);
  1655			if (err)
  1656				goto out;
  1657	
  1658			le->vcn = cpu_to_le64(next_svcn);
  1659			ni->attr_list.dirty = true;
  1660			mi->dirty = true;
  1661	
  1662			next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
  1663		}
  1664	ins_ext:
  1665		if (evcn1 > next_svcn) {
  1666			err = ni_insert_nonresident(ni, ATTR_DATA, NULL, 0, run,
  1667						    next_svcn, evcn1 - next_svcn,
  1668						    attr_b->flags, &attr, &mi);
  1669			if (err)
  1670				goto out;
  1671		}
  1672	ok:
  1673		run_truncate_around(run, vcn);
  1674	out:
  1675		if (new_valid > data_size)
  1676			new_valid = data_size;
  1677	
  1678		valid_size = le64_to_cpu(attr_b->nres.valid_size);
                                         ^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference

  1679		if (new_valid != valid_size) {
  1680			attr_b->nres.valid_size = cpu_to_le64(valid_size);

regards,
dan carpenter
