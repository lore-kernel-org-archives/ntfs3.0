Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716373FC2
	for <ntfs3@lists.linux.dev>; Fri, 27 Aug 2021 16:11:28 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 2ABA7821C6;
	Fri, 27 Aug 2021 19:11:26 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1630080686;
	bh=422cwgNybLISyMz/VamZNxiklI0nh1X2VvOV9yOi4rA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=W4Jz1ok2VzXkqSffL+b/vfQxntMsTX1Rv6Ds4/arp+ECjLql7mlDO0bypD5x3cSp2
	 i+mFa7uYJWsnc/ykLKah3w4Whhs4SxhpTs64TYb5ya6ul+VwbcycAt0O+UCi3oUp3V
	 qGNxDeN3RteUhEK9M2TS/0x9uRXqHn3vJnniiVh0=
Received: from vdlg-exch-02.paragon-software.com (172.30.1.105) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 19:11:25 +0300
Received: from vdlg-exch-02.paragon-software.com ([fe80::586:6d72:3fe5:bd9b])
 by vdlg-exch-02.paragon-software.com ([fe80::586:6d72:3fe5:bd9b%12]) with
 mapi id 15.01.2176.009; Fri, 27 Aug 2021 19:11:25 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: Colin King <colin.king@canonical.com>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH][next] fs/ntfs3: Fix integer overflow in multiplication
Thread-Topic: [PATCH][next] fs/ntfs3: Fix integer overflow in multiplication
Thread-Index: AQHXkrwKAKs1JeBmcEmaNxoi5UGa3quHlrmw
Date: Fri, 27 Aug 2021 16:11:25 +0000
Message-ID: <ef78885ed7b3462a91ca0081588e3917@paragon-software.com>
References: <20210816163025.81770-1-colin.king@canonical.com>
In-Reply-To: <20210816163025.81770-1-colin.king@canonical.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.30.0.26]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

PiBGcm9tOiBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IFNlbnQ6IE1v
bmRheSwgQXVndXN0IDE2LCAyMDIxIDc6MzAgUE0NCj4gVG86IEtvbnN0YW50aW4gS29tYXJvdiA8
YWxtYXouYWxleGFuZHJvdmljaEBwYXJhZ29uLXNvZnR3YXJlLmNvbT47IG50ZnMzQGxpc3RzLmxp
bnV4LmRldg0KPiBDYzoga2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0hdW25leHRdIGZzL250ZnMzOiBG
aXggaW50ZWdlciBvdmVyZmxvdyBpbiBtdWx0aXBsaWNhdGlvbg0KPiANCj4gRnJvbTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4gDQo+IFRoZSBtdWx0aXBsaWNh
dGlvbiBvZiB0aGUgdTMyIGRhdGFfc2l6ZSB3aXRoIGEgaW50IGlzIGJlaW5nIHBlcmZvcm1lZA0K
PiB1c2luZyAzMiBiaXQgYXJpdGhtZXRpYyBob3dldmVyIHRoZSByZXN1bHRzIGlzIGJlaW5nIGFz
c2lnbmVkIHRvIHRoZQ0KPiB2YXJpYWJsZSBuYml0cyB0aGF0IGlzIGEgc2l6ZV90ICg2NCBiaXQp
IHZhbHVlLiBGaXggYSBwb3RlbnRpYWwNCj4gaW50ZWdlciBvdmVyZmxvdyBieSBjYXN0aW5nIHRo
ZSB1MzIgdmFsdWUgdG8gYSBzaXplX3QgYmVmb3JlIHRoZQ0KPiBtdWx0aXBseSB0byB1c2UgYSBz
aXplX3Qgc2l6ZWQgYml0IG11bHRpcGx5IG9wZXJhdGlvbi4NCj4gDQo+IEFkZHJlc3Nlcy1Db3Zl
cml0eTogKCJVbmludGVudGlvbmFsIGludGVnZXIgb3ZlcmZsb3ciKQ0KPiBGaXhlczogODJjYWUy
NjljZmE5ICgiZnMvbnRmczM6IEFkZCBpbml0aWFsaXphdGlvbiBvZiBzdXBlciBibG9jayIpDQo+
IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+
DQo+IC0tLQ0KPiAgZnMvbnRmczMvaW5kZXguYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2ZzL250ZnMz
L2luZGV4LmMgYi9mcy9udGZzMy9pbmRleC5jDQo+IGluZGV4IDZhYTk1NDBlY2U0Ny4uOTM4NmM1
NTFlMjA4IDEwMDY0NA0KPiAtLS0gYS9mcy9udGZzMy9pbmRleC5jDQo+ICsrKyBiL2ZzL250ZnMz
L2luZGV4LmMNCj4gQEAgLTIwMTIsNyArMjAxMiw3IEBAIHN0YXRpYyBpbnQgaW5keF9zaHJpbmso
c3RydWN0IG50ZnNfaW5kZXggKmluZHgsIHN0cnVjdCBudGZzX2lub2RlICpuaSwNCj4gIAkJdW5z
aWduZWQgbG9uZyBwb3M7DQo+ICAJCWNvbnN0IHVuc2lnbmVkIGxvbmcgKmJtID0gcmVzaWRlbnRf
ZGF0YShiKTsNCj4gDQo+IC0JCW5iaXRzID0gbGUzMl90b19jcHUoYi0+cmVzLmRhdGFfc2l6ZSkg
KiA4Ow0KPiArCQluYml0cyA9IChzaXplX3QpbGUzMl90b19jcHUoYi0+cmVzLmRhdGFfc2l6ZSkg
KiA4Ow0KPiANCj4gIAkJaWYgKGJpdCA+PSBuYml0cykNCj4gIAkJCXJldHVybiAwOw0KPiAtLQ0K
PiAyLjMyLjANCg0KSGkgYWdhaW4sIENvbGluISBBcHBsaWVkLCB0aGFua3MuDQoNCkJlc3QgcmVn
YXJkcywNCktvbnN0YW50aW4NCg==
