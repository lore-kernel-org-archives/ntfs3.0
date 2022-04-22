Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD642C80
	for <ntfs3@lists.linux.dev>; Fri, 22 Apr 2022 19:42:40 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id bn33so10849044ljb.6
        for <ntfs3@lists.linux.dev>; Fri, 22 Apr 2022 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to
         :content-language;
        bh=N/LSFQN/sybhfpg0wHH6B71OMHYJrSE5MA4h92oUuNo=;
        b=m267B1Gu2nw+Dord633lckwQOCBFAjfwEorD614/lS14Sa6Rp0or3BiBkEJ/zd2dOw
         XMIvsBv5p8P0W9CjjSHyqf3l4G+LsjcgdGqDLJbASo/HEq0iAW25mdNDWCqjXeDy5DP4
         5bAngKz9KwMiA4iS3RklfzZGK2gtzr3j9J5Omips0RfzjXWfUNg+2Lr31qS19Qr9xgLm
         /ZGLJezlXZoEO9R104e9vBuu4AOvD15Otcgipv1gZN228uHQMVs698o6hg0MsKmelUIb
         rIHvxxlXJAC0rpKMQ4HYVwN3N6tILjhIHMhCn7o7p8ov33VMd3N9iq0wU14kHizsg2qz
         ndBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:content-language;
        bh=N/LSFQN/sybhfpg0wHH6B71OMHYJrSE5MA4h92oUuNo=;
        b=PF5Vg0xaSXbAZrkoHEj5J4FznJD/B1nryN17/yImVtY2s2IyPgxPxVkcteUicETzqC
         73Nt5IFihWhVQc8yf2mv3PWkJw0PZNAEGefNZnLibGyIaU7x4bXB+Kd0sV1E/KTqimmc
         EPxoOUDxN72DHfNyW04zmVAYrh9XKtYSB64pGVpVejRFx//6q3xSw9r8LB9i3z2fZf9m
         VCSFXsjKhEUDyQTJxHsSMyohnoUjfMTnEd8aroNNeY0Hcd89uL8VJqfV0f2EXZo1U7SF
         Aeb9fk0qXsRfgyFcscl26eIOBnFAj+C9n2qAWtbDvht43KCds8ABALEFy/P9Y8ZbgEIM
         +pTA==
X-Gm-Message-State: AOAM530OpbZHjSNsqgTZ/fzLJEF21XbZAs4aUbcdJiD5b45ShYvwJx4f
	C1UnkhbHluD2nKwuVKGJcGfLBn86kZc=
X-Google-Smtp-Source: ABdhPJxnFoFZCgR/KyhPk64u7Wm+62Q1oFXkAF35DBDHkeBUatmk2JkOuCJHGfBzg+xxA7Wm8VE0ZA==
X-Received: by 2002:a2e:3c17:0:b0:24d:a54b:7f5 with SMTP id j23-20020a2e3c17000000b0024da54b07f5mr3620129lja.396.1650656558747;
        Fri, 22 Apr 2022 12:42:38 -0700 (PDT)
Received: from [192.168.53.192] (h77-53-209-86.cust.a3fiber.se. [77.53.209.86])
        by smtp.gmail.com with ESMTPSA id l12-20020a056512332c00b0046d0e0e5b44sm330775lfe.20.2022.04.22.12.42.38
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 12:42:38 -0700 (PDT)
Message-ID: <780a74c2-5b01-8b99-6c91-1b64397ce6d3@gmail.com>
Date: Fri, 22 Apr 2022 21:42:37 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Linus Kardell <linus.kardell@gmail.com>
Subject: Unable to properly read some files with ntfs3
To: ntfs3@lists.linux.dev
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j5VlXtdpege9nTEFTf2E9x5y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j5VlXtdpege9nTEFTf2E9x5y
Content-Type: multipart/mixed; boundary="------------AjbNijYerKc40FGnikQMgcCj";
 protected-headers="v1"
From: Linus Kardell <linus.kardell@gmail.com>
To: ntfs3@lists.linux.dev
Message-ID: <780a74c2-5b01-8b99-6c91-1b64397ce6d3@gmail.com>
Subject: Unable to properly read some files with ntfs3

--------------AjbNijYerKc40FGnikQMgcCj
Content-Type: multipart/mixed; boundary="------------dR6zsrp7YJ73zpweTcbM7B4G"

--------------dR6zsrp7YJ73zpweTcbM7B4G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSdtIHRyeWluZyBvdXQgdGhlIG50ZnMzIGtlcm5lbCBkcml2ZXIgb24gT3BlblNVU0UgVHVt
Ymxld2VlZCwgYnV0IEknbSANCnVuYWJsZSB0byByZWFkIHNvbWUgZmlsZXMuIEkgYWxzbyBw
b3N0ZWQgYWJvdXQgdGhpcyBoZXJlOiANCmh0dHBzOi8vcmVkZGl0LmNvbS9yL29wZW5TVVNF
L2NvbW1lbnRzL3U2OTN2bS9ub19zdWNoX2ZpbGVfb3JfZGlyZWN0b3J5X3doZW5fcmVhZGlu
Z19zb21lX2ZpbGVzLywgDQpodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxNTg2NCBhbmQgDQpodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19i
dWcuY2dpP2lkPTIxNTg2NA0KDQpUaGUgZmlsZXMgdGhhdCBpdCBoYXBwZW5zIHRvIGFyZSBh
IGZldyBHaUIgaW4gc2l6ZS4gSXQgZG9lc24ndCBmYWlsIA0KaW1tZWRpYXRlbHksIHJhdGhl
ciB3aGVuIEkgcmVhZCBpdCB3aXRoIGRkIHN0YXR1cz1wcm9ncmVzcyB0aGUgZmlyc3QgDQp0
aW1lIGl0IHJlYWRzIGEgYml0IGludG8gdGhlIGZpbGUgKGEgZmV3IE1pQiBvciBvdmVyIGEg
aHVuZHJlZCBNaUIsIA0KZGVwZW5kaW5nIG9uIHRoZSBmaWxlcywgYnV0IGl0IHNlZW1zIHRv
IGFsd2F5cyBiZSB0aGUgc2FtZSBkaXN0YW5jZSBmb3IgDQp0aGUgc2FtZSBmaWxlKSwgYW5k
IHRoZW4gdGhyb3dzICJObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Ii4gQmFzZWQgb24gDQpz
dHJhY2UgaXQgZ2V0cyBFTk9FTlQgZnJvbSBhIHJlYWQgY2FsbCwgYWZ0ZXIgaXQncyBhbHJl
YWR5IHJlYWQgDQptZWdhYnl0ZXMgb2YgZGF0YSBmcm9tIHRoZSBzYW1lIGZkLg0KDQpPbiBz
dWJzZXF1ZW50IHJlYWRzLCBpdCBnZXRzIHRocm91Z2ggdGhlIHdob2xlIGZpbGUuIE9ubHks
IGl0IGRvZXNuJ3QgDQpyZWFsbHksIGJlY2F1c2UgdGhlIHJlc3VsdGluZyBjb250ZW50IGlz
IHdyb25nLiBTbyBpdCBuZXZlciB0cnVseSByZWFkcyANCnRoZSB3aG9sZSBmaWxlLCBidXQg
b25seSBzb21ldGltZXMgdGhyb3dzIGFuIGVycm9yICh3aGVuIGl0J3Mgbm90IGluIA0KZGlz
ayBjYWNoZT8pLiBUaGUgc2FtZSBmaWxlIGlzIGFsd2F5cyByZWFkIGNvcnJlY3RseSB3aXRo
IG50ZnMtM2cuDQoNCkFsc28sIG5vdCBzdXJlIGlmIHJlbGF0ZWQsIGJ1dCBhZnRlciBJJ3Zl
IG1vdW50ZWQgYW5kIHVubW91bnRlZCBhIGZldyANCnRpbWVzIHdpdGggbnRmMyBhbmQgbnRm
cy0zZywgbnRmczMgc3RhcnRzIHRocm93aW5nIGVycm9ycyBzYXlpbmc6DQoNCiJtb3VudDog
L3dpbmRvd3MvZDogd3JvbmcgZnMgdHlwZSwgYmFkIG9wdGlvbiwgYmFkIHN1cGVyYmxvY2sg
b24gDQovZGV2L3NkYTEsIG1pc3NpbmcgY29kZXBhZ2Ugb3IgaGVscGVyIHByb2dyYW0sIG9y
IG90aGVyIGVycm9yLiINCg0KYW5kIHJlZnVzZXMgdG8gbW91bnQgaXQgdW5sZXNzIEkgYWRk
IC1vIHJvLiBJdCBzdGlsbCB3b3JrcyBwcm9wZXJseSBpbiANCm50ZnMtM2cuDQoNClRoZSBm
aWxlc3lzdGVtIGhhcyBjb21wcmVzc2lvbiBlbmFibGVkLCBpbiBjYXNlIHRoYXQgbWF0dGVy
cyAoIkNvbXByZXNzIA0KdGhpcyBkcml2ZSB0byBzYXZlIGRpc2sgc3BhY2UiIGlzIGNoZWNr
ZWQgaW4gdGhlIGZpbGUgc3lzdGVtIHNldHRpbmdzIGluIA0KV2luZG93cyksIHRob3VnaCB0
aGUgZmlsZXMgc2hvdWxkIGJlIGluY29tcHJlc3NpYmxlLCBhcyB0aGV5J3JlIGd6aXBwZWQg
DQpvciByYW5kb20uDQoNCkkgdHJpZWQgcnVubmluZyBjaGtkc2sgZnJvbSBXaW5kb3dzLCBi
dXQgdGhhdCBkaWQgbm90IGZpeCBpdCAoZXhjZXB0IEkgDQp0aGluayBpdCB0ZW1wb3Jhcmls
eSBnb3QgcmlkIG9mIHRoZSAid3JvbmcgZnMgdHlwZS4uLiIgbW91bnQgZXJyb3IpLg0KDQpJ
IGNhbiByZXByb2R1Y2UgaXQgYnkgZGQ6aW5nIDQgR2lCIG9mIC9kZXYvdXJhbmRvbSB0byBh
IGZpbGUgYW5kIGNvcHlpbmcgDQppdCBvbnRvIHRoZSBOVEZTIHBhcnRpdGlvbiB3aGlsZSBt
b3VudGVkIHdpdGggbnRmcy0zZywgYW5kIHRoZW4gdHJ5aW5nIA0KdG8gcmVhZCB0aGUgZmls
ZSB3aGlsZSBtb3VudGVkIHdpdGggbnRmczMuDQoNCk15IGZ1bGwgbW91bnQgb3B0aW9ucyBh
cmU6DQpudGZzLTNnOiBmbWFzaz0xMTMsZG1hc2s9MDAyLGdpZD0xMDAsbm9hdGltZSx3aW5k
b3dzX25hbWVzLGNvbXByZXNzaW9uDQpudGZzMzogaW9jaGFyc2V0PXV0ZjgsZm1hc2s9MTEz
LGRtYXNrPTAwMixnaWQ9MTAwLG5vYXRpbWUNCg0KdW5hbWUgLXI6IDUuMTcuMi0xLWRlZmF1
bHQNCnJwbSAtcSBudGZzcHJvZ3M6IG50ZnNwcm9ncy0yMDIxLjguMjItMi4yLng4Nl82NA0K
cnBtIC1xIG50ZnMtM2c6IG50ZnMtM2ctMjAyMS44LjIyLTIuMi54ODZfNjQNCg==
--------------dR6zsrp7YJ73zpweTcbM7B4G
Content-Type: application/pgp-keys; name="OpenPGP_0x13A0FDC40794CE02.asc"
Content-Disposition: attachment; filename="OpenPGP_0x13A0FDC40794CE02.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYb3ETBYJKwYBBAHaRw8BAQdA4WHRQQtiWRi6cRUNGY62ChTDoegaMhhovgnN
hSXUjhbNKExpbnVzIEthcmRlbGwgPGxpbnVzLmthcmRlbGxAa3JhbW5ldC5zZT7C
mgQTFgoAQhYhBPJaMLRXuc8Ej2gulhOg/cQHlM4CBQJhvcdNAhsDBQkDwmHkBQsJ
CAcCAyICAQYVCgkICwIEFgIDAQIeBwIXgAAKCRAToP3EB5TOAhGHAP9JJlsj5wxU
w7RBZGoxJk7p6Lpw0GYvuiFmf7c2ya7sZwEArWmopDtYd7w/hmim6ZNpoZNdQ1be
uawoppR7cvB+JALNJ0xpbnVzIEthcmRlbGwgPGxpbnVzLmthcmRlbGxAZ21haWwu
Y29tPsKaBBMWCgBCFiEE8lowtFe5zwSPaC6WE6D9xAeUzgIFAmG9xEwCGwMFCQPC
YeQFCwkIBwIDIgIBBhUKCQgLAgQWAgMBAh4HAheAAAoJEBOg/cQHlM4C6eYA/jOb
wxrfFwNh86E4nuhWun/+ipEe8szpIMo2uTO9VkI7AP4tXl0Ujnkn/d3Gab+R2g3T
axp22WeKf6kmiIsW1wjBCc0nTGludXMgS2FyZGVsbCA8bGludXNfYV9nX2tAaG90
bWFpbC5jb20+wpoEExYKAEIWIQTyWjC0V7nPBI9oLpYToP3EB5TOAgUCYb3HaAIb
AwUJA8Jh5AULCQgHAgMiAgEGFQoJCAsCBBYCAwECHgcCF4AACgkQE6D9xAeUzgLV
ggEA0VPi7Jqg7A6ycm3NHID3+8ioSXAQ8jfErtWCdApGssoBAOr24XrOoGXewIAw
BpXl2Cam9LOzJWiKsfP5ntI2e+oKzjgEYb3ETBIKKwYBBAGXVQEFAQEHQN4pfMVa
aRpd46c7Y5l701XkPPkZTV33Zw/9gfxBfocGAwEIB8J+BBgWCgAmFiEE8lowtFe5
zwSPaC6WE6D9xAeUzgIFAmG9xEwCGwwFCQPCYeQACgkQE6D9xAeUzgLYeQD/ec/5
ZmZb03OTbE0gk6PH598/OwW/7W4vqUkP9LepQzgA/2KtkRXB1dmxwKWBWs6ognKX
m0lV3kuKZKp6ggnGIkAH
=3D9oZd
-----END PGP PUBLIC KEY BLOCK-----


--------------dR6zsrp7YJ73zpweTcbM7B4G--

--------------AjbNijYerKc40FGnikQMgcCj--

--------------j5VlXtdpege9nTEFTf2E9x5y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTyWjC0V7nPBI9oLpYToP3EB5TOAgUCYmMFLQUDAAAAAAAKCRAToP3EB5TOAoVR
AP9VcjhbwnOQEd/4l+qbAbvCyT5CVCeScrCYrL9PnVLKwgD/SeKiEwN6B/+zB1VcF4yiRnj1ZRo5
WymO3/p7nHKDUAg=
=MTys
-----END PGP SIGNATURE-----

--------------j5VlXtdpege9nTEFTf2E9x5y--
