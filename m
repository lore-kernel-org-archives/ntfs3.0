Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94835F5E6
	for <ntfs3@lists.linux.dev>; Thu, 30 Apr 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550442; cv=none; b=kVasMm/BdIbECky2PY/lguWChJGabzEG7CGYJwKaIreAFnmMFJQX3hefrrzc+JuSFxDLEyS159CL7JWKV7Q/TtiD1OGTj3P1u4+RnjRVMH6MeclCmoulmMGl3QlHXt50IMMyo4d8IXct2KgK+inqj6I2Yp2N2/bSt8oJi4TxskE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550442; c=relaxed/simple;
	bh=Oz7DRXXfavw5SwHBpWqyv9N/Mt9LBqY5fCCMvL4WvxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XfJghiVHU+ujw9VwPM3wxovyL6HsQmdSPuddFwxK3A2+mUsuhfJDJT7qpKjRKX+xOrBkec0ZIMm29fcuSI2svVfChiDqHugUWCVb/tdFqiqs4aGxCWb4289oL2FZYr5wSttS99LDErodIaAwqZFHypdLRIk+na7taO3hNJ41KWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=ZqHb04lF; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="ZqHb04lF"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 06ED21D27;
	Thu, 30 Apr 2026 12:00:47 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=ZqHb04lF;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 2C7D42133;
	Thu, 30 Apr 2026 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1777550439;
	bh=DVCXVOV8Womh9EWUi22MV6kyo5o2MJjFXqFm+8TJ2kM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZqHb04lFuFuV+rWqShae6a7EamneabwroM/j7q+Zo58qPtalc0ZKR9d/cHNaK1gN6
	 9Awqk395xzkXCrjunFjthQb0x8Ef4B5CJP+6TZ0nXnQ+WtB33Br0KIjocligd+Yl2U
	 LwS3SiTYPsgNRnxUJByMxoaq8xPYDCKSGMXP1YZ0=
Received: from [192.168.95.128] (172.30.20.214) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 30 Apr 2026 15:00:37 +0300
Message-ID: <b6ee7c10-3313-4a46-845e-31ffdc1fa742@paragon-software.com>
Date: Thu, 30 Apr 2026 14:00:36 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix out-of-bounds read in decompress_lznt
To: Tristan Madani <tristmd@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com>
References: <20260418131118.1063963-1-tristmd@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260418131118.1063963-1-tristmd@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/18/26 15:11, Tristan Madani wrote:

> [You don't often get email from tristmd@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Tristan Madani <tristan@talencesecurity.com>
>
> decompress_lznt() does not validate array index bounds before accessing
> the decompression table. A corrupted NTFS3 image with invalid compressed
> data can trigger an out-of-bounds read.
>
> Add index bounds checking to prevent the OOB access.
>
> Reported-by: syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>   fs/ntfs3/lznt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/lznt.c b/fs/ntfs3/lznt.c
> index fdc9b2ebf3410..f818d97850049 100644
> --- a/fs/ntfs3/lznt.c
> +++ b/fs/ntfs3/lznt.c
> @@ -240,7 +240,7 @@ static inline ssize_t decompress_chunk(u8 *unc, u8 *unc_end, const u8 *cmpr,
>                  if (up - unc > LZNT_CHUNK_SIZE)
>                          return -EINVAL;
>                  /* Correct index */
> -               while (unc + s_max_off[index] < up)
> +               while (index < ARRAY_SIZE(s_max_off) - 1 && unc + s_max_off[index] < up)
>                          index += 1;
>
>                  /* Check the current flag for zero. */
> --
> 2.47.3
>
Hello,

Sorry for the delay.
Your patch is applied, thank you.

Regards,
Konstantin

