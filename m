Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A573DA5D3
	for <ntfs3@lists.linux.dev>; Tue, 26 May 2026 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789765; cv=none; b=cHWLevBd+wn/Q2h9tadZ7nqXimkSjH8elMALNkYfF6E0IbkvdA7W3TPC3vTqfoll30tCdW8+lKGQauUD+rM1Tmvg2zuyrSHlXkX03xw9wmV7rDEVQjUDHrUKZPjOmgreBQCIo7P2rWjWoE3Yv5AoNwglzOvHXRuffnF9kvCtPfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789765; c=relaxed/simple;
	bh=yhJuGFLMqwKGS/y+rBPSUpK3Q5bGy0V88dmO1anrTmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ou5GaRXfl9pz/G/s1UOyoRpYipjr4LStp3ibudNV+G5XHnrOPNk0l/8IikX7mz6D7+zaON3JSz46h/OTd/gr8drjLisUUFyldpOAxxl62pdKw4c1yxp5uFgO1RcXVCQpD7ad8CzYw5zUE7Syn8fbAFSsOv/9rr/HpQEVtMEIAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=u3ZQ+nYp; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="u3ZQ+nYp"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 302D31D19;
	Tue, 26 May 2026 10:02:39 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=u3ZQ+nYp;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 1E23A2126;
	Tue, 26 May 2026 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779789749;
	bh=pJ22h/9jiSmOZpttw8cfUq0RS7sSwCvdYRO2aHJMw2E=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=u3ZQ+nYpXpGjF0vyjb1nx9faCN9O7iiydUbTEXrz3XcWKvi5AR1pYVb6nBCSvt4LU
	 l5pmf1Qc0vPzAYJfvEvo36qt+j3cTmUIOlHaIaRziPKNdKhDKCnXRLxoW86ziVvzuD
	 2zE0o5vAC+S4aBCWkZY7tkIe3CWRyK/yHAV2vpME=
Received: from [192.168.95.128] (172.30.20.153) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 26 May 2026 13:02:28 +0300
Message-ID: <496d8029-fe29-4403-9466-299bd14d2467@paragon-software.com>
Date: Tue, 26 May 2026 12:02:26 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: call _ntfs_bad_inode() when failing to rename
To: Helen Koike <koike@igalia.com>, <eadavis@qq.com>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
References: <20260506170842.532401-1-koike@igalia.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260506170842.532401-1-koike@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/6/26 19:08, Helen Koike wrote:

> It is safe to call _ntfs_bad_inode on live inodes since:
>    commit 519b078998ce ("fs/ntfs3: Exclude call make_bad_inode for live nodes.")
>
> The WARN_ON was added when it wasn't safe by:
>    commit d99208b91933 ("fs/ntfs3: cancle set bad inode after removing name fails")
>
> Replace the WARN_ON with a call to _ntfs_bad_inode() to prevent further
> operations on the inconsistent inode.
>
> Reported-by: syzbot+4d8e30dbafb5c1260479@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=4d8e30dbafb5c1260479
> Fixes: 519b078998ce ("fs/ntfs3: Exclude call make_bad_inode for live nodes.")
> Signed-off-by: Helen Koike <koike@igalia.com>
> ---
>   fs/ntfs3/frecord.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 7b035da63c12..78eb065c7e43 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2800,8 +2800,8 @@ int ni_rename(struct ntfs_inode *dir_ni, struct ntfs_inode *new_dir_ni,
>   	err = ni_add_name(new_dir_ni, ni, new_de);
>   	if (!err) {
>   		err = ni_remove_name(dir_ni, ni, de, &de2, &undo);
> -		WARN_ON(err &&
> -			ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo));
> +		if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo))
> +			_ntfs_bad_inode(&ni->vfs_inode);
>   	}
>   
>   	/*

Hello,

Your patch was applied, thanks.

Regards,
Konstantin

