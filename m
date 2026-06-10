Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DF72D3A7C
	for <ntfs3@lists.linux.dev>; Wed, 10 Jun 2026 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088189; cv=none; b=OOAyfwsYNzz/Lc8qVgPVzCJEi1uqMgX7LN+hf65Kklkz0jSsKUVa49tc/vRP2nT3aOe+mLoY0Kj3CMjiEQQPkP2BOm/vipX8SRzkLcEkE6dznV3mBCIIthH1xtcAtdf7HBRcvdYMY//X4h0Asi3fEb24/4Vs/n25LQ6QR4Jhzyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088189; c=relaxed/simple;
	bh=NsdrF1VkEiftfitOo+j50BklSMQbt5IaQHJ/XkndWMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s9blEq+x5LbcFT93GT1RAaaTNYtj0+TzGge2UsAvUJnU2s8NT9PzkkLfZ1u0vOCiWsqqCS53aKsHDOu71euhthkkRr4ZJyd/pjC04U+jo3jBDuaepdL95iPwL/xFV9WoNOj3JERoB1aCHq3o5thu3B+h1kwtO2z7TfE2qeAVN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=ZRgqaorz; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="ZRgqaorz"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 71DDF1D44;
	Wed, 10 Jun 2026 10:43:05 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=ZRgqaorz;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 9EB801E0F;
	Wed, 10 Jun 2026 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1781088185;
	bh=0aYf5uNgD1gLxYGYFqzKDnXxsm5lWO9MhiT5dx0VHUo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZRgqaorzXYDGeOnN4B7JYTL/32YN6cvmxIVpLgmG1i0WRfZENmYrALI33qLHodcP6
	 4CdUHhdWxc19gKJeX2GHvhYkPVGcA96fUuwtdo/Op+SCA45XNuyhNpYLbqfDeUqH8k
	 0Z2FMUlltXpsX5Cx/NLyEMFmz73316a7oW47KtPk=
Received: from [192.168.95.128] (172.30.20.172) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 10 Jun 2026 13:43:03 +0300
Message-ID: <590578d7-22b9-46cb-b100-89e1bc4d95e1@paragon-software.com>
Date: Wed, 10 Jun 2026 12:43:01 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: resize log->one_page_buf when adopting on-disk
 page size
To: Jamie Nguyen <jamien@nvidia.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Carol L Soto
	<csoto@nvidia.com>
References: <20260605041930.68817-1-jamien@nvidia.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260605041930.68817-1-jamien@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/5/26 06:19, Jamie Nguyen wrote:

> log_replay() allocates log->one_page_buf using the page size that was
> chosen from the host PAGE_SIZE:
>
>          log->one_page_buf = kmalloc(log->page_size, GFP_NOFS);
>
> Later, when a restart area is found, the log page size recorded on disk
> is adopted:
>
>          t32 = le32_to_cpu(log->rst_info.r_page->sys_page_size);
>          if (log->page_size != t32) {
>                  log->l_size = log->orig_file_size;
>                  log->page_size = norm_file_page(t32, &log->l_size,
>                                                  t32 == DefaultLogPageSize);
>          }
>
> If the on-disk page size is larger than the size used for the initial
> allocation, log->page_size grows but one_page_buf is left at its
> original, smaller size. A subsequent unaligned read_log_page() then
> reads log->page_size bytes into the undersized scratch buffer:
>
>          page_buf = page_off ? log->one_page_buf : *buffer;
>          err = ntfs_read_run_nb_ra(ni->mi.sbi, &ni->file.run, page_vbo, page_buf,
>                                    log->page_size, NULL, &log->read_ahead);
>
> overflowing the allocation. This is reachable when mounting a dirty
> NTFS volume whose log was formatted with a page size larger than the
> buffer initially allocated on the mounting host (for example a 64K-log
> volume mounted on a host that allocated a 4K scratch buffer).
>
> Grow one_page_buf when the adopted on-disk page size exceeds the size
> used for the initial allocation. On krealloc() failure the original
> buffer is left intact and freed by the existing error path.
>
> Fixes: b46acd6a6a627 ("fs/ntfs3: Add NTFS journal")
> Reported-by: Carol L Soto <csoto@nvidia.com>
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> ---
>   fs/ntfs3/fslog.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 95e1cdb47..b44bcfd31 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -3976,9 +3976,28 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
>           */
>          t32 = le32_to_cpu(log->rst_info.r_page->sys_page_size);
>          if (log->page_size != t32) {
> +               u32 old_page_size = log->page_size;
> +
>                  log->l_size = log->orig_file_size;
>                  log->page_size = norm_file_page(t32, &log->l_size,
>                                                  t32 == DefaultLogPageSize);
> +
> +               /*
> +                * If the adopted on-disk page size is larger than the size used
> +                * to allocate one_page_buf above, grow the scratch buffer so a
> +                * later read_log_page() cannot overflow it.
> +                */
> +               if (log->page_size > old_page_size) {
> +                       void *buf;
> +
> +                       buf = krealloc(log->one_page_buf, log->page_size,
> +                                      GFP_NOFS);
> +                       if (!buf) {
> +                               err = -ENOMEM;
> +                               goto out;
> +                       }
> +                       log->one_page_buf = buf;
> +               }
>          }
>
>          if (log->page_size != t32 ||
> --
> 2.43.0
>
Hello,

Your patch was applied, thank you.

Regards,
Konstantin

