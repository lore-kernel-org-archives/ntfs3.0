Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E52609C5
	for <ntfs3@lists.linux.dev>; Sun, 19 Jul 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784464178; cv=fail; b=RIAAfxhtiyLfdpCxd0mCG/sOLeihgfQMXDFZlocQaObN2nyoXiBkNJqvpiH2xxKpQQ8xJ6Sb9EB9v4HFwUgL05xUICy+InYNjsDGbw8OUcP7AkryeogpNiZRjZfirn4HHvYzyKFaFuQcC/ZpyiQP0UaAnzQOepopHyhUqu7BQzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784464178; c=relaxed/simple;
	bh=O9de3qZqXs/fFzO6GQNnEfBGoiSxFVBdvsxnab42w14=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SSdlaQ685uEFQAEvKF12ocT/L2O1nMKXyTHqIxkqSuHVIYKgjcZeq2+h/5lpd2rKlduOW30ahuFwrKiLRuPQ357Q+82PPdlL04ef9EGdLpnumfKi+63cxCXTfrlsEtvX3YHvYoYNRPmHfsnHDgyh57LY8I1Oby6sAPtf97dLu8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=cg+aIluD; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="cg+aIluD"
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JCP2vJ1723172;
	Sun, 19 Jul 2026 05:29:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=LK1XzIR0L9YEQ2AIdzf6XaKNem1hPWHBitF9+KfIZ3g=; b=
	cg+aIluDdmOQjayYL/qr+co2nqdCjJKWlIk/pRG3tbIDTyff8Qgw9b6aQv8sSpK2
	RiwvVA7Y92R55UdUhesKDN2PEQZs4yaNnQPz5kijnaxjrI1d92OBLiZrebbAdMH5
	sCS1N19ae6fuJHVn4p3ngR5usi+JQ+9UUtPOkPCkr9O76dVyxN8yOOiX27s+1jqu
	Q7PMQhdHDx5VMsNylu7sGbLMfCrFZqQ2ScdFhzJtZUvwdgkYwZzIV5TngDzhtgsZ
	9TtpAqpQoBmvByZZi9F+NnK95P/8NMM0Bd/5Du3FOHrKdHOgJbGzcTD/5JidWg3x
	UOFbrDwcpZwHIZD0pG4zuA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg90crsm8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 05:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgPiJFEo02iElySh+L1Si/PZrLL3dfQciF91CvNm9Lf3jsbqKZEpfvDYv95eRSnTsIzWNfSJrmGJhDCizbFplDsDdIYZlMuJGM3t/TBGh6XEMReB8KQU4h5M7IaY/SjQ9yMmuEbHFi2PN5l0IV919MR8XLLOJyc1jb0aiV2tP8geTK4cf5fjqWlN8qoVyGus0fbwmAsVJPlNe7/pBEepSfSjwleP1s5Lo9eljMQgYmj0s4LUxaosizdJkQlSN+FanMAC7Lh9/VYYL1yyKpBOKU2V3zzOEKmigvDW2Th9jRnv1LuftCOF/2Pxt134qBNFH4bm/6wPQzfvJ1RU4/+YbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LK1XzIR0L9YEQ2AIdzf6XaKNem1hPWHBitF9+KfIZ3g=;
 b=oJsOGmII5h+T869Zf9QjcETOFRRs928qQ5uIc2mtU4jDETkt0WBtd+CYZzZsQrM/79Wktq209ztZqwTFot7WnFB+L1kTDCglfiNuZb5w6HjK9oMaapWjaNkBiJT2sYvUiXd9ZeBMYa9ayqAfY8/m44G15eDfH4rqe8+9yHTUYErkiR8M7fNwftYDKkdKP//PKH9ujtzMNLpJf7PL2pGGJWsJIHNRXZD1arI7Z1k4YDmkoJM4dmuhs+FrEsdjFG/acyG0qe5tB6kSf50VmpLvMfAC2Le/GHKEKNCWNiXdRmACo3W/QArfsBEL2DnmANWMIoQekL6yjmz3i/xTu1ndBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sun, 19 Jul
 2026 12:29:33 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0223.015; Sun, 19 Jul 2026
 12:29:33 +0000
Message-ID: <338de59b-ec43-4680-95f3-65f29b0d7db4@windriver.com>
Date: Sun, 19 Jul 2026 20:29:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ntfs3: fix deadlocks in ntfs_readdir caused by
 ni_lock held across dir_emit
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
        yun.zhou@windriver.com
References: <20260701013049.3141386-1-yun.zhou@windriver.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <20260701013049.3141386-1-yun.zhou@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: fc115410-4099-41d8-7ba4-08dee591634b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fhQedHtFs1w3XVVQcCAMJtGiAOkB8hhKl+QtkDrCmHBvI91DuhTp/CCBxBycXZBu0waFcjtEhPt4ohPTwdPSOY2k69REUF7/6UAuJwuIYoqC7n3h0QB6yir2sQXPBk1dCdEuXlgUMRjVFYuHqeh/tDoczIegkEPjdV7T/22Mn7/6YqLvATEcEJC33N2xFrNGmYhTpVsICake41pFoWp7RPcyzBy5G3zwXNQhB4eeVLAFXU5JZLcsdjOLqpCnNg52g/GWOv1kMS8sdxiK7taaHNzHAVN4/RC710p+isyKf6XoJx7LceSPt4wEg3o76Y2NotHpqyJhVq6GNmtxhn+EE5I/9ca2R2HO3E0UJdEH1+w1Ce30KpF/lFS9l+Ey7/97xJH5VuSiJjj4FIEhnz5pHIswSWjbxdtLmm7vnI5zzKk2QWKfVDS0WaJxzonOycUr4FC6+Fcz7M3B1rfo6C/MyRh6hiLWbCtNBDWh5fqbqITamOCIEIallm/Tw9Ehuf2hZpn1FJyrLtrT8vSOiN7WbqgqAXl0QriMo3/+zzSENsVxdGoFR8ER//krlofp1dnxlg5dRuEDBJDON3ppo5UVVmuWVosziLK/CBDyca1IJzaJnQcFV+WIMd4DBrr7vpelLkdE3eQ/O7Gtvs58k8B8ogkrPIwebAnIV3nO7dmnmR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3hWeXZHMHNmeEFrRXJ4WGpqbWpWQldadUxrOXFiQWhOUFBEVU4vTENpcGdt?=
 =?utf-8?B?eHlueDZoRHVrUlVERFRSUTdyd2crSXRGUzZIeEFDRFVpcEl6cnhJTzdKRXRu?=
 =?utf-8?B?VEswYk8wVWNKemRWY3FsZ29ZSFo2U3BwMitRN1VXVFJsVVc0S05RcjgvaEtW?=
 =?utf-8?B?ZEdvb0VLL3dGcHhoZzdzZm9DeHZGTlY4OVBHSU16WWZSM0JDRk5wK3lCTW0y?=
 =?utf-8?B?NHFmc3VVaklDNFhkUjFwZ21BVzBWV0I5WHlQZG5JSUQ5bEdKVW12MkFyeWY1?=
 =?utf-8?B?S2h0VVJMN0F4eXJkTHFKWUx0TVpoNDRJSzhQako0SHZFSWlzWklXVzhXYUxK?=
 =?utf-8?B?cTNLMGhiK2diR1NqRm1JZmtIVDJLM0FOR0hRSXZNWm1zcTYxa1QwbFVJV0hX?=
 =?utf-8?B?K2gvWGVpdHkxRkxnTGdYaEF6SlQ4OGpuTTRkK3k0VFQvWWRHckhTT0lMRFY2?=
 =?utf-8?B?S2psK2FhL2swQzB2UHRzRmoxanF3S2RnNVdSeHVKa0RKdThIUGZtdzJzU2Zu?=
 =?utf-8?B?cXFpeTJ4Z013R1M4MkxKRnU5WXdXU1NsNXNocWpwOXpxQWZLb1BtUWF0cjhW?=
 =?utf-8?B?V2hMTnJmR3NDUDBLa25Yck8zL0R0SDNtNWFuOFJyV2ozRFJSNTh3bENQMVND?=
 =?utf-8?B?VXpIT1ZpMmtQU2RSU1ZWU1g1VlJUSnJvd1YxUVRGSVRIaEt3cC90SFJzNGdm?=
 =?utf-8?B?QUxhNk1GWHRVZGU5M1hkeFpzMmJPYjNCOTRkSmtCVmFmUXBpaHhlUng0bkwx?=
 =?utf-8?B?UmwrTHkrbkFuOG40andWWmRsaTdNdC9JTG1BMEFJWUk2a1M1TTNjbDZ1TUhp?=
 =?utf-8?B?LzhOdkFpOWtvUzFKdzY5ZHFmdHNzbW1USGtWY01OZU5lVkpqSUVta0o1SkVi?=
 =?utf-8?B?ZFRkUUs3MEJJM0hJMTR0M3lUVFJBUUgzdnljZlM5WCtNK1dXZXF2TnY2S0Jy?=
 =?utf-8?B?dklSQ0J2R2haYThsMkpDWWFiNHZkUS92cHZKM1pSbTlRWFRISXJtUFFqVjdl?=
 =?utf-8?B?SWRFTVJhY1g3dkwzeFk1TkdYNUtrSWMxZ3k2YVdZZjNlU1FiQVo5WUE5Sy8y?=
 =?utf-8?B?VDJoN0tuaXBkV1NYYjFzMjZRYW4xZStPeXlPcTc0R2dPK0JWWHR1RjY5SjU2?=
 =?utf-8?B?cXFkZktQSGhUNzNUOTVQcS9pQ21mOElKTEs1WlQ5MnhSenpWakNqakloT2t5?=
 =?utf-8?B?dDZWOTVvYldlQ3B4cmNoQjdhZFBFSzV0VGZOZU1waU9XdmluWkExM3ZIaGlB?=
 =?utf-8?B?c2RHcW9pUlNYQVc3UGt0eW9HQXc5dEgwUDZUekFpak54MFg4ZzhyaTc5bHRi?=
 =?utf-8?B?eUZHMklxQmd0d2k5bnVmUlVKRFhKejgzNnQxUGRORjFybW1YQVRxRnFnN21G?=
 =?utf-8?B?RFk4Qmd2VmNLZkhjV2ljVFhiOVlIc2swaHlsdzljVWRUZGE4eEkxNEFvOUtW?=
 =?utf-8?B?ZkNud05CU1dVa0U1OEtSUUhISXI3N1dqUXpFaW50MTY5VTlqK3gzOVdNaUtj?=
 =?utf-8?B?akxUZGU0eUNvWlZIdFFJdzFwQ2swNCtoM0tSOXZSWHk2ZlRBQk01Y2R4eUF2?=
 =?utf-8?B?Q1dxZXVqcnYwNWlsYTFySElGWllBTlNDSDNCc2FCN2tlYzhpNksyZkNVdDB2?=
 =?utf-8?B?OXY2NlNDM0JtOHl1U0JSYlg3akFWWkxJMmMxb2N5RXdSN0xDc0xSRXVOZ3o2?=
 =?utf-8?B?UHRtUmxTZTFURUNNcUhqTCs5M05tZGd1dGpqVlBqTjRyd0tYR0RacUZCUXZa?=
 =?utf-8?B?a1QzaU1RZUVBSWllQTFxQ0hSM1d5ekJnVnBMV25sUlJMbGxGNFQ5NTl6L0or?=
 =?utf-8?B?elkyM2xRMDFCN29rdFdtU1V4S1l1b1NDNk1IekxJblpCVmYxdFF0SnFlVUYv?=
 =?utf-8?B?Y0ZOdTd6czQ3c0tScmhwVDRYMEtXOENzUHE4Z0FVQ2k5Z1Juc0E2V2ZiR0Vt?=
 =?utf-8?B?MFljS1FneG1qVWJiY2RiYlFaMEs4NFREOGRpaENITFluOGpaZ21aazJrQ2dU?=
 =?utf-8?B?SVN2cFVYRHpWRmVWRDlvczFDT1N4Tm9vaFk5cStDaGZtc3ovV2VZT2l4TFNL?=
 =?utf-8?B?dTkwOVJWY1lwWjFqZXNUY0g1dXdQemN6WmtKemlJM0x5SEwwUHM3RmtkTG1I?=
 =?utf-8?B?K0hLN2tkV1RvRWNBV0RLUkRCSUI0WnJjenkxWGhkNHJYTUs1VktWN1pOcHlj?=
 =?utf-8?B?WmM4amFzTE1GRFZXS0xGQnBFczdmWk0vQVE4NzFmcGUwcGpYOTVNSDdzc1ky?=
 =?utf-8?B?bTJlc3RiZm5kUDRFbzM1QUtnVENqTXZiUjR4M04zQWFta3M1SVdobG9aVU9s?=
 =?utf-8?B?THJVcll3K0V0TjdPVkIvQkNuT3d6RWViS2FobVRoTXhwQzlpcitIUT09?=
X-Exchange-RoutingPolicyChecked:
	gwyAyeWj53m5QHKO5XpVZ59fJQGrtOFEW7crWvVUq7ePCMtTBzatohTmtb8jRVYO1YAUgFgXL7QfhThSpMdYOWQnBONZEF1IilP/oH05k7e1gg/hrBnJBNUZz/URY2sl25izSe/hpZvr6NkBI7I6CnE1MfM2M2FF7QqTZZatHlvWsGrfNrMdOq+Wz95f3hXVEM9TGV0/Otk8Kt6ayLFc3vwJL4HL972FvgSOuJuSOu7AXVGRM+hv+cATU7Ri3IzbzQ+y64aq3vW2aAmUN9ZgRhkQaTVjZYsbgifGafcfBpSbY3tdk01cwfj1KzpwEeOp6SO4URjxvsmu1NE2qxZbUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc115410-4099-41d8-7ba4-08dee591634b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2026 12:29:33.3421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zp/hwuliUPYLUB9xCpxx+OvQMLS0v73ysQe/EpN6CAPMBP/iSJfELONWjagKSgTpnbBhxOPlqDT54+gsbCnPFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
X-Proofpoint-ORIG-GUID: UBX7gimcUssju6QZ3pVIK0C7uPdxsQad
X-Proofpoint-GUID: UBX7gimcUssju6QZ3pVIK0C7uPdxsQad
X-Authority-Analysis: v=2.4 cv=AOkSgtoa c=1 sm=1 tr=0 ts=6a5cc32f cx=c_pps
 a=7APEvFnVlBjFtWv3F9ubqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=YTkGuSJYiQxnWoMm-VYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDEzNiBTYWx0ZWRfX8k0jxGEsODMo
 iwxcu/LFJCfczuMFaii4uvaWIxdAHCGC0gucyXUv2IWRDkk8Dx8F+N9Ii6R191GnW+DtTu+H91y
 MYWaYV94P0bUOc4o01fmkP0C9VoQkvCP2PR2TtPsSYsffgj6kAIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDEzNiBTYWx0ZWRfX+ofYPZlaGPge
 I49janXlYdhvVCMxfk0QS7aT6Sw+yeIbtsOj0gBOa5rY2vGSDdZEHwFE61rp2BXLIawXp+0Zkxd
 ytvcQW9a2RXV5/5j0Z1uO93/kY10hgnLOtdHBvJii3yfzEvtKiMIKXNqaf39GTXYrfvGd31ScuE
 oveggHAsx7B3PsE+kNcGhTo9ZYqcTtWCUzOjhnNN+/f5097+6Bk7p9iCuaymdH762oc8IztElu5
 XZTJhnb2dB2GM19JkKf7Y6ETHyqtoWkpUghasHEYJKJhrFD+abxDduBzmJ1o48aLE4EInD4KPSY
 gde49t7TisW8VbYNhJmpYGFYjlwfuQ0im/gy3ep3Z8j41szKMp8Iaf0A5DNi1Pyshc9lVDSgr3/
 gZpV927VrAB3JsReeAe59eYOVPeA5OF63X32qtXVG5VjpQlGV6Rioki5c0IqiZt7Bvx83XmjeaE
 p+jV8b6rrkKMWi+d96g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190136

Friendly ping.

On 7/1/2026 9:30 AM, Yun Zhou wrote:
> Commit d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata
> walk") extended ni_lock to cover the entire directory walk in
> ntfs_readdir(), including dir_emit() calls that copy data to userspace.
> This introduced multiple deadlocks reported by syzkaller:
> 
> 1. Recursive ni_lock: ntfs_dir_emit() -> ntfs_iget5() -> mi_read()
>     tries to acquire ni_lock on a child inode with the same lock class
>     while the parent's ni_lock is already held.
> 
> 2. Lock-order inversions: dir_emit() may trigger page faults that need
>     mmap_lock or mapping->invalidate_lock, conflicting with paths that
>     acquire those locks before ni_lock (ntfs_fallocate, mmap).
> 
> This series fixes both issues:
> - Patch 1 removes the ntfs_iget5() call that caused recursive locking.
> - Patch 2 releases ni_lock before calling dir_emit(), using the XFS
>    approach of reading data into stable buffers under the lock, then
>    emitting to userspace after releasing it.
> 
> Yun Zhou (2):
>    ntfs3: remove ntfs_iget5 call in ntfs_dir_emit to fix recursive
>      deadlock
>    ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix
>      deadlocks
> 
>   fs/ntfs3/dir.c | 38 ++++++++++++++++++++------------------
>   1 file changed, 20 insertions(+), 18 deletions(-)
> 

