Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31F23E334
	for <ntfs3@lists.linux.dev>; Tue,  7 Jul 2026 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412114; cv=none; b=C724GgocAkkX6QCLks4I+jevqIGm19lFGHsrB9zKo4iIqENeHvswx6veDv9vkqGFBa1g3qrjhcf/2Oc6K/67VSBMvnTfnFj58sMDGhZsFxo0LPQMe8PbXHb02Ls922FXN5w6KrPNMt16lpdHvX6cwyEAt7+gkJVVK9nxuXasWjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412114; c=relaxed/simple;
	bh=Jqd9i8fU+/3Ptb05IXxD3eVgImZ9tWOPebLmmVARzL8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=rgOcOSgnIu0dDLXGeW/bPoDoPGqQ9nl9HKZITRq7wmMw+3XHEFeGYDIuQRxhWq2ALkl//Up1rTx64uF+7VxRhEKJepBHh7VIeggfHO+h6fYz6lTVH4UEv/bUinDhCdohkFOMM42bDZKXtn47sShWCSAVofdjNwmz4F6zM02zzqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b=S+3aqFPK; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="S+3aqFPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1783412110; x=1784016910; i=aros@gmx.com;
	bh=Jqd9i8fU+/3Ptb05IXxD3eVgImZ9tWOPebLmmVARzL8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=S+3aqFPKXfo6LTfd2vQpNtwTahdtuI951DrwG/y7pn61rnN0dGwcHnZn2nuaGFGK
	 98d3Jh6SAEBxyunfzwnMb4LVTGwgjGEHpDObwxcZsqnlise617JNUEOPvbtCSf1EU
	 4Vcafz/bHhSy+M3MGMTJf2RPD3Naty/+YUQcz6JphIql4SAbP0bCiCJCEv0gbY6dr
	 4wjhhmfKP9pjx4YgpmCmNYIzQ/+CurmG575muS6THk9y56Wof3g70cgDJuOZ5CiS3
	 TrYsVd/wEgiWGu/ds7rsLY0exUoPj4XJYTjld7aisCoBKfQPHX02IH3JEpqPG+5Y7
	 YTx9m3YCGY2W4XazTQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MYvY8-1wcdGo18Hw-00S1pr; Tue, 07
 Jul 2026 10:15:10 +0200
Message-ID: <2230872c-1651-4fe3-a2a7-ccaf2b28317e@gmx.com>
Date: Tue, 7 Jul 2026 08:15:09 +0000
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: NTFS driver excessive logging by default: Correct links count
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pFaSaytUEimXQvbjiavdVw21osiK2I62MsIdByvZSsOkwg6QUTZ
 e8uPgCVdc7eA1IG4uEh+9FWIbYBuX7IRTXdAapPp94v5fRuCgSDx58Z9z5mQOpSHEx4s5nX
 bAzHv08wrPq/6YEbNmxcimimKG/z19xfoD8PrnACaDoFfGvYkkfPW0znAkfGY1KA5n0J9Fa
 EOVSXbfq0EpCCA8iIlkhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jrEthWr7/iA=;pMBpkmtiCANEKNC7be0BOeLx8P5
 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
 CYZH5A==

Hello,

This is my ~22th attempt to draw attention to this issue. Konstantin has=
=20
been emailed twice with a clean Windows image that exhibits the issue.

Whenever I list files on my NTFS partitions I get a lot of SPAM in=20
dmesg, e.g.:

ntfs3: sda3: ino=3D14c, Correct links count -> 1.
ntfs3: sda3: ino=3D73, Correct links count -> 1.
ntfs3: sda3: ino=3D167, Correct links count -> 1.
ntfs3: sda3: ino=3Dd9, Correct links count -> 1.
ntfs3: sda3: ino=3Dd5, Correct links count -> 1.

And the partition in question has been fully chkdsk'ed and has no issues.

Please fix.

This is still reproducible as of 7.1.3. I first reported the issue for=20
Linux 6.8.2, i.e. over a year ago. Maybe someone could look into it=20
after all. I can email you an NTFS image if necessary but _ANY_ Windows=20
10 or 11 install will exhibit it.

Best regards,
Artem
