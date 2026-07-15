Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE83AEF2A
	for <ntfs3@lists.linux.dev>; Wed, 15 Jul 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134966; cv=none; b=ApsNn6A9Xk7YEHV9sx7sIIJohpyFUcafxN83yl6kEFE+pempiKXKGMrPTl+0x8dxaKYHwx0iPhmTgXqMNFkvXyIbw4erjMaNpD91HP4KruZi/+EhvpGrlevRMTrTIErUS3UAcVV2a/xI2uJdbu8jR7hatiVXcmM9GJM5MwQcjeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134966; c=relaxed/simple;
	bh=BI0XhsLqSJe08rHVtij805zW0T1v14CvZ2CQT4FDKZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sbanFkkJkSw+YIAIpXDTIxgNVOWMAIcNl9IAW/4MI0RO72+9cVUQUYG4/vK6BPM9nYmR3hfC7rLhFP26x/AhgD6lOoJc52F8BumIGgbhuVLZP79wvxIqySBCJCHgyfPUJwJ6ePLfJf4xaIR7icniWjej6Qx+/LS4UgOdg7lbDxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=PD0wBZY8; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="PD0wBZY8"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id AEE0F3AC;
	Wed, 15 Jul 2026 17:02:53 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=PD0wBZY8;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 494B41D36;
	Wed, 15 Jul 2026 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784134959;
	bh=e7jgMcGfquDye3jeEmCCvgV+Xy1UJVgDIKa3mWiGdqM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PD0wBZY8FxZ1hGGWCkRT5FLNSVIMXfA+fEI7jXnt76d33Hb9JrCgUvC3cFQesN8On
	 IKcczh1y5tD4fOHmaSrLlx7s5R34O8NYeD5+iZVrcPGcv7ueMU8xGf3R5Hi7tXSqAS
	 J4hwqIqLQ7ZhUY3/tfvcEMljALy3vYAviQpsjlC4=
Received: from [192.168.95.128] (172.30.20.151) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Jul 2026 20:02:38 +0300
Message-ID: <8ae7b6fe-bb13-4019-9e13-c60a5bb2f3f8@paragon-software.com>
Date: Wed, 15 Jul 2026 19:02:37 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: load ATTR_BITMAP run extents from $MFT
 extension records
To: <senjin@hatchling.org>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>
References: <6a28fa14873307c15d283e52@mailersend.net>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <6a28fa14873307c15d283e52@mailersend.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/10/26 07:45, Senjin wrote:

> When $MFT's ATTR_BITMAP attribute is heavily fragmented, its run list
> can span multiple MFT extension records (attribute list entries with
> vcn > 0). The non-primary segment handler in ntfs_read_mft() only
> processed ATTR_DATA extension segments for MFT_REC_MFT, silently
> skipping any ATTR_BITMAP segments. This left sbi->mft.bitmap.run
> incomplete, causing wnd_init() to fail with -ENOENT when wnd_rescan()
> tried to look up a VCN not covered by the truncated run list.
>
> Observed on a 16 TB NTFS volume (0xFFFFFEFF total clusters) whose MFT
> bitmap run list was split across 97 extents in extension records.
> wnd_rescan() successfully looked up VCNs 0-122 from the runs loaded
> from the base record, then failed at VCN 123 (the last cluster of the
> bitmap) whose run was only present in an extension record.
>
> Fix by extending the MFT_REC_MFT special case to also handle
> ATTR_BITMAP extension segments, storing their runs into
> sbi->mft.bitmap.run the same way the primary segment does.
>
> Signed-off-by: Senjin <senjin@hatchling.org>
> ---
>   fs/ntfs3/inode.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index XXXXXXX..XXXXXXX 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -128,11 +128,16 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>
>          if (le && le->vcn) {
>                  /* This is non primary attribute segment. Ignore if not MFT. */
> -               if (ino != MFT_REC_MFT || attr->type != ATTR_DATA)
> +               if (ino != MFT_REC_MFT)
>                          goto next_attr;
>
> -               run = &ni->file.run;
> +               if (attr->type == ATTR_DATA)
> +                       run = &ni->file.run;
> +               else if (attr->type == ATTR_BITMAP)
> +                       run = &sbi->mft.bitmap.run;
> +               else
> +                       goto next_attr;
> +
>                  asize = le32_to_cpu(attr->size);
>                  goto attr_unpack_run;
>          }
> --
> 2.x

Hello,

Very sorry for the delay.
Your patch is applied, thanks.

Regards,
Konstantin

