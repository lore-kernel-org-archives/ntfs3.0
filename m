Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1201A720
	for <ntfs3@lists.linux.dev>; Wed,  6 Dec 2023 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="kV0ztMGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1701854386; x=1702459186; i=aros@gmx.com;
	bh=CQ2Zi+SdqnzsK3l2b66evdZH+fbPbC6x+2cjdppNYCg=;
	h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
	b=kV0ztMGrb7aNT4omOgR4YRKWnl3+T8buSk+UxsKIV0ukEBB26h8RZoCB/gjNPKYT
	 PihJad1x6HGBGdVI401fCplPGGSyL1pwCiy5jl0pJJnQLGE/gzQw5BPBHa1xPaXaT
	 6dMfZwSA6EAVnkg/gdJvsYGRC51Kd7MmNSnNkSnHtgzLgLB3dyw5KnsPAmjekFMbN
	 mNjccbnfTbIL0e9lAVUANysqp1rxkrqZikTD2pA0IMoIKDxCut5lrthfCV1+LUBmA
	 +7Bl1IEf213B/3wUiC+CF06/dcisAcaEujjfxY2E3B54nhUvPk8Xygj4kUYaymgGj
	 yCykjyAb0yUooApHLg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.114.132] ([156.200.109.154]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1ML9uU-1qtpRr3qZG-00IEiH; Wed, 06
 Dec 2023 10:19:46 +0100
Message-ID: <9b01a076-a0f9-4954-a28f-644a74730abd@gmx.com>
Date: Wed, 6 Dec 2023 09:19:45 +0000
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: du -hs doesn't work on directories with compressed files
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HlcUOtLgPXhxoatKtL5oy3yuY2LOYOe7Ftv5LOsCLAUaHD6Aw3y
 hNM/3ed3i9Oj0Vv/gY7x7XXmD6g5WjeeVJm07B1ux1sl1NI6jcxLENnjP/uWMV/FJzNzyZ1
 cLcZ5vvLtAgKEhng5M62ZWQsaN/OHUAAATW9MXjDBnMGh9iRgoFtLGL06t1bY7V2Gl5JRe9
 fhJQx62uXZ6hpv74pl8og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TP5F5hbSlTY=;m7PBCcdHsfWLrSnloV5+Onlzoxs
 y8h+iyGBEktUtB5WsquirysrtcS/HIriuobyIDTybjpIOTNtAMaVvBz1Kq+MiO9LNj3lAVjcS
 5A3ajdYj0SLn8szWXoG0GyknEYpFuioffkrZ/zdbKTj7dAYpi63EBVo0ZarUuF7urj34tQHbi
 cUpS0Q0NNXEIxASXS6E5lrff1L5Qvdwh4g14a2ZUFTSay9HdTV8+pQ1WvVWFM26clUSLiNwRX
 Xea8ia1A++GwZRVDTYYHyeuFYKgpOoj+Kw9xGDCSTahEipRydZ6qiBFgr3BMIo1AG6Jsfawrg
 5YwHuqTsEeDAsyFYGp2cEgABtUTy5s26wIw3aXsFCA2ZJNeATqsRp4mYWvzt4dptWGTHinmCM
 jITosF7dJhBnaxScddLStwSS9MmgrHYCPE99G/q21QGCqLj+qw3GYLIpDAKae+quNwVLX/NAy
 o7YLfudPA+r2dRJqnj6Zf0zR1T+zaDuGfGiT66ee3JkvF9uxul0rPhU2sUDIcluLlbX93monI
 ik+uzOXKT8afS2ReGTpVjDaqD4pkx145jzX1TWTS+bvMHvcVfDLvvvZ4HwwlbUoWqmjDaTn+b
 OqMBbA8p3F6aRDXO5L/mkpDUtp0fNo0SZw+vO6xbaC171CSpWmCRtacTzhhu1iWPNp+MzBVOm
 KjtdURRZ8b9OjQthNsPeb9uCvDQ5Q8CWfG9VitG5jGKP+CNypDZIUKRv+pHvtY+WUu7hAfXTq
 sLekDOUyiG5dGQxs47E79EyHPrPgO0U87GY/854mA/1muEaRxlDIE5Ff31PRuYNESvvySLnoW
 tEDKtL+6b2p5HsMbxAC7ykVmltUYRBRGkzScPQ7FH8sADgtL9A29bjd6qvsDXhv/mJTt8SLnM
 6IiEx45dluO8h+y7ch5A7/zCEVEMwEHf2I4EZGgxHatgnpqU8cUv+mpbQmbKF0Bdv27CKolKR
 6w7HYfkEUBe9wWDkBbWmavX8z2M=

Hello,

[birdie@hp baseq2]$ ls -la
total 8
dr-xr-xr-x. 1 root   root      4096 Nov 30 15:29 .
dr-xr-xr-x. 1 root   root      4096 Nov 30 16:51 ..
-rw-r--r--. 1 root   root   3282742 Mar  4  2003 maxpak.pak
-rw-r--r--. 1 root   root 183997730 Nov 30  1997 pak0.pak
-rw-r--r--. 1 root   root  12992754 Feb 12  1998 pak1.pak
-rw-r--r--. 1 root   root     45055 Oct  9  1998 pak2.pak
-rw-r--r--. 1 root   root     82848 Jun 17  1998 pak4.pak
-rw-r--r--. 1 root   root     50821 Oct 19  1999 pak5.pak
-rw-r--r--. 1 root   root  10321920 Jul 16  1998 pak6.pak
-rw-r--r--. 1 root   root   5996495 Dec 31  2000 pak7.pak
-rw-r--r--. 1 root   root   1456785 Jun  7  1998 pak8.pak
-rw-r--r--. 1 root   root   3259748 Jun  5  2001 pak9.pak

[birdie@hp baseq2]$ du -hs .
4.0K	.

Files are compressed using EXE:LZX.

Best regards,
Artem
