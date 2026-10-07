Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4F390212
	for <ntfs3@lists.linux.dev>; Wed,  7 Oct 2026 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408841; cv=none; b=kjLnAS9blOjzUEs4NPpANXLKAatnhJbt1q/PaG7njL2BdCyLJt6UclP6kFQQ+pWIPqB5kgfU/U2IyrQn2m9YIOkElhIgnpYjSjniWNFvdDdTBINyubMMGbPXRDi1IrrL2xqnJHaP3LZHv4qsqMVDHcRztHvVnLLEccQMaHdhl7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408841; c=relaxed/simple;
	bh=rblPW1qkjavcbdGw6OT4uAtlRYjuYeOwuL5qAivfnxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GMdcC31GQEWGEJouNLxf0EqHOo194cq4I2m5ud6mnFgcCC8dAiYYA1VSVhrPT3TLX2Ul1y34nMmCQTpg6vJkIsHoHdwiFohdKtLKkwQuQKXQymyqfxduqrMiPRP+lPGw7zH9CBs6MKvmbLCg6XwBNEu7boqPzyoEC9nkEprAZ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=kfJ9xTm9; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="kfJ9xTm9"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 0E4B11D60;
	Wed,  7 Oct 2026 21:34:49 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=kfJ9xTm9;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 75FB921D8;
	Wed,  7 Oct 2026 21:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1791408837;
	bh=R2RvL3BgNVJJFbEEImbQBr4WyxM333mCKTmatnwns98=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kfJ9xTm9VaWt8DSwxiTpPXdmjeFs9E6Z2DZ5HD+sAsp7CuZxx1RkMm5K5U3fPjZtq
	 vvZOF/vuU+JTzmpvkLC/ZgO5ahf/4FUpPv0ivKSJ4/dG7/e6DT7kn93eHEEmWz3vFe
	 DPpQ8izOWZBJdE93WD4F+hZde+JxF7isl6vUI5Ec=
Received: from [192.168.95.128] (172.30.20.178) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 8 Oct 2026 00:33:56 +0300
Message-ID: <4c02fe66-a6b9-4900-a2c9-4a660db263c4@paragon-software.com>
Date: Wed, 7 Oct 2026 23:33:55 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: check return values in indx_delete_entry()
To: Dmitry Morgun <d.morgun@ispras.ru>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
References: <20260712151549.1781-1-d.morgun@ispras.ru>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260712151549.1781-1-d.morgun@ispras.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/12/26 17:15, Dmitry Morgun wrote:

> When the index tree collapses down to an empty root,
> indx_delete_entry() calls attr_set_size() and ni_remove_attr() for
> both ATTR_ALLOC and ATTR_BITMAP, but their return values are
> overwritten by the following call without being checked.
>
> In most other call sites of these functions the return value is
> checked, so add the same checks here in case an error at this point
> is meaningful.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Dmitry Morgun <d.morgun@ispras.ru>
> ---
>   fs/ntfs3/index.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 5344b29b0..c730175d7 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -2619,18 +2619,28 @@ int indx_delete_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
>
>                  err = attr_set_size(ni, ATTR_ALLOC, in->name, in->name_len,
>                                      &indx->alloc_run, 0, NULL, false);
> +               if (err)
> +                       goto out;
> +
>                  if (in->name == I30_NAME)
>                          i_size_write(&ni->vfs_inode, 0);
>
>                  err = ni_remove_attr(ni, ATTR_ALLOC, in->name, in->name_len,
>                                       false, NULL);
>                  run_close(&indx->alloc_run);
> +               if (err)
> +                       goto out;
>
>                  err = attr_set_size(ni, ATTR_BITMAP, in->name, in->name_len,
>                                      &indx->bitmap_run, 0, NULL, false);
> +               if (err)
> +                       goto out;
> +
>                  err = ni_remove_attr(ni, ATTR_BITMAP, in->name, in->name_len,
>                                       false, NULL);
>                  run_close(&indx->bitmap_run);
> +               if (err)
> +                       goto out;
>
>                  root = indx_get_root(indx, ni, &attr, &mi);
>                  if (!root) {
> --
> 2.34.1

Hello,

Your patch is applied, thank you.

Regards,
Konstantin

