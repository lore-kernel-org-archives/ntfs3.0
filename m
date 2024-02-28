Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7520312
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137885; cv=none; b=teOyLQvphBPNW6bGrHshLgvE25uYRM8MXVLmiJ5ZWLjrr/wz0x/7s+mM7+nRJgzva0nyvxCNsvugz+lPBXEYduwdaHV1sAmh9P8b52BILx0jg33rqn+sDyusMcNog2JFrP2cmJYGBI+/R1kdZhF8VHnoZ9YPFKxPdS/XcYhT7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137885; c=relaxed/simple;
	bh=q0uUPGn9pVGPThc41lrMHBtz9PnPfJz4KxXuUrJDVag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrzoQdvRjrCHNiVT7rZuk6gzx8ZVgfcpEAOBOe8fFpQkJ2pqwaPlVVotbyoCMk/yPlsRM7W4OchdnP6H8sV7YAAXx6lEe39g3RRoSyNkuKLdk8fekFCu3KFnE9wJkR00kHhnWD5H97OMpdHOmUNytRK9QsyZWWdkikjceSsbBTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxI20cK8; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxI20cK8"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-608a21f1cbcso37531177b3.0
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709137883; x=1709742683; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Np5Q1IFAeL3gVqFgXL9N6s1o+4P8nHvPzIDBSXAmlk=;
        b=AxI20cK8rZXOB4AUMZEepaq3+R5/bjXgoXulZVnP4EViRoy1su64lXbqs0a3Sf+qlv
         BdASCRVo/8QRF81G4IIUVqs06VXA3blZ0XmQ5Rr1/5XoMbfj3H7fjD4DrLpDMaVGzNft
         qtvHOO8Oq5byyYrY164h5qgdY4QEaZ4G6wjQuCPc/1ZfEkPkB9VBZKA+cLyTSBuVx8rx
         BTHuWrQRX7ka70JmaoYyMb+0/MHvBH7RjFJC8DomwEwiOIx6uHPoI81FfuduUOLw57Qg
         //qwofupsg879ng237vIRn5lTgj6l/hFSSA+iQ0trlHZGNZbIEYCcqgHvncE1bTG0ejz
         eVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137883; x=1709742683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Np5Q1IFAeL3gVqFgXL9N6s1o+4P8nHvPzIDBSXAmlk=;
        b=sbXRcTK5qlBA2sOsEb2O7M+ZpicOhkcGx3zNqpWrFLIWwXbpt3dlnm/myWnFJZGsuN
         El4FmHjdIe6kZ87xY5pRjnhdRn/R1eXgiNJ/ODOlUsit7mfrhFy5TSUO107UKbk4E9Wb
         q3enfbert+cpyyVCw1ff8F861frh/hFclEJaKdvGwaXNol3juSMwpXvslh3ioC3BfYce
         ACu8ScrT1rpoa/abQrlc5G7u4E72mnJZft3V3YjUXmvtPKNMJAVuuXkg8Bb+FzK/OLQN
         Ym6em940kNkNEWquqXIN7tNJEQlwjQUj/Yj8EcrEiMVxRfUdVZko7Kz6OtlnzwcA7U4n
         XhCg==
X-Forwarded-Encrypted: i=1; AJvYcCXeACRifNVzQGdmSJDvZV5w2pHIe9YiiC0s6vnXNEn3kRrleGQl/hEokz8WWedPj4wLqkOa5qDxsqz02KkiiGDdi0i/D5A=
X-Gm-Message-State: AOJu0Yy7tFVMkpMa+lXk8Pk/9fg6BFFatOB/Mg7lhu1qtHrtXsdqv0UL
	2cgvz1v00Oo7mLmF/mzp/s3zfEBowP61E2csnPkb2ECnBx+Fgvvj
X-Google-Smtp-Source: AGHT+IFpCUevzcdQnQRe5EFnA5eHKX981GcyRjFfNB3wwk2XmTFNTIpuoyEb4u6yxTYV7RM/GNdFHw==
X-Received: by 2002:a05:690c:fc5:b0:607:bfa6:7434 with SMTP id dg5-20020a05690c0fc500b00607bfa67434mr6942257ywb.20.1709137881926;
        Wed, 28 Feb 2024 08:31:21 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id i184-20020a0dc6c1000000b00607e72b478csm2477866ywd.133.2024.02.28.08.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:31:21 -0800 (PST)
Date: Wed, 28 Feb 2024 08:31:20 -0800
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
Subject: Re: [PATCH net-next v5 12/21] bitmap: introduce generic optimized
 bitmap_size()
Message-ID: <Zd9f2D6uhr3HgKt4@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-13-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201122216.2634007-13-aleksander.lobakin@intel.com>

On Thu, Feb 01, 2024 at 01:22:07PM +0100, Alexander Lobakin wrote:
> The number of times yet another open coded
> `BITS_TO_LONGS(nbits) * sizeof(long)` can be spotted is huge.
> Some generic helper is long overdue.
> 
> Add one, bitmap_size(), but with one detail.
> BITS_TO_LONGS() uses DIV_ROUND_UP(). The latter works well when both
> divident and divisor are compile-time constants or when the divisor
> is not a pow-of-2. When it is however, the compilers sometimes tend
> to generate suboptimal code (GCC 13):
> 
> 48 83 c0 3f          	add    $0x3f,%rax
> 48 c1 e8 06          	shr    $0x6,%rax
> 48 8d 14 c5 00 00 00 00	lea    0x0(,%rax,8),%rdx
> 
> %BITS_PER_LONG is always a pow-2 (either 32 or 64), but GCC still does
> full division of `nbits + 63` by it and then multiplication by 8.
> Instead of BITS_TO_LONGS(), use ALIGN() and then divide by 8. GCC:
> 
> 8d 50 3f             	lea    0x3f(%rax),%edx
> c1 ea 03             	shr    $0x3,%edx
> 81 e2 f8 ff ff 1f    	and    $0x1ffffff8,%edx
> 
> Now it shifts `nbits + 63` by 3 positions (IOW performs fast division
> by 8) and then masks bits[2:0]. bloat-o-meter:
> 
> add/remove: 0/0 grow/shrink: 20/133 up/down: 156/-773 (-617)
> 
> Clang does it better and generates the same code before/after starting
> from -O1, except that with the ALIGN() approach it uses %edx and thus
> still saves some bytes:
> 
> add/remove: 0/0 grow/shrink: 9/133 up/down: 18/-538 (-520)
> 
> Note that we can't expand DIV_ROUND_UP() by adding a check and using
> this approach there, as it's used in array declarations where
> expressions are not allowed.
> Add this helper to tools/ as well.
> 
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Acked-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Signed-off-by: Yury Norov <yury.norov@gmail.com>
