Received: from sonic307-53.consmr.mail.ir2.yahoo.com (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAEB79DD4
	for <ntfs3@lists.linux.dev>; Wed, 19 Jun 2024 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718786566; cv=none; b=dXaAdixTRroq524RwZguTjEY3vJAXWIK3y9diVHVERD/v2/R7smdbim4ZPCxWT5iJm7v0fbsuRx3plDM48PM6vwxstH8wvfmDg4iIEQ7dBRz18SvmYMkAx9B9Q3xonAnnoOpJ+dRdiwjSGNqwbVxWQyaPVQQbFPEfs9BMYTCaN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718786566; c=relaxed/simple;
	bh=fEhCk92cGwmttWvZUAW7aVOMwq6T/LcFzUaFmW589os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpHiFsyUFeqaTIu38VqBzHmTAG41BAwIUpNrOO/coHTdAUux3FXtQvkBGQDtHF6f8pu7q+v2yw38ILiUAyLovh4euRqIU2T+rPBf0IU4AMYBtVgL11uU7MWNzlZ5uxCjm4knHfLR7D6apkX0gYIDzUVRf1tTfYSggf/pT15Qtys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.it; spf=pass smtp.mailfrom=yahoo.it; dkim=pass (2048-bit key) header.d=yahoo.it header.i=@yahoo.it header.b=lzwIaf+d; arc=none smtp.client-ip=87.248.110.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.it header.i=@yahoo.it header.b="lzwIaf+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.it; s=s2048; t=1718786556; bh=+J7BixOzTHseiFcgKJ0O75Cb+cvFhOjj69ydI/f2O4Y=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=lzwIaf+dPFjuY/fJPPCYoaxsJVc1q3a681ZzNq96+jGnJBZWpFEV/QrXdp+dva8QFIlOkwgwK/PR1aQvnlo2+NwQPwFs3/hjZMpGWyi5LCfMXehi0x+7uCzZXEbtD4GxVxSQkrwIlpWakHoAas8LSXmoC1YXfNeKD4khXf+UfPLXYH55TeXu0ojY6zO/9R2whlD0hw8SH8/54G/oyzK7kbjTgBerDzd+CtZizvvs8TXSbGt9AbL9FBA2Ca00wNonw53juHy22dv8TFcZACEhDuDTUcyYASxNGWKraPc5eEwMIgAmTS1txN26WqIYpmABHElQbA4J6j+fV0TCK7EcRg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1718786556; bh=rmUvIjf9atVRUjpkYBr19YBYKZQwdqOvDbPV02GnjGf=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=liFIWEY8smyTwTbgSKQU4tFa5fJhtO2GnuMLYFW0kWNlMhjnxl9+uCWrnkHoJqSFfPufbW0BNI3CUj7AMpVRZhC9jpr2J6Yr8r4cQwKLVHQVZsw8URj5lGPv6hQI5NbLojaTkjV7DTAJcyIYJYNANX6GhlrIdVywfwN36v1+kjHaZUjycrvZQGPbLLAEnhnBzgQFT4E8TxyqFOODg6imaKBeJpiwE8kNetPu5P4QeKwt/mB2NgoAEI2iNAwexpZXyxmtNox+4oZsVXcdNEvnnJbzmgip6kfdeCg0mly5mqNMZ4IoKC5inMe2cbiB++3N2kCGUR++gyYsN8oqjCdwUQ==
X-YMail-OSG: YJHOOR4VM1kTohr8GjyEI960.cQbYA4fsMNXubejyYnKrpCNMyldTk0NgoIiVoM
 eQtanwS9.I5A0_jYEZufRJVqZxOqLjqwMwKhblKxrxvTU3T8I3rFdCXsmIGtybGZHlHeS3GbJda5
 wPE526btls7CTVDFa73.auVKkcuj.3nIBb2ZcmzXcS7XEKhfJ5bPspVlWSYC0xcXmEN1anURescI
 zv_mulDFgg8RjAtOEQBwd9bdqh3VesHYaSl_ZoOu1N9WaLYT9gi9Q9kmnWdhlULHiqzQc62Q_ZOT
 xYWzMyKHzcC0.oCUfhbdER2Edhm0ZRRS2Ra.Ue3NgH0Du.iXnhw41zYyBrnlxyUfKLY8XtALu45_
 Q1umcbxJ9gBt4lIK_CJrB8D.1rWXfBLTovGTbS7Jgo6NQVtAf7W.irDZS2c_b.iCjcbZjjuqLX2K
 R1xLKmdYOwnalvD5t3Z5jRPFPud77_b7Wrv56lz_8bjUW0cXNsnymmVZbLDad04rFL5KS3IBjkj3
 HxAiNJ932yFeoNllt54m46fzByneG1cr82SyFow4ED_vtcp3bPraSunKrkqvTmxG32JWyRd56DZE
 kJo9jibj92FguCBV0okXAlE6TAEc8pDFeBiilwQca9hTuOESKwUc4hrEap.VnIRBN1nmP2QuQqMI
 upoXaBr2bBeYDNBEOO.nZMN71G6GqBqA6_Oya7j9hSx2a5FUK9rwL2tBglsHD6zedjBQhy8_Uhfu
 yJzIW4bD4KMY5CUqHVAPm.pG6a3uLFVsyFYdkWnxvxMLg1v4A_ee5mvsDXavhvDkgv21Ee99.VUH
 MNWP9nCfuQi5nnyswK4dFEOc3_zRPcojkjHRi6EXGaRo_wmnNM05UT13Y4yXteFuiU7K5ZOCPWmG
 nlE8InRlrQeW7PVcIPjYeOtUuTCiWE_nXWk0L3zEVHDUVIwuNQDLDcuVwthekkNBWAxX8fw2N_em
 Zx1d9yP2cBPpSuLwZpcdluEKxzJoH8.3i8VtnbKiCVuo7WZ4ICLZE.M2OxRj3jf6vUAZxY6SFXAQ
 WzCRfJVn6U3BUBekuRuv2NU5mZjJwcQlpm.geUiWClIN8ZzeVQ2Kpsp4hAFoSwqtBVTbM_HD1_YB
 9cBkKGfKf6yStwi4XRtofae5_wGq3bzlwSuAvo6YxWaageaXZt5FQHFLqyClsgqUrYMvZ4CmgV2I
 qOARnnnM.v_BbtfXJvlN8riNAasCfH21z77iG58H3bwZZGw8be6VUDwfaf6fdHJktQxe96d77Oft
 qtOJfZL01HrNQdnkr85xLxNeEhPLeCf.9ib7r4Lf3IH.CMGjlHRQ3DdVpsRXingf4Fw5tLuln.6f
 gdmUIyEqvWEYXoFNpJHRG0Js3Sn_KeHmgGTA2uEJYhVv9yTTW_jZCcInvgJSvMmWOtsnYH1p1P0u
 lbLGA27w5BSIsRHkXnjt7j.sKbmOwbgRTosIsdlMKKd0an1gGWKPvbpD6rpjhswxlf1XXDkl5eXJ
 QeQ23wOP54EpvkAifn4YVWfhgSziZfkI_rC51c9k_vNYXyfBzbCOPDZ9BWnI.RaVuNMd1Uaoi2mR
 9pctm6vW3M6BKQdb_N3J7o5zwTd1PNWx_.SuLQ67RDsMtQWwL7nUYJPMuv3Pt6Xl5jetz25g_xI1
 30KdrHk0fMuMQvs7SNSg_1pHOYmgOxJ.ZbocZ_PQp4bWTQFI96R.3vFGqsj2HlUf6.KV1KFNW0R0
 GUaQsRpt8kSsyKIjMtjbVQlxS5BOuC8GMifXcxM98ZexEsnK6.c7urizEAnB3KC9Iy50JQO27p5x
 sF9seoOB5c3MfwZ.9aQMlzJKaO15.bwMGfBouu6xyEm8hgCZy1z_4kKHNNQtxOXjVUUAebtMa3tp
 Y5pNrdbtlaPJnqSvwk95TDGuCYjXTPkqG7vC.w0iL7JP_I_DSSgIvFHZHzn_o15WSodIv6SiPqML
 GXjoxIxGau1ffs2UyEZ9VsKe6bXRjdRewWTF_M.bqj4oXu9oReKoI50DxSiTcdI0RaGD0gSWiUbI
 kB.oh9E.4reAKlRv5lkBBrlN.Nr7vhcZkkZPrzbNvlOxZm.cFlDlH_fsZBv045SWzvCzxvmlMTUz
 yXT_zjfcMCrMz.Im8t9_hBNfyU7H0HZONe1SZk1CoogjpPi83aacXVXN8ddrJs3__j37hrJwX7pN
 gqzvvbVO9MndlOXJAZ.4unwpPkw6QvHmfhvr19evOePac63f.4ODuEf6RFhVBlOQo3SZPa8rxEAB
 o.jVJzW.tKAukHGQowCY2JYFNAYa3AFDsPRAwTPKcIQLbyz153mJnJG0-
X-Sonic-MF: <giovannisantini93@yahoo.it>
X-Sonic-ID: e476d620-929f-412f-bdb2-a2a040f31e64
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Wed, 19 Jun 2024 08:42:36 +0000
Received: by hermes--production-ir2-85cf877599-nm2z8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4d1ee1b7c7eb2364de0b6e078388e921;
          Wed, 19 Jun 2024 08:42:31 +0000 (UTC)
Message-ID: <66e8c76f-208e-4844-b8d2-69d0572cc7e5@yahoo.it>
Date: Wed, 19 Jun 2024 10:42:29 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Segfault running a binary in a compressed folder
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
References: <08d7de3c-d695-4b0c-aa5d-5b5c355007f8.ref@yahoo.it>
 <08d7de3c-d695-4b0c-aa5d-5b5c355007f8@yahoo.it>
 <0936a091-7a3a-40d7-8b87-837aed43966b@leemhuis.info>
 <bed7da51-cf89-422d-84f7-cb3d89ffbe40@yahoo.it>
 <0c871021-321b-4a44-b270-508a64be1cdd@leemhuis.info>
 <b65e13cd-7479-4146-a6bf-cdbadab6795a@paragon-software.com>
Content-Language: en-US
From: Giovanni Santini <giovannisantini93@yahoo.it>
Autocrypt: addr=giovannisantini93@yahoo.it; keydata=
 xsBNBFWGlaoBCACcYYy4p5OpFH/zYyJ+DYGfr8m712ai0GpJ3hrY4ncmt+cHVYw0pHeR01j9
 t+dtJTwP3Br84E5z/0/mpg5J+LLEHDbAa5Gtal+ykIwtmfZ9N/GEEQvYAU691sCkk+hLSbDw
 vIKOZSMMCV2Ee5R1gY/cM+UBJVFy/DJi75crugb/Fs9OL19YPBR9YqOb1eoE99/5WTbJ8EFm
 Nq+oqSnp3O/7Uln96be3A3ri0a+njr6j1OXneE9NBLQbQx0VJnrTK0pv1oHJFT6fqs3Ar8BT
 tgvaTQ50Q7rBYeZE6o2m+A6tBeC2JGZYCIXXQBirHVktrsmIqy9pnfHxN7hyPuRM6qy7ABEB
 AAHNLUdpb3Zhbm5pIFNhbnRpbmkgPGdpb3Zhbm5pc2FudGluaTkzQHlhaG9vLml0PsLAfAQT
 AQgAJgIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheABQJYLYzQAhkBAAoJEE20cJYvrev1
 D2sH/R4girMykZt+hh6TdYl2RQCZnGd3+aFiL5bKWQH61uMPp2J/DU5ZarxVPBQVGW7vTRZB
 cgceYoC8lnzkWUzlLG9I0pU8VaY87CvwSauRg98L+6eiX42Hz+3xLKbzVT6azewmR47d4WcH
 CF59lin52O3MhMBSY7VoBEPI7w5tJAF80hzXACqi8cnt/yPI/jRE+NFiD+dUiDj0rRecKr5Q
 9z9+aEjfNiFNI8gkrjGwGerlDso7iOjmGlENY3hv0sP+9/Rq58J1Y+Wg4ACTj6s/vjpgcTQ1
 oJxkyoJbEtUVa+B6R6yc2BHECl+JdkDNohxfRMIN3IzJpIQzGaKNATVbaDLOwE0EWDdW/QEI
 AMvkCk1fA/6fXBRuNscDnDYRLSPoMx7tnjOv1Uub9iyFxr2v8B7DKrQq4R0WS4b2vITnsPZA
 WTWJQ4SE0Sx54QGPVjdMzJTMN2cw7y35lS5anYJlY31O89eMpCPDwp88jtq7LKE0Knq5pu/+
 pWFvfysSJkjrFOAKEGn2GEuT8G9BOplafmjyLXv6bwFViUGmNpaTrztlhBaunMDsluoVGg2F
 LPdCdBJpE/vzAOzxg8WkyV+LzPMrz178WTlM0YSCJ/9Ad7QlX0r0rpG3n+HGlhB2Y2hFQM2C
 SlyEstTvMuHQ0Oe5rjnSHxo3FjESknl0csmQmGkPed/DsKigVTeWiC0AEQEAAcLAXwQYAQgA
 CQUCWDdW/QIbDAAKCRBNtHCWL63r9aSjB/wNUBdHtV2j9UQgCpXVcHHA0VSVYSRfvDs0rVOk
 1whAHlg62TKQv2uTFlvn8/lml/Wp7gyW2RKTC9ZIpn3vbgjbW7DuwvjSqCvEt83czRime2jM
 h8URlFRrSFwfNifGxSXsERaH0b7/ae2zfIKRLGhep+/wikTYrItwmW+xXumBVRpkoaKDPy4d
 lhdUxx3EulaWJJgfywYWoieN1jMRcvBWsuexdMFODMPt872NDZhkqrOo+A3fneaELitZdjKq
 NpmY6C9etaRkDnjm70l2cP+RjWY1ahxFuwaOB3ZmNRe3VGyvPTUvdkwZdxaycLgVjEWUJEyq
 H3BYrE7EWk47q50Q
In-Reply-To: <b65e13cd-7479-4146-a6bf-cdbadab6795a@paragon-software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.22407 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi Konstantin,

On 2024-06-19 09:54, Konstantin Komarov wrote:
> Hi Giovanni,
>
> ntfs3 currently does not support mmap write to compressed files,
> as indicated by the driver with
>
>   "mmap(write) compressed not supported."
>
> We are aware of this limitation and will implement this functionality in
> the future.
>
> Regards, Konstantin

That is great to hear!

Should I create a ticket in the kernel Bugzilla or do you have a issue 
ticket somewhere already?

Bests,

-- 
Giovanni Santini

