Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D984633262F
	for <ntfs3@lists.linux.dev>; Tue,  7 Apr 2026 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775582417; cv=none; b=Pm7oQ1igWcYxqOEpjk4Z0gzurk8kNWsJDqtkcCGRk+YvukS2hLL5Kf5kf/Y6XCI9fA2Ll1I5rAWdMQgeooUid63jKr3NObXpCuQywdg7pAE2aaSI2lC1yCxEtEXIQJpCwoTjrK42i+F6Eh1qdHOt1AzdilksTJO0pUY42XIj0nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775582417; c=relaxed/simple;
	bh=9UOn9bzYGUusyvhF20IpOTCGX21Ydd4GSzvv/GexCjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F52GbvWVfbE61VFqw2jO0mXLgfpsrq8b+4ZNbNuYjJ6/yPw2Tcjy2ZdqRgi7eQBDhRzau9+F0Iuvspmde3jwqwiA66avqgpVuiEo5UYITsXf9l5gPHjcArCcw5FKwYeWRg4SkX6snqBxIv8AWBPlr7vnbSCx9DOT/14X/zCLxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=VrdQypTg; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="VrdQypTg"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 408F11D43;
	Tue,  7 Apr 2026 17:20:26 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=VrdQypTg;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E5ACB244;
	Tue,  7 Apr 2026 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1775582409;
	bh=PO495k2t8Wq8b5MjoVpMrySezR1EuBzDb+txhlPQe54=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VrdQypTgUWQ0nGxjUoKRwwBtIpsPclgvDRDSmJkRZypUobUZHVsDZYuATxIwBtCip
	 +gLxaWk6iBPArdIwOcHXdbl1V+ND6TuuaJz4s8nwm6RzpzvY3OIkwf0/g/EwaxVIgc
	 k4Hcynt/j8NWhvuQzVj8vG9+rvIWObVqDuSCPpKo=
Received: from [192.168.95.128] (172.30.20.204) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 7 Apr 2026 20:20:09 +0300
Message-ID: <3d346545-11c0-495c-80dc-647ca7540e0b@paragon-software.com>
Date: Tue, 7 Apr 2026 19:20:07 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix OOB write in attr_wof_frame_info()
To: 0xkato <0xkkato@gmail.com>
CC: <ntfs3@lists.linux.dev>
References: <20260329115757.66040-1-0xkkato@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260329115757.66040-1-0xkkato@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 3/29/26 13:57, 0xkato wrote:

> [You don't often get email from 0xkkato@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> In attr_wof_frame_info(), the offset-table read range for a nonresident
> WofCompressedData stream is:
>
>      u64 from = vbo[i] & ~(u64)(PAGE_SIZE - 1);
>      u64 to   = min(from + PAGE_SIZE, wof_size);
>      ...
>      ntfs_read_run(sbi, run, addr, from, to - from);
>
> A crafted image sets WofCompressedData.nres.data_size to 0xfff while the
> file is large enough to request frame 1024 (offset 0x400000). This gives
> from=0x1000, to=0xfff. The unsigned (to - from) wraps to 0xffffffffffffffff
> and ntfs_read_write_run() overflows the single-page offs_folio via memcpy.
>
> Triggered by pread() on a mounted NTFS image. Depending on adjacent
> memory layout at the time of the overflow, KASAN reports this as
> slab-out-of-bounds, use-after-free, or slab-use-after-free all at
> ntfs_read_write_run(). Secondary corruption/panic paths were also observed.
>
> Reject the read when the offset-table page is outside the stream.
>
> Signed-off-by: 0xkato <0xkkato@gmail.com>
> ---
> Reproducer:
>
>    Create the crafted NTFS image:
>      python3 create_wof_poc.py -o wof-poc.img
>
>    Mount it read-only with ntfs3:
>      sudo mount -t ntfs3 -o loop,ro wof-poc.img /mnt
>
>    Build the trigger:
>      cc -O2 -static wof_offset_table_read_trigger.c -o trigger
>
>    Trigger the bug:
>      ./trigger /mnt/poc.bin 0x400000 1
>
> KASAN report on 6.19.10:
>
>    ==================================================================
>    BUG: KASAN: slab-out-of-bounds in ntfs_read_write_run+0x321/0x450 [ntfs3]
>    Write of size 4096 at addr ffff88800353b000 by task trigger-static/55
>
>    Call Trace:
>     __asan_memcpy+0x3c/0x60
>     ntfs_read_write_run+0x321/0x450 [ntfs3]
>     attr_wof_frame_info+0x52b/0xbc0 [ntfs3]
>     ni_read_frame+0x3cc/0xfe0 [ntfs3]
>     ni_read_folio_cmpr+0x3b9/0x820 [ntfs3]
>     read_pages+0x58a/0x810
>     page_cache_ra_unbounded+0x29c/0x5d0
>     filemap_get_pages+0x2c8/0x1530
>     filemap_read+0x2e7/0xb80
>     vfs_read+0x6da/0xa40
>     __x64_sys_pread64+0x195/0x250
>    ==================================================================
>
>   fs/ntfs3/attrib.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index 6cb9bc5d6..89921e509 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1576,6 +1576,12 @@ int attr_wof_frame_info(struct ntfs_inode *ni, struct ATTRIB *attr,
>                          u64 from = vbo[i] & ~(u64)(PAGE_SIZE - 1);
>                          u64 to = min(from + PAGE_SIZE, wof_size);
>
> +                       if (from >= wof_size) {
> +                               _ntfs_bad_inode(&ni->vfs_inode);
> +                               err = -EINVAL;
> +                               goto out1;
> +                       }
> +
>                          err = attr_load_runs_range(ni, ATTR_DATA, WOF_NAME,
>                                                     ARRAY_SIZE(WOF_NAME), run,
>                                                     from, to);
> --
> 2.50.1 (Apple Git-155)
>
Hello,

Your patch is applied. Thank you.

Regards,
Konstantin

