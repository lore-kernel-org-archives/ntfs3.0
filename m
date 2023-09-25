Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3643610786
	for <ntfs3@lists.linux.dev>; Mon, 25 Sep 2023 23:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com; s=s31663417;
 t=1695685477; x=1696290277; i=aros@gmx.com;
 bh=hZvGwbKeYw0yTbyMrftFKu+hWXJRbeEoFpRNnspoRN4=;
 h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
 b=GjjffkcXPICuESHGYKyyslJwATH9rSJ8LSig5o6NOqGBWixdEmyUyr85G3Z3k0mXceYiHmH5Mcs
 j+Yiknxgu02D1FGwUp5Yq6TdOLI5u2jNi1a06ZaILI9NORcFVZ3acspdOirWA2/RWnb4v3x5PnAu+
 Utq/QBzOts4Vs28RRp4O8L94ra3RlMOYI3Q77Z/Ky6uHxjfKrTkxc+aEyBS5pvYbTiMN7VUGIbwy1
 rwJdhsOC9tlVmJMHDrDPAwqmZWDuyVuqRB7NffRuAdz5d1rkq2HNl70PILKOnJ6lYqwCjTIiP7F8C
 GV1EbY+bQ64AnSOyiymppf+wnusx+Ela9uKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.28.110.11] ([98.159.234.111]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MVvLB-1rCnlA1J0X-00RnTy; Tue, 26
 Sep 2023 01:44:37 +0200
Message-ID: <64ad5f88-7ddb-4918-a43c-c459f213e5de@gmx.com>
Date: Mon, 25 Sep 2023 23:44:35 +0000
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: 64MB bytes written when mounting in RW mode
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dRDZ9tyN4+htaSOhL3c2zGLvKwOif099y9HExLNsoQoTH5cUxlt
 Q5vbQsU/xtkNVyLZTVV60bIbBbwzz5oS/uUf3Fu6u6xPe3RZv5/UuXVQmPRrOz+cwjJvcLO
 Mmxs8oDbwJgQwUxI7HhBDaOFKx96kV0Gt0s4doSXjJYvBIRZW0VDG8kP90b0M8MhsMpRNc3
 Nol/vykGas3o+rkE85pYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K8fKImsHHTU=;x9seWDf6eVyW38vD7xMRCbxSrH7
 zfATYavLljSVfQTNPbzmUHhvpMxPh/WKl31KwMyOaojhcZL17ae0MFwsqlsGVFxJ2RQoZg5D+
 S9Rbn6SjeMXn4q4+CSWn6ZC7AlGEdJ/Gf4eBNwYbD73Vlwam2NcGw0IKW54rDGrYtkb9uOcwN
 Smg/WHIaGcdd895CLVu61dbLCQEVD2KwZBpFPQEjKRBltxd1tD6aChT5vDDYnbtUioLi6SXXA
 miJD2i2SqDTGQhzSKEZep6poqDCA42p5inPiePfduXWLK7oHq7pb8oErfvFsamisIRRcQc4dh
 h51gWIBKhMQUmTR+TSkgNhz/DD3RrZIj/qrRAC2JADV/R8/T3SypsJC+m7MEUFXUAVa11LHNh
 7B0qqr7441Eb6Am/9A/X278dMUCAKh9ROOrgZ+nEKyarcBzvoGDfnqBv7G1ytNXIpghs4wXkn
 6tt2IVxHbvfdryMbUdxOR4t2qPuSxByeTSApmkTu3zgwqwepYKQvwpAt7HGmiQZoDbERA05mN
 pdv3wpx3XNUuM7vcfriipWjuIRRIIAuMQrp/YhD194yz3lX3fl9FCDCmE+bx/RM8q5IcXVseo
 KU0Kap86k8sOHWyfuE05WLUVX8kaQAKnZ1eYFKpeHCpDzqT4JgcuTs7byS0mQH0fVf0mh/McC
 g3K6ls2WErD+BQCBY8q3rYFwsrVMbEUca8um6nutm1O+eKq8/VnBUvKs1P0V/7O9GMJL/3ZXR
 Yctmy79J+aZejC96bvPaYhLAcQ9dgSv+MAC/FPLGW8QN/vYjyQzPTAT5590a2fiXyBdQ181yk
 Twp5CEKmGq7jeVwtvWgNekFbZ09zgqV7WyWZWH6NR1FIti/kEnfTJeSkmyNFLPkpaPyRgqv4l
 oeusAAJZWu21JxtG1xUBERPJofRYe9QA6gmO3eiZWnRS9nxd6FKf/di1jWpwME6lLlk2mjQ9q
 db9yMT3eb8NRoHcCIO5pBCr8AxY=

Hello,

I'm curious why ntfs3 writes 67,117,056 (64MB + 8KB) bytes to a
partition when you just mount it in RW mode without doing anything else.
This looks quite excessive.

Best regards,
Artem
