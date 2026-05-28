Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC824270575
	for <ntfs3@lists.linux.dev>; Thu, 28 May 2026 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976142; cv=none; b=oLc0MxPcniAep0kejxPZdQ3SoAlurxzPSq0Jq/zc+gKgFmvO6AV8f9Nf6y09BOK3ScTEoKWzS/XO2vA5GkkKuZCREoxcbZGbLpxKuS6vBDYJWkkeoDyHtYSi1dw/Bi6MqqA7+lqT76zzoI+Pw1WF+vOvj7Pjsaw2D77aMns7UeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976142; c=relaxed/simple;
	bh=klRtw59F+Tl/gK82bNXbRFEOAJTHA4uLCbz17H5Yc34=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mcFgg4unNxaWe8yVA6J0faGDaAW6dVJrVMl6+wCE2amwpMrydeYUW1nzrpFQ0fEAmOibJejxOAqbHMgKa1AVJ3eoFeb23pEmVM1R/cdIKEWNmp96yAPpnBjE2BmUNt362FDgPYAHp8WiqnOkRxFUpSpGM0zmFlAR1KszMQNvZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=KEuwUEK8; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="KEuwUEK8"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 61E6E26;
	Thu, 28 May 2026 13:49:01 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=KEuwUEK8;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 0D23E1D44;
	Thu, 28 May 2026 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779976135;
	bh=aVV8WiKac27Pcc8ldXRt1Egwfmb8Jk67bBRNMbXJhd4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KEuwUEK8WWOVc9fRqsEMWHpyz/sG0MOQSsKh/66CKP3yYecxbvmDipfIRC+/Vd1x9
	 Hh7Hu89ybsoE1MZqGxauoO9nIOZ8FQOOg+B8gU+ioPvS8Y2PM7sbeaZzuSoDxE0wI2
	 bTKHCgI6JQIpCcV6qFgBu/NJpKCtFvinw6xgIcG4=
Received: from [192.168.95.128] (172.30.20.180) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 28 May 2026 16:48:53 +0300
Message-ID: <201d0fa6-80b7-46d5-bf2c-01acfa8c8f34@paragon-software.com>
Date: Thu, 28 May 2026 15:48:52 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: avoid another -Wmaybe-uninitialized warning
To: Arnd Bergmann <arnd@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Edward Adam Davis <eadavis@qq.com>, Sun Jian
	<sun.jian.kdev@gmail.com>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20260515090956.512083-1-arnd@kernel.org>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260515090956.512083-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)


On 5/15/26 11:09, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The ntfs3 specific -Wmaybe-uninitialized flag found one more false-postive,
> this time with gcc-10 on s390:
>
> fs/ntfs3/frecord.c: In function 'ni_expand_list':
> fs/ntfs3/frecord.c:1370:16: error: 'ins_attr' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>
> Add an explicit NULL pointer check before using the pointer, and
> initialize it to NULL.
>
> Fixes: 48d9b57b169f ("fs/ntfs3: add a subset of W=1 warnings for stricter checks")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   fs/ntfs3/frecord.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 7b035da63c12..d2c0b836b1bd 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -1330,7 +1330,7 @@ int ni_expand_list(struct ntfs_inode *ni)
>   {
>   	int err = 0;
>   	u32 asize, done = 0;
> -	struct ATTRIB *attr, *ins_attr;
> +	struct ATTRIB *attr, *ins_attr = NULL;
>   	struct ATTR_LIST_ENTRY *le;
>   	bool is_mft = ni->mi.rno == MFT_REC_MFT;
>   	struct MFT_REF ref;
> @@ -1363,7 +1363,7 @@ int ni_expand_list(struct ntfs_inode *ni)
>   				      le16_to_cpu(attr->name_off), true,
>   				      &ins_attr, NULL, NULL);
>   
> -		if (err)
> +		if (err || !ins_attr)
>   			goto out;
>   
>   		memcpy(ins_attr, attr, asize);

Hello,

Applied, thanks for the patch.

Regards,
Konstantin

