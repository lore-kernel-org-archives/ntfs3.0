Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6C7355F47
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988060; cv=none; b=SUea7r6xxP1itkiyUFvzKr/mpENk69cXrBk4OjWXp9QoRQ6fAPhybggLvNN/OwKQHzi15LuNMsLObjlkZx9/WcLl50ZCtjFMFjwG1Ph81xMJ/1tEZEYiLIZ504vKUy1Xi5OREx7TGFMK3awCKO4ruJ5ssveNg8kU9akf5G9Dqz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988060; c=relaxed/simple;
	bh=1svsYWsDe5ALmDML6u9EZDOrNccopQcx4Kq5KaJBS9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uy1sVNT8zz+XZdQ0dv1y0JqDr3NOWHy+XFGoYFK0/oOVtNtkXs7JLO+KaYyNyiuMjlvlipK1M8V+TMmpWykU/KS/EAZ8G7HXJRq0Bgktpy/FklW4XlgqOR7fEKnz4mwjvqfTTHR+qXbHQkTo/d8CVDynAuv9v1umNquBNExgr0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=L4RE93nq; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="L4RE93nq"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 83EA51D09;
	Mon, 21 Sep 2026 10:55:11 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=L4RE93nq;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id B61792135;
	Mon, 21 Sep 2026 10:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789988056;
	bh=oXFmiFu0+ZZgmhHMMci4EFQ/5Gbtow5J32ucr3oYyKc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L4RE93nq6VClfAPPMwxc40HKSGd0+lF5EOl+2rXfp/4j9P9gpz2BMsnMCejpoUlGV
	 3HQSZgIWTsouYImWCNnQi156kB6t+V5u51N8PQ9dOMChYhRjm0SQF8KrPNEC64SYDE
	 V54792N8NsTZyXTQmFY+I1sErp07144Ocz1QbbmU=
Received: from [192.168.95.128] (172.30.20.147) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 21 Sep 2026 13:54:15 +0300
Message-ID: <f15662b4-eb81-432c-8f4c-ed62a230bbab@paragon-software.com>
Date: Mon, 21 Sep 2026 12:54:14 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ntfs3] fs/ntfs3: validate $SDH entry size in
 ntfs_insert_security
To: Xiang Mei <xmei5@asu.edu>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Weiming Shi <bestswngs@gmail.com>
References: <20260703215431.73681-1-xmei5@asu.edu>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260703215431.73681-1-xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/3/26 23:54, Xiang Mei wrote:

> ntfs_insert_security() walks the $Secure::$SDH index and reads
> e->sec_hdr.size for every entry returned by indx_find()/indx_find_sort().
> Those only guarantee the NTFS_DE envelope (e->size), so a crafted $SDH
> entry shorter than a full NTFS_DE_SDH at the tail of an index buffer makes
> the read of e->sec_hdr.size run past the allocation. Triggerable by an
> unprivileged setxattr(2) on a crafted NTFS image.
>
>    BUG: KASAN: slab-out-of-bounds in ntfs_insert_security (fs/ntfs3/fsntfs.c:2148)
>    Read of size 4 at addr ffff88800fa1de00 by task exploit/142
>     ntfs_insert_security (fs/ntfs3/fsntfs.c:2148)
>     ntfs_setxattr (fs/ntfs3/xattr.c:947)
>     __vfs_setxattr (fs/xattr.c:223)
>     __vfs_setxattr_noperm (fs/xattr.c:257)
>     vfs_setxattr (fs/xattr.c:344)
>     filename_setxattr (fs/xattr.c:690)
>     path_setxattrat (fs/xattr.c:734)
>     __x64_sys_setxattr (fs/xattr.c:764)
>     [...]
>    The buggy address is located 0 bytes to the right of
>     allocated 512-byte region [ffff88800fa1dc00, ffff88800fa1de00)
>
> Stop the scan when an entry is too small to hold a SECURITY_HDR.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
>   fs/ntfs3/fsntfs.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index bc7469d0a34d..6d81ae6c1f11 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -2145,6 +2145,9 @@ int ntfs_insert_security(struct ntfs_sb_info *sbi,
>   		goto out;
>   
>   	while (e) {
> +		if (le16_to_cpu(e->de.size) < SIZEOF_SDH_DIRENTRY)
> +			break;
> +
>   		if (le32_to_cpu(e->sec_hdr.size) == new_sec_size) {
>   			err = ntfs_read_run_nb(sbi, &ni->file.run,
>   					       le64_to_cpu(e->sec_hdr.off),

Hello,

Sorry for the delay.
Your patch is applied, thank you.

Regards,
Konstantin

