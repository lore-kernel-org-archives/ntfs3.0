Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A8372ECB
	for <ntfs3@lists.linux.dev>; Fri, 14 Aug 2026 06:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690529; cv=none; b=oKqqbHH3O/m7lOhKJdO+xoiEft3Vm39tpItIZqKynf+YabMeocCYsAy5HRVXmUCTkbXJqUQ5q6XfM3M1lzU2jGvpCk+kuSIlNe5lGhbpqBTOygFdeeyVYQDVS8no0huShvPzqB9xyeNe7XInhgwhypjNSky9uZ8L1Lmf9b3+vUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690529; c=relaxed/simple;
	bh=B0L+WlDagP/HdLud1+hXMQ6A8oqOmfUcdwP1aDvFYds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Afas5bE10yDDs/XVJDiVf39ibLZQeJD2DikcY52vaBAuiJrOcUlTXlIu6do62levwtpUSz/rkdJzNhitceIE+3LSc0fJrh8XRa6qwGMubge0kr2TC5V7vGu7Mjqzii2H05AsOqfe1Hb6jfw6LEf2JgNOk/XrBMavK3LQ2UB4RCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=lTXd4RBp; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="lTXd4RBp"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5ED3131;
	Fri, 14 Aug 2026 06:56:10 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=lTXd4RBp;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 14DB71E0A;
	Fri, 14 Aug 2026 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1786690526;
	bh=0PHrz7CXykyIP5coCCUHmLucifYC8REpCd/7AnC7Vj4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lTXd4RBp4kTVBVucNYnLq08fUJOSpgapds1f/G1LQd0aVctojW0VCobvkqxuwOcWV
	 B2k66+4LCe+TKJGkSYx9yOrz9UVvm6H3liy2qjVRiKU0yuZ2bE/S5bRnPrp/Z7Nh9d
	 ZuEsAWunQJGsaAMHI1eG9JIgDs4YFzEAiz5cEMoA=
Received: from [192.168.95.128] (172.30.20.208) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 14 Aug 2026 09:55:25 +0300
Message-ID: <0c29897d-3f80-4223-978c-019411bd7b7e@paragon-software.com>
Date: Fri, 14 Aug 2026 08:55:23 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix integer overflow in MFT cluster validation
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>
References: <20260624034133.57049-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260624034133.57049-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/24/26 05:41, Zhan Xusheng wrote:

> In ntfs_init_from_boot(), the boot sector's MFT cluster numbers are
> validated against the volume size with:
>
> 	if (mlcn  * sct_per_clst >= sectors ||
> 	    mlcn2 * sct_per_clst >= sectors)
> 		goto out;
>
> mlcn and mlcn2 are u64 fields read directly from the boot sector.
> sct_per_clst is bounded above by 4096 (true_sectors_per_clst() plus
> the is_power_of_2() check below it), but the multiplication is done
> in u64 and wraps when mlcn (or mlcn2) is large enough -- e.g. mlcn
> near 2^62 with sct_per_clst == 4 wraps to 0, which compares below
> any non-zero 'sectors', so the check is bypassed and the malformed
> record is accepted.
>
> The accepted mlcn is then used unchanged in
>
> 	sbi->mft.lbo = mlcn << cluster_bits;
>
> In practice the resulting reads fail at the block layer (sb_bread()
> returns NULL via grow_buffers()'s check_mul_overflow() guard), so
> today this manifests as mount failing in odd places rather than as
> something more dangerous, but the validation step is still wrong
> and there is no reason for callers to rely on the block layer to
> catch a value that should never have been accepted in the first
> place.
>
> Use check_mul_overflow() to compute the two sector positions and
> fail the mount if either multiplication wraps; this preserves the
> existing semantics (mlcn * sct_per_clst >= sectors) instead of
> switching to division (mlcn >= sectors / sct_per_clst), which
> would tighten the check at edge cases where 'sectors' is not a
> multiple of sct_per_clst.  The check_*_overflow() style is the
> one ntfs3 already uses for similar on-disk arithmetic in
> fs/ntfs3/run.c.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>   fs/ntfs3/super.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 3305fe406cb2..4205a212154b 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -65,6 +65,7 @@
>   #include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/nls.h>
> +#include <linux/overflow.h>
>   #include <linux/proc_fs.h>
>   #include <linux/seq_file.h>
>   #include <linux/statfs.h>
> @@ -957,7 +958,7 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>   	struct ntfs_sb_info *sbi = sb->s_fs_info;
>   	int err;
>   	u32 mb, gb, boot_sector_size, sct_per_clst, record_size;
> -	u64 sectors, clusters, mlcn, mlcn2, dev_size0;
> +	u64 sectors, clusters, mlcn, mlcn2, mft_pos, mft2_pos, dev_size0;
>   	struct NTFS_BOOT *boot;
>   	struct buffer_head *bh;
>   	struct MFT_REC *rec;
> @@ -1026,7 +1027,15 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>   	mlcn2 = le64_to_cpu(boot->mft2_clst);
>   	sectors = le64_to_cpu(boot->sectors_per_volume);
>   
> -	if (mlcn * sct_per_clst >= sectors || mlcn2 * sct_per_clst >= sectors) {
> +	/*
> +	 * Convert mlcn/mlcn2 to sector positions before comparing with
> +	 * 'sectors'.  All three are u64 values that come from the boot
> +	 * sector, so use check_mul_overflow() to keep a wraparound from
> +	 * silently bypassing the comparison.
> +	 */
> +	if (check_mul_overflow(mlcn, (u64)sct_per_clst, &mft_pos) ||
> +	    check_mul_overflow(mlcn2, (u64)sct_per_clst, &mft2_pos) ||
> +	    mft_pos >= sectors || mft2_pos >= sectors) {
>   		ntfs_err(
>   			sb,
>   			"%s: start of MFT 0x%llx (0x%llx) is out of volume 0x%llx.",

Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

