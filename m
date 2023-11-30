Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ADF5FF1B
	for <ntfs3@lists.linux.dev>; Thu, 30 Nov 2023 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="s+JqPloA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1701373852; x=1701978652; i=aros@gmx.com;
	bh=CQ2Zi+SdqnzsK3l2b66evdZH+fbPbC6x+2cjdppNYCg=;
	h=X-UI-Sender-Class:Date:From:Subject:To:Cc;
	b=s+JqPloAUhk+lJ2ko5xE84YktjZcdStZ2GXQI2HjPpTPT4Cyk/1KkwVeefVrdVMw
	 mKyMEvWDFkesdo4GhXNiljpBjq0iLXCRv2+YPnZyaM6nfgNIEkB7ww6VbqEH5O31V
	 etpuXZLF+3iNA9GLOLF+ZPzYZAWrBMVCohXwojpoS/TtracFK+9eQBwaTGf0TvlZ6
	 UQJItNP3m1sfdGX01qWIK6gAw6Qrs+w+7jzbT0VIA0VhaidAzpX0pjDK2O4bD0ZO1
	 P+JQUN/RD83WcUDFBLgO+R0hrPZk5ShvAgp7VThZjlPHPd+fQe/Suq67FiJfv6D/M
	 pcw1/zi7oAHJMZeErg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.206.132] ([46.221.53.76]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MvsJ5-1rS6GJ0rKR-00ste8; Thu, 30
 Nov 2023 20:50:52 +0100
Message-ID: <62234299-66ad-4786-b9b2-677a80fbf057@gmx.com>
Date: Thu, 30 Nov 2023 19:50:51 +0000
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
X-Provags-ID: V03:K1:Endjnek2VjlUBelB3bBzn7VMfgWqGHy5FbtIF30qBgOpAo7fZOd
 Js6RFUP/atCXQsBOXFMa0gs0dvw04Zs4Q7PSBXptU4oINdbJrdY1yKVlA1rpJbDcEGB77CB
 oLUsMFlbTk5B7mHL0nHufARKQ/exZO7EEA9f2ugdCdmqJSaft0LyVVYbReMeb5enA2FxOvC
 v4mBtz26xezpWLrGVgxsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HPrArfoE3Ls=;/bP2DJnTWl0JtoTL9IeQgrtqTz/
 Tga25DdS0WplPTtFbq/UQ5BFNHUzvv3iz8C1Voox32jSdvIqa0S/mnvyrGDb/3UHzuMfFyHsu
 4JY+Pb/YAF3dB1CC7boZD1gi0mMA/t3rBXF7ATMmjEni4Q5GfRxDO/ttoht+zm4nNGhVEUzy8
 1PVU9IX8OQdEghd3d6PQuTMpT5dXJ2YUZBG8nnlbho5JsQ4KiP2cIJkuhEim+7rlw0Ty5kSIb
 +k59UsbjxdO26UZqrMF+2QqwZV0MyYsCca9Ap1wIGj1AjJcBN35Q3BvwGTpzjywBd9cf3StN/
 p5x8QUY1Fs66OFrFr3FfzEzEViCLej4uffz3+gqcmXyYgKt/j6FA3yI8v9dpturFkCi/eKVZP
 Hy/NGEDahYoqYy4mzXbj1RTJq9frpJw3ErFFkxmW2j1ShiyWzWwyPmFgZgreGG+OQNHzMhvX/
 Rk05fTncCdYNZx9Ez66sejM9/DdO6RSuUuS9mjkaXr4A5e8G/sMbo+WBcS1af2H8aYaQty/ki
 RydNyIh0Fcmx+qpllFoqJHloZQzprao1rv4z+oRmxV6tNv/7oY7kA5Cpo53ONSL7DIR84HFT8
 uL/OPelhkoQ6hV84XGwz+UoYt04Vcm0DINrkMmmho/lQeidlrtzrSdr01q2NaHTmLkvtnTUqG
 y1n9HVyZR6uq5KMOAbdNaAm9ACdzsOFM2TGiyoDfaMEzDeyU8WNPF1RJe3Y/l1awY8DbO6jZX
 H8PTTkxzvMyjwQ3AkcEtPxeUToXhFRC58z/35VFntu9uAq3OqRjn1rIdAhsJ2kwTW/WbbhbPY
 yVE6kraWh/A+Ff6dRj4UWuka5SPMWDcpX1fwq9HzsomrZaXcxUNMx+riKml082FTQrtl6/3R+
 LNbDOVFvpSLqdzua2T3Micg76XPykBsitWLcp6d3c25/46/1MkF1JV2tZrtgFE7J0R5xTGOiP
 3KyR2A==

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
