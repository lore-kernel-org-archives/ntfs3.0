Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B496EF0F
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137791; cv=none; b=DAzWsZ6rK6zBjUNjUnIsCiqg74t6RSMLhg+rm0kllekDr93362BBapVrJY+aOXQGATQhR2OemfmGjQaDYvm+q3jcEqMqBVC7r+5JnYD774l92FnHR3YqWg3HEZZGErTxJgZbFNTxywvDur0zXEcfZPij22CMeMQbEN3GojJc1sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137791; c=relaxed/simple;
	bh=wS3cg47EfvD5VkYCZNfgMA58P2hp2/4YIQrmVXFhguQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7jjs88ODLoCB4d4FE3muc2aJZ9gK5egjHlIxd9hhnSDHUQ43wPa5s/QE5gQ4/Htx5YZjtfBRZJFj1/CAQSNonjrYiOycBUsfQ4oQfX0cGqnEhmRi3vT7gCtT7JUqIISZAH19ADlAEV1xWeRb7iqutjX7XQ0Cl1DXdxvoXlkmWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3oWJLo2; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3oWJLo2"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-607eefeea90so10525137b3.1
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137789; x=1709742589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kj3zQ1lBxACrFRnKWFxYbPf2tKrEF/iMipPYB2aWh/I=;
        b=L3oWJLo2am3ooIRvMeJz4NcPyC+LOlurcYwKtYR3PophgTr+cXLbNQyOpO/iI56OfL
         pmGZY+RdpEm8sSejc6qNnJSPLGUSS3pgOX3b20dpkl9aTzlQ5aRlPK+ycIobA+WgEy2s
         TasqCi/RA3zqYqWiEWX6vrMxvLR8qsAqAS7cTzQ/jJKBci8e73znRa0gCwr7u7O2g4hk
         XS1n3xgEwzy4NE7/WHRO9XR2RGP5QIdBhxX+HFS9NJFFUdxOUVgejNXIt/MWIkPamcaR
         zfU60+cICZ7BYnZJmvwIh7OqBpLd6roDqUSV83+u0WlYTLpM8SmqBr74IQufRLM82U/2
         C6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137789; x=1709742589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj3zQ1lBxACrFRnKWFxYbPf2tKrEF/iMipPYB2aWh/I=;
        b=HOUISjmboGCfLkxAfD0hFeyjXzL3nT6dtbo2thEXPMEt+uX3FY4Il4z6O/4R0mhgBT
         MjGwkoD9UTDy7XMamzMy0lKrPTUk+92IqmQ+oTvwh7khiG1L1b1dH3EPQ+cheBpZVuE7
         XJEZMvMXMZLG/rm1c5MIPG3SEyiq1CGrMh10zgi9eCBBXrwWPhj8LsCZMUpAN3CUxR2k
         fR7uta44Y7AyGqvYgcNtKoXQe7M8V1Fdf+GmprqBPGRBpjSdAWZ7Wq30AWUcf9Dl50kx
         nOAu+5YKkJzvy9tvZonT8KMqdgFHzNylLjUXtxEfc0ChkksfMRuZFkybH+wGhpfsgTiT
         2YsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9UAC97dGT61/iezeG8jI4HVNEMkbIY9Zlfm7zVwJdBQtpaKma5+2KTiIdA3XCnzqgjrz5Elgc1J83Ww0GQCKGbWC8wMo=
X-Gm-Message-State: AOJu0YzoCcvIT6CWdV7HTGphXVHXVcuQQ20nTr3GFmvRfI3rP65uoqBJ
	FpixMl498Ni+FYBAF+r/5Mr+OkzvRObb3tBf77TlprJ+Hw9tj6bv
X-Google-Smtp-Source: AGHT+IGa1uVu1QGKwzBN/ugqWSb5R7kpDXIVH6fnycyAQSPeZdMmpMkJiKarLdELLKFo76CJJMn2/A==
X-Received: by 2002:a81:b284:0:b0:608:cc10:f4f4 with SMTP id q126-20020a81b284000000b00608cc10f4f4mr1884717ywh.16.1709137788712;
        Wed, 28 Feb 2024 08:29:48 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id i126-20020a0df884000000b00608a88ba3c7sm2471750ywf.79.2024.02.28.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:29:48 -0800 (PST)
Date: Wed, 28 Feb 2024 08:29:47 -0800
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
Message-ID: <Zd9fe8o9zkwoW8Cf@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-12-aleksander.lobakin@intel.com>
 <Zd9fLYP0uzqqwOdO@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zd9fLYP0uzqqwOdO@yury-ThinkPad>

On Wed, Feb 28, 2024 at 08:28:31AM -0800, Yury Norov wrote:
> On Thu, Feb 01, 2024 at 01:22:06PM +0100, Alexander Lobakin wrote:
> > Currently, tools have *ALIGN*() macros scattered across the unrelated
> > headers, as there are only 3 of them and they were added separately
> > each time on an as-needed basis.
> > Anyway, let's make it more consistent with the kernel headers and allow
> > using those macros outside of the mentioned headers. Create
> > <linux/align.h> inside the tools/ folder and include it where needed.
> > 
> > Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> 
> Reviewed-by: Yury Norov <yury.norov@gmail.com>

Sorry, please read this as: 

Signed-off-by: Yury Norov <yury.norov@gmail.com>
