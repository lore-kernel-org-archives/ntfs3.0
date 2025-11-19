Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCC2351FDB
	for <ntfs3@lists.linux.dev>; Wed, 19 Nov 2025 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550282; cv=none; b=lsPILkWy3rRxsDJAvbLgJoUBsbHqc7FFUiGwEujkqqJCeBQmcC0jWp8PHgHxGrA6OJGG/OVUyK3+Th2b0JDezPQ7dhsATFOzRYKtgDd0Ci6zDTHma/S3OqZ/VNKa35YPavCfORP7/1G0ZKa0bbJXgcZ5QQqCekxfWs6o2qteRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550282; c=relaxed/simple;
	bh=A5wF8ePYv2WXdaPUKs0xlNyUT6o9Hs2uCZdARCv6vdM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=H4WCO16lpB5Vy5IFMQjTXKG9ZnqockoberO1w+OLHeva/tqTmFje9f2c61ucXtTgaavf6u71Yak/YzkXc5NK/A/4KIRC+8ydtL1iPg0KFtZb+3zquYiYflk7te3/ZMNk1LgxZ3SOnR1zssWKY8SdbY8ZLERoMKwZtpjteSDfwGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com; spf=pass smtp.mailfrom=tutamail.com; dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b=bzfZa03h; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutamail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b="bzfZa03h"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 149FAE15423A
	for <ntfs3@lists.linux.dev>; Wed, 19 Nov 2025 11:57:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763549870;
	s=s1; d=tutamail.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=nyKSJ/UiRuS1DSucSimt2IeqYhrsCxFF3zSXgMM6W7Y=;
	b=bzfZa03heN3wAea80M/MddSA0ZtzXogeK1xCwLhXuRDnbS3MrXynfe6pEtxOw6GZ
	NOy6opa2hHT+6enJwR+e078z7H3w8nWzkVOmACw40kNGzAbFH5RgCx4a9OT6bREGYlf
	BfEHbgRo/RPdWLQ3IHl7pZ+CO9A5xrt2thcyh3ia2wGUdtjxv66bqe3emsgHH02xZD6
	umUiXefmy+No/GfEu69P/93olUbuqp69MeNFTZtzKMinFUg7Vk7IjDpwrOprFNZ9m9O
	uahknJ52+K9+YFIwQBNezHBU1GFE3PA6KMBui9wkorMtD2C3aOC26RhMB3l8VQdGmjs
	m9FfwgCZ1w==
Date: Wed, 19 Nov 2025 11:57:50 +0100 (CET)
From: craftfever@tutamail.com
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Ntfs3 <ntfs3@lists.linux.dev>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <OeQkrcD--F-9@tutamail.com>
In-Reply-To: <ee9a1718-7feb-4ff4-8b1e-582b8aca85b4@paragon-software.com>
References: <OaiQgS3--F-9@tutamail.com> <Oait04j--F-9@tutamail.com> <d9ae2341-b385-45f4-9359-550d1118efb7@leemhuis.info> <OaiyHa1----9@tutamail.com> <ee9a1718-7feb-4ff4-8b1e-582b8aca85b4@paragon-software.com>
Subject: Re: [Bug] Memory allocation errors and system crashing due to
 buggy
 disk cache/inode allocations by ntfs3 kernel module.
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Nov 14, 2025, 10:39 by almaz.alexandrovich@paragon-software.com:

> On 10/4/25 13:26, craftfever@tutamail.com wrote:
>
>> I'm posting there first time, so I through it like generic bug mailing l=
ist, but I can say, that, for example, version 6.12.50-lts a little less pr=
on to bug, but it occurs there as well. I'm using Linux 6.16.10 for now. So=
, bug is present a while, but i hardly to tell, in what kernel version it a=
ppeared, cause earlier, I didn't manage that big amount of files. Again, it=
's okay with ntfs-3g.
>>
>> Oct 4, 2025, 14:12 by regressions@leemhuis.info:
>>
>>>
>>> On 10/4/25 13:03, craftfever@tutamail.com wrote:
>>>
>>>> Oct 4, 2025, 11:55 by craftfever@tutamail.com:
>>>>
>>>>> I'm expecting serious bug when writing large amount of files to
>>>>> NTFS hard drive, shortly after memory allocation errors and system
>>>>> crash occurs/ Firstly, I thought, than this is bug in linux kernel
>>>>> itself, somewhat disk cache allocation error, but when I tested
>>>>> same operations on ext4 drive or using NTFS-3G module, bug is not
>>>>> present.
>>>>>
>>>> To reproduce a bug, try cloning two big Git repositories to an
>>>> external NTFS drive mounted with ntfs3 module.
>>>>
>>> Thx for the report.
>>>
>>> What kernel version are your using?
>>>
>>> You CCed the regression list, so I assume this used to work, which lead=
s
>>> to two more questions: What was the last version where this works? Coul=
d
>>> you bisect?
>>>
>>> Ciao, Thorsten
>>>
> Hello,
>
> I tried to reproduce the problem by cloning multiple large Git repositori=
es
> onto an ntfs3-mounted NTFS volume, but the issue did not trigger on my si=
de
> and no system crash occurred.
>
> Could you provide a bit more detail about your case?
>
> - What appears in the kernel logs before the crash or before the process
>  enters the unkillable state? Any warnings, memory allocation errors,
>  stack traces, or lockdep messages from dmesg would be very useful.
> - What mount options are you using for ntfs3?
> - Roughly how much data or how many files are needed to trigger the
>  behavior?
> - Does the problem happen immediately, or only after sustained I/O or hig=
h
>  memory pressure?
>
> If you can capture the relevant portion of dmesg or the last messages
> shown before the freeze/hang, that would help a lot in diagnosing this.
>
> Regards,
> Konstantin
>
Thanks for response. After that situation, I changed driver to NTFS-3G, so =
were with stable work, but degraded performance, but at least without crash=
es. Today, after your response, I reverted again to ntfs3 to test cases, th=
at I mention and I can't reproduce it either. As it didn't response from yo=
u for so long before now, I changed so many Linux OS settings, disabled USB=
 autosuspend, disabled rtkit-daemon canary-thread, so there no more highest=
 RT threads, changed some scheduling and memory management options, so now =
it's stable. I'm not expecting any crashes and lockups even with large amou=
nt of files. Unfortunately, during bug presenting I didn't able catch dmesg=
 messages, `cause system crashed. The only my assumption, that it may had M=
FT allocation bug, when disk is practically full and driver have to handle =
MFT allocation, additional space, where new pieces is stored. I guess it, '=
cause when I tested new ntfsplus driver, I expected this bug, when download=
ing multiple chunks of files, but without system crashing, just the downloa=
d manager aborted file downloading with "memory allocation error" with corr=
esponding dmesg errors. Right now, I don't expecting any issues with ntfs3,=
 so I'll respond, if there will be any. Thank you.
