Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D6374C6
	for <ntfs3@lists.linux.dev>; Mon,  9 Oct 2023 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQBQsHcs"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-579de633419so58216997b3.3
        for <ntfs3@lists.linux.dev>; Mon, 09 Oct 2023 09:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696868323; x=1697473123; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+v0P6uduPxkDwct3qYcLQFv77ucBxF1TcIWjbvekveU=;
        b=DQBQsHcszEjsP8uXhk+ZyghYUh9jKoSA1Tn3ubrOnomEkkrgiPyrnXTR2kSLh6B1xP
         Ol7y/CbbOUxS8C+OSoPJibd3vcgVEZMwj8qNckdVGr6mOmYNMAqNpGQ0oAaXvn0ms/L0
         YVDCqLrVaZaQIy8uZC1oN9AbomWFySRuUZ03MlZoEUvGsTTJCF6oNiepAwQgHOjPmolk
         34K0xvZmDAoZqwmPCcKKBTn+RPJWRbuACGQhVF5cUwJ0OsBjkP+NWFwstkRdduMKsFdA
         j9lhn7CVseSrHhgy7U2s+dyTSKdbeHp8x+BOdn65NNGMQx+JBb059KIrgPS2YmtRCtk3
         k8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696868323; x=1697473123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+v0P6uduPxkDwct3qYcLQFv77ucBxF1TcIWjbvekveU=;
        b=W9hr/hz/Ai96s0m2l9Nfg4FfsQvg0dEX55T3toALl5And+gA6YGZyz606NJS+jesEw
         YqFjf+kI46DLFortZCw/JkapByeHZ1498KUwoqUxy79jFYMKlCOfCl4S4C0DiyYL2zP4
         HzXcP6zBMRvjU+96Eik/T28Y/RkAYE5W3wkn2+xATnc2WqvWg4f0Gy9AZ/AjvJD0kEl8
         MTDmPUN5GaIpibuIC5uRlyYjkURYYkPTjLuyw0jmEmm4ZLdFsX0aA9lCWUQP6wFg6HVp
         btFOpTdKAiYv5++fXrqmYqYJELZxSsiRkliTIu3CEddnfJwImnIuDe61iKQyjyg+qCkr
         /3rg==
X-Gm-Message-State: AOJu0Ywdy7cvzmjAXmPuHrjgwtOneaOwspUiaIx80/7L8BIAunaj8A+t
	UV3FpWymXHWAK3L8ZK26/BQ=
X-Google-Smtp-Source: AGHT+IHB8jMCMIkYIOrWoj2aAnwZpAx6vHscHjQQzqKGazLmHofK5EelcUbictbWaOs9tL3UCKSfcQ==
X-Received: by 2002:a81:6e41:0:b0:598:bad6:8e67 with SMTP id j62-20020a816e41000000b00598bad68e67mr16343283ywc.30.1696868322609;
        Mon, 09 Oct 2023 09:18:42 -0700 (PDT)
Received: from localhost ([2607:fb90:be22:da0:a050:8c3a:c782:514b])
        by smtp.gmail.com with ESMTPSA id u206-20020a8147d7000000b0059b4e981fe6sm3728032ywa.102.2023.10.09.09.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:18:42 -0700 (PDT)
Date: Mon, 9 Oct 2023 09:18:40 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexander Potapenko <glider@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org,
	linux-btrfs@vger.kernel.org, dm-devel@redhat.com,
	ntfs3@lists.linux.dev, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/14] bitops: let the compiler optimize __assign_bit()
Message-ID: <ZSQn4Mppz9aJgFib@yury-ThinkPad>
References: <20231009151026.66145-1-aleksander.lobakin@intel.com>
 <20231009151026.66145-4-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009151026.66145-4-aleksander.lobakin@intel.com>

On Mon, Oct 09, 2023 at 05:10:15PM +0200, Alexander Lobakin wrote:
> Since commit b03fc1173c0c ("bitops: let optimize out non-atomic bitops
> on compile-time constants"), the compilers are able to expand inline
> bitmap operations to compile-time initializers when possible.
> However, during the round of replacement if-__set-else-__clear with
> __assign_bit() as per Andy's advice, bloat-o-meter showed +1024 bytes
> difference in object code size for one module (even one function),
> where the pattern:
> 
> 	DECLARE_BITMAP(foo) = { }; // on the stack, zeroed
> 
> 	if (a)
> 		__set_bit(const_bit_num, foo);
> 	if (b)
> 		__set_bit(another_const_bit_num, foo);
> 	...
> 
> is heavily used, although there should be no difference: the bitmap is
> zeroed, so the second half of __assign_bit() should be compiled-out as
> a no-op.
> I either missed the fact that __assign_bit() has bitmap pointer marked
> as `volatile` (as we usually do for bitmaps) or was hoping that the

No, we usually don't. Atomic ops on individual bits is a notable exception
for bitmaps, as the comment for generic_test_bit() says, for example:
         /*
          * Unlike the bitops with the '__' prefix above, this one *is* atomic,
          * so `volatile` must always stay here with no cast-aways. See
          * `Documentation/atomic_bitops.txt` for the details.
          */

For non-atomic single-bit operations and all multi-bit ops, volatile is
useless, and generic___test_and_set_bit() in the same file casts the 
*addr to a plain 'unsigned long *'.

> compilers would at least try to look past the `volatile` for
> __always_inline functions. Anyhow, due to that attribute, the compilers
> were always compiling the whole expression and no mentioned compile-time
> optimizations were working.
> 
> Convert __assign_bit() to a macro since it's a very simple if-else and
> all of the checks are performed inside __set_bit() and __clear_bit(),
> thus that wrapper has to be as transparent as possible. After that
> change, despite it showing only -20 bytes change for vmlinux (due to
> that it's still relatively unpopular), no drastic code size changes
> happen when replacing if-set-else-clear for onstack bitmaps with
> __assign_bit(), meaning the compiler now expands them to the actual
> operations will all the expected optimizations.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> ---
>  include/linux/bitops.h | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index e0cd09eb91cd..f98f4fd1047f 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -284,14 +284,8 @@ static __always_inline void assign_bit(long nr, volatile unsigned long *addr,
>  		clear_bit(nr, addr);
>  }
>  
> -static __always_inline void __assign_bit(long nr, volatile unsigned long *addr,
> -					 bool value)
> -{
> -	if (value)
> -		__set_bit(nr, addr);
> -	else
> -		__clear_bit(nr, addr);
> -}
> +#define __assign_bit(nr, addr, value)				\
> +	((value) ? __set_bit(nr, addr) : __clear_bit(nr, addr))

Can you protect nr and addr with braces just as well?
Can you convert the atomic version too, to keep them synchronized ?

>  
>  /**
>   * __ptr_set_bit - Set bit in a pointer's value
> -- 
> 2.41.0
