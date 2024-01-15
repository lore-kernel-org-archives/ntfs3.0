Received: from sonic311-30.consmr.mail.ir2.yahoo.com (sonic311-30.consmr.mail.ir2.yahoo.com [77.238.176.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BD12E70
	for <ntfs3@lists.linux.dev>; Mon, 15 Jan 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.it header.i=@yahoo.it header.b="GhyD23bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.it; s=s2048; t=1705317308; bh=LITDIu5rqF5VDM/Kx8mK6SOwsMlEd6v3fkzzC+3+a/Q=; h=Date:To:Cc:References:Subject:From:In-Reply-To:From:Subject:Reply-To; b=GhyD23bl4FpclRV0FXhCEcvei4wKLdrh6OTd/cnZB7OwB1yOG2cQrDoL+bb4c6BtHHs66Di577mTiSjswXPrncdBkF3/ZH/oMKHmNbGGRTqf4LsFmKSHi0iRAoTHjS84TaSfcVb4gZYDwG1eMMxSe5es2Kmv8+jfvkD2VdCfaSSrF1SwG2ENwlXsEZLpCTAAfciecAMANuE2CjT1U83w0rnx3pK6ZWLOPk0587+XHV+V1/TsoEOwd1BRSo5Gz1NG2bXGtBH2+NXV06nrTl86wpZ1s2jRsMbK2JBLEUrMYgzSIPQYvgX3K9L6FgSPmgcreDlEjMAlsRAN84C/kqntKw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1705317308; bh=Yu/CpP60QOr5jPieMVHsPPOyPB5u6NRN6Tcp5g3X7dg=; h=X-Sonic-MF:Date:To:Subject:From:From:Subject; b=LL7tCxdp7tWTUC2+SCdp9u/yCPXXPM/xvj4T5fgMNYYN/0qaa3g4JyHEEBCUdKGCzSP5rw9PczaC+LeCPko/3t5mPoIPoS4PjcHBngENU8tUGwX2OA3WezvqqKhKkxkx0nJXQ0mTW1uBg+cDs4nZ0TXbICxRBwM411sF/oZ8FgV0E6yxxC0WZ0iawZBAe6BGC8W6VCsMzDKxsxn5DN/hzlFrcxXHW51eQrq1vbQtz/1DCMzkF88d1uZbfGyFklPB+IQxkq1H+eVUfdPQjCbZbbS5DrCwNI/FlGpth4k/HNXnZMkeGEYhUHLeqqOJWBXITHNQNIaxEATznKQbqz6JGQ==
X-YMail-OSG: Tt3xLMgVM1mL3cdAZ4VaaUMTwgaejt2sZF5TaaConUMoP_J4ccTswKCfalNKf9K
 tQ1t18aZ86jDkXGfIxXM_asqyTs4BbmkDz96x2paKLrbnIDorSttutdRBK55N5.y5OaczJxxQ7ip
 gj4r2yQZSQa2SqKySpglDXwz4Zy0KAZUTaMB_mrv_RuQ49Iw2uZewkottyooZtG.uGPB_4LXsxOc
 iOleXFCPao0gv6jbxH0mFKEPdUSkAAD9wnctL1JIRbSXIsz08_EAYnkpgZQDGya2rIP_u6LwGbc_
 BGkbKV3UnRAxWu3NE46qgeUFsPYPPEoDTFWHgzbEx4n5q726OcNn12ctV79veXA9AHgG52hJS7sb
 lbBpwrqxk4vPgnaEOGx9Yd9YcZifpnileakPrafa7VaghMIavVOXabGncPrqbJZrczfa18oQ2roU
 qa08Khq4jR9ZWJzGJVYwCud75UXZ7CvxGR6B2SsRI2cdt7wLnwY6G1Dn6AKOT1cA68IczRpnDhQg
 j3MCr8Ftj2raFuKWUWfWCas8yiCA4WVDaAT8pERirSjPTfL7c9wccCk8HpCxH1gZOV5AKvP1iJTN
 JX3EDUXt0LimIz1DBqfR.TkiA_5INQfE1rfDzfA7AWQ4TTjbH_muuc2yVCvHFC5HN9qtH6c7fsEj
 Xw1_LWn05qxukvMpukhDGl.nwOKoLF_TyPf7oeImztTIYit7ir2VObPHWsxI8OkhdMJc1DhylYfQ
 0ioXffg4Rggb_ItQgg4oV7gDs_DRHLHWq0Sa_l1gHINYhdtnX8l9Pjyv.mjraH3hysgLs1jle4Hf
 h_PHcGDG1MlU8M3AGinxL9v1pJXXMGNsNGfZsjZ3_hw0DhavnLSmR.oReO9_8ibk7mMlL3C2hNr9
 e8hlNmN9ze_ezjjVoihAVZF7VfFAasN2AY7JEKNqPeB03vC2WphLly1_ExThIeU_rtBZFEqwQzTj
 f.dLGq80GSudlWbfhpKpfPtFKJS1SrCxYNiVezPB9afbgGHiX.NjwzA6mFtMLz.X3z2jYA7qFaZt
 mWSXuuhpoyhcvnCfIr3Ui54CsuHqPKqNR42ah0Q399u.gXKDncp4Te92F_VSTIomPmwrI6NBZRnB
 tA8dpe67Mk2aLfnDWfwbGhZGFCsw8DxAJHW1bAltgTbOAu9NfWdVPS5S5Hu3F0_bw5eMqr5fqtk.
 E7HOGBm4pZtzYowgQKSNlk3JyGQCbR..xiYq38EuJNFRuG3tlOzQyVzsJruFZT7kAY4VyWjthva7
 g1iOboPLeV1ySUrk.ecgAgwMRiloNH1Ozlq6fcqRBjk3oT8Y.T7.KORzmbahieL4ZPGWmtJFIXju
 xahwe_i2ZQTtUFsMq.eejoEFAV3PHKHeimoWp3bU5JVDugeTDs_HDGWf5rXFmxMAHZH47hsldSBT
 Yvr5QJl3iMVpG0kXotyqXj0UrF2H0br1X.QMPCi7Xlt826BFkAJ9AOGDgl6kgcCMMi5X8ZCaUUfm
 tRV3tcDGuqj9XvI1QxLLDJLrze0GisMR0S2UelXStHZnsTZKRygze4sjRdRckGSwJ__8JqulaO0w
 73GnQLnus7zGvtsyKcEWa8DrKFe7wspJ_f89I.9mt4x9UiOemXOGcY1.8NB4dCKsQfhnhXqH3FWN
 .ZUipgEUTsblpXNzPBJ7rk0sJqiVWK6hW.WJktU9V091eKuE8HtBiT5EK7V2yMJTPytG.7MvsC.Y
 LoTrtbI9B0vw7kSbAer51RapuZo1o_87nGV6FebkEJRESGP.McH0CytGBJR8raSwuO1Dew7I6nd3
 aSk0Dki6NnlJWELb3WD4uyxaWB_ueZBI_DZZoU1E.ASnP4aKsQ2OazCMenKlr9vyrsGs6f09DpLc
 k5ck7SflOvlBLZjN_9Y.4Tv6uVBNJ8hX3Ij5u9NP8YFwbN4e8LXplH2_pOgA4Ckx5QIz0LeOSgf0
 dmoZFdhe4uqetDlftWYmWl_QqG9urZXwDELAk8Gcd2s4Y84gXR9hEcjc7GaZEHsRIr507CkO9d7l
 onOSPbWjhFaVFPTjMeSZy81v0Vu70yi9NHmWW_JInr2yArJN_QE3f1BtjiZ7SS9O2wtzdd2ghLew
 KDyKmlpShfpf.3u9shJvv5elRfwRgvLZoCp_YVPBTiDDmVCdpJVEOFD6ut65MZoSDzJ7.i5yOJS5
 CHC0_sG5dpfeiwqq1l.HCRecziYD39Z5cvIlBNBPqLD3ujHnDhIIBUCbr.NszBRor7kItNYjHP3I
 o0434pl_WnZciqKqMxWE_2NjMcimn6.zTcAifApiSpDZhkNi5i5wcFfJV.FTFMPpUiSQh
X-Sonic-MF: <giovannisantini93@yahoo.it>
X-Sonic-ID: 6806ea98-7245-41cf-86ce-1c32c091249f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ir2.yahoo.com with HTTP; Mon, 15 Jan 2024 11:15:08 +0000
Received: by hermes--production-ir2-7cc8d8ff75-p5cgp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5e1959a1b8c888bef18baf4346757261;
          Mon, 15 Jan 2024 11:15:05 +0000 (UTC)
Message-ID: <d95df4d2-3806-40ea-9ba9-bfe294e00bcf@yahoo.it>
Date: Mon, 15 Jan 2024 12:15:03 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: regressions@leemhuis.info
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
 regressions@lists.linux.dev
References: <138ed123-0f84-4d7a-8a17-67fe2418cf29@leemhuis.info>
Subject: Re: [regressions] ntfs3: empty file on update without forced cache
 drop
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
In-Reply-To: <138ed123-0f84-4d7a-8a17-67fe2418cf29@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.22010 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi everyone,

I am the person who opened the ticket on the Linux bug tracker.
Please let me know if I can provide any additional information so that 
the issue can be solved.

I hope that the issue can be fixed quickly :)

Bests,

-- 
Giovanni Santini

