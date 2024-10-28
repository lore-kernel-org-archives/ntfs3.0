Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50FA1865EA
	for <ntfs3@lists.linux.dev>; Mon, 28 Oct 2024 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730109619; cv=fail; b=Q7lXw8om3gRdayjf+XOoYz08/9eL4AAY38axVVvNFrhr6hWjxqsWVDMrI07Y8BDckhE6sGi1VtzlclUk3t7KdYxdLhnsY4aoIyKF6C/mYOFNIj4Vqo8QfrcAH2dLpVg9MYI3dAUqR4EEMXZ3ECVsxaW5Q8uxef4sYMWorxcree4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730109619; c=relaxed/simple;
	bh=ACKXqluaxhzeiOGAa1HwMxNLuy7/VeE/IhwotNpA1iM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=E3kHfpw1lnKKo4cl1SAUZvqEhtglCxnlhq3ChtpzHYGSnP1vYWyVr/Gl0RwVim2+AlK5+qu7BO4i7w85QSsglRUBjkYqKUQyNigCual/xx4rg0FFsEK0WDgfioy5KIGQMakvg8cdazNGW2lv7J1xOT0jKlO4eFMuOVT6ZT35XYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bosch.com; spf=pass smtp.mailfrom=bosch.com; dkim=pass (2048-bit key) header.d=bosch.com header.i=@bosch.com header.b=s0i9YluG; arc=fail smtp.client-ip=40.107.20.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bosch.com header.i=@bosch.com header.b="s0i9YluG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsnH9UT5XDMbt+cnp8cegts+wAUC5XrUhu/QGOwUuL1GHSd6uGczYFC93T0WLJyG6NKUCibOgjve6K6phsRytDraY0SfQ+gbhqfq9MpWGqdHVCUJg8ebj0HEICav99+6cfPzdbBJB8TjjGd3wdxVdMbqchi0NVfzFBFeespJrWVu5uLA/waygckv8jfgmNT0Jm922wx3uga8ZE4z0uxllR8HtZFZFMVdXCdUM7diBYL3I2IO2sb6xuwiHw9EcAM0XWzuVOpw5Ma3zKgMGFc3wPxsdbhy0nNvyEFlK4bcVf1UAkOwZHVnYZ0iR/aYqymonJfW9jPPJOZbC7mrX7Aq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHPBehsRYafqQqPxAIMlTs2saQG9bGI0DrY2TqY3r1g=;
 b=im8Uf3Gi4yYX8mVph7ws3M1sN7BuONfVLGuoejEZjFcrNAhbOxjBdr5dr0HiakpfaIkbBCSRzRiDo/WmAttBRBpS2GkHOSqHnEYmc3JQ0eGJIY1IbB9lkxJfT8aOxvwi2rc+lFVL2mM5vdj/2tsu1DSAZ/qWYudau+q0EoANa7mZY/6iYRzHyXvJyU7bYNLOZyJG5BOFMqnHdCuuyC0SCg2WIZgnoNZ+WvP9p530LTyVKPLbYpRx5DSrB89OPJXxLhFrhD9iFWJAkWofQ9xk+3X3E1fU11MzdULgN4vp5MUuB5JuvIqhJUadVHtfNADBSECBTaYHHFYr5PQQVczpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bosch.com; dmarc=pass action=none header.from=bosch.com;
 dkim=pass header.d=bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHPBehsRYafqQqPxAIMlTs2saQG9bGI0DrY2TqY3r1g=;
 b=s0i9YluGcGeYHj4O+M6GmTvfVmRCEMNO9HX99Hjz5RQY1Cmg1NvVd9Pr0hsiKBSf077stwdNnNlyFcam5FLsT/MxzOiDEzbOov9W9M1zIGRiLb/f9Aku5FC5Hixg1VbtTRHVJejFkDt2qg8jZedfUA3TLKFi7bVz9Q0SeCawiDFJhuPyxFmcQjyuXft/IbHjmfakp52FyyFtLr0Xffd4zwFF5/TY7SOPbWN06yYq59/ZGBNMlzmzos6SmjoDrl96pZRzBO1dTajZTecBHpIWsGLXZrkYfVQJJqp891XyvT9RHZy5LDhqQ4qEvOUP93gUNB4sYAWBUSmkWclrQyyJPg==
Received: from AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b4::10)
 by AS5PR10MB8121.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:679::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.11; Mon, 28 Oct
 2024 10:00:09 +0000
Received: from AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::53d4:bfc3:bbfd:ab7a]) by AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::53d4:bfc3:bbfd:ab7a%4]) with mapi id 15.20.8114.013; Mon, 28 Oct 2024
 10:00:09 +0000
From: "Sirajudeen Abdul Hussain (XC-CP/ESA2)" <Abdul.Hussain@bosch.com>
To: "almaz.alexandrovich@paragon-software.com"
	<almaz.alexandrovich@paragon-software.com>
CC: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Subject: [BUG] SP/PC alignment exception in ntfs3 driver during "load upcase"
 in ntfs_fill_super on kernel 6.1.75 (ARM64, Android 14)
Thread-Topic: [BUG] SP/PC alignment exception in ntfs3 driver during "load
 upcase" in ntfs_fill_super on kernel 6.1.75 (ARM64, Android 14)
Thread-Index: AdspGVomRtTc19iwQxunRdgLpEKUDQ==
Date: Mon, 28 Oct 2024 10:00:09 +0000
Message-ID:
 <AS8PR10MB689056B898B3AF8A8D9D7180EB4A2@AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6890:EE_|AS5PR10MB8121:EE_
x-ms-office365-filtering-correlation-id: 54adc1b3-a581-400c-9dfc-08dcf7374ee9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xA1lBqJPFdwiiLcj5Grxx4KHC3yfF2U+7HVWpEOaZLesvmJygaTGRHfq4QnQ?=
 =?us-ascii?Q?+CiPBF5hkrVztdZRHHpPANP8S+iEyf8WGut5weHXO2nxMcSNRdow8q10qs13?=
 =?us-ascii?Q?JuTblEx7hflxbzyWxebVRLHj5JBOMrp2rx+IKPFs5YjocXAZxkUUSqBD0ojE?=
 =?us-ascii?Q?lUmYhSAu1yVXVBL3p08xQnqToKxXNrSnpXAkGXBL8ZhbyIvm4TwVcuL/KY0b?=
 =?us-ascii?Q?VwPRe0zmpaLkhlzjp1p0szNlMhBpOsV6OAoz9zhpeMXDxuga9GGQjCnfI1dq?=
 =?us-ascii?Q?MbRUrRyGUb3Wt9xE6l9sp75yDNMGvBO20EEmMMmAMN3SEwpc48vaYmPlM1ek?=
 =?us-ascii?Q?X8GL532vikI9DwrEx1dVXh75Z5OrM6uqvtJtIm5bhluyk4PoCVKEvw2mITcn?=
 =?us-ascii?Q?NmhwpigE+wOACoYw+C7JLRBRq/ElpTKbsE8mQAHdc2vDCOqWq45GqXcyDMk/?=
 =?us-ascii?Q?rSIeDaPYUqZx5g2a3Vr+1tpZpVwbZLms84XO9mX0NtBjCbTMjIAjCo5SVPbN?=
 =?us-ascii?Q?vNZ5szdpcuTvaeWl2D8oQn3fsJE6oaPLr24BRv9v5F4ap/PBoYTex/upIJa8?=
 =?us-ascii?Q?pmfinHhIk8QLGnwcizKFezhGOAEzTF1Pbt3HfgAhSUpdDo8s/efleg10JA/S?=
 =?us-ascii?Q?g1zFJZFvEKWZNZSB997tN5WUl84lLK0M/EiZ9i2GxyU2+yGQ6h70dmWwGx9M?=
 =?us-ascii?Q?DvsPytmebl4dy3xnXQ/ykYn69LN2eGjQJ78216DFYf59UazdZStU/qEMBu6U?=
 =?us-ascii?Q?JPK91M8nhEA9OWOWQcNwyD+VhEaDjNQVWCcQVU9+z3YziFheyLP2V1uSWjES?=
 =?us-ascii?Q?FHyIU0+ddI4Nf7X2c7fjCqRBfsNBCFQNGlg5phNQnTPFGb304QjvqI+/BGZJ?=
 =?us-ascii?Q?jV13DogrsAn1unli3UxVhrOkSHJWnH8RYhoZh8iIWsUrip6hk6mCqq1dGIZG?=
 =?us-ascii?Q?w05FNIzEzcffx4/FvAYpVGrL2RAG8/pYLgaNWDwhh92KwWRwUzGmbUtgiSTI?=
 =?us-ascii?Q?xVMVVmM52HtgAwxWIjS3MjNHImoUGXRZX1oMiLStE60Pw8g3Zgja2O4jbx2J?=
 =?us-ascii?Q?BePpfXQHiaQGiM3427M9tmtNmTXO5kpXSY+ULkjalDm3pjgNRaagGehZn4wZ?=
 =?us-ascii?Q?I/A12sskcVKIdMd2gdsw0AUp/9ZCvIguUAoimcn4keIqfuhCgN2d7f0Qel5k?=
 =?us-ascii?Q?pQATUX8NlU31xJpZ4OkDJajDU9j8DT6wl0iPaJGX0IY9wMLR8PFYMIgZ6MDH?=
 =?us-ascii?Q?oX6ETUUrzv1M80AyrXf/VKpZRd86WzPvbEgGDVUMEoVx+OvlMmDPXF+yVrnj?=
 =?us-ascii?Q?DkfVoP/zSy3jtorP9FWSQvCOuagYpY8RkWUIRvSUjMmTdMYeliF2UwKu02wY?=
 =?us-ascii?Q?CvuwBchscWjEN7d0Ko9gkaOChVHl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LSnl/FgiuZnVCXtlu0HjlzO3Kg3nXpshQGVExe1Q36RvWpL+9X8mznNK7kTQ?=
 =?us-ascii?Q?xy00+J65/84MwcwO9oLUvAS2TydCC7/6siqwz7QulpOzBbKHA6YvqPwu2nNl?=
 =?us-ascii?Q?oMIBVYoJk1hS1PbkOzYKRT9WsaPPtCKod7/fbipI8OjbPPAB2ZW5Y+dD1MWC?=
 =?us-ascii?Q?BnwKfcThn8c7cGjDl783kVJoLzAENpI9EgiMsACi6J61X73cS4M5UlfPlhHB?=
 =?us-ascii?Q?JZ7//CpzTdrS5O/ResJPVFxgAA556SeNozE1sveemZM3HIazX53OYmxNVc8e?=
 =?us-ascii?Q?cFsnz0xSu4FJCwYw8/W6R2EBBGBlNhhc0pKJNqSI8rg0FE7FXeOVOtE/NTO2?=
 =?us-ascii?Q?12oCH3+4vlMU0Mp39SblVqDFTzhl19qfWpRouH3Sbm7HFyzqHRAb91HD3s/6?=
 =?us-ascii?Q?KZpCC+qdS0ydpqRbnVMVLzcEpfU9HQcMIq+vTEfyCr+suX17pH6apTg8xBem?=
 =?us-ascii?Q?b2c8nSVdl9KzF+KAumN5MNFb5r/M1CUNuKBc2fWt2jfW5oQpQMGBokRTl30Z?=
 =?us-ascii?Q?bga3qt/H03idjK2qCeZAd9I070wC1TURjVTNZA6sv7pEzSmcpmer6bi9lIaW?=
 =?us-ascii?Q?/stNyrqTE+iWmkc5/7qYUcvstcfj7X8AR+bhDJJkutsyK+qq9Fcjwonr/HWx?=
 =?us-ascii?Q?mbjbjHlaIy4dVnyikqIhzNLsXpnv9HbVHVahs+mMpZ5cz9cNdrxKonki1ah8?=
 =?us-ascii?Q?sK16gaaOEcgybPsTftLiLnIzIjjw3nkmemVpz5cojfelMlJ8KX/kF+xKvldZ?=
 =?us-ascii?Q?T9EhcJKITbVwduBgMxr55jA5oEYu6Dx5w2hHdVdrEg6hCAKylchOBCD/XAPV?=
 =?us-ascii?Q?/f4NKSS5wjN/3FIH2LpikMmjpE7LQt9y567AoGjX72sSxpPg74deL06cwwSG?=
 =?us-ascii?Q?GLHtWrcq9al8tUX2hL3RK8kgmd61QDzAMFYutykPYDBSrra5jVuX6KlTMa3Q?=
 =?us-ascii?Q?r5CRCcVbcfgyOZSrDQ4MH4gyNZIUFTo8h9oMrud1/pRnGYBC4BgIOv2YDoxq?=
 =?us-ascii?Q?UKj2yx2SG5i0eLodC2tryyoGNBTap5OgEur/rAW/81KHA7eDoaEXv2jxGNnR?=
 =?us-ascii?Q?h+qGNtcQeHr6aKLh9Ff7rwr/z9lQt8bf6OusI7EMwLlsOVPkSHn2eWXygYEG?=
 =?us-ascii?Q?50sM9FfaVMp7Y40T9NgdEZhD+G+EdD0VuFToDJ8pZWwPRu0aKFp7a1P4Lx7J?=
 =?us-ascii?Q?AXt/gBAQw3srsmtotkxy+Exrs0mZILYeiGCP/esNPmTf7Xa0Qou5N8SwAS1J?=
 =?us-ascii?Q?rNN/PXUF1rvP/VgtUy1ucJpKA3LwCsUyotol1GSKlVdpFVx1BCSokRaomYRA?=
 =?us-ascii?Q?6EbgiTljtFIM8cDxgAujYKdB84K2V6TIYXKTsTufXc/nQGGjz9lmy3ryezxv?=
 =?us-ascii?Q?NyS1f5kKh3RCk5O1kyFTgoqQWJ+Db+lu13XqxSXgclcoWRpVYc23pkMiWqWP?=
 =?us-ascii?Q?qxQhB/8D5JPjHqRNNPU81cStyIuQH7Ftav+8KDvxvv5hvu5595I6eNSSt3HI?=
 =?us-ascii?Q?HYR00f9JsblSlA+/DuG2KxNvqFZVTPCt3lWgpcqHgeGnihrPlV1dK/rb5Sz5?=
 =?us-ascii?Q?t3Jl8LRKoOVyPQrWnCQ=3D?=
Content-Type: multipart/mixed;
	boundary="_005_AS8PR10MB689056B898B3AF8A8D9D7180EB4A2AS8PR10MB6890EURP_"
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54adc1b3-a581-400c-9dfc-08dcf7374ee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 10:00:09.8682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ehXsrQBf5W0/z+r6EZOcOc75IyVAGj7MFiA0cGjshDzyuzLwNtLSO84vg+XvBT3Hcd4AmJFcFoZgYQHplV5wgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8121

--_005_AS8PR10MB689056B898B3AF8A8D9D7180EB4A2AS8PR10MB6890EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Linux Kernel Developers,

I've encountered a bug in the `ntfs3` driver on ARM64 (Android 14) running =
kernel 6.1.75. The issue causes a "SP/PC alignment exception" when repeated=
ly connecting and disconnecting an NTFS-formatted USB drive. I've narrowed =
down the issue to the "load upcase" sequence in the `ntfs_fill_super` funct=
ion, where it follows a CFI (Control Flow Integrity) failure.

To assist with debugging, I've attached debug patches I used for additional=
 print statements in the `ntfs3` driver, as well as the `dmesg` log generat=
ed with these patches applied. I hope this will provide more insight into t=
he specific code path leading to the exception.

**System Details:**
- Kernel Version: 6.1.75
- Platform: ARM64 (Android 14)
- Filesystem Driver: ntfs3

**Steps to Reproduce:**
1. Continuously connect and disconnect an NTFS-formatted USB drive.
2. The system attempts to mount the drive during each connection cycle.
3. After several cycles, an internal kernel error with "SP/PC alignment exc=
eption" occurs.

**Debug Information:**
- dmesg log (excerpt):
[ 1648.852629][ T7081] usb 1-1.3: new high-speed USB device number 30 using=
 xhci-hcd
[ 1648.877711][ T7081] usb 1-1.3: New USB device found, idVendor=3D0781, id=
Product=3D5406, bcdDevice=3D 0.10
[ 1648.879405][ T7081] usb 1-1.3: New USB device strings: Mfr=3D1, Product=
=3D2, SerialNumber=3D3
[ 1648.880347][ T7081] usb 1-1.3: Product: U3 Cruzer Micro
[ 1648.881198][ T7081] usb 1-1.3: Manufacturer: SanDisk Corporation
[ 1648.882368][ T7081] usb 1-1.3: SerialNumber: 0000060433033898
[ 1648.897487][ T7081] usb-storage 1-1.3:1.0: USB Mass Storage device detec=
ted
[ 1648.900691][ T7081] scsi host0: usb-storage 1-1.3:1.0
[ 1649.938489][ T7081] scsi 0:0:0:0: Direct-Access     SanDisk  U3 Cruzer M=
icro  2.17 PQ: 0 ANSI: 2
[ 1649.941108][ T7081] scsi 0:0:0:1: CD-ROM            SanDisk  U3 Cruzer M=
icro  2.17 PQ: 0 ANSI: 2
[ 1649.948972][    T8] sd 0:0:0:0: [sda] 4001425 512-byte logical blocks: (=
2.05 GB/1.91 GiB)
[ 1649.954376][    T8] sd 0:0:0:0: [sda] Write Protect is off
[ 1649.960464][    T8] sd 0:0:0:0: [sda] No Caching mode page found
[ 1649.961201][    T8] sd 0:0:0:0: [sda] Assuming drive cache: write throug=
h
[ 1649.993850][    T8]  sda: sda1
[ 1649.995863][    T8] sd 0:0:0:0: [sda] Attached SCSI removable disk
[ 1650.318110][T10248] CFI failure at __wake_up_common+0xdc/0x168 (target: =
migration_entry_wait_on_locked+0x2a7/0x2a8; expected type: 0x7a243236)
[ 1650.319407][T10248] WARNING: CPU: 5 PID: 10248 at __wake_up_common+0xdc/=
0x168
[ 1650.320961][T10248] Modules linked in: qca6390(OE) machine_dlkm(OE) nati=
ve_dlkm(OE) platform_dlkm(OE) q6_dlkm(OE) qcrypto_msm_dlkm(OE) boot_marker(=
OE) stub_dlkm(OE) adsp_loader_dlkm(OE) usb_f_qdss(E) vm_cpufreq(OE) hdcp_qs=
eecom_dlkm(OE) apr_dlkm(OE) gnss_sirf(OE) mac80211(E) virtio_video(OE) btpo=
wer(OE) smcinvoke_dlkm(OE) qcedev_mod_dlkm(OE) msm_vm_poweroff(E) cnss2(OE)=
 virtio_snd(E) extcon_usb_gpio(E) dm_bow(E) gm_shmem(OE) qseecom_dlkm(OE) q=
ce50_dlkm(OE) msm_hyp(OE) qti_can(OE) i2c_virtio(E) virtio_npu(E) wallpower=
_charger(OE) wlan_firmware_service(OE) subsystem_notif_virt(OE) msm_cfg(OE)=
 cnss_nl(OE) cnss_plat_ipc_qmi_svc(OE) vfastrpc(OE) sdhci_msm(E) rtc_pm8xxx=
(E) i2c_msm_geni(E) qrtr_mhi(E) ufs_qcom(E) cqhci(E) q6_notifier_dlkm(OE) s=
nd_event_dlkm(OE) tz_log_dlkm(OE) qrtr(E) cnss_utils(OE) qcom_glink_cma(E) =
hdmi_dlkm(OE) cfg80211(E) msm_qmp(E) qcom_rng(E) i2c_dev(E) dwc3_msm(E) phy=
_msm_qusb_v2(E) usb_f_diag(E) ehset(E) dwmac_sunxi(E) msm_sharedmem(E) phy_=
msm_ssusb_qmp(E)
[ 1650.321117][T10248]  marvell(E) usb_f_cdev(E) dwmac_qcom_eth(E) dwmac_ip=
q806x(E) phy_msm_qusb(E) phy_msm_snps_hs(E) dwmac_sun8i(E) dwmac_generic(E)=
 viospmi_pmic_arb(E) dabridge(E) stmmac_platform(E) phy_qcom_emu(E) stmmac(=
E) msm_memshare(E) qcom_spmi_pmic(E) qseecom_proxy(E) phy_generic(E) mdio_m=
ux(E) emac_mdio_fe(E) mhi_dev_uci(E) qcom_soc_wdt(E) pcs_xpcs(E) virtio_inp=
ut(E) mhi(E) spi_msm_geni(E) qcom_iommu_debug(E) qcom_wdt_core(E) msm_geni_=
serial(E) memory_dump_v2(E) qcom_va_minidump(E) spidev(E) clk_dummy(E) pci_=
msm_drv(E) rq_stats(E) qcom_ramdump(E) remount_shmem(E) usb_bam(E) rproc_qc=
om_common(E) pinctrl_sdmshrike(E) pinctrl_sm8150(E) phy_qcom_qmp_combo(E) p=
inctrl_direwolf(E) qcom_glink_smem(E) phy_qcom_qmp_ufs(E) heap_mem_ext_v01(=
E) phy_qcom_qmp_usb(E) pinctrl_sm6150(E) pinctrl_spmi_mpp(E) pinctrl_lemans=
(E) phy_qcom_ufs_qmp_v4_lahaina(E) qcom_glink(E) qmi_helpers(E) pinctrl_mon=
aco_auto(E) smem(E) pinctrl_spmi_gpio(E) pinctrl_msm(E) phy_qcom_qmp_pcie(E=
)
[ 1650.332501][T10248]  phy_qcom_qmp_pcie_msm8996(E) msm_show_resume_irq(E)=
 qcom_pdc(E) phy_qcom_snps_femto_v2(E) phy_qcom_ufs_qmp_v4_waipio(E) phy_qc=
om_ufs_qmp_v4(E) phy_qcom_ufs(E) clk_qcom(E) ntfs3(E) qcom_ipc_logging(E) m=
inidump(E) hci_uart btsdio btbcm 8021q rfcomm l2tp_ppp hidp can_gw nhc_rout=
ing can_bcm l2tp_core can_raw nhc_ipv6 can nhc_mobility nhc_dest btqca nfc =
nhc_udp nhc_fragment nhc_hop mac802154 bluetooth ieee802154_6lowpan aqc111 =
ieee802154_socket diag ieee802154 6lowpan rtl8150 tipc cdc_acm wwan r8153_e=
cm ftdi_sio ax88179_178a usbserial pptp rfkill ppp_deflate cdc_eem slcan bs=
d_comp pppox cdc_ncm ppp_mppe vcan kheaders asix cdc_ether r8152 ppp_generi=
c can_dev usbnet slhc mii zram libarc4 zsmalloc gzvm socinfo_dt(OE) qrng_dl=
km(OE) qcom_ipcc(E) virtio_net(E) net_failover(E) failover(E) virt_arm_smmu=
_v3(E) arm_smmu(E) iommu_logger(E) qcom_iommu_util(E) virtio_console(E) vir=
tio_regulator(E) stub_regulator(E) debug_regulator(E) rename_devices(E) vir=
tio_mmio(E)
[ 1650.341368][T10248]  virtio_blk(E) virtio_blk_qti_crypto(E) debug_symbol=
(E) qcom_hgsl(E) crypto_qti_virt(E) boot_stats(E) mem_buf(E) qcom_dma_heaps=
(E) mem_buf_msgq(E) mem_buf_dev(E) secure_buffer(E) qcom_scm(E) gh_rm_drv(E=
) gh_msgq(E) qcom_scm_hab(E) msm_hab(E) virtio_clk(E) virtio_clk_monaco(E) =
virtio_clk_lemans(E) virtio_clk_direwolf(E) virtio_clk_sa8195p(E) virtio_cl=
k_sm6150(E) virtio_clk_sm8150(E)
[ 1650.355712][T10248] CPU: 5 PID: 10248 Comm: usb-storage Tainted: G      =
     OE      6.1.75-android14-11-maybe-dirty #1
[ 1650.356668][T10248] Hardware name: Qualcomm Technologie, Inc. SA8155 Vir=
tual Machine (DT)
[ 1650.357480][T10248] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[ 1650.358120][T10248] pc : __wake_up_common+0xdc/0x168
[ 1650.358534][T10248] lr : __wake_up_locked_key_bookmark+0x28/0x38
[ 1650.359171][T10248] sp : ffffffc017fbbac0
[ 1650.359983][T10248] x29: ffffffc017fbbac0 x28: 0000000000000020 x27: 000=
0000000000000
[ 1650.360731][T10248] x26: 0000000000000000 x25: ffffffc00a0b8598 x24: 000=
0000000000003
[ 1650.361657][T10248] x23: 0000000000000000 x22: ffffffc00a0b8598 x21: fff=
fffc017fbbb58
[ 1650.362796][T10248] x20: ffffffc017fbbb30 x19: 0000000000000001 x18: fff=
fffc0159e5078
[ 1650.363895][T10248] x17: 000000007a243236 x16: 0000000024323694 x15: 000=
0000000000010
[ 1650.364683][T10248] x14: ffffffc00a0bb888 x13: ffffffc1d7ac4000 x12: 000=
0000000000000
[ 1650.365294][T[qvm] [set_dload_cookie:78] W10248] x11: 0000000000000000 x=
10: 0000000000000001 x9 : ffffffc0081262f4
[ 1650.365921][T10248] x8 : ffffffc0082d6943 x7 : 0000000000000001 x6 : fff=
ffffdefa23070
[ 1650.366512][T10248] x5 : ffffffc017fbbb30 x4 : ffffffc017fbbb58 x3 : fff=
fffc017fbbb58
[ 1650.367561][T10248] x2 : 0000000000000000 x1 : 0000000000000003 x0 : fff=
fffc00a5f3a80
[ 1650.368628][T10248] Call trace:
[ 1650.368977][T10248]  __wake_up_common+0xdc/0x168
[ 1650.369365][T10248]  __wake_up_locked_key_bookmark+0x28/0x38
[ 1650.370219][T10248]  folio_wake_bit+0x9c/0x140
[ 1650.371357][T10248]  page_endio+0xfc/0x1d0
[ 1650.371855][T10248]  mpage_end_io+0xa8/0xf0
[ 1650.372236][T10248]  bio_endio+0x1a8/0x1cc
[ 1650.372506][T10248]  blk_update_request+0x138/0x39c
[ 1650.372980][T10248]  scsi_end_request+0x34/0x2f4
[ 1650.373687][T10248]  scsi_io_completion+0x54/0x134
[ 1650.374084][T10248]  scsi_finish_command+0xc4/0xdc
[ 1650.374549][T10248]  scsi_complete+0x78/0x164
[ 1650.375234][T10248]  scsi_done_internal+0x6c/0x13c
[ 1650.376210][T10248]  scsi_done_direct+0x1c/0x2c
[ 1650.376754][T10248]  usb_stor_control_thread+0x1c0/0x280
[ 1650.377712][T10248]  kthread+0x10c/0x1dc
[ 1650.378285][T10248]  ret_from_fork+0x10/0x20
[ 1650.379304][T10248] ---[ end trace 0000000000000000 ]---
[ 1650.379792][T10248] Internal error: SP/PC alignment exception: 000000008=
a000000 [#1] PREEMPT SMP
[ 1650.380607][T10248] Modules linked in: qca6390(OE) machine_dlkm(OE) nati=
ve_dlkm(OE) platform_dlkm(OE) q6_dlkm(OE) qcrypto_msm_dlkm(OE) boot_marker(=
OE) stub_dlkm(OE) adsp_loader_dlkm(OE) usb_f_qdss(E) vm_cpufreq(OE) hdcp_qs=
eecom_dlkm(OE) apr_dlkm(OE) gnss_sirf(OE) mac80211(E) virtio_video(OE) btpo=
wer(OE) smcinvoke_dlkm(OE) qcedev_mod_dlkm(OE) msm_vm_poweroff(E) cnss2(OE)=
 virtio_snd(E) extcon_usb_gpio(E) dm_bow(E) gm_shmem(OE) qseecom_dlkm(OE) q=
ce50_dlkm(OE) msm_hyp(OE) qti_can(OE) i2c_virtio(E) virtio_npu(E) wallpower=
_charger(OE) wlan_firmware_service(OE) subsystem_notif_virt(OE) msm_cfg(OE)=
 cnss_nl(OE) cnss_plat_ipc_qmi_svc(OE) vfastrpc(OE) sdhci_msm(E) rtc_pm8xxx=
(E) i2c_msm_geni(E) qrtr_mhi(E) ufs_qcom(E) cqhci(E) q6_notifier_dlkm(OE) s=
nd_event_dlkm(OE) tz_log_dlkm(OE) qrtr(E) cnss_utils(OE) qcom_glink_cma(E) =
hdmi_dlkm(OE) cfg80211(E) msm_qmp(E) qcom_rng(E) i2c_dev(E) dwc3_msm(E) phy=
_msm_qusb_v2(E) usb_f_diag(E) ehset(E) dwmac_sunxi(E) msm_sharedmem(E) phy_=
msm_ssusb_qmp(E)
[ 1650.380772][T10248]  marvell(E) usb_f_cdev(E) dwmac_qcom_eth(E) dwmac_ip=
q806x(E) phy_msm_qusb(E) phy_msm_snps_hs(E) dwmac_sun8i(E) dwmac_generic(E)=
 viospmi_pmic_arb(E) dabridge(E) stmmac_platform(E) phy_qcom_emu(E) stmmac(=
E) msm_memshare(E) qcom_spmi_pmic(E) qseecom_proxy(E) phy_generic(E) mdio_m=
ux(E) emac_mdio_fe(E) mhi_dev_uci(E) qcom_soc_wdt(E) pcs_xpcs(E) virtio_inp=
ut(E) mhi(E) spi_msm_geni(E) qcom_iommu_debug(E) qcom_wdt_core(E) msm_geni_=
serial(E) memory_dump_v2(E) qcom_va_minidump(E) spidev(E) clk_dummy(E) pci_=
msm_drv(E) rq_stats(E) qcom_ramdump(E) remount_shmem(E) usb_bam(E) rproc_qc=
om_common(E) pinctrl_sdmshrike(E) pinctrl_sm8150(E) phy_qcom_qmp_combo(E) p=
inctrl_direwolf(E) qcom_glink_smem(E) phy_qcom_qmp_ufs(E) heap_mem_ext_v01(=
E) phy_qcom_qmp_usb(E) pinctrl_sm6150(E) pinctrl_spmi_mpp(E) pinctrl_lemans=
(E) phy_qcom_ufs_qmp_v4_lahaina(E) qcom_glink(E) qmi_helpers(E) pinctrl_mon=
aco_auto(E) smem(E) pinctrl_spmi_gpio(E) pinctrl_msm(E) phy_qcom_qmp_pcie(E=
)
[ 1650.388807][T10248]  phy_qcom_qmp_pcie_msm8996(E) msm_show_resume_irq(E)=
 qcom_pdc(E) phy_qcom_snps_femto_v2(E) phy_qcom_ufs_qmp_v4_waipio(E) phy_qc=
om_ufs_qmp_v4(E) phy_qcom_ufs(E) clk_qcom(E) ntfs3(E) qcom_ipc_logging(E) m=
inidump(E) hci_uart btsdio btbcm 8021q rfcomm l2tp_ppp hidp can_gw nhc_rout=
ing can_bcm l2tp_core can_raw nhc_ipv6 can nhc_mobility nhc_dest btqca nfc =
nhc_udp nhc_fragment nhc_hop mac802154 bluetooth ieee802154_6lowpan aqc111 =
ieee802154_socket diag ieee802154 6lowpan rtl8150 tipc cdc_acm wwan r8153_e=
cm ftdi_sio ax88179_178a usbserial pptp rfkill ppp_deflate cdc_eem slcan bs=
d_comp pppox cdc_ncm ppp_mppe vcan kheaders asix cdc_ether r8152 ppp_generi=
c can_dev usbnet slhc mii zram libarc4 zsmalloc gzvm socinfo_dt(OErite to t=
he Boot ) qrng_dlkm(OE) qcom_ipcc(E) virtio_net(E) net_failover(E) failover=
(E) virt_arm_smmu_v3(E) arm_smmu(E) iommu_logger(E) qcom_iommu_util(E) virt=
io_console(E) virtio_regulator(E) stub_regulator(E) debug_regulator(E) rena=
me_devices(E) virtio_mmio(E)
[ 1650.397529][T10248]  virtio_blk(E) virtio_blk_qti_crypto(E) debug_symbol=
(E) qcom_hgsl(E) crypto_qti_virt(E) boot_stats(E) mem_buf(E) qcom_dma_heaps=
(E) mem_buf_msgq(E) mem_buf_dev(E) secure_buffer(E) qcom_scm(E) gh_rm_drv(E=
) gh_msgq(E) qcom_scm_hab(E) msm_hab(E) virtio_clk(E) virtio_clk_monaco(E) =
virtio_clk_lemans(E) virtio_clk_direwolf(E) virtio_clk_sa8195p(E) virtio_cl=
k_sm6150(E) virtio_clk_sm8150(E)
[ 1650.409845][T10248] CPU: 5 PID: 10248 Comm: usb-storage Tainted: P      =
     OE      6.1.75-android14-11-maybe-dirty #1
[ 1650.411601][T10248] Hardware name: Qualcomm Technologie, Inc. SA8155 Vir=
tual Machine (DT)
[ 1650.412344][T10248] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSB

**Configuration:**
CONFIG_NTFS3_LZX_XPRESS=3Dy
CONFIG_NTFS3_FS=3Dm

Attached:
- `ntfs3-debug.diff, usb-storage-debug.diff & page-endio-debug.diff `: Cont=
ains the debug patches used for additional print statements.
- `dmesg_log_with_debug_patch.txt`: The `dmesg` output captured with the de=
bug patch applied.

Please let me know if any additional information is required or if you'd li=
ke further logs.

Thank you,
Abdul Hussain

--_005_AS8PR10MB689056B898B3AF8A8D9D7180EB4A2AS8PR10MB6890EURP_
Content-Type: application/octet-stream; name="ntfs3-debug.diff"
Content-Description: ntfs3-debug.diff
Content-Disposition: attachment; filename="ntfs3-debug.diff"; size=6148;
	creation-date="Mon, 28 Oct 2024 09:36:25 GMT";
	modification-date="Mon, 28 Oct 2024 10:00:09 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2ZzL250ZnMzL2lub2RlLmMgYi9mcy9udGZzMy9pbm9kZS5jCmluZGV4IGRj
OTM3MDg5YTQ2NC4uNGVjYmY0YjZmYTdhIDEwMDY0NAotLS0gYS9mcy9udGZzMy9pbm9kZS5jCisr
KyBiL2ZzL250ZnMzL2lub2RlLmMKQEAgLTU1Nyw2ICs1NTcsNyBAQCBzdGF0aWMgbm9pbmxpbmUg
aW50IG50ZnNfZ2V0X2Jsb2NrX3ZibyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCB1NjQgdmJvLAogCUNM
U1QgdmNuLCBsY24sIGxlbjsKIAlib29sIG5ldzsKIAorCXByX2luZm8oImVudGVyOk5HQlxuIik7
CiAJLyogQ2xlYXIgcHJldmlvdXMgc3RhdGUuICovCiAJY2xlYXJfYnVmZmVyX25ldyhiaCk7CiAJ
Y2xlYXJfYnVmZmVyX3VwdG9kYXRlKGJoKTsKQEAgLTcwOCw2ICs3MDksNyBAQCBzdGF0aWMgaW50
IG50ZnNfcmVhZF9mb2xpbyhzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGZvbGlvICpmb2xpbykK
IAlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gbWFwcGluZy0+aG9zdDsKIAlzdHJ1Y3QgbnRmc19pbm9k
ZSAqbmkgPSBudGZzX2koaW5vZGUpOwogCisJcHJfaW5mbygiZW50ZXI6cmVhZF9mb2xpb1xuIik7
CiAJaWYgKGlzX3Jlc2lkZW50KG5pKSkgewogCQluaV9sb2NrKG5pKTsKIAkJZXJyID0gYXR0cl9k
YXRhX3JlYWRfcmVzaWRlbnQobmksIHBhZ2UpOwpAQCAtNzI0LDcgKzcyNiw2IEBAIHN0YXRpYyBp
bnQgbnRmc19yZWFkX2ZvbGlvKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgZm9saW8gKmZvbGlv
KQogCQluaV91bmxvY2sobmkpOwogCQlyZXR1cm4gZXJyOwogCX0KLQogCS8qIE5vcm1hbCArIHNw
YXJzZSBmaWxlcy4gKi8KIAlyZXR1cm4gbXBhZ2VfcmVhZF9mb2xpbyhmb2xpbywgbnRmc19nZXRf
YmxvY2spOwogfQpkaWZmIC0tZ2l0IGEvZnMvbnRmczMvc3VwZXIuYyBiL2ZzL250ZnMzL3N1cGVy
LmMKaW5kZXggNjA2NmVlYTNmNjFjLi5kYmZkNDJkZTY0NTUgMTAwNjQ0Ci0tLSBhL2ZzL250ZnMz
L3N1cGVyLmMKKysrIGIvZnMvbnRmczMvc3VwZXIuYwpAQCAtOTA0LDcgKzkwNCw5IEBAIHN0YXRp
YyBpbnQgbnRmc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBmc19j
b250ZXh0ICpmYykKIAlzdHJ1Y3QgQVRUUl9ERUZfRU5UUlkgKnQ7CiAJdTE2ICpzaGFyZWQ7CiAJ
c3RydWN0IE1GVF9SRUYgcmVmOworCWludCB0ZXN0X2NvdW50ID0gMDsKIAorCXByX2luZm8oImVu
dGVyOmZpbGxcbiIpOwogCXJlZi5oaWdoID0gMDsKIAogCXNiaS0+c2IgPSBzYjsKQEAgLTkyNCw3
ICs5MjYsNyBAQCBzdGF0aWMgaW50IG50ZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAJCWVyciA9IC1FSU5WQUw7CiAJCWdvdG8gb3V0
OwogCX0KLQorCXByX2luZm8oImNoZWNrOiVkXG4iLCsrdGVzdF9jb3VudCk7CiAJaWYgKGJkZXZf
bWF4X2Rpc2NhcmRfc2VjdG9ycyhiZGV2KSAmJiBiZGV2X2Rpc2NhcmRfZ3JhbnVsYXJpdHkoYmRl
dikpIHsKIAkJc2JpLT5kaXNjYXJkX2dyYW51bGFyaXR5ID0gYmRldl9kaXNjYXJkX2dyYW51bGFy
aXR5KGJkZXYpOwogCQlzYmktPmRpc2NhcmRfZ3JhbnVsYXJpdHlfbWFza19pbnYgPQpAQCAtOTM2
LDcgKzkzOCw3IEBAIHN0YXRpYyBpbnQgbnRmc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9j
ayAqc2IsIHN0cnVjdCBmc19jb250ZXh0ICpmYykKIAkJCQkgIGJkZXZfbnJfYnl0ZXMoYmRldikp
OwogCWlmIChlcnIpCiAJCWdvdG8gb3V0OwotCisJcHJfaW5mbygiY2hlY2s6JWRcbiIsKyt0ZXN0
X2NvdW50KTsKIAkvKgogCSAqIExvYWQgJFZvbHVtZS4gVGhpcyBzaG91bGQgYmUgZG9uZSBiZWZv
cmUgJExvZ0ZpbGUKIAkgKiAnY2F1c2UgJ3NiaS0+dm9sdW1lLm5pJyBpcyB1c2VkICdudGZzX3Nl
dF9zdGF0ZScuCkBAIC05NTEsNyArOTUzLDcgQEAgc3RhdGljIGludCBudGZzX2ZpbGxfc3VwZXIo
c3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQogCX0KIAogCW5p
ID0gbnRmc19pKGlub2RlKTsKLQorCXByX2luZm8oImNoZWNrOiVkXG4iLCsrdGVzdF9jb3VudCk7
CiAJLyogTG9hZCBhbmQgc2F2ZSBsYWJlbCAobm90IG5lY2Vzc2FyeSkuICovCiAJYXR0ciA9IG5p
X2ZpbmRfYXR0cihuaSwgTlVMTCwgTlVMTCwgQVRUUl9MQUJFTCwgTlVMTCwgMCwgTlVMTCwgTlVM
TCk7CiAKQEAgLTk4Nyw3ICs5ODksNyBAQCBzdGF0aWMgaW50IG50ZnNfZmlsbF9zdXBlcihzdHJ1
Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAJc2JpLT52b2x1bWUu
bWlub3JfdmVyID0gaW5mby0+bWlub3JfdmVyOwogCXNiaS0+dm9sdW1lLmZsYWdzID0gaW5mby0+
ZmxhZ3M7CiAJc2JpLT52b2x1bWUubmkgPSBuaTsKLQorCXByX2luZm8oImNoZWNrOiVkXG4iLCsr
dGVzdF9jb3VudCk7CiAJLyogTG9hZCAkTUZUTWlyciB0byBlc3RpbWF0ZSByZWNzX21pcnIuICov
CiAJcmVmLmxvdyA9IGNwdV90b19sZTMyKE1GVF9SRUNfTUlSUik7CiAJcmVmLnNlcSA9IGNwdV90
b19sZTE2KE1GVF9SRUNfTUlSUik7CkBAIC0xMDAyLDcgKzEwMDQsNyBAQCBzdGF0aWMgaW50IG50
ZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAq
ZmMpCiAJCW50ZnNfdXBfY2x1c3RlcihzYmksIGlub2RlLT5pX3NpemUpID4+IHNiaS0+cmVjb3Jk
X2JpdHM7CiAKIAlpcHV0KGlub2RlKTsKLQorCXByX2luZm8oImNoZWNrOiVkXG4iLCsrdGVzdF9j
b3VudCk7CiAJLyogTG9hZCBMb2dGaWxlIHRvIHJlcGxheS4gKi8KIAlyZWYubG93ID0gY3B1X3Rv
X2xlMzIoTUZUX1JFQ19MT0cpOwogCXJlZi5zZXEgPSBjcHVfdG9fbGUxNihNRlRfUkVDX0xPRyk7
CkBAIC0xMDM3LDcgKzEwMzksNyBAQCBzdGF0aWMgaW50IG50ZnNfZmlsbF9zdXBlcihzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAJCQlnb3RvIG91dDsKIAkJ
fQogCX0KLQorCXByX2luZm8oImNoZWNrOiVkXG4iLCsrdGVzdF9jb3VudCk7CiAJLyogTG9hZCAk
TUZULiAqLwogCXJlZi5sb3cgPSBjcHVfdG9fbGUzMihNRlRfUkVDX01GVCk7CiAJcmVmLnNlcSA9
IGNwdV90b19sZTE2KDEpOwpAQCAtMTA2NCw3ICsxMDY2LDcgQEAgc3RhdGljIGludCBudGZzX2Zp
bGxfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQog
CQlnb3RvIHB1dF9pbm9kZV9vdXQ7CiAKIAlzYmktPm1mdC5uaSA9IG5pOwotCisJcHJfaW5mbygi
Y2hlY2s6JWRcbiIsKyt0ZXN0X2NvdW50KTsKIAkvKiBMb2FkICRCYWRDbHVzLiAqLwogCXJlZi5s
b3cgPSBjcHVfdG9fbGUzMihNRlRfUkVDX0JBRENMVVNUKTsKIAlyZWYuc2VxID0gY3B1X3RvX2xl
MTYoTUZUX1JFQ19CQURDTFVTVCk7CkBAIC0xMDg4LDcgKzEwOTAsNyBAQCBzdGF0aWMgaW50IG50
ZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAq
ZmMpCiAJfQogCiAJaXB1dChpbm9kZSk7Ci0KKwlwcl9pbmZvKCJjaGVjazolZFxuIiwrK3Rlc3Rf
Y291bnQpOwogCS8qIExvYWQgJEJpdG1hcC4gKi8KIAlyZWYubG93ID0gY3B1X3RvX2xlMzIoTUZU
X1JFQ19CSVRNQVApOwogCXJlZi5zZXEgPSBjcHVfdG9fbGUxNihNRlRfUkVDX0JJVE1BUCk7CkBA
IC0xMTA1LDcgKzExMDcsNyBAQCBzdGF0aWMgaW50IG50ZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3Vw
ZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAJCWdvdG8gcHV0X2lub2RlX291
dDsKIAl9CiAjZW5kaWYKLQorCXByX2luZm8oImNoZWNrOiVkXG4iLCsrdGVzdF9jb3VudCk7CiAJ
LyogQ2hlY2sgYml0bWFwIGJvdW5kYXJ5LiAqLwogCXR0ID0gc2JpLT51c2VkLmJpdG1hcC5uYml0
czsKIAlpZiAoaW5vZGUtPmlfc2l6ZSA8IGJpdG1hcF9zaXplKHR0KSkgewpAQCAtMTEyMCwxMiAr
MTEyMiwxMiBAQCBzdGF0aWMgaW50IG50ZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAJCWdvdG8gcHV0X2lub2RlX291dDsKIAogCWlw
dXQoaW5vZGUpOwotCisJcHJfaW5mbygiY2hlY2s6JWRcbiIsKyt0ZXN0X2NvdW50KTsKIAkvKiBD
b21wdXRlIHRoZSBNRlQgem9uZS4gKi8KIAllcnIgPSBudGZzX3JlZnJlc2hfem9uZShzYmkpOwog
CWlmIChlcnIpCiAJCWdvdG8gb3V0OwotCisJcHJfaW5mbygiY2hlY2s6JWRcbiIsKyt0ZXN0X2Nv
dW50KTsKIAkvKiBMb2FkICRBdHRyRGVmLiAqLwogCXJlZi5sb3cgPSBjcHVfdG9fbGUzMihNRlRf
UkVDX0FUVFIpOwogCXJlZi5zZXEgPSBjcHVfdG9fbGUxNihNRlRfUkVDX0FUVFIpOwpAQCAtMTE2
NCw3ICsxMTY2LDcgQEAgc3RhdGljIGludCBudGZzX2ZpbGxfc3VwZXIoc3RydWN0IHN1cGVyX2Js
b2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQogCQkJZ290byBwdXRfaW5vZGVfb3V0Owog
CQl9CiAJfQotCisJcHJfaW5mbygiY2hlY2s6JWRcbiIsKyt0ZXN0X2NvdW50KTsKIAl0ICs9IDE7
CiAJc2JpLT5kZWZfZW50cmllcyA9IDE7CiAJZG9uZSA9IHNpemVvZihzdHJ1Y3QgQVRUUl9ERUZf
RU5UUlkpOwpAQCAtMTE4OCw3ICsxMTkwLDcgQEAgc3RhdGljIGludCBudGZzX2ZpbGxfc3VwZXIo
c3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQogCQlzYmktPmRl
Zl9lbnRyaWVzICs9IDE7CiAJfQogCWlwdXQoaW5vZGUpOwotCisJcHJfaW5mbygiY2hlY2s6JWRc
biIsKyt0ZXN0X2NvdW50KTsKIAkvKiBMb2FkICRVcENhc2UuICovCiAJcmVmLmxvdyA9IGNwdV90
b19sZTMyKE1GVF9SRUNfVVBDQVNFKTsKIAlyZWYuc2VxID0gY3B1X3RvX2xlMTYoTUZUX1JFQ19V
UENBU0UpOwpAQCAtMTIwMyw3ICsxMjA1LDcgQEAgc3RhdGljIGludCBudGZzX2ZpbGxfc3VwZXIo
c3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQogCQllcnIgPSAt
RUlOVkFMOwogCQlnb3RvIHB1dF9pbm9kZV9vdXQ7CiAJfQotCisJcHJfaW5mbygiY2hlY2s6JWRc
biIsKyt0ZXN0X2NvdW50KTsKIAlmb3IgKGlkeCA9IDA7IGlkeCA8ICgweDEwMDAwICogc2l6ZW9m
KHNob3J0KSA+PiBQQUdFX1NISUZUKTsgaWR4KyspIHsKIAkJY29uc3QgX19sZTE2ICpzcmM7CiAJ
CXUxNiAqZHN0ID0gQWRkMlB0cihzYmktPnVwY2FzZSwgaWR4IDw8IFBBR0VfU0hJRlQpOwpAQCAt
MTIyNCw3ICsxMjI2LDcgQEAgc3RhdGljIGludCBudGZzX2ZpbGxfc3VwZXIoc3RydWN0IHN1cGVy
X2Jsb2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQogI2VuZGlmCiAJCW50ZnNfdW5tYXBf
cGFnZShwYWdlKTsKIAl9Ci0KKwlwcl9pbmZvKCJjaGVjazolZFxuIiwrK3Rlc3RfY291bnQpOwog
CXNoYXJlZCA9IG50ZnNfc2V0X3NoYXJlZChzYmktPnVwY2FzZSwgMHgxMDAwMCAqIHNpemVvZihz
aG9ydCkpOwogCWlmIChzaGFyZWQgJiYgc2JpLT51cGNhc2UgIT0gc2hhcmVkKSB7CiAJCWt2ZnJl
ZShzYmktPnVwY2FzZSk7CkBAIC0xMjMyLDcgKzEyMzQsNyBAQCBzdGF0aWMgaW50IG50ZnNfZmls
bF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAJ
fQogCiAJaXB1dChpbm9kZSk7Ci0KKwlwcl9pbmZvKCJjaGVjazolZFxuIiwrK3Rlc3RfY291bnQp
OwogCWlmIChpc19udGZzMyhzYmkpKSB7CiAJCS8qIExvYWQgJFNlY3VyZS4gKi8KIAkJZXJyID0g
bnRmc19zZWN1cml0eV9pbml0KHNiaSk7CkBAIC0xMjU0LDcgKzEyNTYsNyBAQCBzdGF0aWMgaW50
IG50ZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4
dCAqZmMpCiAJCWlmIChlcnIpCiAJCQlnb3RvIGxvYWRfcm9vdDsKIAl9Ci0KKwlwcl9pbmZvKCJj
aGVjazolZFxuIiwrK3Rlc3RfY291bnQpOwogbG9hZF9yb290OgogCS8qIExvYWQgcm9vdC4gKi8K
IAlyZWYubG93ID0gY3B1X3RvX2xlMzIoTUZUX1JFQ19ST09UKTsKQEAgLTEyNzIsNiArMTI3NCw3
IEBAIHN0YXRpYyBpbnQgbnRmc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0
cnVjdCBmc19jb250ZXh0ICpmYykKIAkJZ290byBwdXRfaW5vZGVfb3V0OwogCX0KIAorCXByX2lu
Zm8oImV4aXQ6ZmlsbFxuIik7CiAJcmV0dXJuIDA7CiAKIHB1dF9pbm9kZV9vdXQ6Cg==

--_005_AS8PR10MB689056B898B3AF8A8D9D7180EB4A2AS8PR10MB6890EURP_
Content-Type: application/octet-stream; name="usb-storage-debug.diff"
Content-Description: usb-storage-debug.diff
Content-Disposition: attachment; filename="usb-storage-debug.diff"; size=7112;
	creation-date="Mon, 28 Oct 2024 09:36:29 GMT";
	modification-date="Mon, 28 Oct 2024 10:00:09 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3N0b3JhZ2Uvc2NzaWdsdWUuYyBiL2RyaXZlcnMvdXNi
L3N0b3JhZ2Uvc2NzaWdsdWUuYwppbmRleCBjNTRlOTgwNWRhNTMuLmY1NzNkODc3ZGZlZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy91c2Ivc3RvcmFnZS9zY3NpZ2x1ZS5jCisrKyBiL2RyaXZlcnMvdXNi
L3N0b3JhZ2Uvc2NzaWdsdWUuYwpAQCAtMzk0LDYgKzM5NCw3IEBAIHN0YXRpYyBpbnQgcXVldWVj
b21tYW5kX2xjayhzdHJ1Y3Qgc2NzaV9jbW5kICpzcmIpCiAKIAkvKiBlbnF1ZXVlIHRoZSBjb21t
YW5kIGFuZCB3YWtlIHVwIHRoZSBjb250cm9sIHRocmVhZCAqLwogCXVzLT5zcmIgPSBzcmI7CisJ
cHJfaW5mbygibnRmczM6cXVldWVjbWQgcmR5XG4iKTsKIAljb21wbGV0ZSgmdXMtPmNtbmRfcmVh
ZHkpOwogCiAJcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9zdG9yYWdlL3VzYi5j
IGIvZHJpdmVycy91c2Ivc3RvcmFnZS91c2IuYwppbmRleCBlZDdjNmFkOTZhNzQuLmM4NzQxNDYz
MDEwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2Ivc3RvcmFnZS91c2IuYworKysgYi9kcml2ZXJz
L3VzYi9zdG9yYWdlL3VzYi5jCkBAIC00MSw2ICs0MSw3IEBACiAjaW5jbHVkZSA8bGludXgva3Ro
cmVhZC5oPgogI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+CiAjaW5jbHVkZSA8bGludXgvdXRzbmFt
ZS5oPgorI2luY2x1ZGUgPGxpbnV4L2Nkcm9tLmg+CiAKICNpbmNsdWRlIDxzY3NpL3Njc2kuaD4K
ICNpbmNsdWRlIDxzY3NpL3Njc2lfY21uZC5oPgpAQCAtMjk1LDYgKzI5NiwxMDggQEAgdm9pZCBm
aWxsX2lucXVpcnlfcmVzcG9uc2Uoc3RydWN0IHVzX2RhdGEgKnVzLCB1bnNpZ25lZCBjaGFyICpk
YXRhLAogfQogRVhQT1JUX1NZTUJPTF9HUEwoZmlsbF9pbnF1aXJ5X3Jlc3BvbnNlKTsKIAorc3Rh
dGljIHZvaWQgdXNiX3N0b3Jfc2hvd19jb21tYW5kX2FiZHVsKGNvbnN0IHN0cnVjdCB1c19kYXRh
ICp1cywgc3RydWN0IHNjc2lfY21uZCAqc3JiKQoreworCWNoYXIgKndoYXQgPSBOVUxMOworCisJ
c3dpdGNoIChzcmItPmNtbmRbMF0pIHsKKwljYXNlIFRFU1RfVU5JVF9SRUFEWTogd2hhdCA9ICJU
RVNUX1VOSVRfUkVBRFkiOyBicmVhazsKKwljYXNlIFJFWkVST19VTklUOiB3aGF0ID0gIlJFWkVS
T19VTklUIjsgYnJlYWs7CisJY2FzZSBSRVFVRVNUX1NFTlNFOiB3aGF0ID0gIlJFUVVFU1RfU0VO
U0UiOyBicmVhazsKKwljYXNlIEZPUk1BVF9VTklUOiB3aGF0ID0gIkZPUk1BVF9VTklUIjsgYnJl
YWs7CisJY2FzZSBSRUFEX0JMT0NLX0xJTUlUUzogd2hhdCA9ICJSRUFEX0JMT0NLX0xJTUlUUyI7
IGJyZWFrOworCWNhc2UgUkVBU1NJR05fQkxPQ0tTOiB3aGF0ID0gIlJFQVNTSUdOX0JMT0NLUyI7
IGJyZWFrOworCWNhc2UgUkVBRF82OiB3aGF0ID0gIlJFQURfNiI7IGJyZWFrOworCWNhc2UgV1JJ
VEVfNjogd2hhdCA9ICJXUklURV82IjsgYnJlYWs7CisJY2FzZSBTRUVLXzY6IHdoYXQgPSAiU0VF
S182IjsgYnJlYWs7CisJY2FzZSBSRUFEX1JFVkVSU0U6IHdoYXQgPSAiUkVBRF9SRVZFUlNFIjsg
YnJlYWs7CisJY2FzZSBXUklURV9GSUxFTUFSS1M6IHdoYXQgPSAiV1JJVEVfRklMRU1BUktTIjsg
YnJlYWs7CisJY2FzZSBTUEFDRTogd2hhdCA9ICJTUEFDRSI7IGJyZWFrOworCWNhc2UgSU5RVUlS
WTogd2hhdCA9ICJJTlFVSVJZIjsgYnJlYWs7CisJY2FzZSBSRUNPVkVSX0JVRkZFUkVEX0RBVEE6
IHdoYXQgPSAiUkVDT1ZFUl9CVUZGRVJFRF9EQVRBIjsgYnJlYWs7CisJY2FzZSBNT0RFX1NFTEVD
VDogd2hhdCA9ICJNT0RFX1NFTEVDVCI7IGJyZWFrOworCWNhc2UgUkVTRVJWRTogd2hhdCA9ICJS
RVNFUlZFIjsgYnJlYWs7CisJY2FzZSBSRUxFQVNFOiB3aGF0ID0gIlJFTEVBU0UiOyBicmVhazsK
KwljYXNlIENPUFk6IHdoYXQgPSAiQ09QWSI7IGJyZWFrOworCWNhc2UgRVJBU0U6IHdoYXQgPSAi
RVJBU0UiOyBicmVhazsKKwljYXNlIE1PREVfU0VOU0U6IHdoYXQgPSAiTU9ERV9TRU5TRSI7IGJy
ZWFrOworCWNhc2UgU1RBUlRfU1RPUDogd2hhdCA9ICJTVEFSVF9TVE9QIjsgYnJlYWs7CisJY2Fz
ZSBSRUNFSVZFX0RJQUdOT1NUSUM6IHdoYXQgPSAiUkVDRUlWRV9ESUFHTk9TVElDIjsgYnJlYWs7
CisJY2FzZSBTRU5EX0RJQUdOT1NUSUM6IHdoYXQgPSAiU0VORF9ESUFHTk9TVElDIjsgYnJlYWs7
CisJY2FzZSBBTExPV19NRURJVU1fUkVNT1ZBTDogd2hhdCA9ICJBTExPV19NRURJVU1fUkVNT1ZB
TCI7IGJyZWFrOworCWNhc2UgU0VUX1dJTkRPVzogd2hhdCA9ICJTRVRfV0lORE9XIjsgYnJlYWs7
CisJY2FzZSBSRUFEX0NBUEFDSVRZOiB3aGF0ID0gIlJFQURfQ0FQQUNJVFkiOyBicmVhazsKKwlj
YXNlIFJFQURfMTA6IHdoYXQgPSAiUkVBRF8xMCI7IGJyZWFrOworCWNhc2UgV1JJVEVfMTA6IHdo
YXQgPSAiV1JJVEVfMTAiOyBicmVhazsKKwljYXNlIFNFRUtfMTA6IHdoYXQgPSAiU0VFS18xMCI7
IGJyZWFrOworCWNhc2UgV1JJVEVfVkVSSUZZOiB3aGF0ID0gIldSSVRFX1ZFUklGWSI7IGJyZWFr
OworCWNhc2UgVkVSSUZZOiB3aGF0ID0gIlZFUklGWSI7IGJyZWFrOworCWNhc2UgU0VBUkNIX0hJ
R0g6IHdoYXQgPSAiU0VBUkNIX0hJR0giOyBicmVhazsKKwljYXNlIFNFQVJDSF9FUVVBTDogd2hh
dCA9ICJTRUFSQ0hfRVFVQUwiOyBicmVhazsKKwljYXNlIFNFQVJDSF9MT1c6IHdoYXQgPSAiU0VB
UkNIX0xPVyI7IGJyZWFrOworCWNhc2UgU0VUX0xJTUlUUzogd2hhdCA9ICJTRVRfTElNSVRTIjsg
YnJlYWs7CisJY2FzZSBSRUFEX1BPU0lUSU9OOiB3aGF0ID0gIlJFQURfUE9TSVRJT04iOyBicmVh
azsKKwljYXNlIFNZTkNIUk9OSVpFX0NBQ0hFOiB3aGF0ID0gIlNZTkNIUk9OSVpFX0NBQ0hFIjsg
YnJlYWs7CisJY2FzZSBMT0NLX1VOTE9DS19DQUNIRTogd2hhdCA9ICJMT0NLX1VOTE9DS19DQUNI
RSI7IGJyZWFrOworCWNhc2UgUkVBRF9ERUZFQ1RfREFUQTogd2hhdCA9ICJSRUFEX0RFRkVDVF9E
QVRBIjsgYnJlYWs7CisJY2FzZSBNRURJVU1fU0NBTjogd2hhdCA9ICJNRURJVU1fU0NBTiI7IGJy
ZWFrOworCWNhc2UgQ09NUEFSRTogd2hhdCA9ICJDT01QQVJFIjsgYnJlYWs7CisJY2FzZSBDT1BZ
X1ZFUklGWTogd2hhdCA9ICJDT1BZX1ZFUklGWSI7IGJyZWFrOworCWNhc2UgV1JJVEVfQlVGRkVS
OiB3aGF0ID0gIldSSVRFX0JVRkZFUiI7IGJyZWFrOworCWNhc2UgUkVBRF9CVUZGRVI6IHdoYXQg
PSAiUkVBRF9CVUZGRVIiOyBicmVhazsKKwljYXNlIFVQREFURV9CTE9DSzogd2hhdCA9ICJVUERB
VEVfQkxPQ0siOyBicmVhazsKKwljYXNlIFJFQURfTE9ORzogd2hhdCA9ICJSRUFEX0xPTkciOyBi
cmVhazsKKwljYXNlIFdSSVRFX0xPTkc6IHdoYXQgPSAiV1JJVEVfTE9ORyI7IGJyZWFrOworCWNh
c2UgQ0hBTkdFX0RFRklOSVRJT046IHdoYXQgPSAiQ0hBTkdFX0RFRklOSVRJT04iOyBicmVhazsK
KwljYXNlIFdSSVRFX1NBTUU6IHdoYXQgPSAiV1JJVEVfU0FNRSI7IGJyZWFrOworCWNhc2UgR1BD
TURfUkVBRF9TVUJDSEFOTkVMOiB3aGF0ID0gIlJFQUQgU1VCQ0hBTk5FTCI7IGJyZWFrOworCWNh
c2UgUkVBRF9UT0M6IHdoYXQgPSAiUkVBRF9UT0MiOyBicmVhazsKKwljYXNlIEdQQ01EX1JFQURf
SEVBREVSOiB3aGF0ID0gIlJFQUQgSEVBREVSIjsgYnJlYWs7CisJY2FzZSBHUENNRF9QTEFZX0FV
RElPXzEwOiB3aGF0ID0gIlBMQVkgQVVESU8gKDEwKSI7IGJyZWFrOworCWNhc2UgR1BDTURfUExB
WV9BVURJT19NU0Y6IHdoYXQgPSAiUExBWSBBVURJTyBNU0YiOyBicmVhazsKKwljYXNlIEdQQ01E
X0dFVF9FVkVOVF9TVEFUVVNfTk9USUZJQ0FUSU9OOgorCQl3aGF0ID0gIkdFVCBFVkVOVC9TVEFU
VVMgTk9USUZJQ0FUSU9OIjsgYnJlYWs7CisJY2FzZSBHUENNRF9QQVVTRV9SRVNVTUU6IHdoYXQg
PSAiUEFVU0UvUkVTVU1FIjsgYnJlYWs7CisJY2FzZSBMT0dfU0VMRUNUOiB3aGF0ID0gIkxPR19T
RUxFQ1QiOyBicmVhazsKKwljYXNlIExPR19TRU5TRTogd2hhdCA9ICJMT0dfU0VOU0UiOyBicmVh
azsKKwljYXNlIEdQQ01EX1NUT1BfUExBWV9TQ0FOOiB3aGF0ID0gIlNUT1AgUExBWS9TQ0FOIjsg
YnJlYWs7CisJY2FzZSBHUENNRF9SRUFEX0RJU0NfSU5GTzogd2hhdCA9ICJSRUFEIERJU0MgSU5G
T1JNQVRJT04iOyBicmVhazsKKwljYXNlIEdQQ01EX1JFQURfVFJBQ0tfUlpPTkVfSU5GTzoKKwkJ
d2hhdCA9ICJSRUFEIFRSQUNLIElORk9STUFUSU9OIjsgYnJlYWs7CisJY2FzZSBHUENNRF9SRVNF
UlZFX1JaT05FX1RSQUNLOiB3aGF0ID0gIlJFU0VSVkUgVFJBQ0siOyBicmVhazsKKwljYXNlIEdQ
Q01EX1NFTkRfT1BDOiB3aGF0ID0gIlNFTkQgT1BDIjsgYnJlYWs7CisJY2FzZSBNT0RFX1NFTEVD
VF8xMDogd2hhdCA9ICJNT0RFX1NFTEVDVF8xMCI7IGJyZWFrOworCWNhc2UgR1BDTURfUkVQQUlS
X1JaT05FX1RSQUNLOiB3aGF0ID0gIlJFUEFJUiBUUkFDSyI7IGJyZWFrOworCWNhc2UgMHg1OTog
d2hhdCA9ICJSRUFEIE1BU1RFUiBDVUUiOyBicmVhazsKKwljYXNlIE1PREVfU0VOU0VfMTA6IHdo
YXQgPSAiTU9ERV9TRU5TRV8xMCI7IGJyZWFrOworCWNhc2UgR1BDTURfQ0xPU0VfVFJBQ0s6IHdo
YXQgPSAiQ0xPU0UgVFJBQ0svU0VTU0lPTiI7IGJyZWFrOworCWNhc2UgMHg1Qzogd2hhdCA9ICJS
RUFEIEJVRkZFUiBDQVBBQ0lUWSI7IGJyZWFrOworCWNhc2UgMHg1RDogd2hhdCA9ICJTRU5EIENV
RSBTSEVFVCI7IGJyZWFrOworCWNhc2UgR1BDTURfQkxBTks6IHdoYXQgPSAiQkxBTksiOyBicmVh
azsKKwljYXNlIFJFUE9SVF9MVU5TOiB3aGF0ID0gIlJFUE9SVCBMVU5TIjsgYnJlYWs7CisJY2Fz
ZSBNT1ZFX01FRElVTTogd2hhdCA9ICJNT1ZFX01FRElVTSBvciBQTEFZIEFVRElPICgxMikiOyBi
cmVhazsKKwljYXNlIFJFQURfMTI6IHdoYXQgPSAiUkVBRF8xMiI7IGJyZWFrOworCWNhc2UgV1JJ
VEVfMTI6IHdoYXQgPSAiV1JJVEVfMTIiOyBicmVhazsKKwljYXNlIFdSSVRFX1ZFUklGWV8xMjog
d2hhdCA9ICJXUklURV9WRVJJRllfMTIiOyBicmVhazsKKwljYXNlIFNFQVJDSF9ISUdIXzEyOiB3
aGF0ID0gIlNFQVJDSF9ISUdIXzEyIjsgYnJlYWs7CisJY2FzZSBTRUFSQ0hfRVFVQUxfMTI6IHdo
YXQgPSAiU0VBUkNIX0VRVUFMXzEyIjsgYnJlYWs7CisJY2FzZSBTRUFSQ0hfTE9XXzEyOiB3aGF0
ID0gIlNFQVJDSF9MT1dfMTIiOyBicmVhazsKKwljYXNlIFNFTkRfVk9MVU1FX1RBRzogd2hhdCA9
ICJTRU5EX1ZPTFVNRV9UQUciOyBicmVhazsKKwljYXNlIFJFQURfRUxFTUVOVF9TVEFUVVM6IHdo
YXQgPSAiUkVBRF9FTEVNRU5UX1NUQVRVUyI7IGJyZWFrOworCWNhc2UgR1BDTURfUkVBRF9DRF9N
U0Y6IHdoYXQgPSAiUkVBRCBDRCBNU0YiOyBicmVhazsKKwljYXNlIEdQQ01EX1NDQU46IHdoYXQg
PSAiU0NBTiI7IGJyZWFrOworCWNhc2UgR1BDTURfU0VUX1NQRUVEOiB3aGF0ID0gIlNFVCBDRCBT
UEVFRCI7IGJyZWFrOworCWNhc2UgR1BDTURfTUVDSEFOSVNNX1NUQVRVUzogd2hhdCA9ICJNRUNI
QU5JU00gU1RBVFVTIjsgYnJlYWs7CisJY2FzZSBHUENNRF9SRUFEX0NEOiB3aGF0ID0gIlJFQUQg
Q0QiOyBicmVhazsKKwljYXNlIDB4RTE6IHdoYXQgPSAiV1JJVEUgQ09OVElOVUUiOyBicmVhazsK
KwljYXNlIFdSSVRFX0xPTkdfMjogd2hhdCA9ICJXUklURV9MT05HXzIiOyBicmVhazsKKwlkZWZh
dWx0OiB3aGF0ID0gIih1bmtub3duIGNvbW1hbmQpIjsgYnJlYWs7CisJfQorCWRldl9pbmZvKCZ1
cy0+cHVzYl9kZXYtPmRldiwgIkNvbW1hbmQgJXM6JWRcbiIsIHdoYXQsIHNyYi0+Y21kX2xlbik7
CisJLy9kZXZfaW5mbygmdXMtPnB1c2JfZGV2LT5kZXYsICJieXRlczogJSpwaFxuIiwgbWluX3Qo
aW50LCBzcmItPmNtZF9sZW4sIDE2KSwKKwkvLwkgICAgIChjb25zdCB1bnNpZ25lZCBjaGFyICop
c3JiLT5jbW5kKTsKK30KKwogc3RhdGljIGludCB1c2Jfc3Rvcl9jb250cm9sX3RocmVhZCh2b2lk
ICogX191cykKIHsKIAlzdHJ1Y3QgdXNfZGF0YSAqdXMgPSAoc3RydWN0IHVzX2RhdGEgKilfX3Vz
OwpAQCAtMzAzLDkgKzQwNiwxMCBAQCBzdGF0aWMgaW50IHVzYl9zdG9yX2NvbnRyb2xfdGhyZWFk
KHZvaWQgKiBfX3VzKQogCiAJZm9yICg7OykgewogCQl1c2Jfc3Rvcl9kYmcodXMsICIqKiogdGhy
ZWFkIHNsZWVwaW5nXG4iKTsKKwkJcHJfaW5mbygidXNiX3N0b3I6c2xlZXBpbmdcbiIpOwogCQlp
ZiAod2FpdF9mb3JfY29tcGxldGlvbl9pbnRlcnJ1cHRpYmxlKCZ1cy0+Y21uZF9yZWFkeSkpCiAJ
CQlicmVhazsKLQorCQlwcl9pbmZvKCJ1c2Jfc3Rvcjphd2FrZW5lZFxuIik7CiAJCXVzYl9zdG9y
X2RiZyh1cywgIioqKiB0aHJlYWQgYXdha2VuZWRcbiIpOwogCiAJCS8qIGxvY2sgdGhlIGRldmlj
ZSBwb2ludGVycyAqLwpAQCAtMzIwLDYgKzQyNCw3IEBAIHN0YXRpYyBpbnQgdXNiX3N0b3JfY29u
dHJvbF90aHJlYWQodm9pZCAqIF9fdXMpCiAJCQlzY3NpX3VubG9jayhob3N0KTsKIAkJCW11dGV4
X3VubG9jaygmdXMtPmRldl9tdXRleCk7CiAJCQl1c2Jfc3Rvcl9kYmcodXMsICItLSBleGl0aW5n
XG4iKTsKKwkJCXByX2luZm8oInVzYl9zdG9yOmV4aXRpbmdcbiIpOwogCQkJYnJlYWs7CiAJCX0K
IApAQCAtMzc3LDYgKzQ4Miw3IEBAIHN0YXRpYyBpbnQgdXNiX3N0b3JfY29udHJvbF90aHJlYWQo
dm9pZCAqIF9fdXMpCiAJCS8qIHdlJ3ZlIGdvdCBhIGNvbW1hbmQsIGxldCdzIGRvIGl0ISAqLwog
CQllbHNlIHsKIAkJCVVTX0RFQlVHKHVzYl9zdG9yX3Nob3dfY29tbWFuZCh1cywgc3JiKSk7CisJ
CQl1c2Jfc3Rvcl9zaG93X2NvbW1hbmRfYWJkdWwodXMsIHNyYik7CiAJCQl1cy0+cHJvdG9faGFu
ZGxlcihzcmIsIHVzKTsKIAkJCXVzYl9tYXJrX2xhc3RfYnVzeSh1cy0+cHVzYl9kZXYpOwogCQl9
CkBAIC00MTcsNiArNTIzLDcgQEAgc3RhdGljIGludCB1c2Jfc3Rvcl9jb250cm9sX3RocmVhZCh2
b2lkICogX191cykKIAkJaWYgKHNyYikgewogCQkJdXNiX3N0b3JfZGJnKHVzLCAic2NzaSBjbWQg
ZG9uZSwgcmVzdWx0PTB4JXhcbiIsCiAJCQkJCXNyYi0+cmVzdWx0KTsKKwkJCXByX2luZm8oInVz
Yl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgleFxuIiwgc3JiLT5yZXN1bHQpOwogCQkJc2Nz
aV9kb25lX2RpcmVjdChzcmIpOwogCQl9CiAJfSAvKiBmb3IgKDs7KSAqLwo=

--_005_AS8PR10MB689056B898B3AF8A8D9D7180EB4A2AS8PR10MB6890EURP_
Content-Type: application/octet-stream; name="page-endio-debug.diff"
Content-Description: page-endio-debug.diff
Content-Disposition: attachment; filename="page-endio-debug.diff"; size=587;
	creation-date="Mon, 28 Oct 2024 09:36:36 GMT";
	modification-date="Mon, 28 Oct 2024 10:00:09 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL21tL2ZpbGVtYXAuYyBiL21tL2ZpbGVtYXAuYwppbmRleCBlODc0NGFiODYy
ZmQuLjMyMDc0MjdlOGVhYSAxMDA2NDQKLS0tIGEvbW0vZmlsZW1hcC5jCisrKyBiL21tL2ZpbGVt
YXAuYwpAQCAtMTY0Myw2ICsxNjQzLDcgQEAgdm9pZCBwYWdlX2VuZGlvKHN0cnVjdCBwYWdlICpw
YWdlLCBib29sIGlzX3dyaXRlLCBpbnQgZXJyKQogCXN0cnVjdCBmb2xpbyAqZm9saW8gPSBwYWdl
X2ZvbGlvKHBhZ2UpOwogCiAJaWYgKCFpc193cml0ZSkgeworCQlwcl9pbmZvKCIlczpyZWFkLGVy
cj0lZFxuIixfX2Z1bmNfXywgZXJyKTsKIAkJaWYgKCFlcnIpIHsKIAkJCWZvbGlvX21hcmtfdXB0
b2RhdGUoZm9saW8pOwogCQl9IGVsc2UgewpAQCAtMTY1MSw2ICsxNjUyLDcgQEAgdm9pZCBwYWdl
X2VuZGlvKHN0cnVjdCBwYWdlICpwYWdlLCBib29sIGlzX3dyaXRlLCBpbnQgZXJyKQogCQl9CiAJ
CWZvbGlvX3VubG9jayhmb2xpbyk7CiAJfSBlbHNlIHsKKwkJcHJfaW5mbygiJXM6d3JpdGUsZXJy
PSVkXG4iLF9fZnVuY19fLCBlcnIpOwogCQlpZiAoZXJyKSB7CiAJCQlzdHJ1Y3QgYWRkcmVzc19z
cGFjZSAqbWFwcGluZzsKIAo=

--_005_AS8PR10MB689056B898B3AF8A8D9D7180EB4A2AS8PR10MB6890EURP_
Content-Type: text/plain; name="dmesg_log_with_debug_patch.txt"
Content-Description: dmesg_log_with_debug_patch.txt
Content-Disposition: attachment; filename="dmesg_log_with_debug_patch.txt";
	size=31635; creation-date="Mon, 28 Oct 2024 09:36:20 GMT";
	modification-date="Mon, 28 Oct 2024 10:00:09 GMT"
Content-Transfer-Encoding: base64

WyAgNjEwLjY2MTQ4Nl1bIFQ2OTExXSBlbnRlcjpmaWxsDQpbICA2MTAuNjYxOTkzXVsgVDY5MTFd
IGNoZWNrOjENClsgIDYxMC42NjIyMDBdWyAgVDgwOF0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2
MTAuNjYyNDg0XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTAuNjYyOTQ0XVsgVDY5
MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBSRUFEXzEwOjEwDQpbICA2MTAuNjY1NjQ1XVsgVDY5MDhd
IHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTAuNjY2NTc1XVsgVDY5MTFd
IGNoZWNrOjINClsgIDYxMC42NjY3MDRdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYx
MC42NjY5NDhdWyAgVDgwOF0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTAuNjY3MzkwXVsgVDY5
MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTAuNjY4MDM1XVsgVDY5MDhdIHVzYiAxLTEuMzog
Q29tbWFuZCBSRUFEXzEwOjEwDQpbICA2MTAuNjY5NjY4XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2lj
bWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTAuNjY5OTg5XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVw
aW5nDQpbICA2MTAuNjcwMDA2XVsgVDY5MTFdIGNoZWNrOjMNClsgIDYxMC42NzAyNzZdWyBUNjkx
MV0gY2hlY2s6NA0KWyAgNjEwLjY3MDQyNV1bIFQ2OTExXSBjaGVjazo1DQpbICA2MTAuNjcwNzYz
XVsgIFQ4MDhdIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEwLjY3MTU1OF1bIFQ2OTA4XSB1c2Jf
c3Rvcjphd2FrZW5lZA0KWyAgNjEwLjY3MTk2Nl1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQg
UkVBRF8xMDoxMA0KWyAgNjEwLjY3Mzg1MF1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUs
cmVzdWx0PTB4MA0KWyAgNjEwLjY3NDc0Nl1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAg
NjEwLjY3NDgxN11bICBUODA4XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMC42NzYwMTRdWyBU
NjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMC42NzYzMjFdWyBUNjkwOF0gdXNiIDEtMS4z
OiBDb21tYW5kIFJFQURfMTA6MTANClsgIDYxMC42NzgxNTRdWyBUNjkwOF0gdXNiX3N0b3I6c2Nz
aWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMC42Nzg0NDhdWyBUNjkwOF0gdXNiX3N0b3I6c2xl
ZXBpbmcNClsgIDYxMC42Nzg1MTBdWyAgVDgwOF0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTAu
Njc5ODk1XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTAuNjgwMDY5XVsgVDY5MDhd
IHVzYiAxLTEuMzogQ29tbWFuZCBSRUFEXzEwOjEwDQpbICA2MTAuNjgyODUyXVsgVDY5MDhdIHVz
Yl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTAuNjgzMzMzXVsgVDY5MDhdIHVz
Yl9zdG9yOnNsZWVwaW5nDQpbICA2MTAuNjgzNDAxXVsgIFQ4MDhdIG50ZnMzOnF1ZXVlY21kIHJk
eQ0KWyAgNjEwLjY4NDA4OV1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEwLjY4NDM2
NF1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgUkVBRF8xMDoxMA0KWyAgNjEwLjY4NjE0N11b
IFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEwLjY4NjQ0M11b
IFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEwLjY4NjQ5Ml1bICBUODA4XSBudGZzMzpx
dWV1ZWNtZCByZHkNClsgIDYxMC42ODc0NzJdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsg
IDYxMC42ODgxMTNdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFJFQURfMTA6MTANClsgIDYx
MC42ODk5NDFdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYx
MC42OTEwMTJdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMC42OTEwNjldWyAgVDgw
OF0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTAuNjkxOTg2XVsgVDY5MDhdIHVzYl9zdG9yOmF3
YWtlbmVkDQpbICA2MTAuNjkyMjM4XVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBSRUFEXzEw
OjEwDQpbICA2MTAuNjkzODk1XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9
MHgwDQpbICA2MTAuNjk0MTcxXVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTAuNjk0
MjU1XVsgVDY5MTFdIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEwLjY5NDcyNV1bIFQ2OTA4XSB1
c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEwLjY5NTUwMV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1h
bmQgV1JJVEVfMTA6MTANClsgIDYxMC43MDUwNjBdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBk
b25lLHJlc3VsdD0weDANClsgIDYxMC43MDU0MTVdWyAgIFQ5MF0gbnRmczM6cXVldWVjbWQgcmR5
DQpbICA2MTAuNzA2NDUyXVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTAuNzA3MjMy
XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTAuNzA3OTAxXVsgVDY5MDhdIHVzYiAx
LTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjEwLjcxNzg5OV1bIFQ2OTA4XSB1c2Jfc3Rv
cjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEwLjcxODU4OF1bIFQ2OTA4XSB1c2Jfc3Rv
cjpzbGVlcGluZw0KWyAgNjEwLjcyMDMzMl1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsg
IDYxMC43MjA3MTNdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMC43MjEwMDhdWyBU
NjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTAuNzY0Mzc1XVsgVDY5
MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTAuNzY0ODA4XVsgICBU
OTBdIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEwLjc2NTAxN11bIFQ2OTA4XSB1c2Jfc3Rvcjpz
bGVlcGluZw0KWyAgNjEwLjc2NTI1NV1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEw
Ljc2NTQxN11bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMC44
MDQwMzddWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMC44
MDQ2NDddWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTAuODA0ODk1XVsgVDY5MDhd
IHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTAuODA1MTkyXVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtl
bmVkDQpbICA2MTAuODA1NDU0XVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDox
MA0KWyAgNjExLjE0NTEwMV1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4
MA0KWyAgNjExLjE0NjM0OF1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMS4xNDY3
ODVdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMS4xNDcyMDddWyBUNjkwOF0gdXNi
X3N0b3I6YXdha2VuZWQNClsgIDYxMS4xNDc0MjFdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5k
IFdSSVRFXzEwOjEwDQpbICA2MTEuMTg0ODc1XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9u
ZSxyZXN1bHQ9MHgwDQpbICA2MTEuMTg1Mzc4XVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0K
WyAgNjExLjE4NjI5MF1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjExLjE4NjczN11b
IFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjExLjE4NzA3Ml1bIFQ2OTA4XSB1c2IgMS0x
LjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMS4yMjM5NzBdWyBUNjkwOF0gdXNiX3N0b3I6
c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMS4yMjQ2MDhdWyAgVDE5OV0gbnRmczM6cXVl
dWVjbWQgcmR5DQpbICA2MTEuMjI1MzY5XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2
MTEuMjI2NTkwXVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTEuMjI2OTg3XVsgVDY5
MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjExLjI2MjYwMV1bIFQ2OTA4
XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjExLjI2NDEwNV1bICBUMTk5
XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMS4yNjQ1NDhdWyBUNjkwOF0gdXNiX3N0b3I6c2xl
ZXBpbmcNClsgIDYxMS4yNjUwMDNdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMS4y
NjU0NDddWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTEuMzA0
NzUzXVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTEuMzA1
MzE0XVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjExLjMwNjc3Ml1bIFQ2OTA4XSB1
c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjExLjMwNzI1NV1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5l
ZA0KWyAgNjExLjMwODA5MV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTAN
ClsgIDYxMS4zNDMzNDFdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDAN
ClsgIDYxMS4zNDQxMTJdWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTEuMzQ0NTcy
XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTEuMzQ0ODkyXVsgVDY5MDhdIHVzYl9z
dG9yOmF3YWtlbmVkDQpbICA2MTEuMzQ1MTg5XVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBX
UklURV8xMDoxMA0KWyAgNjExLjM2NTc4NF1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUs
cmVzdWx0PTB4MA0KWyAgNjExLjM2NjM1N11bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsg
IDYxMS4zNjY2MjhdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMS4zNjc0MTVdWyBU
NjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMS4zNjc5NjZdWyBUNjkwOF0gdXNiIDEtMS4z
OiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTEuNDAyMzQwXVsgVDY5MDhdIHVzYl9zdG9yOnNj
c2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTEuNDAzMDU2XVsgIFQxOTldIG50ZnMzOnF1ZXVl
Y21kIHJkeQ0KWyAgNjExLjQwMzM2NV1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEx
LjQwNDAxMF1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjExLjQwNDM0M11bIFQ2OTA4
XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMS40MzY5NzZdWyAgICBUMV0g
aW5pdDogc3RhcnRpbmcgc2VydmljZSAndmVuZG9yLmJvb3QtaGFsLTEtMCcuLi4NClsgIDYxMS40
MzgxMDldWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMS40
Mzg1MzhdWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTEuNDM5Mzg0XVsgVDY5MDhd
IHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTEuNDM5ODU1XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtl
bmVkDQpbICA2MTEuNDQwMDgyXVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDox
MA0KWyAgNjExLjQ3ODUzOV1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4
MA0KWyAgNjExLjQ3OTg5NV1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMS40ODAz
NThdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMS40ODA4NTJdWyBUNjkwOF0gdXNi
X3N0b3I6YXdha2VuZWQNClsgIDYxMS40ODEyMDddWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5k
IFdSSVRFXzEwOjEwDQpbICA2MTEuNTE3MTkxXVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9u
ZSxyZXN1bHQ9MHgwDQpbICA2MTEuNTE3NjgzXVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0K
WyAgNjExLjUxODAwN11bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjExLjUxODMwN11b
IFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjExLjUxODcyMl1bIFQ2OTA4XSB1c2IgMS0x
LjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMS41NTUwODhdWyBUNjkwOF0gdXNiX3N0b3I6
c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMS41NTYwNThdWyAgVDE5OV0gbnRmczM6cXVl
dWVjbWQgcmR5DQpbICA2MTEuNTU2NDA2XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2
MTEuNTU2OTQ2XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTEuNTU3Mjk1XVsgVDY5
MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjExLjU5MjkxNF1bIFQ2OTA4
XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjExLjU5MzgxN11bICBUMTk5
XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMS41OTQ0NDNdWyBUNjkwOF0gdXNiX3N0b3I6c2xl
ZXBpbmcNClsgIDYxMS41OTUzMDNdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMS41
OTYwNjVdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTEuNjM1
Mjk2XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTEuNjM2
NDQzXVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjExLjYzNzAyMF1bIFQ2OTA4XSB1
c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjExLjYzNzM5OF1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5l
ZA0KWyAgNjExLjYzNzc1OV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTAN
ClsgIDYxMS42NzMwMTRdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDAN
ClsgIDYxMS42NzM5MzVdWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTEuNjc0NDM1
XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTEuNjc0OTc4XVsgVDY5MDhdIHVzYl9z
dG9yOmF3YWtlbmVkDQpbICA2MTEuNjc1NTcyXVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBX
UklURV8xMDoxMA0KWyAgNjExLjY5NjQxM11bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUs
cmVzdWx0PTB4MA0KWyAgNjExLjY5NzAwM11bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsg
IDYxMS42OTczMjhdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMS42OTgzOThdWyBU
NjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMS42OTg4MTVdWyBUNjkwOF0gdXNiIDEtMS4z
OiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTEuNzM1NDY5XVsgVDY5MDhdIHVzYl9zdG9yOnNj
c2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTEuNzM2MjU3XVsgIFQxOTldIG50ZnMzOnF1ZXVl
Y21kIHJkeQ0KWyAgNjExLjczNjY3OV1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEx
LjczNzA4Ml1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjExLjczNzQzMl1bIFQ2OTA4
XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMS43NzI5ODRdWyBUNjkwOF0g
dXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMS43NzM1NjhdWyAgVDE5OV0g
bnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTEuNzczOTc4XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVw
aW5nDQpbICA2MTEuNzc0MjcwXVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTEuNzc0
Njg0XVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjExLjgxNDM0
OF1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjExLjgxNTQ2
MV1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMS44MTYxMDRdWyBUNjkwOF0gdXNi
X3N0b3I6c2xlZXBpbmcNClsgIDYxMS44MTY1NjBdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQN
ClsgIDYxMS44MTY4NDBdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpb
ICA2MTEuODUxOTg5XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpb
ICA2MTEuODUyNjMyXVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjExLjg1Mjk0M11b
IFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjExLjg1MzI2N11bIFQ2OTA4XSB1c2Jfc3Rv
cjphd2FrZW5lZA0KWyAgNjExLjg1MzYxMV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJ
VEVfMTA6MTANClsgIDYxMS44ODgzNzRdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJl
c3VsdD0weDANClsgIDYxMS44ODg5OTddWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2
MTEuODg5MzExXVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTEuODkwMjEzXVsgVDY5
MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTEuODkwNjczXVsgVDY5MDhdIHVzYiAxLTEuMzog
Q29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjExLjkyNDY0MV1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3Np
Y21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjExLjkyNTE3NV1bICBUMTk5XSBudGZzMzpxdWV1ZWNt
ZCByZHkNClsgIDYxMS45MjU2MTVdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMS45
MjU5ODFdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMS45MjYyOTFdWyBUNjkwOF0g
dXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTEuOTY1NDA3XVsgVDY5MDhdIHVz
Yl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTEuOTY2MTAyXVsgIFQxOTldIG50
ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjExLjk2NjU5Nl1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGlu
Zw0KWyAgNjExLjk2NzQ2MV1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjExLjk2Nzkz
NV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMi4wMDI1MDVd
WyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMi4wMDMyNDNd
WyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTIuMDA0MDI0XVsgVDY5MDhdIHVzYl9z
dG9yOnNsZWVwaW5nDQpbICA2MTIuMDA0NDI1XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpb
ICA2MTIuMDA0ODQzXVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAg
NjEyLjAyNDYwN11bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAg
NjEyLjAyNTA3Ml1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMi4wMjU0MjBdWyBU
NjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMi4wMjY0MzNdWyBUNjkwOF0gdXNiX3N0b3I6
YXdha2VuZWQNClsgIDYxMi4wMjY5MjddWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRF
XzEwOjEwDQpbICA2MTIuMDYyNzM2XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1
bHQ9MHgwDQpbICA2MTIuMDYzOTQzXVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEy
LjA2NDMzOV1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEyLjA2NDcyOF1bIFQ2OTA4
XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEyLjA2NTA3NF1bIFQ2OTA4XSB1c2IgMS0xLjM6IENv
bW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMi4wOTk4ODJdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNt
ZCBkb25lLHJlc3VsdD0weDANClsgIDYxMi4xMDA1NTBdWyAgVDE5OV0gbnRmczM6cXVldWVjbWQg
cmR5DQpbICA2MTIuMTAwOTk3XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTIuMTAx
NTg3XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTIuMTAxOTI2XVsgVDY5MDhdIHVz
YiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjEyLjE0MDE5Nl1bIFQ2OTA4XSB1c2Jf
c3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEyLjE0MDg4MV1bICBUMTk5XSBudGZz
MzpxdWV1ZWNtZCByZHkNClsgIDYxMi4xNDEyODldWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcN
ClsgIDYxMi4xNDE2NzddWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMi4xNDIwMzVd
WyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTIuMTc3OTUzXVsg
VDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTIuMTc4OTMyXVsg
IFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEyLjE3OTM1OF1bIFQ2OTA4XSB1c2Jfc3Rv
cjpzbGVlcGluZw0KWyAgNjEyLjE3OTk3Nl1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAg
NjEyLjE4MDQwMF1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYx
Mi4yMTY2NjRdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYx
Mi4yMTcyMzBdWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTIuMjE4MDkyXVsgVDY5
MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTIuMjE4NTY0XVsgVDY5MDhdIHVzYl9zdG9yOmF3
YWtlbmVkDQpbICA2MTIuMjE5MDA3XVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8x
MDoxMA0KWyAgNjEyLjI1NDAxMF1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0
PTB4MA0KWyAgNjEyLjI1NTI2MF1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMi4y
NTYwNTZdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMi4yNTY0MThdWyBUNjkwOF0g
dXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMi4yNTY4NjhdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21t
YW5kIFdSSVRFXzEwOjEwDQpbICA2MTIuMjk4NzQ4XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQg
ZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTIuMjk5MzQ1XVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJk
eQ0KWyAgNjEyLjMwMDE3Nl1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEyLjMwMDg2
MF1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEyLjMwMTE3OF1bIFQ2OTA4XSB1c2Ig
MS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMi4zMzY4MjNdWyBUNjkwOF0gdXNiX3N0
b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMi4zMzczNjVdWyAgVDE5OV0gbnRmczM6
cXVldWVjbWQgcmR5DQpbICA2MTIuMzM4Mjc2XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpb
ICA2MTIuMzM4ODA4XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTIuMzM5MjMxXVsg
VDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjEyLjM1OTU0NV1bIFQ2
OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEyLjM2MDIzOF1bICBU
MTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMi4zNjA2NDddWyBUNjkwOF0gdXNiX3N0b3I6
c2xlZXBpbmcNClsgIDYxMi4zNjA5NDRdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYx
Mi4zNjEyMjhdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTIu
Mzk3MTgwXVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTIu
Mzk3ODI2XVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEyLjM5ODIzN11bIFQ2OTA4
XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEyLjM5ODU1MV1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2Fr
ZW5lZA0KWyAgNjEyLjM5OTQ5NV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6
MTANClsgIDYxMi40MzUyNDJdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0w
eDANClsgIDYxMi40Mzc0MTldWyBUNjkxMV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTIuNDM4
MDI3XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTIuNDM4MzY1XVsgVDY5MDhdIHVz
Yl9zdG9yOmF3YWtlbmVkDQpbICA2MTIuNDM4ODYyXVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFu
ZCBXUklURV8xMDoxMA0KWyAgNjEyLjQ5MDc4Ml1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRv
bmUscmVzdWx0PTB4MA0KWyAgNjEyLjQ5MjIwOF1bIFQ2OTExXSBudGZzMzpxdWV1ZWNtZCByZHkN
ClsgIDYxMi40OTI3NzZdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMi40OTMyMjZd
WyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMi40OTM3NDldWyBUNjkwOF0gdXNiIDEt
MS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTIuNTMwNTQ4XVsgVDY5MDhdIHVzYl9zdG9y
OnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTIuNTMyMzAxXVsgVDY5MTFdIG50ZnMzOnF1
ZXVlY21kIHJkeQ0KWyAgNjEyLjUzMjk5MV1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAg
NjEyLjUzMzMyOF1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEyLjUzMzk0Nl1bIFQ2
OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMi41NzAxNjBdWyBUNjkw
OF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMi41NzA4ODVdWyBUNjkx
MV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTIuNTcxMzIwXVsgVDY5MDhdIHVzYl9zdG9yOnNs
ZWVwaW5nDQpbICA2MTIuNTcyMTA0XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTIu
NTc1ODkxXVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjEyLjYx
MTI4NV1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEyLjYx
MjE4Ml1bIFQ2OTExXSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMi42MTI2NjBdWyBUNjkwOF0g
dXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMi42MTI5NzldWyBUNjkwOF0gdXNiX3N0b3I6YXdha2Vu
ZWQNClsgIDYxMi42MTMyNTddWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEw
DQpbICA2MTIuNjUxMzg4XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgw
DQpbICA2MTIuNjUyMzEzXVsgVDY5MTFdIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEyLjY1Mjk2
M11bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEyLjY1MzMxNF1bIFQ2OTA4XSB1c2Jf
c3Rvcjphd2FrZW5lZA0KWyAgNjEyLjY1MzcwOV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQg
V1JJVEVfMTA6MTANClsgIDYxMi42ODgyOTNdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25l
LHJlc3VsdD0weDANClsgIDYxMi42ODg4NDRdWyBUNjkxMV0gbnRmczM6cXVldWVjbWQgcmR5DQpb
ICA2MTIuNjg5NDYyXVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTIuNjkwNDM4XVsg
VDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTIuNjkwOTU5XVsgVDY5MDhdIHVzYiAxLTEu
MzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjEyLjcxMTQ2OF1bIFQ2OTA4XSB1c2Jfc3Rvcjpz
Y3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEyLjcxMjIwNl1bIFQ2OTExXSBudGZzMzpxdWV1
ZWNtZCByZHkNClsgIDYxMi43MTI2NzBdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYx
Mi43MTMwODBdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMi43MTMzODddWyBUNjkw
OF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTIuNzQ4Mzk2XVsgVDY5MDhd
IHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTIuNzQ4OTM1XVsgVDY5MTFd
IG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEyLjc0OTM1N11bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVl
cGluZw0KWyAgNjEyLjc0OTcxNl1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEyLjc1
MDIxOV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMi43ODQx
MzhdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMi43ODQ3
MTBdWyBUNjkxMV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTIuNzg1MTA5XVsgVDY5MDhdIHVz
Yl9zdG9yOnNsZWVwaW5nDQpbICA2MTIuNzg1NDE5XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVk
DQpbICA2MTIuNzg2NDE2XVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0K
WyAgNjEyLjgyNTcxOV1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0K
WyAgNjEyLjgyNjcyOV1bIFQ2OTExXSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMi44MjcxNzld
WyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMi44Mjc4MDddWyBUNjkwOF0gdXNiX3N0
b3I6YXdha2VuZWQNClsgIDYxMi44MjgyNDRdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdS
SVRFXzEwOjEwDQpbICA2MTIuODYzNDMzXVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxy
ZXN1bHQ9MHgwDQpbICA2MTIuODY0MTgxXVsgVDY5MTFdIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAg
NjEyLjg2NDkyNF1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEyLjg2NTM1NF1bIFQ2
OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEyLjg2NjUyN11bIFQ2OTA4XSB1c2IgMS0xLjM6
IENvbW1hbmQgV1JJVEVfMTA6MTANClsgIDYxMi45MDI0MTBdWyBUNjkwOF0gdXNiX3N0b3I6c2Nz
aWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMi45MDM0MzRdWyBUNjkxMV0gbnRmczM6cXVldWVj
bWQgcmR5DQpbICA2MTIuOTA0MjIwXVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTIu
OTA0Njg4XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTIuOTA0OTkxXVsgVDY5MDhd
IHVzYiAxLTEuMzogQ29tbWFuZCBXUklURV8xMDoxMA0KWyAgNjEyLjk0MTM3N11bIFQ2OTA4XSB1
c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEyLjk0MjA0NV1bIFQ2OTExXSBu
dGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMi45NDI1MDRdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBp
bmcNClsgIDYxMi45NDM5MjhdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMi45NDQ0
MzddWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFdSSVRFXzEwOjEwDQpbICA2MTIuOTg2NDMx
XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTIuOTg3MTMx
XVsgVDY5MTFdIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEyLjk4NzUyMl1bIFQ2OTA4XSB1c2Jf
c3RvcjpzbGVlcGluZw0KWyAgNjEyLjk4ODU2OV1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0K
WyAgNjEyLjk4OTAxN11bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgV1JJVEVfMTA6MTANClsg
IDYxMy4wMjczMjZdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsg
IDYxMy4wMjgxMTVdWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTMuMDI4NTM4XVsg
VDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTMuMDI4ODMwXVsgVDY5MDhdIHVzYl9zdG9y
OmF3YWtlbmVkDQpbICA2MTMuMDI5MTU1XVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBXUklU
RV8xMDoxMA0KWyAgNjEzLjAzNzY2Ml1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVz
dWx0PTB4MA0KWyAgNjEzLjAzODIxN11bIFQ2OTExXSBjaGVjazo2DQpbICA2MTMuMDM4NzAwXVsg
IFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEzLjAzOTU3NF1bIFQ2OTA4XSB1c2Jfc3Rv
cjpzbGVlcGluZw0KWyAgNjEzLjA0MDE2OF1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAg
NjEzLjA0MDQ0NF1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgUkVBRF8xMDoxMA0KWyAgNjEz
LjA0MjcwMV1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEz
LjA0MzIzNl1bIFQ2OTExXSBjaGVjazo3DQpbICA2MTMuMDQzNTM3XVsgIFQxOTldIG50ZnMzOnF1
ZXVlY21kIHJkeQ0KWyAgNjEzLjA0NDI2Ml1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAg
NjEzLjA0NDY5OF1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEzLjA0NTA0NV1bIFQ2
OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgUkVBRF8xMDoxMA0KWyAgNjEzLjA0NzQ1NF1bIFQ2OTA4
XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEzLjA0ODEzNV1bIFQ2OTEx
XSBjaGVjazo4DQpbICA2MTMuMDQ4NTI5XVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAg
NjEzLjA0ODc5MV1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEzLjA0OTExMF1bIFQ2
OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEzLjA0OTcyOV1bIFQ2OTA4XSB1c2IgMS0xLjM6
IENvbW1hbmQgUkVBRF8xMDoxMA0KWyAgNjEzLjA1MjA2NF1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3Np
Y21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEzLjA1MjU4OV1bIFQ2OTExXSBjaGVjazo5DQpbICA2
MTMuMDUyOTM5XVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEzLjA1MzM1Nl1bIFQ2
OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEzLjA1MzY2MF1bIFQ2OTA4XSB1c2Jfc3Rvcjph
d2FrZW5lZA0KWyAgNjEzLjA1NDAzMV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgUkVBRF8x
MDoxMA0KWyAgNjEzLjA1NTgyNl1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0
PTB4MA0KWyAgNjEzLjA1NjI4OF1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMy4w
NTY2ODVdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMy4wNTcwNTRdWyBUNjkwOF0g
dXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMy4wNTczNzRdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21t
YW5kIFJFQURfMTA6MTANClsgIDYxMy4wNjAyMjBdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBk
b25lLHJlc3VsdD0weDANClsgIDYxMy4wNjA3MjddWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5
DQpbICA2MTMuMDYxMDM0XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTMuMDYxMzU0
XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTMuMDYxNzQzXVsgVDY5MDhdIHVzYiAx
LTEuMzogQ29tbWFuZCBSRUFEXzEwOjEwDQpbICA2MTMuMDYzMzYwXVsgVDY5MDhdIHVzYl9zdG9y
OnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTMuMDY0MDU2XVsgIFQxOTldIG50ZnMzOnF1
ZXVlY21kIHJkeQ0KWyAgNjEzLjA2NDM3M11bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAg
NjEzLjA2NDg4NF1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEzLjA2NTIwM11bIFQ2
OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgUkVBRF8xMDoxMA0KWyAgNjEzLjA2NzM5Ml1bIFQ2OTA4
XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEzLjA2ODI2M11bICBUMTk5
XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMy4wNjg2MzldWyBUNjkwOF0gdXNiX3N0b3I6c2xl
ZXBpbmcNClsgIDYxMy4wNjg5NzJdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMy4w
NjkzMDNdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFJFQURfMTA6MTANClsgIDYxMy4wNzEz
NjZdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMy4wNzIy
NzFdWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTMuMDcyNjQ4XVsgVDY5MDhdIHVz
Yl9zdG9yOnNsZWVwaW5nDQpbICA2MTMuMDczMDc3XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVk
DQpbICA2MTMuMDczNDMwXVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBSRUFEXzEwOjEwDQpb
ICA2MTMuMDc1OTgwXVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpb
ICA2MTMuMDc2NDcwXVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEzLjA3Njg1Nl1b
IFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEzLjA3NzI0Nl1bIFQ2OTA4XSB1c2Jfc3Rv
cjphd2FrZW5lZA0KWyAgNjEzLjA3NzU1NV1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgUkVB
RF8xMDoxMA0KWyAgNjEzLjA3OTg3MV1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVz
dWx0PTB4MA0KWyAgNjEzLjA4MDQzMV1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYx
My4wODA4MTJdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMy4wODExNDNdWyBUNjkw
OF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMy4wODE0MzldWyBUNjkwOF0gdXNiIDEtMS4zOiBD
b21tYW5kIFJFQURfMTA6MTANClsgIDYxMy4wODQwMjRdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNt
ZCBkb25lLHJlc3VsdD0weDANClsgIDYxMy4wODQ0NzldWyAgVDE5OV0gbnRmczM6cXVldWVjbWQg
cmR5DQpbICA2MTMuMDg0ODE4XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTMuMDg1
MTQ4XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTMuMDg1NDI5XVsgVDY5MDhdIHVz
YiAxLTEuMzogQ29tbWFuZCBSRUFEXzEwOjEwDQpbICA2MTMuMDg3ODk1XVsgVDY5MDhdIHVzYl9z
dG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTMuMDg4Mzg3XVsgIFQxOTldIG50ZnMz
OnF1ZXVlY21kIHJkeQ0KWyAgNjEzLjA4ODc3MF1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0K
WyAgNjEzLjA4OTA4NF1bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEzLjA4OTQ4MF1b
IFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgUkVBRF8xMDoxMA0KWyAgNjEzLjA5MjA2NF1bIFQ2
OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEzLjA5MjY2Nl1bICBU
MTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsgIDYxMy4wOTMwNTFdWyBUNjkwOF0gdXNiX3N0b3I6
c2xlZXBpbmcNClsgIDYxMy4wOTM0NTNdWyBUNjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYx
My4wOTM4MzBdWyBUNjkwOF0gdXNiIDEtMS4zOiBDb21tYW5kIFJFQURfMTA6MTANClsgIDYxMy4w
OTU5NzJdWyBUNjkwOF0gdXNiX3N0b3I6c2NzaWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMy4w
OTY2OTNdWyAgVDE5OV0gbnRmczM6cXVldWVjbWQgcmR5DQpbICA2MTMuMDk3MDYzXVsgVDY5MDhd
IHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTMuMDk3Nzg3XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtl
bmVkDQpbICA2MTMuMDk4NTM0XVsgVDY5MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBSRUFEXzEwOjEw
DQpbICA2MTMuMTAwMjk5XVsgVDY5MDhdIHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgw
DQpbICA2MTMuMTAwOTE5XVsgIFQxOTldIG50ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEzLjEwMTI2
MF1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGluZw0KWyAgNjEzLjEwMTYxNV1bIFQ2OTA4XSB1c2Jf
c3Rvcjphd2FrZW5lZA0KWyAgNjEzLjEwMjAyNF1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQg
UkVBRF8xMDoxMA0KWyAgNjEzLjEwMzg2OV1bIFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUs
cmVzdWx0PTB4MA0KWyAgNjEzLjEwNDM2MV1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsg
IDYxMy4xMDQ4MThdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMy4xMDYyNTNdWyBU
NjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMy4xMDY5ODRdWyBUNjkwOF0gdXNiIDEtMS4z
OiBDb21tYW5kIFJFQURfMTA6MTANClsgIDYxMy4xMDkxNDNdWyBUNjkwOF0gdXNiX3N0b3I6c2Nz
aWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMy4xMDk2ODRdWyAgVDE5OV0gbnRmczM6cXVldWVj
bWQgcmR5DQpbICA2MTMuMTEwMTEzXVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2MTMu
MTEwNDY1XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTMuMTExNTIwXVsgVDY5MDhd
IHVzYiAxLTEuMzogQ29tbWFuZCBSRUFEXzEwOjEwDQpbICA2MTMuMTEzMzQzXVsgVDY5MDhdIHVz
Yl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTMuMTE2NjA0XVsgIFQxOTldIG50
ZnMzOnF1ZXVlY21kIHJkeQ0KWyAgNjEzLjExNzA2OV1bIFQ2OTA4XSB1c2Jfc3RvcjpzbGVlcGlu
Zw0KWyAgNjEzLjExNzQyN11bIFQ2OTA4XSB1c2Jfc3Rvcjphd2FrZW5lZA0KWyAgNjEzLjExNzkw
Ml1bIFQ2OTA4XSB1c2IgMS0xLjM6IENvbW1hbmQgUkVBRF8xMDoxMA0KWyAgNjEzLjExOTc5OV1b
IFQ2OTA4XSB1c2Jfc3RvcjpzY3NpY21kIGRvbmUscmVzdWx0PTB4MA0KWyAgNjEzLjEyMDI4N11b
IFQ2OTExXSBjaGVjazoxMA0KWyAgNjEzLjEyMDc2MF1bIFQ2OTExXSBjaGVjazoxMQ0KWyAgNjEz
LjEyMTE4OF1bIFQ2OTExXSBlbnRlcjpyZWFkX2ZvbGlvDQpbICA2MTMuMTIxNzc2XVsgVDY5MTFd
IGVudGVyOk5HQg0KWyAgNjEzLjEyMjYzMF1bICBUMTk5XSBudGZzMzpxdWV1ZWNtZCByZHkNClsg
IDYxMy4xMjMwMDhdWyBUNjkwOF0gdXNiX3N0b3I6c2xlZXBpbmcNClsgIDYxMy4xMjMzNDldWyBU
NjkwOF0gdXNiX3N0b3I6YXdha2VuZWQNClsgIDYxMy4xMjQxMTVdWyBUNjkwOF0gdXNiIDEtMS4z
OiBDb21tYW5kIFJFQURfMTA6MTANClsgIDYxMy4xMjU4NDFdWyBUNjkwOF0gdXNiX3N0b3I6c2Nz
aWNtZCBkb25lLHJlc3VsdD0weDANClsgIDYxMy4xMjYyMDldWyBUNjkxMV0gY2hlY2s6MTINClsg
IDYxMy4xMjY0NzhdWyBUNjkxMV0gY2hlY2s6MTMNClsgIDYxMy4xMjczNDBdWyBUNjkxMV0gY2hl
Y2s6MTQNClsgIDYxMy4xMjgwNjNdWyBUNjkxMV0gZW50ZXI6cmVhZF9mb2xpbw0KWyAgNjEzLjEy
ODY0OF1bIFQ2OTExXSBlbnRlcjpOR0INClsgIDYxMy4xMjkwMDldWyAgVDE5OV0gbnRmczM6cXVl
dWVjbWQgcmR5DQpbICA2MTMuMTI5MjY1XVsgVDY5MDhdIHVzYl9zdG9yOnNsZWVwaW5nDQpbICA2
MTMuMTI5OTI4XVsgVDY5MDhdIHVzYl9zdG9yOmF3YWtlbmVkDQpbICA2MTMuMTMwNTUzXVsgVDY5
MDhdIHVzYiAxLTEuMzogQ29tbWFuZCBSRUFEXzEwOjEwDQpbICA2MTMuMTMyMzQ4XVsgVDY5MDhd
IHVzYl9zdG9yOnNjc2ljbWQgZG9uZSxyZXN1bHQ9MHgwDQpbICA2MTMuMTMzMDk2XVsgVDY5MDhd
IHBhZ2VfZW5kaW86cmVhZCxlcnI9MA0KWyAgNjEzLjEzMzQwMl1bIFQ2OTA4XSBDRkkgZmFpbHVy
ZSBhdCBfX3dha2VfdXBfY29tbW9uKzB4ZGMvMHgxNjggKHRhcmdldDogbWlncmF0aW9uX2VudHJ5
X3dhaXRfb25fbG9ja2VkKzB4MmE3LzB4MmE4OyBleHBlY3RlZCB0eXBlOiAweDdhMjQzMjM2KQ0K
WyAgNjEzLjEzNDUwNl1bIFQ2OTA4XSBXQVJOSU5HOiBDUFU6IDYgUElEOiA2OTA4IGF0IF9fd2Fr
ZV91cF9jb21tb24rMHhkYy8weDE2OA0KWyAgNjEzLjEzNTg4MV1bIFQ2OTA4XSBNb2R1bGVzIGxp
bmtlZCBpbjogcWNhNjM5MChPRSkgbWFjaGluZV9kbGttKE9FKSBuYXRpdmVfZGxrbShPRSkgcGxh
dGZvcm1fZGxrbShPRSkgcTZfZGxrbShPRSkgY25zczIoT0UpIG1oaV9kZXZfdWNpKEUpIHFydHJf
bWhpKEUpIGFkc3BfbG9hZGVyX2Rsa20oT0UpIHVzYl9mX3Fkc3MoRSkgdm1fY3B1ZnJlcShPRSkg
bWhpKEUpIGhkY3BfcXNlZWNvbV9kbGttKE9FKSBtYWM4MDIxMShFKSBxY3J5cHRvX21zbV9kbGtt
KE9FKSBhcHJfZGxrbShPRSkgbXNtX2NmZyhPRSkgc21jaW52b2tlX2Rsa20oT0UpIGJ0cG93ZXIo
T0UpIGkyY19tc21fZ2VuaShFKSBpMmNfZGV2KEUpIHdsYW5fZmlybXdhcmVfc2VydmljZShPRSkg
c3Vic3lzdGVtX25vdGlmX3ZpcnQoT0UpIGNuc3NfdXRpbHMoT0UpIGhkbWlfZGxrbShPRSkgcWNv
bV9nbGlua19jbWEoRSkgcnRjX3BtOHh4eChFKSBjZmc4MDIxMShFKSBzdHViX2Rsa20oT0UpIHNu
ZF9ldmVudF9kbGttKE9FKSB0el9sb2dfZGxrbShPRSkgcXRpX2NhbihPRSkgcTZfbm90aWZpZXJf
ZGxrbShPRSkgZWhzZXQoRSkgY25zc19ubChPRSkgcWNvbV9ybmcoRSkgdWZzX3Fjb20oRSkgd2Fs
bHBvd2VyX2NoYXJnZXIoT0UpIGNuc3NfcGxhdF9pcGNfcW1pX3N2YyhPRSkgcXJ0cihFKSBnbV9z
aG1lbShPRSkgcWNlZGV2X21vZF9kbGttKE9FKSB2aXJ0aW9fbnB1KEUpIHZpcnRpb192aWRlbyhP
RSkgYm9vdF9tYXJrZXIoT0UpIG1zbV92bV9wb3dlcm9mZihFKSBxc2VlY29tX2Rsa20oT0UpIGR3
bWFjX3N1bjhpKEUpIG1zbV9oeXAoT0UpIGR3bWFjX2dlbmVyaWMoRSkgZHdtYWNfcWNvbV9ldGgo
RSkgcWNlNTBfZGxrbShPRSkgdmZhc3RycGMoT0UpIGR3bWFjX2lwcTgwNngoRSkgZ25zc19zaXJm
KE9FKSBkd21hY19zdW54aShFKSBkd2MzX21zbShFKSBwaHlfbXNtX3F1c2IoRSkgZXh0Y29uX3Vz
Yl9ncGlvKEUpIHBoeV9tc21fcXVzYl92MihFKSByZW1vdW50X3NobWVtKEUpDQpbICA2MTMuMTM2
MDQ0XVsgVDY5MDhdICBwaHlfcWNvbV9lbXUoRSkgdXNiX2JhbShFKSBtc21fcW1wKEUpIGRhYnJp
ZGdlKEUpIG1hcnZlbGwoRSkgbXNtX3NoYXJlZG1lbShFKSBxY29tX3ZhX21pbmlkdW1wKEUpIG1z
bV9tZW1zaGFyZShFKSBwaHlfcWNvbV91ZnNfcW1wX3Y0KEUpIHBjaV9tc21fZHJ2KEUpIHN0bW1h
Y19wbGF0Zm9ybShFKSBzZGhjaV9tc20oRSkgcGluY3RybF9zcG1pX21wcChFKSBwaHlfZ2VuZXJp
YyhFKSBycHJvY19xY29tX2NvbW1vbihFKSBjbGtfZHVtbXkoRSkgdmlydGlvX3NuZChFKSBjcWhj
aShFKSBzcGlfbXNtX2dlbmkoRSkgbWVtb3J5X2R1bXBfdjIoRSkgc3RtbWFjKEUpIHBoeV9tc21f
c25wc19ocyhFKSB1c2JfZl9kaWFnKEUpIHZpb3NwbWlfcG1pY19hcmIoRSkgdmlydGlvX2lucHV0
KEUpIGVtYWNfbWRpb19mZShFKSBtZGlvX211eChFKSBwY3NfeHBjcyhFKSBwaHlfcWNvbV9xbXBf
cGNpZV9tc204OTk2KEUpIHFjb21fcmFtZHVtcChFKSBkbV9ib3coRSkgcGh5X3Fjb21fcW1wX3Vm
cyhFKSB1c2JfZl9jZGV2KEUpIHFjb21fZ2xpbmtfc21lbShFKSBtc21fZ2VuaV9zZXJpYWwoRSkg
cWNvbV9zcG1pX3BtaWMoRSkgcGluY3RybF9tb25hY29fYXV0byhFKSBpMmNfdmlydGlvKEUpIHBp
bmN0cmxfbGVtYW5zKEUpIHBoeV9xY29tX3FtcF91c2IoRSkgcGh5X3Fjb21fcW1wX2NvbWJvKEUp
IHBpbmN0cmxfc2Rtc2hyaWtlKEUpIHBoeV9xY29tX3FtcF9wY2llKEUpIHBpbmN0cmxfc204MTUw
KEUpIHBoeV9tc21fc3N1c2JfcW1wKEUpIHFjb21fZ2xpbmsoRSkgcGh5X3Fjb21fdWZzX3FtcF92
NF93YWlwaW8oRSkgcGluY3RybF9kaXJld29sZihFKSBwaW5jdHJsX3NtNjE1MChFKSBxc2VlY29t
X3Byb3h5KEUpIHBoeV9xY29tX3Vmc19xbXBfdjRfbGFoYWluYShFKSBxY29tX2lvbW11X2RlYnVn
KEUpIHBoeV9xY29tX3VmcyhFKSBwaW5jdHJsX21zbShFKSBxY29tX3NvY193ZHQoRSkgbnRmczMo
RSkNClsgIDYxMy4xNDQ2NThdWyBUNjkwOF0gIGhlYXBfbWVtX2V4dF92MDEoRSkgbXNtX3Nob3df
cmVzdW1lX2lycShFKSBzcGlkZXYoRSkgcWNvbV93ZHRfY29yZShFKSBzbWVtKEUpIHJxX3N0YXRz
KEUpIHBpbmN0cmxfc3BtaV9ncGlvKEUpIHFjb21fcGRjKEUpIHBoeV9xY29tX3NucHNfZmVtdG9f
djIoRSkgcW1pX2hlbHBlcnMoRSkgY2xrX3Fjb20oRSkgcWNvbV9pcGNfbG9nZ2luZyhFKSBtaW5p
ZHVtcChFKSBpZWVlODAyMTU0X3NvY2tldCBtYWM4MDIxNTQgaWVlZTgwMjE1NF82bG93cGFuIGwy
dHBfcHBwIGllZWU4MDIxNTQgbmhjX3VkcCBuaGNfaXB2NiBuaGNfZGVzdCBuaGNfbW9iaWxpdHkg
bmhjX3JvdXRpbmcgZGlhZyBidHNkaW8gbmhjX2hvcCBuZmMgY2FuX3JhdyBuaGNfZnJhZ21lbnQg
aGNpX3VhcnQgY2FuX2d3IGhpZHAgdGlwYyBjYW5fYmNtIGNkY19hY20gYnRxY2EgODAyMXEgNmxv
d3BhbiBjYW4gYXFjMTExIGJ0YmNtIGNkY19uY20gcmZjb21tIHI4MTUzX2VjbSBibHVldG9vdGgg
ZnRkaV9zaW8gYXNpeCB1c2JzZXJpYWwgcmZraWxsIHNsY2FuIGwydHBfY29yZSByODE1MiBic2Rf
Y29tcCBjZGNfZWVtIHBwcF9tcHBlIHBwcF9kZWZsYXRlIGNkY19ldGhlciBheDg4MTc5XzE3OGEg
a2hlYWRlcnMgdXNibmV0IHpyYW0gcHB0cCB2Y2FuIHBwcG94IGxpYmFyYzQgcHBwX2dlbmVyaWMg
c2xoYyBydGw4MTUwIHd3YW4gY2FuX2RldiBtaWkgenNtYWxsb2MgZ3p2bSBzb2NpbmZvX2R0KE9F
KSBxcm5nX2Rsa20oT0UpIHFjb21faXBjYyhFKSB2aXJ0aW9fbmV0KEUpIG5ldF9mYWlsb3ZlcihF
KSBmYWlsb3ZlcihFKSB2aXJ0X2FybV9zbW11X3YzKEUpIGFybV9zbW11KEUpIGlvbW11X2xvZ2dl
cihFKSBxY29tX2lvbW11X3V0aWwoRSkgdmlydGlvX2NvbnNvbGUoRSkgdmlydGlvX3JlZ3VsYXRv
cihFKSBzdHViX3JlZ3VsYXRvcihFKSBkZWJ1Z19yZWd1bGF0b3IoRSkgcmVuYW1lX2RldmljZXMo
RSkgdmlydGlvX21taW8oRSkgdmlydGlvX2JsayhFKQ0KWyAgNjEzLjE1MjMwMF1bIFQ2OTA4XSAg
dmlydGlvX2Jsa19xdGlfY3J5cHRvKEUpIGRlYnVnX3N5bWJvbChFKSBxY29tX2hnc2woRSkgY3J5
cHRvX3F0aV92aXJ0KEUpIGJvb3Rfc3RhdHMoRSkgbWVtX2J1ZihFKSBxY29tX2RtYV9oZWFwcyhF
KSBtZW1fYnVmX21zZ3EoRSkgbWVtX2J1Zl9kZXYoRSkgc2VjdXJlX2J1ZmZlcihFKSBxY29tX3Nj
bShFKSBnaF9ybV9kcnYoRSkgZ2hfbXNncShFKSBxY29tX3NjbV9oYWIoRSkgbXNtX2hhYihFKSB2
aXJ0aW9fY2xrKEUpIHZpcnRpb19jbGtfbW9uYWNvKEUpIHZpcnRpb19jbGtfbGVtYW5zKEUpIHZp
cnRpb19jbGtfZGlyZXdvbGZbcXZtXSBbc2V0X2Rsb2FkX2Nvb2tpZTo3OF0gV3JpdGUgdG8gdGhl
KEUpIHZpcnRpb19jbGtfc2E4MTk1cChFKSB2aXJ0aW9fY2xrX3NtNjE1MChFKSB2aXJ0aW9fY2xr
X3NtODE1MChFKQ0KWyAgNjEzLjE2MzU4N11bIFQ2OTA4XSBDUFU6IDYgUElEOiA2OTA4IENvbW06
IHVzYi1zdG9yYWdlIFRhaW50ZWQ6IEcgICAgICAgICAgIE9FICAgICAgNi4xLjc1LWFuZHJvaWQx
NC0xMS1tYXliZS1kaXJ0eSAjMQ0KWyAgNjEzLjE2NDQ2M11bIFQ2OTA4XSBIYXJkd2FyZSBuYW1l
OiBRdWFsY29tbSBUZWNobm9sb2dpZSwgSW5jLiBTQTgxNTUgVmlydHVhbCBNYWNoaW5lIChEVCkN
ClsgIDYxMy4xNjUwNDRdWyBUNjkwOF0gcHN0YXRlOiA4MDQwMDBjNSAoTnpjdiBkYUlGICtQQU4g
LVVBTyAtVENPIC1ESVQgLVNTQlMgQlRZUEU9LS0pDQpbICA2MTMuMTY1NTUzXVsgVDY5MDhdIHBj
IDogX193YWtlX3VwX2NvbW1vbisweGRjLzB4MTY4DQpbICA2MTMuMTY1OTg1XVsgVDY5MDhdIGxy
IDogX193YWtlX3VwX2xvY2tlZF9rZXlfYm9va21hcmsrMHgyOC8weDM4DQpbICA2MTMuMTY2NDQy
XVsgVDY5MDhdIHNwIDogZmZmZmZmYzAxNzc2YmFjMA0KWyAgNjEzLjE2NjgyOF1bIFQ2OTA4XSB4
Mjk6IGZmZmZmZmMwMTc3NmJhYzAgeDI4OiAwMDAwMDAwMDAwMDcwMDAwIHgyNzogMDAwMDAwMDAw
MDAwMDAwMA0KWyAgNjEzLjE2ODAwNl1bIFQ2OTA4XSB4MjY6IDAwMDAwMDAwMDAwMDAwMDAgeDI1
OiBmZmZmZmZjMDBhMGI4NjQwIHgyNDogMDAwMDAwMDAwMDAwMDAwMw0KWyAgNjEzLjE2ODYwMV1b
IFQ2OTA4XSB4MjM6IDAwMDAwMDAwMDAwMDAwMDAgeDIyOiBmZmZmZmZjMDBhMGI4NjQwIHgyMTog
ZmZmZmZmYzAxNzc2YmI1OA0KWyAgNjEzLjE2OTEyN11bIFQ2OTA4XSB4MjA6IGZmZmZmZmMwMTc3
NmJiMzAgeDE5OiAwMDAwMDAwMDAwMDAwMDAxIHgxODogZmZmZmZmYzAxNTNiZDA3OA0KWyAgNjEz
LjE3MDM2MV1bIFQ2OTA4XSB4MTc6IDAwMDAwMDAwN2EyNDMyMzYgeDE2OiAwMDAwMDAwMDI0MzIz
Njk0IHgxNTogMDAwMDAwMDAwMDAwMDAwNA0KWyAgNjEzLjE3MTA0MV1bIFQ2OTA4XSB4MTQ6IGZm
ZmZmZjgxZGJmODAwMDAgeDEzOiAwMDAwMDAwMDAwMDAyZGM1IHgxMjogMDAwMDAwMDAwMDAwMDAw
Mw0KWyAgNjEzLjE3MjI0N11bIFQ2OTA4XSB4MTE6IDAwMDAwMDAwZmZmZmFkYzUgeDEwOiAwMDAw
MDAwMDAwMDAwMDAxIHg5IDogZmZmZmZmYzAwODEyNjJmNA0KWyAgNjEzLjE3Mjk4OV1bIFQ2OTA4
XSB4OCA6IGZmZmZmZmMwMDgyZDY5NDMgeDcgOiAyMDViNWQzNjM5MzAzMzMzIHg2IDogMzEyZTMz
MzEzNjIwMjA1Yg0KWyAgNjEzLjE3MzgzM11bIFQ2OTA4XSB4NSA6IGZmZmZmZmMwMTc3NmJiMzAg
eDQgOiBmZmZmZmZjMDE3NzZiYjU4IHgzIDogZmZmZmZmYzAxNzc2YmI1OA0KWyAgNjEzLjE3NDM4
MV1bIFQ2OTA4XSB4MiA6IDAwMDAwMDAwMDAwMDAwMDAgeDEgOiAwMDAwMDAwMDAwMDAwMDAzIHgw
IDogZmZmZmZmYzAxNzVmYmE4MA0KWyAgNjEzLjE3NTU2MV1bIFQ2OTA4XSBDYWxsIHRyYWNlOg0K
WyAgNjEzLjE3NTk1M11bIFQ2OTA4XSAgX193YWtlX3VwX2NvbW1vbisweGRjLzB4MTY4DQpbICA2
MTMuMTc2MzQ1XVsgVDY5MDhdICBfX3dha2VfdXBfbG9ja2VkX2tleV9ib29rbWFyaysweDI4LzB4
MzgNClsgIDYxMy4xNzY4NzZdWyBUNjkwOF0gIGZvbGlvX3dha2VfYml0KzB4OWMvMHgxNDANClsg
IDYxMy4xNzcxODddWyBUNjkwOF0gIHBhZ2VfZW5kaW8rMHgxMmMvMHgyMDANClsgIDYxMy4xNzc4
MjBdWyBUNjkwOF0gIG1wYWdlX2VuZF9pbysweGE4LzB4ZjANClsgIDYxMy4xNzg4MDldWyBUNjkw
OF0gIGJpb19lbmRpbysweDFhOC8weDFjYw0KWyAgNjEzLjE3OTEyNV1bIFQ2OTA4XSAgYmxrX3Vw
ZGF0ZV9yZXF1ZXN0KzB4MTM4LzB4MzljDQpbICA2MTMuMTc5NzcwXVsgVDY5MDhdICBzY3NpX2Vu
ZF9yZXF1ZXN0KzB4MzQvMHgyZjQNClsgIDYxMy4xODAyNjJdWyBUNjkwOF0gIHNjc2lfaW9fY29t
cGxldGlvbisweDU0LzB4MTM0DQpbICA2MTMuMTgwNzE1XVsgVDY5MDhdICBzY3NpX2ZpbmlzaF9j
b21tYW5kKzB4YzQvMHhkYw0KWyAgNjEzLjE4MTA2NF1bIFQ2OTA4XSAgc2NzaV9jb21wbGV0ZSsw
eDc4LzB4MTY0DQpbICA2MTMuMTgxNDQ5XVsgVDY5MDhdICBzY3NpX2RvbmVfaW50ZXJuYWwrMHg2
Yy8weDEzYw0KWyAgNjEzLjE4MTk4Ml1bIFQ2OTA4XSAgc2NzaV9kb25lX2RpcmVjdCsweDFjLzB4
MmMNClsgIDYxMy4xODIyOThdWyBUNjkwOF0gIHVzYl9zdG9yX2NvbnRyb2xfdGhyZWFkKzB4Mjlj
LzB4MzFjDQpbICA2MTMuMTgyNzAwXVsgVDY5MDhdICBrdGhyZWFkKzB4MTBjLzB4MWRjDQpbICA2
MTMuMTgzNDU5XVsgVDY5MDhdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMA0KWyAgNjEzLjE4Mzk3
OF1bIFQ2OTA4XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NClsgIDYxMy4x
ODQzOTVdWyBUNjkwOF0gSW50ZXJuYWwgZXJyb3I6IFNQL1BDIGFsaWdubWVudCBleGNlcHRpb246
IDAwMDAwMDAwOGEwMDAwMDAgWyMxXSBQUkVFTVBUIFNNUA0KWyAgNjEzLjE4NTA4NF1bIFQ2OTA4
XSBNb2R1bGVzIGxpbmtlZCBpbjogcWNhNjM5MChPRSkgbWFjaGluZV9kbGttKE9FKSBuYXRpdmVf
ZGxrbShPRSkgcGxhdGZvcm1fZGxrbShPRSkgcTZfZGxrbShPRSkgY25zczIoT0UpIG1oaV9kZXZf
dWNpKEUpIHFydHJfbWhpKEUpIGFkc3BfbG9hZGVyX2Rsa20oT0UpIHVzYl9mX3Fkc3MoRSkgdm1f
Y3B1ZnJlcShPRSkgbWhpKEUpIGhkY3BfcXNlZWNvbV9kbGttKE9FKSBtYWM4MDIxMShFKSBxY3J5
cHRvX21zbV9kbGttKE9FKSBhcHJfZGxrbShPRSkgbXNtX2NmZyhPRSkgc21jaW52b2tlX2Rsa20o
T0UpIGJ0cG93ZXIoT0UpIGkyY19tc21fZ2VuaShFKSBpMmNfZGV2KEUpIHdsYW5fZmlybXdhcmVf
c2VydmljZShPRSkgc3Vic3lzdGVtX25vdGlmX3ZpcnQoT0UpIGNuc3NfdXRpbHMoT0UpIGhkbWlf
ZGxrbShPRSkgcWNvbV9nbGlua19jbWEoRSkgcnRjX3BtOHh4eChFKSBjZmc4MDIxMShFKSBzdHVi
X2Rsa20oT0UpIHNuZF9ldmVudF9kbGttKE9FKSB0el9sb2dfZGxrbShPRSkgcXRpX2NhbihPRSkg
cTZfbm90aWZpZXJfZGxrbShPRSkgZWhzZXQoRSkgY25zc19ubChPRSkgcWNvbV9ybmcoRSkgdWZz
X3Fjb20oRSkgd2FsbHBvd2VyX2NoYXJnZXIoT0UpIGNuc3NfcGxhdF9pcGNfcW1pX3N2YyhPRSkg
cXJ0cihFKSBnbV9zaG1lbShPRSkgcWNlZGV2X21vZF9kbGttKE9FKSB2aXJ0aW9fbnB1KEUpIHZp
cnRpb192aWRlbyhPRSkgYm9vdF9tYXJrZXIoT0UpIG1zbV92bV9wb3dlcm9mZihFKSBxc2VlY29t
X2Rsa20oT0UpIGR3bWFjX3N1bjhpKEUpIG1zbV9oeXAoT0UpIGR3bWFjX2dlbmVyaWMoRSkgZHdt
YWNfcWNvbV9ldGgoRSkgcWNlNTBfZGxrbShPRSkgdmZhc3RycGMoT0UpIGR3bWFjX2lwcTgwNngo
RSkgZ25zc19zaXJmKE9FKSBkd21hY19zdW54aShFKSBkd2MzX21zbShFKSBwaHlfbXNtX3F1c2Io
RSkgZXh0Y29uX3VzYl9ncGlvKEUpIHBoeV9tc21fcXVzYl92MihFKSByZW1vdW50X3NobWVtKEUp
DQpbICA2MTMuMTg1MjQ5XVsgVDY5MDhdICBwaHlfcWNvbV9lbXUoRSkgdXNiX2JhbShFKSBtc21f
cW1wKEUpIGRhYnJpZGdlKEUpIG1hcnZlbGwoRSkgbXNtX3NoYXJlZG1lbShFKSBxY29tX3ZhX21p
bmlkdW1wKEUpIG1zbV9tZW1zaGFyZShFKSBwaHlfcWNvbV91ZnNfcW1wX3Y0KEUpIHBjaV9tc21f
ZHJ2KEUpIHN0bW1hY19wbGF0Zm9ybShFKSBzZGhjaV9tc20oRSkgcGluY3RybF9zcG1pX21wcChF
KSBwaHlfZ2VuZXJpYyhFKSBycHJvY19xY29tX2NvbW1vbihFKSBjbGtfZHVtbXkoRSkgdmlydGlv
X3NuZChFKSBjcWhjaShFKSBzcGlfbXNtX2dlbmkoRSkgbWVtb3J5X2R1bXBfdjIoRSkgc3RtbWFj
KEUpIHBoeV9tc21fc25wc19ocyhFKSB1c2JfZl9kaWFnKEUpIHZpb3NwbWlfcG1pY19hcmIoRSkg
dmlydGlvX2lucHV0KEUpIGVtYWNfbWRpb19mZShFKSBtZGlvX211eChFKSBwY3NfeHBjcyhFKSBw
aHlfcWNvbV9xbXBfcGNpZV9tc204OTk2KEUpIHFjb21fcmFtZHVtcChFKSBkbV9ib3coRSkgcGh5
X3Fjb21fcW1wX3VmcyhFKSB1c2JfZl9jZGV2KEUpIHFjb21fZ2xpbmtfc21lbShFKSBtc21fZ2Vu
aV9zZXJpYWwoRSkgcWNvbV9zcG1pX3BtaWMoRSkgcGluY3RybF8gQm9vdCBNSVNDIHJlZ2ltb25h
Y29fYXV0byhFKSBpMmNfdmlydGlvKEUpIHBpbmN0cmxfbGVtYW5zKEUpIHBoeV9xY29tX3FtcF91
c2IoRSkgcGh5X3Fjb21fcW1wX2NvbWJvKEUpIHBpbmN0cmxfc2Rtc2hyaWtlKEUpIHBoeV9xY29t
X3FtcF9wY2llKEUpIHBpbmN0cmxfc204MTUwKEUpIHBoeV9tc21fc3N1c2JfcW1wKEUpIHFjb21f
Z2xpbmsoRSkgcGh5X3Fjb21fdWZzX3FtcF92NF93YWlwaW8oRSkgcGluY3RybF9kaXJld29sZihF
KSBwaW5jdHJsX3NtNjE1MChFKSBxc2VlY29tX3Byb3h5KEUpIHBoeV9xY29tX3Vmc19xbXBfdjRf
bGFoYWluYShFKSBxY29tX2lvbW11X2RlYnVnKEUpIHBoeV9xY29tX3VmcyhFKSBwaW5jdHJsX21z
bShFKSBxY29tX3NvY193ZHQoRSkgbnRmczMoRSkNClsgIDYxMy4xOTUzMjBdWyBUNjkwOF0gIGhl
YXBfbWVtX2V4dF92MDEoRSkgbXNtX3Nob3dfcmVzdW1lX2lycShFKSBzcGlkZXYoRSkgcWNvbV93
ZHRfY29yZShFKSBzbWVtKEUpIHJxX3N0YXRzKEUpIHBpbmN0cmxfc3BtaV9ncGlvKEUpIHFjb21f
cGRjKEUpIHBoeV9xY29tX3NucHNfZmVtdG9fdjIoRSkgcW1pX2hlbHBlcnMoRSkgY2xrX3Fjb20o
RSkgcWNvbV9pcGNfbG9nZ2luZyhFKSBtaW5pZHVtcChFKSBpZWVlODAyMTU0X3NvY2tldCBtYWM4
MDIxNTQgaWVlZTgwMjE1NF82bG93cGFuIGwydHBfcHBwIGllZWU4MDIxNTQgbmhjX3VkcCBuaGNf
aXB2NiBuaGNfZGVzdCBuaGNfbW9iaWxpdHkgbmhjX3JvdXRpbmcgZGlhZyBidHNkaW8gbmhjX2hv
cCBuZmMgY2FuX3JhdyBuaGNfZnJhZ21lbnQgaGNpX3VhcnQgY2FuX2d3IGhpZHAgdGlwYyBjYW5f
YmNtIGNkY19hY20gYnRxY2EgODAyMXEgNmxvd3BhbiBjYW4gYXFjMTExIGJ0YmNtIGNkY19uY20g
cmZjb21tIHI4MTUzX2VjbSBibHVldG9vdGggZnRkaV9zaW8gYXNpeCB1c2JzZXJpYWwgcmZraWxs
IHNsY2FuIGwydHBfY29yZSByODE1MiBic2RfY29tcCBjZGNfZWVtIHBwcF9tcHBlIHBwcF9kZWZs
YXRlIGNkY19ldGhlciBheDg4MTc5XzE3OGEga2hlYWRlcnMgdXNibmV0IHpyYW0gcHB0cCB2Y2Fu
IHBwcG94IGxpYmFyYzQgcHBwX2dlbmVyaWMgc2xoYyBydGw4MTUwIHd3YW4gY2FuX2RldiBtaWkg
enNtYWxsb2MgZ3p2bSBzb2NpbmZvX2R0KE9FKSBxcm5nX2Rsa20oT0UpIHFjb21faXBjYyhFKSB2
aXJ0aW9fbmV0KEUpIG5ldF9mYWlsb3ZlcihFKSBmYWlsb3ZlcihFKSB2aXJ0X2FybV9zbW11X3Yz
KEUpIGFybV9zbW11KEUpIGlvbW11X2xvZ2dlcihFKSBxY29tX2lvbW11X3V0aWwoRSkgdmlydGlv
X2NvbnNvbGUoRSkgdmlydGlvX3JlZ3VsYXRvcihFKSBzdHViX3JlZ3VsYXRvcihFKSBkZWJ1Z19y
ZWd1bGF0b3IoRSkgcmVuYW1lX2RldmljZXMoRSkgdmlydGlvX21taW8oRSkgdmlydGlvX2JsayhF
KQ0KWyAgNjEzLjIwNDI2NV1bIFQ2OTA4XSAgdmlydGlvX2Jsa19xdGlfY3J5cHRvKEUpIGRlYnVn
X3N5bWJvbChFKSBxY29tX2hnc2woRSkgY3J5cHRvX3F0aV92aXJ0KEUpIGJvb3Rfc3RhdHMoRSkg
bWVtX2J1ZihFKSBxY29tX2RtYV9oZWFwcyhFKSBtZW1fYnVmX21zZ3EoRSkgbWVtX2J1Zl9kZXYo
RSkgc2VjdXJlX2J1ZmZlcihFKSBxY29tX3NjbShFKSBnaF9ybV9kcnYoRSkgZ2hfbXNncShFKSBx
Y29tX3NjbV9oYWIoRSkgbXNtX2hhYihFKSB2aXJ0aW9fY2xrKEUpIHZpcnRpb19jbGtfbW9uYWNv
KEUpIHZpcnRpb19jbGtfbGVtYW5zKEUpIHZpcnRpb19jbGtfZGlyZXdvbGYoRSkgdmlydGlvX2Ns
a19zYTgxOTVwKEUpIHZpcnRpb19jbGtfc202MTUwKEUpIHZpcnRpb19jbGtfc204MTUwKEUpDQpb
ICA2MTMuMjE3MzU1XVsgVDY5MDhdIENQVTogNiBQSUQ6IDY5MDggQ29tbTogdXNiLXN0b3JhZ2Ug
VGFpbnRlZDogUCAgICAgICAgICAgT0UgICAgICA2LjEuNzUtYW5kcm9pZDE0LTExLW1heWJlLWRp
cnR5ICMxDQpbICA2MTMuMjE5MDk0XVsgVDY5MDhdIEhhcmR3YXJlIG5hbWU6IFF1YWxjb21tIFRl
Y2hub2xvZ2llLCBJbmMuIFNBODE1NSBWaXJ0dWFsIE1hY2hpbmUgKERUKQ0KWyAgNjEzLjIyMDA4
M11bIFQ2OTA4XSBwc3RhdGU6IDgwNDAwMGM1IChOemN2IGRhSUYgK1BBTiAtVUFPIC1UQ08gLURJ
VCAtU1NCUyBCVFlQRT0tLSkNClsgIDYxMy4yMjA5MzJdWyBUNjkwOF0gcGMgOiBtaWdyYXRpb25f
ZW50cnlfd2FpdF9vbl9sb2NrZWQrMHgyYTcvMHgyYTgNClsgIDYxMy4yMjE0MjldWyBUNjkwOF0g
bHIgOiBfX3dha2VfdXBfY29tbW9uKzB4ZTQvMHgxNjgNClsgIDYxMy4yMjE5MDVdWyBUNjkwOF0g
c3AgOiBmZmZmZmZjMDE3NzZiYWMwDQpbICA2MTMuMjIyMTQ5XVsgVDY5MDhdIHgyOTogZmZmZmZm
YzAxNzc2YmFjMCB4Mjg6IDAwMDAwMDAwMDAwNzAwMDAgeDI3OiAwMDAwMDAwMDAwMDAwMDAwDQpb
ICA2MTMuMjIzOTE5XVsgVDY5MDhdIHgyNjogMDAwMDAwMDAwMDAwMDAwMCB4MjU6IGZmZmZmZmMw
MGEwYjg2NDAgeDI0OiAwMDAwMDAwMDAwMDAwMDAzDQpbICA2MTMuMjI0NzUyXVsgVDY5MDhdIHgy
MzogMDAwMDAwMDAwMDAwMDAwMCB4MjI6IGZmZmZmZmMwMGEwYjg2NDAgeDIxOiBmZmZmZmZjMDE3
NzZiYjU4DQpbICA2MTMuMjI1Mzk5XVsgVDY5MDhdIHgyMDogZmZmZmZmYzAxNzc2YmIzMCB4MTk6
IDAwMDAwMDAwMDAwMDAwMDEgeDE4OiBmZmZmZmZjMDE1M2JkMDc4DQpbICA2MTMuMjI2ODkzXVsg
VDY5MDhdIHgxNzogMDAwMDAwMDA3YTI0MzIzNiB4MTY6IDAwMDAwMDAwMjQzMjM2OTQgeDE1OiAw
MDAwMDAwMDAwMDAwMDA0DQpbICA2MTMuMjI3ODA3XVsgVDY5MDhdIHgxNDogZmZmZmZmODFkYmY4
MDAwMCB4MTM6IDAwMDAwMDAwMDAwMDJkYzUgeDEyOiAwMDAwMDAwMDAwMDAwMDAzDQpbICA2MTMu
MjI4NjQxXVsgVDY5MDhdIHgxMTogMDAwMDAwMDBmZmZmYWRjNSB4MTA6IDAwMDAwMDAwMDAwMDAw
MDEgeDkgOiBmZmZmZmZjMDA4MTI2MmY0DQpbICA2MTMuMjI5MTg2XVsgVDY5MDhdIHg4IDogZmZm
ZmZmYzAwODJkNjk0MyB4NyA6IDIwNWI1ZDM2MzkzMDMzMzMgeDYgOiAzMTJlMzMzMTM2MjAyMDVi

--_005_AS8PR10MB689056B898B3AF8A8D9D7180EB4A2AS8PR10MB6890EURP_--
