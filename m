Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD6F32FA21
	for <ntfs3@lists.linux.dev>; Wed, 19 Nov 2025 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565081; cv=none; b=PjN8pe8sTyv4BucvjxmeJLMoUcNhOkTCi55unaXRU79nLDFodVlRONpl432ruefrZU/8l6/knMBKTU4540BasOsoEJZcSPK4IyH4KQQkKAOPAZ7q95Rjm93Pv+pPK6HkQMq6JUx7Byn31/Thp4AISPvGMToOLbKgZip5I5XDSQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565081; c=relaxed/simple;
	bh=AMBIg8JrLR1gVck9//iEjY/bk79EweAtprgFXmtZqC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fa/FLkyhAjP3N9bVlJX1Fhf1twm/DLsvRhhda2dLQ6bJQsCBWL6LUWUU0EZqdFHzPgTjOnrri+xVXyjexEUqo/33JTBjLlIAwTz/JMwtfDkN0WAqYOVYxumPPbFUDR/xxuHgD5qhNYXHd3+Cul24uefTN0WY5j8doXeLr2aV1u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=KLnw4RM3; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="KLnw4RM3"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5BDA41D18;
	Wed, 19 Nov 2025 15:07:44 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=KLnw4RM3;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 319F52137;
	Wed, 19 Nov 2025 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763565071;
	bh=AMBIg8JrLR1gVck9//iEjY/bk79EweAtprgFXmtZqC4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KLnw4RM3bBc9CpFyCoNR6L4yZ44vioR7eNhBC5+SGyav4FLWwmRLg0vOm0/Yd+abJ
	 HnopZIeG4WpnTWSzjCra6f7rmwiwTXgywGJqq37kc6oblX8XMZUngPgxPhtWmxuoOP
	 c85JdN1Zkry9rV7lPep+VpG6dY4JnNTvljtb55dc=
Received: from [192.168.95.128] (172.30.20.173) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 19 Nov 2025 18:11:09 +0300
Message-ID: <9c1bf8e4-669e-468c-b16c-aa2b6197ca69@paragon-software.com>
Date: Wed, 19 Nov 2025 16:11:08 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Memory allocation errors and system crashing due to buggy
 disk cache/inode allocations by ntfs3 kernel module.
To: <craftfever@tutamail.com>
CC: Thorsten Leemhuis <regressions@leemhuis.info>, Ntfs3
	<ntfs3@lists.linux.dev>, Linux Kernel <linux-kernel@vger.kernel.org>
References: <OaiQgS3--F-9@tutamail.com> <Oait04j--F-9@tutamail.com>
 <d9ae2341-b385-45f4-9359-550d1118efb7@leemhuis.info>
 <OaiyHa1----9@tutamail.com>
 <ee9a1718-7feb-4ff4-8b1e-582b8aca85b4@paragon-software.com>
 <OeQkrcD--F-9@tutamail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <OeQkrcD--F-9@tutamail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

T24gMTEvMTkvMjUgMTE6NTcsIGNyYWZ0ZmV2ZXJAdHV0YW1haWwuY29tIHdyb3RlOg0KDQo+
IE5vdiAxNCwgMjAyNSwgMTA6MzkgYnkgYWxtYXouYWxleGFuZHJvdmljaEBwYXJhZ29uLXNv
ZnR3YXJlLmNvbToNCj4NCj4+IE9uIDEwLzQvMjUgMTM6MjYsIGNyYWZ0ZmV2ZXJAdHV0YW1h
aWwuY29tIHdyb3RlOg0KPj4NCj4+PiBJJ20gcG9zdGluZyB0aGVyZSBmaXJzdCB0aW1lLCBz
byBJIHRocm91Z2ggaXQgbGlrZSBnZW5lcmljIGJ1ZyBtYWlsaW5nIGxpc3QsIGJ1dCBJIGNh
biBzYXksIHRoYXQsIGZvciBleGFtcGxlLCB2ZXJzaW9uIDYuMTIuNTAtbHRzIGEgbGl0dGxl
IGxlc3MgcHJvbiB0byBidWcsIGJ1dCBpdCBvY2N1cnMgdGhlcmUgYXMgd2VsbC4gSSdtIHVz
aW5nIExpbnV4IDYuMTYuMTAgZm9yIG5vdy4gU28sIGJ1ZyBpcyBwcmVzZW50IGEgd2hpbGUs
IGJ1dCBpIGhhcmRseSB0byB0ZWxsLCBpbiB3aGF0IGtlcm5lbCB2ZXJzaW9uIGl0IGFwcGVh
cmVkLCBjYXVzZSBlYXJsaWVyLCBJIGRpZG4ndCBtYW5hZ2UgdGhhdCBiaWcgYW1vdW50IG9m
IGZpbGVzLiBBZ2FpbiwgaXQncyBva2F5IHdpdGggbnRmcy0zZy4NCj4+Pg0KPj4+IE9jdCA0
LCAyMDI1LCAxNDoxMiBieSByZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZvOg0KPj4+DQo+Pj4+
IE9uIDEwLzQvMjUgMTM6MDMsIGNyYWZ0ZmV2ZXJAdHV0YW1haWwuY29tIHdyb3RlOg0KPj4+
Pg0KPj4+Pj4gT2N0IDQsIDIwMjUsIDExOjU1IGJ5IGNyYWZ0ZmV2ZXJAdHV0YW1haWwuY29t
Og0KPj4+Pj4NCj4+Pj4+PiBJJ20gZXhwZWN0aW5nIHNlcmlvdXMgYnVnIHdoZW4gd3JpdGlu
ZyBsYXJnZSBhbW91bnQgb2YgZmlsZXMgdG8NCj4+Pj4+PiBOVEZTIGhhcmQgZHJpdmUsIHNo
b3J0bHkgYWZ0ZXIgbWVtb3J5IGFsbG9jYXRpb24gZXJyb3JzIGFuZCBzeXN0ZW0NCj4+Pj4+
PiBjcmFzaCBvY2N1cnMvIEZpcnN0bHksIEkgdGhvdWdodCwgdGhhbiB0aGlzIGlzIGJ1ZyBp
biBsaW51eCBrZXJuZWwNCj4+Pj4+PiBpdHNlbGYsIHNvbWV3aGF0IGRpc2sgY2FjaGUgYWxs
b2NhdGlvbiBlcnJvciwgYnV0IHdoZW4gSSB0ZXN0ZWQNCj4+Pj4+PiBzYW1lIG9wZXJhdGlv
bnMgb24gZXh0NCBkcml2ZSBvciB1c2luZyBOVEZTLTNHIG1vZHVsZSwgYnVnIGlzIG5vdA0K
Pj4+Pj4+IHByZXNlbnQuDQo+Pj4+Pj4NCj4+Pj4+IFRvIHJlcHJvZHVjZSBhIGJ1ZywgdHJ5
IGNsb25pbmcgdHdvIGJpZyBHaXQgcmVwb3NpdG9yaWVzIHRvIGFuDQo+Pj4+PiBleHRlcm5h
bCBOVEZTIGRyaXZlIG1vdW50ZWQgd2l0aCBudGZzMyBtb2R1bGUuDQo+Pj4+Pg0KPj4+PiBU
aHggZm9yIHRoZSByZXBvcnQuDQo+Pj4+DQo+Pj4+IFdoYXQga2VybmVsIHZlcnNpb24gYXJl
IHlvdXIgdXNpbmc/DQo+Pj4+DQo+Pj4+IFlvdSBDQ2VkIHRoZSByZWdyZXNzaW9uIGxpc3Qs
IHNvIEkgYXNzdW1lIHRoaXMgdXNlZCB0byB3b3JrLCB3aGljaCBsZWFkcw0KPj4+PiB0byB0
d28gbW9yZSBxdWVzdGlvbnM6IFdoYXQgd2FzIHRoZSBsYXN0IHZlcnNpb24gd2hlcmUgdGhp
cyB3b3Jrcz8gQ291bGQNCj4+Pj4geW91IGJpc2VjdD8NCj4+Pj4NCj4+Pj4gQ2lhbywgVGhv
cnN0ZW4NCj4+Pj4NCj4+IEhlbGxvLA0KPj4NCj4+IEkgdHJpZWQgdG8gcmVwcm9kdWNlIHRo
ZSBwcm9ibGVtIGJ5IGNsb25pbmcgbXVsdGlwbGUgbGFyZ2UgR2l0IHJlcG9zaXRvcmllcw0K
Pj4gb250byBhbiBudGZzMy1tb3VudGVkIE5URlMgdm9sdW1lLCBidXQgdGhlIGlzc3VlIGRp
ZCBub3QgdHJpZ2dlciBvbiBteSBzaWRlDQo+PiBhbmQgbm8gc3lzdGVtIGNyYXNoIG9jY3Vy
cmVkLg0KPj4NCj4+IENvdWxkIHlvdSBwcm92aWRlIGEgYml0IG1vcmUgZGV0YWlsIGFib3V0
IHlvdXIgY2FzZT8NCj4+DQo+PiAtIFdoYXQgYXBwZWFycyBpbiB0aGUga2VybmVsIGxvZ3Mg
YmVmb3JlIHRoZSBjcmFzaCBvciBiZWZvcmUgdGhlIHByb2Nlc3MNCj4+ICAgZW50ZXJzIHRo
ZSB1bmtpbGxhYmxlIHN0YXRlPyBBbnkgd2FybmluZ3MsIG1lbW9yeSBhbGxvY2F0aW9uIGVy
cm9ycywNCj4+ICAgc3RhY2sgdHJhY2VzLCBvciBsb2NrZGVwIG1lc3NhZ2VzIGZyb20gZG1l
c2cgd291bGQgYmUgdmVyeSB1c2VmdWwuDQo+PiAtIFdoYXQgbW91bnQgb3B0aW9ucyBhcmUg
eW91IHVzaW5nIGZvciBudGZzMz8NCj4+IC0gUm91Z2hseSBob3cgbXVjaCBkYXRhIG9yIGhv
dyBtYW55IGZpbGVzIGFyZSBuZWVkZWQgdG8gdHJpZ2dlciB0aGUNCj4+ICAgYmVoYXZpb3I/
DQo+PiAtIERvZXMgdGhlIHByb2JsZW0gaGFwcGVuIGltbWVkaWF0ZWx5LCBvciBvbmx5IGFm
dGVyIHN1c3RhaW5lZCBJL08gb3IgaGlnaA0KPj4gICBtZW1vcnkgcHJlc3N1cmU/DQo+Pg0K
Pj4gSWYgeW91IGNhbiBjYXB0dXJlIHRoZSByZWxldmFudCBwb3J0aW9uIG9mIGRtZXNnIG9y
IHRoZSBsYXN0IG1lc3NhZ2VzDQo+PiBzaG93biBiZWZvcmUgdGhlIGZyZWV6ZS9oYW5nLCB0
aGF0IHdvdWxkIGhlbHAgYSBsb3QgaW4gZGlhZ25vc2luZyB0aGlzLg0KPj4NCj4+IFJlZ2Fy
ZHMsDQo+PiBLb25zdGFudGluDQo+Pg0KPiBUaGFua3MgZm9yIHJlc3BvbnNlLiBBZnRlciB0
aGF0IHNpdHVhdGlvbiwgSSBjaGFuZ2VkIGRyaXZlciB0byBOVEZTLTNHLCBzbyB3ZXJlIHdp
dGggc3RhYmxlIHdvcmssIGJ1dCBkZWdyYWRlZCBwZXJmb3JtYW5jZSwgYnV0IGF0IGxlYXN0
IHdpdGhvdXQgY3Jhc2hlcy4gVG9kYXksIGFmdGVyIHlvdXIgcmVzcG9uc2UsIEkgcmV2ZXJ0
ZWQgYWdhaW4gdG8gbnRmczMgdG8gdGVzdCBjYXNlcywgdGhhdCBJIG1lbnRpb24gYW5kIEkg
Y2FuJ3QgcmVwcm9kdWNlIGl0IGVpdGhlci4gQXMgaXQgZGlkbid0IHJlc3BvbnNlIGZyb20g
eW91IGZvciBzbyBsb25nIGJlZm9yZSBub3csIEkgY2hhbmdlZCBzbyBtYW55IExpbnV4IE9T
IHNldHRpbmdzLCBkaXNhYmxlZCBVU0IgYXV0b3N1c3BlbmQsIGRpc2FibGVkIHJ0a2l0LWRh
ZW1vbiBjYW5hcnktdGhyZWFkLCBzbyB0aGVyZSBubyBtb3JlIGhpZ2hlc3QgUlQgdGhyZWFk
cywgY2hhbmdlZCBzb21lIHNjaGVkdWxpbmcgYW5kIG1lbW9yeSBtYW5hZ2VtZW50IG9wdGlv
bnMsIHNvIG5vdyBpdCdzIHN0YWJsZS4gSSdtIG5vdCBleHBlY3RpbmcgYW55IGNyYXNoZXMg
YW5kIGxvY2t1cHMgZXZlbiB3aXRoIGxhcmdlIGFtb3VudCBvZiBmaWxlcy4gVW5mb3J0dW5h
dGVseSwgZHVyaW5nIGJ1ZyBwcmVzZW50aW5nIEkgZGlkbid0IGFibGUgY2F0Y2ggZG1lc2cg
bWVzc2FnZXMsIGBjYXVzZSBzeXN0ZW0gY3Jhc2hlZC4gVGhlIG9ubHkgbXkgYXNzdW1wdGlv
biwgdGhhdCBpdCBtYXkgaGFkIE1GVCBhbGxvY2F0aW9uIGJ1Zywgd2hlbiBkaXNrIGlzIHBy
YWN0aWNhbGx5IGZ1bGwgYW5kIGRyaXZlciBoYXZlIHRvIGhhbmRsZSBNRlQgYWxsb2NhdGlv
biwgYWRkaXRpb25hbCBzcGFjZSwgd2hlcmUgbmV3IHBpZWNlcyBpcyBzdG9yZWQuIEkgZ3Vl
c3MgaXQsICdjYXVzZSB3aGVuIEkgdGVzdGVkIG5ldyBudGZzcGx1cyBkcml2ZXIsIEkgZXhw
ZWN0ZWQgdGhpcyBidWcsIHdoZW4gZG93bmxvYWRpbmcgbXVsdGlwbGUgY2h1bmtzIG9mIGZp
bGVzLCBidXQgd2l0aG91dCBzeXN0ZW0gY3Jhc2hpbmcsIGp1c3QgdGhlIGRvd25sb2FkIG1h
bmFnZXIgYWJvcnRlZCBmaWxlIGRvd25sb2FkaW5nIHdpdGggIm1lbW9yeSBhbGxvY2F0aW9u
IGVycm9yIiB3aXRoIGNvcnJlc3BvbmRpbmcgZG1lc2cgZXJyb3JzLiBSaWdodCBub3csIEkg
ZG9uJ3QgZXhwZWN0aW5nIGFueSBpc3N1ZXMgd2l0aCBudGZzMywgc28gSSdsbCByZXNwb25k
LCBpZiB0aGVyZSB3aWxsIGJlIGFueS4gVGhhbmsgeW91Lg0KDQpIZWxsbywNCg0KVGhhbmtz
IGZvciB0aGUgdXBkYXRlIGFuZCBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldGVzdC4gRXZl
biB0aG91Z2ggdGhlDQppc3N1ZSBpcyBub3QgY3VycmVudGx5IHJlcHJvZHVjaWJsZSwgSeKA
mWxsIGtlZXAgeW91ciByZXBvcnQgYW5kIHRoZQ0KcG9zc2libGUgTUZUIGFsbG9jYXRpb24g
Y2F1c2UgaW4gbWluZC4gSWYgaXQgaGFwcGVucyBhZ2FpbiBhbmQgeW914oCZcmUNCmFibGUg
dG8gY2FwdHVyZSBhbnkgbG9ncywgcGxlYXNlIGxldCBtZSBrbm93IC0gYW55IGV4dHJhIGlu
Zm9ybWF0aW9uIHdvdWxkDQpiZSB2ZXJ5IGhlbHBmdWwuDQoNClJlZ2FyZHMsDQpLb25zdGFu
dGluDQoNCg==
