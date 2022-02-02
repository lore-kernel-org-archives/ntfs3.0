Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2097.outbound.protection.outlook.com [40.92.20.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCFE2F28
	for <ntfs3@lists.linux.dev>; Wed,  2 Feb 2022 21:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHwbZiNQg/w2VWQrzUfaUmdBR01zBCj3SSi7GMDcDaNa6zNyty+l9AvT9yMHKQguC62lxm+GK9jMcZUNQseoOmYRY2QwhxLWXZSMPosv3WBvW2yobznDieykU1ebRk+xb/ms8FPBxF9Q4AoCmSlA2Ywoz2ErvDZpBUPMX/N5ovBU8FkINx+iOI6FqLOJqM2a/7Iav8i+nQ+y0EAgi2fddw9jSjHHEZ5f8ApQeQpBC7N+n9UF2/148UZN786Gn2wJgnRryyPr+fst+39ppFTlhkZQTGpiItCC1r7C7BxhaiHO5JKLmmh5tGYRoyP6AKnP0yx1UcOCmkrRrWCUgLIvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MTWfFpoL02QcNXT7lelXrzZk21+7hufiEaEUNBK/w8=;
 b=QSfoWz+Eq4JXhoA8cjGVedb8GAKTxtKWSFmNfUvf1YDB4aCgAWtCMI/fCvU/LZHMbMhXnz8M5VamnyYdBqEeBWxiEe1yDqAc7GTb2hzNnskHoVpfkHui/Q5X4ZzxMIQOJYxRoBbw0G2NCeKeTPNZhdNkrmDd1C3Iw04RPMRXSJJ9PAi1919dWk/InBf/rYAlQOVruAO5hD+PzC+jSfUDUDmjOEP7ZlxVGLMxkISGotK6pEKEBZGmOUCBnyaBfEEH0eiB70ILJPaGfuX3vPYEBhMMQMwPen7N6StQ2sYx5RdLXvY7tLoFEhzZmBNT5p8AIqSBAFpcfHPqqIw4wfantg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MTWfFpoL02QcNXT7lelXrzZk21+7hufiEaEUNBK/w8=;
 b=PEBic6F5PIsuVEPF8GuYCgZRXYf2lXyjxadX7y5p900b79Q1z6GosVvtlGZwoWiocZPmWqaVVWMpQ1tCvcjjaUjdQ6NmD0vdcg0zXFNx9MCRp/vSaDiR7IuFdIAM/4O2US0JQq/Nd2HuUIUZG8x57bUgS0QjfVaeFp9I7ZmjgcDV94S1W9tFBPfH9rbdMjTeO6NSQKmA0N6m5Avkd8wQ7byaCoNDkGZZUzXBNyMyOOCRIHzrOU8VGUtzrEoIo+bT6WQpBCrtTYdzZehTlxMIccKALqt4xxl/z1G5XkjTiG2r5MtOYT3GVqxsaOCpWg+WpuLRboveFrKQzU6O94z7OA==
Received: from DM6PR04MB4938.namprd04.prod.outlook.com (2603:10b6:5:fc::23) by
 SN2PR04MB2383.namprd04.prod.outlook.com (2603:10b6:804:9::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.18; Wed, 2 Feb 2022 21:35:31 +0000
Received: from DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::1508:9a17:4465:279b]) by DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::1508:9a17:4465:279b%7]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 21:35:31 +0000
From: Ganapathi Kamath <hgkamath@hotmail.com>
To: Matthew Wilcox <willy@infradead.org>
CC: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>, Konstantin Komarov
	<almaz.alexandrovich@paragon-software.com>
Subject: Re: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on
 Arch Linux)
Thread-Topic: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on
 Arch Linux)
Thread-Index: AQHX/l/CzzwGd3PWik2FMZXf0niOlKxao8U+gABHzACAJg4m0w==
Date: Wed, 2 Feb 2022 21:35:31 +0000
Message-ID:
 <DM6PR04MB4938819DC4C0715A0D971FB4DA279@DM6PR04MB4938.namprd04.prod.outlook.com>
References:
 <DM6PR04MB493813D5A09B3F03378E9398DA469@DM6PR04MB4938.namprd04.prod.outlook.com>
 <DM6PR04MB493866F0E97AD8DE883D0ECEDA4F9@DM6PR04MB4938.namprd04.prod.outlook.com>
 <YdsKMu+W+R1YjOhj@casper.infradead.org>
In-Reply-To: <YdsKMu+W+R1YjOhj@casper.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 7e6e93e1-210d-e592-f4fa-74202bdbfa62
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [QWUe7xzh27Ts5Hi94TdKhuEl5/XgoPql]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd21513d-3c63-4b3c-bd3d-08d9e693f040
x-ms-traffictypediagnostic: SN2PR04MB2383:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8XUKzVZKu9UonYLnyh7E+2xuzzGz+e6QlwtmF4FAD275YHIZp2KPhqtgshQ/SoVHxGKPD6pPpiBxK5+NSx2A8/DThBUsobgnjjr6qElTjrt0NJPQdX8DT7WNC3m2oga/Z1vEVpaMmPBzSFqjYMqKN4mucAoN5nmz2ZPnH2wtbFTQ2lXBXpf8igXXL+yJekTzp8+PhZMHrn2Ch0yqUq+GcqhWE8jk4B8IgbwJJMX0ygnmqTSdSXfy7bpM6SrCKLsYij1RiNLneg8gf9odF1NXzCYu7iZjoBf9/5E1xrXZH08n9IlwlG7eJA7p+KOp54ygLn8JT82pQ935SRJq8FoHmR8LwM4sJ1HXAqC5oeP6HtFcr39m8umzHUHcdQv6n2Dw2n7w/JelsBEeMd6wohKfQMqRijZjyamCEDZgWkO2aupoG+kB89H+GfvtAamrUBSu9gFEUSO7KN24sOpBLKW5ZCOwx93gH8Pqp3EtRtqojvAwAxaOXOF5tDrD+IJJuULSd0InmBzEe6+Erg9JXnfTPxD97uAJTfvgt/vyG7OuTwlowweja8LS2ut5av5lXCa4ZwPDcDh2Gi+AmFFuEgxgm/04E9edKnZYqd20cK5zcetH7R/jdFeW3lUdDlDLkD14
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 eQQGg4M5SvJnvzo0/PWXL8ahabVJEXMQJdBxxJnfwlF2UQnF6FRAnKQexh09FCEC9+agILOv3w0xSfCE7/5Xkpw7PYk3LzBQj8KQEQvPucElNRb4KkDg4IHa9jO2p1s2XFzVntG51Su+Ga3fW7HjANU3l7lrjo/rXKeFU5OhUCNBM7umRPZxI2Turiw1V5X0BT/W5D7h6XsfdjMTdZFpwFzl4Z/USzeqqvZWhlAMEd96P5PFgAO03INvkgZpoXdBN6C7j8PlnyWRX3puLPt/fuluxdpjVWw1K65vwrE2dCcaBBryDbXES9BIeBnPFmtfWD7JF0d5nZtWtQTDpCY1uoazcc2knv8WhOImM+R+EUlY65jRAuNXdgeWb8IwbbaK2W9PJAxJtOSntEFTirPa+Dq+4GYKRu4Ugs71bsonJD6T4VhbW+3dkWcgJ+lr+3qskH+5kCScwZtVsTEtR20CDYsuJX2kqtXNQbTpHnL3bql0+QRyR2OcPusDcBHLSO5HCv/vsWesqmPWvmA8WQOsjOYBcJou4BCW3ilE98CWbnolPvtzN9ZYtNPZ0BJ+r3SJrl/i+KkjhUCYG6UnVDeFDwBaH8Zabg7sl0rIFDwDg/C3ijwf2v0Nl0SpXmv9I9oTMoT5L+wBfVycQQmFtr9EyvlqKKCAreshg4frmRvI59/KNpryglcZ7OB1f83pakM5VJz99hCC/GgdsfyIVjAwh4vEz0BJfZuXZ6Kl+2PrjrAutTcGiHnE14R/r23Dv41t2miNdPHhjNuOP0HHrgIyt+iRGAKRqD4G4DeeYtNahdHniKlH8O9NE9u6/BdGms+/FQYT9xfwDdJ9286L5EWk7CyBQrKr7d+IpjbA1C/gr3A0U38U/AK6h0wjEIKUDhxN/XQ1jLavgCHQ6MXP4XY7d3qV5WeEntRaEeGS0rgGNo5zmIsAjcOS3doChWCC5ADU
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-edb50.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4938.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bd21513d-3c63-4b3c-bd3d-08d9e693f040
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 21:35:31.3897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2383

=0A=
Rgd bug: "fs/ntfs3: page_cache_ra_unbounded on rsync from ntfs3 to ext4" ht=
tps://bugzilla.kernel.org/show_bug.cgi?id=3D215460 =0A=
Above bug, first found in 5.15.x, doesn't surface in 5.17.0-0.rc2 . =0A=
No tracebacks were emitted whether the virtual-disk used was dd-raw-image o=
r qcow2(fixed)=0A=
Unsure if the bug will recur.=0A=
 =0A=
However, on 5.17.0-0.rc2, a different trace arises on using qcow2(dynamic) =
=0A=
I filed this bug as "during rsync, vm guest kernel trace arising from memcg=
_kmem_charge_page alloc_pages" https://bugzilla.kernel.org/show_bug.cgi?id=
=3D215563=0A=
Traceback seems to come from closer to page allocater code=0A=
=0A=
-Gana=0A=
