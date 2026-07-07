Received: from mx0a-00756801.pphosted.com (mx0a-00756801.pphosted.com [205.220.170.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502BE4314B0
	for <ntfs3@lists.linux.dev>; Tue,  7 Jul 2026 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.170.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440619; cv=fail; b=YJnVXKGYZRbjXOsSDNOwrqG/3rWTKroFqUo3wlWVrr7bR93N9T4S79MOvM7/+oH2BuN49V+ACn718zEOkFpXJTwpHf+n/0KNhABO4jykJjgttcQBzoBNO8N3Z8i+ql6qrjTzs8q1maeZop2/CTvM312LoIc+9+3hu8mSI8CJ71k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440619; c=relaxed/simple;
	bh=GbgcvKyyIcVbTX4HzdeyRa41UG1VW4gIRoEwffmoC+o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VIkYKJ9rCLyQraZlTy+Pd98SUi1Skaw5tFq6XMNTYVT0s/2UG5cgjK5Q/MhGrHfWOKWW1gDK0Gpjvb4cCsAgcY1sZEGm8Va1jYvjwpN76z6jDF8VHK1Hxqq+g8+8bO2KS3bq3X8Pkk2pZA8cJE1U+BtuXlffKk7eWafdBP4bwFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nozominetworks.com; spf=pass smtp.mailfrom=nozominetworks.com; dkim=pass (1024-bit key) header.d=nozominetworks.com header.i=@nozominetworks.com header.b=FTrtkUFh; arc=fail smtp.client-ip=205.220.170.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nozominetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozominetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nozominetworks.com header.i=@nozominetworks.com header.b="FTrtkUFh"
Received: from pps.filterd (m0297686.ppops.net [127.0.0.1])
	by mx0a-00756801.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FVeCR3568649;
	Tue, 7 Jul 2026 08:49:50 -0700
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11023123.outbound.protection.outlook.com [52.101.83.123])
	by mx0a-00756801.pphosted.com (PPS) with ESMTPS id 4f71292ag9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNX7GDQNsvo2ZUAA++uxAMObXnr59cDU/lShDw3vmi/Ht+nvn33/gJeY9NcEjZOb/wtphGmhVYwfhlVKCjiamTpUbjJKOdP5afal9BMFBgArs5XmwGErmkpCjLL12JwMIDJYJNhMx678yh2N6gY34XCtminy2GeomH5Wo9XJh+LBd4NVoCP/yNUvqUJHe53J3/FJgVldpCxr9XvujVREKgp9g8TUQiOf76Mzrl9UqAH50vkhgT4MWc4rTGcUpNlb1j283dtKmjurf3BjJj3LEKLM1DzPszTjhCLavrqJR1+mToLKrUPpc2Y9WVsl0Am+h1Z9kmW7C6S6misH9cKtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbf9OxHb9/f6aZMjZRHs4zvJ1AQXqfbfZ6vXeqzzUO0=;
 b=u2IRpT41/TRjOOAsF2J/qcjXzOUmE70T0H5orqzLtKJl3T2UGQp2NBNswN+sMuQZy37u//CfgCz5YBd0bATAW1SzyJ+mfrfKLw8mkJ/sYgtQIFeZILAZqxfo+gIYf7p+z7dyAGDoyvaBQYWFkI4ZD1Jv6UWFAHzvn17HAdDs6juqhAPj2TvfikkV2eKDLbb+DRbH5YqFS1TTe6NjyZvWtq31Sk8RZ3KkXWpHVJv+Bw6U2Y91nrDoHl1ib962MAC6plCIkLcS4eb225hOBautRI265GV2/b5kdy95FeRTYmTz6Rx1DKJax/dxVBduquVLpWja2hSxVpaHOI8lLrUUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nozominetworks.com; dmarc=pass action=none
 header.from=nozominetworks.com; dkim=pass header.d=nozominetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozominetworks.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbf9OxHb9/f6aZMjZRHs4zvJ1AQXqfbfZ6vXeqzzUO0=;
 b=FTrtkUFhkDcynJ6HcLnk7BsRa3t1tvcIXvq2WWjiWRiEUggfsNh0to/dvWMdNtEcMT2wxo3B2dZKjyjchTHZcFaWjgCjXJ80b/1tdZVFNz1omMnrcO84DrvupXSoXlWAa14tisOg0vapeyOrqa0YWm79GnAzi5YKbpgYU0Px7vA=
Received: from VI0PR03MB11174.eurprd03.prod.outlook.com
 (2603:10a6:800:2f8::12) by VI0PR03MB11444.eurprd03.prod.outlook.com
 (2603:10a6:800:338::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 15:49:46 +0000
Received: from VI0PR03MB11174.eurprd03.prod.outlook.com
 ([fe80::478a:c992:bbc3:ca3f]) by VI0PR03MB11174.eurprd03.prod.outlook.com
 ([fe80::478a:c992:bbc3:ca3f%6]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 15:49:46 +0000
From: =?iso-8859-1?Q?Alexandro_Cal=F2?= <alexandro.calo@nozominetworks.com>
To: "almaz.alexandrovich@paragon-software.com"
	<almaz.alexandrovich@paragon-software.com>
CC: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Subject: [PATCH] fs/ntfs3: Fix OOB write if ret == buf_len in
 ntfs_utf16_to_nls()
Thread-Topic: [PATCH] fs/ntfs3: Fix OOB write if ret == buf_len in
 ntfs_utf16_to_nls()
Thread-Index: AQHdDig81bujxfK+z02pAdX05YVcLA==
Date: Tue, 7 Jul 2026 15:49:46 +0000
Message-ID: <3EFE7695-DA5B-4A28-8E39-4853BBA784FC@nozominetworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR03MB11174:EE_|VI0PR03MB11444:EE_
x-ms-office365-filtering-correlation-id: 6a5d4eb0-062f-463b-e714-08dedc3f5ea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|56012099006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 rKrhb6KFG0WmSzjjKpvy/IP/6Hf+3AOxbhjDuQaANM/IaSErI4SxvIOyJ8b6nNxi1mDSdg2jQB6FrFUK9M/QBW/naFfzufPFnOQMN2oCPIzsxBzSMcVnUUfDiEC5N2tdLNZviT+S8qRiZtwZUMxwffLsl+IEeXQoO5A7iiPhGx2N3ZNffQ0Oe6e5hEtCQ+sXRCsQC0FxK18SpxjTLB4esTiUs7KVW1COd+W+3LocI3UoSIrs43mUj0/m2tj15d645lpiRBlM/FiIUfEqtQxv1C+WyrAd+Xy7ZKrvQc4qdg1O3ns248Xexv3toiWbHtlm4+syJBaL6/zorFwbJK/I7Qi5mGLCmZl32mbVNqDmG+GxdRTj47+g/EQ0I1GYN+ATBIEx4rlrkOMYYLpCYLDC2NNngbaAIBHUeIk2GlMIdqZEX611TEaIWM6xVSEWppReBCtCXOOghc57RISDamUqWFU6X7TQROT1KhTW73K1E1zyljbS0ogd8J6POwzSy83SihL9k8Fb4bLTEyIkSdMllpwZdqnNl+QRGXDzfiO5MW/0A8CKyzwMi5PHfPhwt2ZU1h6dqpUqwvDIfHVnqrO1L1w0xmjc1oTYan+HrghVYtgBERJqBqMcp8Pb0/r1Uyu69NRjgVQFq++W2wRfSU62AX5XdKizjdQKqDfcU73hLjzcK1lw2gCks61orReHBdjG3sF8DITrZAQJxSXyvIA98Efc3vZ3Z/P5IbwrcpZqk9Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB11174.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7GzCvZAeOIkSk8KQHRKjLUzbASEcW3utF46s/GqPrOLs1NHTHpMkSOsZto?=
 =?iso-8859-1?Q?W/nOUXXDXoqmkbJFOeWcYdVQTFt8NuyhdQ6DV+yA+VLBLSGaowsg1TbCxp?=
 =?iso-8859-1?Q?+m0Jz+vxKZyPxdebBymxD4V3vJdGSYxnfJjT/GFP6FyUH6DiZM2jsQ3teV?=
 =?iso-8859-1?Q?LbDSLU5YA7qmDgkQU5ehvKNzVcwn5Oa5NjFHKqSluCctFp5oUqmb4MOU5B?=
 =?iso-8859-1?Q?AVAfHX6Wam+a7Pz87OQnRq80zp7npivSw5UdC1bE886sLJ2miJj81c4US0?=
 =?iso-8859-1?Q?hRFXF+rKfA5Q6/z/DVYO3Y39Q/NOK9n8KN4V8gor9BYnCsvuMzQ2YvZa7K?=
 =?iso-8859-1?Q?eXkZnaEbfVLAKFYW8zEUTnFDsjZqMeaM4qn8l7ktN7zhfe//1Io5T0BN6A?=
 =?iso-8859-1?Q?xaeLCvjt2jNAC/iRIzcorCklq5IHFDndzJ8dS29tGY7l7gycvQcGR0zr87?=
 =?iso-8859-1?Q?T+/HySCEi/c+eD8xU3B08QVUH2vD3QWbwrfgrcln9hPucAh03IDRkA8j3+?=
 =?iso-8859-1?Q?5i0b/lDAmm/tfiio5t0CRehKy35e2gnEBLkQNz8AqZaGAosqUlzclFqUvp?=
 =?iso-8859-1?Q?1/cCg0pWlBVyIhjtn3LxUK/eEDG4eAd/rBhFjfEfdy8+sGk76GUyeT8HZF?=
 =?iso-8859-1?Q?Fr22AsarGdmsLIlMqLkw1N8RChQ12EdHck+RU2ZX146EC7RatvpNUPYFRW?=
 =?iso-8859-1?Q?4+js1bMUdqqxLzl88/zO3R919vpTXOwF9FZhwm9dq32YpqUqh8IiPE+bi7?=
 =?iso-8859-1?Q?JQ5lgQbJl9LzBIRwMK4qR9SobVgO3MGSVbUGHBRCrSDo3CQmslYvx8Hi/y?=
 =?iso-8859-1?Q?xz8Ea97uyrGpY1buDGGJJKa8JSCIg90mCvXVl9PwirLKS2bdqETfuhsAXR?=
 =?iso-8859-1?Q?g1RDBz+FEUh7vsdNY2pbwbpJmGR8EXTMVCgbR/9pk+fMbxxCHXiIIzYWK6?=
 =?iso-8859-1?Q?lDuPZQMsn6SthTxx+f00XZ+gYNMEgbeTm6F1hhSddM4u+hswsenV973wPH?=
 =?iso-8859-1?Q?F072aUy1Jl+/vuChyMO3jvhB3U9pIfmTga3pmo5sgGQ4ZYy4+jMNiMClML?=
 =?iso-8859-1?Q?KW6yy5JtB5BuDxi3tc960LJSkH2Mh/qGbbZ2xaZysGmYJGnbTnXKrKxVJY?=
 =?iso-8859-1?Q?aokvyQQHsn60JDgCxs653BnHDZ6D363GZtTxa2Z/YoGYOXJu8Dun+0rdWr?=
 =?iso-8859-1?Q?4qh4GIw9oNRhDG6PfXHWxZxUPozIWGi6Ct25GduU9Z5FNUd6YGlP2yw2/7?=
 =?iso-8859-1?Q?3hGPpdF2trA/AFcYqI49lAzw+0iZPNsMJ1Xvz1eeqNBxJW7GZfCgpIK+ur?=
 =?iso-8859-1?Q?YhlSkhtoBG0HP2k70DSZREjmMcUz+cSVlBxPmk4P1i/ZBRzJZ5VECkgIFo?=
 =?iso-8859-1?Q?nQINLJpS499hiVtE/YqpEKyOpSUTJwrjdyMJ6IR7dfysaayDnu6q19lVD6?=
 =?iso-8859-1?Q?tPcKWoXh7YBHD9wWEGHJ+dJWC2i2xosihsiRdSRPe6ch7Ebui/KRTzhY2I?=
 =?iso-8859-1?Q?bLDjSsU89jizhvLVBOoO/a8JLJ4vv/ruhznoisN78OczAiO0z6nZ8VYJpx?=
 =?iso-8859-1?Q?JVoTE3oakpfJxLpiXwATvlIrIy8MhgBQvcEPHQX8GqKYMhopFwIuUyebUI?=
 =?iso-8859-1?Q?0LfJ1fB1juBfL0GiJ0tDcy7E4/JZSVhzXw5cRR92aSIc1vRebkpbZ5ea52?=
 =?iso-8859-1?Q?MoF1gliwdbBHqF2ULedcbRBaGpOpWDA5f9n35JKPT37J65vn08Z6TERj3d?=
 =?iso-8859-1?Q?LNXelr77uGwAFJZ2+DFPRKSHyy+AsPWbcox6WMozcOH+d+8V5g39uAxqkw?=
 =?iso-8859-1?Q?TrxJ8tLL62yQ4nWR2MlPga8oOq8XXtxKahgSIonwcr6ptf3V76kd?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F0644FF2A9A77947AEA30675CE85A722@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	oSsqFKfDMCIhHNN7HXABdGrKyBEPeaPGn6QfWPlyyRJum3lyFn1ilVdaGYR0mustbtafE0O1tmh34dWxfNZH48OyBniemXKqbNpDAtFZu5zu9Pc80UhxyC2lDqgEu1pXhZWvkYnfcQq1jnfh8YVWAIGb5YpS7stwiMwoHew4sGyiTuEolo0M+vMJETghDRIWy7QRtmTvdj+eBmcyUM5CR2pfEP6k3VCZepD0ny/FXxFmufvl0L+vMR3zKQA2MXc5TPVqqzoQWfGUyzBRVTW77KbqMwRAHrXAgPcW5WRJ2MuW0VpRaSrUfWSvEx433YClZHO2A/didIO1GRHcTvxdQA==
X-OriginatorOrg: nozominetworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB11174.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5d4eb0-062f-463b-e714-08dedc3f5ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 15:49:46.1471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f04d14b-0796-4b81-b7fd-779778e05341
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fNI8F3Mt9p4cCbenIKXf2uLZx0kU55pkFN9f4VTd8qq5y860CZbt7qkkGvM7mmsJXBqNlmVehDOCejSAdTIUwRxiqpKKmvRsgZiyCy65uqtozbeBpXuLNRKYmbR+KnyV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11444
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a4d201e cx=c_pps
 a=kkVcju+c1AJ4DxjShw6lNA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=LLPZWm0_0O8A:10 a=nBHfkqHukZMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7VS2YgxpqphC4cixgVMD:22 a=iLFNfmxFs0q4OnAKpmcp:22
 a=GqK9ZfNKAAAA:8 a=WuupQeJbqeAzYhjWwBgA:9 a=wPNLvfGTeEIA:10
 a=BFatPaWxP-aY11LYkd1a:22
X-Proofpoint-ORIG-GUID: JiMYX9Rs3c4BNFDFaoflUQ1xtjvmTETg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE1NSBTYWx0ZWRfXxs65G7X67wB1
 3jdPr6B6/1e800NElZsWaq1yH0Ctwgo6lqTubSO/6Lc30er8s6AOanJLwphsNCNkkGCQr7pO5g2
 eN103ByvRJMIISSOD1YpRdmMq7fYDrc8IhO8rZKMCaTcag3x/98E
X-Proofpoint-GUID: JiMYX9Rs3c4BNFDFaoflUQ1xtjvmTETg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE1NSBTYWx0ZWRfXzdukSpUiz16C
 Op8v0llBP3X+E1sihHWrJDYJNWF7YzLymLAFLvciQbGwfr3lIBFz2eEP42+T8wZ9CsA3f8nPkay
 hvuShhkK+VIfrX3e2eaXLnNNH6ygF8KQDGT+uZXGIVyvG4hNjCLgJcMqcgOhSUFM8see3c6v8F8
 zoFm8h0G+7bC3q6w3+0NRIgdj23P4wOx4pic33uDtl2NlFwlfpb0e+9nk6UArgbOOG+XBFmyCnB
 5580EXLWEQ54tMtbPSyH8FpwSB+mxFKpsIBlg6PIZPK6ny5L0vnaKlkUzREDOiuPvIxcH/xtqFC
 XS3YFZm5OqMrxiDFZ5fixD9fWju12EqY9sKz33ZfZZwGsGKTGsg6sdmx+r6Cfpvsy9tlayYXbzI
 qiNZ2zvsvrcrNar0kTTebnO54ytL0K4FbJp1AuvktvOK/QvOB5AuaXyjQHHtNvuBTwnPbupmMiS
 9fFd5vjq1cDE64MSuiA==

From 711162530c2cdc4f4930b5a08db0093e6618a26d Mon Sep 17 00:00:00 2001
From: Alexandro Calo <alexandro.calo@nozominetworks.com>
Date: Tue, 7 Jul 2026 16:23:48 +0200
Subject: [PATCH] fs/ntfs3: Fix OOB write if ret =3D=3D buf_len in ntfs_utf1=
6_to_nls()

'utf16s_to_utf8s()' is documented to return at most 'buf_len', the caller
does not check whether 'ret =3D=3D buf_len' before writing the terminator.
The 'buf[ret] =3D '\0'' could write a NULL terminator one byte past the
buffer.

Fix this up by limiting ret to the last valid buffer index before writing
NULL.

As long as 'utf16s_to_utf8s()' never return a negative value and
'buf_len' is guaranteed to be nonzero the patch is fine.

Anyway, as defensive fixes, if(ret<0) and if(buf_len=3D=3D0) could be added=
.

Signed-off-by: Alexandro Calo <alexandro.calo@nozominetworks.com>
---
 fs/ntfs3/dir.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 873d52233003..93949b8352d8 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -29,6 +29,9 @@ int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __l=
e16 *name, u32 len,
 		/* UTF-16 -> UTF-8 */
 		ret =3D utf16s_to_utf8s((wchar_t *)name, len, UTF16_LITTLE_ENDIAN,
 				      buf, buf_len);
+        if (ret >=3D buf_len) {
+            ret =3D buf_len-1;
+        }
 		buf[ret] =3D '\0';
 		return ret;
 	}
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
--
2.47.3=
