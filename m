Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C215DBC6
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709136843; cv=none; b=pmMwVlixCup0hAnAwpIuR56rw8LGbQVjzY12pSOoCse/z1+G75NdG4NoOSEY/iDBxMRF5PQ0bHGHu3+uXu28KyLtWUlI2k8bcIac4T9c8sYsv+JWFiy6uy5OJnYEptsd7MmrCdwq8p3qRpZ1Ma5M0rWBPAvNiUzH8hh3i6te4WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709136843; c=relaxed/simple;
	bh=vBML+da3ru4k4fY41n9a1rUchj8BCGb3zQ7x/xQtZ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4qHhkX0MGhqmf6/Gct6Er7BYo5iWXSM1Mtqs8X5yUmqguIQte5YN0dx6XH5sV64smTsZdfAUQV/hK9SwMorj8RuH7djt6eQCieWtThL3ClQMZwkfM9pkxEJDCYvIYgj/fz2LOQnRBXowCzZGoLYsGxHauChqEc6Vv30O26ioGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/6U9kwZ; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/6U9kwZ"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60908e5fb9eso36549787b3.2
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709136840; x=1709741640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=45YCxhrvUCz1KlVt7J4vAlQKroPfuxlv6s5YsGgz7tQ=;
        b=h/6U9kwZiXp3cXWxIyoyzq6D5NnV9dr3BeArQDpOeEiRMZ+cN7sRt9CrPRU6WpzsP7
         oAGOnxI1xa/9Z5YUFtf1uMR5aS0llHECIOO8OiT9b7XZdIDQngb4RGeC8j75og9gzTD1
         H19WK47htM09qw4p8xiFXvsTCC2zukGLn0CD4Pg9oAvJ20arNNmBMTpGPLR1VjhHxgGt
         +grIhvkGsnZ648Jbv8quL1GB7KskDT5awqk04T1y+RznWZM1ubpoZLLHs4IVwiRPmSBu
         eW6TkhP+4MlzgoqfQn1Z5bVCAvBu3Q+6QqQzqiGJdSSfa4GDpHHFyWPBZ7JFQZvTL7xx
         BKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136840; x=1709741640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45YCxhrvUCz1KlVt7J4vAlQKroPfuxlv6s5YsGgz7tQ=;
        b=RLCItQC33IBZUBxPU9zfICQ1jqJtL2SK6MfDTUjdfLmVo+bdWt8nWUiZg9dSege6Cy
         1+Z/3tmY2yI2McJr6V/b7PqlIKn89NHjWRGEKlOOihrKMFL+DGOk+s/C54bBxAcFdz20
         Lyi3rXf3qJXKxz2lXV/m+yn+iHlEd9Jao6eLKvlNPBJGB0p6Iz0cAb++yTwD4HZgF7ep
         2WY9I/gQt72N9je9rMrciR7Qb4mZ/YKtXKxQ/45V/gbMGF/Xhl8rTSd9fk+P53tuuVob
         /TjyLun2msxK0rSgc6omgFMUfJTaP+tV+w5HrR13yGdJdgFGLaxQDXguyrTudFfWmVf3
         LA6w==
X-Forwarded-Encrypted: i=1; AJvYcCUTGeq+O2gQpKSULNW6QijlL8p/ZUAuR9meWNkmASUuon3/PRKMLOoiTsVorY1Ar1R2KCpxvrTjyzBP9WgvJHqhSAdchZg=
X-Gm-Message-State: AOJu0YwT1RZEf2zWZQ3pRh/62abeE1bvJroqm8+rSDzoWkMsSJWsnRNZ
	JL2neaUvdFD+n23c0jJ1Dh36dobeMdWmm5OOTmfgLps+tlA0XVNj
X-Google-Smtp-Source: AGHT+IF/XdTViG4nS4Tgw4GzisgwWwhJcP/ftilWPL2A7fbswfOIesX+rYdfS2+pLR0JyM0z6TybVg==
X-Received: by 2002:a81:f903:0:b0:608:e694:ffcd with SMTP id x3-20020a81f903000000b00608e694ffcdmr4873054ywm.43.1709136840492;
        Wed, 28 Feb 2024 08:14:00 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id w65-20020a817b44000000b00604198c3cafsm2438101ywc.61.2024.02.28.08.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:14:00 -0800 (PST)
Date: Wed, 28 Feb 2024 08:13:59 -0800
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
Subject: Re: [PATCH net-next v5 02/21] lib/test_bitmap: add tests for
 bitmap_{read,write}()
Message-ID: <Zd9bxxRQboZI98KX@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-3-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-3-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:21:57PM +0100, Alexander Lobakin wrote:
> From: Alexander Potapenko <glider@google.com>
> 
> Add basic tests ensuring that values can be added at arbitrary positions
> of the bitmap, including those spanning into the adjacent unsigned
> longs.
> 
> Two new performance tests, test_bitmap_read_perf() and
> test_bitmap_write_perf(), can be used to assess future performance
> improvements of bitmap_read() and bitmap_write():
> 
> [    0.431119][    T1] test_bitmap: Time spent in test_bitmap_read_perf:	615253
> [    0.433197][    T1] test_bitmap: Time spent in test_bitmap_write_perf:	916313
> 
> (numbers from a Intel(R) Xeon(R) Gold 6154 CPU @ 3.00GHz machine running
> QEMU).
> 
> Signed-off-by: Alexander Potapenko <glider@google.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Signed-off-by: Yury Norov <yury.norov@gmail.com>
