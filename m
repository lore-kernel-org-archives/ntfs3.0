Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059751A729
	for <ntfs3@lists.linux.dev>; Wed,  6 Dec 2023 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="RR/A4GcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1701854396; x=1702459196; i=aros@gmx.com;
	bh=jZRqN8GT3GhjDkUhT7m70pEY6m9TBtRYyrltpRfQ2A8=;
	h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
	b=RR/A4GcDLXSMMBLpj94A4gA39846j81Vp03GCuBAGhoXRrPNiArKNvHT1WblnCYI
	 ACXt5TTZmPJeUkogMVSEyEVGxV9AXFQLLP9HyjFH/djGdoSwJCuAbv1tE2keft3Ck
	 DtyiFjxi/QLoJ+FYq+UiViHH9QKW1c3t0e7aI+A4YqVcL/rz3zbVlQE3ZF64IsLBI
	 8rWh8OcLDc8aHeFlIVUx4m0bVtwqEOFJEXv8HxFOUfArLm2jP4g3gEoNRyqGaQTHh
	 YrYhkiT5Dliku958eicWwWrTRnJpfRubk7bNHNzbaDUOzEch7vUGSEwALPMMM7B4Q
	 Q9zTM/LgXEuXxuDIoQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.114.132] ([156.200.109.154]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MlNtF-1res1B16VR-00lm5G; Wed, 06
 Dec 2023 10:19:56 +0100
Message-ID: <8a3fa9a5-c055-48a3-a6e9-c3a2f420d80c@gmx.com>
Date: Wed, 6 Dec 2023 09:19:55 +0000
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
X-Provags-ID: V03:K1:nX/deI2u0T48cmjwlqJ0xdMr79pUsVNq1TQDV5CbjLrOiLwv1Ju
 0I33iu8AQjfS17wHWWEFvXnimaXqI4Fhq+jgC156ANcAcmDW6Hc2p5aorduwpucES4J1bT2
 lWV1Hg6cMfji0y94M2IAbChXMqKP06gJ/9yGbFZQOCteALnSBJUqwSaEZ5mN/CO+vcbEzCQ
 0ie5y0r1Mo4kLXJXdJpeg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iBn/sU90aBI=;Xh0k8KWUODJR+Tjnz+xtIt0SUJ/
 qNGv+uv2ZP+JY0qfhtYvi1WkGKTb/H4i4PXneopA8S2E8E+tpNJECcPLx5JYQpGg+KcTxI7ck
 8Za8RCG1wb9XUoBkETtArQqceVShB/XJFAXwBUhwa5KmiBbQdvDxwNc32P1NguSI/NjofhFj6
 Gi3br2klOx5td2XNPBA/dyMCJvbrGq/xx68UdWcv8JmADUGQvNCJqfCnpuldYGmCaG4p6Y5ap
 477M8gHrYhTKRfInTd0/5FAbJlI8Qlrn2szaVb18/scd1eTIDpheZqk6kxJNddFBRm+Qx8ltp
 6b+e0qeeTaMv+enqi3gEYCLH7Z5PbK5IfzK3NH5xyJmAXdw5NboNUxsj2Bz7fCYmqXeuNMYZT
 Fe5urJWbE/3Mw4hmsDCxy155+D8ncE9raWo2VI9Jk9dyi1CrDK2ve/VWGevQd0noX2x10G8Sy
 wwuh8TssFqdODp/fS8EMGNIVVk8dIhPppbl0737KuFnwS5ZEYDaQ2yGOT9QumLCEaq37IzqsZ
 MT6LjbQY3qcm0FBtlT1BsI3w2+FOkoVtnYeeVhXwg3Py/SCMl7NmSAsYgMEFeqUBE/AZffCw6
 kkMDJq17xLlI+PsQxM2ehn90gN+HpZGG7Sye5r1FoxHG9RdYzfP+f+wcReaDl5334SLo7N5Tq
 mgubkcyWbmERqAbJ9v1fP83gwhTwHvleAsyambsU0h/+oMq6Bv5YxmzxoRff3v8bldPRenDPd
 pufJixihVMuddEhAvvLxIeJMNPPCOQUVsow0Rlo2xziVqMEOvxL1l1XXoImYX5YJfPK6w5vll
 NIuFmGAoMQa/4qh1Uc6cDeMWbqdkTxoDol0v2QxxUgMk9BVqYoIRkve1pgTm7Q2lAdYpPKU1U
 I45Ei8r1l29n0wDyxnVvU5azTqwF+VQVagvJ9QwaFDUmvUA5UJSgl7IxJRt0ARnjH0CufTyv9
 E0bn3WmPu2rVRA2978raoqrzsyg=

Hello,

I'm curious why ntfs3 writes 67,117,056 (64MB + 8KB) bytes to a
partition when you just mount it in RW mode without doing anything else.
This looks quite excessive.

This is happening in Linux 6.6.2 as well.

Best regards,
Artem
