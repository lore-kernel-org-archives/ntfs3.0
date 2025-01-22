Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EE212D6F
	for <ntfs3@lists.linux.dev>; Wed, 22 Jan 2025 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554194; cv=none; b=Mkq8k2tM7gvbPRufPC3Iwkbdd2Z0V6S15fYAzE+Ruzj9FPByzDs+WylKTrAc7b36zKmHXlMfPeBbdRqMgsDIjtP7TOVH3LMOAoFO8o7YSCtg5PRBaogW42UYbkTNycz7BMhNT/PTyv2QNHyZu4kMSDb/3RYxkpPRd1lmru9iHko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554194; c=relaxed/simple;
	bh=C8ZxnV8WM/s9Jk/x1kQC9x1SymzOhuPcid8EhW448vY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eM/MG15dxTr6eFMPkKTMCK0Ax/CmREyOTSNNL29dY095s0x6CzSwKVHz3g8LOGet9iBMA6AdVYxz822DuRlWio6Cd8c7njEifeW+lZFwEQmeyIYN1BK0TDpgzTh1fVvaE/Dh2c5QhRCA3PvOHod7PMth+P14Zdebk/opsfyMZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=iCoidhMm; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="iCoidhMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1737554163;
	bh=C8ZxnV8WM/s9Jk/x1kQC9x1SymzOhuPcid8EhW448vY=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=iCoidhMmQvXIaqxGkzUSAHLmRWvJrrkKkpayK5LyYTlMaIxRE4cHcbVPrBE902dKj
	 ZDSlocjhb2RpTZ2NszqLerx4WCsy+JGYPY/iFFWI3xs78nIBFn4rx+cYI+l6wd85fI
	 N7fVIpMyCcWkUsbDu1GqzHwXOQd2FF4CM7mZAgSU=
X-QQ-mid: bizesmtp84t1737554157tqdpfmw5
X-QQ-Originating-IP: ayIcwjhXFTshhAswEiPBx6l0SOeUvEWZyRZtP9j5NOk=
Received: from smtpclient.apple ( [117.188.120.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jan 2025 21:55:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12011589984396753922
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: Bug: Invalid Input Handling in ntfs_get_block_vbo Causes Warning
From: Kun Hu <huk23@m.fudan.edu.cn>
In-Reply-To: <7ed250ad-0177-4cfc-98c6-d236c6d6415d@paragon-software.com>
Date: Wed, 22 Jan 2025 21:55:45 +0800
Cc: ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>,
 syzkaller@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD3F82A8-67EE-4544-87A5-EEC6DE1AB7D6@m.fudan.edu.cn>
References: <468BA2C7-4675-4FB9-822E-BF49E8E8F197@m.fudan.edu.cn>
 <1FFB9A88-637C-47F3-B007-8BBB9D55EC03@m.fudan.edu.cn>
 <7ed250ad-0177-4cfc-98c6-d236c6d6415d@paragon-software.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MmPNY57tR1XnfDRhFiPdNAFv2Od3vK2/mBZkBbewOBoUcQQQSCa/kOYG
	cJvmEucHWri/7JGoxJt0LDVjTKq7nKUZYWhN/0rmZ4gmqS3F/0Cz8ZTzJpSvY7SKWbKt+Tx
	Jw65lU3SNmUVRclLm3TPF/7Ju/1rsj5RMI29gSPFcLQQ0N0QrRYWyl8V5jpdNoNY42d7Rqr
	w1aMJnyVkoiohlibEkOaAwPI4FQZUvdau6Z2set8QDBiwiSf/wmoQYM963yEnNOyFZ8Yzxw
	IkMsPzVkKJxs6iU2bOp1gnpyZcGoLHHOpad+YE8feH1r6dw2jgHv/skn0hQWQb1wo7SM5It
	L8ZifYYWA8KaeNdSj4zhVPrVCSbZ93DTNv65/iOpMl6N0w2dUMtcpS2kS4TycIv+B/xtLzn
	ko2ULpDPMfaagyK2fWH9TNHYtDlYnsyzBljDyVW0ID9fxKN92vwDg4oCgjkpWxvECaTvV4s
	lYMFCBFLIyQQbMfuDTXroc4b44T7+3ggXC6XqC36F6zTFNipX0jelhUYPOnFIpYt2Jqh1G4
	Ocyxh7y6xzNE7NoobSvhjwuwfvuRqHnB7DwPACalvf2kysU48mgk5SykdjWCGB7heKRZJ8u
	bGO2B9bYsNzBhT/OrludoH2orjpxH1irTD+S7107n/l8D7XxZO50C9Y8kOCHGi/LA+CvTlQ
	3rNqrqXUYZCzzNmXxLaY1wv7601xbC1xdpzZErkLUtdOJsuCxImSbjxOF3RlCJsU/qRkILA
	mbz7wJ+NcWfhn3rbQApV9P9fapJuBYhnVEpr5U/cfgo1ecxkaxri8YuEW2IiWGFR1z6YpBJ
	ThL943kL9jOz7UA8n71fk7sF+3DcA1BRf4Hb06mA0gv2xiE96mlIeAAEIYrpoiCdqhaC/oY
	dG2B5+7WhrhS9aij4iKn58HiKZ02NXNB4lel7t70SljvnBTOrk3yY11AkydJzZMd2ve4cdk
	uXyEQ83YmVMviKoNrVdmRKwM1v0Xw1O221W8qTRu+ml97HhtEA7VM7yheFBl0UpBr2bHWrH
	Y1RzUfIDFCHA5z12bP
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0


> I was able to reproduce the issue with extended debugging information. =
I will update you on the results here.
> Thank you for highlighting the issue.
>=20


Hi Konstantin,

If you have any additional informations, please let me know.

Thanks for reviewing!

=E2=80=94=E2=80=94=E2=80=94=E2=80=94
Kun Hu

