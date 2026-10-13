Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D243B4F0546
	for <ntfs3@lists.linux.dev>; Tue, 13 Oct 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898627; cv=none; b=NVMCb4ZMgmPyrRlPXKcEEDENeV5p+7abQeTn84Af2kmrwrm3mwec6qtgVmgYLNtxN6ivMXi6lgAUFBwbJuH52HGRL1ayPlbYThjoSUFjzdEObAYg4HZd+20cc2os83jip1zfn2ArUs7L5lCzZC8axiCdFkM6GyNjEgUQd4Bbapo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898627; c=relaxed/simple;
	bh=CrfQyQF21b6Y9r/RDzGm/2PpQo6aZPNy7GcbpOSpHVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E5Kk5YrOAJuGFKZhxC7EM4/iwdKYsBut48CStkuzxWvWBdKUmrR/DaD8FLr4GWY3NanQgF1UywTky6OYBSLhogZWUKw3ReoBuef6/QiohEVEWfwpE3bUjBbWMx1RBLJsriWz2a+oZfRrTAvbBLC/a3CuGMFbPs4NFn5wMWiMm5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=HvHLAEY3; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="HvHLAEY3"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 257141D47;
	Tue, 13 Oct 2026 13:37:48 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=HvHLAEY3;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 88AED1F95;
	Tue, 13 Oct 2026 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1791898616;
	bh=DFwSfFm3l27v+mqgP4ysqu4xL0xIUkFiAtoKzL3Pljc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HvHLAEY3X2vLJtVxBgSOT0olG1xcNKk9nbKGsdHQZvXlyFF0p5y63acm7Wr+3A0aL
	 JvX9+xsqr793Q8ZDOctsnp5QnZeDsOv5sbUiJhXUsiwgGwgCwMv5ZgLU1ZJak5ajc/
	 jZFu7i1xKLtO3yaUDTIfBKnq/yhng6fHcIqcHW2U=
Received: from [192.168.95.128] (172.30.20.169) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 13 Oct 2026 16:36:55 +0300
Message-ID: <d40af0f0-deb2-448c-9600-582f783b56b7@paragon-software.com>
Date: Tue, 13 Oct 2026 15:36:54 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ntfs3: windows_names option fails to reject invalid
 characters like '?'
To: =?UTF-8?Q?Szekeres_Tam=C3=A1s?= <szekeres.tamas@me.com>
CC: <ntfs3@lists.linux.dev>
References: <7EB94F9B-6ADB-4016-B47F-F16660324CEE@me.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <7EB94F9B-6ADB-4016-B47F-F16660324CEE@me.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/24/26 15:17, Szekeres Tamás wrote:

> Hi Konstantin and the ntfs3 team,
>
> I have encountered a bug regarding the 'windows_names' mount option in 
> the ntfs3 driver, which leads to data loss when the drive is later 
> connected to a Windows machine.
>
> [Problem Description]
> When specifying a backup folder and creating a new directory on an 
> NTFS-formatted USB drive, the driver accepts the "?" character in the 
> directory name without any errors (for example, creating a folder 
> named "something?wrong").
> The directory is created successfully under Linux, and the backup 
> process runs and finishes without warning. However, when the USB drive 
> is later plugged into a Windows machine, Windows is completely unable 
> to access this directory. Running 'chkdsk' on Windows resolves the 
> filesystem issue but does so by completely deleting the entire backup 
> directory, resulting in severe data loss.
>
> [Question / Expected Behavior]
> Why doesn't the ntfs3 driver actively check for and reject 
> Windows-disallowed special characters (like '\ / : * ? " < > |') 
> before creating the folder, especially when 'windows_names' is used? 
> It should return an error (like Invalid Argument) during the directory 
> creation stage to prevent this.
>
> [System Information]
> - Kernel version: 7.0.0-14-generic
> - Distribution: Ubuntu 26.04
> - Mount options used: defaults,windows_names (just clicked te drive in 
> Nautilusor)
> I can provide further dmesg logs or system outputs if necessary. Thank 
> you for your hard work on this driver, looking forward to your feedback.
>
> Best regards,
> Tamás Szekeres

Hello,

Sorry for the delay.

I can't reproduce the problem: creating a directory with '?' in the name
fails with -EINVAL here, with windows_names on, which is the intended
behaviour.

I suspect the option wasn't actually applied. Mounting from Nautilus goes
through udisks2, which builds its own option list and ignores what you'd
normally pass - so the mount may well have had windows_names off. Could
you mount the drive the same way and run:

   findmnt -no OPTIONS <mountpoint>

If windows_names isn't in that list, that explains it, and the place
to fix it is udisks2 rather than the driver.

Regards,
Konstantin

