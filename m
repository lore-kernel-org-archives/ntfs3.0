Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B82F3D7D7E
	for <ntfs3@lists.linux.dev>; Fri, 14 Aug 2026 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690487; cv=none; b=uv/0fjtsOz+IsT/MAoFin0C4ljzJTGto4MyYlmKWdjHZcW7QHXQnI9Wa0qjb8ierJjT397nmKZIPVtPJams4vR0kJrRjX2h9j2hS+i6il/v2bLTf2V3etsVuiUptGmw+SBF9CIDLjWI8PDUxHEQ7Hs7RuMsB/haiLzeFljY3Qww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690487; c=relaxed/simple;
	bh=fL1J4zANU8qGbZoIes1gJDvH5j5nF4nYJUIBvKeg/zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tNXRr6TNGiEpuQ+gScmIte+wlh4HMxmL6qU5ARLCif3+Vv5VRsN6zB9qOVMpNgLyW46Wz8IVyHLBbtbXL6SakL5iLPO68FDLIoHlS98IBNCvyBI0NMvdHTzE60QoD0zLk1YmIumt/MQjMtC7TzItLqoolP5tvsggkTAmJv+RE/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Bsuj5G5y; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Bsuj5G5y"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 40C8E31;
	Fri, 14 Aug 2026 06:55:27 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Bsuj5G5y;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C37A61E0A;
	Fri, 14 Aug 2026 06:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1786690481;
	bh=VsH60Egb6D60pSD6PasVM2TUFA54EXsqVxcRBLPoTME=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Bsuj5G5y6hHW31KCOjrHZIIVR8Jft+Hz+mZRK9N2u3nzRklB+v7hYiCPagJuZIkVW
	 Sg5zbIF2AW06VRQ66WgAumz9fOgMbor4sMVNQg4TR4ozTJE9RgNM/eMWDVvnQSImpk
	 4pTduI+rxRmjTppNyIcKZgSv/2PCGKQ5BSbkP8LQ=
Received: from [192.168.95.128] (172.30.20.208) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 14 Aug 2026 09:54:40 +0300
Message-ID: <b79286e5-05ef-4bff-bcfc-ed33c15ede43@paragon-software.com>
Date: Fri, 14 Aug 2026 08:54:39 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()
To: Weiming Shi <bestswngs@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Xiang Mei <xmei5@asu.edu>
References: <20260623062230.1236506-2-bestswngs@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260623062230.1236506-2-bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/23/26 08:22, Weiming Shi wrote:

> [You don't often get email from bestswngs@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> read_log_rec_buf() copies a log record into a caller buffer starting at
>
>          u32 off = lsn_to_page_off(log, lsn) + log->record_header_len;
>
> log->record_header_len (and log->data_off, used for the following pages)
> comes verbatim from the on-disk restart area and is only checked for
> 8-byte alignment in is_rst_area_valid(), so off can exceed
> log->page_size. "tail = log->page_size - off" then underflows and
> memcpy() reads past the page_size-sized buffer returned by
> read_log_page(), spilling adjacent slab memory into the replay buffer.
>
> This is reachable by mounting a crafted NTFS image:
>
>   BUG: KASAN: slab-out-of-bounds in read_log_rec_buf+0x216/0x580
>   Read of size 64 at addr ffff88800a877ff8 by task exploit/127
>    read_log_rec_buf fs/ntfs3/fslog.c:2299
>    log_replay fs/ntfs3/fslog.c:4216
>    ntfs_loadlog_and_replay fs/ntfs3/fsntfs.c:324
>    ntfs_fill_super fs/ntfs3/super.c:1392
>    get_tree_bdev_flags fs/super.c:1694
>    __x64_sys_mount fs/namespace.c:4360
>   The buggy address is located 4088 bytes to the right of
>   the 4096-byte region [ffff88800a876000, ffff88800a877000)
>
> Reject an in-page offset outside the current page before the copy.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Assisted-by: Claude:claude-opus-4-8
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   fs/ntfs3/fslog.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index f038c799e7ac..ee413dc80d3a 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -2276,7 +2276,15 @@ static int read_log_rec_buf(struct ntfs_log *log,
>           */
>          for (;;) {
>                  bool usa_error;
> -               u32 tail = log->page_size - off;
> +               u32 tail;
> +
> +               /* off comes from the on-disk restart area; bound it. */
> +               if (off >= log->page_size) {
> +                       err = -EINVAL;
> +                       goto out;
> +               }
> +
> +               tail = log->page_size - off;
>
>                  if (tail >= data_len)
>                          tail = data_len;
> --
> 2.43.0

Hello,

Sorry for the delay.
Your patch was applied, thanks.

Regards,
Konstantin

