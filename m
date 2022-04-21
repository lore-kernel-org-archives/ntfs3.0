Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F5B1876
	for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1650532724; x=1682068724;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BGw6DraMngwmzZYxPsbW32kGWaiexBQGZeLyarb9byA=;
  b=Kyy8xa5A3f4wkpl5Q87m3Hji2HTNwFpzfJdJKFEiZPoGCGSALItn7v41
   /CknOQZnGLHYbZKZaB1mpF3OQxkl9DUygIpWU6Cvo147ymNKkusdtiq/n
   30/zx+NkZjbzrXcYdf8RykrE8x0fYGJUqPzYvmwapxJasAxovPk9uwsjU
   LDkbaSHQDcdNNc5kum9hc5Ngw6GrdKScEgFULuNUdr255jYNMTBwuo2Az
   uTt2p77H8yaWvdXEkXbEuG+g40F/OQjzi6s406RSM8RHms/rAg+hAUBri
   5BQfkDF+sXzW7kbY9fJp+QUVKI3e2viE1vsJFIffNBoqpPxig+Nm6RlD8
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="54694437"
X-IronPort-AV: E=Sophos;i="5.90,278,1643641200"; 
   d="scan'208";a="54694437"
Received: from mail-tycjpn01lp2170.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.170])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 18:17:32 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agbrr3ddJ0nCZ/Ce0ba+63dTAIB5GM/HDpi3pi5tXCHQRTVbYIJno8kwslVPqXG04CPI+uPwAyWNRxIMCUebZOOHL0Z1VwJ60UJ+L/Q+rpKISc2mzG2c57aSbwlm2HhhSXDZqex4He+AvmcoOX4+7vMEt0yIopJ5U8mE52G8xMY3YS2IujO862FXYW5aDz+gsfNNL9uv2id+qZoAu9zEVQbHT2KtgLcD0f+9CK3UCwb0K7TKKnUrqtiwhz2YO/mPhhHk74EdDi/4kGGsnKf6fif4TPFw8v0SUDAHGPxzRblGIwQOAJpHIOwDJ/dCmS+tQ1C3FxZL/HeeYXxfoASqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGw6DraMngwmzZYxPsbW32kGWaiexBQGZeLyarb9byA=;
 b=LS/SNspooq/Ww7jgqig5s/vDO1bz1ndiookFlhSAsHXVf6zKvArzsF8CXDFF0kemq6Vglv9uU0vuYe9s1OXoGXc6zy8asW8iva1HBi4FddsEajbDKMOIVyzZ8FiJvUzQd/olg0BzD895v3G3QBLazOYOMY0ZHUsyDsVpF0npoPvwvrFanZenX2tUS/DgfWZ0jO2ZgVcV2f3SE9uskhwV1R7gkCbUtMouCqBPFx2HAlZdvIEoD4hMd1M5lgRiOxwxRp9kD0B7gm/sLv368cfMTDxC7BOODZjAH9IhQg93+BA8dvsDgWYhptaxeBs8hIO+D8QbYcE0hPjYiYP3qc+6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGw6DraMngwmzZYxPsbW32kGWaiexBQGZeLyarb9byA=;
 b=ht1wbfYWrdH4ZHltMJWoTcyWfZUQzOMLUfzg8vJO+oKepz3qxJ1Y9LPaA51vENWdaTrb9MGcGnBz8z/LxyEfVR66Hgi8cayC311QVDiRLF1YaH+4U2RsvKvMLPVXZwnBmW2i0cPa4k1pV0U0sP7wBBy9S/VovoFjPQTmf4Tw4H0=
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com (2603:1096:404:10d::20)
 by TYBPR01MB5453.jpnprd01.prod.outlook.com (2603:1096:404:8020::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 09:17:30 +0000
Received: from TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::cc0c:b99b:e3db:479f]) by TY2PR01MB4427.jpnprd01.prod.outlook.com
 ([fe80::cc0c:b99b:e3db:479f%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 09:17:30 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Kari Argillander <kari.argillander@gmail.com>
CC: "almaz.alexandrovich@paragon-software.com"
	<almaz.alexandrovich@paragon-software.com>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>
Subject: Re: [RFC] ntfs3: Use the same order for acl pointer check in
 ntfs_init_acl
Thread-Topic: [RFC] ntfs3: Use the same order for acl pointer check in
 ntfs_init_acl
Thread-Index: AQHYVIrw+6smAtHLsU+sUIk+SEk6Saz5ExOAgACbZoCAAGZsAIAAFGMA
Date: Thu, 21 Apr 2022 09:17:30 +0000
Message-ID: <62612F86.6070502@fujitsu.com>
References: <1650444509-3330-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <b5eb5779-5dba-c266-4fa0-37d47b53614a@stargateuniverse.net>
 <6260C881.9000404@fujitsu.com>
 <ad6d9ad3-1b9d-5e18-6d80-039680c5bede@gmail.com>
In-Reply-To: <ad6d9ad3-1b9d-5e18-6d80-039680c5bede@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 106ed8e1-3e59-4047-a822-08da2377c2e0
x-ms-traffictypediagnostic: TYBPR01MB5453:EE_
x-microsoft-antispam-prvs:
 <TYBPR01MB5453565CF208BDE263FF7954FDF49@TYBPR01MB5453.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 C3EAWeAuowzpawdZk+WREcOg7EEdWO8Dcy3TmyN/uWb9xa9y2ch/KJkF2dIK7A4M7ZrsuKQVAE+pxEVo5uJT+w68b+cdxWZIffrpEEPNDrFoksDC5pbJZ6JLjH6UPhfzHVaM/pGMlu3T/AXlEVPBv1uvoZ+WrVI33Rzux6/WE0z/kExJyTqZNNF8Nxyr67Z24w3mJA9ywFYgmbv22ulgpS856DXuSuLHKXrhuFWwMlIPrnoyRQz65I8eUzm9W5Jj1dh/W3HCwuxLymdl1Rq8c2OsiIJgFSzRo1W+FIBFsGGe/wVXTPOuwiGkP63gBlAPEGhdY+spJibA7yBw0h+1tXcNAxn6rBVRcncESxWu1zbj6nwHGvrlj1bZqJWQEy1YDxuLwtDbNUpeOGFQolTdqwtUGEuLWfrv9Qvk32db8Qeg5DONFGKMARayWqcfxlgWL9lBx63aDCqbt1fvULxfFV71XhS24soYkhlJTkxxf569qLYJFGlNl7EXuUjXF0OX6+g5GzUynj0BIP3LvWr29E8fIdZRi00rTQm0Wzl7dKLbNw1uslUbMTmCtf4MrFKuon2irsE3TFvPYRf4DOxx/xWYhdBFpwj+CLVEHIBCp+mlTz2g2dCG8EeiArQJgvFa96ifMDcm8XLMolvzybufF0+vnGa7ZGc2LAYNjjRyeVJA8BBkoV68ggtZTTVb4JYJtdiOywcyORkKBK90BR/OzA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB4427.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(66946007)(6916009)(4326008)(54906003)(508600001)(66556008)(66476007)(66446008)(76116006)(316002)(8676002)(8936002)(36756003)(64756008)(6486002)(85182001)(71200400001)(26005)(87266011)(6512007)(6506007)(2906002)(33656002)(38100700002)(38070700005)(122000001)(5660300002)(2616005)(186003)(83380400001)(86362001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGFyU1hYTEtIQ0FLRUJMek1CVHdtb1d2TUc0R2duSTN1ZGo5ODdNbStya3FX?=
 =?utf-8?B?TThLcUdSUXRyWmdLRll1aEhkZVNSZE9iaGw5bnd0WG5OYytVSnQrMkplMzJL?=
 =?utf-8?B?ZlpEZEVXQnBBYnlxZFJ2SU5Rdk9zYVYxaFByTGdhSjIvTThQNlVvS24zOVFh?=
 =?utf-8?B?Rmx1c015RVo4eXRjQmxidGRPUVhDUW5LdWYvZDdGU2pkZVZUZ3lnRHE3cnc3?=
 =?utf-8?B?MElGOFJHd2I1Mmh1MVRnQ3Mxb29NaFZwamlwWXZ4NEJSeDhPM1lzUlZoSU9K?=
 =?utf-8?B?NXBZcC9tRXltaGZ6T2tpZ1lBRVNRbWQyaTVkYm5xZzlCV0hlQ24zSG1NYkNm?=
 =?utf-8?B?aDZWUHFQWjhMQWNWRDFhdVl0UnU5WXY0NWRxUGNTRzVtK2ozZHJuaS9CbU03?=
 =?utf-8?B?TnR1UXpsc0VpWjh1RUFIcVdWdWNHaTFMYndVNThqWGFyL3NQV1M5Q0dYUUxW?=
 =?utf-8?B?YlBaNGVQcExhaEZVdWNDV2RBTDBiNWVyWUFtaW4rSTFicWl6Ukt3YithZUNJ?=
 =?utf-8?B?MmVwYkYxZFlKT1ZqOXNDN1ZkMHZ2MXFWclo1OVZuVlY1TlIvcms1QmRzYWNn?=
 =?utf-8?B?YVNGUy9SckozbVlvMFBMTE44OHpLNG42VzBxeElaUDVFMDMxUmg2TFRiTG1Y?=
 =?utf-8?B?aUxwS0NTRVIyNUlUSUJBWFJMWUxuNERiemlvbDVUM1RETlVPN0QyblZMOXhE?=
 =?utf-8?B?Z2tielhJOEdGc3JaVzVudTdLa0lnTzlEYVYyajcwbVFaT2JpOFBBTXJCMllM?=
 =?utf-8?B?MHN3UDB2REJuelFxRFBKWjBUd2M3ZFBZSE04cXBOdFpHdktUSi9TaWUwMWFN?=
 =?utf-8?B?dC94L0xUSy9zbkxqNEhvSHltRzN1Z0N2NlJ1MTI4SHZmK3R5WFV5ampKRlRr?=
 =?utf-8?B?Y0dXWlQwM3hnSkp5dmt6Z2pSbVN0eVA1WTczZTJRdHFkUDFCMExMTXFNeFRI?=
 =?utf-8?B?RmZ5WUJZaUE1MUVJeGxnOGJPZ0FlMVIxMUQ0S3E5SXptN252QzI5SmI4ajRF?=
 =?utf-8?B?MTIwL1VPSTRjZ0JjemtlVGZwZzhxV1VVanVHc3l5Ni9QUmc2Mk52cFh2V2FC?=
 =?utf-8?B?eXBsMnlPdVIyS3NPS3pzcFEzZkQ0RU8rdDJKZzF5Zk5rbDVtWk9YU09Vay9y?=
 =?utf-8?B?dmJnamVabnhUMjR2bWI3aE1ObGplMVlvc0t1cjYrb094bjVNOG0xcENVeExB?=
 =?utf-8?B?MXNwaVMzbnNzSitHOW0zaFkrSEwwaFVYQStBNnFZYzNjOEpQWDdrQUtYWlo2?=
 =?utf-8?B?TVF5MTM3RE1LSlFiZlBzb0gwbVE0Q1BGcThLVnNLbXloMDk1L0Y2U0g4WWJF?=
 =?utf-8?B?V3NxVEQ5T0diTS84ZVRuRENaa2h5cFdFQTZKUStCUHRzOGR4Q003b28vTWd4?=
 =?utf-8?B?OTE2Y2UwcnVqYjFENE1LZG14TDFQWExpWjIwMFVBR292aEcxd2xEUFJsbE1F?=
 =?utf-8?B?M0czODltWTE4c0tFRllsNmtBNlBnTGdGcWRYa1BNNmQzZ0hPV0JFd3lkK2ZV?=
 =?utf-8?B?NytkN0ZGL1FPZWZXZjNxY0VMNkIyMHgveTFXODlVL21KeVB1TjNUUTh3SHhn?=
 =?utf-8?B?MURHRlV2UmtndGRGYUN2SVdEUU1YZktjRndrdXFOdi9GdE5na3JCc01iakh2?=
 =?utf-8?B?OE81M0lCUm1ycUFTU0QwQkU4b3c4R2o4WUxiK3pGeWVTUlRYNXdUNHA2Vmth?=
 =?utf-8?B?d3JLa0pkaSs1Rng0SnF1VDBPODVlNER4UHpsOGNTMHdzWkxlMlJFdnRrUTlF?=
 =?utf-8?B?a0VnLzZ2cUY1RUdPYm1MVFFySHZ6WXdLai9mQnBmaUVXTldPdURIM0JoWHEr?=
 =?utf-8?B?VlJBYm9NanByVzlZdXpJVGtseHVBc3N5VWdNMmFEMnh5aW91YkY1OG5lM2Vi?=
 =?utf-8?B?RVVuWE9aMkpZNXFnTXFvY1AzemovN1loYkpMQWgwQlJJSjE0ZjhIN2RzMUpV?=
 =?utf-8?B?aU5jRVpuYUFKVDZkbFV4SGlCMmtJM0c5M2Z1RUk2alVQQVlIT3N0ek9NRnZO?=
 =?utf-8?B?WXV0ZDZZUmdkdjZITkcyZE8zZDB6bUNQM0VGdWdyb3hIUkNTcE50ZGFITkVh?=
 =?utf-8?B?ck9Oa1orbU5PV1pZUkJvZWhmVDZkSGQ5NHhHUU90RkFHTFR2SEdGTEhFYWhT?=
 =?utf-8?B?UkhnRDZwVUJBczJxdzBJVmxmZ1N6cTc2ZUJqaGUwSE9Ya0lCV0JLekU1dytG?=
 =?utf-8?B?a0c0eWZnV2gzd3czN2ZGMFdNSWQrZU5CdnVucFpOWkU3dzM4bzhkQklDSW1n?=
 =?utf-8?B?ODZseGNnQXZhbkQxSmxWMWxvSzdtLzhCREg0cS9EaHlBZmVIVGN0c1dHd0tJ?=
 =?utf-8?B?Z0ZxQkZvQ3czVmt5V2h3N1FuV3kyMlpxTUM5ZGFXMjZFV09vMlZPSkx1bHFu?=
 =?utf-8?Q?xHBofH8ePLdd3FL7ndknt1zVDxu7HxWPowNKG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5100C551F3F27D419FACA26B55EFA4B1@jpnprd01.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 106ed8e1-3e59-4047-a822-08da2377c2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 09:17:30.3773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fn6nKE48shRmOrKaWtIVmCQOAGPAVEMNI2JgN/x+JvmOg8owzcVQkuvzzBMOwYiww4Tx+cOEkAlQgyDR8VYmOXL68ZMRSjloyRTz9L6tuQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5453

b24gMjAyMi80LzIxIDE3OjA1LCBLYXJpIEFyZ2lsbGFuZGVyIHdyb3RlOg0KPiBPbiAyMS40LjIw
MjIgNC41NywgeHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbSB3cm90ZToNCj4+IG9uIDIwMjIvNC8y
MSAxOjQzLCBLYXJpIEFyZ2lsbGFuZGVyIHdyb3RlOg0KPj4+IEkgZG8gbm90IHVuZGVyc3RhbmQg
d2h5IHRoaXMgUkZDIGFuZCBub3QgYSBwYXRjaC4NCj4+IEkgZG9uJ3Qgc3VyZSB3aGV0aGVyIHRo
aXMgc21hbGwgbml0IGlzIGEgcHJvYmxlbSBhbmQgY2FuIGJlIGFjY2VwdGVkIGJ5DQo+PiBuZnMz
IGdyb3VwLiBTbyBXaGVuIGdlbmVyYXRlIGEgcGF0Y2gsIEkgYWRkIFJGQyBzdWJqZWN0IGZvciBp
dC4NCj4NCj4gUkZDIG1lYW5zIHJlcXVlc3QgZm9yIGNvbW1lbnRzLiBVc3VhbGx5IHRoaXMgbWVh
bnMgdGhhdCBwYXRjaCBuZWVkcyBtb3JlDQo+IHdvcmsgYnV0IEkgd291bGQgbGlrZSB0byBkaXNj
dXNzIHRoaXMgdG9waWMgYmVmb3JlIEkgY29udGludWUgdGhpcyB3b3JrLg0KPiBUaGlzIHdhcyBz
bWFsbCBuaXQgYW5kIGlzIG5vIHByb2JsZW0sIGJ1dCBJIGp1c3Qgd2FudGVkIHRvIHBvaW50IHRo
YXQNCj4gb3V0Lg0KDQpUaGFua3MsIG5vdyBJIHVuZGVyc3RhbmQuDQoNCj4NCj4gQXJnaWxsYW5k
ZXINCj4NCj4+PiBPbiAyMC40LjIwMjIgMTEuNDgsIFlhbmcgWHUgd3JvdGU6DQo+Pj4+IExpa2Ug
ZXh0NCBhbmQgb3RoZXIgdXNlICR7ZnN9X2luaXRfYWNsIGZpbGVzeXN0ZW0sIHRoZXkgYWxsIHVz
ZWQgdGhlDQo+Pj4+IGZvbGxvd2luZw0KPj4+PiBzdHlsZQ0KPj4+Pg0KPj4+PiBlcnJvciA9IHBv
c2l4X2FjbF9jcmVhdGUoZGlyLCAmaW5vZGUtPmlfbW9kZSwgJmRlZmF1bHRfYWNsLCAmYWNsKTsN
Cj4+Pj4gaWYgKGVycm9yKQ0KPj4+PiByZXR1cm4gZXJyb3I7DQo+Pj4+DQo+Pj4+IGlmIChkZWZh
dWx0X2FjbCkgew0KPj4+PiBlcnJvciA9IF9fZXh0NF9zZXRfYWNsKGhhbmRsZSwgaW5vZGUsIEFD
TF9UWVBFX0RFRkFVTFQsDQo+Pj4+IGRlZmF1bHRfYWNsLCBYQVRUUl9DUkVBVEUpOw0KPj4+PiBw
b3NpeF9hY2xfcmVsZWFzZShkZWZhdWx0X2FjbCk7DQo+Pj4+IH0gZWxzZSB7DQo+Pj4+IGlub2Rl
LT5pX2RlZmF1bHRfYWNsID0gTlVMTDsNCj4+Pj4gfQ0KPj4+PiBpZiAoYWNsKSB7DQo+Pj4+IGlm
ICghZXJyb3IpDQo+Pj4+IGVycm9yID0gX19leHQ0X3NldF9hY2woaGFuZGxlLCBpbm9kZSwgQUNM
X1RZUEVfQUNDRVNTLA0KPj4+PiBhY2wsIFhBVFRSX0NSRUFURSk7DQo+Pj4+IHBvc2l4X2FjbF9y
ZWxlYXNlKGFjbCk7DQo+Pj4+IH0gZWxzZSB7DQo+Pj4+IGlub2RlLT5pX2FjbCA9IE5VTEw7DQo+
Pj4+IH0NCj4+Pj4gLi4uDQo+Pj4+DQo+Pj4+IFNvIGZvciB0aGUgcmVhZGFiaWxpdHkgYW5kIHVu
aXR5IG9mIHRoZSBjb2RlLCBhZGp1c3QgdGhpcyBvcmRlci4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbT4NCj4+PiBSZXZpZXdlZC1i
eTogS2FyaSBBcmdpbGxhbmRlciA8a2FyaS5hcmdpbGxhbmRlckBnbWFpbC5jb20+DQo+Pj4NCj4+
Pj4gLS0tDQo+Pj4+IGZzL250ZnMzL3hhdHRyLmMgfCA2ICsrKy0tLQ0KPj4+PiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0t
Z2l0IGEvZnMvbnRmczMveGF0dHIuYyBiL2ZzL250ZnMzL3hhdHRyLmMNCj4+Pj4gaW5kZXggYWZk
MGRkYWQ4MjZmLi42NGNlZmE4NjlhNjEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2ZzL250ZnMzL3hhdHRy
LmMNCj4+Pj4gKysrIGIvZnMvbnRmczMveGF0dHIuYw0KPj4+PiBAQCAtNjQyLDEzICs2NDIsMTMg
QEAgaW50IG50ZnNfaW5pdF9hY2woc3RydWN0IHVzZXJfbmFtZXNwYWNlDQo+Pj4+ICptbnRfdXNl
cm5zLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPj4+PiBpbm9kZS0+aV9kZWZhdWx0X2FjbCA9IE5V
TEw7DQo+Pj4+IH0NCj4+Pj4gLSBpZiAoIWFjbCkNCj4+Pj4gLSBpbm9kZS0+aV9hY2wgPSBOVUxM
Ow0KPj4+PiAtIGVsc2Ugew0KPj4+PiArIGlmIChhY2wpIHsNCj4+Pj4gaWYgKCFlcnIpDQo+Pj4+
IGVyciA9IG50ZnNfc2V0X2FjbF9leChtbnRfdXNlcm5zLCBpbm9kZSwgYWNsLA0KPj4+PiBBQ0xf
VFlQRV9BQ0NFU1MpOw0KPj4+PiBwb3NpeF9hY2xfcmVsZWFzZShhY2wpOw0KPj4+PiArIH0gZWxz
ZSB7DQo+Pj4+ICsgaW5vZGUtPmlfYWNsID0gTlVMTDsNCj4+Pj4gfQ0KPj4+PiByZXR1cm4gZXJy
Ow0K
