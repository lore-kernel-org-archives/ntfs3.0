Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E17400969
	for <ntfs3@lists.linux.dev>; Tue, 28 Jul 2026 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232442; cv=none; b=th+YdCvB4D2DZtk0Q7zSXu/TbU32j3mAVcAKqmG3iGT5kos0J3Y+pTYyTNgl5FQmUP6Ub4Qmyyd/4+3J06pAvzbSRsE4C6ZWGV4YIF4BbzdeXEqZDkiiPIziZMMawPPV02SME7VTQ+dqQpcwE6mL2jDrPUP60ilmIxi/wYUx+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232442; c=relaxed/simple;
	bh=Dd1JQ+QKxa8H4+LQRY/kOxdfnSv6l9a8PvNV95sbaDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gWIf7BgUtc+seEpVN4V0oE7NxhJgVYCsyagJezDsgy0nOpnrDq5JF3fEtEGFCoVrZc0dfHh5cpfE1q2N5YBgbiPyiyR3bxrNGnWDyasUzkUwD+AnBLXN2X0hhlGIWDUNU1zjIVU16zO2tzh1WOFQnfr9VIZPP9PnaBMwn3SdfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=c3eYOVOc; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="c3eYOVOc"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 564B61D27;
	Tue, 28 Jul 2026 09:54:24 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=c3eYOVOc;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 699A621A9;
	Tue, 28 Jul 2026 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1785232439;
	bh=POEFTTmK3eeOFdfhHR6Bsjwle3TuPm4gdA25oefw7To=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c3eYOVOc4Pq8/c/IiE4nO6fjRx7/kJ7QJmF7zoC0kMWNcB6OF+6kxmmz/x+eyYfp5
	 bA3vm8O/rL9EbadjY9bWOB6w5QmeM5RKylS62fLMHdeSYmV60SWv4quk8IJ9Dzty5C
	 HRPU3FRTCodSAuzoXjGP4TmYpBOOYJsPgyNaC01Y=
Received: from [192.168.95.128] (172.30.20.199) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 28 Jul 2026 12:53:58 +0300
Message-ID: <ab6feb90-2a8b-438e-b49b-cd30cf9ebecc@paragon-software.com>
Date: Tue, 28 Jul 2026 11:53:56 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: reject restart table growth beyond U16_MAX
 entries
To: Weiming Shi <bestswngs@gmail.com>, <ntfs3@lists.linux.dev>
CC: Xiang Mei <xmei5@asu.edu>, <linux-kernel@vger.kernel.org>
References: <20260623101434.1321291-2-bestswngs@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260623101434.1321291-2-bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/23/26 12:14, Weiming Shi wrote:

> During $LogFile replay, log_replay() indexes the transaction table by the
> transact_id taken from the log record header.  check_log_rec() only
> verifies that transact_id is non-zero and properly aligned, not its
> magnitude, so a crafted image can request an arbitrarily large index.
>
> alloc_rsttbl_from_idx() grows the table to cover that index via
> extend_rsttbl(), which passes the new entry count to init_rsttbl():
>
>          rt = init_rsttbl(esize, used + add);
>
> used + add is computed as u32 but init_rsttbl() takes a u16, and the
> count is stored in struct RESTART_TABLE as a __le16.  When used + add
> exceeds U16_MAX it is truncated, init_rsttbl() allocates a table far
> smaller than the index requires, and alloc_rsttbl_from_idx() then
> dereferences and writes at the original, untruncated offset -- an
> out-of-bounds access past the allocation, reachable by mounting a
> crafted NTFS image.
>
>   BUG: KASAN: use-after-free in alloc_rsttbl_from_idx (fs/ntfs3/fslog.c:950)
>   Read of size 4 at addr ffff8880327ffff8 by task exploit
>    alloc_rsttbl_from_idx (fs/ntfs3/fslog.c:950)
>    log_replay (fs/ntfs3/fslog.c:4562)
>    ntfs_loadlog_and_replay (fs/ntfs3/fsntfs.c:324)
>    ntfs_fill_super (fs/ntfs3/super.c:1393)
>    get_tree_bdev_flags
>    vfs_get_tree
>    path_mount
>    __x64_sys_mount
>
> A restart table is limited to U16_MAX entries by its __le16 count, so a
> larger growth request is invalid input.  Reject it in extend_rsttbl();
> all callers already handle a NULL return.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   fs/ntfs3/fslog.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index f038c799e7ac..78f34442aaaa 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -853,6 +853,9 @@ static inline struct RESTART_TABLE *extend_rsttbl(struct RESTART_TABLE *tbl,
>          u32 used = le16_to_cpu(tbl->used);
>          struct RESTART_TABLE *rt;
>
> +       if (used + add > U16_MAX)
> +               return NULL;
> +
>          rt = init_rsttbl(esize, used + add);
>          if (!rt)
>                  return NULL;
> --
> 2.43.0
>
Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

