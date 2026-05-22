Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652EF38C401
	for <ntfs3@lists.linux.dev>; Fri, 22 May 2026 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457736; cv=none; b=mgbGwOY+KKPW93R0CH8IL++FJci52zryphuiC3hf+M6r+A1j6X108cv0CMmaIcmqnJRN3GMwZZe+Zizd0n+2QLroS9TCCLMgZwEAiEaFXqSkgiNi13XNWZz629K4+tRCac9Sy/jY121uXWilPbjzDT0Pw3BwekYOnMhp9QscCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457736; c=relaxed/simple;
	bh=Qzy4AjGqCx3ilDoswrXSrcgf/Z6irpyudobi7wPmxpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bhN5UM4LR0AokXiUQjcWlnGCyEcHIBDZLQ0omX9uPC6yWQJv4+Jq/e1GetyhQv/ZyYlJbsiGoqBMJPKdrdYITAG7BLuW7H2aRIA9MDXO3RdRbbZBf+mtoHSN83QFF/z66liAAe/xjF8lOrgYQjrZIDBM4/Tqd2HLCGEhdmj9CeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=rMuP29n1; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="rMuP29n1"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 4B6E21D3E;
	Fri, 22 May 2026 13:41:17 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=rMuP29n1;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id BC7DB2203;
	Fri, 22 May 2026 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779457269;
	bh=P7elCci9+DMWOgxpBFXkixCSOeywJo23qjjSliTqGbA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rMuP29n1DGhSfONLKU3Cxhdyyo+5nJU6gkBtV4ZV3VumvUgOlVzZvsE2TCLzUSH7W
	 rGQ1EXMwgQAPjAgj2pVIGGMPq/IHFRb/pale0T17hZ0sxbF1YKBtT9KG4jZf+zatgu
	 b5G/aMspGTwlilMlMM07QpCrQ2UfWPcHMGio5Pyo=
Received: from [192.168.95.128] (172.30.20.156) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 22 May 2026 16:41:07 +0300
Message-ID: <888a7617-aae1-4c62-8dfe-c21c24ab437a@paragon-software.com>
Date: Fri, 22 May 2026 15:41:06 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: avoid -Wmaybe-uninitialized warning
To: Arnd Bergmann <arnd@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Moon Hee Lee <moonhee.lee.ca@gmail.com>,
	Seunghun Han <kkamagui@gmail.com>, Kees Cook <kees@kernel.org>, Deepanshu
 Kartikey <kartikey406@gmail.com>, Andrey Vatoropin <a.vatoropin@crpt.ru>,
	Lalit Shankar Chowdhury <lalitshankarch@gmail.com>, Lizhi Xu
	<lizhi.xu@windriver.com>, Adarsh Das <adarshdas950@gmail.com>, Jaehun Gou
	<p22gone@gmail.com>, <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260421202641.1157171-1-arnd@kernel.org>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260421202641.1157171-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/21/26 22:26, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This warning shows up with gcc-10 now:
>
> In file included from fs/ntfs3/index.c:15:
> fs/ntfs3/index.c: In function 'indx_add_allocate':
> fs/ntfs3/ntfs_fs.h:463:9: error: 'bmp_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    463 |  return attr_set_size_ex(ni, type, name, name_len, run, new_size,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    464 |     new_valid, keep_prealloc, NULL, false);
>        |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> fs/ntfs3/index.c:1498:6: note: 'bmp_size' was declared here
>   1498 |  u64 bmp_size, bmp_size_v;
>        |      ^~~~~~~~
>
> The warning does look correct, as the 'out2' label can be reached
> without initializing bmp_size and bmp_size_v. Initialize these at
> the same place as bmp.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Note that this is one is separate from the one I reported with KCSAN
> ---
>   fs/ntfs3/index.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 5344b29b0577..2b8b5779ff8a 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1506,6 +1506,7 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>   
>   	if (bit != MINUS_ONE_T) {
>   		bmp = NULL;
> +		bmp_size = bmp_size_v = 0;
>   	} else {
>   		if (bmp->non_res) {
>   			bmp_size = le64_to_cpu(bmp->nres.data_size);

Hello,

Sorry for the delay.
Your patch is applied, thank you.

Regards,
Konstantin

