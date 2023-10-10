Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3592031A
	for <ntfs3@lists.linux.dev>; Tue, 10 Oct 2023 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="gLbcsKL7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com; s=s31663417;
 t=1696942277; x=1697547077; i=aros@gmx.com;
 bh=hZvGwbKeYw0yTbyMrftFKu+hWXJRbeEoFpRNnspoRN4=;
 h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
 b=gLbcsKL7tIMdtcbnuXdnIaU/y7ellNLnVcuMNQO+UMRM71GMu0ATNkNx8pSJZjGPs8/kjJvUcJW
 Ut+/NJUNCGpFvYTc5rjHZE/Zw4q1XkJEEFaJcgPwYU2X78R1CPpoVlzVmRSlSYY5NLvD5OE5fhyFu
 dlZ9r0HpLeC7kvh3jhYEmb1DKHVQ0pDVjNAojJ1AfH99VuI/nhtJ2QZBp6++0paPJIH5Z4T1fLQVG
 LzuSzPFFPNfdwhjyZrDPI9cqVyQbPTR9iIjbsXC8S6rgxs/5/cUK4TySA+x1tkVTkIh9nguwVpUnT
 EpnUWoKWUdzbftW5LmV22A4tOVWu4gc5HBKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.34.110.43] ([98.159.234.35]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MLzBp-1r7S4b3PnN-00Hyyl; Tue, 10
 Oct 2023 14:51:17 +0200
Message-ID: <6fd6a11e-4205-4ec7-8c1f-19e666f7fef9@gmx.com>
Date: Tue, 10 Oct 2023 12:51:16 +0000
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: 64MB written when mounting in RW mode
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VNQc0g93mggSzbLTSbcUu/gbFHwUZn7Pi7+oZNIfmKIw70pxQn7
 3WJkkFuUVTX/J0PybUcsPXUch3BBOjXfvjlruLaXjLz3H5O+oX+qggQypGLWv/73H+Xg2gW
 6m9Hj8AE7vUBxP6rmm/rJ2jmyOgCdcuIBi8MyMtyeemkLQ8uIft0GWxadUTBzr2ozh696iN
 55OLHAhA5Zrqo4O8XsBfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/xZiohQfWAs=;AWF2BnWRpsrO+ZJicOduqcwTHY3
 4vHcEPy3sVOhJFYekcZoCY3MCGPe59T/jQe1IPLYXgxY6D7JkZj0EoQR41qtTuifTVpleKSao
 4SARn1mYh6lNvdjeQ3GcQXLHSHqKc701FncvSQYAVH6GVpfbbxNX8m3QP+IW954hM8358fhdm
 l7gQNrs6CcMm5VZt0B9+4kEsdwy+8QAMxA3Si7c0xU+703mAmMnYPbinK/i3moIrp1dOSFNcj
 OFp4mDSV2r1OQANiFjMagPGi/NhrXTJ8pZkeKaXZwrmBBoSbSl+vZPeRisnXmWUBULeFHCNrw
 Gt6WsmPAq4jcZLIPHOLtJLvi+ToULZpluI2KYsFwMjzoEdfO19reF7B5CKcOitacgLQoJ1h42
 X8XzPu+CG9LLwMR+AgSYZL5R8m9GHYjbSOHWhaxy50l2/S6YZqP6ld++3mzeWYMt+R9MXt11Y
 2y3MHtP979U83fbVoKJMZqA8Qml7HZW4qcgSTB5ukolki0kstM0TxgY48BhxdtH7F21zduFnE
 FoCOGXtJoaHdkgIQVH1dHm8riQTdrvO/yEDFc2Lwu4wqaKvhENZpkP6IN+iSGbo0NtQdNm2IF
 T7J8brMXPTpU9uii9KPf0vHHzzcGCHs/zZqR1d369+yamqHP8RdPzpYPyVUK/etBYwf5BGvg9
 5hBjsiSz+x5t/mokNhaDuv5/Ui/733VlOsKODEASBKTJje4knMEuxXijhmgTg4F9yHj1YrXjp
 usSv5zTRFJano8wZlYN+239a0b8DQjHZVvdu8sPHZwWgSh6WRHwJmB/XEw4VfrfgNA+lxIjit
 GaRWI7+/TtdFhrEo41y5Y9brPYzp3KkG65+eZ7xnoig2iqNulAZ1VHpcm6i6HeepsBc2z1vH9
 B6InB7ezVKR+uUOSVtQjt2CbFE4VfZ0QwEzYb+++jd+LDUCdDm8MQoF0wS1W4hJNNYDY71ZBx
 qlIpkclEuBRkTPg2asFuw5rCU4Ntmg6fXwL2pBJVlFZA3+k+

Hello,

I'm curious why ntfs3 writes 67,117,056 (64MB + 8KB) bytes to a
partition when you just mount it in RW mode without doing anything else.
This looks quite excessive.

Best regards,
Artem
