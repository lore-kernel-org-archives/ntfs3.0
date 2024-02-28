Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B506EEEC
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137658; cv=none; b=hZ/cLS9v+EW6jFifmkpZzD2o5aMcGaRlccZiyGwwsxfQY8o7GRsp1bgHdv6eV4Ok7L8yj5xNhrJcifokTUrb34JTNemAnniVG6Dc/Iejkli5LAjPKbV7QBJvyOHVpw3zmiOh5xfnuBmEyQUFEAGRslwTaqU/s5bCK6wMip31uqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137658; c=relaxed/simple;
	bh=XsYfI28aCpKhqEa677qx/0xf73cpFk22FTtXQK4wgpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUAWOvZGxMEreV1WI+sa/Ox2EKE8UagQ/NLg/FMgz0i8NTFoyH8/OPuLC10p8wYc/AdHDDOw+/yBAVYJ9grlL4fxwbRTnuQRZWpl7qbNFtxdYuPts69aIsqwF5qoTGFVI21UTxYdoO2XmGd0UKHmHX85hTBHTc6dekMBJv/eVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SE83vy06; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SE83vy06"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so5805339276.2
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137656; x=1709742456; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hWtL7++GjICFukUAoP4h+KhEWcLjTOAu9lMF7xAGsyw=;
        b=SE83vy06M1l75OVc9dEZzQxE6VxulhTqWHD+tcCG/hBzyKVi1SVTL/Nv6lUo2smcXY
         QUzTRoM+lt5zZHbeqhCxQ+/r1iCj+Xh5QmbSb6kx4unBtNVuEQAiw8TUdQSidvDuPn+j
         65lSmVwYiCBWEdnatSMxnJHgJXOgwK2NNRSKs5M4Iv3iUVOVb7Ey76tBQd/e0kro6C5m
         WrBqoJvete2LSVbctHWmT2Hnk3gSuC7XkOLSQYsN2S+DVlqMg4eEESR0+ZfTTCs8d2lS
         djfY1CvS3B3+5K0y0nw/IFL3kQ6F2eO9B6lfA4BREiwHQpLA2JjIUZgqSsGDw97WNbVr
         dYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137656; x=1709742456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWtL7++GjICFukUAoP4h+KhEWcLjTOAu9lMF7xAGsyw=;
        b=W7hIw0RWz8qO1SNB4vWd57rk/VM0D/sSx7Y4ILGRNyEEcePYCINTPUFxRtJRSwDE0b
         JKYfpNd6K2Iccao4CLwwd8w25WzpIV4v53ELoSJ4ySrAe1+XC7N3U0qRLM5ySuTGLXUO
         9w4qcCjYxuUftKHjptWAcOrKKBuH4NWaApVDK2TBPVwO5Ueldr/JMGBPIAhKAemBNLGD
         A//wfvOoZkAW25f6AiQDeK+MQdpoQVn2oJFIh76SxQ3y5jKPbHXdxblCsyRJyiQtoa2w
         r9lOdV8tMcK9ms7CkToeWPQsUunFrGUdzz3cFaakYSACsloNbML+a23FkwFTr9yajqyj
         Cilw==
X-Forwarded-Encrypted: i=1; AJvYcCUapDYWjL6/Ovy5Hs5664xCYoiukNsH+l3MXJY0sy+R+3cYvs1t3OLh3/GElhsRCfxSYh1nfcT4xI7+s1APUgVo7Qjvays=
X-Gm-Message-State: AOJu0Yy+/ehdv1L5eJTmrNUgTowfo0lBrmsPVrT8eZRbS2jlrpZ6WNTp
	wVZiH8/Mq0J8kvR2JcWCOeOyAapR+gHuZt/MBDsMOX/frZi+wz0g
X-Google-Smtp-Source: AGHT+IGgZ4Kkae23Sonz0Wy+ywJ8k8WbRQHuZh38JY+GnbqJ6cshhsv99aWcYpDQ6qckCPnCgMPxgg==
X-Received: by 2002:a25:e04e:0:b0:dcb:cdce:3902 with SMTP id x75-20020a25e04e000000b00dcbcdce3902mr2751167ybg.55.1709137655985;
        Wed, 28 Feb 2024 08:27:35 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id s17-20020a5b0751000000b00dcc3c85f6a1sm1956317ybq.6.2024.02.28.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:27:35 -0800 (PST)
Date: Wed, 28 Feb 2024 08:27:34 -0800
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
	David Sterba <dsterba@suse.com>
Subject: Re: [PATCH net-next v5 10/21] btrfs: rename bitmap_set_bits() ->
 btrfs_bitmap_set_bits()
Message-ID: <Zd9e9i6FQzGWfHBq@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-11-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-11-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:22:05PM +0100, Alexander Lobakin wrote:
> bitmap_set_bits() does not start with the FS' prefix and may collide
> with a new generic helper one day. It operates with the FS-specific
> types, so there's no change those two could do the same thing.
> Just add the prefix to exclude such possible conflict.
> 
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Acked-by: David Sterba <dsterba@suse.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Reviewed-by: Yury Norov <yury.norov@gmail.com>
