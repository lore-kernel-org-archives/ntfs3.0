Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.166.238
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793244345;
	b=BNtFdSb/IruPoyL4z7iOTAjt6tszFNF8mvjOROmNxwxP7TiBQ8KbYrwKNIb2VDn5SpRa
	 Vc06TeoQUHPtc/1rHimddQ201NBpnlzAaOSQ4UaICy23MmLGLhLehz04NaV/MMx8GrKZ/
	 OuYpJkhhNWCZBpvjBSNlbpNrJlqSSv2d+HbH5rjHJ0I6zOjrC97+OMYGh3XRAwQdzURzQ
	 cNKWVn6FxpZJSRNYJE+RsxqGN9y7PhOgnxfSjRefzqXGtsTnfYkjH+sqT4yhdTJzP9Y/G
	 1+6YZSb/ZvNn2mDTvo9f42B9CDBND9kkPg72VJh1/Sg0vacWOpQxQWQ53B3QksRR43g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Message-ID:Date:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dsGwT1bJ87FPXUIRaQk+Mh1W0e4Db6lIWqdJEYBxYWM=;
	b=xdj5A3wmcSPS0fL4ouldPNRXHzoplmvonRNVcCTGm2HGPruIf6aW7j+dTwHnm1HbunYK
	 l8qgpaHmi8I9Hox5SRJyDU+O+dW1bQ6b8ktp46z4UahJugkAuve93YrSpU0YPaDD1nzpA
	 zNR8x6wtrG8IXWDbU4H7tbpQ6wTatjM5O/CI+9CqU6+B3swj3WU/AyxfWqUH16q/ihJ8N
	 NPvNybmo+co3jjpRF/EDdTowSWtKlpKjUh/mwoEBm65FIpdn/ESMeKquaxHB3vrpz/Ozq
	 IOip+CAY1TiFp7mDB8L7ugEM76epAeyvBBDSknVcYlgayFj45ak14qyGsUznbbDtSqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=windriver.com;
	spf=pass smtp.mailfrom=windriver.com;
	dkim=pass header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=BjXjSx+g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.166.238
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE2D606A31A
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 03:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE2D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=BjXjSx+g
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1x9qP2879834;
	Wed, 28 Oct 2026 20:25:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=dsGwT1bJ87FPXUIRaQk+Mh1W0e4Db6lIWqdJEYBxYWM=; b=
	BjXjSx+gt5OhxEgpJZBsNK2t23piXogX+PO0tJLxoPpjezmwCF6uqTBsoFO9MukZ
	MvEUeXob18R5DkVJaqfi1l20phHD6rk/ahpungnyLhNt2JZHSphj48JcJVf04fQ6
	UxKe4mWHvN1ctkBjjm0l/sy+U5QVKWlEswl1ix+n1r+ukcIz31spM7jkzANcNuMB
	tfdfqYmg8foxR61XqoXr76NFqo/SGgu6JQqOeX3VXNd7rt5an5WTO1U7BUc6MGbC
	x2a9kwku6xW3XOwAcs+HTA16vM0FpWAREtHCiPEDXisRVPw9PLdbIYCJNm02kajk
	J8lCu8j5R64KXhy75CsGbw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022123.outbound.protection.outlook.com [52.101.53.123])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hgv6h7gmp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 20:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7a1M6mhxUwOpJHLv6xC4QWhpeIWzLXaniM5kwyPPCz6FL/rYKEay92qaOvuEj4WS4CbExgqxgUQwEAaCHYnrJnHlRjPnnkdZzKCiGwKmiuH62OIlJ5bQy+8rTNYJV/WzMCCV6rJDy+ZIijBvjDdOmbwfOHd2OhZxltiRoJkcq59xMd3scj2LgTno0PQHTKrrdrjiIR+UDZDbCwOOEKrlyu6yTIQRymFvvHgOe7hV0Mpjoa1OEa+J6/MS3G/IPjACz5XPUlScUWF4p901b+olz/Tm89q/KrDnbljSyaqXHNdIBJOsbS7zPiFfDbrspceZUU7DWIWM2sJJEd4C2oUsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsGwT1bJ87FPXUIRaQk+Mh1W0e4Db6lIWqdJEYBxYWM=;
 b=fLYH2DVPO5qDUVrdOBKYlKZIr3wM8wIo8ppVJUbwkVbSBtrqrgrVkTTMT/rPXyFxAsbTAwDzjJ/CC43e4wiX8/yzLG0zhd0k4ODNoTcKtYSdBBv2c7HIKvswADKAMozY+bgYeWXzUlOZkj++8jd9L8B+DqyhcfrFmwrq12oHvXk0CXeJzX0QItbCXdXvCRxESqruHSi8nmlB+yM2L1WRqnBHHTchqngEVrpGUPQfJtCDyEfc6S0LUJ2fOVH5UiZL4h3AuacHubeuL9laI23Iyfzsx2eR/UsquHQXesh1D8Fhnq5GoS5301HpIJixSCZmyEVRKB+utCDgu+WCQ0BUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 03:25:32 +0000
Received: from SN7PR11MB6560.namprd11.prod.outlook.com
 ([fe80::581d:8ed7:9c23:a7c5]) by SN7PR11MB6560.namprd11.prod.outlook.com
 ([fe80::581d:8ed7:9c23:a7c5%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 03:25:32 +0000
Message-ID: <eeaabd5c-7df2-41fa-8f43-69c8d4853e7c@windriver.com>
Date: Thu, 29 Oct 2026 11:25:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
        almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
        syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
References: <20261023223533.686085-1-christian.aurichzm@gmail.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <20261023223533.686085-1-christian.aurichzm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0079.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::12) To SN7PR11MB6560.namprd11.prod.outlook.com
 (2603:10b6:806:26c::11)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6560:EE_|SA3PR11MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c817777-cf12-4538-0202-08df356c4a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|22082099003|18002099003|261028144727099003|56012099006|11063799006|261022105027099003|261026140227099003|261026121527099003|261022075727099003|10067099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	OQgiC88ra4FraiO2WlQ8PYoYBFTZoDN8nw3dZqFzUko/xt0lTooEXyZUTarl8ZhL+8fuQNxaF8BPx9FFiLAReqhI39m6RDCcuE2gN6/n0RO1aaYSf+NvrvzfFOuZcFhTBMFX3VM8TojH8ylH5FGUMpWaZxkf9VqiLDmtIqV9yRtGohxB6tbRGfVhBUkgwml0QbjVk3+5hGgPiionplkwI7mP8AiF7bE+jeMrDlG4qvyWmTEq1vVHKWhwNNRPXCiGW7ciKx2yn2GZewdqGSVaN9aLnUk0eA8pwEdggO1GG9dhw7fHLh14YIG/gCD/zsFcLRC5kuenMZmtFW22pXi4vYabqePnsJq31vsJN3Gilh3/CpqKMpCukbyC6V2n0BaTpVLA6xGb3IWsq/KDLU8rbydKxDCsHWBqxF7G5Wdx+0vam7YnAtkZ5k6qJwkxFDoURAgWchk8L8psgWpgT2BysxRLmWQXG5xxkfzucRlC/H2hmpMYp5dNlleKDHRJ/R03Tcr6sfFJpBKOVOKzEM3qLdmAbJz6ZbMCZbwmdq8g1XkZGhrlng4sFv4BzcUfqVOckrI4Wkv2R8XjC7nQMGyiqFzgM5UYMAPGs7R78zYELBJnJslCKugoWooWW/5JWOoj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6560.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(261028144727099003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(10067099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUp4Z2d5UDVDYS9xMGIya2kwZVdwamw4bFlaS2RtWXdvSHpVc0tFdmZoTVhV?=
 =?utf-8?B?VEJuZzY2eFdvTXdXOWwzc2F4MFc5dSt4N1FHUHJiRFRwNmVLZnpHR3R1S3NK?=
 =?utf-8?B?dmZyU0R0ZUxXaTBwYnBTZFA5eVdOMTVUd3diOE9NbitDR0RZMEF1bkdQclVT?=
 =?utf-8?B?dnl6Sy9FdmdZMGR2U0E3T1FNZTh1THNocVBRU01ORk5ZdGorSmpib3FxQ1o1?=
 =?utf-8?B?ZGd5eSs4WmVJQ3RwN2FpeFpsaDFrYnBrR3BkcUxwbisraThwVGdhb0RUbFdu?=
 =?utf-8?B?azF6eTVCWDRqaTEzb3UxYXNPbVZ4cUFwN0ErdklsUHVtdTJIQnpDcVEwQmt0?=
 =?utf-8?B?YWNGQXpGaUF4QmhtK2ttVGNDQjRHMWk0UG5rWGNPOUp5aC9zc0JRVWFMT1ly?=
 =?utf-8?B?d0pKZ3A1T3h5ZU81cWk4VGJ4NVJTeVR2UHlRRFNleGxuK2xZWjNLRjFaSklq?=
 =?utf-8?B?UmVaNzFMS0FKR2o4ak9Jdm16eDhkdmIzd1VVbWNwRHEyZzQ4NFlqNitrY3lr?=
 =?utf-8?B?UGhoaHlhUWcvSHdTekVkQTdHRk44UXJ6RXV5bFpwdkFOV3BCVWVVbVRHWU1M?=
 =?utf-8?B?QzhxYnZFMjBJQlRrZUpxaHc1N21xS3RwSEpNc0FUa1JJOXQ4R20zQjdLOEg3?=
 =?utf-8?B?ZG1zQS8zemFpaGFVUVJPUXo3TXdleUk1aVhGV1JvS2ppZjBmeDFZYStvT1h3?=
 =?utf-8?B?ZXNzK1V5bW5vRGNRRjJVRGtvd3VZbkRUa1hhRGN2UE9iMFI4RGNDK0RmY1dO?=
 =?utf-8?B?N3d3ekhQSjMwcnpaanl2Y3pkUXM0cm9sa3Q3L1RIaklxZStLWjc0OFlzaG5k?=
 =?utf-8?B?UzczdWJDbkl6a1N1TE93ZDNNYjJyMDNnWkRkMW42cWRSeE5tUGpMcDhRT0sv?=
 =?utf-8?B?NnJNRWtzVnVoeVdwY3Qvc2E5bkFEdWp5Y2JPczFnRlUzTkt5OWk5MmJnZGYz?=
 =?utf-8?B?VXp5NWx5cmx3d0U1S0YzS1F4VG9pR0w2L1lpa3IwSnk0MVNqbUFFTEFSbzgx?=
 =?utf-8?B?T25FUlp4Z2V2MHRXQ2xnNVRtWVk2cXpOUVNML1RHdm1WVnh6SW5rV3JzVktE?=
 =?utf-8?B?V1AxeEQybHZGWEFLQ210Wm1kS2xHV2U3VW4xZWlxMzZEVzdDMVZveW1rcVFJ?=
 =?utf-8?B?M2l2VG9iMlA5ZkljbWZ6RFdickIrSnhyUzVJb1kvdlhnWDZkT0lRcFhqaEtK?=
 =?utf-8?B?Um5CVXdHaUNKcVBKR3ppWUplSE5Ub2VML2RIYS9WdlpjVTNoV3ZKd1RadDFT?=
 =?utf-8?B?UUgxQ1IwNXZVUUpJOTc5WVZxb2VKV3l3czh4ZU4xYlBFRXR6NDVsTUEwdVhk?=
 =?utf-8?B?R1hLZ2FlbXhzcjFmZGVHRUJLQWcvc1BOR2UzSzQ4c1FYemtBTUFmSkZGYnR2?=
 =?utf-8?B?dExvelEwQXQxbjdsWHVuSUlYNzgvZENqMnFuMmpUV1o0dVJwU0x1Y0dvcC9m?=
 =?utf-8?B?Q1h6YUdSVkwzdTNhU1pHNVg4QUNLTm1oTzY5Y1NBdzZTWjNoUjJtVW90Z01D?=
 =?utf-8?B?T1VzS1ZjMnBKTmNaV3Q5WHZtNlk4WStxOHRheWtUY01Nc0xRdUZTRGcyKzVa?=
 =?utf-8?B?NjRnNFA0eVVoaHZDQVRKcnVRYlFGWkdUQmRmekMwaGdhLzBJbFlzajByK3dW?=
 =?utf-8?B?Q2toOWczdzFoMlowZW1ET1RZSGdPOHd5Y2lSNFFkaGkwZUs3aE1meTNwVUtv?=
 =?utf-8?B?emRkWkNoNDE4VGhXZ2Q1TmV6ZjgyOVVpaTUybEpMb2liSS9rWWdHc0dKKzVq?=
 =?utf-8?B?WTV5ZjBtWEtnTVBVc2tMNGVwZXV3RHAyMmk4eFJSRGpEeU1PYlltaTI0SEZF?=
 =?utf-8?B?U2llbnVlcGErUVNNZFRhNnh2S0ltdnBZVUh2MWc1SzZmK09YeTB1VEI1NDJS?=
 =?utf-8?B?K0N6OTU1Mkl1dTY0YVFWaHI3bnU2TFM1a09DVkRGaUs3VmU4YTJyVU1HcUI0?=
 =?utf-8?B?cDNxSnQ5VHNHcEZnYzNkT2NWVkpweGsyTTVVSlMyY0RUL3pZQjg4TE9oOUR1?=
 =?utf-8?B?M2FLeTJINGtQNWNmSXhFNVRWZTlRN3JvcEJTS1dvaUU3cjB5QlVlNkZvVndY?=
 =?utf-8?B?bEVJU2JTSjdiMG1aSzJSQklZTDIyVzYzRVRyU0lZN205cHBPMUZWUXhvbUlU?=
 =?utf-8?B?dVVhcktOV0lNSFQrcXphRlJaRWF0dlJXaEVYaU5mZkQ2emZHSUM1TjZOTzJL?=
 =?utf-8?B?cys1RS90V040Q1hzQzl3UGpvQ2p3NU9KaS94RTJlSS9EQUdYNEdpN3lFbXI4?=
 =?utf-8?B?VS94SzRvZzQrcTlEeTRGVVc3Zi9PMGRGcElwd1NWUDNGaUtBYW9VSDFhL21C?=
 =?utf-8?B?Nld5ZTVOdy9iRG95NFVjTllEQ0NCdUt1Qk14c3p0TjVwOWs4QjB2QT09?=
X-Exchange-RoutingPolicyChecked:
	ySY9rqc1AiOkWebhin5A+rnG02NugJ3GqmIeqRW9ti/tktMXAu+el8nkKGf5474kTm0frBn2oArTiemWLcAWJjJfMS7gS2GdANunUb2ou7eYl0iun7ZBSUUDpUJSaxXYPe9NrnoRZgQfiJbSufUrd8MPqPJbL+eeemIdI1mA00gI7AJb89QFutQxPP/wScpnllETDUWaI4mV6R971Ct4AcFK3IEoHCEZJ4QWYXkqgRbpP8NMe8N4AhRcFANqSgWbfJvvatQoLpQjk3msFC9btY7Mt+FW1oHSNVIZmigQhG+DZYSDuQJ/ucPSEqH9WmRnZcByKSbfdMkluw/UBNTstA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c817777-cf12-4538-0202-08df356c4a01
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6560.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 03:25:32.7495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikb9USGXbSs9MuhjAAdqD79zb5/tJWc7sfHYn89IrL3xFbz3dk7PA/Zm5VGk7g+RbJbvjphQCGkb9+ogsw58MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfX3h7tS5kbNFLU
 DsNOqqq8kvRRiI561hTbJ076a7zp+Tqkbp3H3YnKuU04F6fgnz0WfStNBbe7MFTqqmTdusyIHbo
 6kvbyUKaNFzvkCvypuIfoj+2tPjOvq5hSaVseV4eqm27A3BbD9kp
X-Authority-Analysis: v=2.4 cv=B8csQ+tM c=1 sm=1 tr=0 ts=6ae2bcb1 cx=c_pps
 a=8Uv1ePJK+YeJzHcGDdU98w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=pGLkceISAAAA:8 a=2-qHV3JZGYcR51ue7CUA:9
 a=QEXdDO2ut3YA:10 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-GUID: p6XX7NE0ZQSuimzYmikM2mwn6dGJHcwp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfX9yf4aUuBbAIX
 VbEfMHRiVdAdBVjna+DUkZvMvSubcDn74Tqa8GrHXjuryqQASQ3qh502BKwctruKvBpb1+Bgp/O
 CXBiWs/M8864+7ulu6PLX+fFgLxjvqirAOyy4dWec9GacYkycKy6IBbzxjoBv6RuCZSmGh7Fg4g
 KvqpUOQ3nz0CZ2KSDymtqmA3cNkSsxMbjcYWrE8gr/NXohBg343c0zzldU7AduPtYXW8rK/Ft2k
 N5idrGQf+5Kv4UphGKsda3yh4hjbSAL5NKbmykWJwAR7Aez3YgNljA26PzP8r7LXdGIglNYEUpM
 Kuzh2ZNkmo6OapxCKZl7BqGF2HcwpKn0R98hoxUFqouYoBfOBP4wINJzMmCfna9LTUe98l2yHA1
 ba443TibXjNcp+BIgPrNZrkNxtiiQUE+Rkatl06m3dDEpolziW8doFJJc/vgYW4UcSd4ua0jLDX
 D0ZmsyocvLGMj4Z4MMg==
X-Proofpoint-ORIG-GUID: p6XX7NE0ZQSuimzYmikM2mwn6dGJHcwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290011

On 10/24/26 06:35, Christian Aurich Zanettini Martins wrote:
> Commit da4391c496fe ("ntfs3: release ni_lock before dir_emit in
> ntfs_readdir to fix deadlocks") drops ni_lock before calling
> ntfs_read_hdr() in ntfs_readdir(). If either call returns non-zero,
> execution jumps to out, which calls ni_unlock() even though the lock
> is no longer held.
> 

The issue does indeed exist in the current linux-next (next-20261027),
but it was not introduced by da4391c496. When da4391c496 was committed
on July 1, fb058ccff57 had not yet been applied; fb058ccff57 was only
applied on October 8. This patch made the following changes (directly
altering the position of the out label):

-out_unlock:
+out:
         ni_unlock(ni);

-out:
         kfree(name);
         put_indx_node(node);

The issue is caused by a conflict between two patches from different
time periods.

> This also happens when getdents64() fills the supplied buffer,
> triggering a lockdep "bad unlock balance" warning.
> 
> Jump to out_free instead to avoid unlocking an already released lock.
> 
> Reported-by: syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5c0ed4f2974a8b100ed4
> Fixes: da4391c496fe ("ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix deadlocks")
> Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
> ---
> Based on Paragon's ntfs3 master (da4391c496fe), also in linux-next.
> 
> Tested in QEMU with lockdep. A 128-byte getdents64() buffer
> reproduced the warning before the fix. After the fix, no warning
> occurred when reading root-only and 700-entry directories,
> including four concurrent readers and a writer.
> 
>   fs/ntfs3/dir.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
> index b54828735d55..45d6a41a7222 100644
> --- a/fs/ntfs3/dir.c
> +++ b/fs/ntfs3/dir.c
> @@ -563,7 +563,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>                   */
>                  err = ntfs_read_hdr(sbi, ni, &root->ihdr, 0, pos, name, ctx);
>                  if (err)
> -                       goto out;
> +                       goto out_free;
> 
>                  ni_lock(ni);
>                  bit = 0;
> @@ -607,7 +607,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>                                      ((u64)bit << index_bits) + sbi->record_size,
>                                      pos, name, ctx);
>                  if (err)
> -                       goto out;
> +                       goto out_free;
> 
>                  ni_lock(ni);
>          }
> @@ -615,6 +615,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>   out:
>          ni_unlock(ni);
> 
> +out_free:
>          kfree(name);
>          put_indx_node(node);
> 
> base-commit: da4391c496fedc1ca78a99907712f2256ce8fb80

