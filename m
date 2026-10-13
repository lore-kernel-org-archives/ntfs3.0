Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070A7414410
	for <ntfs3@lists.linux.dev>; Tue, 13 Oct 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899551; cv=none; b=aPXSIJGRKTUV9GI0NhYz/1Cxq1+HKwg3c2lZIlJB3JUXdc0u9EzNLtLNNTLNZI3hhAcJ3ht33Rcgl2EUKMnCHaDGsTcVcN91PNKi4GxVsBAAGT5eOq04s1bTGI01VwDDngVDCeFYUWxzmg5MrlyA/2DeMvH9QOrlJA7lfafNRWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899551; c=relaxed/simple;
	bh=LA/ON4mvnyL9qAtKe3djo6j1Tyb1KenG13AxLxTPEbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PSpRosR/mvGSCnAEJVxrx0o2QwVYZKsaF1PTZBsl4BjaYo6wh/caoKyZ1I3PV+6WYlLquaQbSe2Zkv7DSBHf1JR9bpPf8AQd0NQaRfJ54GzBy7lXeVly6qPrYEBn6WPEXEyLR4v4/t0RF5SzvUwH2xyqLBgcDIEIkONCrePyf7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=K2nRsD6+; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="K2nRsD6+"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 88EE01D47;
	Tue, 13 Oct 2026 13:53:18 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=K2nRsD6+;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 15D62215F;
	Tue, 13 Oct 2026 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1791899548;
	bh=fGtOGmaltL4uCN70fvMQMib8tGEzluH/V6LmozaXO7s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=K2nRsD6+/auQPOdWmg+V00EeaJTqTC7gVQKQYv205jiKgJAfN5iYiXCMfhPcmYLn8
	 uFj6ffwc4bcdrUNrWHz2ab4bhUDm0PZo+RjjO8tp+j2lUZtf9IN//LU2ayES16oy5Y
	 G82vog6mX5iqrx+r2UobYQ6r1e4X/ypgk5BG+0NQ=
Received: from [192.168.95.128] (172.30.20.169) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 13 Oct 2026 16:52:27 +0300
Message-ID: <3a3fbd98-8954-4fc5-998c-e32a1d298864@paragon-software.com>
Date: Tue, 13 Oct 2026 15:52:25 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix ntfs_fnd leak when compare function is
 missing
To: <dayou5941@163.com>
CC: <ntfs3@lists.linux.dev>, liyouhong <liyouhong@kylinos.cn>
References: <20260729064932.1104576-1-dayou5941@163.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260729064932.1104576-1-dayou5941@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/29/26 08:49, dayou5941@163.com wrote:

> From: liyouhong <liyouhong@kylinos.cn>
>
> indx_insert_entry(), indx_delete_entry() and indx_update_dup() take a
> finder via fnd_get() before calling get_cmp_func().  If no compare
> function is available they return -EINVAL and never release the finder.
>
> Jump to the existing out path so fnd_put() still runs.
>
> Fixes: 3a2141b2f1c3 ("fs/ntfs3: resolve compare function in public index APIs")
> Signed-off-by: liyouhong <liyouhong@kylinos.cn>
> ---
>   fs/ntfs3/index.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 2b439ac04356..8e3cf28b5257 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -2048,7 +2048,8 @@ int indx_insert_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
>          cmp = get_cmp_func(root);
>          if (unlikely(!cmp)) {
>                  WARN_ON_ONCE(1);
> -               return -EINVAL;
> +               err = -EINVAL;
> +               goto out;
>          }
>
>          if (fnd_is_empty(fnd)) {
> @@ -2406,7 +2407,8 @@ int indx_delete_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
>          cmp = get_cmp_func(root);
>          if (unlikely(!cmp)) {
>                  WARN_ON_ONCE(1);
> -               return -EINVAL;
> +               err = -EINVAL;
> +               goto out;
>          }
>
>          /* Locate the entry to remove. */
> @@ -2787,7 +2789,8 @@ int indx_update_dup(struct ntfs_inode *ni, struct ntfs_sb_info *sbi,
>          cmp = get_cmp_func(root);
>          if (unlikely(!cmp)) {
>                  WARN_ON_ONCE(1);
> -               return -EINVAL;
> +               err = -EINVAL;
> +               goto out;
>          }
>
>          /* Find entry in directory. */
> --
> 2.25.1

Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

