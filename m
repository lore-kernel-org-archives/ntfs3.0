Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767D4A33FA
	for <ntfs3@lists.linux.dev>; Thu, 24 Sep 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264196; cv=none; b=XUaOPM+mHj00Vpj8HPe8Pzi0k1yesTA2IGgCVn4FQFh/4RONO8wPxL5pLkVIC9ZHs0Yf4f5VEQ7dB8SWar8xJLirIdbK2347hNGL/e/X3dm07HeIB0fct/P1OLfgPiQtnpnh87pAjkThTMng/yoA2IlN2IduRw+kJG8uM4yV7Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264196; c=relaxed/simple;
	bh=f6kElMlh2yMdc4WvVxzJugCWZDwQcIufeIl+gsHTB28=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NDBRHeZVGIGHJ6TPSf9QNfvhsHFI3ycj21Fh9nsPCdzFlqQQ/PNldA8Aup5vDSUWuqWEIK0A7tNv1OiTmUKdCKv1fuyrKHS4iA9nNjldnafU/yLoz4rUS9fT5pi663pcN3D8lWJwG/1oSwFzDdf2isqcVxYRYDCX4QGM5mcC05E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=JiPLQYMj; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="JiPLQYMj"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 875111D78;
	Thu, 24 Sep 2026 15:37:27 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=JiPLQYMj;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 5C33C1D70;
	Thu, 24 Sep 2026 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1790264193;
	bh=z+5Abtbn+OY86ajl/bPrQZmd6sZqqAdiGsJBCP6KpP4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JiPLQYMjC/ZSIJqja1T1MurSJBcQX16iTKLYWqOBSGvmH3Vd0WXb2/TjviQP2Bckf
	 Y5xGKF65C1C5BqpN1bPHBv5fi1qCMg47rJXhTVanDR+6UoCQPQQWtEnsgcYtvGHUZE
	 nx/2G3PnDI7dN9PoBt6Q10j6R6EFdFaHXJFXoGDA=
Received: from [192.168.95.128] (172.30.20.214) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 24 Sep 2026 18:36:32 +0300
Message-ID: <84949de2-79f5-4574-8eda-33c5466b47c4@paragon-software.com>
Date: Thu, 24 Sep 2026 17:36:30 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: Fix OOB write if ret == buf_len in
 ntfs_utf16_to_nls()
To: =?UTF-8?Q?Alexandro_Cal=C3=B2?= <alexandro.calo@nozominetworks.com>
CC: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
References: <3EFE7695-DA5B-4A28-8E39-4853BBA784FC@nozominetworks.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <3EFE7695-DA5B-4A28-8E39-4853BBA784FC@nozominetworks.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/7/26 17:49, Alexandro Calò wrote:

> [You don't often get email from alexandro.calo@nozominetworks.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
>  From 711162530c2cdc4f4930b5a08db0093e6618a26d Mon Sep 17 00:00:00 2001
> From: Alexandro Calo <alexandro.calo@nozominetworks.com>
> Date: Tue, 7 Jul 2026 16:23:48 +0200
> Subject: [PATCH] fs/ntfs3: Fix OOB write if ret == buf_len in ntfs_utf16_to_nls()
>
> 'utf16s_to_utf8s()' is documented to return at most 'buf_len', the caller
> does not check whether 'ret == buf_len' before writing the terminator.
> The 'buf[ret] = '\0'' could write a NULL terminator one byte past the
> buffer.
>
> Fix this up by limiting ret to the last valid buffer index before writing
> NULL.
>
> As long as 'utf16s_to_utf8s()' never return a negative value and
> 'buf_len' is guaranteed to be nonzero the patch is fine.
>
> Anyway, as defensive fixes, if(ret<0) and if(buf_len==0) could be added.
>
> Signed-off-by: Alexandro Calo <alexandro.calo@nozominetworks.com>
> ---
>   fs/ntfs3/dir.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
> index 873d52233003..93949b8352d8 100644
> --- a/fs/ntfs3/dir.c
> +++ b/fs/ntfs3/dir.c
> @@ -29,6 +29,9 @@ int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
>                  /* UTF-16 -> UTF-8 */
>                  ret = utf16s_to_utf8s((wchar_t *)name, len, UTF16_LITTLE_ENDIAN,
>                                        buf, buf_len);
> +        if (ret >= buf_len) {
> +            ret = buf_len-1;
> +        }
>                  buf[ret] = '\0';
>                  return ret;
>          }
> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> --
> 2.47.3

Hello,

Sorry for the delay.
Your patch is applied, thank you.

Regards,
Konstantin

