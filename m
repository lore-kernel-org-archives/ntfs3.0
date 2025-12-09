Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C8932ABC5
	for <ntfs3@lists.linux.dev>; Tue,  9 Dec 2025 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287492; cv=none; b=qmUAjpcv44/5VDqcqTyjNQsdO9VhuCD1i9biPmarbHZCsQ7vL+FG+iT3gYQX48X7zrMCtvJWvs1199alXZ7jdhK9oxXL+YazKPmigmxZJdtL8AEtFywRa1tRhqYy00elW/X6QFwFTijSfY11fUNed4JMGYr74Km+JHtrT8gaRJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287492; c=relaxed/simple;
	bh=qLYpM9YtP0ZxV2LeifGet8M8/tqSE1nTzfcX+zwMygM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N0h9gi7St2Ay8U9OuOmOsPy71YPSruES7S+ePcCp0AS49oqIHeV2piNLdLQXVwdPr+sy0FchyMJHBt/2ZFvpuUQIoYyWK+oY+p9dvtOd3KHRALjXX98KLdmCyi7jOKOX/mnj21WHJ6+qzvCwffWzC8OyB5dfXPXgKQjgiMqWKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=DySPRYpM; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="DySPRYpM"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id DC2831D42;
	Tue,  9 Dec 2025 13:34:35 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=DySPRYpM;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id D15E42416;
	Tue,  9 Dec 2025 13:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1765287488;
	bh=Cj6sIkqawdUfjl5lyZFbeTxZ7QQTGbmKY16IaqS+Cqg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DySPRYpMJ1pzswOhfV0LiTftTfAN/iYgqKHBlmFcfvzQBwLfpGiTSTUjtDEAV7OO3
	 gilO8gSylc3RFBgahCfEiazSrBsZ9dlT2/ulgK7XTReSA3X+EoVBJWsEk4AFXWM02w
	 P/SJTLCLajz8PiarIuKm8JJOdsKhcDbmb6eOU2+Q=
Received: from [192.168.95.128] (172.30.20.141) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 9 Dec 2025 16:38:07 +0300
Message-ID: <2dd18e34-4cff-402e-8077-e6e7e1fce2bf@paragon-software.com>
Date: Tue, 9 Dec 2025 14:38:06 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: Use wait_on_buffer() directly
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20251128101256.283353-1-lalitshankarch@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251128101256.283353-1-lalitshankarch@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 11/28/25 11:12, Lalit Shankar Chowdhury wrote:

> wait_on_buffer() checks buffer_locked() internally
> before calling __wait_on_buffer().
>
> Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
> ---
>   fs/ntfs3/fsntfs.c | 15 ++++-----------
>   fs/ntfs3/index.c  |  4 +---
>   fs/ntfs3/super.c  |  4 +---
>   3 files changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index c7a2f191254d..a6c155c691d6 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -875,9 +875,7 @@ void ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
>   			return;
>   		}
>   
> -		if (buffer_locked(bh2))
> -			__wait_on_buffer(bh2);
> -
> +		wait_on_buffer(bh2);
>   		lock_buffer(bh2);
>   		memcpy(bh2->b_data, bh1->b_data, blocksize);
>   		set_buffer_uptodate(bh2);
> @@ -1069,9 +1067,7 @@ int ntfs_sb_write(struct super_block *sb, u64 lbo, size_t bytes,
>   				return -ENOMEM;
>   		}
>   
> -		if (buffer_locked(bh))
> -			__wait_on_buffer(bh);
> -
> +		wait_on_buffer(bh);
>   		lock_buffer(bh);
>   		if (buf) {
>   			memcpy(bh->b_data + off, buf, op);
> @@ -1347,8 +1343,7 @@ int ntfs_get_bh(struct ntfs_sb_info *sbi, const struct runs_tree *run, u64 vbo,
>   					err = -ENOMEM;
>   					goto out;
>   				}
> -				if (buffer_locked(bh))
> -					__wait_on_buffer(bh);
> +				wait_on_buffer(bh);
>   				set_buffer_uptodate(bh);
>   			} else {
>   				bh = ntfs_bread(sb, block);
> @@ -1420,9 +1415,7 @@ int ntfs_write_bh(struct ntfs_sb_info *sbi, struct NTFS_RECORD_HEADER *rhdr,
>   		if (op > bytes)
>   			op = bytes;
>   
> -		if (buffer_locked(bh))
> -			__wait_on_buffer(bh);
> -
> +		wait_on_buffer(bh);
>   		lock_buffer(bh);
>   
>   		bh_data = bh->b_data + off;
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 6d1bf890929d..763fc05d3ca7 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -252,9 +252,7 @@ static int bmp_buf_get(struct ntfs_index *indx, struct ntfs_inode *ni,
>   
>   	bbuf->bh = bh;
>   
> -	if (buffer_locked(bh))
> -		__wait_on_buffer(bh);
> -
> +	wait_on_buffer(bh);
>   	lock_buffer(bh);
>   
>   	sb = sbi->sb;
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index ddff94c091b8..bb6462d5569c 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1616,9 +1616,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>   		 */
>   		struct buffer_head *bh0 = sb_getblk(sb, 0);
>   		if (bh0) {
> -			if (buffer_locked(bh0))
> -				__wait_on_buffer(bh0);
> -
> +			wait_on_buffer(bh0);
>   			lock_buffer(bh0);
>   			memcpy(bh0->b_data, boot2, sizeof(*boot2));
>   			set_buffer_uptodate(bh0);

Applied to my tree, thanks for the patch. Regards, Konstantin

