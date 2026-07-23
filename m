Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC73630B2
	for <ntfs3@lists.linux.dev>; Thu, 23 Jul 2026 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784816826; cv=none; b=oPp6RkKDeEwvuOK4rp4/XQ3tdNR3+ByYaTCCgeT9dW5K6ilHd8NZo1To0awrViRmfAH3LSsE0EZAUCW/6us7AVaPBWvg2+VaH0xN7e9JF6bKbq4xoUiMV5pHiM40/LcMZbxH+WfsGwqMWl0q8TeJiZ+AcCYsbkKYgFaV87ooQVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784816826; c=relaxed/simple;
	bh=V5r9ptPUoWhGTR7ANy9zHxb98gOnT0OYJzPhTeBunv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hCPvQIvFm7NeWh0Ncwz0gYNFTqJQoF9ZOdA2a6gPYMWJYORRKbUN/6iGHtQ+DvxhA740pU/JH2tI4c0fcugVHA0FDfLZssZFpYD9i+e9PfQIn5l3brSQEUgc9somXujzwqHsG8f3b7s8ykFUrPRqqwfGensqf9mVJov14X8ddKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=cQ7SkqJC; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="cQ7SkqJC"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3CD691D3E;
	Thu, 23 Jul 2026 14:27:22 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=cQ7SkqJC;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id CDD5021D8;
	Thu, 23 Jul 2026 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784816822;
	bh=Qwytz+ey3gUUEnanX/+2/7hR/0HEkZtTuFF1viUpZeo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cQ7SkqJC5LJTF4LfLttMC9tDOeTTuqaGFdOTt2EIsSQpYEZ8mdXcBT1blnZYEYM7i
	 QQaRMLhEJkC+DvHGFeMfsGe41M5F/yCKkAS4M6uwMBWEqj7c6AsVCZuv40ROIHukBR
	 qB3ToGe5HWyOuNS3qoctNAl1nbwCqcsSjBrrZibo=
Received: from [192.168.95.128] (172.30.20.182) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 23 Jul 2026 17:27:01 +0300
Message-ID: <4bdf2d9d-a0c9-40d0-b130-2be6e1beb5ec@paragon-software.com>
Date: Thu, 23 Jul 2026 16:27:00 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: reserve NUL byte when converting UTF-16 names
To: Kyle Zeng <kylebot@openai.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <outbounddisclosures@openai.com>
References: <20260611213331.16763-1-kylebot@openai.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260611213331.16763-1-kylebot@openai.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/11/26 23:33, Kyle Zeng wrote:

> ntfs_utf16_to_nls() appends a trailing NUL to the converted output,
> but it passes the caller-supplied size directly to the conversion loop.
> For the UTF-8 path, utf16s_to_utf8s() can legitimately fill all
> buf_len bytes and return buf_len, after which ntfs_utf16_to_nls()
> writes the terminator one byte past the end of the destination buffer.
>
> The same contract problem exists for the NLS path when a converted
> character consumes the last available byte.
>
> Reserve one byte for the terminator before doing either conversion.
> The function continues to return the number of converted bytes,
> excluding the NUL terminator.
>
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Kyle Zeng <kylebot@openai.com>
> ---
>   fs/ntfs3/dir.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
> index d99ab086ef6f..e8892cd94e04 100644
> --- a/fs/ntfs3/dir.c
> +++ b/fs/ntfs3/dir.c
> @@ -25,6 +25,11 @@ int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
>
>          static_assert(sizeof(wchar_t) == sizeof(__le16));
>
> +       if (buf_len <= 0)
> +               return -EINVAL;
> +
> +       buf_len -= 1;
> +
>          if (!nls) {
>                  /* UTF-16 -> UTF-8 */
>                  ret = utf16s_to_utf8s((wchar_t *)name, len, UTF16_LITTLE_ENDIAN,
> --
> 2.43.0
>
Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

