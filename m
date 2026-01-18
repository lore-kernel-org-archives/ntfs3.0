Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FB3330B2D
	for <ntfs3@lists.linux.dev>; Sun, 18 Jan 2026 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768741875; cv=none; b=lZ/0cfR+OPgmBkGd0fC2sZZWDNYQ/r2vFngk5/lBS/O2Ept2lAxAEzCoZX8kg7pYtp4oPuL8UoMSIKnACDYXoDPKg486QW2U6IKzHwN6D4o2MMq/5kMCQNl3nBm/2xQ58/vT3iOOIkI+w1fW32Z9NO0d8FAfjZ165rOXOC1Aytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768741875; c=relaxed/simple;
	bh=/NZN+OZo3z9jYg2FGd96rboVt9ppSyp75aS20Zlh+Ys=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Z5rsrmmRrUAiCGdr/cZpgJAuKE1Qobnsa1bkDTzClVvl9Uf4JecevTpKlPCDLXtf3en3VV3Pak20HyfXOsa+8gc5YC4OqSVrKIZLmigrEdVu5yBKZnmp8/XsWnnUJKIsEtTFLC52qknZFly/LQucZXHUeEROUHsZ+MVPP3cjty4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=llWjbeMl; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="llWjbeMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768741861; x=1769346661; i=markus.elfring@web.de;
	bh=/NZN+OZo3z9jYg2FGd96rboVt9ppSyp75aS20Zlh+Ys=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=llWjbeMlOCxnMIKWyI2R2sAoMUBsJ+glJErjLNm9OBz9vsUoOmOAdDdX++BvyIqG
	 lfcwuMXJaxy3fof5Sj9j+N9XDWkokKdVMNjREGzMoSVxLQCcNegJTa5MeU8QFYSqV
	 fe5SWb2Qm7NDHgcHrzgjPRCNS5dps4soCwh1IE+g0CXxvvDDjPwVVODmIBpDzb38T
	 utDnCOinKtMtFSbCpMhiw6O39a9u1ZW7qnXqBk++wuRN+x59YYGzAryd13jPBMi2Q
	 uN9zqX172VivbqhzHxK0YUJLs6QSGsAvHWKbL9NRy2SVI4IGF27SCWrCZI3fBxP7c
	 hft+6w0sC0s0ef/0iQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.1]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWiA0-1vJCVJ1F16-00TJV5; Sun, 18
 Jan 2026 14:11:01 +0100
Message-ID: <17914287-640d-4500-b519-5f3d3aed2878@web.de>
Date: Sun, 18 Jan 2026 14:11:00 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>, ntfs3@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
References: <20260117185911.39415-1-jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] fs/ntfs3: Fix memory and resource leak in indx_find_sort
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260117185911.39415-1-jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mcfq+soVLCwEbMSKUuEeIw0VdfU+RV9Qhw9bm7hrwaZSYuaG4dY
 35NT5KVeIDeo4U3DmVPHzp4mQCaZLHgSaYURIkujn8kH2x2glGi+FQ+6hVEDYDTP3gVJCWc
 ztfLdNtRh8vk935E4OwBOKvx67P3j6B7Lb0/A28VT+iuMfPW6cJh4Q8AY831XKAOFodp+gQ
 xV0bB686YTsvRLlnBPhtw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tado6+T7aPs=;CENREAGbYR5tdDLuweB++EETuKt
 4U09rBk1Zwit8AyjTrGeGvjYV5U0wKFWZWNfA/aCow2bEjgxelH4USrUtTp+cbmnul0Em22CG
 M8cz9PHajrI/DKhge8NbSfjTZUnVlutam6oOdUaOBXmoJhuaqKcaacA1VnECOaPZQlz348kkn
 yh7EQwmO1YsDcsm+FOn5OQkLPY5nHVAuFS0kKrM4jOs+AmuAtfYWcIDYGJ3B11BdQs5ZpsDVs
 ajMvu9hlsJBr2XfYF5w7djlIkWlPWNQWrdgCYb6TLOEdqMdw8+pv22ZYYB6C/q0wwOvMe+3AG
 IgNMZSyo9KZRQuSpT0EN3BfjDUCl6mYHf105N3Fvwtc6hbkcomNz8kQNR2tX0Gg8teFKBUXJ5
 4KlSwR+ym+zA8lpZYxXWa279bHjMweK6P1mrk/i2TiR60Nu8IHCTp7W44PWuYqQ9JZ/6TkbIw
 Tf6G2O2NnsW0KxqQ+cEdZIKNL56cgX2dkogxifNhROGx8GZj9IMf7/s87NfQ8JDQe2NefjduL
 BkcyVscMq5k916PfpqT9U6yY5/uzhp85yjGIn+rcPQ3MLcpP4OY0qkDZ71dfFZ2wI1LDng4ht
 hfDYOYrUrHxN4gX8+kdTYOB/mEphbX6g51ZMfVGSkRJWYlocz3BKty0onP1mNM6VziIE+A1MC
 JS401WSY2AZHyYY71Z292cNGwC9QzIwiTuUC6sugphmel1YS3yKrtgAXzZsEeWwhiz/4v/Urb
 euUFGBbfJRIo7BCEjdN4bp1oISOen+A0VcZpg3QWZ2rg75j0YVmpKpNYpq/6MZY690goyWKrH
 whzYbs7A8PvtekOfgste5UU6gClW6n0T6emcdRDA/KR3O0obuBVhUp1m1Kq8eXMKchpJimObk
 ph1t+E3F1ZQ8ScVf84DeAOmXJCO4G7QQ6kf5TYGIuCp/o0kO9wAauyXI17Rxt7zQ17EUJ4HBx
 uxG57uPmFx2XhxpDxEheHUTJXYcpZD4vgbgaxjg03BnbURV/NRiHoch2gmy7/bSNKHbbvpAVg
 9TMnpbw/xw0gDV5q2h7i7aFaShwfzuvC/TTkTBeuVLskXzN+6Qie5qqcsUyBXQzK9iN5Xm9gQ
 wpw1fVVnDUBalEgvRh+YIWUxp57ftMDKvgtHpCl4Mva/S5fiGwEm+XxcOyLmRk7C6mkh6qXwP
 gw8VbCtVDDhf1+UJ5gDa/uP+Lea7eA+1Mz40U1f2KFVmYj86C4HTgTiYzfULcLbja2ZiajCvL
 XWB/pFINCASD8AbkO5kaC0xiflSAW0w44+K/LS661MbWCACETpHjCsS6XFr7MWYxh/LB0CFGb
 qeAqdGi2YVQaYCbXyVkAR99ydqiaYMGbrpY2qqJZKhe8Ud8jBGFSzisuB/WylpDcuSqewmWcq
 gz8LHg1uEu6X/F9EYCufNxlRQ4LhrC4HS+xGDN5XEhsn95iloCnk6jmSaQV2kAFAa1z09rrxR
 5yytJBCTzjgP8horBaUrbnNxYTeuU6dOGkh0bwDCiSFP8EkzM7nWqsPfpACBP/ifZIKLIvaI8
 83cw2DD/u9Mp4OjbUcpEBrxayyXJcBFFh+TDrUhHxYKNWMzqx4qcg9drCz6GL09mq6WOt7hg2
 zMnBB18cxkVkZGBjbhkDiIFYZQ6VwqvROLSfrTbHvPmH8tLF1S3GB0c/xIDE2LDQCp41fk/P5
 JaDa1rVI43ueP4+A2YP/zcrbVupbcji54CDN0ALyoesnnK6fdiK6Toeq7fwXdNGV09LYLtoMX
 7MrefuozyhHxn3p1rXqM8ipumMcHZajlQLKH8nSymq/vr67BbimXDLkLypQx3jDCpqhpqrWtl
 uuBGeIVIoL/OlkWOfoVjC3Lj2VehAWCg6Ps0fGUahIKWsltfQ8Z0gOZ6wfjAdU7LzrsDZfdBy
 UgPsVNFkxxl2feFAzQFyjGqfii1KC3hKc+XOo/WQJQgw0v+CJ6oD7p1xNxFyxiPKLBSlQxkGw
 uLnK71OHniBM+BAjm5wINqLuOpPuYpcOyK4N0zwtg60tg78wQPNO4Pxr7h384MPp7RbONIxn1
 eX+kltfzG3uP/GP9A97x6EozAZVOGCSv/PNVlybaVkU7276Q9ngGhp9sWwI6Prmgpq7vhwSAj
 EqOlilnAhDOvVJA4bwGik4IysLqNqgpGlkkyCN+oFUa7WZNv+V+NvM7z/mWvScFc35tJeWqcI
 DBsQv1wZ5rReKDF+rHi/f+3jCVbSVIw6+pISvFkK/NY9w/bmyOHw+RZj7mfm0J4en4NOIIFft
 YHAnVq+sH65B7kOvOY3RJBrKHr+aw8JKrUDpLCFUeyZoz2Gt3q0OMjJKq4QJU8DqIxqkDB9wq
 Tk+Q85Sfz+qDVgcVB6w6uWDxQwuMs7QEuQxg4QtQBdkJ7Zt/Ur7dfcaJUMZsSxx8xPlCyhcBY
 Znq+e2EpNb6Gn+/YSYb6nP2tH649LRh7v9+5JBdIFgnZKImzur/LKb1OekwLOfr11NTbKQo9c
 G76r0/DTfK8bA8u1lwricTdDb45NmcoNEhGyjNPzJ7Ss1fYMXfNrj/Kddk/TdgPnUv74+z9Kr
 JUXsE73bJgHh8Itf6UwUgWHB4XITSdYfYeEMszgEWorbNJShGMSwyWJfPMFYC4lCzsJGkZX2W
 zehd5L2Ho0eVhbbxRJYOLln3RuIvPLXlEXEjR9xnRr6AW4m6L1YV6Ck1/d36mzE1XLaG9YDyn
 JE36MSsq5xeiXTNUQMDktjpqsi/MQ37JE1nyEzFjKoxnvKkyLU2CC0JrrrsSoFZ4geQ29vy57
 dzWMvz7n9Pur2f4vrSg+brX/fXdiZ9lXRewSs3B/P0wAe6MaBF3sSStpxT/Zg32jVfkWJpV/H
 cLWGxAIjNbrJHBTVANPZZcGDwi1v2YS1PVyDOsHMPxbEamVZqDNt+wonkVl/QfFuT5CZo4S3v
 HFk27O40jdliwSUVRt5VlQFzpLqyPYlqP9nNiaTNKvLtF/K9mLyk/i8d6alKJGndKw42zsP4c
 /qEfQDm/mKcv3HNFhYEwQrG1J6QgwxekDhwlpoLS3+VhOqFlepJ0F2ntgGlYud8yQxOKL2LV9
 X3NozyU+1FU6+8FHCDEq6Szr5KtXbsTNRv/LlCYKaz/8Z3unJYfk/bBa0I6SmRiRzTUjd8EV+
 TOOiTIc29OXMERFR33Py5E5hgjEy154/uWJekfjJ6/GFO4dXU+EdlFrNEtAFyt0kMd5hTqCE8
 I05GVbcIYkyPTJ8faj1TwihBE6k5DHmk1dqDrfcoq2ukTivUNwRhlGTKP694Jy8VcphNutyTl
 Qetoj7YJ37AthgBYbpDrPFjrGHovTOnboFnRSqDO6H/6b1NfMYbIkI/V8Ymmd3XStsaGs+i2B
 vw4sO6lpnBNvuRPK+NAoJG87ky3wLOoCGF+KafM1D+WH7mxfOzDlOMswmD64HrR1Fqnd2O+yp
 Ktb3NhMrGlO/J9DSRfX179lwyOZ66YjLlC0UdqTRYv5TXLMZi9LBJlIqVydaUP/CD/yomxUmN
 320Jy/WkNgrUbLJ/bKRxTjJhUij561kVASAezRO6QajTtm7fPQnAzerSexWe/qYClchPRqjIw
 w0r19L2sr2bo7L+bY+pdKky8kWfKTHF6TDYn2evl5Dk6s4ZIym/V8hUub9gEdVR+8AmGl0Im4
 /b8vK+ZOTMSYWhqVn3HGJbvfciHnQHVpd9nN5rXjx06nfpXEOkENZ71XHSAHiEzQj7lQaqOwU
 mD/iOnpVH+HEpFASdV7/3qfFA9faYnMVD97zb6Ob+gRXdMNNrolp6h0KGA0h/MXnrP9huYEgv
 w4JtcAH5YApKioA2OLR3Xnjm38bD4tM1Y6KwBAiuvDnr1NhQ3LxeidNladOYjKhA38W7qyz88
 /+FqODC6yBWlnVJ5TKSZ5CatrA4C5rzLdXtaofj1YjqUmaEUpnz7XiSqA0GYrFelJnp7v4DGL
 Yelrq194shn976YOfSlqYpH4neRlx7XZnIGLhh+0+xrsWSmWWduoc3ep4ojX4ZFRFs23Qxc67
 g9ItquvFS83T+OjOJECG5wJ+hWxz6KM98VWgccSb9A7Nr6L3RNLrJBYOarGFWiEyRYkgn+7hW
 FujAH5jk86tbOsw1wZPfzHEnReBUXE82rKX0ljRP554NOE3khkPzk5KNcj04SN3rWuKxYPDFT
 cHYQyxy9CdfcfWR/2XnIqEYca2g83xArGEob9DoA7/J5ql+2e6X08cxwpJY7lAOMDhiffmIsV
 11YlqynbyS9DT1Q4JsrsyYM7ekgwOEyd/f6oHgWa4HSv8uF3d8hUDuyWBStLdJ75SvzGvomKC
 6d5wA5770e4Hywk/9VIiuycjUBdaYSYVAqMElbK2zcnRFhtB/5iYdgTQOae1GyaF2iq1hukBT
 ck0Kd4/gwYgKoLXwnNFRxDaWHJO3z2+KFT8SNTinbEkbjVvnoDY4MKLo+G6NH0fr1/M3AnJ4e
 06rOq3Kp9RvvFp57xQl4p2P/s/uFCKoDu6xo+bnaKZsgPU1THhqIH1iScEtVg2cNvAOm10yxq
 X8cow3/7c4utfsMbs1GTTDFGJOjmm7dlf0GGJsXVUkJzKzHG3CuQlAdlTxIF9nyc3rqyyoxkw
 s3oXxrnH1UnS2/u15Zr/9yFR2C39OGoUYnhPHPCR3PVQr0/ssNvEMaqwtRWL5GWaP5q+aA8Qv
 DYfgu4Gc9DyFfyIhIJ810Yu+FK22uxldGACG9PmDUCL1qHl51c/wwYddmekcm4+DXe3X5iRJ+
 vnkRncSATqemS9Hu5TMsxKGu1xmraK3UGL71HXhHZreze8k11gXB7IF6LB7WyrsD8FFAg/74l
 UIEFfhiVSSeRot7G5OLpKOew97iActK6a2gBehzc9TarlcB7GV9DWSngxatL7S8fRu+bw5gJL
 4WwwwMN92oJUhZBSzNmqGaFCionTWoeyLoNPRndG/s/kQ/8tmyOM9JqnVnFba2An7vz2O16v5
 0zw1luVg5prMINUiSFcfYAZ3s4zamd2D7xwMHMvpaHuBqbdFf9Afh+h5K8T19Eq1NPDt+OQHP
 NRuMgYPQw+L07y7xRuRdH09PMzGRXKhrRgyURlX0CpqvBttWJ8HgjwpUKEehw12PuQZbjVQJB
 zjvXVOx7G5Hq5ymPJLduVkVXPfLdWUZNQ4fmKBtTpe/KEqoXS4EadtrPwTZpnhPj4m98k7ZZI
 hF/51PvRAeT+FwsM/0U+JgmQMoxQT4sQTLdhz7G7bULA+4fgrUUf0lVEBLVghiDZDBHw+P9BK
 DS6+uUAgx8cmScDvCslL8+pzHAXdW

=E2=80=A6
> This patch replaces the incorrect =E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n94


How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

Regards,
Markus
