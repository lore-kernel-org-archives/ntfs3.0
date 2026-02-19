Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC15B226CF6
	for <ntfs3@lists.linux.dev>; Thu, 19 Feb 2026 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514684; cv=none; b=L+WBIEKLTIODNIhvMnAjsVEy4aTzQDn76Qj8mdF+TWTQjJN1w23qTNWw14yXsCsIYMhNWAJElw3l4CQA3ApQkCZ82J6TbQnQlB8NVKbEd7256co6tg7Adnr0SysS87yjY7CVotx3xAbS9pO7fmsmFjUiElA86e62/7CbZ4hOAZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514684; c=relaxed/simple;
	bh=lDifLTAx9n9Mk40OXQsRSz1vGqgpmvsXnNPyhYBsb2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoaTNuQVcpSJulCovDWaDGEYiRHiQOxSztyMi1EvClp1hjtJ8Pg2z3VwPTPLZycH6/hUphsqrJnVx13rfBHpTFts0L5EjnSyb8yk/k6Zn6z0etqUc13MO8f+7SrsWdy5w5bu7reP8i1nAd5UsaG2ufxqPuufzMWTj4vUyd+IP40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=GDH8wAvz; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="GDH8wAvz"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40974bf7781so1502939fac.0
        for <ntfs3@lists.linux.dev>; Thu, 19 Feb 2026 07:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1771514682; x=1772119482; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgHRaYW1iBhNDu18vHtaVid1O4fLAXLvbx6+OcL28Ko=;
        b=GDH8wAvzl66gvdsmh9B2BrHCHyyfe2mL5d6TrR8AKV/NClNqtTxxateCDb6RLLfkgb
         wQduZMzL77KstXCOC/4jpm2suZspwQ3TxvIsRHpwiVaOHkRCXLcmNOyJ9XAvRAMc7U93
         pSvLO0/sS1o6hfO9NoCwotx29/P121/T1pMmCIf9Zxs3wYRKSJs4HQbrNAbuDgvEle0u
         BnaxM6/CGESRhKJQpdajfF3awmw6WeVRiIGQb8NCBwigxxkE16h8UZjy9tBEVydQHpRK
         s9+o4CS4u7cwzTUI0P7AReysiEFnVdAWsfr/BmY+lcalaMzxyIGdXrL5/J41RVAmgf2W
         DbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514682; x=1772119482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgHRaYW1iBhNDu18vHtaVid1O4fLAXLvbx6+OcL28Ko=;
        b=viY+PkZ2VSy9dsvSQpmA4G6spcSa9VqWQZ4hNNA9oGnRG0zNuw7gygQGQRuusc0HiS
         YLJAYV327hE77RxwSmjWYhtObr/F41NA2Z8QD0j3y5czo3FNeOcG9uQXt74WFuuhJ3Uo
         DDnCo1kgd+fPBQiPuHf9es56XJH8Qqyy2LpukuFX90rigeCAVU0EpSAdz+OdbdI3uxFT
         Roj/7H4Cs/af9EulzWBmpJAjLUbBQ/ENs+GrtSvdqoLWxD0NxRiXRhjtTEmm/ZjL7YA0
         4FE0LGW9vmJmWqIFmrt9pEuzkKLhLKo6DQbmNwTmF41NsWv32B9zSzAgNdyelF+TPZEp
         3B2g==
X-Forwarded-Encrypted: i=1; AJvYcCXe/MMSdtk0DkJ7uCpR/0nkXK/tj8AxNETZ48XueDs+mHXOFenYhgu8XvMtyUecoxz8ZXhyAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8eX/zo3kF+tC81WiU13r0QuHZ0t/2C60e6gdyUC+mrLZFxRDA
	7zxzoS5A7byLoYkcpFO+Dg3M9dtCqdvfrfTeANdCKdgw+E4JTFZVAWVK8k3kB0BVJsA=
X-Gm-Gg: AZuq6aLInJXm635K7TlDi/S7Z/6mGnCJkd/m3njPkXZtb/o6QezRFvDRgfZEcLb2Xtu
	zWRrdfb3IvAtodsatgJThU7+PvWCZgJzJwSop9+4/oECbfn7er/Ml64eOOLyVAyCK+EOb7m1jMI
	9r07a5byxWMPmLbYPlIb3WvORASPlqwug12g3WH26ND5fbkvOs8atzGzdIQQ4EZ9t2+VVz82PtQ
	QVtjIQnh7DJGyw3IyfRS7x7ILsWUAFE+rUvMFIeR8tyYpB6DgBSwJxNKfoGGf/PcmgYWMZDzBHr
	ANy4y03743KxcIxXCR7kbtuK/ZyvEFEbkXmeSR0Zho2eMDqYxS7svmURc6Jl/k083pOuOmqZYz2
	e9cyMJ5z32zZgATdElea0JJGH+ZkgJeVKOg9XQXZmgGcj6XAzgEktLk0/ugHirYMFKfmf4Weeo/
	XClhpcIbw0aKqyuzdF3ILMs8C8prBErzIf5cBOJBg+tdvkErdWQ0ZSExnQJy4Qje5XDQgJ8tBcn
	9JwOygvo2A=
X-Received: by 2002:a05:6870:a0ad:b0:414:9285:c243 with SMTP id 586e51a60fabf-41545713115mr1093784fac.21.1771514681487;
        Thu, 19 Feb 2026 07:24:41 -0800 (PST)
Received: from [172.25.209.35] ([187.199.77.89])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40f062ee328sm17955312fac.4.2026.02.19.07.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:24:40 -0800 (PST)
Message-ID: <35866783-2312-4e31-904d-3746510eaf56@kernel.dk>
Date: Thu, 19 Feb 2026 08:24:38 -0700
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] block: enable RWF_DONTCACHE for block devices
To: Tal Zussman <tz2294@columbia.edu>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Dave Kleikamp <shaggy@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Bob Copeland <me@bobcopeland.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-karma-devel@lists.sourceforge.net
References: <20260218-blk-dontcache-v1-1-fad6675ef71f@columbia.edu>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260218-blk-dontcache-v1-1-fad6675ef71f@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/18/26 2:13 PM, Tal Zussman wrote:
> Block device buffered reads and writes already pass through
> filemap_read() and iomap_file_buffered_write() respectively, both of
> which handle IOCB_DONTCACHE. Enable RWF_DONTCACHE for block device files
> by setting FOP_DONTCACHE in def_blk_fops.
> 
> For CONFIG_BUFFER_HEAD paths, thread the kiocb through
> block_write_begin() so that buffer_head-based I/O can use DONTCACHE
> behavior as well. Callers without a kiocb context (e.g. nilfs2 recovery)
> pass NULL, which preserves the existing behavior.
> 
> This support is useful for databases that operate on raw block devices,
> among other userspace applications.

OOO right now so I'll take a real look when I'm back, but when I
originally did this work, it's not the issue side that's the issue. It's
the pruning done from completion context, and you need to ensure that's
sane context for that (non-irq).

-- 
Jens Axboe
