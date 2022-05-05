Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4B363
	for <ntfs3@lists.linux.dev>; Thu,  5 May 2022 06:56:23 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2455ZlSp026114;
	Thu, 5 May 2022 06:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ZaI6n/XrgNdneY8vZIfGrJi+TICA4P36iSxpctu7aSU=;
 b=iXx8D4DkQVrZrlRKvySUZWCHcUXoKpG82pyzxxspCVRkMh8Odjjk9DlVz+tH5XeJ4jIe
 CZRKzBZgnFJo3WGvqudx77Eoh0mGxnBXO3jF3WV4DcPfw8+x5FRh81rE7cCW21njDqe7
 KKJtO1dRJ5qtDqJJ1tDFYRlXO0hs6m/Tt+x5h1hGN24s50y/p6JwzKYZRFNN1QBwNZ1Z
 2s8fxkSDP05LA8+fPO00rCUAJE32v5LFXIhRNx9p4YuW0lI4oiqnLKI5FP9FmqIXYg46
 QywTFn63i6SKDR2Hu8V05sfEL5qtyjK9vbg0Kv3tPwzBoxBlD7qeq6FgiX72JZEJuQEP Mw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhca9e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 May 2022 06:56:02 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2456kZuc037409;
	Thu, 5 May 2022 06:56:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fus8xk92x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 May 2022 06:56:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvNAg/o/tshHMTfUPycVWh4jU6XgLDTywVMVu5Le815P3PtWEEA2Iom+3jeb5EeCwu8DmybaoBOX08WdrXjvGhCBjHEhT5+B6ldxNjSMbn3GqDRt8zUy7vG9cfhi6faOaURUghaOkDY/SiJY3oxo55fLIJXL2VpiMkxMS96tqXyoJqG981tLE7tBAqO3/7G3zoq2EgKdmrfw5sgMPuL4O4OoR9ZtsAKN4Ig76mT3KYA0Sdd3/yKsJ/jlkuZnLaU5Hhf7aeIVRDXq58A4OrxLz+hUnYk8xBAqYhbujUr7trWFgwRTww+ZBg2RfK98m7x3MT/RDD0a/FS/8MZp+n80WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaI6n/XrgNdneY8vZIfGrJi+TICA4P36iSxpctu7aSU=;
 b=cUjinNn8QclitH5Ek/T6qCyDj9aLN0/nKZKH/Z6Kod0cFwYr7gaFGIf3CsRqV5XN9FGusHC8h1vQXokUP3OaWoZXP4Xm+1MFoMRJgpxrAK6aExoJixiw4eaqpKXVtTo3ZhmNbLgi86/HPcXU+ypaSj2fKrG5dx45pMl/qq5O1Hc4l1Jq9s+KtBLwFLCW/1ZfSHu1ocR0qMZB3Df1HrMXrogA5xnZTZeaAZ31ItO2WieWkCANsz9L+rW3UaCdjBAC/C8rlnY6zV+oChGepSefCGg2dR4gMJqhzW3ia/PP+07Rn/HLM4CpUafwtaUpnRsr6ZLg7pdzkMi5rNSFZpN2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaI6n/XrgNdneY8vZIfGrJi+TICA4P36iSxpctu7aSU=;
 b=QShman0AYW0GiqsP6sla70ec/Y9ujAsQPLX2ESD9mEAW5BnSzUtoCljCHwGS5F0E64m4rchxRT63qVtkYDwm/zrgmNY/cN9hfeAjInwU+QBFh+A7rtguNkNx7AVTBBf6nKMT3gI8kb9WsRlKzmj+EDhw+jNEyOgctMNlfeynqR8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5519.namprd10.prod.outlook.com
 (2603:10b6:a03:3fa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 06:55:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 5 May 2022
 06:55:58 +0000
Date: Thu, 5 May 2022 09:55:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: willy@infradead.org
Cc: ntfs3@lists.linux.dev
Subject: [bug report] ntfs3: Call ntfs_write_begin() and ntfs_write_end()
 directly
Message-ID: <YnN084bw/c6ZCeEv@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZRAP278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2568d06-d0af-4318-4d20-08da2e644f1a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5519:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB551969D30E7EADA9A60E3A0B8EC29@SJ0PR10MB5519.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h3sbWX4sq16XEcVJPv6xrlV25lYaZbIbNeBrru2h4NuihQis58pUYhVHYn7PanqsBBOlrVEiWL2Sjv79HvRojHxXP2wB1YpxCJmu+k4gPDNir3+1djc8l7OSDMUA5nJ5OQgKLpP6kia5nzA8GySo2eC1dJ04SLWWfJtV4y9OHJTraYt3+AX+P7CAlDSx0v2CD3za14jRMTJ0vjBB/ye5gILZfiViKCtu8SkNtUGH2K7o559yF90GJ7hoIlkSe4HkLHvhZVbnGgyeSj0RpVGQQZ7zRU0oHC6HIuzPZz7UhPJK6jaElmPnk/oWtAl+W5zaHrAWUkhqqCU3vg3m5nFS1Qnd+dyeGhYYMWkJ6SspDwAG0ZEZvxWHdGELdaPH0UCVg/MVfEiZJPlUNXHokU3d6RH/OCZZS1rYobUmOBnokCf6OSQVr+Yn3uuHHL99KGvSCOs6pZR+YxABqqmJtO4GQg+f91J5bbR/xiQEEaw4dxrOfShjJvRBCVPI677FwqkWDGDzx8Jwe996EVWR+h22mUy5satGjLTmwUbLdfSQxW/Eg/alsE37kSltGjkTRfSn1hyRy0YuMRudTIvOx37ICWtj1sj8R9wrcu4LZUPvofBekB6GJFbEdjzUzPqALNSppNK8bIUOups5kvtKBNCjcQOsZX68Phc45J3IcGR7cBj6Hw+TBlhvbNrqjIbgUax6VGD3Tw+UVnE0ZkeGgDgjKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(26005)(6506007)(6512007)(9686003)(6916009)(186003)(52116002)(83380400001)(8936002)(66556008)(4326008)(66946007)(8676002)(66476007)(508600001)(316002)(86362001)(2906002)(5660300002)(6486002)(6666004)(38350700002)(38100700002)(44832011)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rw1eqbriBk9fUftWl+4aCunzRwSqY928KNR7E2+wDQGM9hgYz+QWWWbXVmcQ?=
 =?us-ascii?Q?aTj6RC6iFHq+zXe79yHRbVyTblhsrTR6V4O3nipez6FG57Dj1ZrO9yYyLlxJ?=
 =?us-ascii?Q?HFkutwbqqD1ZYE5wLlyz1Vfdumm4IzG1TDxv2ujb4tUdSl0PfTJsrzRxJYyy?=
 =?us-ascii?Q?TC2NdPiJeVRTDPt1DIGVosj/uIn+7/UgpsRbZWOMX6ub4helN1rr4rbgTwwo?=
 =?us-ascii?Q?T2jN4EPP6t3jacXIs8G113kCNQjHlg9i+bsiaFTPBSFrfzmmVpMN8cv2TN7U?=
 =?us-ascii?Q?wf6XG0uTcV5svCtsGpVK/We1/OQZH5MfVe247TP2a4YU5DQN5otFqEEzLEtv?=
 =?us-ascii?Q?mcuTxjFMONjL3mVWD79yD97sLsqeXfzHOMDo+Kxer/7yeA/BrvWGqkRcrZkT?=
 =?us-ascii?Q?F2NEk5shB1yPzew+ZQ6id/EPmQleIfG/zKaw4x3OP4b5ydUH2lo2AYt9zgVa?=
 =?us-ascii?Q?z3Q7tcToUQzseI1cQid3v8TpAR0fd1tW9isk/ct5cJnm6eoP5T3Ihs9q7oV2?=
 =?us-ascii?Q?KZpCzaaVAXn5ynB2IX8Da6MX7E+MDsi+l5Us2MdiBPgQ/5vPTDkWTJ1YxBNz?=
 =?us-ascii?Q?qCEjxYWGolCSadMdcmoFJhVCaI0NtQd4t6LJuGMkAEE4aNMDoFuUSdN4aWCW?=
 =?us-ascii?Q?k+N6Rvi6LYy+b45Ue5yUeaR5dsfagVtnbH8ct4KfFpxAn/xYydD+0y0TZfPE?=
 =?us-ascii?Q?BOTKzhNuubj0sLtq4nTywwf5Bng5e2OHmFMD122GGFe2hrRfpG9CFfLtU3OW?=
 =?us-ascii?Q?TjWeyZ03KMRRWaumoa+VfhkWaxhTlpkpRUUy+q+Tkapgfb7KLEzaw0VcrRqx?=
 =?us-ascii?Q?ukb3I6E8jJU5ChaOsL4Kax7novOTVeLgneMTYWvuuAZNptkNBtDa0ozth8cV?=
 =?us-ascii?Q?Xmx9CiafHHXYLgnTSPQWmtiDDx5Pueagi8eVGpZkfyhuBGHQZKbELoRlythA?=
 =?us-ascii?Q?Oayn1AkpKtb+v+5fThRSnlRo3IQsQI4mc7RVa3h4NifAatsvdveJAnXkL9z4?=
 =?us-ascii?Q?bGvycBL53xic+W06PnE/KnK351IME8tHEgZhJVZkC5mEjdd1q5ZuX5z45gop?=
 =?us-ascii?Q?627AmH24uuvAl+N1t3SHmRORGajudMLovQxPzkSVseOY5Cy8Su/3HiQSftoB?=
 =?us-ascii?Q?LtxwlEU4G28bv0OHoIsHKuzujIiDgX6U6G7QRZeycvKqoKDWtB/8PkAogVoY?=
 =?us-ascii?Q?PJ73Q4jLyw3cnGpMkAs7RFbFyG5fmCg2RiWhDjt5O2ACyjb+sx35ZcB5noxM?=
 =?us-ascii?Q?jfo78brF6YxKPwgvQod81mVFzU1IMu2j++G2uDsQNn8SCx2wzpGXwwb0NPNh?=
 =?us-ascii?Q?b9Eaq5SzD3THI8ILVTvP/ijBtu7pXA+FvYfyHBl06ct9KrU8JlJtvSr03EtO?=
 =?us-ascii?Q?2CaJKDF/G7d64koVYJCjZWGGsXjQMU7sFV6nyjmVlLzjzEFuaft8/3yiHzmR?=
 =?us-ascii?Q?g6QuQHMVCOErl0QhwTH0+awRqFMEHdGp0qM0CJbz8qniKM1s1mLdvLQTZrmq?=
 =?us-ascii?Q?QM0l9bfEER7aoq0y49J6GVQioPohhtht1xPB4gxasrcFUaGwhEnzil2Xw+lD?=
 =?us-ascii?Q?I+pf2WJ+eA+kCDyF1yMPXUshcaCUTmf/OhyzSZeq9vhPaSzm42+mg7vZb5Lc?=
 =?us-ascii?Q?cq7qpFIaQeXraYxTKuvCaOC1VU2Y3lbQm6PBV7Ee7/CpnGtOPWOqWTBXytRk?=
 =?us-ascii?Q?1l9JQJ54chnEiYQIRhHauCtuL9A+2HOXSfS93HO8n5O8T+xNowUTsXpEHKkm?=
 =?us-ascii?Q?8qT6WlV8gZm0jpgniYIwLveerB2KJ94=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2568d06-d0af-4318-4d20-08da2e644f1a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 06:55:58.8202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HnqlgTUXbvUbSKswlxhLAROxqGpVrAImh7nS+VT4T2YmCbcmtd1H0uNIxCur7IuVvT7bmU707vHstyU9gSATDYk/pddFHSIqYnDUCukjIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5519
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-05_02:2022-05-04,2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=608 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050047
X-Proofpoint-GUID: 4DUaHDKoQzix3Y5Itj25fwfPT_MDvNFW
X-Proofpoint-ORIG-GUID: 4DUaHDKoQzix3Y5Itj25fwfPT_MDvNFW

Hello Matthew Wilcox (Oracle),

The patch 477323f1fc2e: "ntfs3: Call ntfs_write_begin() and
ntfs_write_end() directly" from Mar 3, 2022, leads to the following
Smatch static checker warning:

	fs/ntfs3/file.c:168 ntfs_extend_initialized_size()
	error: uninitialized symbol 'fsdata'.

fs/ntfs3/file.c
    115         for (;;) {
    116                 u32 zerofrom, len;
    117                 struct page *page;
    118                 void *fsdata;
    119                 u8 bits;
    120                 CLST vcn, lcn, clen;
    121 
    122                 if (is_sparsed(ni)) {
    123                         bits = sbi->cluster_bits;
    124                         vcn = pos >> bits;
    125 
    126                         err = attr_data_get_block(ni, vcn, 0, &lcn, &clen,
    127                                                   NULL);
    128                         if (err)
    129                                 goto out;
    130 
    131                         if (lcn == SPARSE_LCN) {
    132                                 loff_t vbo = (loff_t)vcn << bits;
    133                                 loff_t to = vbo + ((loff_t)clen << bits);
    134 
    135                                 if (to <= new_valid) {
    136                                         ni->i_valid = to;
    137                                         pos = to;
    138                                         goto next;
    139                                 }
    140 
    141                                 if (vbo < pos) {
    142                                         pos = vbo;
    143                                 } else {
    144                                         to = (new_valid >> bits) << bits;
    145                                         if (pos < to) {
    146                                                 ni->i_valid = to;
    147                                                 pos = to;
    148                                                 goto next;
    149                                         }
    150                                 }
    151                         }
    152                 }
    153 
    154                 zerofrom = pos & (PAGE_SIZE - 1);
    155                 len = PAGE_SIZE - zerofrom;
    156 
    157                 if (pos + len > new_valid)
    158                         len = new_valid - pos;
    159 
    160                 err = ntfs_write_begin(file, mapping, pos, len, &page, &fsdata);
    161                 if (err)
    162                         goto out;
    163 
    164                 zero_user_segment(page, zerofrom, PAGE_SIZE);
    165 
    166                 /* This function in any case puts page. */
    167                 err = ntfs_write_end(file, mapping, pos, len, len, page,
--> 168                                           fsdata);

"fsdata" is never initialized or used.

    169                 if (err < 0)
    170                         goto out;
    171                 pos += len;
    172 

regards,
dan carpenter
