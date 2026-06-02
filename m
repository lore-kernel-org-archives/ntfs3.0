Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8EA389DE3
	for <ntfs3@lists.linux.dev>; Tue,  2 Jun 2026 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410777; cv=none; b=grQr+aWvp5pXsULIwu6q+irWby++rcGpry+H4g5he8HVzyfYevIzrsJaO/H5IQf0qUyNX12M9I2NmvGJ5+VocALbLHX70b+Ln0Uk/r9WS/iP+6xmksw1UqnlW4XTXmPd6VJwl5Itsd8GRpWW1NaRuyNFv8Posyii7fyMdCfBe9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410777; c=relaxed/simple;
	bh=5pB2vNZK7No3uIx0vJd7QJ49I/YOs4WbGsnMVTlnHmg=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=sZ1e7LVr/5zO7WuQTjVq9Wfia925941wHpMY8TC4PNs2nt0kmVBa++P4vWSTCvwKl1QSoC1Ud1eWtYmLpkMoDGi9QuVx9KdqkkDg1zhllhW4Vb3E6B86IPBCh065EBHKIf6s8bKRKXqKEndQco0+Lo7mFU5EpSuKhwJWfFmiB1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=G2V8GmnD; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="G2V8GmnD"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 353081D3F;
	Tue,  2 Jun 2026 14:32:55 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=G2V8GmnD;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id BD4A41D26;
	Tue,  2 Jun 2026 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1780410773;
	bh=5pB2vNZK7No3uIx0vJd7QJ49I/YOs4WbGsnMVTlnHmg=;
	h=Date:To:CC:Reply-To:From:Subject;
	b=G2V8GmnDpiv1wP6blSoG0/4YzPOhb+q9r47AyVtHl/tkiFuVZlv9NPpO8cnXqsIgl
	 dB08TqFRVJ3m7am74o46qQeQr1ep/KlyP4ph/n1EuMegdlawGaBFXwXR0hRluYzSIx
	 tEVUJvTHUcZ5tZ9vJ0OQWmQZqllIGdS0px1dpdDA=
Received: from [192.168.95.128] (172.30.20.149) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 2 Jun 2026 17:32:53 +0300
Message-ID: <75b58d74-24c8-41bc-8e20-7704ee287f08@paragon-software.com>
Date: Tue, 2 Jun 2026 16:32:51 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <saarthal@libero.it>
CC: Ntfs3 <ntfs3@lists.linux.dev>
Reply-To: <2020820791.1843094.1777717495048@mail1.libero.it>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: File operations on NTFS drives causes kernel BUG at
 fs/iomap/buffered-io.c:1061
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Hello,

Thanks for the report. ntfs3 has had several changes in the buffered-write
path recently - one of those may already address this. The changes aren't
in mainline yet, but they're queued for the 7.2 merge window. Could you try
7.2-rc1 once it's out and follow up on whether the problem still reproduces?

Regards,
Konstantin

