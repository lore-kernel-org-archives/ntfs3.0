Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E214EE87A
	for <ntfs3@lists.linux.dev>; Mon, 28 Sep 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616189; cv=none; b=uS8/u5+aR0JLmVKEa/PzANBGD+fRmqZrOQZ8OruaxcuwcYQLHfkMYne8UZcyOeQip/k+rMeK1up4sHc1CpChsP5+A6AoxXih+KoCPdiHIxTupvTjuaBOJV5wZCjJx756y/ZI/MgkYRxCgi/qvsVOdOxZloVUSNnmPb8PU7NBrwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616189; c=relaxed/simple;
	bh=JsepccZaoDRsqiHr2im6NhlFZl/G+qeEROO6uXcLmK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TBCrGnpRsWXoMOM+SPFPpPBWLCdjwL41py9Ly6V9Jjaw6nIUgbkP766GL9aL4EiIKloas6XtlLvLOhzeK8l/4akLI84MkjGfIhShn+wDf3uVlBBHO9VdH+w7hL+Hmct/ksewC1vcWwsnIwSoWWMusjuAHonFztRoQGMzUwFojJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=R9NYcvAI; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="R9NYcvAI"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 942B332C;
	Mon, 28 Sep 2026 17:23:45 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=R9NYcvAI;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 2D7F92187;
	Mon, 28 Sep 2026 17:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1790616172;
	bh=IeUgEUphtSH/VtUd2ipH6B2zIMwBdGWMiZtne0L9HAI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R9NYcvAIiNLn5yJiemRmPsMDu7wLxIG16qg6TOzXCuPKpLU+9NsQe0UyB19bATxjk
	 8ziEVWnPiGPhWfOEciCvhYPggFZG4ZFTR4MDFqgRii/4JZ9Mbr0Iy0IbA7bs0ivYzl
	 52WQXpsNAdZ5WkQ4gANAzvJRqpBtBZjNuHSrYh5E=
Received: from [192.168.95.128] (172.30.20.196) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 28 Sep 2026 20:22:51 +0300
Message-ID: <830f54cf-1e10-47c5-8d7b-7076dd8ac026@paragon-software.com>
Date: Mon, 28 Sep 2026 19:22:49 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: return -ERANGE for short xattr buffers
To: Baolin Liu <liubaolin12138@163.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<liubaolin12138@gmail.com>, Baolin Liu <liubaolin@kylinos.cn>
References: <20260709071849.2558133-1-liubaolin12138@163.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260709071849.2558133-1-liubaolin12138@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/9/26 09:18, Baolin Liu wrote:

> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs3 currently returns -ENODATA when the xattr exists
> but the user buffer is too small.
> Return -ERANGE instead.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>   fs/ntfs3/xattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 9743a63a152e..0a19668e970d 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -781,7 +781,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   		if (!buffer) {
>   			err = sizeof(u8);
>   		} else if (size < sizeof(u8)) {
> -			err = -ENODATA;
> +			err = -ERANGE;
>   		} else {
>   			err = sizeof(u8);
>   			*(u8 *)buffer = le32_to_cpu(ni->std_fa);
> @@ -795,7 +795,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   		if (!buffer) {
>   			err = sizeof(u32);
>   		} else if (size < sizeof(u32)) {
> -			err = -ENODATA;
> +			err = -ERANGE;
>   		} else {
>   			err = sizeof(u32);
>   			*(u32 *)buffer = le32_to_cpu(ni->std_fa);
> @@ -835,7 +835,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   		if (!buffer) {
>   			err = sd_size;
>   		} else if (size < sd_size) {
> -			err = -ENODATA;
> +			err = -ERANGE;
>   		} else {
>   			err = sd_size;
>   			memcpy(buffer, sd, sd_size);

Hello,

Your patch was applied, thank you.

Regards,
Konstantin

