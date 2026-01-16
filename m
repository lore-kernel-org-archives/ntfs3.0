Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BCA23D7F7
	for <ntfs3@lists.linux.dev>; Fri, 16 Jan 2026 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570931; cv=none; b=mGuyr5MJvD59Xh7fcJWJ15lBOaJHbMMdpFmA0BDN6+R95cBjNPyLJlUR1sYL/N2PQ+RcUkYtxM4vsQjirxwpkpqg0FHTd57WBPmryXHYYtdB3BY87TIsXUWFs2cMLjEBO2QPkacEJGjJZAOVAYIOdMvN2uCgKt0qNeLTMnjVX2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570931; c=relaxed/simple;
	bh=Gnn0XkXp9h3qFizn/DN2L68DQtpx6ndUNRscMQH4n+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I0SYez1WltZTsrOpLWti1OkwEJ+YzBoyw6qvRLxFqXaxnM0kTCkxjGmGHipdFxuIdI77SXIHT7oaUJqbhSRmiyLMJ2y5V9uKLp5cSmxSFl2sKbQ1Y9l3xI2wyuXESZBjEsnJzz4ty84ZpHr2VQjxW/cgZOQTK+TYy4fam9X2B0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=KKtPkjo1; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="KKtPkjo1"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id F33041D99;
	Fri, 16 Jan 2026 13:39:28 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=KKtPkjo1;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 4B790219B;
	Fri, 16 Jan 2026 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1768570927;
	bh=aV4w0Pi++M+I6AT/2uMj3Gpk1Efx35cTMWB5qLWUhJI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KKtPkjo1sqPU2t2rlwXU0+TBiOPesWLYT3Oz9HMx5lDSHfkfmsfrPz5zBFAnyhvzO
	 AONaIqHOiwDnDfip3IRRaey5Ssa795PB5dc+GEaZCJumF/j7vVRfFlkn9sCrPxCjn8
	 OOBgjEJfPbyywfJyFtwx5ApH2dUX5mkjstaiiY80=
Received: from [192.168.95.128] (172.30.20.155) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 16 Jan 2026 16:42:06 +0300
Message-ID: <b29a7a19-f188-4cb7-8d9c-d03a854311d6@paragon-software.com>
Date: Fri, 16 Jan 2026 14:42:05 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: make ntfs_writeback_ops static
To: <sunliming@linux.dev>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, sunliming
	<sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
References: <20260107073709.106071-1-sunliming@linux.dev>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260107073709.106071-1-sunliming@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 1/7/26 08:37, sunliming@linux.dev wrote:

> From: sunliming <sunliming@kylinos.cn>
>
> Fix below sparse warnings:
> fs/ntfs3/inode.c:972:34: sparse: sparse: symbol 'ntfs_writeback_ops' was not declared.
> Should it be static?
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601061424.nbKLNwC5-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>   fs/ntfs3/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index b969ad7c3258..636aa77e20e4 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -969,7 +969,7 @@ static ssize_t ntfs_writeback_range(struct iomap_writepage_ctx *wpc,
>   }
>   
>   
> -const struct iomap_writeback_ops ntfs_writeback_ops = {
> +static const struct iomap_writeback_ops ntfs_writeback_ops = {
>   	.writeback_range = ntfs_writeback_range,
>   	.writeback_submit = iomap_ioend_writeback_submit,
>   };

Applied, will be sent in the next pull request, thanks.

Regards,
Konstantin

