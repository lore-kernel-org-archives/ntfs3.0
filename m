Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EF47886E
	for <ntfs3@lists.linux.dev>; Fri, 22 May 2026 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464476; cv=none; b=IJ1cPD9skP3cM2lTkqF7OgFtEEXCQ+yEm6Nd6yP7TADaB8PENGsLm/DD5Uejb0GJyoEt6IzRHdpxwfJtF8skR1TcEuKmH2YGig1/2dSpfGy5hJSTRPKpD7sIRonUD3/DS+VBDY/V6yLOAG1TDKafom+7mCB6zwG3mHM9jfo+vGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464476; c=relaxed/simple;
	bh=WgvKZwWcbNev9RIuiWi8nxiGkRPq0aUQyRtDgeqYngA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nBboJoKCajM5Cdxa9vBbYusfVT7annqGO9ye9LopPivk6xTNg5CgJdlx6L6NWPt1VBwGtLYA3hkPMgmrc1HwoZJBShB6cGx3imgpIFMElAsL5i5M1HQakmHwwD7NKRF+ogknlSSe5ufc3osGLXE1Gu5QkfNvFWPLMj8iaQ0UyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=MycvJpTR; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="MycvJpTR"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 855E81D3E;
	Fri, 22 May 2026 15:41:14 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=MycvJpTR;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 0834A35D;
	Fri, 22 May 2026 15:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779464467;
	bh=WgvKZwWcbNev9RIuiWi8nxiGkRPq0aUQyRtDgeqYngA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MycvJpTRV1hFKoInsX+V5crOTsInaS2G15WmYhdHmPCvpdV8T4ue4Rw9e8Q6L/ev3
	 Ymxkt5iyn3kMfvl8X/tBpqAoGXs6L8hVZzUoVvQpou2bYgwzby99o+2DHpHbqI8FVP
	 ePu8HENTjCgr777QBBw7o53KwzRUy1Pji6G2tHIU=
Received: from [192.168.95.128] (172.30.20.156) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 22 May 2026 18:41:06 +0300
Message-ID: <93164f52-ec5b-4186-94e9-2e91429a5ad9@paragon-software.com>
Date: Fri, 22 May 2026 17:41:05 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] fs/ntfs3: mounting an ntfs filesystem accelerated by
 intel optane memory causes data corruption
To: palapapa <palapapa93@gmail.com>
CC: <ntfs3@lists.linux.dev>
References: <76bc95e8-c758-4934-a68f-bb11e20b0d84@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <76bc95e8-c758-4934-a68f-bb11e20b0d84@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/2/26 17:10, palapapa wrote:

> [You don't often get email from palapapa93@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hello Konstantin Komarov,
>
> If an NTFS filesystem is set to be accelerated using Intel Optane Memory on
> Windows using the Intel Optane Memory and Storage Management app, mounting that
> filesystem on Linux will cause some files to be unreadable, presumably because
> the data for those files are stored on the Intel Optane SSD. This may be proven
> by the fact that cloning the NTFS drive in question to another drive causes
> Windows' chkdsk to report that drive as corrupted, while the original drive is
> perfectly readable. Writing the the NTFS drive in this state may cause data
> corruption.
>
> Listing the directories that contain unreadable files gives errors like "invalid
> argument" or "no such file or directory", and dmesg gives errors like "ntfs3:
> ...: MFT: r=..., expect seq=... instead of ...!".
>
> Would it be possible to detect this case and prevent mounting the drive in this
> inconsistent state?
>
> This is my first time reporting a kernel issue. Sorry if I have made a mistake.
>
> Kernel version: 6.18.25
> Distro: Gentoo

Hello,

Yes, sure, I'll look into this issue and follow up
with the results.

Regards,
Konstantin

