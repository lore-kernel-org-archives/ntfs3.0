Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91D47A0D1
	for <ntfs3@lists.linux.dev>; Thu, 24 Sep 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256835; cv=none; b=Z7aVAqihcJWk+dHQPpFfUNV1CdQD1Y5kuICo5PYpxGSKG0obnAMGmAuxRjWHTKxMqkV0TKF+dcRlYNYywwhy0HPqHyjECFGWEWyOxblX2KRKtdrTazWPx4Ax2nn2AdVyhLQZE5C2UnZTwDwIFDP7aMpNkALPF9jHdOZ2CX3Swl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256835; c=relaxed/simple;
	bh=ulVUthYS0i1apC/Na5l/0lHq9wF6BPUKqwJvInFH0bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NOuATk4Pb1k5NKDSJh5zgH75NBekPpjhHwV6gj7bD8cYsV/AOxL66euTdYysyzRMQOyxDuhh7tPbhGN94j1hh4+zFFlV/8s81FJ7xRLRT3I5xXzlzrGozWDyuGAaFKTj93Fb4B696/G0dXQdV1CgYRmamLPkQBPOAoM7JxfyLWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=U/SYqZzT; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="U/SYqZzT"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id AD80D1D78;
	Thu, 24 Sep 2026 13:34:37 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=U/SYqZzT;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 81DD9185;
	Thu, 24 Sep 2026 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1790256823;
	bh=DK0icsPLCp9gedIOjzBfqC7YJdFzk9VPMHVj9fpCWO8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=U/SYqZzTcz96QCK4I33tanMzZb3WEvOhyVGxo9nQXjXajkIfzpMMyqJLf9xQRh9Ma
	 F1l1YFJnocDmDwUNo6ZOC40rUG/jwEqcYLxHY6SHOhr3cvXQnhGn5Ww1lcw32GjR2T
	 BHeOzC/LScja2EDiDrPrzkxfROzsvT82royQTyfk=
Received: from [192.168.95.128] (172.30.20.214) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 24 Sep 2026 16:33:42 +0300
Message-ID: <5f6cd321-92ac-47cc-8118-a665d3b32bb2@paragon-software.com>
Date: Thu, 24 Sep 2026 15:33:41 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NTFS driver excessive logging by default: Correct links count
To: "Artem S. Tashkinov" <aros@gmx.com>, <ntfs3@lists.linux.dev>
References: <2230872c-1651-4fe3-a2a7-ccaf2b28317e@gmx.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <2230872c-1651-4fe3-a2a7-ccaf2b28317e@gmx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/7/26 10:15, Artem S. Tashkinov wrote:

> Hello,
>
> This is my ~22th attempt to draw attention to this issue. Konstantin 
> has been emailed twice with a clean Windows image that exhibits the 
> issue.
>
> Whenever I list files on my NTFS partitions I get a lot of SPAM in 
> dmesg, e.g.:
>
> ntfs3: sda3: ino=14c, Correct links count -> 1.
> ntfs3: sda3: ino=73, Correct links count -> 1.
> ntfs3: sda3: ino=167, Correct links count -> 1.
> ntfs3: sda3: ino=d9, Correct links count -> 1.
> ntfs3: sda3: ino=d5, Correct links count -> 1.
>
> And the partition in question has been fully chkdsk'ed and has no issues.
>
> Please fix.
>
> This is still reproducible as of 7.1.3. I first reported the issue for 
> Linux 6.8.2, i.e. over a year ago. Maybe someone could look into it 
> after all. I can email you an NTFS image if necessary but _ANY_ 
> Windows 10 or 11 install will exhibit it.
>
> Best regards,
> Artem

Hello,

Sorry for the long silence.

On our side we have a partition that shows these warnings, and they do go
away after 'chkdsk /f'.

I did try your earlier links, but they're no longer accessible. If the
image is still easy to produce, could you resend it (or a fresh link)?

Regards,
Konstantin

