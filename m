Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EF026B74A
	for <ntfs3@lists.linux.dev>; Thu, 28 May 2026 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976024; cv=none; b=ieRIthBawsDJ4FfJcRLcFBIa6ci5oXVVzVrzIQYDlJanc6Dq+9fTu5BtbP0P3WTQt0zM4GeS5WSrT0luuqvLuN51sD5uUi8Sd2ztE/lot0+G4kC3fwyZL/kbdqfNr1oHPlpkYA7EqQir8PRGsRA8CEz1uHYAPUZLS+5x73iUrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976024; c=relaxed/simple;
	bh=84lhFRBxD6Y8KstPkBt29palFDnIvXbo2795gnZRLyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BLuwD8Lz46A/SY6ukyIP1uyA3HT7OcGvb6tiCXTjoVP0nZxhBNUjQxr+vSghPRLTYNGhvjkVJ+TpwLSfKqboYUmhJEYC4FGWwDFp3E4ousZMVmaoSGv2XTBo7xCDT4IUCtW+kzRsjhivH6ZcQ162WFC05dpVESdpOfBaCC6lRxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=B2XoIDtl; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="B2XoIDtl"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 8505326;
	Thu, 28 May 2026 13:46:57 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=B2XoIDtl;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 370301D44;
	Thu, 28 May 2026 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779976015;
	bh=sfRmNJG2kGxXXjbc3lQfgUOAi8LDVl+CQMreXypjIL0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=B2XoIDtlMcCB4Vu5nHjC18nSbL8NX60mqXbd3olEigS4avRhIWSbKqzyNABqP6Z2O
	 82WJKIc6NLkut3CbF4sF1fzUnUTVlmxxB25Gi7NMlcSisVUoqfwgoXjzWzpbNQv3vD
	 ZqPvBJxKj21ec/JfnFWNFKL0Ay1irZQ2pz4AIC9Y=
Received: from [192.168.95.128] (172.30.20.180) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 28 May 2026 16:46:54 +0300
Message-ID: <e3845163-90e6-4565-bf12-5b499ae4cbfa@paragon-software.com>
Date: Thu, 28 May 2026 15:46:52 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ntfs3: Allocate iomap inline_data using alloc_page
To: Mihai Brodschi <m.brodschi@gmail.com>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <d3fd7e93-748c-4e51-ace9-a0f0a8346045@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <d3fd7e93-748c-4e51-ace9-a0f0a8346045@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/11/26 19:19, Mihai Brodschi wrote:

> [You don't often get email from m.brodschi@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> This fixes a BUG reported in iomap_write_end_inline:
> iomap_inline_data_valid checks that the inline_data fits within
> a page. If the inline_data is allocated with kmemdup there's no
> guarantee that it's page-aligned, so the check sometimes fails.
> Allocate it with alloc_page to ensure it's page-aligned.
>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221446
> Signed-off-by: Mihai Brodschi <m.brodschi@gmail.com>
> Fixes: 099ef9a ("fs/ntfs3: implement iomap-based file operations")
> ---
> V3: fix variable declaration
> V2: fix mail formatting
>
>   fs/ntfs3/attrib.c | 10 +++++++---
>   fs/ntfs3/inode.c  |  4 ++--
>   2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index e61c5bf7e27e..ff0bf4575948 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1004,6 +1004,7 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
>          struct ATTRIB *attr, *attr_b;
>          struct ATTR_LIST_ENTRY *le, *le_b;
>          struct mft_inode *mi, *mi_b;
> +       struct page *page;
>          CLST hint, svcn, to_alloc, evcn1, next_svcn, asize, end, vcn0;
>          CLST alloc, evcn;
>          unsigned fr;
> @@ -1042,10 +1043,13 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
>                  *lcn = RESIDENT_LCN;
>                  *len = data_size;
>                  if (res && data_size) {
> -                       *res = kmemdup(resident_data(attr_b), data_size,
> -                                      GFP_KERNEL);
> -                       if (!*res)
> +                       page = alloc_page(GFP_KERNEL);
> +                       if (!page) {
>                                  err = -ENOMEM;
> +                       } else {
> +                               *res = page_address(page);
> +                               memcpy(*res, resident_data(attr_b), data_size);
> +                       }
>                  }
>                  goto out;
>          }
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 42af1abe17f8..031f85fd53d4 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -801,7 +801,7 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>
>          if (lcn == RESIDENT_LCN) {
>                  if (offset >= clen) {
> -                       kfree(res);
> +                       __free_page(virt_to_page(res));
>                          if (flags & IOMAP_REPORT) {
>                                  /* special code for report. */
>                                  return -ENOENT;
> @@ -921,7 +921,7 @@ static int ntfs_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>
>   out:
>          if (iomap->type == IOMAP_INLINE) {
> -               kfree(iomap->private);
> +               __free_page(virt_to_page(iomap->private));
>                  iomap->private = NULL;
>          }
>
> --
> 2.53.0
>
Hello,

Your patch was applied, thank you.

Regards,
Konstantin

