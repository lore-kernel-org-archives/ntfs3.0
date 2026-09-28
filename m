Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78293BED7A
	for <ntfs3@lists.linux.dev>; Mon, 28 Sep 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582609; cv=none; b=Oj50t1oJKYZb+v39iHY0SsQerlrQNwwuvj1eewrK7jK9xMeb/UQDfjz2y/+z95DQ3RdLGprMYf9+alBv1mguqq+srewkIUzjbjYbVFy1igGtUUhpQuLQuQWpAs2CyYrgLVQMgFSlnfYnA9JzY7rwJz8AuUVF6m9NIFz9+f7XZRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582609; c=relaxed/simple;
	bh=wg4j50qd+HyVvZop+xqKTij/lmOTb61oW3LmpcIetd0=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l0+6oMtSK2dvf7YEnOAg33MfPpESI+LrzHTqbuInw22n6B0VMVb+Qz9wm2mgwpL13A3ZLfBdqAGi3Ge+73gQQrGi27AWs9tquLu1EEswKZNb0Y+ASYi9wttbaUeu6BJ2skQk6EoH3HwhDcH54hyRxVhDJNr/oejVJgaS5JcdjuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQVpn9bc; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQVpn9bc"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc150711112so138884a12.0
        for <ntfs3@lists.linux.dev>; Mon, 28 Sep 2026 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790582607; x=1791187407; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg4j50qd+HyVvZop+xqKTij/lmOTb61oW3LmpcIetd0=;
        b=YQVpn9bcPq15tNOrcBewI0qEOgaVW63VsUkvo4Wlk9Y66a2JxSYsaNfMqE04pzUlDC
         o3f9cThqiGbwv7ioF/GsLPt8m4IM22s33kpEAB0IyhN/CpOaYTwI1iWGKHrURsleBsiU
         UFWJ617F0YpbeOEyEnHwLDzCM373m7DHk764mUCSwkShD88urojWx4iBIcElDhThGPM8
         /Xpb+kQmBH7pxCdaygAXYXgei3lqUOD1rdup4ZGRNQf5/Zf8HlsAXA2CnDtk98Tg17BT
         psSX0PU++1NpB1O7IH2QkdH08BloMEkVwbD0d8v/fJCDuqz3W30SxemDo1U+4JDk7LN5
         mwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582607; x=1791187407;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg4j50qd+HyVvZop+xqKTij/lmOTb61oW3LmpcIetd0=;
        b=AjPTaGDl7dpkLACND9PWXtT9zJ5D4u7Ab5CDlX2DMh2LG7sUhD8hsqba2sx+m+H+/G
         yDe6LhwOY7H3kIDXO2xVdDq3/rKpTb04m7dbgZkfJ+1funSqMRpt8x4UBxUMHHZLc0pu
         OcbubFI1Ntz+kxRu5ckEV609K2ngP/ZTolu2k33AOO22cNTvF902A40cK501cggytELv
         OaJEBKjZBSlMvP/nMlFA53PO+sUVvtf6OPKQLFgldl4X+GO2gXbFmk4NQkFpAYFM1YwO
         CnKuYHlsYMPEbyyEzaBmmr01Ez0W4qBkb+r+USbjwTXxMy6V9+8RGMWyTVKXEgQiFldf
         1hTA==
X-Forwarded-Encrypted: i=1; AKwUvBwaDMjbopHFG1GAu2ib5frvS7fE4yHXbZkiLPFuJ++4oLKjX/jvaDOjGD8XW+0An9iwAXJf9g==@lists.linux.dev
X-Gm-Message-State: AFuF++mwOSkOdJfCz60h8YkHu7yz5dqAtNAPjic9cxC4sJfebL0rmAl5
	xfgdgARTyFoyttQ221vRb9h+NV5zla5axW64gK2JOqgh00zl9DhaqdU5bV4K/eFp6QN0Yj/17S8
	=
X-Gm-Gg: AYBFou31y+wdoguX0/hmZF7sb4UNTHVU4qJ//uDJTOGr8+LWb0IrEv3pwzN/Ny48ZuD
	mkb6S6DGKkyidUvZno2aukPhS/WA8/j+5WnW31fxFgK9BJiS+1fXxcR9KPkgYQnFNqaGG8bP9VQ
	an/nN9EjnI+EErI+U1Zf/CGVlXSeJF+D3aJPxUSX/VL2eJlMHNeFfq2EMl/0UiJvTdHzh0Z57NO
	1jSvZJf1Ry4uOlbHwYhNTlf5zonne6i+Gm3LUfWubXad0M0ft2JuzNxvWndoXXFprEXvSLd8Zti
	kOo0vqgZpOrehKd9UrtR5i8K/wJsnvlLAtOMKOsniuTo27fmZwZPPdor8YgFseSnh/MrxT2MyQ0
	G9kPE8DJ9igT8jX95Rt5xQdpG9Mhf3QOcYhMzhr7Qpa5t1fGHjK+AXewiCXazdPt5iVMMx3sMW4
	C7CSkwScp+RSe+WOad87F7RGPxu+oxOfUCdVtDVRoez7KIizEBo5mA1DKL
X-Received: by 2002:a05:6a00:348a:b0:881:fa65:d4fb with SMTP id d2e1a72fcca58-881fa65e5acmr3366523b3a.56.1790582606929;
        Mon, 28 Sep 2026 01:03:26 -0700 (PDT)
Received: from [127.0.1.1] ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea19030bsm3775258b3a.11.2026.09.28.01.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:03:26 -0700 (PDT)
Message-ID: <6aba1f4e.85d8e643.73376.7e2b@mx.google.com>
Date: Mon, 28 Sep 2026 01:03:26 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyan Wang <maximwang110@gmail.com>
Subject:
 Re: [PATCH 2/2] fs/ntfs3: keep PrintName not changed when creating symlink
In-Reply-To: <20260928072801.13714-1-zhanxusheng@xiaomi.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com>
 <20260927180359.3867508-3-maximwang110@gmail.com>
 <20260928072801.13714-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

I noticed this regression shortly after submitting and I've already
dropped Patch 2/2 in the cover letter thread.

Link: https://lore.kernel.org/all/6ab97ce4.a24da115.4bfe6.0f74@mx.google.com/

Thanks.
