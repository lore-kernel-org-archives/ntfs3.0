Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B83318B9D
	for <ntfs3@lists.linux.dev>; Mon, 25 May 2026 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731105; cv=fail; b=qhmmgQH4b8B8aPYKAWzbL3PGHnVx+54TrqGr+MEuyY96iyFr5vMmzh2TDhz11j7wCFxHCl/Dx4V2lO+1hkXLBPGZzwo8/eiKPzYWTn3yWVns1BtZ2eJcRz+65F26GHZaObNvP1nImrIRxjWWe0vW0Yr+DVEkmRahbll/RhTzlpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731105; c=relaxed/simple;
	bh=ypFiOdqUpX9sRK1M/1IThkgUrxESasgMHomaDGlGMBE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kt81OvX4d4yNm5BZYjToEiZQKXHjODQxXNj4JDfZkreXPMT2g0aBIPWC8XdArqlc6ZIdcTEfWcKRpEqyjgURE51idfaQS4JNw3bQhzJCl8LE2mYpgKLNHe/rDgqtj0HauTWvGpaZ0NthOIEm+EzAAkZkrvQYshwkMU8opy3l3Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=us.bosch.com; spf=pass smtp.mailfrom=us.bosch.com; dkim=pass (2048-bit key) header.d=us.bosch.com header.i=@us.bosch.com header.b=rjyrDcgu; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=us.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=us.bosch.com header.i=@us.bosch.com header.b="rjyrDcgu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIVCN+y2aK9lJHDjpEXMhLi07OITlqQr5HtLKJq9h/pMzhwcl3O8dQTce7helodLn8XstICiILsp0vdryBUDsHET0NYAfOrdu00j/l3gSy5EAtR2vbcqeKeAOrguV0KakLTaL9JQcJayvd9/ymoWGXlYJEl1udOUWyikcUz3sa4gCvokSLVaYyYBg3ArxA2fNMg8kYqNDGj32AxKKq1M5SMERYiSmi6Pj5yDhTOl73sGeCbxgKgIGMrQoq59qniVWDr+GfRbHsWteNehk1aSzODK2kQpcauVHqgtQiXpkNdIAiJJ+BrUd4w6GwMVZLD2XuIvQa2jmIum/AEGqqY4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anvbt/6lG6e/PvtObxeAqDVEyUkKci5qrhvCCVcoZaY=;
 b=jmrQzafqh/KCUwFRt79w5iGdOqU6IqDmlk2pnHowDC+iFHjY/ozcpinDziAfQVBCkLGXxrtDPsDqOT8GBR8S446M4dj3G7t9alIz3KJDqRNGR7eEsJWlFrPVjkkP9AySheJ/qfZeiiOfpqPgg+yg1LEltww1SJclyLyMk7Rb1fJUfPC6nvJAn+aS9QkUBeatLnq8OTINhF0prCIbriUOXAZSJkywl2PuBElr+Y7HrCIXMacS3x3nl3GW5Iwe0aiCdcszmI3Q75UvBCOSjJU04L1c6fiDzLCMFv67boU4+O61drLWc7Sf+QBENEVQzWHnYWwZ0UIfdRvDxqcuREdkfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.bosch.com; dmarc=pass action=none header.from=us.bosch.com;
 dkim=pass header.d=us.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=us.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anvbt/6lG6e/PvtObxeAqDVEyUkKci5qrhvCCVcoZaY=;
 b=rjyrDcguPXoFQVjkjGQohOz7g4h35+VnR/FD/nvUaM/+W5W1BBsz7tVPGRylFYUy4Acz4weI2UladVUvhZTXxvrftI9DvPkEgn22J/RA8fB0oyXK04P05VGxfhG8iMWSBvm+QNqO5DHAflU6AbLaaYhAsUSFTQdjvtE2kzTh6o/AwCc57OzZ92okUsQF9Cp2yE8SyI2UfUStuJ8apRyMybYU/TpYk/YDVhWV+fDIoq6ICGN+4xUffvGJT3g6vit2DPgr3tVifDqMsGzNJGAQlIkQh9gBUUx/0kUQqxRaKfG8XpfOAUNVqezkyvygdkbeEp904CgNePr3jXtOyZgZew==
Received: from PAVPR10MB7163.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:313::15)
 by AS8PR10MB5901.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:526::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 17:44:56 +0000
Received: from PAVPR10MB7163.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4be6:90d8:ede5:79a9]) by PAVPR10MB7163.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4be6:90d8:ede5:79a9%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 17:44:56 +0000
From: "Huang Weiliang (XC-CP/ECC2.3)" <Weller.HUANG@us.bosch.com>
To: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
CC: "almaz.alexandrovich@paragon-software.com"
	<almaz.alexandrovich@paragon-software.com>
Subject: kernel panic during USB ntfs3 mount-umount stress test
Thread-Topic: kernel panic during USB ntfs3 mount-umount stress test
Thread-Index: AdzsbTWQVwP1YCqGRnWIXmUivWBchA==
Date: Mon, 25 May 2026 17:44:56 +0000
Message-ID:
 <PAVPR10MB71635C5EF1E4FED2FF9C8107B60A2@PAVPR10MB7163.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=us.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR10MB7163:EE_|AS8PR10MB5901:EE_
x-ms-office365-filtering-correlation-id: 3009ad95-10c1-4e90-9166-08deba8555ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|38070700021|5023799004|6133799003|11063799006;
x-microsoft-antispam-message-info:
 CitDXX0UACHPfMB6ZbVgoCRyHUiz56q151flzX2a4pnXpdjLsZaFcCg4KyMtvash0BCfzhzFa8JANfTkZTyUvDDBDeoUTbh/1mPmRVn8F9xqb119VZUlOkk3E6SyKvyTCAX9bsH+pVGI0GiGoMjCFdMsFKTzZHYuhqdsRLzcTH6sMaQ67WvEsSUVugpZ9S4WqjLij+l58HAfj7Ou/fRfRmSfHU79FqcgGtuIAp3LdARqW8L7xFV6y6OkWjxSePCMaFvcyyPnrwgc63rxHmxxXY5MxHBH2IkipS2VhFTu8Q5hSK/B1uvSPOJiiwhiaq9IYzYykr+QDRExdurh1zCd6O+AArNewy7vh7rm/gfhnIU71e3UFdGwCHS6d5QqfARPXJCsGHbG7cQUgCGve34gsjLQMzl+GX5tCqjlSZaKgKj4Bc/sHH4MtSny27hJQbE6yIHs3biRg/0e38cA6buGetgREdeaS45TOBQ3yPOFzppDGQHDXL5T0/ohIgtiBO8AX4nnyhWiGHnDZMlhJwS+6EL6sHSBq2K6UCOLvo3Ri+anRePQ5YEig1eC1LFibtvd+RnrnQmSV1PXIq9ReizKAYJwGM7fHLUf2eGdj680A6CNh75AH+Rs8IwdDF7lLBBK1ATO6jdZCncKe/GulirIh+yKq9TF7l+hdew1JSicu03C8+CqUCn1Uo64vvkAQrMnIwZJzB4rMvD4sBU+Ngm7i956aEiq6NLnGKto9OrinXNu/OTTKgOjJ5TkUfAbtqeh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR10MB7163.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(38070700021)(5023799004)(6133799003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?Vk9WRlhKekJndjIwcFJwNU1wV1JVa1Fod3FiMEU1TWRCNnNMbUNnMmdy?=
 =?iso-2022-jp?B?d1huSG04WURjdjZoMUUzKzVaa3l5Q0JDT1VHbUZDNUMzTVlKU3hMZFBm?=
 =?iso-2022-jp?B?OVdocGpTTW9hOURxckZMMXZxaGZtdUlOTWdJZnJCSXE2YnF0SGlYRTJ1?=
 =?iso-2022-jp?B?Tmd3UUdRdnNIeGJ6R1ArZmo1VllTWkhkRTlWRzdmbW5oN0hOZFhsQlpV?=
 =?iso-2022-jp?B?ekk5SU4zUmpUdzRTQ1RMR0g0RnJqRXdtWHdjSVkvbE8wUGxqNDJvM3Vy?=
 =?iso-2022-jp?B?eU1BNEk2MS92SDZUNXhpamg4V0I2RWZoemk5aEQ1VHlOajMvdEsyZTJ6?=
 =?iso-2022-jp?B?MmxHMk1QQmc3SFB0dnE3RnNHT05QTzhLN2lkVUZYODNiejlXRDk1Rkxt?=
 =?iso-2022-jp?B?NTN3N1VSRlNWMXl5R1VILy9PblE0aEt1NUcwOTBkamxIYzJvVXdjdG10?=
 =?iso-2022-jp?B?V0E0aXZLOXBNTG10SUJTbXoyTjBFQm5Xb1duZjdEdEFXNnc5UUUxdTFE?=
 =?iso-2022-jp?B?REhhNUJLWGxLbzg2Z0FxUFhabFRJdjZ5MlIrN3h1V1lNVDlQQ3o3d1V6?=
 =?iso-2022-jp?B?SHVDeUFGZnJaTTR1V01ZU29sV1lYUk9ia1g1M28xTk0vUXE3TDJNMTNl?=
 =?iso-2022-jp?B?NTY0MGpmRTU3YlpQd0RPWWRkRnZhYW5GNlZOTFd2RHRzZmVMb0ZjRXRV?=
 =?iso-2022-jp?B?TnU3UmcySGptc04zc2EzMSt6bzBXcEFnYUl1N1A0aGdienVGbFNnang0?=
 =?iso-2022-jp?B?dlBHN2UxVXdiQmVacHlDU0N2aklBTVlwSHR6UmI0bWdseEFIN3hpRmo0?=
 =?iso-2022-jp?B?cGFxUXplM1NCUncybWNZVzVoanIrZnRKSDZJZGVURUpOM0FTRllpOVRP?=
 =?iso-2022-jp?B?WVMxaW5TZFdPb2wvZExMREJ0M1B1c2pZa1g0anVRZWdaYjlkbzBaN2dr?=
 =?iso-2022-jp?B?WE4vWk5DV2tPUkdadDNzZWZkNkhWaGdaVDVwaFg4YjhIOW43MFhUeEVX?=
 =?iso-2022-jp?B?RjZMdjJ0YmJNbEdrYzhBQlljcEE0T0dMaWtPNzZrdThOemp5YlU2OVZY?=
 =?iso-2022-jp?B?bWVzUzJLMVZ3eFpGMS9kN082cXdjN2R3dUVyRjBYWnVUL3RrSXl0V0RM?=
 =?iso-2022-jp?B?RkpVak5IaEw5YzdqZStRM0M2bFQzYzh4RVQyR3hvNHhkYmg5L3MzUFk0?=
 =?iso-2022-jp?B?MnN3ZjJMQ3dnVEVaZlVqbVA5SWI5YnRtUGgrMXFncnR5SHJYWWRKdkVh?=
 =?iso-2022-jp?B?RkhzMWRqQy9kdlJ0ZTJtM0IxWGJIZGJXaFY4azdXYjh4amdEQVZZRXVy?=
 =?iso-2022-jp?B?a0tBd3AxZXQ5eVpHOTlQVzVWN05jekhsTld5cTFFODlMTzhzS0t4clcx?=
 =?iso-2022-jp?B?eWl1d2FXRnlURjhwdnJhRTZmdEEwOEFsR2JLSUJ6Z3VZWmlKNWdkNHFa?=
 =?iso-2022-jp?B?YUFXMTUzbXE5dzZpN210dUp2dlh0WXdsTlgyVEtpem9UQzU3SjNlNERa?=
 =?iso-2022-jp?B?Qm9DbnQ5TThZZUU3aVlyZzJUOXlZeXhSakhrQjg0Z3Q3cFd2WWxLMXBs?=
 =?iso-2022-jp?B?WlVWQytoU3plY2NxVHNSNDFrOXJSbmszTFI0dzhrckZ5eGZiWnlob2VY?=
 =?iso-2022-jp?B?Z3UyWlBmT1NweU9MTWxjWTBLd3pNN0VtbEpYS0pIL0s0Tm40elduUkxv?=
 =?iso-2022-jp?B?RXZPU3VaWkd0bTRWdTR6dktSSkJQRklUaVR1T0toVnBIazR2MTZ4cWxP?=
 =?iso-2022-jp?B?YWlVdWc5RFRpR2pzbi80RllFWElkYnI2TnNieUVUc3JlSGhaNldPT0E1?=
 =?iso-2022-jp?B?OGREVjg2cThieFpPNm8yN3ZESm14MmU2L2pmVWxHUTJPU084TEtOSHdQ?=
 =?iso-2022-jp?B?Y09FWURRUkRKTVBDcEloSnA4TitKUlVuSDd6UkQ3eU5MeVA2V0Ivb1B4?=
 =?iso-2022-jp?B?U1pFQzhJdG1UYnY0Ulh0MXpNaEdPanFXcHRBcjA4U2FhcHZRU2lhaW1E?=
 =?iso-2022-jp?B?VjdjZ1MrTDJ3eGVNNTYwL0ZlUk9UekV5SVBQY1M1YnBWYnBMVWRNQ2hp?=
 =?iso-2022-jp?B?TVZOdzQ2UmRkT1RCdEx1Z2Z3UmM5WFNGUGpWMUU3VXJSd1JtS3UyWnov?=
 =?iso-2022-jp?B?OFFTTGZ4UkVMNHdCTWMvc2dqaVQ1K1RBRGU4TXlWUUM0ZHQrUkFKdHdv?=
 =?iso-2022-jp?B?OHBOeXhJMGtGY2F4VytHWWpFV3BBRzZaaEJQdWJGQk9sOGlodXUrNGZ0?=
 =?iso-2022-jp?B?WGtrNEhCYXBVVkRKaFFON1lnQUVIUE53ZFVDUVFzYm1XTndUOG1rUDFG?=
 =?iso-2022-jp?B?Tnk4a0w2d0Q3NVZIdDUzQXVZZ3o0ZHlIZXFLd2d6YmFSUUdQRU1qSU51?=
 =?iso-2022-jp?B?SUJNRk8reHNrU1pyQTQ1VVp1SXNJNjh0WWt0dlFoSXVzUHVVY1p1cVJH?=
 =?iso-2022-jp?B?VGZpVUs2THpLZnRWMThIYlhpV0NWdGZlaUE2MHV0R3dZSGl1K0lZSXJr?=
 =?iso-2022-jp?B?RUh2ZWI5?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: us.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR10MB7163.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3009ad95-10c1-4e90-9166-08deba8555ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 17:44:56.7560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFJAiIqL6WoEr3AGgdEbUiUzWpFzcxYAUltt/v8B8rZriUuixl8T1z3M+JUZk6qooGiwiugs4IkF0Rg/9+qGyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5901

Hi,=20

We got kernel panics during the USB ntfs3 mount-umount stress test.  Below =
are the details of description.

Platform information : android 14 virtualized platform with USB3.0 port be =
passed through to android guest. Qualcomm SoC with kernel version v6.1.138-=
android14-11


There was a report of kernel panic [1] which we solved with a work around [=
2].=20

Recently we got another kernel panic [3] report from the same function.  Wi=
th patch [4] + revert of patch [2] we cannot reproduce the [1] and [3] anym=
ore ([3] is very hard to be reproduced only once so far with workaround [2]=
). This passed 16,000+ mount/unmount cycles without failure.

Patch [4] proves the root cause: during mount, ntfs_read_folio is re-entere=
d for the next page while the previous page's BIO completion is still runni=
ng on the USB-storage thread, and the concurrent completions corrupt folio =
waitqueue state.

During mount, ntfs_fill_super reads ~16 MFT records sequentially.
Each read goes through:

  ntfs_fill_super =1B$B"*=1B(B ntfs_iget5 =1B$B"*=1B(B read_cache_page =1B$=
B"*=1B(B ntfs_read_folio
    =1B$B"*=1B(B mpage_read_folio =1B$B"*=1B(B submit_bio (returns immediat=
ely)
   =20
When the next read_folio starts, the previous BIO's completion
(folio_wake_bit =1B$B"*=1B(B __wake_up_common) traverses waitqueue entries =
that
reference stack memory already reused by the new read setup, causing
memory corruption ? manifesting as CFI failures or corrupted pointers.

The patch [4] is doing : Serialize page I/O during mount (while sb->s_root =
=3D=3D NULL) by holding a mutex across mpage_read_folio + folio_wait_locked=
 (non-killable)

We think the panic [1] and [3] are same root cause just different symptom. =
 I want to get some idea from community :=20
1. whether the root cause is correct =20
2. whether patch [4] is good enough
3. is there any other fix for such kind of issue.


[1] <<<<<<<<<<<


[ 4155.176436][T10073] CFI failure at __wake_up_common+0xd4/0x160 (target: =
migration_entry_wait_on_locked+0x29f/0x2a0; expected type: 0x7a243236)
[ 4155.177495][T10073] Internal error: Oops - CFI: 00000000f2008228 [#1] PR=
EEMPT SMP
[ 4155.177891][T10073] Modules linked in: ...
[ 4155.191427][T10073] CPU: 4 PID: 10073 Comm: usb-storage Tainted: G      =
     O       6.1.138-android14-11-g2c4d262b8316-dirty #1
[ 4155.192576][T10073] Hardware name: Qualcomm Technologies, Inc. SA8195 GM=
-VCU HIGH Virtual Machine (DT)
[ 4155.193217][T10073] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[ 4155.193664][T10073] pc : __wake_up_common+0xd4/0x160
[ 4155.193936][T10073] lr : __wake_up_locked_key_bookmark+0x20/0x30
[ 4155.194212][T10073] sp : ffffffc017c5bac0
[ 4155.194377][T10073] x29: ffffffc017c5bac0 x28: 0000000000000020 x27: 000=
0000000000000
[ 4155.194852][T10073] x26: 0000000000000000 x25: ffffffc009fd7e18 x24: 000=
0000000000003
[ 4155.195208][T10073] x23: 0000000000000000 x22: ffffffc009fd7e18 x21: fff=
fffc017c5bb58
[ 4155.195564][T10073] x20: ffffffc017c5bb30 x19: 0000000000000001 x18: fff=
fffc012e61078
[ 4155.196035][T10073] x17: 000000007a243236 x16: 0000000024323694 x15: 000=
0000000000010
[ 4155.196461][T10073] x14: 0000000000000010 x13: ffffffc2a5d2f000 x12: 000=
0000000000000
[ 4155.196831][T10073] x11: 0000000000000000 x10: 0000000000000001 x9 : 000=
0000000000000
[ 4155.197524][T10073] x8 : ffffffc0082b602b x7 : 0000000000000a20 x6 : 000=
000000000000d
[ 4155.197892][T10073] x5 : ffffffc017c5bb30 x4 : ffffffc017c5bb58 x3 : fff=
fffc017c5bb58
[ 4155.198453][T10073] x2 : 0000000000000000 x1 : 0000000000000003 x0 : fff=
fffc014613a80
[ 4155.198788][T10073] Call trace:
[ 4155.198934][T10073]  __wake_up_common+0xd4/0x160
[ 4155.199241][T10073]  __wake_up_locked_key_bookmark+0x20/0x30
[ 4155.199553][T10073]  folio_wake_bit+0x94/0x138
[ 4155.199881][T10073]  page_endio+0xf4/0x1c8
[ 4155.200416][T10073]  mpage_end_io+0xa0/0xe8
[ 4155.200608][T10073]  bio_endio+0x1a0/0x1c4
[ 4155.200799][T10073]  blk_update_request+0x130/0x394
[ 4155.201433][T10073]  scsi_end_request+0x2c/0x2ec
[ 4155.201890][T10073]  scsi_io_completion+0x4c/0x12c
[ 4155.202259][T10073]  scsi_finish_command+0xbc/0xd4
[ 4155.202597][T10073]  scsi_complete+0x70/0x15c
[ 4155.202942][T10073]  scsi_done_internal+0x64/0x134
[ 4155.203177][T10073]  scsi_done_direct+0x14/0x24
[ 4155.203385][T10073]  usb_stor_control_thread+0x1b8/0x278
[ 4155.203637][T10073]  kthread+0x104/0x1d4
[ 4155.203874][T10073]  ret_from_fork+0x10/0x20
[ 4155.204103][T10073] Code: 728646d1 72af4491 6b11021f 54000040 (d4304500)
[ 4155.204430][T10073] ---[ end trace 0000000000000000 ]---
[ 4155.229887][T10073] Kernel panic - not syncing: Oops - CFI: Fatal except=
ion
[ 4155.230357][T10073] SMP: stopping secondary CPUs
[ 4155.230745][T10073] Kernel Offset: disabled
[ 4155.230926][T10073] CPU features: 0x00,00060000,02020084,6601720b
[ 4155.231250][T10073] Memory Limit: none
[ 4155.256373][T10073] Going down for vm restart now
[ 4155.256725][T10073] Top irqs in last 4495 ms:
[ 4155.256909][T10073] IRQ 11 [GICv3:arch_timer] - 3338 times
[ 4155.257254][T10073] IRQ 52 [GICv3:virtio5] - 5 times
[ 4155.257479][T10073] IRQ 78 [GICv3:virtio53] - 192 times
[ 4155.257686][T10073] IRQ 201 [GICv3:virtio35] - 2488 times
[ 4155.257928][T10073] IRQ 233 [GICv3:xhci-hcd:usb1] - 1645 times
[ 4155.258163][T10073] msm_watchdog 17c10000.qcom,wdt: Causing a QCOM Apps =
Watchdog bite!
[ 4155.258445][T10073] msm_watchdog 17c10000.qcom,wdt: Wdog - STS: 0xffffff=
ff, CTL: 0xffffffff, BARK TIME: 0xffffffff, BITE TIME: 0xffffffff

[2] <<<<<<<<<<<<<

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 057aa3cec902..88f03a38c007 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -12,6 +12,7 @@
 #include <linux/nls.h>
 #include <linux/uio.h>
 #include <linux/writeback.h>
+#include <linux/delay.h>

 #include "debug.h"
 #include "ntfs.h"
@@ -730,6 +731,7 @@ static int ntfs_read_folio(struct file *file, struct fo=
lio *folio)
                return err;
        }

+       msleep(1);
        /* Normal + sparse files. */
        return mpage_read_folio(folio, ntfs_get_block);
 }


[3] <<<<<<<<<<<<<<<

<5>[101144.706449][T25824] scsi 0:0:0:0: Direct-Access      USB      SanDis=
k 3.2Gen1 1.00 PQ: 0 ANSI: 6
<5>[101144.708466][T23885] sd 0:0:0:0: [sda] 120164352 512-byte logical blo=
cks: (61.5 GB/57.3 GiB)
<5>[101144.709561][T23885] sd 0:0:0:0: [sda] Write Protect is off
<7>[101144.709570][T23885] sd 0:0:0:0: [sda] Mode Sense: 43 00 00 00
<5>[101144.710156][T23885] sd 0:0:0:0: [sda] Write cache: disabled, read ca=
che: enabled, doesn't support DPO or FUA
<6>[101144.723287][T23885]  sda: sda1 sda2
<5>[101144.725164][T23885] sd 0:0:0:0: [sda] Attached SCSI removable disk
<36>[101144.808701][  T381] type=3D1400 audit(1778715941.977:75142): avc:  =
denied  { ioctl } for  comm=3D"ntfsfix" path=3D"/dev/block/vold/public:8,1"=
 dev=3D"tmpfs" ino=3D14034 ioctlcmd=3D0x125e scontext=3Du:r:fsck_untrusted:=
s0 tcontext=3Du:object_r:vold_device:s0 tclass=3Dblk_file permissive=3D0
<36>[101144.809565][  T381] type=3D1400 audit(1778715941.981:75143): avc:  =
denied  { ioctl } for  comm=3D"ntfsfix" path=3D"/dev/block/vold/public:8,1"=
 dev=3D"tmpfs" ino=3D14034 ioctlcmd=3D0x1271 scontext=3Du:r:fsck_untrusted:=
s0 tcontext=3Du:object_r:vold_device:s0 tclass=3Dblk_file permissive=3D0
<3>[101144.961124][T11586] [schedu][0x1cd0317311d][23:45:42.137070] qca6390=
: [11586:E:HDD] hdd_congestion_notification_calculation: medium assess data=
 is not valid.
<3>[101144.961793][T11586] [schedu][0x1cd0317635b][23:45:42.137740] qca6390=
: [11586:E:HDD] hdd_congestion_notification_calculation: medium assess data=
 is not valid.
<1>[101145.067401][ T9611] Unable to handle kernel paging request at virtua=
l address ffff8d623ef357f8
<1>[101145.068235][ T9611] Mem abort info:
<1>[101145.068372][ T9611]   ESR =3D 0x0000000096000004
<1>[101145.068539][ T9611]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
<1>[101145.068912][ T9611]   SET =3D 0, FnV =3D 0
<1>[101145.069340][ T9611]   EA =3D 0, S1PTW =3D 0
<1>[101145.069561][ T9611]   FSC =3D 0x04: level 0 translation fault
<1>[101145.069982][ T9611] Data abort info:
<1>[101145.070139][ T9611]   ISV =3D 0, ISS =3D 0x00000004
<1>[101145.070362][ T9611]   CM =3D 0, WnR =3D 0
<1>[101145.070565][ T9611] [ffff8d623ef357f8] address between user and kern=
el address ranges
<0>[101145.070848][ T9611] Internal error: Oops: 0000000096000004 [#1] PREE=
MPT SMP
<4>[101145.071088][ T9611] Modules linked in: ....
<4>[101145.081180][ T9611] CPU: 3 PID: 9611 Comm: binder:529_A Tainted: G  =
         O       6.1.138-android14-11-gccb94a5465a9-ab103 #1
<4>[101145.081592][ T9611] Hardware name: Qualcomm Technologies, Inc. SA819=
5 GM-VCU HIGH Virtual Machine (DT)
<4>[101145.081876][ T9611] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT =
-SSBS BTYPE=3D--)
<4>[101145.082234][ T9611] pc : ntfs_read_folio+0x24/0xe0 [ntfs3]
<4>[101145.082791][ T9611] lr : filemap_read_folio+0x6c/0x15c
<4>[101145.082948][ T9611] sp : ffffffc01c05bad0
<4>[101145.083098][ T9611] x29: ffffffc01c05bad0 x28: 00000000fffffa00 x27:=
 0000000000080001
<4>[101145.084597][ T9611] x26: 00000000ffffffff x25: ff00000000000000 x24:=
 ffffff8d623ef4e8
<4>[101145.085074][ T9611] x23: ffff8d623ef35800 x22: 0000000000000000 x21:=
 ffffffc001591414
<4>[101145.085405][ T9611] x20: fffffffe378c42c0 x19: fffffffe378c42c0 x18:=
 ffffffc0109a0080
<4>[101145.085632][ T9611] x17: 000000001b98ee9a x16: 000000001b98ee9a x15:=
 ffffffc00158ed90
<4>[101145.086058][ T9611] x14: 0000000000000007 x13: 000000000001d3a2 x12:=
 ffffffce57fbe000
<4>[101145.086454][ T9611] x11: 0000000000000001 x10: 0000000000000001 x9 :=
 0000000000000100
<4>[101145.086784][ T9611] x8 : ffffff8d623ef4e7 x7 : 0000000000000000 x6 :=
 0000000000000000
<4>[101145.087072][ T9611] x5 : ffffff8ca937808c x4 : ffffffc01c05bb50 x3 :=
 0000000006100cca
<4>[101145.087352][ T9611] x2 : fffffffe378c42c0 x1 : fffffffe378c42c0 x0 :=
 0000000000000000
<4>[101145.087562][ T9611] Call trace:
<4>[101145.087657][ T9611]  ntfs_read_folio+0x24/0xe0 [ntfs3]
<4>[101145.088008][ T9611]  filemap_read_folio+0x6c/0x15c
<4>[101145.088227][ T9611]  do_read_cache_folio+0x144/0x338
<4>[101145.088465][ T9611]  read_cache_page+0x1c/0x58
<4>[101145.088682][ T9611]  ntfs_fill_super+0xde8/0xf20 [ntfs3]
<4>[101145.088941][ T9611]  get_tree_bdev+0x1c4/0x258
<4>[101145.089121][ T9611]  ntfs_fs_get_tree+0x18/0x28 [ntfs3]
<4>[101145.089377][ T9611]  vfs_get_tree+0x48/0xfc
<4>[101145.089586][ T9611]  do_new_mount+0x154/0x36c
<4>[101145.089723][ T9611]  path_mount+0x270/0x4e4
<4>[101145.089864][ T9611]  __arm64_sys_mount+0x1b4/0x3dc
<4>[101145.090001][ T9611]  invoke_syscall+0x58/0x118
<4>[101145.090163][ T9611]  el0_svc_common+0xb4/0xf4
<4>[101145.090383][ T9611]  do_el0_svc+0x24/0x80
<4>[101145.090471][ T9611]  el0_svc+0x2c/0x90
<4>[101145.090805][ T9611]  el0t_64_sync_handler+0x68/0xb4
<4>[101145.090993][ T9611]  el0t_64_sync+0x1a4/0x1a8
<0>[101145.091168][ T9611] Code: 910003fd f9400c28 aa0103f3 f9400117 (385f8=
2e8)=20
<4>[101145.092609][ T9611] ---[ end trace 0000000000000000 ]---

[4] <<<<<<<<<<<<<

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 2a95a2198a91..224bd787429a 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -8,16 +8,23 @@

+#include <linux/mutex.h>
 #include <linux/namei.h>

 #include <linux/writeback.h>
-#include <linux/delay.h>


+/*
+ * Serializes page read I/O during mount to prevent a race where concurren=
t
+ * BIO completions corrupt folio waitqueue entries.  Only used while
+ * sb->s_root =3D=3D NULL (i.e. during ntfs_fill_super).
+ */
+static DEFINE_MUTEX(ntfs_mount_io_mutex);
+
 /*
  * ntfs_read_mft - Read record and parses MFT.
  */
@@ -750,8 +757,26 @@ static int ntfs_read_folio(struct file *file, struct f=
olio *folio)
                return err;
        }

-       msleep(1);
        /* Normal + sparse files. */
+       if (unlikely(!inode->i_sb->s_root)) {
+               /*
+                * During mount, serialize page reads and wait for each BIO
+                * to complete before allowing the next one.  This prevents
+                * a race where concurrent BIO completions from the USB
+                * storage thread corrupt folio waitqueue entries ? observe=
d
+                * as CFI panics in __wake_up_common on SA8195 VM.
+                *
+                * After mount completes (s_root !=3D NULL) this path is ne=
ver
+                * taken, so normal read performance is unaffected.
+                */
+               mutex_lock(&ntfs_mount_io_mutex);
+               err =3D mpage_read_folio(folio, ntfs_get_block);
+               if (!err)
+                       folio_wait_locked(folio);
+               mutex_unlock(&ntfs_mount_io_mutex);
+               return err;
+       }
+
        return mpage_read_folio(folio, ntfs_get_block);

