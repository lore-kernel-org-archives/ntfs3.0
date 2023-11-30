Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93935FEE6
	for <ntfs3@lists.linux.dev>; Thu, 30 Nov 2023 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="psRzwNMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1701373634; x=1701978434; i=aros@gmx.com;
	bh=jZRqN8GT3GhjDkUhT7m70pEY6m9TBtRYyrltpRfQ2A8=;
	h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
	b=psRzwNMRpNCoHyOH3YV/tP4yJppNdymPUA6qOJA76Lhsz0PnR1Q57I6KwinVZ8FJ
	 V/EOYy34JAGKxca1DnKWXk2zfCxotFNQxH4HkQ3VClPDmAL/M1MkiAJh8yel6tizQ
	 40wqsnTViRIQHEu1dSxMys0SlTckM8veIwC2klZb1zy3JbPPSfmQjmxmmSnVv849R
	 6jjm+MStE196KYc7J3/3hXKG+MV3b053wAJIAQ434+hjERD0izsoBvqxA2uvqJCtD
	 xll5T9WNBRnvUJ+wXO2kGt0ypwgoEAVjxdGm0qBkX06ukEyEbE3GIRgdMneKJuFrE
	 2VzLhA0GdKieBYPDoA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.206.132] ([46.221.53.76]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MirjY-1rnMUH3oG4-00exTM; Thu, 30
 Nov 2023 20:47:14 +0100
Message-ID: <e047e44f-3d42-4410-a7bc-9bea450c4122@gmx.com>
Date: Thu, 30 Nov 2023 19:47:12 +0000
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
X-Provags-ID: V03:K1:3eODrxM0hbJNqyBGHDm+C5q7o5pPekiug/jgd1o7zGNFwW8JYsJ
 nJMIv06ytBUVetHvHVQ36ZGsjMTtIw8iob4mXxbshfkGcTsAUUhtORHrKXwiMW3fXxI/8uY
 +rRI2yXV4njQfYHq/IYg/FkRCEf/cKxFMDwm6yc3y7L9kIseAn7MhWo5/+elRbmtOsxe6QE
 D5mAUMtTdFfwgYZIMJmoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HReoU5IkEhY=;Y924OZpE3fL1Uxfu0h9q4XqapKx
 VFdBulKd0X8Rc9cUl/TWDajX50yXJ8BodO+vtayEcoqcBRuViDiJJ28Z+/KNeqGzmk/BC+1RE
 0OLx9LYjURkLKZ/Cw8LocOUZMJErEU6MgpNufvTt4S99hnx+nDiAF33ZWZQFR9ovQqOb2eH0N
 9t2FcQxcNO/UZkPWICrbFwhq5PtCauuH0kRe11ECkY7dHJmeQkyDeoeYZU55RlFkR3kDukxVx
 mfY9bxUZpkW4PnMWujmhPIPscRdr+z3NHZtnCpkwhDgccv03EQYzp89YglBQu0NfzvSgtA1Js
 8yLh/D7u3CuBCNBAVaEeOkudqoMdBlqwY9+pohrPVypELjkUqnFjN3bko9cCb2AE0ntd2i9OL
 6q/WbU08UaBcbt0d6LN9GrjEBRL4nLxxYVk2fTvwYHuHuIDlkvuWkZo9VFlitvgRbP2q1rYWS
 L9M9KK2yxYmyMIedewAcC25FPS1dn++Tyqfx8B6o4GCn0xK0ovfYN0E3oj5OYXM3J1qe+N+jh
 6Dk9Y6tHrdbfocuRZlLH4nuSTBpalsAmKcPoUfKPqA7AzhRqyj3jOQb/xEm7DAmR2TVsgbRVB
 U93XJMgZ86bDwMAN3ScYqydAcdzN+NMISdAOrLDcUO0m5Jacgxq9RJfikFjOVlw4EJBiXO1Eo
 ldxMlE03PfYeKrif322JtBgD1GR4Kv24e1D6Vm+6C9k3+POuLssP4aj1Rc1TRes5buPs6PANx
 ZoinX4ahbnuivbiszCxOx3yNCX92A0gcA3D1l2UMAPph4eeUawnv+JODsqZ9rDIOB5UMvfsp9
 r7j7bl0ZdlCW/R4T8FpRhuJ/gG2g+a9kb/ABIakvpxz5JibtiL6GE5T64bDeP/PmpOkGWoXsH
 oajt6GUU9phtZK0ahXaU0pBha97A5oslJN4ZLDmDSkZfztZFA7DnApb/uj8OP0OrkvNJJD/VS
 9CCT9g==

Hello,

I'm curious why ntfs3 writes 67,117,056 (64MB + 8KB) bytes to a
partition when you just mount it in RW mode without doing anything else.
This looks quite excessive.

This is happening in Linux 6.6.2 as well.

Best regards,
Artem
