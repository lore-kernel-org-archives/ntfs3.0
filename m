Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE9270575
	for <ntfs3@lists.linux.dev>; Thu, 28 May 2026 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976217; cv=none; b=d+xTpmaB9MiFu4QA6DUy44mEstlEq/cmEpirHmBtNtFPBc6kzkq+3uZkWY3fW5793VMcqWS/i2bQ7H0Fbj6MMD0P2bQYJLAM/mv0IpEtP+gv/Gwb8+AhpUOKFu43YrIzRFRFIt2krnTo+DqA7aAtl6QrX1a8ZPlqo++8/H9InOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976217; c=relaxed/simple;
	bh=fWzXAWHszR2b5OEPL4sndEautD7R+kMA6CG3g9XHJSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NxXSI7pz+9iE5eipxDuqqfdQYUKYy3HbSezIdxapcHlPk4+l6gQOx9eZ34GO/7qAu9ORYgr7YU2F7s6PvwsUDtBQOaJPGKafgMdvqJ1D9kGGRPZo+pglTAuedwOGnZ2QCodG4ZIn7fe8OltNXKEbuQbOW7Xpk8u6BnJzl5jjYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=bqOppMyg; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="bqOppMyg"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 0517E26;
	Thu, 28 May 2026 13:50:16 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=bqOppMyg;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 978441D44;
	Thu, 28 May 2026 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779976213;
	bh=xTFAsC8Zn1VtBDH+N0QLrTFT7H21Yp+uRFoacmhZjm4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bqOppMygU7i7moQ6zV6KHBDbMgZNSUvrdfPkJtZPgtkkIN0fISHKWD/HvvTLV8X7V
	 nxBwqfohigWdFgad5ocOdGwyp/o4fu+PuamStkGyy+AmOWzfRAEw4lNZtPu9mrxZOb
	 SIbptUybgFad2mWFyEVbgGBZycJDF1Lquam6Thk4=
Received: from [192.168.95.128] (172.30.20.180) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 28 May 2026 16:50:12 +0300
Message-ID: <a2da973e-def0-4136-b6ee-07791e101fb9@paragon-software.com>
Date: Thu, 28 May 2026 15:50:11 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] fs/ntfs3: fix mount failure on 64K page-size
 kernels
To: Jamie Nguyen <jamien@nvidia.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Matthew R .
 Ochs" <mochs@nvidia.com>
References: <20260424203111.77214-1-jamien@nvidia.com>
 <20260519194220.58114-1-jamien@nvidia.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260519194220.58114-1-jamien@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/19/26 21:42, Jamie Nguyen wrote:

> On 64K page-size kernels, mounting NTFS volumes smaller than ~650 MB
> fails with EINVAL. The issue is in log_replay(): the initial log page
> size probe uses PAGE_SIZE (65536) instead of DefaultLogPageSize (4096)
> when PAGE_SIZE exceeds DefaultLogPageSize * 2.
>
> This makes norm_file_page() require the $LogFile to be at least
> 50 * 65536 = 3.2 MB, but mkfs.ntfs creates a $LogFile of only ~1.5 MB
> for a typical 300 MB volume. norm_file_page() returns 0 and the mount
> is rejected with EINVAL.
>
> On 4K kernels the #if guard evaluates to true, so use_default=true is
> passed and DefaultLogPageSize (4096) is used, requiring only ~200 KB.
> This path works fine.
>
> Fix this by always passing use_default=true, which forces the initial
> probe to use DefaultLogPageSize regardless of the kernel's PAGE_SIZE.
> This is safe because, after reading the on-disk restart area, log_replay()
> already re-adjusts log->page_size to match the volume's actual
> sys_page_size.
>
> Also fix read_log_page() to pass log->page_size instead of PAGE_SIZE to
> ntfs_fix_post_read(), matching the actual buffer size.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> Tested-by: Matthew R. Ochs <mochs@nvidia.com>
> ---
>   fs/ntfs3/fslog.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 38934e6978ec..4a6cfa3441d9 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -1170,7 +1170,7 @@ static int read_log_page(struct ntfs_log *log, u32 vbo,
>                  goto out;
>
>          if (page_buf->rhdr.sign != NTFS_FFFF_SIGNATURE)
> -               ntfs_fix_post_read(&page_buf->rhdr, PAGE_SIZE, false);
> +               ntfs_fix_post_read(&page_buf->rhdr, log->page_size, false);
>
>          if (page_buf != *buffer)
>                  memcpy(*buffer, Add2Ptr(page_buf, page_off), bytes);
> @@ -3782,11 +3782,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
>          log->l_size = log->orig_file_size = ni->vfs_inode.i_size;
>
>          /* Get the size of page. NOTE: To replay we can use default page. */
> -#if PAGE_SIZE >= DefaultLogPageSize && PAGE_SIZE <= DefaultLogPageSize * 2
>          log->page_size = norm_file_page(PAGE_SIZE, &log->l_size, true);
> -#else
> -       log->page_size = norm_file_page(PAGE_SIZE, &log->l_size, false);
> -#endif
>          if (!log->page_size) {
>                  err = -EINVAL;
>                  goto out;
> --
> 2.43.0
>
Hello,

Queued for the next merge window, thanks.

Regards,
Konstantin

