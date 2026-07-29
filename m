Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A963A8722
	for <ntfs3@lists.linux.dev>; Wed, 29 Jul 2026 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.74.67.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306461; cv=none; b=Or3PZhI7D/cjTztg7xmfJ9WZSqUoUkScI1pd3gkcx3X/8oyLv4I66mBhBu9VlGWDdJhnkkUAroqygHCgLVhhEpS/oY8FJpXD3YcFnIk3u7M/jjZ+obdJxKCdJwOQ1RwdbYRnPxdRxCvgf1ENX7wkpBgTVA7Dag/h4gpvKR1S55M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306461; c=relaxed/simple;
	bh=uIRzJUwbnnVLfYe80kfu9mSrm0yIsrjovjMGvshunls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMvpyz8L5JWDVR98BZJ+FTtW0K9mRLtpJ9ucgJq/9VylPtxiT7fHfYglajoLJJPtBijCYFvX4x+aEKdDVfgKQ56bLvSDxY/qRJGGDoTPgr52RikpBzz0BKYEB2jE7cknn9gUak8+N43TyD64YYhKs1l6JlCt0KSDrMmLJn4XyZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm; spf=pass smtp.mailfrom=poczta.fm; dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b=TlvKdnkX; arc=none smtp.client-ip=217.74.67.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b="TlvKdnkX"
Received: from nr200 (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Wed, 29 Jul 2026 08:27:35 +0200 (CEST)
Date: Wed, 29 Jul 2026 08:27:32 +0200
From: Slawomir Stepien <sst@poczta.fm>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org, syzbot@lists.linux.dev,
	syzkaller-upstream-moderation@googlegroups.com
Subject: Re: [PATCH] fs/ntfs3: handle partial allocation in
 attr_data_get_block_locked()
Message-ID: <ammdVFSsD9cP8eYU@nr200>
References: <8fc44517-e231-4539-a353-3dd47045a203@mail.kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc44517-e231-4539-a353-3dd47045a203@mail.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1785306456; bh=j71uMXwnOK6KYMsp07xsuBtAPsDk19Ch/WVHo7qdZGo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=TlvKdnkXl0dGl+OaMVf5m0kea2CCouriNQCOJ6i7PLBBecZA0BJpQd/rsCKozaeup
	 E27wVyMZCIYNT9UOlzr7gVWsVyZupcOaRuX5JbCx0C4vfXNTIpbxCh9DHWVJz20Nfp
	 TMMcobVekCQcXBII2cqn9I9Kia08f0WQCxnFElxo=

Hello

A gentle reminder about this PATCH.

On lip 15, 2026 12:29, syzbot wrote:
> From: Slawomir Stepien <sst@poczta.fm>
> 
> When allocating clusters for a sparse or compressed attribute in
> attr_data_get_block_locked(), the requested virtual cluster number (vcn0)
> is aligned down to a frame boundary (vcn). The function then attempts to
> allocate a full frame of clusters.
> 
> If the disk is nearly full and highly fragmented, attr_allocate_clusters()
> might only manage to allocate a small fragment and return success with a
> partial allocation length. If this partial allocation is so small that it
> does not even reach the originally requested vcn0 (i.e., end <= vcn0), vcn0
> remains unallocated (a sparse hole).
> 
> When the code subsequently calls run_lookup_entry() for vcn0, it finds the
> original SPARSE_LCN entry, which triggers a WARN_ON(1).
> 
> Fix this by adding a check to verify if the partial allocation reached
> vcn0. If it did not (vcn0 >= end), treat this as an -ENOSPC failure and
> jump to the undo1 label. This safely rolls back the partial allocation,
> restores the original size, and repacks the runs, leaving the inode in a
> consistent state before returning the error to the caller.
> 
> WARNING: fs/ntfs3/attrib.c:1236 at attr_data_get_block_locked+0x1980/0x25d0
> fs/ntfs3/attrib.c:1236
> RIP: 0010:attr_data_get_block_locked+0x1980/0x25d0 fs/ntfs3/attrib.c:1236
> Call Trace:
>  <TASK>
>  attr_data_get_block+0x1f1/0x2a0 fs/ntfs3/attrib.c:979
>  ntfs_fallocate+0xd3d/0xf70 fs/ntfs3/file.c:670
>  vfs_fallocate+0x663/0x7f0 fs/open.c:338
>  ksys_fallocate fs/open.c:362 [inline]
>  __do_sys_fallocate fs/open.c:367 [inline]
>  __se_sys_fallocate fs/open.c:365 [inline]
>  __x64_sys_fallocate+0xbf/0x110 fs/open.c:365
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
> 
> Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
> Assisted-by: Gemini:gemini-3.1-pro-preview Gemini:gemini-3-flash-preview syzbot
> Reported-by: syzbot+7be6ad5cb228286af3e3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7be6ad5cb228286af3e3
> Link: https://syzkaller.appspot.com/ai_job?id=3c9dee6e-001d-4972-8bf6-f6c960708246
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
> 
> ---
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index c621a4c58..786fd0ec0 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1227,6 +1227,10 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
>  	total_size = total_size0 + ((u64)*len << cluster_bits);
>  
>  	if (vcn != vcn0) {
> +		if (vcn0 >= end) {
> +			err = -ENOSPC;
> +			goto undo1;
> +		}
>  		if (!run_lookup_entry(run, vcn0, lcn, len, NULL)) {
>  			err = -EINVAL;
>  			goto out;
> 
> 
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda

-- 
Slawomir Stepien
