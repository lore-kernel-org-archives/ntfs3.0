Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614282F25
	for <ntfs3@lists.linux.dev>; Fri, 22 Apr 2022 19:59:06 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id h11so10921830ljb.2
        for <ntfs3@lists.linux.dev>; Fri, 22 Apr 2022 12:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to;
        bh=qpYd/EOTpHPJVXOJCxsEb5I960pOEdWgEoSEhG4e3Lg=;
        b=HFb5dMX+ASrA6ePlG+65395e1A8q4pH8si6omv4KYwEoFd+N5jm41RSpxD1KvjUMkh
         0Z0G+43Ccz83VtBG+IQ/zEKbBvZAunElXyRJcbuE7AGXpTu/auYQF/1mJ9bFdrEXkXni
         1IcVrM8a/YE3KBKvqkEZT0GE4ZIdHRLohiXdI5xRJArk+7TVCq4HBlH8IhgE/ushssLc
         ifMNx0BWcjGrhU3TI9hibdZVo6/UX/cxcIiaYMzRbAllkSv6RY1eIxsz8CQ2hfhOUhit
         F2gisdDL33+5bG6+kWjC8UQDKLediL6a9HufTqVa5aTL0BTqUbwfr6AbJLxN7q5xqxqL
         RYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to;
        bh=qpYd/EOTpHPJVXOJCxsEb5I960pOEdWgEoSEhG4e3Lg=;
        b=Ae309Jw0h0kMIvrAl7S96euP9oOLmDJSRstElm5qcZw9mOXAd8Wn8a4xvCCGm0zCwT
         3MgEdL+XjctG6JVnclFdBFdiKqaUQ9OmHwcOq69e3THykH7WZ/SS5cL5941RaiQQabgH
         qjXK7rN45dFkUmO04sbA07Ly1o2eEVF17vXt+Jklyray9CHH65gMq7lPUF2EyT+hREqW
         Ter5TgQ1om+m3OPOYL4ZA5U0Ox55AlIzF5vcaPSsAcSdRZm8KhSodFm9OjxJeaDorYlo
         IiichI5RNPNKwbUeO/ZmlGAOAp/6EL4LCaoWQ2q3HtRUxa4xesyQzbE5SLu2rpstFo+f
         uM0A==
X-Gm-Message-State: AOAM530LWPtxATG3FrIsc25feFHjfNTCfjp/VaNqAC+IKUqlatyq2Ems
	6w+t4h0Y+1zGuYPUxv8zfKZsDUJps/g=
X-Google-Smtp-Source: ABdhPJxlbzqFlhAJzyYoqUK5zYJyZ0Zr9ma/8IKcWXtOXa4626v92g0nOD9EI0RC+zGohOpC462/bg==
X-Received: by 2002:a2e:924a:0:b0:24e:ee53:d54a with SMTP id v10-20020a2e924a000000b0024eee53d54amr3673093ljg.253.1650657544385;
        Fri, 22 Apr 2022 12:59:04 -0700 (PDT)
Received: from [192.168.53.192] (h77-53-209-86.cust.a3fiber.se. [77.53.209.86])
        by smtp.gmail.com with ESMTPSA id i26-20020a05651233ba00b0047104806fa8sm333831lfg.48.2022.04.22.12.59.03
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 12:59:03 -0700 (PDT)
Message-ID: <bf4e968b-aa2a-d886-afd0-1f6f5c02d24e@gmail.com>
Date: Fri, 22 Apr 2022 21:59:03 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Unable to properly read some files with ntfs3
Content-Language: en-US
From: Linus Kardell <linus.kardell@gmail.com>
To: ntfs3@lists.linux.dev
References: <780a74c2-5b01-8b99-6c91-1b64397ce6d3@gmail.com>
In-Reply-To: <780a74c2-5b01-8b99-6c91-1b64397ce6d3@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aJlqrfYwrWBefU0Ou41E8GKh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aJlqrfYwrWBefU0Ou41E8GKh
Content-Type: multipart/mixed; boundary="------------d3VPyXwzrOu0F8KduNXADvpg";
 protected-headers="v1"
From: Linus Kardell <linus.kardell@gmail.com>
To: ntfs3@lists.linux.dev
Message-ID: <bf4e968b-aa2a-d886-afd0-1f6f5c02d24e@gmail.com>
Subject: Re: Unable to properly read some files with ntfs3
References: <780a74c2-5b01-8b99-6c91-1b64397ce6d3@gmail.com>
In-Reply-To: <780a74c2-5b01-8b99-6c91-1b64397ce6d3@gmail.com>

--------------d3VPyXwzrOu0F8KduNXADvpg
Content-Type: multipart/mixed; boundary="------------DTEZgfn9ikOY1bq1cZTxqLlh"

--------------DTEZgfn9ikOY1bq1cZTxqLlh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RGVuIDIwMjItMDQtMjIga2wuIDIxOjQyLCBza3JldiBMaW51cyBLYXJkZWxsOg0KPiBJJ20g
dHJ5aW5nIG91dCB0aGUgbnRmczMga2VybmVsIGRyaXZlciBvbiBPcGVuU1VTRSBUdW1ibGV3
ZWVkLCBidXQgSSdtIA0KPiB1bmFibGUgdG8gcmVhZCBzb21lIGZpbGVzLiBJIGFsc28gcG9z
dGVkIGFib3V0IHRoaXMgaGVyZTogDQo+IGh0dHBzOi8vcmVkZGl0LmNvbS9yL29wZW5TVVNF
L2NvbW1lbnRzL3U2OTN2bS9ub19zdWNoX2ZpbGVfb3JfZGlyZWN0b3J5X3doZW5fcmVhZGlu
Z19zb21lX2ZpbGVzLywgDQo+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MjE1ODY0IGFuZCANCj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3No
b3dfYnVnLmNnaT9pZD0yMTU4NjQNCg0KTXkgYXBvbG9naWVzLCBJIHBhc3RlZCB0aGUgc2Ft
ZSBVUkwgdHdpY2UuIE9uZSB3YXMgc3VwcG9zZWQgdG8gZ28gdG8gdGhlIA0KT3BlblNVU0Ug
YnVndHJhY2tlciBhdCANCmh0dHBzOi8vYnVnemlsbGEub3BlbnN1c2Uub3JnL3Nob3dfYnVn
LmNnaT9pZD0xMTk4NjY5LCB3aGVyZSB0aGlzIA0KY3VycmVudGx5IGlzIGJlaW5nIHRyb3Vi
bGVzaG90Lg0K
--------------DTEZgfn9ikOY1bq1cZTxqLlh
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

--------------DTEZgfn9ikOY1bq1cZTxqLlh--

--------------d3VPyXwzrOu0F8KduNXADvpg--

--------------aJlqrfYwrWBefU0Ou41E8GKh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTyWjC0V7nPBI9oLpYToP3EB5TOAgUCYmMJBwUDAAAAAAAKCRAToP3EB5TOAic2
AQD3H+JpldoAEJELFzJPPCu/6dcV0cjLiGOKyCMoBkS6DAD8DAH+5i4ytSpIJ50aDgFzYIN44HWU
of96RXJ3Mze5mgM=
=YQTO
-----END PGP SIGNATURE-----

--------------aJlqrfYwrWBefU0Ou41E8GKh--
