Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA796EF00
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137608; cv=none; b=oE7AG5R34DJnSxouJeVWRiJiJiIPtKrrJG9DrMsoWHTf6Q++L/gqHEFm8t6ppBUN2k99KG3YBycHoOEPF407Pa+FpaDWlzZHVsPgWEWBV1FKkk3O8lXiuJKwuIweYJ1AVx7ftIbocpCJxzVPrAdqegrwxwt5NXhLO754yAv4Fo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137608; c=relaxed/simple;
	bh=cX0mbhq0/BEYvXkOM7RWyssC+Bf7DhBCperd504OjNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyFePebAodLKkfITlpLPC7/P/0FopQ9SX7HbqvsX2v+tR7dPE0bWLCIB1BSPhV83aJmYVJfEm9NhIP/kILNMxr9LQ51wzZk8hDmIDhVRc5SCJT4Shrufeuruk50ob5nQvFEwuPRHQAd+ntSSdr/4mn8JzDk21LGKGtbgP1ul3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIMQkuAO; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIMQkuAO"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso6401804276.2
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137606; x=1709742406; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKTyKBoJ+zqx71icHaiIJXRtovwN+h+pKT79UfPo2co=;
        b=EIMQkuAO6IMXmrY4PxoiEeZtixMlm+xILLpdz41+xJi6povx6GlgJJeBamYBkz6q0f
         y8QPHPKZYo+eA9RD+HjIHyN1F7opSTNXaTEBd0BCOPNg8JpqB8mO7UPfSOQoH6DaHfsC
         l3MqkzZr5YSC7sD+9mG3uC7j2w5GgXnzh7zc1Z5YhuFbmfv+75Fsqf9NkPKaoRCMY9v0
         rXIycCxYpT7Ggbv3icicJd1JcThhss6h6D+nwLPUavQY/A0vH43HTQv/IwICfaPGOuX0
         szv7+bPifapPfC8C0Eu0wriDaFL/cdjelk0WXTxyDVwQEKZHcAE0O5KiXFGGYkhu5P3B
         yfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137606; x=1709742406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKTyKBoJ+zqx71icHaiIJXRtovwN+h+pKT79UfPo2co=;
        b=nYoXmRUFqlaCigW8eu+ctKxgJKvtxNCGRvcaqIx6YRKvuVIM/GqfhZkmCEMCAJKa1z
         yu41NZcEKxhmkC5sF0FqhI9y1CXw2um+p5icZJUJwQGctJbZ382RMay392vLgpPKNGH+
         emPD5uBCwfxbm65Wgj/UsGbmbUndBcF8ymYrpqvmW8RMLuMub1jN6JJzy+MsLA4pRSR6
         MOI8P8Xfd95tgnuYbzIwkUytrkc7OY24NfLOE8B6ZUge1Io/DLJ32X6bawZy0iUbPztF
         fNjM1XW1Vr2RPJIRjavrN4VSbnC6I6PDFvZRRk90uO2FrQV0uWU6C1R9j9oDZFR/D2zZ
         VVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaWJirJbn9Vh94MHjEbM1H8WCgclWrs6rr7la1IEUWqyK8iF8ktikYRdCcESIJNAKIF6zYaPG3gkIZiTqabtKDJFn/Tsc=
X-Gm-Message-State: AOJu0YzqNMMyTeO+9GU72KDDizolb1Nua6miqX3UvcHzwEFuYGsY2LqN
	WjOg4RMWmjElznHub95q4yTsf/YsST2tY9qPIF+DwIvySKUOEmti
X-Google-Smtp-Source: AGHT+IEzDdshAZPifjikVHSc+ExEKZEbNWC8tYDB1UrSX7QHB04ABcGjvuz4tLQbulb0mZqEO3cKSg==
X-Received: by 2002:a25:c5ca:0:b0:dc2:2f4f:757 with SMTP id v193-20020a25c5ca000000b00dc22f4f0757mr2619998ybe.7.1709137606029;
        Wed, 28 Feb 2024 08:26:46 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id x11-20020a25accb000000b00dc6d6dc9771sm2072223ybd.8.2024.02.28.08.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:26:45 -0800 (PST)
Date: Wed, 28 Feb 2024 08:26:44 -0800
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
Subject: Re: [PATCH net-next v5 09/21] fs/ntfs3: add prefix to bitmap_size()
 and use BITS_TO_U64()
Message-ID: <Zd9exCzbAnOxAY50@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-10-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-10-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:22:04PM +0100, Alexander Lobakin wrote:
> bitmap_size() is a pretty generic name and one may want to use it for
> a generic bitmap API function. At the same time, its logic is
> NTFS-specific, as it aligns to the sizeof(u64), not the sizeof(long)
> (although it uses ideologically right ALIGN() instead of division).
> Add the prefix 'ntfs3_' used for that FS (not just 'ntfs_' to not mix
> it with the legacy module) and use generic BITS_TO_U64() while at it.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com> # BITS_TO_U64()
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Reviewed-by: Yury Norov <yury.norov@gmail.com>
