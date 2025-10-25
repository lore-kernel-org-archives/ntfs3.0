Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FF82D373F
	for <ntfs3@lists.linux.dev>; Sat, 25 Oct 2025 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761404835; cv=none; b=bqoZyhppT/quW5Syy35+NK/K51hEGlIDsVusplAts8IrzYZcKRxnMJIx3rRwzw70e07UqK6zCLBfxHUlLKLXpDyqqtkRTOA2MGMdRUxK4l6Nk1bwKcZVl2PRlvpEed06fhVUuirVosSSJHBLJisyFobYPfQiN52s9Sst+H1hkn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761404835; c=relaxed/simple;
	bh=pdElZZTBRl/ohTApnI+0p2VE9kXSMqg2mVsZtsGTtng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2lfw+EJ0hCaxYtEzMgVArP+4XDOPveNMhkiFQLUsfmPtJGklWNGK/O910KyGIzDKmeK8uH/8RIsWY7YLMx7WvMAlBrBjzk2bGPN/+2WZy/fzZhd+I4RS/+cf/ZSs6X15cs350vlxdbOHfQmu+izMi+ARmSlEnnT3fUUZrPsKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBHt3qPv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBHt3qPv"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso3435408b3a.1
        for <ntfs3@lists.linux.dev>; Sat, 25 Oct 2025 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761404833; x=1762009633; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehGvucYryd5ksZM+NP6h3eQPQh9+jzxwKY2MY5g6NkY=;
        b=GBHt3qPvHVW9plQtavmXb92Jy0FkjKvySLDSJrJZTpWplN3DzdoHkBGjwbMzKqntWC
         mmEK/6qJK6SE2HtyVlTkFo+iqZfRC0prKqprKJZKaBUcPMcnOk95agHs+XljeF7C72no
         UvlZQVe+WCDZPeAQq8aL6iINs5XvPC+bXCSZXuWiES6yc64jKGLbgWjUeSZD2cjrLKeO
         tsSUhAyL1zbbo4WefXCOmCP1gzz4M2qAwh+BH7Yuo7OSGz3C5uSTEfep/TaMyC25yF9r
         RU4fNf/+cRboagcx+aw3CCeDrUYNMrEDSw/AyXwpRBNw2wKV2jFa2C9gAu2NVWwbHnV7
         pOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761404833; x=1762009633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehGvucYryd5ksZM+NP6h3eQPQh9+jzxwKY2MY5g6NkY=;
        b=UULRPM1J/S79WbOMylVyyzA9t+BX85UCQpmD1eu7QytMhFPsvFQoR5qqqEcV/EHRgT
         2MXGDvg+oYcLsTQV3ZFuSoB5EoPOJR7IKy2KhgIyExyw1lEvtn4t5M1x1ikVv23f0SJR
         RU9GXEcD0e4CHG37JEhHYpxxWUPoVyBjr8KChm/MklhHd5pu+fuAZoAxTCn5K0DNd86x
         p6cIVgIA5SHeS5GkQTNCtne7uwvaPhgjJppfSXtcuZM9FJIidD1TuTN4l9ZLS/4r6RBo
         b4XyCDeKkRySf3jx3bbhffaS1BujMs+023nvXRcjvWop5OhdJrwt3QBxIWbcDxBgg3QS
         EsDA==
X-Forwarded-Encrypted: i=1; AJvYcCWlAWA1eyJJcNS++DBjIxbLDwJtjjfRhZwsynFLZ4DOj5TA015cI367CcJJkssfThjZnE5ubg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+zz0Y1y2Wx+h0FqiostjvS6Ce4GOdY4NvX+Zo6OzKPt/O5eLM
	bvEeOwim6c2NIMRbVXSf2x5oWNrwsuMULdZCb977SMHvzpQGd/ISwjyE
X-Gm-Gg: ASbGnctW4DgTPJS2+vyj8hChrX4Kma80LKJM/yCembyXLDo9wks67Kj0aG6cYV+Bd+J
	M9wLAsUAx/o1OwdwjQfFm40793w3YNWmvsE6O8eijmPPkdO5kqI/GzR0RNxxIALR54dnGsgQQtV
	YDNZYxhL9dVPBgLmOkk4xzEuIx6qIWctZs4VBjeSt/zOO41iFj+bB/i2o8dMZ6ur3+eYWqph77P
	u669FMDDXFaHlowvGQlS0ZvNj1X0AT94YfgZOeiOyLZk00oR0FLaeAdie/tD1h6i4kMSZbpueIv
	ofvSfuA24q9uPciX/st+6pPOKoQcxa2P8tRYC/WcviGT7p1Z+fOlZeIxcxn1Ad3dAnxvoOjTeAD
	5cfbgKA/UbmyMtC/aC+G5tvw6Zm566k40UdEL1kk6l0V1T+4G8hs6L6FHSX+t+v3seyxk6SS51h
	XWDJHuK4LZldamo/U/dalPpgRugYiqs2RdDSPNaagaAYbRr8dJspfzbyGwl0NFiDIZlHQ01Od9H
	i2oeqa3qd4iAacZXwU03uA=
X-Google-Smtp-Source: AGHT+IHc2D1me194quCxZvcS0NmqKlfdcG9goQhTzdjCPdL4h6Tfx4LteJBnMLzm8AlcYT1LIELvtw==
X-Received: by 2002:a17:90b:1b4a:b0:32b:6151:d1b with SMTP id 98e67ed59e1d1-33fafb98ac1mr12129890a91.8.1761404833441;
        Sat, 25 Oct 2025 08:07:13 -0700 (PDT)
Received: from ?IPV6:2606:4700:110:896a:5f1b:2412:be21:3a45? ([2a09:bac5:3c3b:a82::10c:59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed73a7b7sm2605532a91.5.2025.10.25.08.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 08:07:13 -0700 (PDT)
Message-ID: <4aeceb66-ceea-4171-8806-95bd11a928b3@gmail.com>
Date: Sat, 25 Oct 2025 20:37:07 +0530
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: david.hunter.linux@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org,
 syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com,
 ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
Content-Language: en-US
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
In-Reply-To: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/7/25 4:08 AM, Nirbhay Sharma wrote:
> The call to kmalloc() to allocate the attribute list buffer is given a
> size of al_aligned(rs). This size can be larger than the data
> subsequently copied into the buffer, leaving trailing bytes uninitialized.
> 
> This can trigger a KMSAN "uninit-value" warning if that memory is
> later accessed.
> 
> Fix this by using kzalloc() instead, which ensures the entire
> allocated buffer is zero-initialized, preventing the warning.
> 
> Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=83c9dd5c0dcf6184fdbf
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
> The following syzbot test commands were used to verify the fix against
> both linux-next and a specific mainline commit. Both kernels were
> configured with CONFIG_KMSAN=y, and no KMSAN warnings were observed
> with the patch applied.
> 
> An attempt to test against the latest mainline tip failed due to an
> unrelated boot failure in the SCSI subsystem (KMSAN: use-after-free in
> scsi_get_vpd_buf). Therefore, testing was done on the last known-good
> mainline commit below.
> 
> For mainline commit 9b0d551bcc05 ("Merge tag 'pull-misc' of..."):
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9b0d551bcc05
> 
> For the linux-next branch:
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> 
>   fs/ntfs3/frecord.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 8f9fe1d7a690..4fe8da7fc034 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -767,7 +767,7 @@ int ni_create_attr_list(struct ntfs_inode *ni)
>   	 * Skip estimating exact memory requirement.
>   	 * Looks like one record_size is always enough.
>   	 */
> -	le = kmalloc(al_aligned(rs), GFP_NOFS);
> +	le = kzalloc(al_aligned(rs), GFP_NOFS);
>   	if (!le)
>   		return -ENOMEM;
>   
Hi Konstantin,

I sent this patch about 3 weeks ago and haven't heard back yet. I wanted
to check if there are any concerns with the patch or if any changes are
needed. The fix addresses a KMSAN uninit-value bug and has been tested
successfully on both linux-next and the commit from the syzbot report.

Please let me know if you need any additional information or testing.

Thanks,
Nirbhay
