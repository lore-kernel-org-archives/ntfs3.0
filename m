Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973026EEE8
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137099; cv=none; b=gH7yxFax3Y/OZW+6pOemgIVwBVdtY0wGU99IFXuY5Ek/k6PtyHfKQIn7Slkb5syW1LsholC3t5CRhy95icJmK4lO1QjwObA8NRGmIgB1C5dbGTeLQ7R5/VUpVe2gtI385e0T1cvUR72WXt0hcqoIzWeNTAE0iFkHALy+F12x20Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137099; c=relaxed/simple;
	bh=COF6G92ulT1WirswD6YovX9eGiOC1l37L7KzMeYAzi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObrD179tuiPiNYUAMPlnfxXSsN4xwCUQzDDu96NJqav2aG9Vu60J75zBCNagR77fnSYyNo8tlku1CfSVV8yjv4hTiTeCL9O5aNfQvY7TwP6v+ny3owiINKqirCfDKj8/g5inGxveiZQfNwJbYKHciTA2Xc2P4PKH0qoVoG/xxyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L008dwpN; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L008dwpN"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso5645978276.3
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137096; x=1709741896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rl2J8wUQ0nkL1SOPD3XRF42shMc7kd3Rtbu+FuDVg5g=;
        b=L008dwpNSlwgS7OB/u93gunquk3kdBMUOjyMr/EToGOfC6PlwN6eqSqJEpPXEOGu+i
         gkriy1cYkigED5TWs9G2ybB9/Jh95KbGF5tEKQlsmRYgGE9/g82Q6c9nIhDwDYEgL8cl
         ILZtmURKsbsDpr6UspaQr0VJGbe4YX3JBypJSko6ZFT8BuuR8XtnolPZXU/48Y5460NF
         09s7AMZ9pvgA07c57qXisKDKUVe1DNeFXr81lwicK5Bz69DBTcK1wj3I4ijiTI5CD/iT
         hdQoFFmkMrsEpKFnFHMvAhD9HZItCzO0SegC7+1pzmdRkUaZHEiTFFss2RCHvwTVWJOQ
         eR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137096; x=1709741896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl2J8wUQ0nkL1SOPD3XRF42shMc7kd3Rtbu+FuDVg5g=;
        b=F1HZ431+sQifWYYtAI4rCamErO1rSslBUccMEQekiySDMWFysZTkum73REzf80O9uU
         3kemthIDGwUr8SaNjO2BKpUKgHp2/AAGz6Ny0Gyh/zQO+KU/2JiQvO6j7vlFvpPXuHfA
         wMZEtRq8KWJ0smiIa96f0M9LyAed8qmCEVrT3DHprJpo7RbDeZ4Wtf+KKuAPu/G8wx6o
         e0XDG8lHCsfnu6YJRURIFNqOJGRu6j8uQEw6hVdRLpHgs8m3PtzAFvd/ZCazMt3qAs+O
         VyhKM+CdlNI8SLlT5Hz6fAImCL/A1aM2wO+5q72grMPTvhZDMg/k+y2wcpC7A8vV2/fS
         x/MA==
X-Forwarded-Encrypted: i=1; AJvYcCWqW9mQIQ+p1GDuhkqwqcqmXmgPiZi3VvIDgdtlbdGQ8oH9s3zqdp3NUgjVFMN7dVJk2gX0h+hqj3fT7WnyA2j1gmcb3V8=
X-Gm-Message-State: AOJu0Yx06RMVK/FzpdbnvTBrG7QGd2IVKx71RclxJ52W2KsFDCw7teVH
	CbHMAxQil8AyWGCJBIf3ARDaEt92Od0j2BNBZkqz8wWPszJEo+I0
X-Google-Smtp-Source: AGHT+IHq8mQJHHCspvj6dHRiMav2oJi1D7d3a2gVdEsp6p3DsPADLGfhpHlDysvZKge1cU6fkAdzkw==
X-Received: by 2002:a25:2f46:0:b0:dcd:5f08:3666 with SMTP id v67-20020a252f46000000b00dcd5f083666mr3229434ybv.29.1709137096483;
        Wed, 28 Feb 2024 08:18:16 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id b26-20020a25ae9a000000b00dcc75d4e22dsm2063296ybj.5.2024.02.28.08.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:18:16 -0800 (PST)
Date: Wed, 28 Feb 2024 08:18:15 -0800
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
	stable@vger.kernel.org
Subject: Re: [PATCH net-next v5 04/21] bitops: add missing prototype check
Message-ID: <Zd9cxygyGo8nla0I@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-5-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-5-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:21:59PM +0100, Alexander Lobakin wrote:
> Commit 8238b4579866 ("wait_on_bit: add an acquire memory barrier") added
> a new bitop, test_bit_acquire(), with proper wrapping in order to try to
> optimize it at compile-time, but missed the list of bitops used for
> checking their prototypes a bit below.
> The functions added have consistent prototypes, so that no more changes
> are required and no functional changes take place.
> 
> Fixes: 8238b4579866 ("wait_on_bit: add an acquire memory barrier")
> Cc: stable@vger.kernel.org # 6.0+
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Acked-by: Yury Norov <yury.norov@gmail.com>
