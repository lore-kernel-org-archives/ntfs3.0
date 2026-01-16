Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D136271A71
	for <ntfs3@lists.linux.dev>; Fri, 16 Jan 2026 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571180; cv=none; b=lONq+tYqfs5HzkAhmxMl3/pjPR1ZYnhmtOkcwdTUygyGDEGqBx2/gW0JSmBS3cuVFd/sFQvLhNnWyey+j99d90GWGCJ0lyjc/MSUc9nkHKiTr+pRIEJC9LS9XD7D1j7FCtcBE/M+cBZmqcIWzaZDIkNgJ1yjXGFwp7F8WWR10To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571180; c=relaxed/simple;
	bh=1yZMZFYr6KbXJmK//WAV7JgwpTNWTtHywzR2W7BQjLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iHRcA4CbFWL9Mb5zIiRv41ID5PBmFnwJNLBwdAC+vcWuVDpKkLgLjWAuJEci/E5pPt87zXHfSpcO4ji8JivoFXg1Ep+jBHAGPYkI9Sqi93Xd8yGTgsiJ1q5Dd+LoEsIF5Hg+meyZlG9xad+wqy/JsdaJoQlt+9TXekHhY5o7dsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=L9z5oTiy; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="L9z5oTiy"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 9425D1D77;
	Fri, 16 Jan 2026 13:38:15 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=L9z5oTiy;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id DDED6219B;
	Fri, 16 Jan 2026 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1768570853;
	bh=YXDXoJMMgtVuEp5U1e0l4NdrP69t8fuRn9yRvxghLds=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L9z5oTiyblfTBx0387Kw2rTyRs3yuh15lq+C8Qc6FFV4Le/tUOfKVYREufZZYCkJT
	 6szg39vwS1Jb8baGpWWaY8H1ctFxD/K0U25y36WyM4JAR2yow+LyTGV0W+ObxAmf8M
	 sY9zGiWTNkjWQGcMOoKO5hwVnYRCOnw3D8cGUkQU=
Received: from [192.168.95.128] (172.30.20.155) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 16 Jan 2026 16:40:52 +0300
Message-ID: <032f7f9d-d92d-4b11-aa18-21eb62a4d2ab@paragon-software.com>
Date: Fri, 16 Jan 2026 14:40:51 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix circular locking dependency in run_unpack_ex
To: Szymon Wilczek <swilczek.lx@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com>
References: <20251227144307.8966-1-swilczek.lx@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251227144307.8966-1-swilczek.lx@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 12/27/25 15:43, Szymon Wilczek wrote:

> Syzbot reported a circular locking dependency between wnd->rw_lock
> (sbi->used.bitmap) and ni->file.run_lock.
>
> The deadlock scenario:
> 1. ntfs_extend_mft() takes ni->file.run_lock then wnd->rw_lock.
> 2. run_unpack_ex() takes wnd->rw_lock then tries to acquire
>     ni->file.run_lock inside ntfs_refresh_zone().
>
> This creates an AB-BA deadlock.
>
> Fix this by using down_read_trylock() instead of down_read() when
> acquiring run_lock in run_unpack_ex(). If the lock is contended,
> skip ntfs_refresh_zone() - the MFT zone will be refreshed on the
> next MFT operation. This breaks the circular dependency since we
> never block waiting for run_lock while holding wnd->rw_lock.
>
> Reported-by: syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com
> Tested-by: syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
> ---
>   fs/ntfs3/run.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
> index 395b20492525..dc59cad4fa37 100644
> --- a/fs/ntfs3/run.c
> +++ b/fs/ntfs3/run.c
> @@ -1131,11 +1131,14 @@ int run_unpack_ex(struct runs_tree *run, struct ntfs_sb_info *sbi, CLST ino,
>   			struct rw_semaphore *lock =
>   				is_mounted(sbi) ? &sbi->mft.ni->file.run_lock :
>   						  NULL;
> -			if (lock)
> -				down_read(lock);
> -			ntfs_refresh_zone(sbi);
> -			if (lock)
> -				up_read(lock);
> +			if (lock) {
> +				if (down_read_trylock(lock)) {
> +					ntfs_refresh_zone(sbi);
> +					up_read(lock);
> +				}
> +			} else {
> +				ntfs_refresh_zone(sbi);
> +			}
>   		}
>   		up_write(&wnd->rw_lock);
>   		if (err)

Thanks for the patch. It is applied.

Regards,
Konstantin

