Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2AE14D6E7
	for <ntfs3@lists.linux.dev>; Mon,  8 Jul 2024 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720468333; cv=none; b=K8F9Bwhezy8AsOzRgcvpZS/UWR5Nsb5R2BUaxFYsrFMU1HLPOwYQctvn4TICCalvU/mf23bK8+gyUwPWX1KBsyoP7+M1b9dAZDV3wHcBwYcDKoogDyFblhw0ek5Oc2aUsjuDiJJDAYHi5hELcXbTWJ8ICr4ZXGgr+8HQy/ZOP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720468333; c=relaxed/simple;
	bh=+ecCjd0wI+hbgxXk7DFMOxcTrjc05KLOnHAbNSjamkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlIxDLNJhopCRcgkLJ4Ky/YrpaWd9/YfQbKmmmu3AHOcegqcsdqKNFgXJKJr56eAA3qLIp3J7uvz+2LwS1aQOg98XtYS3W4+J1v5B5voxihckb7y7cv7WGqns6PqP9QLu1YhKpajvbBNhhgnpshDpYjiL4xi6uhj17I+zTI3Sgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVTd4Igy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVTd4Igy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5863BC116B1;
	Mon,  8 Jul 2024 19:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468333;
	bh=+ecCjd0wI+hbgxXk7DFMOxcTrjc05KLOnHAbNSjamkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVTd4Igysf/teer/ejrIQMY19vfIE2CnA5VlrLafmgyRQGcm41S1o+ySL6jMNp6hP
	 nnnzVRrloXKP3RoQQFHo8tMsn9GT6LXoErU8FMcbM5mRhMdtaavfzjU6Vs/UCyLE/C
	 EOsfterZ1fkzcErXANe/XfobtdW8mXuXXb3r95zcrJnhF9+T+ydNRVwVrn7GhqUyI3
	 mxoWXneYglnYtth2z4buUjTTCufrfzfGGEvt+6ErT91L5J9TkhDQEobshFesmo9DtL
	 NFhWMkxboRqYzUtwMg3+DcRoZ08uLq9cYKuv7bha8SXBIaKqHs1O6WYKcfdoM7b6eX
	 pZPEwvom7lqOQ==
Date: Mon, 8 Jul 2024 12:52:12 -0700
From: Kees Cook <kees@kernel.org>
To: lei lu <llfamsec@gmail.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Subject: Re: [PATCH] ntfs3: Add bounds checking for dp0
Message-ID: <202407081244.99EB198E@keescook>
References: <20240701102935.3018-1-llfamsec@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701102935.3018-1-llfamsec@gmail.com>

On Mon, Jul 01, 2024 at 06:29:35PM +0800, lei lu wrote:
> Added out-of-bound checking for *dp0 (DIR_PAGE_ENTRY_32).
> 
> Signed-off-by: lei lu <llfamsec@gmail.com>
> ---
>  fs/ntfs3/fslog.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 855519713bf7..af6f2ce9ea68 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -4184,10 +4184,14 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
>  	dp = NULL;
>  	while ((dp = enum_rstbl(dptbl, dp))) {
>  		struct DIR_PAGE_ENTRY_32 *dp0 = (struct DIR_PAGE_ENTRY_32 *)dp;
> -		// NOTE: Danger. Check for of boundary.
> -		memmove(&dp->vcn, &dp0->vcn_low,
> -			2 * sizeof(u64) +
> -				le32_to_cpu(dp->lcns_follow) * sizeof(u64));
> +		// Check for of boundary.
> +		u32 len = 2 * sizeof(u64) +
> +			le32_to_cpu(dp->lcns_follow) * sizeof(u64);

Can't this calculation still overflow?

> +		if (PtrOffset(dptbl, &dp0->vcn_low) + len > t32) {
> +			err = -EINVAL;
> +			goto out;
> +		}
> +		memmove(&dp->vcn, &dp0->vcn_low, len);
>  	}

Hmm, I think this code has not been exercised under CONFIG_FORTIFY_SOURCE.
This would immediately WARN at run-time: dp->vcn is a u64. This is
writing beyond the member. Likely this needs to be split up:

struct DIR_PAGE_ENTRY {
        __le32 next;         // 0x00: RESTART_ENTRY_ALLOCATED if allocated
        __le32 target_attr;  // 0x04: Index into the Open attribute Table
        __le32 transfer_len; // 0x08:
        __le32 lcns_follow;  // 0x0C:
        __le64 vcn;          // 0x10: Vcn of dirty page
        __le64 oldest_lsn;   // 0x18:
        __le64 page_lcns[];  // 0x20:
};

struct DIR_PAGE_ENTRY_32 {
        __le32 next;            // 0x00: RESTART_ENTRY_ALLOCATED if allocated
        __le32 target_attr;     // 0x04: Index into the Open attribute Table
        __le32 transfer_len;    // 0x08:
        __le32 lcns_follow;     // 0x0C:
        __le32 reserved;        // 0x10:
        __le32 vcn_low;         // 0x14: Vcn of dirty page
        __le32 vcn_hi;          // 0x18: Vcn of dirty page
        __le32 oldest_lsn_low;  // 0x1C:
        __le32 oldest_lsn_hi;   // 0x1C:
        __le32 page_lcns_low;   // 0x24:
        __le32 page_lcns_hi;    // 0x24:
};

dp->vcn = ((u64)dp0->vcn_high << 32U | dp0->vcn_low);
dp->oldest_lsn = ((u64)dp0->oldest_lsn_high << 32U | dp0->oldest_lsn_low);

memmove(dp->page_lcns, dp0->...?, ...)


-- 
Kees Cook
