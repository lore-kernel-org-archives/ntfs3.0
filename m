Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3605BACE
	for <ntfs3@lists.linux.dev>; Sat, 10 Feb 2024 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707578968; cv=none; b=Li/t07FgjMUnLMwgluIGIfZ3cVrgogU32XGq5afsnq7oUiZTgW50nVw/4VoDav2jh5YB65dA7oW1l2YI4PzqyjwkQvNOpkNDDW/9d3ILXclmO2sq+aoGi6Dp+DgqLVgOfZuAwraVXy1KGp4q8wxjZVGl03xwQr9m5QW0L7/ebCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707578968; c=relaxed/simple;
	bh=lJApX2EBAcNh34LWwrUaPax+BM9BG9Wp0v2CJOLi4BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEnTB2SdD83gi29hbyNwm54TYfxgQ/9fAKsyoxRwf8ZcV4dqzJQ6BjpSAT93bXsnHGsHUYx6PkW3knvcXjJah3dNFV/Ta3ZibQygskURuLc7cH43QfQVSovwfWfGLlBcca7Mxyr7vzUJth3cK03CsysdonMVe+1U/69Ir11TSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBBJHogW; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBBJHogW"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bda4bd14e2so1428700b6e.2
        for <ntfs3@lists.linux.dev>; Sat, 10 Feb 2024 07:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707578965; x=1708183765; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+ZbG51dE6UVc7hzzIUXGXIlf8j/Yb+04IIzEUmAJ+Y=;
        b=nBBJHogWS+VDZwG+SGfwrQkjch5QnHcG2TqMD6dILk3733Oaqa/6dx2kxyGws6+2QK
         zdhQQLc/dxsJ5/P95Kg+Ma5SNSnIV8Xwf1jVaGbjirmGlM9jXz/wV4h7s3mqgML9jnpr
         V9XIeMnMms63oDL9Ra/sj6rltDIm8AwZdn33rTBDGAMA2CSSUUbULy0t6avt9x9GCZYm
         cPtNZA2f4w/XnOkmmrEHse9qoYCE5p8yS/rNBNDxpRGPNLAyw2XfniknsNbUTldBOVfz
         jZr91gZkvamb9ZGhkRXUlAOcxMDDWx3sIoKSb1MrV39zHEVaUYk5IYFamxw1RJ1HhaIc
         Lidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707578965; x=1708183765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+ZbG51dE6UVc7hzzIUXGXIlf8j/Yb+04IIzEUmAJ+Y=;
        b=SwOpDJivmVXMevXPUhoR+v+UQqnZQk3tIG7spPNtdng33AVxi8LYTz8kVLp8A+Sff9
         sZtq8IUYFGy2CmNoHMQ9T3Ao/cVliSZhMrluWRs3koPk92kWsjkzBZVM+Og/3C3c+g5Z
         B8gBWUSJDkgfOI2pxild0b5BTiCdPnL0Pt4hvJ3p7ZJVVoWA3iJ628mKYovaR84fj/UW
         1hkcieDvK2ISqpoWEloF3OaRTLvfunUuSHI+e3aq1mfvPyG/0Lp9VSA4ZCPlA8RBj84E
         fy/Sa0r0xxczMZ7i63Lpa/ZZtmqA+d7s747rDHoKFDWy9CfBueBThp6FATyoHlYK/o3j
         kJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk3xiWQJbfJcwhqF6HHfqwtHOuzJuDxYsQ+wGM9/aeUNiu/xziOlENvCcNcizx+Bg5PjOarPBLURFuRXVDK5/kEyBudgo=
X-Gm-Message-State: AOJu0YwJn8Z8J7inonBex1US55eSIv1LnNrwEIuZEFUVD4+y3dKk4Xas
	glGOaVf4hU3j1DxPv7kFTkH1mBjON2fWqFkz8Eg9v2G0fLNO7W4i
X-Google-Smtp-Source: AGHT+IGqbJYFgbLuFIwRZhe4bxE0vofbALM0acYfOPamrEqA2AXOaPJMq+11wP41/sQmVpjH7Z4gsQ==
X-Received: by 2002:a05:6808:14d3:b0:3c0:2c0c:306 with SMTP id f19-20020a05680814d300b003c02c0c0306mr2472818oiw.0.1707578965484;
        Sat, 10 Feb 2024 07:29:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxk9m/zPRB4fDCKO8wso0ghzmTaleDwDzmgLTbUZQCa54Ht/q8hjFmPHQuWD6InvjeQ9VJVQs+3by8COedXnz1rGnpEPyxqejDAPW/mFs+LGYkUe5WyIIe2Zc8EFumdgKBqzbVdTMy5KDsYUZ+NIVsjz+V1Fnb40kwxDj1zt38A7SPDDvBxRC3azgAEDvHavGG/sTvKhFmtHry1sSfDx/8HmOIhJeBdh2SuHqpa7BLt+fcv0jTVYQEPd9BdFYGtAVvGZcCsJvppdrEqiJA3N3DqA7d2C95hFfL+9YNZ7mtpow=
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k70-20020a633d49000000b005cf450e91d2sm3716793pga.52.2024.02.10.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 07:29:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 10 Feb 2024 07:29:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Jia-Ju Bai <baijiaju1990@gmail.com>,
	Edward Lo <loyuantsung@gmail.com>,
	Abdun Nihaal <abdun.nihaal@gmail.com>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs3: avoid an unused variable warning
Message-ID: <a47e652b-120f-4147-9163-cdef251616d1@roeck-us.net>
References: <20240202125101.986302-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202125101.986302-1-arnd@kernel.org>

On Fri, Feb 02, 2024 at 01:50:56PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A newly introduced variable is only referenced in an #ifdef:
> 
> fs/ntfs3/frecord.c: In function 'ni_read_frame':
> fs/ntfs3/frecord.c:2460:16: error: unused variable 'i_size' [-Werror=unused-variable]
> 
> Move it into the same conditional block.
> 
> Fixes: 4fd6c08a16d7 ("fs/ntfs3: Use i_size_read and i_size_write")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>
