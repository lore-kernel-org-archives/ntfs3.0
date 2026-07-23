Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E443BDB9
	for <ntfs3@lists.linux.dev>; Thu, 23 Jul 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784816857; cv=none; b=AD1o8Dd8h1OswMuWC+6tPt+R0u5hftdxUCnEHE+jRiisQSd5ut2qxD3qfNy+OpTiQsbxdYauGcTGLBd7qoztjQuLEAi6TTjWyU2FCWaEdDuuoiygECRQuV5dPSAB+XVppon1AtJr0xjR9tdO8IrwToxYVZT5c+EVxHoBxRa0L4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784816857; c=relaxed/simple;
	bh=+rO4woQsJQo01j2oI+s8+ALhZfkSDr9CnJTRoKs9Oiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=prIof9K/GeuxBAfywqJ4IuQZzK9dajkvcNLhwQdxrJSZAcjPiwAeMxiHhzaqr8Ali+au/gkfNxpSTIBB7vwf3QxtY/F44gCF+4mAWo8nGLywW2geBjs4T+yCpMGnFfm2lQrEF6HSwmySCiI6vAoDns8lzeuwOIFUm2nmWFCZjRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=OllOTUs+; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="OllOTUs+"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 4295B1D3E;
	Thu, 23 Jul 2026 14:27:53 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=OllOTUs+;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id D318221D8;
	Thu, 23 Jul 2026 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784816853;
	bh=Uk5Sn35pm8vUnLtKdgRNGxjhbg8trNqdjJJThjG9kEg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OllOTUs+YxbMYutDNjdfj6tg9rg5X1A4Etq41FhN0wh6OCQMH5fAcE7LIsHXy9DnA
	 OuwMTt3VQLNar8kXD0UEt4ZlHn0H1LxBpMKJMFrYRzTPtbWPnaxCeFevnpazBFgv+C
	 JwiZ4xSSVw5PCFB2sJGpVTlOAJzdg9DH0zMauOR0=
Received: from [192.168.95.128] (172.30.20.182) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 23 Jul 2026 17:27:33 +0300
Message-ID: <7639573a-0fee-4c80-a933-934209d0f20b@paragon-software.com>
Date: Thu, 23 Jul 2026 16:27:31 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fs/ntfs3: fix lseek EINVAL on sparse/compressed
 files with 64-bit clusters
To: <senjin@hatchling.org>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>
References: <20260613201610.14467-1-senjin@hatchling.org>
 <6a2dba8e080686532f1bf560@mailersend.net>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <6a2dba8e080686532f1bf560@mailersend.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/13/26 22:16, Senjin wrote:

> When CONFIG_NTFS3_64BIT_CLUSTER is enabled, sbi->maxbytes_sparse is set
> to -1. As a signed loff_t this is -1LL, the most negative value. Any
> lseek on a sparse or compressed file passes this as maxsize to
> vfs_setpos(), which returns -EINVAL whenever offset > maxsize, and
> since -1LL is less than any non-negative offset, every seek fails,
> including lseek(fd, 0, SEEK_SET).
>
> The intent of -1 here appears to be "no limit" (matching the spirit of
> MAX_LFS_FILESIZE assigned to sbi->maxbytes and sb->s_maxbytes in the
> same block), but the signed type makes it the minimum instead of the
> maximum.
>
> Fix by assigning MAX_LFS_FILESIZE to sbi->maxbytes_sparse in the
> 64-bit cluster path, consistent with the other two limits set there.
>
> Observed on a 16 TB NTFS volume with 0xFFFFFEFF total clusters compiled
> with CONFIG_NTFS3_64BIT_CLUSTER=y. Sequential reads via dd/cp worked
> correctly; any lseek call on sparse files returned EINVAL, preventing
> archive managers and other tools from random-accessing files on the
> volume. The non-64-bit-cluster path correctly sets maxbytes_sparse to
> (1ull << (cluster_bits + 32)) - 1, a large positive value.
>
> Signed-off-by: Senjin <senjin@hatchling.org>
> ---
>   fs/ntfs3/super.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index XXXXXXX..XXXXXXX 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1193,7 +1193,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>   #ifdef CONFIG_NTFS3_64BIT_CLUSTER
>          if (clusters >= (1ull << (64 - cluster_bits)))
>                  sbi->maxbytes = -1;
> -       sbi->maxbytes_sparse = -1;
> +       sbi->maxbytes_sparse = MAX_LFS_FILESIZE;
>          sb->s_maxbytes = MAX_LFS_FILESIZE;
>   #else
>          /* Maximum size for sparse file. */
> --
> 2.x

Hello,

Sorry for the delay.
Your patch is applied, thank you.

Regards,
Konstantin

