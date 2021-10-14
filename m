Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2080.outbound.protection.outlook.com [40.92.41.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804F2C80
	for <ntfs3@lists.linux.dev>; Thu, 14 Oct 2021 16:52:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieP9Mybb9Xm1h0Al23svqKNCiGXqBewVrAUQiSPuXsRSXGYCeEx6Z/9JmJRF/JNAqQyrxnJKzvmHVIJPyiz4IQKDziw5SBb1zs0AJwopXqp6kHQ415g03r9zXzzt+NoCm34yTkKtg9aEf2c57GcICXE9AKaYyUjUMcZ1Z4CTFH2PswPNReRw0Pi8IibSSo+3xrQwQgdh1JWFMQSwhFIl0TN83+eq4hg9hCzPql+oCqWayjLxJw3LgMvFkW5USTLW912IgP7FdMKgqeC2di33MG071ekpianqKARAWgb1m4uoiOmNXu3Mtyloz9LpUITJQSlHAM5uCQQEbwXhUA0Utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLN0lZFRx9VK+BNTZYvMOLakHlCJWfIO3w4PEXtDg+E=;
 b=kQM2nEAJts4VgChX2N62oBkWQRG1bz6jLrQ9s1WsFtDz3MuuYw3kcwH+a+SiDuJZEqSMVboTbliKTEjg+Dy0wBjzoMkdCXH9dpucgF0Ak3orwUPYCb1JEPMeKSvNpemzF+q29iq2Nrejzkfgk2APdT2YHxRAhF00uzdsF0fENQ/0irSCcaUuz1BtfbdCtHh+YIAeZMPdRfRUsoWAWPNIf6OK+Z0tXZ+/boyQK2aS88V78vuFqnxYYSDwylkCYBLIn0GF2+Nypr7jwve0stEdlLMXbDniQfFMjriimre+lrQAbJGtOK4KrhW13QEsi4LO+vOTo8XteaudI8hdt94xkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLN0lZFRx9VK+BNTZYvMOLakHlCJWfIO3w4PEXtDg+E=;
 b=JvUxD4z55DFtZ8VcKHQrRGnuxEZ33S643fUwA7xBv+OUZ70BnxARwq1gfqwuVLymrdsIbAiYPDKOwXynYtg/llE1D8n90+UiOOcM6TtlERiaw9IqjYte2W3GwW4gTjVQQ2G/b2mXD+YsAG9M+LwFQeYq2vXpTjdYEJjbwUShZFCHiI3eipMrLnjjQJEaXn67nmRrYrSdUgs3GsAxarraXFZ7SubFluy6qlxzdOuCGSYwgr/NZrckSVAR5rX2aAfUEWlgh8tXluo8uKQVU/t06Su8q+EFYKrgZksWyABpHM+pLsnuy+VWBGrUP6VmA0GT4gUWIx6bG9pq544bSHbfnQ==
Received: from PH0PR04MB7237.namprd04.prod.outlook.com (2603:10b6:510:a::22)
 by PH0PR04MB7381.namprd04.prod.outlook.com (2603:10b6:510:1a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 16:52:03 +0000
Received: from PH0PR04MB7237.namprd04.prod.outlook.com
 ([fe80::356f:7265:a54a:3abf]) by PH0PR04MB7237.namprd04.prod.outlook.com
 ([fe80::356f:7265:a54a:3abf%9]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 16:52:03 +0000
From: Ganapathi Kamath <hgkamath@hotmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Subject: Bug 214719 - ntfs3: disk usage of file not updated on overwrite by
 smaller file 
Thread-Topic: Bug 214719 - ntfs3: disk usage of file not updated on overwrite
 by smaller file 
Thread-Index: AQHXwRufLCKhmE9zJ0W5ufBEhY0k+A==
Date: Thu, 14 Oct 2021 16:52:03 +0000
Message-ID:
 <PH0PR04MB7237BAC4FBD1976C83D1D158DAB89@PH0PR04MB7237.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 784764de-7811-2f40-7e3a-c5fde3a14690
x-tmn: [xBZiMTKxDvPe/h1z15o6st2TaFj1DJv2uS7T7Zh2rkQ=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 373e0e94-4a29-47dc-4b9c-08d98f32f2d6
x-ms-traffictypediagnostic: PH0PR04MB7381:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dlJQ8MX0S+EqHqf5EksIyjmh+vuiBzTVptaFE5vDDOeJGQ/2JKx/a3WJO6XIiNng8F2MMFC/vszHQ7uY3LO43UCCJTY6m5gZyp/k7S+/MT63wGdL7RSWbMk/Plbzn1QnUaVOqVclO0q5l5fOEg2aj1qnDY0fTjxSaaocXNifM/uyxm2NdOAqrj3EPFjsmtkQ/T3zNhdwGMRypvPnyK8Xz7cYKHjiRwyzQiyHtI+S4p8uX9Qb75m2303HyFOL7xMpLe1F8+0MfTOMtAGz78X6hZy+VTKPOtE4t/gksiIxJwhgY/iFMKCv7ZtvUt1F+qiLcWE28wdBbIBtTjMijt3MTBVd2IgyvyZ8aeJ/NbkaU5zk8UEWSZgM6HINclYBP3zBDbJ2u+y7h3vjCBQoYZeSpYhNhUAPovZLu6C7ktZKw8wB3SJKObYGillGlFH8gX85EqwsdqAOvsRgly3nMF+AShXhDv+Fr7fAtsPGRXDYVIOIViL8XnrhdgFpTaiiau6M/ljYjdm9pKGGN9L4lr0eIHho7S38fQxwdClyE0/Kk1EuHjP+NMM303UlYFvuF3LqDy/tv3GppbywqFtUsUowLg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 nrTobg/6RijKIu1fnl29BQpVL4adm30K6KlgHSYk2pYM9TcuB+euWbPNUODjzYXcaeAheFlYaxJryavFsR8i5NjDf0yCTFKru5RANriIkd3WrWJRIj06OHE7BJwHlV8h2dPkB83uK/3w348qG/qBlQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-529c7.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7237.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 373e0e94-4a29-47dc-4b9c-08d98f32f2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 16:52:03.3608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7381

Attn:=A0Konstantin Komarov <almaz.alexandrovich@paragon-software.com> , ntf=
s3@lists.linux.dev=0A=
Sorry if duplicate, resend in plain text=0A=
=0A=
Subj: Just bringing a bug report to your attentions=0A=
=0A=
Found email-ids from https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git/tree/MAINTAINERS=0A=
=0A=
Bug 214719 - ntfs3: disk usage of file not updated on overwrite by smaller =
file=A0=0A=
https://bugzilla.kernel.org/show_bug.cgi?id=3D214719=0A=
=0A=
Thx=0A=
-Gana=
