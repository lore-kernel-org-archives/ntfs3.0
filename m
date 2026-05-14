Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013043.outbound.protection.outlook.com [40.93.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1777626FA7A
	for <ntfs3@lists.linux.dev>; Thu, 14 May 2026 23:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778801265; cv=fail; b=EAvhc4ZoWOZRamDptUSZ4SloQLau/Lr+pld7TB1YIQbGlnCcBzs4H+wGbrKF4s6Wj+wvJRAjIDlwTUghmDmpZFTvbP1YMMgEEu9uAPlJ7FS4+SPuzrjAevqwid8Q93AlkZQ5zRMe0X6EdDyJCH68A5Wk8CO/ewivKX9GvYs4pIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778801265; c=relaxed/simple;
	bh=DTYIuiClsbfIttljXcKNLaWf7hgegqxYzBr+ivgqf1c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PBDUZA68Pt8qrAQfBYRG8Ev2XSCnvqjS6CiMKWRPV5+ESWc4SKrikOKN60fYE20vfF4gwN0SenExIPuJVCA58jKPuQUuFPtyjJrXii256H8DREQARa3sBGqsCp07qnwzlMI+ffkhTNSY+bXlf+pMTQclj7RUqnPeWRfISkP3oa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kDYuhHp/; arc=fail smtp.client-ip=40.93.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kDYuhHp/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXot9098iiBGhuLtmSnq+ErUEloDnea57eGX7pqTvuCtMkOIfB8WAzdFrrs+x/gketijFpTiPvFYrNrLc5slDd0TVxsWiphTT1ohOOEZP+KlEMNz7l5vl1o+Pldza6/w40bogJ7itJtb/dalwmgSh5gJ64FL1CfrbAJqAcPiGM1NP87LiCfZFmKDJO2of5k4phO4JOZcXA0WyxC6o+lbxKfOiFzzvyUV6cSY/rASxdbIzNENcYNdJtFUQrx2Votr6viKKZ6tCsUIhNLJNzncLZ2EStIMtx1sduslDA3Cwmm5a8yNX1I+YV+GktUUGNC2EVxXG3kINuhWruN0BmiyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTYIuiClsbfIttljXcKNLaWf7hgegqxYzBr+ivgqf1c=;
 b=rRZTu8cU7I0mdJbu1fi0QIb4wk3PCSquuzVWwUKG11p3AL5T3nKYOSTGlfS0pTzyIxDcyJEpNXuK4iJf3FEXYyrIRVQ54Sh//K7tn/xgoLIxDAQ9jvRq8ScsUkMcOc9qdvorUTOY9Jchtc7Ol/XzUyhpK46baILtpKWUCQWe4iUCxDp8FwcSWp4yDkt69zkCyqNa1m7LPe4KttDCoF0OzLIDydwNE+YSlcVh5UxxSgAOj/S8nme5PEVaNKtGq2HuEVm45vNpSnd8g6BPcQo4f53hp3KY7KXqFSJ8pZdKYfKOhEnOADfg+WVf82JofvC72PJTmKBKByJbQUdAVrrJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTYIuiClsbfIttljXcKNLaWf7hgegqxYzBr+ivgqf1c=;
 b=kDYuhHp/UR3D+C9g15mvM7t4B1KXVmdlJXh+bSnmyjaGEytKM5v4kOrQB7TmgnswGN0MsUBl8Px2Q8SnC9mPu4Ne+bKmMmwzsqsHfe2hdUVDtx8jUqAjbEZKoAs/fBqFOArOFPxXdDOxrtapucPqYOJ/NLp2OYcQPuiKfmprEcN1GZCgYZEqJCqiJeRUHPzQj4gc1aPos71PlQRBs7CS8B4Nzt4kg4Unu31DMnzfZxsJrshHrK9Mme1vtVSRDjKdsKH5TL2gdUM48m8epfaxXF2VcxblXsVpCte0hNL9ulmmpvpXFFfbtkQyn6AHbXX57dNAGxlqLngSxlMDkbbADQ==
Received: from DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12)
 by LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 23:27:40 +0000
Received: from DS0PR12MB8442.namprd12.prod.outlook.com
 ([fe80::c4df:b439:571:4591]) by DS0PR12MB8442.namprd12.prod.outlook.com
 ([fe80::c4df:b439:571:4591%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 23:27:40 +0000
From: Matt Ochs <mochs@nvidia.com>
To: Jamie Nguyen <jamien@nvidia.com>
CC: "almaz.alexandrovich@paragon-software.com"
	<almaz.alexandrovich@paragon-software.com>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] fs/ntfs3: fix mount failure on 64K page-size kernels
Thread-Topic: [PATCH] fs/ntfs3: fix mount failure on 64K page-size kernels
Thread-Index: AQHc1zAQyAC+X+y8nU6ja7rFQraqvLYORBWA
Date: Thu, 14 May 2026 23:27:40 +0000
Message-ID: <07B56930-040D-4DA2-A62A-D82CE7EBDECB@nvidia.com>
References: <20260428154549.11902-1-jamien@nvidia.com>
In-Reply-To: <20260428154549.11902-1-jamien@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8442:EE_|LV8PR12MB9155:EE_
x-ms-office365-filtering-correlation-id: 66066921-7acc-4378-da6b-08deb210644f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|11063799003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 6zOpeGicnG6yHo9OoAnmPYabbWqOR1JUgLsHRVl1JRaAkBj53B56nGehq4WCiF2ffeGVv5l7BM4Fz87OfOpFjvzXFJJUq4yCyc/7/qQP6Ql11z+NMC4YsXxj0jZK79/belvNo8f7wW9ITEnZkW/yDPzJyzTcEzHHAbKDbhA4LuXwmXIo16qGnxc+JOy7GNg+MPqfRoEHXNdSO/BpkbBvMPO9JVjESeTIloNEppZ2PJFA9EccPnF9LHHSuG/ZS5hLuMRtLXY04aEfFDyWjverNNPADDztKVg84MOCev12GnV760rG8g1PDJnS65hpga7LU1EQu2re2/L5g2j/rBhlitw6zjQsk6KrMlzg6sIJMBR2Ka9cJ7NrWN3ZJJG2vxtHqqPr0wEMgsYa4LPu1jwB4+Mx7n/CgLtYq6JAi2zMEhnCtz6R8nHerxQKhN8JlhZTqge71XttFXVUpb/eHg5yHCR5L9hGUsQ8lDHra3bq15ry+fXx19LhzBn7fxLDCNi3NhPgbP8dpjp6fAHU0+5FWwFYIJMlq9UNUTBuNjLe3vYf8AfeYFR+52PezSUe0kv3NkfA1/VIkodK52Q14JLS1W3RurUZHp1FuZvb8jvctBnIhXNiYr92evk/6B6AQD9/6uVT3U05Jm6O2rYJBCEhOoD2FlAIp8M3gmW3qEdiW40uoEwuWHveWFL9nqta3fHx9I2eGAqhGvsz93zw9Otw1r1TitPVciITVvmohsnEDZcDayDgP4RHh7I4zc8HwBEs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8442.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FaESQY+UWsCK6vpq3nlJOEmovsOXf6p3oyJLUAUYpDKQtbs0xMh8w8va2Q8+?=
 =?us-ascii?Q?Qairr/cWZ9NW6oyJHvLPdedFZgrJL+ndmUl8Ai87gbm7OMc6PEkRmL560Q++?=
 =?us-ascii?Q?gqGNiokjnt6hD6Wg3p0dxVuhpBUg31WrdmDcISegNBo/QG7Th6j0lxBUlMB1?=
 =?us-ascii?Q?gTopZf15QKnNOjkSXcx7Cv71HfAiwQYy7ZSACBzJoF0NwhOt5zqV6C1eURpu?=
 =?us-ascii?Q?Ten8aMX2NA8XgescBR7669brd1iRl3G0meX62a1mrcOTcX/hBufLYs+vHeeq?=
 =?us-ascii?Q?RP07k47CbSe/lQBprpvyRDlergR0qciQXsOK9S4xZiYZ6uMPrJaBHlbDP70v?=
 =?us-ascii?Q?5XvusP+xtkP6n2H0cioJPkwaC5IlvNZMTXXC5bk8n3mM+cek7mmL7RLUJ4bs?=
 =?us-ascii?Q?VSRpw4MHhnR42Q03gZlj1zUvO43wJEKloVQEfUwqflenZ+Wi4eNms2jR7Zyi?=
 =?us-ascii?Q?f72X9scv46q+kfLrbIA3RvC/sFUshfDtF0E81DSzormOIIYU8EUDvzOkcOqH?=
 =?us-ascii?Q?A/msPdlZgvOnIlPJFaLDfex/4AbNh45ECnLAQdvTVLjxGh/tgShjQFySJOha?=
 =?us-ascii?Q?Em0C+YXaGnB9FFpajMz1AkQP/ozmL6wH4TzAo8C1pF8eFOcG2DG8iyBZ+Tva?=
 =?us-ascii?Q?uYE1POMehJ9oGglBnTkUI00ccU+OXx0bToCFQ+xFe5DWbf35NqEaOfVWVp7M?=
 =?us-ascii?Q?1C2C2s0G7PYHIR1U/IJ9+/g8DS7OISWuOZDRfsFzPfcgkmDgu/ygB/rg+PCw?=
 =?us-ascii?Q?f6o8JoOPkgwyVdWI1MW9WQiul9413+kAPHD3+/gGrg1WHoIzQbmmbZO6LBvy?=
 =?us-ascii?Q?nYNZRXu6qWz/eWYdV4QV1p+HRccQPzSkhaw4U+nisJs/Ykb5k3huxrXg+ucG?=
 =?us-ascii?Q?2R+hCbWpIbjOFR23lL8kuw0QRhO7AwrtSZCp4fQ89x1cxr4fhh4sI+iegT2o?=
 =?us-ascii?Q?DgmEeRmiNVeSfenRUgKj5GOqRc7hiLHVM5aIX8U9M9OzONsLrjSCsk3Dmt46?=
 =?us-ascii?Q?Cpw07rStGsPLtz+egmk42p6FJEZtMxELamTsTfgDDE5PdfQpb8ATkUMdFM9p?=
 =?us-ascii?Q?hEDXUdgt/L1rpJs0ucvY3a9MBT4NVRZ0zqsb2EbZNBlqmT0Ncy7kw6VK2oTk?=
 =?us-ascii?Q?tttJiS2M0u2bvGQRUd2iOh/87a9HVN989ydGJhe6KrYnCTJd1x2VuUGrv/sy?=
 =?us-ascii?Q?2OQ/neHmex+EBcb08tfA7fL33oOCM6QLGX7b/freHV3n1DsJBdD4mQKrD7D/?=
 =?us-ascii?Q?S3tIk5pK5IB1Wcfie1ZMwyRcXHOTsvrVn5ciYfTNerHZFNu/78GCeLk2xwlw?=
 =?us-ascii?Q?nucdIlZl/ebRTPytRPS+MiJyRI52rsqF+mhgb8xWeDsdXvYMGuJ+Ieula1uU?=
 =?us-ascii?Q?RC1+o1fldVW0kF0cAj67sz4ZhsOIUgwyfa9s7dWLAZufnXfSG9hq3x+3UC1Q?=
 =?us-ascii?Q?Az1Oer2I5CUz8U1xKdHVvCcGwWXSKXKuNe8QYzNXA1xaJF58e25IDN+q/So8?=
 =?us-ascii?Q?kEA1dY3P9gKV/EvrMtY+iHnafMXg8X/XYA/K5TH2aGb75PfxFp55XEQ3LQ4U?=
 =?us-ascii?Q?AhDbIWb2km6pfysIgfp82q3sIPBh/i64QM+HvE5/moEhlpkiGIopH5suGkz5?=
 =?us-ascii?Q?Rk7DVEYIqe49gu6mqNevuo+VRDS+oyoE6uaNEgSlXFLBjo5P3DPaacLTCrwT?=
 =?us-ascii?Q?pbhTVZYaFH8cpjPcasPcTBpj5SRRmqbW5Q+jUxIFtKqiWvjwrQkfoLjA7CB8?=
 =?us-ascii?Q?AT5RBk8DaA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <83432D807E62124F989D874CAA5570C4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8442.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66066921-7acc-4378-da6b-08deb210644f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 23:27:40.4879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUIcy3AV/RpDy5j/IPWrK1V8WtcpT89lC3egRbCqSd+eZIF7AycBb0cGp75AVYAB2ZeYd/ZStCgLEWRnYUjG8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155

> On Apr 28, 2026, at 10:45, Jamie Nguyen <jamien@nvidia.com> wrote:
>=20
> On 64K page-size kernels, mounting NTFS volumes smaller than ~650 MB
> fails with EINVAL. The issue is in log_replay(): the initial log page
> size probe uses PAGE_SIZE (65536) instead of DefaultLogPageSize (4096)
> when PAGE_SIZE exceeds DefaultLogPageSize * 2.
>=20
> This makes norm_file_page() require the $LogFile to be at least
> 50 * 65536 =3D 3.2 MB, but mkfs.ntfs creates a $LogFile of only ~1.5 MB
> for a typical 300 MB volume. norm_file_page() returns 0 and the mount
> is rejected with EINVAL.
>=20
> On 4K kernels the #if guard evaluates to true, so use_default=3Dtrue is
> passed and DefaultLogPageSize (4096) is used, requiring only ~200 KB.
> This path works fine.
>=20
> Fix this by always passing use_default=3Dtrue, which forces the initial
> probe to use DefaultLogPageSize regardless of the kernel's PAGE_SIZE.
> This is safe because, after reading the on-disk restart area, log_replay(=
)
> already re-adjusts log->page_size to match the volume's actual
> sys_page_size.
>=20
> Also fix read_log_page() to pass log->page_size instead of PAGE_SIZE to
> ntfs_fix_post_read(), matching the actual buffer size.
>=20
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>

Tested with 4k and 64k page sizes.

Tested-by: Matthew R. Ochs <mochs@nvidia.com>
