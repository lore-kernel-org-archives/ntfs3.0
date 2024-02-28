Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C446D6EEFC
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137917; cv=none; b=EA6t1nv2GauXTURmj//Y3yxsY6uC9uLUXpwUuZVO92bo4nGx9J4RjCh3+qkYce5DX4pJkhH6mbAmxH40LIKkORZK9OEOXdbSu3H39eUWoOOIzkOpPnP/8VHRdkeJL7RG3rfr0LJNmqFoPaQI8A6h/aLLhXNpbnfU/pWFr3VRKmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137917; c=relaxed/simple;
	bh=g0Ik/3ZcsyoaSr3tfeDW9hLUH99COK9VQZxIwEPar6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svTVxCRYMUBBKIDyGGnnK9IYue3J9vBzVTRezsG8BODOnvDAc/WwiWIDJtjibi/v3gF3MrLTKQ+ecpm8bLvEH2negCp+5A0MQ9QTDuaN9RHvbJqc7Vc25u5Xylgr2MM432c72Wq05gm3hF1/QplHlTIePgKEJv0KDcvfaYg2Ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCJTT4J7; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCJTT4J7"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-607c5679842so57461397b3.2
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137915; x=1709742715; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y00SGrd9M6s3CDkf95KQLhsTphwzXhcDaiAvmjSSj6k=;
        b=JCJTT4J7JsphSJo8rUgjTi0PntUoFZvbio0hFDotD4FB9Q/mDtQBOOHrCHX2fQ8bWh
         olOBSx2oylaFJYhWThDIGz/1Q9pn2gpfR8/7Cg3rag7bhn9wRoY6B80mZ2z/NuPuTFiE
         DBnEXUMRnd9CPEzLU8e2DnnhZEeOw+3nor11dl9VcdY7+VFSWS4xhP+EJ67dtkOPLLKV
         qq3rlUEK7F0t6VyQ0n3Wtrez3p+HN5lGwaxeW9rNsrCLv3B/7tWzBfdWFgXAxZieQXgO
         nk4uQz6uQxeHnX9Nb0VYlp71Ec1FrRVpa+ChfsOjqbFriLPtHzimRXTdhjN5tLa9zgIV
         GFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137915; x=1709742715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y00SGrd9M6s3CDkf95KQLhsTphwzXhcDaiAvmjSSj6k=;
        b=necWDgdVRwgtf4cusOD6glOEBGd3j03CJIcVKC7b1NzfwlSuo8GTddADhBI4vUYe4F
         hWecup6+xJq04+D7Zu3IXSl8jD4bspZEIMAe4JCFHp6PywyCNog5vOB2XL2lY3YDtEHX
         /FGmsqy+Yxh3foq3uHUxqirDBpb7Q8kLLe196gG/+O+1fHKyTKtjmUUJssDjyPGc1RiK
         7mtvJSUdRxAxJ3AvhiSvgREOGeuVMX9cJXvsZkwolMFpZ9nQFKZdr7EUB4Ytx8TLFpOp
         /IT0Ccj2qyPVHYCDYvrdRR3XXEzzX5Wtx+DvtCha6y4BjtfniG9cdCOikU6YuwDX4Ihp
         k3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBvoq6PtZGySabf9L/deafCDOD8QolydHgcrai5GKypyMbllUhVadM0JdXaR8+L4Ns6jPDc0HibjNYlhoZZhw2rZmkWA4=
X-Gm-Message-State: AOJu0YzBQ9l5sp3iGSZy4/HcL9rhggxHGLmKBW9Fdkbo401VoDvazEWZ
	jNNGmlBgLcCFU/sZj4luJ1PwDOSDCcr2/CVk3fyxTucAfemJ3/AQ
X-Google-Smtp-Source: AGHT+IGj4/IjP6v6QkD8PC0HSa34HyvewYGdsnXngXKn//7R1aZlo6viivB4X2GagxTTDYApigz2/w==
X-Received: by 2002:a81:ef14:0:b0:609:37fe:fb97 with SMTP id o20-20020a81ef14000000b0060937fefb97mr3571358ywm.4.1709137914777;
        Wed, 28 Feb 2024 08:31:54 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id h135-20020a816c8d000000b0060923196f02sm1154828ywc.13.2024.02.28.08.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:31:54 -0800 (PST)
Date: Wed, 28 Feb 2024 08:31:53 -0800
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
Subject: Re: [PATCH net-next v5 13/21] bitmap: make bitmap_{get,set}_value8()
 use bitmap_{read,write}()
Message-ID: <Zd9f+W33T+jWalBF@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-14-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-14-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:22:08PM +0100, Alexander Lobakin wrote:
> Now that we have generic bitmap_read() and bitmap_write(), which are
> inline and try to take care of non-bound-crossing and aligned cases
> to keep them optimized, collapse bitmap_{get,set}_value8() into
> simple wrappers around the former ones.
> bloat-o-meter shows no difference in vmlinux and -2 bytes for
> gpio-pca953x.ko, which says the optimization didn't suffer due to
> that change. The converted helpers have the value width embedded
> and always compile-time constant and that helps a lot.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Signed-off-by: Yury Norov <yury.norov@gmail.com>
