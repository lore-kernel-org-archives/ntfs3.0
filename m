Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8BC328A7
	for <ntfs3@lists.linux.dev>; Mon, 16 Oct 2023 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="be+0/Sy0"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d9a4c0d89f7so5595695276.1
        for <ntfs3@lists.linux.dev>; Mon, 16 Oct 2023 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697478505; x=1698083305; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Gni6mzvaBaFKxuMxn9hZgE2UC6/dQHw9AadxVgtVNo=;
        b=be+0/Sy0opiqNllI7oftgFsajvr6eY3TEvs76zWfb5mEXVRx85mzbrsxzCCxE1U0GN
         jTwTzhgBFCoXG4Y4YAaCcgyh8hf2vYJHFoS0d7fqimE/SrGufFZIQLnwKcS4fDgn1M4I
         bMXp7kQgQreHemJ+jQFWKpUnjGmLFM+X/zGorbGjOKIJQg/ZuWbfZUF7pXjSdeTBCyAS
         d/GnZX7ZX15hl8v7PNAhxpBVN3Y6ba4kVyQ7t02MeyC8osok62yhv0ZkG8ldfR6+rkjo
         n1dNNfDp0pFPNQcbcvK5k4wtTw33I1PTqkuXsy1KWqMq9tbZFXj5BbydNJ2xfIDBvL/F
         CAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697478505; x=1698083305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gni6mzvaBaFKxuMxn9hZgE2UC6/dQHw9AadxVgtVNo=;
        b=uL5Zgdy6Nng+WwmMqF8AuSRVst20QAsCKbgBGT694lyW3/KcA5MSb07MDdQpOdcVVm
         wNwdNfmSpFmoCgUlu1U9JQooxVPPO9l0RQIKFg5X0e6WhewwqKuExuCK4GmO8BRm61lK
         cDDpvn3k/eaVeKKHfWCaxGEYfBmN7YCBW6UNAgIOPrUEpVty+tDL+hIIMijQsJQd1DeB
         vrza+RHCMzg0jOwR7gPLQIoffCKUWHsw1rBCyFPfnuq5vVtizrkUdw0eV4qb07b61VlT
         C0x2pUeggmPqtsaYlwr7Mt6rNUA7io6NT3R6HpdbvWxMu+gPExGKDUceJGLvfP/Ep+6S
         eyNA==
X-Gm-Message-State: AOJu0YwyX5vXyXbk0P+lNnhQ2lrPMPtY01GFTQnEIZaAxMmLMj1WZPOL
	+HMV1vnauKKH6ybWnd9gvTY=
X-Google-Smtp-Source: AGHT+IFxhp5Fg6dD0ShGrsQoX3lKB8P2VZfUuC29sX4UXOWErGVDVNAevi+hJU45YX1WEraFAAwehQ==
X-Received: by 2002:a25:3742:0:b0:d9a:4a5f:415d with SMTP id e63-20020a253742000000b00d9a4a5f415dmr18010718yba.0.1697478505154;
        Mon, 16 Oct 2023 10:48:25 -0700 (PDT)
Received: from localhost ([2607:fb90:be80:2b9:64a5:5a0e:5435:bd4])
        by smtp.gmail.com with ESMTPSA id q17-20020a25f911000000b00d20d4ffbbdbsm2775571ybe.0.2023.10.16.10.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:48:24 -0700 (PDT)
Date: Mon, 16 Oct 2023 10:48:23 -0700
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
Subject: Re: [PATCH v2 09/13] bitmap: make bitmap_{get,set}_value8() use
 bitmap_{read,write}()
Message-ID: <ZS13Z8Ls69lEBYib@yury-ThinkPad>
References: <20231016165247.14212-1-aleksander.lobakin@intel.com>
 <20231016165247.14212-10-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016165247.14212-10-aleksander.lobakin@intel.com>

On Mon, Oct 16, 2023 at 06:52:43PM +0200, Alexander Lobakin wrote:
> Now that we have generic bitmap_read() and bitmap_write(), which are
> inline and try to take care of non-bound-crossing and aligned cases
> to keep them optimized, collapse bitmap_{get,set}_value8() into
> simple wrappers around the former ones.
> bloat-o-meter shows no difference in vmlinux and -2 bytes for
> gpio-pca953x.ko, which says the code doesn't get optimized worse.

That's just amazing!

bloat-o-meter itself doesn't say on optimization, but in this case
I think that BITS_PER_BYTE passed at compile time allows to generate
just as good code with the generic bitmap_write/read().

Acked-by: Yury Norov <yury.norov@gmail.com>

> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> ---
>  include/linux/bitmap.h | 38 +++++---------------------------------
>  1 file changed, 5 insertions(+), 33 deletions(-)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 2020cb534ed7..c2680f67bc4e 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -572,39 +572,6 @@ static inline void bitmap_from_u64(unsigned long *dst, u64 mask)
>  	bitmap_from_arr64(dst, &mask, 64);
>  }
>  
> -/**
> - * bitmap_get_value8 - get an 8-bit value within a memory region
> - * @map: address to the bitmap memory region
> - * @start: bit offset of the 8-bit value; must be a multiple of 8
> - *
> - * Returns the 8-bit value located at the @start bit offset within the @src
> - * memory region.
> - */
> -static inline unsigned long bitmap_get_value8(const unsigned long *map,
> -					      unsigned long start)
> -{
> -	const size_t index = BIT_WORD(start);
> -	const unsigned long offset = start % BITS_PER_LONG;
> -
> -	return (map[index] >> offset) & 0xFF;
> -}
> -
> -/**
> - * bitmap_set_value8 - set an 8-bit value within a memory region
> - * @map: address to the bitmap memory region
> - * @value: the 8-bit value; values wider than 8 bits may clobber bitmap
> - * @start: bit offset of the 8-bit value; must be a multiple of 8
> - */
> -static inline void bitmap_set_value8(unsigned long *map, unsigned long value,
> -				     unsigned long start)
> -{
> -	const size_t index = BIT_WORD(start);
> -	const unsigned long offset = start % BITS_PER_LONG;
> -
> -	map[index] &= ~(0xFFUL << offset);
> -	map[index] |= value << offset;
> -}
> -
>  /**
>   * bitmap_read - read a value of n-bits from the memory region
>   * @map: address to the bitmap memory region
> @@ -676,6 +643,11 @@ static inline void bitmap_write(unsigned long *map,
>  	map[index + 1] |= (value >> space);
>  }
>  
> +#define bitmap_get_value8(map, start)			\
> +	bitmap_read(map, start, BITS_PER_BYTE)
> +#define bitmap_set_value8(map, value, start)		\
> +	bitmap_write(map, value, start, BITS_PER_BYTE)
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* __LINUX_BITMAP_H */
> -- 
> 2.41.0
