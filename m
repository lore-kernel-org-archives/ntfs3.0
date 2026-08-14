Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A03372ECB
	for <ntfs3@lists.linux.dev>; Fri, 14 Aug 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690620; cv=none; b=lPxYjU2W+u1/SHVfdWevlMWSM1EC4rqZh284WCFwV1R+1z+ky/w9yAAZLhDRrm4eFA/8BcImrsrhrtw/PAWyk4mJmgKL4ryCpUhHXX0+GQ03J2cDPGSPBS8N9HMOxQBFjAWGRyyWEjYkYwMgJxAX3u/JWFppjU9PvKq9Y5FrPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690620; c=relaxed/simple;
	bh=0c6k4nsV4T9x8MqRFFtgsLfZlAF2qI3QZvFUdIl1jjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uQQ4EQiBuvZgnJEUm53kNZpIpwYoTiApyBy3OrESzv55v2tK+8FG9zsn7C+PevD8xJXbPihsy78mtSpwldCaUBt8rpzUfl0rxObboBn7Wfmxe/O6qoFgcaoAOyfRo+KmKfeb1IfOyP6pDFxzVfx4SMcD7zLr+jrJthu7Nv411sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=RrLAUukt; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="RrLAUukt"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 57DE131;
	Fri, 14 Aug 2026 06:57:41 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=RrLAUukt;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 0E7A71E0A;
	Fri, 14 Aug 2026 06:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1786690617;
	bh=czEAR8YkX8BbUy2QHzSDlaJji3AjACiXCJSxSMPlS5g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RrLAUukthAcJXifd3XR439Jp4UyFG0iMbZnJHPWl4UX+SMde4kAas/fLkvcBx+Lje
	 aEug55ru2yC35SLsbzJRXofl093Dwkx4oP2dzzrDvuDN6K6Fz9mMNivqkf5ntZGX+8
	 ECUIutwU//eQFsHFjzd29wW6uHRYcg5f/iNHpXsI=
Received: from [192.168.95.128] (172.30.20.208) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 14 Aug 2026 09:56:56 +0300
Message-ID: <18b02c9a-5754-4588-a91c-e60b91815117@paragon-software.com>
Date: Fri, 14 Aug 2026 08:56:54 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: validate ef->size covers the record's name and
 value
To: Weiming Shi <bestswngs@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Xiang Mei <xmei5@asu.edu>
References: <20260625040036.996396-3-bestswngs@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260625040036.996396-3-bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/25/26 06:00, Weiming Shi wrote:

> [You don't often get email from bestswngs@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> When an EA record has a non-zero ef->size, ntfs_read_ea() only checks
> that the record fits in the remaining buffer (ea_size > bytes), not that
> ef->size is large enough to hold the record's own name_len + 1 + elength.
>
> A crafted image can pass validation with, e.g., ef->size = 24 but
> elength = 0xffff. ntfs_get_ea() then trusts elength and copies it out of
> the undersized record, reading past the kmalloc(info->size) allocation
> and leaking heap memory to userspace via getxattr():
>
>   BUG: KASAN: slab-out-of-bounds in ntfs_get_ea (fs/ntfs3/xattr.c:302)
>   Read of size 65535 at addr ffff888100794550 by task exploit
>    __asan_memcpy (mm/kasan/shadow.c:105)
>    ntfs_get_ea (fs/ntfs3/xattr.c:302)
>    ntfs_getxattr (fs/ntfs3/xattr.c:848)
>    __vfs_getxattr (fs/xattr.c:441)
>    vfs_getxattr (fs/xattr.c:474)
>    do_getxattr (fs/xattr.c:800)
>    path_getxattrat (fs/xattr.c:868)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:94)
>
>   The buggy address is located 80 bytes inside of
>    allocated 84-byte region in cache kmalloc-96
>
> Compute the size the record needs and require ef->size to cover it.
>
> Fixes: 0e8235d28f3a ("fs/ntfs3: Check fields while reading")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   fs/ntfs3/xattr.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 9eeac0ab2b71..9097ded7d7dc 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -146,26 +146,29 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
>          for (off = 0; off < size; off += ea_size) {
>                  const struct EA_FULL *ef = Add2Ptr(ea_p, off);
>                  u32 bytes = size - off;
> +               size_t need;
>
>                  /* Check if we can use field ea->size. */
>                  if (bytes < sizeof(ef->size))
>                          goto out1;
>
> +               /* Check if we can use fields ef->name_len and ef->elength. */
> +               if (bytes < offsetof(struct EA_FULL, name))
> +                       goto out1;
> +
> +               /* Size needed to hold this record's name and value. */
> +               need = struct_size(ef, name,
> +                                  1 + ef->name_len + le16_to_cpu(ef->elength));
> +
>                  if (ef->size) {
>                          ea_size = le32_to_cpu(ef->size);
> -                       if (ea_size > bytes)
> +                       /* ef->size must fit the list and cover the record. */
> +                       if (ea_size > bytes || ea_size < need)
>                                  goto out1;
>                          continue;
>                  }
>
> -               /* Check if we can use fields ef->name_len and ef->elength. */
> -               if (bytes < offsetof(struct EA_FULL, name))
> -                       goto out1;
> -
> -               ea_size = ALIGN(struct_size(ef, name,
> -                                           1 + ef->name_len +
> -                                                   le16_to_cpu(ef->elength)),
> -                               4);
> +               ea_size = ALIGN(need, 4);
>                  if (ea_size > bytes)
>                          goto out1;
>          }
> --
> 2.43.0

Hello,

Sorry for the delay.
The patch was applied, thanks.

Regards,
Konstantin

