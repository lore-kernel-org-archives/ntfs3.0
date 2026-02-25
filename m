Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77B36656F
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772059968; cv=none; b=spslQ0pBCb8wBsSxIB8anaMXPvO2hLeUpbN8xaQKx8VDGAnYAvcsHrDESXzwbsDGcLlYPtGMZhq35csg3p4M5KuUwHYEUiLaDhmyHbrcfhYJ2QZUlg3mwnipSNYfT0+zKWkvchJ6Auo5MJRhkqCGucDQRX071auEmEoWX8+ueIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772059968; c=relaxed/simple;
	bh=wl1g8RbugLIpEDcyc9u4uEv7Y6gAeD6SXR7a/OTVtKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiucQYI3GtshiXcovydrOYS5juOTjNSVAyy9ESMBC5B/PyWRXjwnCC3T+Rg48qyLsyykpVPip+Pkcb4Umf4nB3y1AiR4PU9U+Dzi0xY/dkEHuJNQXWTsqJy7sW3tD9NPXkjosUifMSBQACLhBepXVbC0ULnJLxJnjzXB3AJrTSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=G4JN7R24; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="G4JN7R24"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cbae8f69cbso8440385a.0
        for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 14:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772059965; x=1772664765; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV5yfIvdQy795zXZiEFYEcuoFYVuQqyybCf8AopsVu4=;
        b=G4JN7R24WoNQ5KoSFYguGo/4JLiEj+Ua8G3SmKYHeuPh+K86ZuovgkZ5VfsxLVowpk
         dFOeQIML0qftckso2aR/7Iz8AkezM4UkjSI1vErSb/srmkdpYdyKWCtf+utvMTAhqbj7
         ZXuyZZQ3yeYcOSfW9dnZ7/aglwAypsZQtulTl/R72tqjFEx77Tc9dr0loeju80Ld1Ndu
         XeRzimconDgX9sXgwaqvThTJ76Vq0pKI0kLCkEjscR4eejtwMLOaOSCcqODWJBo6RzWM
         gRLbV+NxTxgkMe7EA6fhVlw29EBDztJcHmRmwWi3U7WHeM4Fa0esJ4u06kyd7aScS5YR
         2q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772059965; x=1772664765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV5yfIvdQy795zXZiEFYEcuoFYVuQqyybCf8AopsVu4=;
        b=cBqVjBhcX9VL8zu6rVp5z4jjoXF+ylAaJ/HQgcbyKQYZwHVLBRARKjzjeAWu99BtSg
         1uoRsK7H8iCfj5kJHApLn8QxYAXnfmKcb++pmoRu3Ic1ZIiHEYBckMWRHiYqPPY8h1kv
         efY8wPHcqpxQHX7y6bRH8a5YPJBwVuzz6hsFc4nLfJnlPvREav999VEc5zhQEyRBhCdb
         2dz+O7Sw4NuG/0tpdpb0MaQX6wgn3Bc06IN+5D1phfp5hCqXGbnzM0lRALZudvg9ICbf
         wo21iTH6vFd3xJ7yYR45EZu6eSeR9azDGV4nJ/WV+OzNV6GyEjCIxTALtZwO8OjefHf2
         g+uw==
X-Forwarded-Encrypted: i=1; AJvYcCXsUdkKvRMylD2mxU/baFYE7BPOVsO2ZPIYYA+CF9a2H5KAuxoxFe+kS5qh/V5E3xQ1t/Akog==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz42idqwWPn7XBuUaftqty3+yxtA6Nn+i+bB0dWq5GFAkwEZYEK
	tGCE0FC7vwbvepPIC1kI6y4zzWpLNe53M4X/rGATl76Fp+rHMY+W8gguNT/SsmDymTo=
X-Gm-Gg: ATEYQzx0J66NZ5t8GSDEYUzAlFYqwBKAyLjstU8VBRch7+u3IVWq5SrzQKxexEt5t9A
	6bGTGLgfbCQWRpRjnaoNfZ30bqD0YuhTN0+D63b0f/4EO6YNLXfigmU9a+dkifHYG0Gz89pzf32
	3EY1+OzYQ+mQHXP+y9kEC1e+m1oxWBA/mF/rXcZck0m6vtVVtSpKxixrv747iBHFNBhLcongMOa
	2XYQBmdGM8r/dXl1L1KA5gz+WzLCPA0lI1LdC1uxeYc7jwsE8bppErJJtQmxJWD96gONqBAgDnO
	NSKqsExImwdVggErrT28Jhsiel5MxvohVbdwOkbhC7vZoS8p+el6P/OOWdYMthMsyQHg6t1TQFm
	xu7pyP+/08vYWXUWTIWW6NxAJd5VHsHl/vWT6wVhynh9/srEeyIHffgN0GjylWPPM+LJINaSynr
	1xZh+PtpWXsbUz936ix2Z0BSIv4U0N9e14mIau2+JiqHGehwKq6NZY+eQLoW5U6Eu9jwv4CeMM6
	a8h87pQ
X-Received: by 2002:a05:620a:2807:b0:8cb:2b1f:99e4 with SMTP id af79cd13be357-8cbbf3cf398mr113515285a.34.1772059964616;
        Wed, 25 Feb 2026 14:52:44 -0800 (PST)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf652bb6sm51863585a.4.2026.02.25.14.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 14:52:44 -0800 (PST)
Message-ID: <c8078a80-f801-4f8a-b3cd-e2ccbfca1def@kernel.dk>
Date: Wed, 25 Feb 2026 15:52:41 -0700
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/2] filemap: defer dropbehind invalidation from
 IRQ context
To: Tal Zussman <tz2294@columbia.edu>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Dave Kleikamp <shaggy@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Bob Copeland <me@bobcopeland.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-karma-devel@lists.sourceforge.net,
 linux-mm@kvack.org
References: <20260225-blk-dontcache-v2-0-70e7ac4f7108@columbia.edu>
 <20260225-blk-dontcache-v2-1-70e7ac4f7108@columbia.edu>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260225-blk-dontcache-v2-1-70e7ac4f7108@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/26 3:40 PM, Tal Zussman wrote:
> folio_end_dropbehind() is called from folio_end_writeback(), which can
> run in IRQ context through buffer_head completion.
> 
> Previously, when folio_end_dropbehind() detected !in_task(), it skipped
> the invalidation entirely. This meant that folios marked for dropbehind
> via RWF_DONTCACHE would remain in the page cache after writeback when
> completed from IRQ context, defeating the purpose of using it.
> 
> Fix this by deferring the dropbehind invalidation to a work item.  When
> folio_end_dropbehind() is called from IRQ context, the folio is added to
> a global folio_batch and the work item is scheduled. The worker drains
> the batch, locking each folio and calling filemap_end_dropbehind(), and
> re-drains if new folios arrived while processing.
> 
> This unblocks enabling RWF_UNCACHED for block devices and other
> buffer_head-based I/O.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  mm/filemap.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 79 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index ebd75684cb0a..6263f35c5d13 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -1085,6 +1085,8 @@ static const struct ctl_table filemap_sysctl_table[] = {
>  	}
>  };
>  
> +static void __init dropbehind_init(void);
> +
>  void __init pagecache_init(void)
>  {
>  	int i;
> @@ -1092,6 +1094,7 @@ void __init pagecache_init(void)
>  	for (i = 0; i < PAGE_WAIT_TABLE_SIZE; i++)
>  		init_waitqueue_head(&folio_wait_table[i]);
>  
> +	dropbehind_init();
>  	page_writeback_init();
>  	register_sysctl_init("vm", filemap_sysctl_table);
>  }
> @@ -1613,23 +1616,94 @@ static void filemap_end_dropbehind(struct folio *folio)
>   * If folio was marked as dropbehind, then pages should be dropped when writeback
>   * completes. Do that now. If we fail, it's likely because of a big folio -
>   * just reset dropbehind for that case and latter completions should invalidate.
> + *
> + * When called from IRQ context (e.g. buffer_head completion), we cannot lock
> + * the folio and invalidate. Defer to a workqueue so that callers like
> + * end_buffer_async_write() that complete in IRQ context still get their folios
> + * pruned.
>   */
> +static DEFINE_SPINLOCK(dropbehind_lock);
> +static struct folio_batch dropbehind_fbatch;
> +static struct work_struct dropbehind_work;
> +
> +static void dropbehind_work_fn(struct work_struct *w)
> +{
> +	struct folio_batch fbatch;
> +
> +again:
> +	spin_lock_irq(&dropbehind_lock);
> +	fbatch = dropbehind_fbatch;
> +	folio_batch_reinit(&dropbehind_fbatch);
> +	spin_unlock_irq(&dropbehind_lock);
> +
> +	for (int i = 0; i < folio_batch_count(&fbatch); i++) {
> +		struct folio *folio = fbatch.folios[i];
> +
> +		if (folio_trylock(folio)) {
> +			filemap_end_dropbehind(folio);
> +			folio_unlock(folio);
> +		}
> +		folio_put(folio);
> +	}
> +
> +	/* Drain folios that were added while we were processing. */
> +	spin_lock_irq(&dropbehind_lock);
> +	if (folio_batch_count(&dropbehind_fbatch)) {
> +		spin_unlock_irq(&dropbehind_lock);
> +		goto again;
> +	}
> +	spin_unlock_irq(&dropbehind_lock);
> +}
> +
> +static void __init dropbehind_init(void)
> +{
> +	folio_batch_init(&dropbehind_fbatch);
> +	INIT_WORK(&dropbehind_work, dropbehind_work_fn);
> +}
> +
> +static void folio_end_dropbehind_irq(struct folio *folio)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dropbehind_lock, flags);
> +
> +	/* If there is no space in the folio_batch, skip the invalidation. */
> +	if (!folio_batch_space(&dropbehind_fbatch)) {
> +		spin_unlock_irqrestore(&dropbehind_lock, flags);
> +		return;
> +	}
> +
> +	folio_get(folio);
> +	folio_batch_add(&dropbehind_fbatch, folio);
> +	spin_unlock_irqrestore(&dropbehind_lock, flags);
> +
> +	schedule_work(&dropbehind_work);
> +}

How well does this scale? I did a patch basically the same as this, but
not using a folio batch though. But the main sticking point was
dropbehind_lock contention, to the point where I left it alone and
thought "ok maybe we just do this when we're done with the awful
buffer_head stuff". What happens if you have N threads doing IO at the
same time to N block devices? I suspect it'll look absolutely terrible,
as each thread will be banging on that dropbehind_lock.

One solution could potentially be to use per-cpu lists for this. If you
have N threads working on separate block devices, they will tend to be
sticky to their CPU anyway.

tldr - I don't believe the above will work well enough to scale
appropriately.

Let me know if you want me to test this on my big box, it's got a bunch
of drives and CPUs to match.

I did a patch exactly matching this, youc an probably find it 

>  void folio_end_dropbehind(struct folio *folio)
>  {
>  	if (!folio_test_dropbehind(folio))
>  		return;
>  
>  	/*
> -	 * Hitting !in_task() should not happen off RWF_DONTCACHE writeback,
> -	 * but can happen if normal writeback just happens to find dirty folios
> -	 * that were created as part of uncached writeback, and that writeback
> -	 * would otherwise not need non-IRQ handling. Just skip the
> -	 * invalidation in that case.
> +	 * Hitting !in_task() can happen for IO completed from IRQ contexts or
> +	 * if normal writeback just happens to find dirty folios that were
> +	 * created as part of uncached writeback, and that writeback would
> +	 * otherwise not need non-IRQ handling.
>  	 */
>  	if (in_task() && folio_trylock(folio)) {
>  		filemap_end_dropbehind(folio);
>  		folio_unlock(folio);
> +		return;
>  	}
> +
> +	/*
> +	 * In IRQ context we cannot lock the folio or call into the
> +	 * invalidation path. Defer to a workqueue. This happens for
> +	 * buffer_head-based writeback which runs from bio IRQ context.
> +	 */
> +	if (!in_task())
> +		folio_end_dropbehind_irq(folio);
>  }

Ideally we'd have the caller be responsible for this, rather than put it
inside folio_end_dropbehind().

-- 
Jens Axboe
