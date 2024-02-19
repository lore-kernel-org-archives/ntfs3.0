Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78056208B9
	for <ntfs3@lists.linux.dev>; Mon, 19 Feb 2024 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708327277; cv=none; b=l169v9zpPDyPD1uFL0mToNKS4veJO67NKP1+B8/XlTIaHEWX31/nyf0M5XN2V1u0Q/pSuQPvp2pcZAMIihDTXcD6Aq1eFPfwzotK1ujchjeQ2LapZAap8dPXBjmHnDjsdPDysjCBZXMm8Lv9ph+wmJVB+ui+vsmnhYnuQFvqnOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708327277; c=relaxed/simple;
	bh=QN0mnIvLWaqPN7bppER4z5cXJNGlnW4ZBUQce0v0esE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWW1WLqzwQXE8oCOA+AWve2BXkV4JVoWI7JV/RzSSiq1MUYdlPRIvhfipS+zceNK2B/W9F46kOf7yqi/tKxRSwvYKatq29hxodd5v+2k+P41uZXn82pk+EvV1woRUqasSyZs9m53V7HUEvPChhyWc6HqdlRbLgfZqthkCwMlcp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=C29FPIaq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="C29FPIaq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41268aee707so1753155e9.1
        for <ntfs3@lists.linux.dev>; Sun, 18 Feb 2024 23:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708327274; x=1708932074; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PVqM0b0itzTgllW893u9sbLtVTXtg0oDYKDS5Qi+rsQ=;
        b=C29FPIaq/u9Vqr9PqEzaZQYdgdZpovxvRTSsAEx9jfjZBkTxDWxKIGXk8/WhvhsXZ3
         WTwXkVwTBt44oZ3sUTT0YtOsYj/M87DxDxkpSYuSzwevTs5hzbWoTHOz2hgviA2PRMZc
         yz+amjQ8cETmbvx4nF2ucnmAmlrGCFwVFje/uWztlVdR+48BjBXmBaRjSvCa+A1nQsqj
         Ax0NrfmHTd+w/OwWA60CBM12rUxIiOoRZPOqTGDpsOqjj3vS+NmwrtgKiOd+xUuJ5X/O
         qog9JMWiJ0OGMqaOoDowYgfNu9PTiZliX+FjrapesytFkenh8s2KhOkLONI+AC/cHWcD
         TezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708327274; x=1708932074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVqM0b0itzTgllW893u9sbLtVTXtg0oDYKDS5Qi+rsQ=;
        b=KpE3d3tTDXk3bGx3ZAUtI92kgsER9AxkzYe7siZSIJ1qze5LIDZe4iDKC68zOvgFa6
         NgEzoIclq2MJr24Wp9bqq8dPRVwT/1bD8nU3z5z1BgbRe+8bPBE4kjQ3Fn9qODsZh92g
         AxHcmxYa5bzpV/j6NhHFGaBV1RllNFSwrOOd48Jh2c6PY6rV6z10wpcVJa3QMHvKLRdq
         /56FbJQLAlek9lZhNFTaBE8xmtAA1xeGHFzmOpVeoO2PNpvxJN/LskCXuEsJ8c4Qs2im
         duaPDamYvo1xAcMPcpbbEIyAclQVrR98nQPjJJb+nMOsRD/ipaPKMeNR6vOfXozzoI3Y
         53EA==
X-Gm-Message-State: AOJu0Ywql252mfcJK/LexS7jDhA7iG2umUhpadoW4ytDBV4k7JhTYFI1
	nojrmwt9q1jGhJK2NxQTJoUmLJ7bvI6PjNAaU7MDDIE+zRFb/4r8
X-Google-Smtp-Source: AGHT+IETLfPHLLopGCD+sezW13FOiuvcS70DNbH9oqN5ZMR+lJmw7TXZAdysc+hTTzbuAYHtPBcg/Q==
X-Received: by 2002:a05:600c:1c0e:b0:412:698b:d7bd with SMTP id j14-20020a05600c1c0e00b00412698bd7bdmr222859wms.31.1708327273709;
        Sun, 18 Feb 2024 23:21:13 -0800 (PST)
Received: from [192.168.1.10] ([94.9.209.181])
        by smtp.googlemail.com with ESMTPSA id z19-20020a7bc7d3000000b00411e1574f7fsm10327647wmk.44.2024.02.18.23.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:21:13 -0800 (PST)
Message-ID: <89630027-f93c-4e1d-a9c0-a120b8f0bc9e@googlemail.com>
Date: Mon, 19 Feb 2024 07:21:09 +0000
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] fs/ntfs3: fix build without CONFIG_NTFS3_LZX_XPRESS
To: Mark O'Donovan <shiftee@posteo.net>, linux-kernel@vger.kernel.org
Cc: ntfs3@lists.linux.dev, almaz.alexandrovich@paragon-software.com
References: <20240214224500.811609-1-shiftee@posteo.net>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <20240214224500.811609-1-shiftee@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi.

On 14/02/2024 22:45, Mark O'Donovan wrote:
> When CONFIG_NTFS3_LZX_XPRESS is not set then we get the following:
> fs/ntfs3/frecord.c:2460:16: error: unused variable ‘i_size’
> 
> Signed-off-by: Mark O'Donovan <shiftee@posteo.net>
> ---
>  fs/ntfs3/frecord.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 3b42938a9d3b..7f27382e0ce2 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2457,7 +2457,6 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
>  	struct ATTR_LIST_ENTRY *le = NULL;
>  	struct runs_tree *run = &ni->file.run;
>  	u64 valid_size = ni->i_valid;
> -	loff_t i_size = i_size_read(&ni->vfs_inode);
>  	u64 vbo_disk;
>  	size_t unc_size;
>  	u32 frame_size, i, npages_disk, ondisk_size;
> @@ -2509,6 +2508,7 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
>  		err = -EOPNOTSUPP;
>  		goto out1;
>  #else
> +		loff_t i_size = i_size_read(&ni->vfs_inode);
>  		u32 frame_bits = ni_ext_compress_bits(ni);
>  		u64 frame64 = frame_vbo >> frame_bits;
>  		u64 frames, vbo_data;
> 
> base-commit: 7e90b5c295ec1e47c8ad865429f046970c549a66

Mark - Thanks for the patch.
Alex - Fixes a build bug introduced by 4fd6c08a16d7f1ba10212c9ef7bc73218144b463.

Tested-by: Chris Clayton <chris2553@googlemail.com>
