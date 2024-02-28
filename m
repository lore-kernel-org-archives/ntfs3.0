Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980F6EF09
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709136987; cv=none; b=e43JyHHJ8h9lYg7atUMVINmS5EAtpDbN4ZFTzRLE7CVoa4CtBhi+bhgElPjuiR82hsgYO+6nNutqF3uXxYRcxyVujq7aGTceZ+V5ELVRaYH6cghuUB1E3j7YeGHCxf83OaZlq69ebVXaP5vdAa0COLvExcvi7zZxRqusO9dUSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709136987; c=relaxed/simple;
	bh=dHGlPHjId7IDqTtZd+lyHXklOZJIi5h31Eb1KiK49Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcpgFOQTbOl1ej8LzqPEn/Y6ucGYf9yAXInwtHedaexHqmkCMBflv33C7x/jOrVZNA6StHUQ5cpFXae9E3dml0vJpIodgZ6QlxCB4CzomhPzEzL0HiTKRc4YnQWI42MYNmXrcEGWV5nnnEpoShSZDbxitk3TqpJk8QuVD6NXF7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbD4avBs; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbD4avBs"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60938adfed8so13172507b3.0
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709136984; x=1709741784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfjds2qROW0bvdzSePF9+wJs94wOzgupIfS1XbRJIJ8=;
        b=XbD4avBsmoN8JPlM2jsjigvuHc5sUjv5x2gsHzYI0l373LZysUymJMHZsDbCqE52nN
         FiJrr7PcxPm9HU8IWc+UyYatIDEMAb1vZGnLDBAGhc4XFc5O7eVUHHzn8eyaKs/HikpT
         mU/kCfKkPPBro9pcBlcq6XAFux1kbW1EeBRUN/SV0/wx6uj+UYxhqlieX0QF3Y2LDa7F
         cAS2yCiyZautkv3zfuKrxL2YMNzUN/ZN/1Tzdnh0PsKT1OB59q0ZpslBALFgdvmbomEf
         QbJHurg9pqGeC2pSEJ+dfeyJ3TJqvnlOZR+MirrrUpUVq+J+NMTqmUCcutA4S8CT2gjA
         5Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136984; x=1709741784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfjds2qROW0bvdzSePF9+wJs94wOzgupIfS1XbRJIJ8=;
        b=XpIh/rzp7tnoO3TUNornNyXuywJmyaXJSuPxEEl6rKcpftBUCeqgCJO096BzETDf3N
         D01sE/TCjzCB7VbpeLLsTQkbzUr+0PQY8MW6wVzpPt7xqq7FYf/wLpvms4ihXWRxrKU/
         OeU6v9W04q5izeClBxHjJXRdGQ/SGn8krnFkhNgMQmPcq1ZhTJZi/wd5wnRN6FRtebfG
         sa/GD23o4lqyY0UtWWKZTuKji18BXZT3UEE6pFghUXzaL5VSjGFGDG2fme62CJ5YjCS7
         Mk3KHw2OwEpbpbz/HK3OJBl4bI5I8rcMDIFWlp8k2y7FJ6FECWB0qM4/KYwDLABZHR3o
         heMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKx+1M+l3q5uU1GxRyzdjZKeyUbwOIsSrp8f+x0EN9knTPJr9nahJhfwIXoaHuffwgqB2FLNnAseUp7JBGOtWfFv+Kfa0=
X-Gm-Message-State: AOJu0Yzv85fX7hD4JMXp5WG3L10jCxIygzoAXSuHI3JAGU8fj5TL3lkC
	oIdJGqerf8T/Q1hIBUovv5KrFhN4akkP+RTvQCJKz1J/mrfZ39WK
X-Google-Smtp-Source: AGHT+IGRWx7BefJXgsOF8UDKZq6u9sWMOTAUPepP0gk7cEVY5aJQnte0UhFGWBjNGyR1b4oJrRlKng==
X-Received: by 2002:a81:e348:0:b0:5ff:aa34:7c5f with SMTP id w8-20020a81e348000000b005ffaa347c5fmr4887584ywl.46.1709136984377;
        Wed, 28 Feb 2024 08:16:24 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id i196-20020a8191cd000000b006094292e834sm302616ywg.75.2024.02.28.08.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:16:24 -0800 (PST)
Date: Wed, 28 Feb 2024 08:16:22 -0800
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
Subject: Re: [PATCH net-next v5 03/21] lib/test_bitmap: use pr_info() for
 non-error messages
Message-ID: <Zd9cVnjqfLefeMvh@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-4-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-4-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:21:58PM +0100, Alexander Lobakin wrote:
> From: Alexander Potapenko <glider@google.com>
> 
> pr_err() messages may be treated as errors by some log readers, so let
> us only use them for test failures. For non-error messages, replace them
> with pr_info().
> 
> Suggested-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> Acked-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Signed-off-by: Yury Norov <yury.norov@gmail.com>
