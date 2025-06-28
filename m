Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30E7DA66
	for <ntfs3@lists.linux.dev>; Sat, 28 Jun 2025 21:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751146910; cv=none; b=ODiEnqbGi8R0t0PxKOCqAtUK/nBZ9mGwNataLRpnYXL33rfg7PmetZuOQ0I86Zn1Zm3G2RhFZNvE66Es+Giiz/VTlasWPibXXpVD4gUM0z8ZnKNZ0Gr4isnztc7v9swsc2tVPjUqwZv8t7rtsJKb8dh7EeHcZhi+JPgWLmgyBx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751146910; c=relaxed/simple;
	bh=RR0M7cfrrG28Dl7ellaidAvyZAWwItCfd2ypwT3aQj0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=MZsbmO4by0HhTWsLOKwZzACGNIhDHUJOe4WD9pO8g4uLF0SHpUpkXKIU3Z7eM4PKzAhX2YG5Hw12KMrLqN4zD+sJFL8pbjKqUu4QP7Nzh7oO2PsVim5RMdcrxPrab9GLleEV4jVkxOlg8IOPKsyoW+EsBPpStWR9s/EwL17Klgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b=AXMWYky3; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="AXMWYky3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1751146905; x=1751751705; i=aros@gmx.com;
	bh=RR0M7cfrrG28Dl7ellaidAvyZAWwItCfd2ypwT3aQj0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AXMWYky33moxHf8l2oK4ZtlqVbKgaSG0tlAKYdDfJXAcFKSI5BOyJ91WCU2ZWMzc
	 FV16ruh3wwEUaXNPq7QMGwCsMCE7VBM7zR6Qv0an9sXukfViUKgbZ2+e7ncfrBdHu
	 Ixyh9O2W6xQigN74FEz/J83SHQ9W5uipjO6snh7E6vtw3WHDSqeIJieG9w6lcoe4L
	 UhXv2Wrh5UE2LA3y6M3vM1BBIMw9dKpAdI7iOWojSHGDf05ePvBcEdj+70/Cw/wTV
	 k0DiY45yh/rEx3HgbPwW4+QfSpEewc6Sg55k0ehaSvkTdWlQa7TQTbxcVijAoHGqT
	 XkkHmN10Jj5D7WEcOQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.19.12.16] ([98.159.234.61]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MhU9j-1vAD740b8F-00oNsd; Sat, 28
 Jun 2025 23:41:45 +0200
Message-ID: <6c25909e-cfa8-411e-a352-2c5d749a7742@gmx.com>
Date: Sat, 28 Jun 2025 21:41:42 +0000
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
X-Provags-ID: V03:K1:QoMAAR3rbZNl3WFvW/2ekhXgk2WDORwQWTOWHD02yEKQcBq84jk
 wTmxYtusj0y4GZD+J85QbjF3KqSS0hYhVtaJtqLqBy8LyAU8vwel2eD0Sy0YAA9KsKAY0Ln
 XxQ+FWmy/2uBnCCrC/ZJtPLC2eqHcD5+Cy0AWL++UymXHIEgv/dbwtT3HyV+JNokjJRtJpk
 sQIR51oVeS2ZrAxu15jJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uz1LvkZzusE=;USOrZ4EwqFwD1who92zSm0cvV6c
 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

Hello,

This is my ~21th attempt to draw attention to this issue. Konstantin has=
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

This is still reproducible as of 6.15.4. I first reported the issue for=20
Linux 6.8.2, i.e. over a year ago. Maybe someone could look into it=20
after all. I can email you an NTFS image if necessary but _ANY_ Windows=20
10 or 11 install will exhibit it.

Best regards,
Artem
