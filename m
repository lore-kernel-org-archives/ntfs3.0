Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F24239567
	for <ntfs3@lists.linux.dev>; Thu, 28 May 2026 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976077; cv=none; b=HqOpWH30Z7MrihVRlV7uamsI8ZxbGmul1V39ZyQXPnaNpQBm8dyeUWN2Z+hitrU1jPI8wsv7vrBisfQw0z3eAVIKDx4gw9zaNKwlrgCvbt9eykKt87NDTxatBZUAa3ndPJ+asDBH+drxYPQZKpvIigqVBM+CXEfXT1DGAxfp9js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976077; c=relaxed/simple;
	bh=FMjHWyeFVE1hBGtYWpX7tpjM6vYIUHQpV710RBu442w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XB5Ymbm4zXS5G8RBrMRm1dOqWYWdLDt/4cXZqOHOChCNh3CjMkFtU4dIvtfw9EpY5KRNbI9oAQVuOU+/NPXbinFLqvMOdNnboH76CGTTlOUMFX7yWB7ZNMEnM0gulrqudSNy2HJOTaOvlETtbzBp464SJFP6keBjKLMt5gpDwW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=VEX1t12L; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="VEX1t12L"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3B08D26;
	Thu, 28 May 2026 13:47:56 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=VEX1t12L;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id DF92E1D44;
	Thu, 28 May 2026 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779976073;
	bh=vbO1/9DaSO08NTc/fjz7NgKSNkH/Bkgt5EmSceLEdMo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VEX1t12LDU8SbLiANQR0EUFfq6qPnxc0GKQiV23BREvhW2WHKAlmEAEGYkJpZmlz2
	 0gCTWQfj1+7Dzd42giSEh5NDLWfjQOMVntwx2uiuV4u5WVvJljuTBrM6zdOAErYbzX
	 dcbgBP+nask0yi0UPE+dUOLv0Z/xwXg2M26lqErU=
Received: from [192.168.95.128] (172.30.20.180) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 28 May 2026 16:47:52 +0300
Message-ID: <ca07eb43-d758-4c7c-8879-9b097a3514b7@paragon-software.com>
Date: Thu, 28 May 2026 15:47:51 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix out-of-bounds read in ntfs_dir_emit() and
 hdr_find_e()
To: Alessandro Schino <7991aleschino@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>
References: <20260511181516.220-1-7991aleschino@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260511181516.220-1-7991aleschino@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/11/26 20:15, Alessandro Schino wrote:

> [You don't often get email from 7991aleschino@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The bounds check in ntfs_dir_emit() compares fname->name_len (a
> character count) against e->size (a byte count) without accounting
> for the 2-byte-per-character UTF-16LE encoding or the ATTR_FILE_NAME
> header size:
>
>    if (fname->name_len + sizeof(struct NTFS_DE) > le16_to_cpu(e->size))
>
> This computes: name_len + 16 > e_size
>
> The correct check must account for the ATTR_FILE_NAME header (66 bytes
> before the name) and the UTF-16LE character size (2 bytes each):
>
>    sizeof(NTFS_DE) + offsetof(ATTR_FILE_NAME, name) +
>    name_len * sizeof(short) > e_size
>
> Which computes: 16 + 66 + name_len * 2 > e_size
>
> The correct calculation already exists as fname_full_size() in ntfs.h
> and is used in cmp_fnames(), namei.c, and fslog.c, but was not used
> in the readdir path.
>
> A crafted NTFS image with an index entry containing a small e->size
> but large fname->name_len bypasses the current check, causing
> ntfs_utf16_to_nls() to read past the entry boundary.
>
> Additionally, add a key_size validation in hdr_find_e() to ensure the
> declared key_size does not exceed the available entry data, preventing
> comparison functions from reading past entry boundaries on the lookup
> path.
>
> Signed-off-by: Alessandro Schino <7991aleschino@gmail.com>
> ---
>   fs/ntfs3/dir.c   | 4 +++-
>   fs/ntfs3/index.c | 4 ++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
> index d99ab086..6cd66ce0 100644
> --- a/fs/ntfs3/dir.c
> +++ b/fs/ntfs3/dir.c
> @@ -305,7 +305,9 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
>          if (sbi->options->nohidden && (fname->dup.fa & FILE_ATTRIBUTE_HIDDEN))
>                  return true;
>
> -       if (fname->name_len + sizeof(struct NTFS_DE) > le16_to_cpu(e->size))
> +       if (sizeof(struct NTFS_DE) +
> +           offsetof(struct ATTR_FILE_NAME, name) +
> +           fname->name_len * sizeof(short) > le16_to_cpu(e->size))
>                  return true;
>
>          name_len = ntfs_utf16_to_nls(sbi, fname->name, fname->name_len, name,
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 5344b29b..46dc7642 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -754,6 +754,10 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
>   binary_search:
>          e_key_len = le16_to_cpu(e->key_size);
>
> +       /* Validate key_size fits within the entry data area. */
> +       if (e_key_len > le16_to_cpu(e->size) - sizeof(struct NTFS_DE))
> +               return NULL;
> +
>          diff2 = (*cmp)(key, key_len, e + 1, e_key_len, ctx);
>          if (diff2 > 0) {
>                  if (found) {
> --
> 2.43.0
>
Hello,

Your patch was applied, thank you.

Regards,
Konstantin

