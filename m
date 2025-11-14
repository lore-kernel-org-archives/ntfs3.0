Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D144C2FB60E
	for <ntfs3@lists.linux.dev>; Fri, 14 Nov 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113192; cv=none; b=eusR2fPYPx+wdP0EvUrdN5s3qlJJqJhx8IGwtnZysyOZ44TSOKfGDhhbC2+O2NXxyHXbCFtTbBRB2Fl29SEvx8eRjwSBhTZvzkFe8T7zQeOwZAIa9Wv3EjHbe32i8oZmdFUqTbWBFNQbg9Oee5LdqJ/DPbKrSpgrr0zxYR74b/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113192; c=relaxed/simple;
	bh=g4XkZvUp6sgeK2z8kphluUucASyKoarhW3NPQDU7ZJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I6R9EehSSKwSypOR5hXRfiVnAKO6K0VT0elaxk7EkTz+8xu0suyIPufTqhLHE1/9AR3HnwPefzHB4I0YcI2ijTSaKixKdQoGQtptdILo80Zs5LlVIO1KrLocPdABYcRh5qmNxTZj8MMZeigneRBdWY/vAiw6Rn0iLpgszRoyef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=QVMw8dD5; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="QVMw8dD5"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 614182F4;
	Fri, 14 Nov 2025 09:36:26 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=QVMw8dD5;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id B56A3243D;
	Fri, 14 Nov 2025 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763113188;
	bh=RQdXDSux8Y6C+eQUkAVhSkHeFXtOPWlZu8d6cIHyeCA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QVMw8dD50gpR4bQIE2r8MRqoiFfhYL3pfLf2uXH0ZqYsm76yd6Q7CSMWikJZtQiTJ
	 +waEXl3bBPaP6FTvVz+qL5aLl7ZwsuZsKzgNfEKb+krhtWAtMQglmroEXjD18Nf+vU
	 5zXRc2Oe1MG5DzZUygpvDXLuFq2bIFufCsa+xdV0=
Received: from [192.168.95.128] (172.30.20.196) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 14 Nov 2025 12:39:47 +0300
Message-ID: <ee9a1718-7feb-4ff4-8b1e-582b8aca85b4@paragon-software.com>
Date: Fri, 14 Nov 2025 10:39:46 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Memory allocation errors and system crashing due to buggy
 disk cache/inode allocations by ntfs3 kernel module.
To: <craftfever@tutamail.com>, Thorsten Leemhuis <regressions@leemhuis.info>
CC: Ntfs3 <ntfs3@lists.linux.dev>, Linux Kernel <linux-kernel@vger.kernel.org>
References: <OaiQgS3--F-9@tutamail.com> <Oait04j--F-9@tutamail.com>
 <d9ae2341-b385-45f4-9359-550d1118efb7@leemhuis.info>
 <OaiyHa1----9@tutamail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <OaiyHa1----9@tutamail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 10/4/25 13:26, craftfever@tutamail.com wrote:

> I'm posting there first time, so I through it like generic bug mailing list, but I can say, that, for example, version 6.12.50-lts a little less pron to bug, but it occurs there as well. I'm using Linux 6.16.10 for now. So, bug is present a while, but i hardly to tell, in what kernel version it appeared, cause earlier, I didn't manage that big amount of files. Again, it's okay with ntfs-3g.
>
> Oct 4, 2025, 14:12 by regressions@leemhuis.info:
>
>>
>> On 10/4/25 13:03, craftfever@tutamail.com wrote:
>>
>>> Oct 4, 2025, 11:55 by craftfever@tutamail.com:
>>>
>>>> I'm expecting serious bug when writing large amount of files to
>>>> NTFS hard drive, shortly after memory allocation errors and system
>>>> crash occurs/ Firstly, I thought, than this is bug in linux kernel
>>>> itself, somewhat disk cache allocation error, but when I tested
>>>> same operations on ext4 drive or using NTFS-3G module, bug is not
>>>> present.
>>>>
>>> To reproduce a bug, try cloning two big Git repositories to an
>>> external NTFS drive mounted with ntfs3 module.
>>>
>> Thx for the report.
>>
>> What kernel version are your using?
>>
>> You CCed the regression list, so I assume this used to work, which leads
>> to two more questions: What was the last version where this works? Could
>> you bisect?
>>
>> Ciao, Thorsten
>>
Hello,

I tried to reproduce the problem by cloning multiple large Git repositories
onto an ntfs3-mounted NTFS volume, but the issue did not trigger on my side
and no system crash occurred.

Could you provide a bit more detail about your case?

- What appears in the kernel logs before the crash or before the process
   enters the unkillable state? Any warnings, memory allocation errors,
   stack traces, or lockdep messages from dmesg would be very useful.
- What mount options are you using for ntfs3?
- Roughly how much data or how many files are needed to trigger the
   behavior?
- Does the problem happen immediately, or only after sustained I/O or high
   memory pressure?

If you can capture the relevant portion of dmesg or the last messages
shown before the freeze/hang, that would help a lot in diagnosing this.

Regards,
Konstantin

