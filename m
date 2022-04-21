Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24B1840
	for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 01:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1650506352; x=1682042352;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aMK6HGScIfkjyT+Fmk4iaYVcjrynEow3jzE15RyEC7Q=;
  b=hk1xNDESBCwbn5Ilueaq5kVOOy6bSkCf/S90uo+fXPCmWtJJhYYQlDRB
   1eJRzCY/EytpJNeKiVcFu5jwFNxiki2fpeIBKs8jl0rr+MklXEcISGFhM
   xZDqGMDdpCBetf3yb1pnBntA+Umd9ritKjPR/g+QV/CUL4ysWU9GAfZej
   24cfDKYwNeun70SPsE6rrwnit5d2deEl7Yq8CP+ru4mDv3Xi+YSazSWtx
   rEz5fP9n853gYiDGllID6apg3KdGIfrRRl5J3yeQ8lGoqr3uFWzj/YaBC
   GxZd1DMoJ8fmNSQJH1JLgQ1h5+JPIqIIBI7TdCpsqO8G2YrAWjoYwpz15
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="54438106"
X-IronPort-AV: E=Sophos;i="5.90,277,1643641200"; 
   d="scan'208";a="54438106"
Received: from mail-os0jpn01lp2111.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.111])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 10:57:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czfJu0xi/3vhnvNOfTs8rRyM+vpRJLbRnon/7xzFWJMeyZTHoT+0lWqCGPDPrVF+TqOvyWbGrBQu/z+hnzyasZyni4KnaXrvuvcsXH9GpDzpUhcK/HkgEvadUmj3jKrx75Ql2zs78IWtLxImd1eUBHTkBUye1fFuqVSNCletx9TWuX1ec1rCK+KSo9bwmLFrjV3XdwZr9Zlz817P1PsmUIu+/e0U9pYxDz/3KDk4zJOfrSFULyyEbq8Zavks1cmneXc5KVzYMIdaxCfpDqyskGnDh8JCatDaxiuBrla51BETLcv99iDQdmOYtcf4WXTH1rpNR/EbgRsunFKzX20oIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMK6HGScIfkjyT+Fmk4iaYVcjrynEow3jzE15RyEC7Q=;
 b=FqxvVoqPWGUu+GAv9xXHqlnt59kKk+jhYvcQ0WvEKtA6SvEljwUwkeyPOlzYV8GKreCM4O88AiOiAf1Qokiup5mTe+FhIVTO4fNtvifWfEbeT22OExIWrg3SF3z85XMEt5ggvmZjSgXGiekAiCnlgUny4oFbCkr7TEcsAfyuX0BhS8e3PTchwA0J3JQt+6dyqFxd5NAv/ygv5FcUZHLQ6shpBUC6DmaTYi3cDQ2mr/SQKxLW/jZRUL5hJsJKY2J5Tku9bOZZasKTzQe+J3E7ZPATQUDPThys+Jtc1/9K25EnS90/+3TaNIohFu3adTLI/UniFUnVC0pW3X6aBhokDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMK6HGScIfkjyT+Fmk4iaYVcjrynEow3jzE15RyEC7Q=;
 b=WRyDu09KpYydwd01M8lqxw4T464rWQ9jv+COOqLnoPHKS1JQJxW+qn2TZcVCKqIGoHmwTHozte7lUqhVhhjKao+GmBvr991J6H8JkGp3RFdSbm7+2euJ4/q9FXKe/zxDjqygSX3SJVI5WlKJMEOgnDNZ3yi2D4zSBr2fIrLt2wM=
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com (2603:1096:404:10d::20)
 by TYWPR01MB10001.jpnprd01.prod.outlook.com (2603:1096:400:1d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 01:57:56 +0000
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::cc0c:b99b:e3db:479f]) by TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::cc0c:b99b:e3db:479f%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 01:57:56 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Kari Argillander <kari.argillander@stargateuniverse.net>
CC: "almaz.alexandrovich@paragon-software.com"
	<almaz.alexandrovich@paragon-software.com>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>
Subject: Re: [RFC] ntfs3: Use the same order for acl pointer check in
 ntfs_init_acl
Thread-Topic: [RFC] ntfs3: Use the same order for acl pointer check in
 ntfs_init_acl
Thread-Index: AQHYVIrw+6smAtHLsU+sUIk+SEk6Saz5ExOAgACbZoA=
Date: Thu, 21 Apr 2022 01:57:56 +0000
Message-ID: <6260C881.9000404@fujitsu.com>
References: <1650444509-3330-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <b5eb5779-5dba-c266-4fa0-37d47b53614a@stargateuniverse.net>
In-Reply-To: <b5eb5779-5dba-c266-4fa0-37d47b53614a@stargateuniverse.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84395227-a347-475f-1de2-08da233a5af2
x-ms-traffictypediagnostic: TYWPR01MB10001:EE_
x-microsoft-antispam-prvs:
 <TYWPR01MB100019B1AD20BE5AB98B69411FDF49@TYWPR01MB10001.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tZKW9uHhFUC8Js+C5MKiTcUpdJxafIGgnMfSQdjKy2zHAQqB1IfSSooZ1G+zueRNqIHvcvX3DSt3yK5wXCblXCY0wYBhvCOvWeu620RIdUjrxEIOznja3wgVEQ7gbymhZCDhq7Nldx8uSq+0Q0p29oFC+Cj3g2J/j9D7o+Yts6MM/AjMjXXx7eEJ4GfacSxehTjfSOPGmQ+3G3gJaFYtJcUHF7hiNkgyzdf5dDzube1MHgLjmKHkiz97u48LO6csR6YYb35pqX3J38ExSYcs0MR7KHtr6nFlxR8zK2OA/P+6KLl+8KT7qN3k6+3XpOPJX8ipcZUyCvPPhW6wEpPcxDLHj4A7+DaJx+NF9qX34jiK58o7Ejca8zqU7aXwpxx4CUK6uGnLUI8BLNGnj3M8XpMyvj+ncndGGhOmvve2iSjak6c2wjN/cMPRmGwVJNViFXn6goyf1ed4QYRSaIEswp8+wQqx4NKHihBYPITdZR0NUh+h1eG0N6UVzfM3yX8HJ/u5D6Jkw7O1T8VgAc+pCYGwq8rp9EHcdD4UcYZ+LFsJr0syEehJ3iujK81YPIdUoowLwZP28ubeOsPrKoqkJW8yApF8KPnmfD7UVHRaLljjciEJ58oHiJqWVL3yqc8Y+PG4dYs6XhiPA430ql3HhaVi1a0Kitfq5QOeervR8I+wsxJET77mxhK7J4mAs88TdwNDWmii1q4VepGLYFsk1A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB4427.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(85182001)(2616005)(66556008)(66946007)(6916009)(38070700005)(66476007)(87266011)(316002)(64756008)(91956017)(66446008)(6506007)(33656002)(5660300002)(54906003)(8936002)(122000001)(83380400001)(186003)(4326008)(8676002)(6512007)(76116006)(508600001)(82960400001)(2906002)(36756003)(71200400001)(6486002)(26005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d216Q3J0Rm9haktHRkNoRGlva2M3RkRMS3pHVUdqTG50RktUeElMODJJRUU0?=
 =?utf-8?B?d05yWW5yM2RwZG9oNXJwMlJheTVwaFNOTGZWdzlkWWg0dEdIdXdabjExYS8r?=
 =?utf-8?B?M1d5NlQxanlzK3VITThtb3hpdTc0S2UyMnpvU20vVlNmU2JVd3BGUys1QlN0?=
 =?utf-8?B?aGpoYkhkNTNLV20zZ00yYkozOGdiTXcrcFcwWVhqSnlGVXE5UGZXS2xkNVRK?=
 =?utf-8?B?djBhNitBM0xnYm81N2tDbnZ3UzBrdFNYeTROZ1d4alFmdUU3ZVpYMThIT3VP?=
 =?utf-8?B?UFg0NmIvNXRqWWExQVdmYmk0QmVUT3NLM0N5dTk4dVhNVGxlcnZBU1owL3E1?=
 =?utf-8?B?NjJOOTBWcTQzMTFpd1Q4c3EzMXJ3UHlmUDRjZFJ0T0dQbGRPUFJqQmJDak1M?=
 =?utf-8?B?VHBrczdUd0JCbkZmRFRISFFPcVpaanF0eGJRMG5rcCtDS1J1VlFReHA4ZU42?=
 =?utf-8?B?VFV2WU1YSXZPRHl3Y0NLamtVTjFCN0haTmlIN2NLbmFMRWZhZ0NKR09ubktF?=
 =?utf-8?B?UXhScGZONWZmYU8zZko3d3BsWG04TStzRlYvaDFFRmY3NzlNSm4zL04xUnV0?=
 =?utf-8?B?UkZ6Y3UvaWxFSlM1OS84ODA4eWw5cVhReU5JZVRqS0F2SEdncGZONlFybDZh?=
 =?utf-8?B?V1hjOXB6T0ROMWhVWmptYnJCc090cFVPRTQ3Y1dKWEQ3MElHckhNaDJ6by9h?=
 =?utf-8?B?b1NEWFByWnNPeStSMlFKZGk1RzZnRkpjL0QyUzZxdXVyYWNxZjYwL0JpVnlI?=
 =?utf-8?B?Y0FDR1JzRlNCQXltc25adEZtUGgveHE2S2UybjQyd3BlSXJXQWR5RG50dUJY?=
 =?utf-8?B?WlAwMUdrWUVsZExRaFZMMm1xRmJoQ2pzV1Q3Sk5aVlpsVUZoblRWTS9zdTFm?=
 =?utf-8?B?b0tLazdlbENCU3FhUmM2L1N2RG9IV1dKQ3B5Q3ZDT3B1RjJXVTdOdWNNc0FV?=
 =?utf-8?B?MmlhWmhBajVBaXg5cUN0cHFJZG1FTFZ6Z3I0KzNNbWh2V0d4SkFBVG5tUTZl?=
 =?utf-8?B?REFWdXBma0JtS29HZkhmL3ZOZ0xmam1nN0IyTUwwdDRFczJMMk1ZNm81WFdU?=
 =?utf-8?B?VnhxMXdYdHMrcjdKck9DeVdIdTFleW5mV0IxWXZuOUl6a3E1VFZleFJmZ29T?=
 =?utf-8?B?UC9yWHMzS3Eycy9HNVVsWGpaQTRWbGtvOHN4Wmx5R2dReGpEbGViUU5aSHdl?=
 =?utf-8?B?WHRCeUVxa0FyOE5nczNraHV5ZnlFTXJvWXhuemlEa0hvdVhWTjVvVzZBU0lU?=
 =?utf-8?B?dm5PSHhwajdFcWVLYjk5TXMwZktCTXhyY1ZYT1dpcGVEay9ra1NEejJHaFlM?=
 =?utf-8?B?N0FYZ0p2UHlpUythc2Mzd2cxWkM5WmJuc2d6czFZVHNjQWpkeVdKS3EzSEgy?=
 =?utf-8?B?R1M5VVF4ZzFVRzVEN3VaOE92bjlUN0UzL3ZnekNBWURoTXVrTzhFekRLSzlW?=
 =?utf-8?B?Wk1WWGRZOHF0aFhvRlBWQkt3akI3eXN5Vjk1b0xGb2ozZGVXNkVNcUs4a0Zx?=
 =?utf-8?B?SGpoUmorbXBoc2tQTTdua0lDcm5Nb3o0dDVEYlpkRGdDTW90VTgvUWNGWUlx?=
 =?utf-8?B?eXlxMFpFNzlZTE5Gc1U2eXU2ejRWeWxRcjdFSm05QU9BUUI3M20wczFNNWlQ?=
 =?utf-8?B?Mk1IZ25Kd0pOcWQzRitUdC92NnVCTUJMRC9HWXhKZmVKS0I2OVZNQWRLUUhY?=
 =?utf-8?B?L1NNYlMyNGJkTW9WQ0kwSUk2dHUzSDV1aWs0LzRvdWh4SnhrSDVrMG1HV3dk?=
 =?utf-8?B?UTdnV3NIV1hhTFlnMFljQzhORVpSTU9JUER0d3RoMzlBVHRta0dHQmpXRGZV?=
 =?utf-8?B?eFpxOEZuWkd4R1VFODZsbFAyTjZ4Wk5XbjhYVEtBNS9hRXB4ejk4QnllQU9t?=
 =?utf-8?B?V29QbFgrYVlucGJJVUlQQjdjaXpzcVpyNytwMDRGVTBkWitvK1ZrVmVmTjZz?=
 =?utf-8?B?KzhZWWxyM21kS2tVc0hyemU4SmVYaWdLZEZVdmRyUWEwKzhKV0lzai9ld3R3?=
 =?utf-8?B?UkpyWEFSeWljT0hBS2xwc2JUODBicXFSQis0blYrbFFLUEthdXZNc2syZmNS?=
 =?utf-8?B?VTZ6QVlvd0N1anFrd2gwZE1GY3pjaEk5L2VLVzBYNzd2OFpndjlPSHNsOGE0?=
 =?utf-8?B?aXkzcENIMmlpdzhNM29pV2pHT1hwejlFelBLUGNWampndzZ1NUlHSDNtd0Uw?=
 =?utf-8?B?Ykd4YWcraDZ3TGJwTHU5cVRCbVFPbkRNeUtycGM4MW4xNzVVbnBEMDZ6akti?=
 =?utf-8?B?SGE4WGlOZVljeUZEWmwzcWdOVWxuL0RKU3V1M1lPUVZIN3dEVEtuY3RjTEow?=
 =?utf-8?B?cHg5MlBVc0ExRjYvNmZUT0xSeXBjVHF6Rm1zWkpOdDNjNEh5ZThockRLVmhB?=
 =?utf-8?Q?+KAIfUJOwsOGubtQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6479602072FE43488B178FA331A05D77@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84395227-a347-475f-1de2-08da233a5af2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 01:57:56.6613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ko0aUkVvj9I66XnrlMVnUrqz+aUS9YeDjz3vsqwJoFmAMEi2CWHYEwxKRsOGk4+j9T2r2LP6AMqURHA+rCa6l5x1waX4NDEB1fcwTtPigyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10001

b24gMjAyMi80LzIxIDE6NDMsIEthcmkgQXJnaWxsYW5kZXIgd3JvdGU6DQo+IEkgZG8gbm90IHVu
ZGVyc3RhbmQgd2h5IHRoaXMgUkZDIGFuZCBub3QgYSBwYXRjaC4NCkkgZG9uJ3Qgc3VyZSB3aGV0
aGVyIHRoaXMgc21hbGwgbml0IGlzIGEgcHJvYmxlbSBhbmQgY2FuIGJlIGFjY2VwdGVkIGJ5IA0K
bmZzMyBncm91cC4gU28gV2hlbiBnZW5lcmF0ZSBhIHBhdGNoLCBJIGFkZCBSRkMgc3ViamVjdCBm
b3IgaXQuDQo+DQo+IE9uIDIwLjQuMjAyMiAxMS40OCwgWWFuZyBYdSB3cm90ZToNCj4+IExpa2Ug
ZXh0NCBhbmQgb3RoZXIgdXNlICR7ZnN9X2luaXRfYWNsIGZpbGVzeXN0ZW0sIHRoZXkgYWxsIHVz
ZWQgdGhlDQo+PiBmb2xsb3dpbmcNCj4+IHN0eWxlDQo+Pg0KPj4gZXJyb3IgPSBwb3NpeF9hY2xf
Y3JlYXRlKGRpciwgJmlub2RlLT5pX21vZGUsICZkZWZhdWx0X2FjbCwgJmFjbCk7DQo+PiBpZiAo
ZXJyb3IpDQo+PiByZXR1cm4gZXJyb3I7DQo+Pg0KPj4gaWYgKGRlZmF1bHRfYWNsKSB7DQo+PiBl
cnJvciA9IF9fZXh0NF9zZXRfYWNsKGhhbmRsZSwgaW5vZGUsIEFDTF9UWVBFX0RFRkFVTFQsDQo+
PiBkZWZhdWx0X2FjbCwgWEFUVFJfQ1JFQVRFKTsNCj4+IHBvc2l4X2FjbF9yZWxlYXNlKGRlZmF1
bHRfYWNsKTsNCj4+IH0gZWxzZSB7DQo+PiBpbm9kZS0+aV9kZWZhdWx0X2FjbCA9IE5VTEw7DQo+
PiB9DQo+PiBpZiAoYWNsKSB7DQo+PiBpZiAoIWVycm9yKQ0KPj4gZXJyb3IgPSBfX2V4dDRfc2V0
X2FjbChoYW5kbGUsIGlub2RlLCBBQ0xfVFlQRV9BQ0NFU1MsDQo+PiBhY2wsIFhBVFRSX0NSRUFU
RSk7DQo+PiBwb3NpeF9hY2xfcmVsZWFzZShhY2wpOw0KPj4gfSBlbHNlIHsNCj4+IGlub2RlLT5p
X2FjbCA9IE5VTEw7DQo+PiB9DQo+PiAuLi4NCj4+DQo+PiBTbyBmb3IgdGhlIHJlYWRhYmlsaXR5
IGFuZCB1bml0eSBvZiB0aGUgY29kZSwgYWRqdXN0IHRoaXMgb3JkZXIuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbT4NCj4gUmV2aWV3ZWQt
Ynk6IEthcmkgQXJnaWxsYW5kZXIgPGthcmkuYXJnaWxsYW5kZXJAZ21haWwuY29tPg0KPg0KPj4g
LS0tDQo+PiBmcy9udGZzMy94YXR0ci5jIHwgNiArKystLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2ZzL250
ZnMzL3hhdHRyLmMgYi9mcy9udGZzMy94YXR0ci5jDQo+PiBpbmRleCBhZmQwZGRhZDgyNmYuLjY0
Y2VmYTg2OWE2MSAxMDA2NDQNCj4+IC0tLSBhL2ZzL250ZnMzL3hhdHRyLmMNCj4+ICsrKyBiL2Zz
L250ZnMzL3hhdHRyLmMNCj4+IEBAIC02NDIsMTMgKzY0MiwxMyBAQCBpbnQgbnRmc19pbml0X2Fj
bChzdHJ1Y3QgdXNlcl9uYW1lc3BhY2UNCj4+ICptbnRfdXNlcm5zLCBzdHJ1Y3QgaW5vZGUgKmlu
b2RlLA0KPj4gaW5vZGUtPmlfZGVmYXVsdF9hY2wgPSBOVUxMOw0KPj4gfQ0KPj4gLSBpZiAoIWFj
bCkNCj4+IC0gaW5vZGUtPmlfYWNsID0gTlVMTDsNCj4+IC0gZWxzZSB7DQo+PiArIGlmIChhY2wp
IHsNCj4+IGlmICghZXJyKQ0KPj4gZXJyID0gbnRmc19zZXRfYWNsX2V4KG1udF91c2VybnMsIGlu
b2RlLCBhY2wsDQo+PiBBQ0xfVFlQRV9BQ0NFU1MpOw0KPj4gcG9zaXhfYWNsX3JlbGVhc2UoYWNs
KTsNCj4+ICsgfSBlbHNlIHsNCj4+ICsgaW5vZGUtPmlfYWNsID0gTlVMTDsNCj4+IH0NCj4+IHJl
dHVybiBlcnI7DQo=
