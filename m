Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2D32CA2
	for <ntfs3@lists.linux.dev>; Fri, 22 Oct 2021 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1634907005;
	bh=KS/9whcDPw1ndHBEsLlb8P6qp+yO/GIaFcaG2MusrkY=;
	h=X-UI-Sender-Class:Date:To:From:Subject:Cc;
	b=aFM/U80bGGdLwC/V1uT4FaDeycCndLSnnTBL5bPlX68Hbzc0QC8qjfdMyjkvqrhPD
	 bNla0j16dyoUjmHIu1tZptqEtiep4Rxa5j6dFDpW/Vt/SVxv51J5b0/GFvtYqNF2iS
	 vjlFQDtWKp5CTWAuumQRtUVMLN+wJlteF2xNERvI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.252] ([5.166.175.137]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N4QsY-1mn9PH2gsw-011Vp4; Fri, 22
 Oct 2021 14:50:05 +0200
Message-ID: <6391e3b4-40db-100e-dd48-e3eb42acf71d@gmx.com>
Date: Fri, 22 Oct 2021 12:50:04 +0000
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: ntfs3@lists.linux.dev
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: NTFS3: junctions are not properly resolved
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qUUch2k6zCNOsql04uys4a77O5++C6+1XNLE7ibdR3lHa4DzhRh
 HgLKZupBnLJWGAC6R1pbF3+lpMXtXKawy4oKsfsLPzXIz2Z6PcbupehxxcGanfOTzU0CSSj
 gRX+GdiARAmvt+fY7Nx4A704YFx8zFDMgCRtFqAnh2RKNRDyMrlqv3IQAEBWMpIwAVhBkyW
 OaMcvH80UFavrMuqzT14g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xfeko688nC4=:yNd3K6BTSto+YjqsRt3pJl
 ZCNJfGNzfbQgOsENJxq48BbI2HxFZVoKWTA51dE6TxQRydu0e0JxdVJtfgV2QX9I+XzcEqLWA
 eGIlElwhGUuivYD0owyoppaY7rpEjyc7dQE1X8G6Ay3yZCAfb5veGUDZkthAfvnn2RVDH9DZe
 1Ppalbv61QpVN1qS3Yjka85NdgMYfyIeJmRlJ0/kJhrp+FSqd5FtuVKUl8PTl+fStHZfb8Bdi
 fX8gVacLII4q0PzL6Nd63mjCimPBAtruBSsBCNYnLObGnqfIdx67XFr3agC2Nt7jfV+SZO4hz
 Me4lc2cVSnqGXEBjdncGjhyxhQSnIivF8lV1PLLt48roqMybu7c8EbyFiIzb7wqFickwYPfIU
 vBl8LnSAoiBt0kGIF3Jn1GU80vKwjZoaAJpT3MpyShm3Rgr8gBjIKdukvy5rPfffgzHwo+5h1
 lbsczb8kSVuYFt6c5fCrfJ8FR3qLLx5kE6rtE+8juugRIXjoYsYkSSTnMcVEu1fm7fv85FxmG
 q8omGdAVSFLOEjVb0lsVoI2qOTzxb4kFpznZPdPHVsdM+iTHaRNhDUAS4eXPXZ+MjHeT/U0PX
 /B/EZc0QgixkWHe4EQEX5Sx+6YLBln1ip4hxm58ERts18iiKR0vTblILesqy/nu0Xg/NgYms0
 PxnwI0BktKCWr0uRTuTLi5/e26/1jO7f9BNMp2LTtM0XziTJPzTqzQBiovg0Ri1/5QYKyea7l
 UMXyVwF+BlZfP6BI5qshH2VVIENVpqr3WzfLpcxQVK0QQ2IfjzIdAFnZfyuBms5k6T6disx04
 yVA+JSR3q8QkStSP6VxGhgeIVDUrD8+NHRytM5LHrWbrXYnjd1tsW474ZrkyzmU8yP1UPKjYC
 UMhQc9oFiHuGGUfrtlb6ysQPpoIe4urs77AKz7NShkCYdUlkzOHmrto7Ju6gJq9G3GqhbGekz
 VMvkc/IKIuyK+DDhkqGpHi78d+7gDpj0ZW4l18rcBmtzed1++cxqfD8qeCrKqb82oOx6Fdtm3
 Ojsf/u9TuyeJwybGgdbWAQHpksKxN0lzlyhamw3zoICTDqN5KWMfoQro4iz5C/8xmg==

Hello,

Would be nice if the new NTFS3 driver properly resolved junctions. Case
in point.


Under ntfs-3g:

lrwxrwxrwx. 2 root root    15 Oct 21 07:59 'Documents and Settings' ->
/mnt/Windows10/Users

a proper working link.



Under ntfs3:

lrwxrwxrwx. 1 root root     8 Oct 21 07:59 'Documents and Settings' ->
C:/Users

this and other links, e.g. Users/All Users, Users/Default User, etc. are
all broken.



Best regards,
Artem
