Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFDB7B
	for <ntfs3@lists.linux.dev>; Thu, 30 Jun 2022 10:45:01 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U842Lx032158;
	Thu, 30 Jun 2022 10:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=R05Uwd2jyjaFAmztD4V2q+KaPzEsAw0Mfyqnyy4kxRs=;
 b=zputrHFiSVcDtqSyBYlbUP/84ZhS30KtfmMfOgm94OzIyidM9/y/P/xaN6t+ZJI7yPe4
 OepJPFJxn/n6QyjBhM8H7ur5RunBfP2kHlAB/YXe8O8WZ+x3SBbfjR39uuU5d/rsp4nq
 K4/mMrezv37EUpg6sbFrEUepYHzmvbNuGal8Y5iInFXsnEpPgVHWIhaTa83TMMdKrDHe
 ZWw02FiKXxO5eNNPIii+96q00Ne35E6d0HYLl//F3D5XUUIuO0FaabrwM9wYD7Q9EZNy
 qj1LRVK9A0RZZUcj7nHu2IkPV1vBcO59XjleLQrJQ8ASPplvvV9kwiOi8FYBNNdURadp KQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwry0kvqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 10:45:00 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25UAewXJ006172;
	Thu, 30 Jun 2022 10:44:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrt9w07a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 10:44:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTIyVs0J3IGhl1BoeVAStpSdsJixSmAx/blazZDybZyPPZZ1lJMoh0HVMtqXE6Sl5i+bZjfozQdnVbbP/QAr8e6l18sKAmo2D89ZwccIUae3LanEhkFu80zxO28pxqeYDrKtsEe/0sRdkEpl+64mD/LCMqj6RjYetlMU9ZXTDly1GdQVd3i13Vr8ZNNXe2UwvV9pSl5zHEVmQuuCBRr1e2W4k7CUgnOlyFsYzWwqwLnJUAbcoPd/eCi6CEYYX0J+/iu0NB4rlOHh5mpkNymg8MKFjNJ3ruxbRm0J59AfdyRCI7qsGR1J4KDxLj5/r6OPvy+c7gkKGltaMOeuUCweTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R05Uwd2jyjaFAmztD4V2q+KaPzEsAw0Mfyqnyy4kxRs=;
 b=EAKz7PClruSVl9IrGjmF1ajDxkXK9B9diRaFcrWQcgm2Lw1EsUkzu2gBU4ZBF3z9b/P+XRP0KhXaw952kTcIhMTjkeCY3KPMN9qMLteirklPdcXix9JmZ3VPvdbL3g9lcnfSEXGz9yMEs5Kmg69DGavxRsHr/O4T3AvWSThf86M8WlVORkRgHERa3QtGt4LO3Gyut5cie7y6R61jAKyTXIWKlpTl9gOPMwv+1ZM1HZwJH0VhA1zu5HxNAeyl206zhV+KU6xGuvu9glCHf6A66q0TlI9dt+kfltroDh+Yb/EcCR/Hh0v8sfppy+/OqeRaYcOzvEMSp9t7uCKFRBeJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R05Uwd2jyjaFAmztD4V2q+KaPzEsAw0Mfyqnyy4kxRs=;
 b=eet4ctcVU0lYzEzaQBacievlJRyY51SQLn/O5n0FLSiR5+cr1nmRK3ZDKQLUxZQf3zAM5n+E4VdVn2OIwwqogiftsPSXEWPVayBpKPSdaRG6lkZqP2Wdw11yL42oPWFneB/vPU5sll8KaG6+9iM44hDvhwt3rg9iuwkQpg0i1Kc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3506.namprd10.prod.outlook.com
 (2603:10b6:408:ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 10:44:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 10:44:56 +0000
Date: Thu, 30 Jun 2022 13:44:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE)
 implementation
Message-ID: <Yr1+oIcJDy5leVeg@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab13210-be23-4525-d387-08da5a8592a4
X-MS-TrafficTypeDiagnostic: BN8PR10MB3506:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uyuyms8Dmw/9a/6QjFctdk4tnIV+arQM1lW5UzO1n0USaek6HWIdxYoH0l7rrv0ZhSbqwAijqKytkTv6Eg1XXvwEmScmR+2TfwPm9a/oW05qmXH7a3SIMhCxP1DyjOSHm3JUq6W4dKZsQRRe4CpLqPSXTW2eWPzYcQomD0Ugb16uMJug9AS8scvDM9K/bqWUNVxetAYbpW2MPexwIz8fqp4vVNFUO2XsnIpYUzMpXMQQXV8gNKgLy9wKgpE6b7H82e2N43kB8RNz+4pl5pzNCufIpC1ypa6ZbNRJG2cfDDaPrB91Q0GLbr9+pE+Bsy3fXXUQItZ7efXR/MZLQdSJ4hinEvuGC5387Zui3fjNX5s1ZY+6HuU/3+q/NNVJbtYWhKIlYSNd6T2CMslo5PWfGOzRuJNYwkuMlfZw/N4vwfRvaM1ShgHyKfEVDaTNdvA0K/7xPHcZdnUXOZ6Fg5kTLZcq7kHyC4tacB65EYCYYI5dwDZBSnk77bCB+NB4oMMwCfI6jspYoVl0edqGb20OwDdBh/3DO3lV7najFP9qdX5rUZWlzpRXPbCx2Y4bH6CDt55CZ0Ih7ipMfCcKQVHIMMsTfhHypl1NRN5+SR+ZNw64gncNnH1vNM8F2zbNgel3T/dAoyxpjsZEqktdkPPu0ZhtQBoo3GSNUTf1HyABGMbzUYlOXpCj/ahgu8WEJNw5QyWzMldDP/eZ7KXITk5Hd6D+DK3K9JVf1m7CZp0PRgl0GtWlFDpbUfcwr2TbtdwQ4v9q7PIgrnxqdXXSeX0BlzEhBy4xalCdtuPV8NEglvEdGBe8zZZKAa2yT3+/2wFuNBuZbevEGxdHrxRc2jffjg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(136003)(396003)(346002)(366004)(39860400002)(83380400001)(6916009)(33716001)(8936002)(2906002)(5660300002)(86362001)(44832011)(9686003)(66556008)(38100700002)(66476007)(8676002)(66946007)(316002)(38350700002)(4326008)(478600001)(6506007)(6666004)(41300700001)(6512007)(26005)(186003)(6486002)(52116002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?otEyobHE7OC8HSNt9GEf1SsO6KTqxOkZNuD5+y/nH24mfNIAk0dP4YBj4Vwj?=
 =?us-ascii?Q?1I8fiJkSOQzowbrS8Sy/5lUnTeSr9/bhF05cxMx9H36P8VnKlyfRXB9XDsBm?=
 =?us-ascii?Q?dTCpBXjS8r5t4QWSgOgOMXtzpU2o+qH0hpVo62YMhEcLtFSKJfUeLuzshk70?=
 =?us-ascii?Q?2BIT12yKw43SDVdFoSzAurBI+5eTBUX8OjmjGnBzxdbRJaqLw2RWO6OZ/y7Z?=
 =?us-ascii?Q?G4J/qQO4VkqWn96ZxiOx6dF/5Ylv8lM9yzc1ZhpwIPxj7Sg+8u7NJoGMUupT?=
 =?us-ascii?Q?HEn32dx/mYRbjSVaFVJjMdoaUpAZbmEI/7au1B9lvbE3V0hAx17OfJfgJTD6?=
 =?us-ascii?Q?pKOI0yg8WfqNFCAa4XwQD1gP7xoDvw96Y9ujNWe27x5gNYv7skoVR/RBFOeT?=
 =?us-ascii?Q?Nkx24BL+LHua0hDU9d+1ozYHiqYTnsoqdT/NbP0vRP6XfKc/nW9uL4Qurnpk?=
 =?us-ascii?Q?wAHRuJYtQpM6YuTWdRr1HUVqcFFBsbMpyaQv1/iNv5HGSweU18bflc2mv8B6?=
 =?us-ascii?Q?m1yoDDVeXWA0buBw9DmGxzROncYwkmbZo/Gd5Q5RC2MaYCh0DNXlqu18YaUQ?=
 =?us-ascii?Q?7t9xPG3EVV2yAcGDKenlAL+Uk8RiIZTaF73bWLF7ggA5PHqcExdZ40Jp01vL?=
 =?us-ascii?Q?/hOI00HjEF2YzPokmXho4SJ5jpEbvNSwe4ZH2yUJvmQIhCr4hP5bJVczJdxm?=
 =?us-ascii?Q?38mojTeIUy5ULLjxOk6WdRqd7y5zwkTMOvNtcY/OC4D8VCfm9vuflfnhcB3r?=
 =?us-ascii?Q?jEnFb1wCLidRq+Mrwoo4W1TBlWTteUxvbvZWpLYcq/dmSIRcY0oEweCr3B5a?=
 =?us-ascii?Q?qFYVyd4+OJV1r/b6GuOadOsUuaOg5LTku2h11gW5tV+iLEqZzZndP8x8iyl+?=
 =?us-ascii?Q?1QXxQTASGGjyx9zG11wj1ZSl9vpRaP3Djc2ZjZU8gi5+wJYDIoF66NoKpWfz?=
 =?us-ascii?Q?bxu1t3P29+nwqeHGILWLacTd+uU56+iu2H/XnUV+HG8PIS+wEeL+GADQjOEQ?=
 =?us-ascii?Q?Ac9I5a8AVEbi0RWRXvQjly1+/cB4Zwt39SnaUGeH8iKtDpjt4c/bh41Z6Nak?=
 =?us-ascii?Q?/RFE41ellAs1dHTJhyNNVICYXGeaepefv5OiHd8wJzSL/MgqWqsXOqOiRB5G?=
 =?us-ascii?Q?dTuF/Np4yw7UpC8J6eBjJ3NRk1cnajYgABBTR1/6rWNflv1uqFJW/544vfG4?=
 =?us-ascii?Q?pS2nlodaUDboHh+MxC8v6Q7/CIsIiX0urc7RA//taGQyPk6Tjh7+uWN2byW/?=
 =?us-ascii?Q?gG0zor4HdpV3RRaBm4yTrAExTHcd1IqF7tC0lXJv4gTrtCVzw4c10BCn4K0l?=
 =?us-ascii?Q?TVl9h7MRD898ykhRtr7J8bDSbw1ZAOSMbZkhbQPDz5qtnkakFkaLXWLXdoq7?=
 =?us-ascii?Q?5JpohJEy7yiudTWey1Z6p1H8lmT0RyrsfwC05aYCCdrA/6ygX7VXiOoFPOcV?=
 =?us-ascii?Q?ud2ySYc42oSs1rSzVISLPsJxBYx8NMPot+coFDGD2/hfZMYv3Ek1SdO98kPG?=
 =?us-ascii?Q?hDPiQVxMnvAa7W+apEC9+tnub5bpjiXRoE/cV1IY6lEKjGP1x1efVJIg1R3k?=
 =?us-ascii?Q?4ycLYaS92Jg4grTI4dz3QCHd60KgY2C13jTpPq1E5jt3+f3a7mzRN/Iqd+EV?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab13210-be23-4525-d387-08da5a8592a4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 10:44:56.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FjNCzuR0pXIt9Jhhuuvy4jpuMDRS+epWsrxrPGE1pkCCGfNa3kURbjVVb8a28YWKo9/73nw3pS9/Z31YjFbTEv1kfWMFrmrMZ68QsTx4jY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3506
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-30_07:2022-06-28,2022-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206300041
X-Proofpoint-GUID: PKcJ9ARp5iJUXVHkWJ5Z9qr_1IvaDjGV
X-Proofpoint-ORIG-GUID: PKcJ9ARp5iJUXVHkWJ5Z9qr_1IvaDjGV

Hello Konstantin Komarov,

The patch aa30eccb24e5: "fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE)
implementation" from Jun 21, 2022, leads to the following Smatch
static checker warning:

	fs/ntfs3/attrib.c:2230 attr_insert_range()
	error: uninitialized symbol 'alloc_size'.

fs/ntfs3/attrib.c
    2089 int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
    2090 {
    2091         int err = 0;
    2092         struct runs_tree *run = &ni->file.run;
    2093         struct ntfs_sb_info *sbi = ni->mi.sbi;
    2094         struct ATTRIB *attr = NULL, *attr_b;
    2095         struct ATTR_LIST_ENTRY *le, *le_b;
    2096         struct mft_inode *mi, *mi_b;
    2097         CLST vcn, svcn, evcn1, len, next_svcn;
    2098         u64 data_size, alloc_size;
    2099         u32 mask;
    2100         __le16 a_flags;
    2101 
    2102         if (!bytes)
    2103                 return 0;
    2104 
    2105         le_b = NULL;
    2106         attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL, &mi_b);
    2107         if (!attr_b)
    2108                 return -ENOENT;
    2109 
    2110         if (!is_attr_ext(attr_b)) {
    2111                 /* It was checked above. See fallocate. */
    2112                 return -EOPNOTSUPP;
    2113         }
    2114 
    2115         if (!attr_b->non_res) {
    2116                 data_size = le32_to_cpu(attr_b->res.data_size);
    2117                 mask = sbi->cluster_mask; /* cluster_size - 1 */
    2118         } else {
    2119                 data_size = le64_to_cpu(attr_b->nres.data_size);
    2120                 mask = (sbi->cluster_size << attr_b->nres.c_unit) - 1;
    2121         }
    2122 
    2123         if (vbo > data_size) {
    2124                 /* Insert range after the file size is not allowed. */
    2125                 return -EINVAL;
    2126         }
    2127 
    2128         if ((vbo & mask) || (bytes & mask)) {
    2129                 /* Allow to insert only frame aligned ranges. */
    2130                 return -EINVAL;
    2131         }
    2132 
    2133         vcn = vbo >> sbi->cluster_bits;
    2134         len = bytes >> sbi->cluster_bits;
    2135 
    2136         down_write(&ni->file.run_lock);
    2137 
    2138         if (!attr_b->non_res) {
    2139                 err = attr_set_size(ni, ATTR_DATA, NULL, 0, run,
    2140                                     data_size + bytes, NULL, false, &attr);
    2141                 if (err)
    2142                         goto out;
    2143                 if (!attr->non_res) {
    2144                         /* Still resident. */
    2145                         char *data = Add2Ptr(attr, attr->res.data_off);
    2146 
    2147                         memmove(data + bytes, data, bytes);
    2148                         memset(data, 0, bytes);
    2149                         err = 0;
    2150                         goto out;
    2151                 }
    2152                 /* Resident files becomes nonresident. */
    2153                 le_b = NULL;
    2154                 attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL,
    2155                                       &mi_b);
    2156                 if (!attr_b)
    2157                         return -ENOENT;
    2158                 if (!attr_b->non_res) {
    2159                         err = -EINVAL;
    2160                         goto out;
    2161                 }
    2162                 data_size = le64_to_cpu(attr_b->nres.data_size);
    2163                 alloc_size = le64_to_cpu(attr_b->nres.alloc_size);

"alloc_size" uninitialized on the else path (no else path).


    2164         }
    2165 
    2166         /*
    2167          * Enumerate all attribute segments and shift start vcn.
    2168          */
    2169         a_flags = attr_b->flags;
    2170         svcn = le64_to_cpu(attr_b->nres.svcn);
    2171         evcn1 = le64_to_cpu(attr_b->nres.evcn) + 1;
    2172 
    2173         if (svcn <= vcn && vcn < evcn1) {
    2174                 attr = attr_b;
    2175                 le = le_b;
    2176                 mi = mi_b;
    2177         } else if (!le_b) {
    2178                 err = -EINVAL;
    2179                 goto out;
    2180         } else {
    2181                 le = le_b;
    2182                 attr = ni_find_attr(ni, attr_b, &le, ATTR_DATA, NULL, 0, &vcn,
    2183                                     &mi);
    2184                 if (!attr) {
    2185                         err = -EINVAL;
    2186                         goto out;
    2187                 }
    2188 
    2189                 svcn = le64_to_cpu(attr->nres.svcn);
    2190                 evcn1 = le64_to_cpu(attr->nres.evcn) + 1;
    2191         }
    2192 
    2193         run_truncate(run, 0); /* clear cached values. */
    2194         err = attr_load_runs(attr, ni, run, NULL);
    2195         if (err)
    2196                 goto out;
    2197 
    2198         if (!run_insert_range(run, vcn, len)) {
    2199                 err = -ENOMEM;
    2200                 goto out;
    2201         }
    2202 
    2203         /* Try to pack in current record as much as possible. */
    2204         err = mi_pack_runs(mi, attr, run, evcn1 + len - svcn);
    2205         if (err)
    2206                 goto out;
    2207 
    2208         next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
    2209         run_truncate_head(run, next_svcn);
    2210 
    2211         while ((attr = ni_enum_attr_ex(ni, attr, &le, &mi)) &&
    2212                attr->type == ATTR_DATA && !attr->name_len) {
    2213                 le64_add_cpu(&attr->nres.svcn, len);
    2214                 le64_add_cpu(&attr->nres.evcn, len);
    2215                 if (le) {
    2216                         le->vcn = attr->nres.svcn;
    2217                         ni->attr_list.dirty = true;
    2218                 }
    2219                 mi->dirty = true;
    2220         }
    2221 
    2222         /*
    2223          * Update primary attribute segment in advance.
    2224          * pointer attr_b may become invalid (layout of mft is changed)
    2225          */
    2226         if (vbo <= ni->i_valid)
    2227                 ni->i_valid += bytes;
    2228 
    2229         attr_b->nres.data_size = le64_to_cpu(data_size + bytes);
--> 2230         attr_b->nres.alloc_size = le64_to_cpu(alloc_size + bytes);
                                                       ^^^^^^^^^^

    2231 
    2232         /* ni->valid may be not equal valid_size (temporary). */
    2233         if (ni->i_valid > data_size + bytes)
    2234                 attr_b->nres.valid_size = attr_b->nres.data_size;
    2235         else
    2236                 attr_b->nres.valid_size = cpu_to_le64(ni->i_valid);
    2237         mi_b->dirty = true;
    2238 
    2239         if (next_svcn < evcn1 + len) {
    2240                 err = ni_insert_nonresident(ni, ATTR_DATA, NULL, 0, run,
    2241                                             next_svcn, evcn1 + len - next_svcn,
    2242                                             a_flags, NULL, NULL);
    2243                 if (err)
    2244                         goto out;
    2245         }
    2246 
    2247         ni->vfs_inode.i_size += bytes;
    2248         ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
    2249         mark_inode_dirty(&ni->vfs_inode);
    2250 
    2251 out:
    2252         run_truncate(run, 0); /* clear cached values. */
    2253 
    2254         up_write(&ni->file.run_lock);
    2255         if (err)
    2256                 make_bad_inode(&ni->vfs_inode);
    2257 
    2258         return err;
    2259 }

regards,
dan carpenter
