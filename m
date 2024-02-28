Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15120DD5
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137253; cv=none; b=YMALt3VZxigdCV3rEkfX44IhCd1XMEhZvxayoh90qY/pb4fWr6OCAtiwqGg56nQdzzxvXHD8m4kDqxmfX2UUR7XShJz7WKi2YI1z8zodDo17aKw5g8G1YQv0iI7jFYOef7XbskUBzDEcHw8Xxq4LM/xjBG1iVrDoZVEcjCfY4p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137253; c=relaxed/simple;
	bh=P/cOkDLDSSyk4DgZbvtQrFoF7aMyarAs6VHUkE+AZ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wr1tMeuuLHfa6DGSzs+S1d7QXRtaRDSFG1xbnSsnjxJsxymHLebEZVLWcwmTJrJOkTfudIe78NxwJPGhlGpkeYDfM98tE8CvDhpxzio6nEhtLJaYUKZ+i67OYVHol3iRY1HxekZWkIh33j7WISmq/2lRui69hiBhFqXGlI9bRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fi3IEH4L; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi3IEH4L"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-608ccac1899so53614287b3.1
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137250; x=1709742050; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mdo+WCwYssTHA5Y/xcZDi9YAkmpmO4mLfP1Bdut2TaY=;
        b=fi3IEH4LES1aSwFeTvWEoCRSsBmbaBOF+a8YF5zOZd/hwdT8ZGe302B3tOxm0kvE4U
         1p3gdbuCDWYl3BZ1peyc25qWhcJPAZnMDQun0uFpY+35BePolWmoC7SGe03tOw4mJw+t
         TOxP/RfqX89FjL2b+XvBxSeO0u4KIFJDJXwWYK0V8dbvdH0+r3oFl3lzivGN2cdUbOp+
         bN6hTn3lHVkdaRfCS1HiEZWSLVKMiWNKRQWoUNXjExj7iMwSR5gC1njfz8mx9qFVvg8m
         Eu+d66eDKRJlZnogVnez3R11MYIboq4eCzrE5IMH3I6fgrjzTtf1T0gjYXXQkGMTBjRi
         OOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137250; x=1709742050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdo+WCwYssTHA5Y/xcZDi9YAkmpmO4mLfP1Bdut2TaY=;
        b=sdHaMnJ7xWtY+RMrwfYNPVZ1Uoi77GbPCO7gjxM7xfoZfuWmXOwc5ZkTPsXNihb3n7
         PPIogK8ziMS2kYw4mSLe0vsYLxeytNmS/bV5UHXPBzECW47EdDlSznGfqmGJA5ECDTjs
         rbRrCj/h6etpz3znqBc/mahnQtcAj531+bVyiKQeS6y2bU7H6hWR+BjISteYcbeiexCc
         qh3KFtDzvefQO5qyjEFoZQS5sfOnLtbFhsuVQe5aFZbN7XPFgDJdXnIPvHcWuheawwB3
         aFhjb/AntA9/u9C792ZrdIUkNqRSGbc/LHs66+jxz/weiWokOfI7CvoDXRO+rK4fkLOa
         3O4g==
X-Forwarded-Encrypted: i=1; AJvYcCXRpNyrA6jqm63x7CK5679ATRYN65GUGUSibt9eBB0TJvxnT8lOEM026WMi4EZT2hdUdD8q657momFdMyIVjW/HumFgDuU=
X-Gm-Message-State: AOJu0YyOxvnv9Tuej93dYf9NwGr09Ab17qZcjboIqhl4BN/xmWgYhIH+
	h1V+kNYHApIeZxUiFir7nnk9mqMw2+quZQOYQ3eQaeBIFJ+vfDIp
X-Google-Smtp-Source: AGHT+IFog7Zlb1nyvjIUA4ujLfkoca4T12KmwBu9waTIaa8SAH+ATAMvMCHoJTwS61raA1yWNAPR4A==
X-Received: by 2002:a81:e349:0:b0:608:d188:6fd9 with SMTP id w9-20020a81e349000000b00608d1886fd9mr5510309ywl.33.1709137250415;
        Wed, 28 Feb 2024 08:20:50 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id v1-20020a81a541000000b005fff0d150adsm2393743ywg.122.2024.02.28.08.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:20:50 -0800 (PST)
Date: Wed, 28 Feb 2024 08:20:49 -0800
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
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH net-next v5 05/21] bitops: make BYTES_TO_BITS()
 treewide-available
Message-ID: <Zd9dYVolWW/kyngn@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-6-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-6-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:22:00PM +0100, Alexander Lobakin wrote:
> Avoid open-coding that simple expression each time by moving
> BYTES_TO_BITS() from the probes code to <linux/bitops.h> to export
> it to the rest of the kernel.
> Simplify the macro while at it. `BITS_PER_LONG / sizeof(long)` always
> equals to %BITS_PER_BYTE, regardless of the target architecture.
> Do the same for the tools ecosystem as well (incl. its version of
> bitops.h). The previous implementation had its implicit type of long,
> while the new one is int, so adjust the format literal accordingly in
> the perf code.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Acked-by: Yury Norov <yury.norov@gmail.com>
