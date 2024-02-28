Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA826EEF7
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137713; cv=none; b=EIigwdfoyryyHqRmjXR9ApZOVtxsqkKBgUjUhIZy90OkfCsFld4l2xNJdZUs3Cqxi07cbvCSGsaR6BY7B3UZ2IHWQLUWZRbhkw7eabG6UQhg6cjwri5P8rKQad54lRJlqWyhGZdN40FhdUW9hfVM/WY5icO8Zh5I2sf3UH3nwoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137713; c=relaxed/simple;
	bh=rzJSJkva3PtBW+oA0aOjMOzhlLevnC0c9zdiruimJy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpDIyQF0UoYfyoUNhCRUbKAQJlmnPmAh2aNXgEO5H5lSvaOfaHEHkokxzEXyNSkyj6cFBLIfQGb+hyCSCmM2/NYwrQu4Vjl6OR8Mp6wJ7b7uEXykCtQnQ96hTIXnoP2X7NLi4/frTvlKZUd7FT990ELsegtBpC6RtRjK/2I8apw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My7wlj39; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My7wlj39"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60821136c5aso40456097b3.1
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137711; x=1709742511; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9xXOsuu/zrmE8tx8GTKpJgtMByVr0NI+8cB4bxXCLw=;
        b=My7wlj39QvcYb9NheRXq1javbtZJYMysYCj4qUi8lt4zvRHfrJiHp4o/iVMqtyWfEJ
         6e4yUeZ4DstTJCm1uACk9oxM2CFSaN3ffvxikqvISvAGPM0XmanHufeXtOl8o11Z7HOp
         wjaccGe3gpXTMpg/BZRQneAZKR6mBPYQgmCbbB6OKkV4v3wugiiLPpDCgsgi66Bd+MLL
         x6WKfW5/7ffVIlYQdnhBTijLFz8biKaLypypGpHZU5ICXBGhuQlEGfVqR2Frb4+cWV8r
         vTDG70SNzFCuRDTR0U0lEnwRtv++kJyL77K4w/1DobvCxxLWO0ti++ocKlYMqYbXr96K
         SlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137711; x=1709742511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9xXOsuu/zrmE8tx8GTKpJgtMByVr0NI+8cB4bxXCLw=;
        b=bqWS9MmA7fxoIBDOmVyY8YKCCBd6UeJWCoO/1LCJE5KJVKXKKalYt59oc5Qzz25k7y
         ZdQGaEpBkAtx+STlnneiaOy7AkxrFNZt/S2ww9PH8ua3xGeiKabUiyTW4CgNt0/Ce3q6
         PngzQlxkXN28CKfRxb74HRdlGFVLvckOdFKOIhJIzWoxLZ31aKXJd4biNZt4BnQXuaqQ
         MZ3ylAQD52kZnY2P70EirKm3R0aUuEM94Q9fVq1G55csTJi/EtUeWpI4kxxAjpmB0KgD
         ZcD4OxGximnpB0FIPzI9kJ34AjQcQD+g3SH+v8IG2U3zAP6TIEJgTNsOgr4ClisGCIKV
         6eSg==
X-Forwarded-Encrypted: i=1; AJvYcCWggnmBKwFgef012H5+MKzUaPNNrdeZnva4Qu34Garnbfsi7vGTPTbs0Ilvz9lLrabbIEIadsPFDorv823iGgvVuYzBlSg=
X-Gm-Message-State: AOJu0Ywgrg9t9Y2ZZJNdOf4jQD/F2mOOAqEHs59rAITfjly1hj+mbMYC
	Yion7fh6XwI+8m3eHHsRHrh+5T1ts4YDlCMu5FEEcqlzbb2OUBpd
X-Google-Smtp-Source: AGHT+IF7XbBhR5dwgNTUI3cgJlRp6cCPJaEGoJEGT6h5P61G+BSbNJ3st82/ffk1EVnm0MCnhDNYjg==
X-Received: by 2002:a81:e70c:0:b0:609:24ff:bf5b with SMTP id x12-20020a81e70c000000b0060924ffbf5bmr5536903ywl.22.1709137710910;
        Wed, 28 Feb 2024 08:28:30 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id x6-20020a818706000000b0060499d3a893sm2464776ywf.116.2024.02.28.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:28:30 -0800 (PST)
Date: Wed, 28 Feb 2024 08:28:29 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexander Potapenko <glider@google.com>,
	Jiri Pirko <jiri@resnulli.us>, Ido Schimmel <idosch@nvidia.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <horms@kernel.org>, linux-btrfs@vger.kernel.org,
	dm-devel@redhat.com, ntfs3@lists.linux.dev,
	linux-s390@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 11/21] tools: move alignment-related macros
 to new <linux/align.h>
Message-ID: <Zd9fLYP0uzqqwOdO@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-12-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-12-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:22:06PM +0100, Alexander Lobakin wrote:
> Currently, tools have *ALIGN*() macros scattered across the unrelated
> headers, as there are only 3 of them and they were added separately
> each time on an as-needed basis.
> Anyway, let's make it more consistent with the kernel headers and allow
> using those macros outside of the mentioned headers. Create
> <linux/align.h> inside the tools/ folder and include it where needed.
> 
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Reviewed-by: Yury Norov <yury.norov@gmail.com>
