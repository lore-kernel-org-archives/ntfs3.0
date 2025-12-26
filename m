Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9C6137C52
	for <ntfs3@lists.linux.dev>; Fri, 26 Dec 2025 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766772406; cv=none; b=l1KnQEJMO+1wSlaITV7K+FBxjdok/uFGZldz8W3upUC1D2TkTphEYBbV2fxeZ0kytpaddhKuGZpVASoOUW+tGnCvSt1dldlYdH0lj2RRKV304RHgpATXwX/xIz2Q+gG+KPSxHfxr6rD2OYKdBVa6T9t+/aYrIiZk4G4xsqQ7E6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766772406; c=relaxed/simple;
	bh=DYV7u7LCdxQPPEQ3j8FFzZKUPZUFDDj3FqYct7kU6Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rJSNSsZkJiCImt0EeDDzD/Mb2Gq8/WL0D+l+PU2D2rDD0fOSsrERUbmlEb9v9B0OvD0QUMwYaupet2XU0rLXqgMx4Yj/TQXgNqW7QHnF1yPBwreu7/NDKUhd8ZKoF5fD/y0lBciwbdPR9LNhueDpSHuwz2yydhibz8lMZlW0J2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Hs/hDuRC; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Hs/hDuRC"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 2E8561D29;
	Fri, 26 Dec 2025 18:03:34 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Hs/hDuRC;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 5948422A8;
	Fri, 26 Dec 2025 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1766772402;
	bh=PraAdCtFeAo7eIhRyd1c4u56g1zLurWDn2/SmQigSVk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Hs/hDuRCAlpmx74RFvAavNdFJDX1J6chTabG0o/r+1xmNtQ7yI11O30XeLSuyZDLr
	 wDixYobiSDwJTigjY2lGsrocQjs58oN3gQUiyBTTFSZhJvBgfGeIK8IYiwK+IaID47
	 hCK+0XGERx1CF9GAXCl8NAZAREFnfdo4leUnNO4g=
Received: from [192.168.95.128] (172.30.20.178) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 26 Dec 2025 21:06:41 +0300
Message-ID: <a56398cc-22d5-41dd-9273-0e9cc17804da@paragon-software.com>
Date: Fri, 26 Dec 2025 19:06:39 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix deadlock in ni_readpage_cmpr
To: Szymon Wilczek <swilczek.lx@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+5af33dd272b913b65880@syzkaller.appspotmail.com>
References: <20251222151010.17263-1-swilczek.lx@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251222151010.17263-1-swilczek.lx@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 12/22/25 16:10, Szymon Wilczek wrote:

> Syzbot reported a task hung in ni_readpage_cmpr. This is caused by a lock
> inversion deadlock involving the inode mutex (ni_lock) and page locks.
>
> Scenario:
> 1. Task A enters ntfs_read_folio() for page X. It acquires ni_lock.
> 2. Task A calls ni_readpage_cmpr(), which attempts to lock all pages in
>     the compressed frame (including page Y).
> 3. Concurrently, Task B (e.g., via readahead) has locked page Y and
>     calls ntfs_read_folio().
> 4. Task B waits for ni_lock (held by A).
> 5. Task A waits for page Y lock (held by B).
>     -> DEADLOCK.
>
> The fix is to restructure locking: do not take ni_lock in ntfs_read_folio().
> Instead, acquire ni_lock inside ni_readpage_cmpr() ONLY AFTER all required
> page locks for the frame have been successfully acquired. This restores the
> correct lock ordering (Page Lock -> ni_lock) consistent with VFS.
>
> Reported-by: syzbot+5af33dd272b913b65880@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5af33dd272b913b65880
> Fixes: f35590ee26f5 ("fs/ntfs3: remove ntfs_bio_pages and use page cache for compressed I/O")
> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
> ---
>   fs/ntfs3/frecord.c | 2 ++
>   fs/ntfs3/inode.c   | 3 +--
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 641ddaf8d4a0..f09a149cff9f 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2107,7 +2107,9 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct folio *folio)
>   		pages[i] = pg;
>   	}
>   
> +	ni_lock(ni);
>   	err = ni_read_frame(ni, frame_vbo, pages, pages_per_frame, 0);
> +	ni_unlock(ni);
>   
>   out1:
>   	for (i = 0; i < pages_per_frame; i++) {
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 0a9ac5efeb67..33f819b162a5 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -735,9 +735,8 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
>   	}
>   
>   	if (is_compressed(ni)) {
> -		ni_lock(ni);
> +		/* ni_lock is taken inside ni_readpage_cmpr after page locks */
>   		err = ni_readpage_cmpr(ni, folio);
> -		ni_unlock(ni);
>   		return err;
>   	}
>   

Your patch is applied, thanks.

Regards,
Konstantin

