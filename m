Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B17C
	for <ntfs3@lists.linux.dev>; Wed,  2 Nov 2022 06:50:26 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N2H7l12fhzJnR4;
	Wed,  2 Nov 2022 14:30:27 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 14:33:20 +0800
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 14:33:20 +0800
Received: from kwepemm600002.china.huawei.com ([7.193.23.29]) by
 kwepemm600002.china.huawei.com ([7.193.23.29]) with mapi id 15.01.2375.031;
 Wed, 2 Nov 2022 14:33:20 +0800
From: zhongjinghua <zhongjinghua@huawei.com>
To: "almaz.alexandrovich@paragon-software.com"
	<almaz.alexandrovich@paragon-software.com>
CC: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Subject: ntfs3: CVE-2022-3238
Thread-Topic: ntfs3: CVE-2022-3238
Thread-Index: AdjuhP5MCDKgNxSbSmuAmGkF51PXFg==
Date: Wed, 2 Nov 2022 06:33:20 +0000
Message-ID: <5ebae6955d62437ca49488e91acf6d17@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.174.178.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CFilter-Loop: Reflected

SGkgIQ0KDQpJIGhhdmUgYSBxdWVzdGlvbiB0byBhc2sgZm9yIENWRS0yMDIyLTMyMzguDQoNClRo
aXMgaXNzdWUgc2VlbXMgdG8gaGF2ZSBiZWVuIGZpeGVkIGJ5IHRoZSBtYWlubGluZSBwYXRjaDog
Y2QzOTk4MWZiOTJhZGYwY2M3MzYxMTJmODdlM2U2MTYwMmJhYTQxNS4NCg0KSSBkaWRuJ3QgcmVw
cm9kdWNlIHRoZSBwcm9ibGVtIHdoZW4gSSB2ZXJpZmllZCB0aGUgbWFpbmxpbmUgY29kZSwgYnV0
IGl0IGRpZCB3aGVuIEkgcm9sbGVkIGJhY2sgdGhpcyBwYXRjaC4NCg0KU28gSSB3b3VsZCBsaWtl
IHRvIGFzayBpZiB0aGlzIHBhdGNoIGlzIGEgcGF0Y2ggdG8gZml4IHRoaXMgQ1ZFIHByb2JsZW0u
DQoNCkNWRSBsaW5rOiBodHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3NlY3VyaXR5L2N2ZS9DVkUt
MjAyMi0zMjM4DQoNClZ1bG5lcmFiaWxpdHkgdHJpZ2dlciBwYXRoOg0KDQotLS0tLS1yZW1vdW50
LS0tLS0tDQpkb19tb3VudA0KwqDCoMKgIHBhdGhfbW91bnQNCsKgwqDCoMKgwqDCoMKgIGRvX3Jl
bW91bnQNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHV0X2ZzX2NvbnRleHQNCsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmYy0+b3BzLT5mcmVlKGZjKTsNCsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBudGZzX2ZzX2ZyZWUNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHB1dF9tb3VudF9vcHRpb25zDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKG9wdHMtPm5sc19uYW1lKTsNCg0KLS0tLS0tdW1vdW50
LS0tLS0tDQpraWxsX2Jsb2NrX3N1cGVyDQrCoMKgwqAgZ2VuZXJpY19zaHV0ZG93bl9zdXBlcg0K
wqDCoMKgwqDCoMKgwqAgbnRmc19wdXRfc3VwZXINCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHV0
X21vdW50X29wdGlvbnMNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShvcHRz
LT5ubHNfbmFtZSk7DQoNCmNkMzk5ODFmYjkyYWRmMGNjNzM2MTEyZjg3ZTNlNjE2MDJiYWE0MTXv
vJpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvY29tbWl0Lz9oPXY2LjEtcmMzJmlkPWNkMzk5ODFmYjkyYWRmMGNjNzM2MTEy
Zjg3ZTNlNjE2MDJiYWE0MTUNClRoaXMgcHJvYmxlbSB0cmlnZ2Vyc++8mg0KbnRmc19pbml0X2Zz
X2NvbnRleHQ6DQrCoMKgwqDCoMKgwqAgc2JpLT5vcHRpb25zID0gb3B0czsgDQrCoMKgwqDCoMKg
wqAgZmMtPnNfZnNfaW5mbyA9IHNiaTsNCm9rOg0KwqDCoMKgwqDCoMKgIGZjLT5mc19wcml2YXRl
ID0gb3B0czsNCsKgwqDCoMKgwqDCoCBmYy0+b3BzID0gJm50ZnNfY29udGV4dF9vcHM7DQoNClRo
ZSB0d28gcmVmZXJlbmNlcyBhcmUgdGhlIHNhbWUuDQoNCg0K
