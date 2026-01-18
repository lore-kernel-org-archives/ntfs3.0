Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C118933122C
	for <ntfs3@lists.linux.dev>; Sun, 18 Jan 2026 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768742656; cv=none; b=NBLPqaH7G2Cr9XHcAJP0dtvmyz/sp5u/SPpaDpzOAY2bgKvl+bb74e/zKvJtXieM1nltnuq8QD3RD5c7WsBPexTbAj46/C4ItV2MHPnto6lm4Jkeo6o9jNGdY/KTTwKwZiKy/LEjDiSujwKRChEEpx4cBWf9P5JIAnpoUNVnFsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768742656; c=relaxed/simple;
	bh=p8Ixvo7tSq01MCQW7dxZZewDF5EbGYRk6oOJHXPlEbs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iCHf8QRa6/3ufw3HNAymb1DS3pSkY/6xK7G0zoMYka8RyR1KrQEeOlVeflMg4CbtuxIYOWxIcWwb/1/hPmf7bpg+afZE9Ikuf8RmrXavnKFyFz6C5TIzB95rI4R4c3/cd6bOzJoMdV8naMHxlQW29pMHlz3QfJrs1Jpux3ytV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tfNsSQ6J; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tfNsSQ6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768742641; x=1769347441; i=markus.elfring@web.de;
	bh=p8Ixvo7tSq01MCQW7dxZZewDF5EbGYRk6oOJHXPlEbs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tfNsSQ6JU5esTRlzTwn7vUgaHHcJavZv1oZMXWLfF3U+YZWDBeylsEHIy4J7rNlR
	 TtZuGLcWqNzdp6Jisk9Ums+GyFmhJAfepwdYdfBIGBq2PV4SW7QMjcEk6ivTUBVid
	 b3RBcMLeSTmTKPF5EIbyJCKOj6Iu3Vj9as+DuSVRCIRc9vNI32Ud/wxSMWmNrNVtd
	 3FavAFDIlmxiElcadQLT0TBKQlCSRgR06PDfVSsekMfWj80BoiO+plE+79fUyo97L
	 PUU16M5G5WUYedGtLZaxbrsYfiIr4cdueRir2gfSZYTLRO5FkS6nwBAwahK3z6xWA
	 io1TsU2AwwF62hdzDQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.1]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Md6xz-1wHLXe2jBr-00hMfM; Sun, 18
 Jan 2026 14:24:01 +0100
Message-ID: <65bf90b1-8806-4f8c-b7e7-d90193d28e88@web.de>
Date: Sun, 18 Jan 2026 14:24:00 +0100
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
References: <20260117184859.37979-1-jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] fs/ntfs3: Fix infinite loop in hdr_find_split due to
 zero-sized entry
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260117184859.37979-1-jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N8XiYo/e8rYwu8ShHWy1PuZmsuMDKMjOymzjo0YYQYky/P79n7E
 BnUTTT0MdOWouPYA8eDkSh8OxBlhwevi8AZvLJEBqkzaHIY2TCCuZ6nkh3w9BYUsannTare
 3T7Q+xWbxb2Cl7bXNCyAE55NwMLaye46ZXn7PXVn1OI67MUj2YZZDkP4gdSuxnGrLn5Ge7i
 mxVUlNXgrUm0qskWfR3cw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y49BozI36tA=;/JZV7EN6/i/wA+Sqa2DXxg5m7gh
 RASi87i4eakADmZ0N+zRagYK3uNrfZwW8BAIe5W4iDpBJRb19FbxLxJ72MRS9+rkssLD3tLWb
 RZ4ed76McCU+xOknSkWvAbDy1yPayrkL/LxQTBC+uQlpV+vDqC26ko+ciDxG9U0D9iU2QKQ3z
 7y2gdhFLjxw91vl6QQEnUWq/SZfQnrqlSbU/sXQE4JxmLW8VI40L7llGZBHFy7DokohtCQi/6
 maChjV5SQeyEbVUSlmwvx1f+SaFHu0Ua9Z7SjzBiWzz5PhuHznhzuvaHWARM9GSs3TgMoXNWo
 Ba7v6/F2c8T9P/7nIMscbmJrwI7u/4dMbSdoDAKxpoSXnfzBi154X1wc6AjE2IWdTd9lnmV36
 VWPPR/O+HAbPGqumvie7rI1OfW4l+5qUh7dEb1rRwRhDH73Fdd1YS5iaonvnlrNAuzj5oVoaH
 E0yVoLuPm4UhA14TkrvkEPFm1BHlYVTwlZJ9Sa47X9LcCXLoJqf6A+MWU7V1C8MEzwwqERaVP
 sMGG4NORG4uKge7LeZY2oPOuefZqap1Q9g54aPCCe1jiSa00MoQXo2LM6FNEI3LjruR2TYgHf
 BwRyYSSvFXmx86NJ47AD/4SOWUactbeUL18bLdnLaREcWPZ7DNJ8x2Dgha8qfyGDgbFRhZkTC
 lYKW/bkOrRKFXyJPpPL5nFPoE/UERQo8T6QI+A8ybGga+ejgBwC1adonYunc7+yvzHY37gdnf
 VbaS2zkwQGd/iaqLIDyXc26ieSnFVwT2z3Emhrfkas9VZCbYU3Gy6BLOUYx/cvHdHBxuRcyQc
 Y7KPF+Anp/H+PCRVOTgGrH7G+KuRZgpos4SedUXbDNGK89RQ7hG85OO1+M8wxk1W9BqUGIIdA
 QKXINodRZyYX4HfCKmk0XU3ctA+LaJav+eAyGsrtpljPeUzU8Gqr1WsSLL2P/02TZ8M8ZJWY+
 xAbtr2/WfnTBMOtDyG8g8H3HD7McaNJZ8+MtE4wqRgGElU24QD9MDgISq5b1jtJGlZnaYQTVX
 RNkY6jovVIRrJdZ5W+tHq6RT15XNvbTa4QD4AwT+r7lDoxUkvKk+5xGZZx0D4w0QIhLROX45u
 evR39zBoHNE7gkOxflGRo0wW9NacQGl6MfM+9aSU5By7xVkPce+lJOZFflGi7Hloz88rNEA9L
 N4LvbXClMxwjJv8aFz8tkJ6wGq5QZavdv8dyemkpPsRfmYfCuBIFvc+K6z9jlOW+fPfUxLQPh
 KGUQjWFRsqO20u7qqV22bnerGXytmyLp2HYR2cm8V4FsYVLmmalpLhj5yme2qQbHkfs/mAnxQ
 Z6Jo2GucOODm0MnOoqWNpAl5mLus1/8Un0eC3ZCJchpQJbqPSsUOeJTbHtRrJiSDLi01OXrzg
 G1/pTl9lK8L5d+EuelYIRCaagbHmh7Gs4jBTOqm3IExqAJsERbXapeJD/yu93XNb6s5pW/oQZ
 fE1cB9vHqi9EydswSLDa49eSQlGb80VfQRuXrldsbunF3Ca/88gitoCb5Qez3v8HGukN3O6SP
 li3P8Jc+0xlJcmSdBtTK9NE72Yl0pcHffq6PDWTJtZI7YY8Kwhq70z9rC4Dj+DQMqw1J4oISV
 ArnzAyct3KIQpHn56p9lJwQ2t6bV/IBMKOdCkOWu5Pzvwhq2jsqxzEN9/9tVV2zq6e4g4n3Uf
 nx+dwR+q9DKA9YORxDDnJbf8HWXyA2bO5Pt3VKcI/k+lxLHCa2xhj6GUbh4O4rFTKoZNUUE3J
 3qqwG30b1OmDlJvKanvdZmv3vHIkSiWBSIzOawNaRy7wO6Iqm0VCsm7wahh29b9nv4dWu7xgL
 rOGj5xS5+kzhjPLIeZMUVULUTD7A9R/6xBnehkVumAP4qtlZIVsTG4UJfRkf3W2WPvi9ENWk+
 OFItJWylK5zGtWNnl6d3mHoAc7dmEDrS9j37L+6sx4yacs9QUg1RMTwZNbiqJAnbK6xMBg1Di
 k3p2RyTIBkouP+zu/zmHDSehdVqFNckMq7Wa0npiLuhZimCU+kNkeZeLD7jjoizcDMjV9eyMy
 9uB9SeTZYCKpgmTQyljr54grNUqowXbeR8/KkPESOhiN7RCY38bf8e+SaJgDwbUOhrRbwJ7C4
 ln2pZM2wRdcfawc449137c+abLyQVVf+2GU0Rss2r3sgg5rs5iV5y5LBj+dVIfhOLtlM3/c8Q
 fyOVvoFX59bSby/3eT/q8Ndsu1JcK0d75siakVStxO8WSwhp9Q81l/ABC1aYcPoqF4h2ibS6j
 +I15zgJhxtHx6TNK7KCL/NkoetHCtLvM5nEg+52BmagH2t3xJJpxAARgngmTASuSkirKDr5sX
 nCEU6uHPT7ZBuJCLdihsGs5Nkv6tayQ79JtI2AxMWaWkjG+DU2pBEJWUbIY7N39ghddeXU0Iq
 GSFmpj6ESECQ7Mq2vefX/emluklpNxMMX7pBYrkzPl3+ACnB+txSiFqIq37E3JvQ68ZEDQeCJ
 3qJKBVo/mhCUI0+yw1fy/N1/8VmUXtfqjOV5hkhL/gL6yb/HijWXtPeTZipy8lM83MXEdhzKr
 VW/bktWxMXggDAOfdyEbfx+e4uc9+L2n3n7PlNL+XMJstsToQtJ5toN2/w31epi8V9AciPQfY
 tL0ABigNcyIqfEM0fyioOClDDo86FfbXz3RiaBOuMsEMUVKcPT3bHhZJ0/bII+RPSh/ESrBrG
 dZ0O53ADRjM3N2CBZqisV1YCYgKd79//ODdJXr27bG59M/4dcDLuEooNnmjzZ4L37hp/Qww3W
 uqWHtTJyCzqYL5PmSlVRF6rf2L28lNV9c+hCB8MgHSw9LdYZk6ttg5wf+WxzPTb5UuWpimS8k
 HCpdV3WVSZv/IUrg4P96hmxY6/1KvVBEaePltqy8bYV2/70p0w6OD9RAdX1CGzaYDDORiZiMW
 QeYZcfmQhl0e5OB6VXwsMLt/+zZQdfe52AWShV37qz+HjaDWNj6F+1KbdAqTUi5STLOhB0r2T
 J+VJNk4HgWQcFeb3uumAlErHYuvlb9KW5/zXLZxMrAm8umzCbZLNoQrfGdp0r6VWIzYd0Ljuj
 l7She2Pegh0XwUt8mtQtaAcrUYsR+s+G3XmR2EJQkLWDI93smIL1Cj3VMu9/D32PbT9W6Oiqj
 wtreie105SS1f3yM3Qe13wAzP8qaPRxq9SN2UoPESNMcgEZ7HnfNNUATVAPA/E8BEQdSU/8q/
 b3mL4QbGX9jydJERft72Y515nvw5I9bVwUp7ujMJaaAz/Z7+Gi9OtDx89eMY3MMBR/D7vAvTl
 C3shdE6c7dg8f6Qr/S671Dco4Fc0T+UAzE82BylEfUxlQSzimaCIXDtUQRC1v9nPRMcuOxbTG
 +ivBsPPjTGtDG7tYhSe37XenzHGYLvwpaS2AyYirWTbS3z47FxMYiZAM38vhxpLLajjduNw1R
 CLk7f+9VHBfFKgYtH+Tp0IGygwi8nzLL10QDaECOH0Ip6bo8nqZzkVqxiVbTTph7z0aTNPk03
 YW308Wfu5m31FugdKF0oYCXPJkFEyyiVjdyl9sbEr7Cvuc7ocaVsFJa6DI/oWXzYxTyMr5Un0
 29S1xmECsyNTM+/Owy0PwJCXO1ktOzOkpVO3iL/XPjvYnR6Byx4/6Wj/1ABM4bqjQjCDv42hb
 +Iek2ILN0rFaKCISMaKqjB4VYdVZorqFj6vQCwTQWmCMz7BnJwI9Alg2N5q4JTqe1c94iHYy/
 xqSEDOlT60R+dZRAeQ2CF4MuRhBkJkAr/dkdGAZ/W9O02Vz1WfDeI4neDvDqeAaWvCgu44GfM
 PeNufbwdujlXLWbI+hWX5YwwBsh9y13HDNJPMo6ly1l301eOS6p+gDFDTjQOyyaMIzUvM0OBt
 6BsDRNHrQrWaNdkn9G0gSFilW/4JrODEhJ0LGk40DbkrBhiGObcCBFCjBZKNEbGGVo6JIZ3WY
 A3bGpoEblzLiixqbq0k4Za0HON2GfxcnGEkRvWmbuIwpdTX4NQZACoqTdyT84xLUt/JJO0b/p
 LHgfJwJd2CFiNG1ca1Q0WG5RzbQOue4MR3tFCQqmcTDGCLgf1bYdMJagjqM7l4Hd9WJI+/B0o
 9ez38XuINYwcP5TvOy0nW0SJDQBeCl494oGCZgM0NMi5l/mkfRPFaxACJeqqG+ql3+pmQWZyh
 MibcakbWmJ5u81dVdkxrsA0FLWDtNZ1YBpufrX53DfZZC7PvB7roYLPTZSX1uTvZ2Ak/9/B9x
 XJDkMWZetVXgS5Z3tOTlYFPriP7lXd9EeLV/vymcdGBCL77t6SQhyENwO2d22tvV71fRoihtv
 zuRxFDVyMnrB5rKwkWlzAZXCwoqj/qWO4N2wsG+oIxRBYXL75UpJznBLNAB4dqTwzVac2kEhM
 3b2ePdCPnUo7WgEpbhiL3PHWXBFBJKE/xvSnZVJFZn2QEIJpz3MSgdCM8LQFn7bzhXyhjz+qP
 pIKycgJXuTdKYdcjhmjjjpu3DUqgdL+GrrzJc3rtQtkkUtIuF4yJI35GF7V1he3XWmLnqjfnD
 76X6g4DkrfU8QcYt4vDLzZNxh0SULiwzQcdhps9hsnmBsHYN1+xSOiDEeEGLi2E6AQieQikfi
 99jkEosBGN4z7QeqOQUsNxvSo3oOIBc51RReRVnA8YX+uXZ9APeDb57Gw+R1mhB/kG0TFHbD2
 QhrqDD3+V3l3BTFeapmQa2pMsLm/zrztPpvJrQkaSYAt5dJIkEx2j0ntjmjtGDhn6pyX4EoE+
 mzxmRlCNXgoGz+XKQ9J1LRRIwSQQLjFiS5f754uDA5FdJODXSWkyqK2yuGIfOu2GLgccl2peI
 qo9G6/P6/bnGVgYvuF2CvlRAKn4Wrr3tPuumyttEw6YbGvwO2KsnAwvzKSZ6ryuACjDwKUzIU
 4YgHDch2hBjUu6JXa5uafOHS1Vx5P6+VS4SK7UTmM97ZHlf4Xp3c/92TfiTTYsCUkfXfS4HbO
 0jqUuwm4h044JNQf26C0c4m0U1FtwfEBKuVxrf41vphPnDn8qRphsY+UOp/8VVYk4pzKFkr4i
 Ejy2mo20j5xbMJ/zPaIZuFxm9DhUqxWyjYQ4PIW0OzGA0VQeWDZv1BMMzaSJcEiwEayQlm0Uv
 tIkTaF1oeqcNoEihNO1H/Rx1Q3+f3XgANdrM7LftNXMIoG5m2dSPm+xL8es46hXZnwvi1usUH
 0QqUCqXih5kfeOU2yf0h62yMl+RyrdnZEsot6f9XCj1r2JzD8dPnjSDFHws8or6qeE+qPf9uK
 UgeTl9AU5CA1m/TwsH+0BcLu+WZLv

=E2=80=A6
> This patch adds a sanity check =E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n94

Regards,
Markus
