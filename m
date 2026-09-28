Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB80369997
	for <ntfs3@lists.linux.dev>; Mon, 28 Sep 2026 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580493; cv=none; b=MV2ZnsWEyM4RFrKjfXOqZDblHn8r8l40bL7ScC0l1GtxFfyIB0GlP8udkl+7O/DzI5Pw5PHLgOI2F+K+/lhuEgPkUyTUAL4VqAD/1FUjd7+e1y94a8Ks2y0IDGYXA4/tJ13lKhMENdkzG9V1zWCHKbcQ9+ApImJsct5gGHQWHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580493; c=relaxed/simple;
	bh=DZEBm7AqqCnArM9eNi1XRjIHVWMaI8eGfrCgZqmx5vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLwZyFs9WepAlhZZrSBmZW3+KmfxO/d9LSN4S0boBM2hMabXW1MAluoPDk6u6dtoTQTth0kA+DKgYAd3zN3DYBkYtiCA6QlUxTXbjnEnFEi9qKymrk2snQ9XixH4aO3rwR7iZ+oLVXrVM635Uq7e811vw6F2Iy1EbmSvX6Vtcqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz0u2az5; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz0u2az5"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso225864a12.1
        for <ntfs3@lists.linux.dev>; Mon, 28 Sep 2026 00:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790580489; x=1791185289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bye6SXDJtZqYyoJ8pMJ9LL8Wd0RgcztWGshO/EITHjg=;
        b=Oz0u2az5G+FR9UdHgUZoAdkvzPZhX4U7q16i0DpiCRYbSaf2NK/lRJxJ/C6OMOTvNQ
         aOlUjwsobxYdDZaeo+Xz4xVc02l+zohQ/yl5ea75s+fe5zgl3S9+E7RriUqAzUXmhmrg
         qDPx75hugcFYdpsLhr2jDPhb3vAf+M0BxARQLMxjpaVu9cPrrdXlfI/S+7zyxwDQU6DO
         ftevDweLgGJqLKyAj88ISihppe8uNdray1H17MBVZPRnQeLRhPsZkPvaMqaL6RCiPG5S
         ZbIbsNbGQ3ld9fjN/+t6+5gA27i8qh0iPGAi+5w2qj7GNvMhfWxEEx5pb1Qy6dYNmxNI
         1hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790580489; x=1791185289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bye6SXDJtZqYyoJ8pMJ9LL8Wd0RgcztWGshO/EITHjg=;
        b=jy8GGaiRdUsSOtaSPK29vvZJNJXUOIBBqYBYItAgNZJfyKsKPhh5Nnpn7K/pKJ2e3m
         S6OonuWxwv3ty3EZ02SEe9NgtonKv7BvkDFG1nl497mwBrHvpRaVsIw6T0hrIUmvXs7a
         OasHbwPdjcX5isL4dAM91b4nchSuUIyHLJzdW2fUOiJ12Cgfo4kbN+u1jtEQNP3ST7ug
         62bmJnlCqj+rlovaLWI3mzqdHqyvkv5OIplAqCwKQTu1xsW0ydTA9aHPEppzXoXnXMJW
         PNbhc3l8Yq4D3Pt6rh++2bAaOQUr2dyHTVTEBAj21Zyoe/rzDNKku4Q+gvhWMf+mE+VQ
         /kKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj/LVMGA86ocuU7H3nPya9DtPEZHCwfjIYaBYhgGnR/PzIGgUB8kDidCJqH1cLa78opVDhXg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLClmOwNZoHNX8SBL4El2LIolQiPdzfI/kzmora7uYa99duJ4V5
	8QarC5szw4Y23EH6Hl/GB2qAXiB6/Jv1DzN8ar6tsR7E5+j8VybAnmPJ
X-Gm-Gg: AYBFou3G7pQHUYFhbHpl033DjDhsAfLv7Oq257if0/6jHYPLLgDKCyZdkIv90vm5RR6
	A0WCitbUPsIe5uSbDzD4f2JTuBuVw/6VgnkH1mGZ2q2+KJIvN/hPveKXN/zh9J4uoOeX7PoHUzo
	ofp644Pmtjld0DwJV+MnT+JAaWVqWPIT+axIfY686Np3bAFk0QvLDHLGTuJPnz8Hpbbi9P/JiRB
	UJ0WehdLXbjwlUIuZ/GJXy/T9z+TuUmuf3h/ieBgUfDJphQONLbcafjbuLmhGCjie+SpJGokTyZ
	kKg8TBIpdykmTrvHhz8CiLFSgjPOm/ADL1v2JmelcPRc2Rf2cFVFr+xKnC6ejk1detkLMuqJupR
	JHAUBu0A81RPnR8ZttwtwnqFoq5SzhFBCe+OScRFlABe0CKpC/YvXElU9egN98Mztry2EiKxb2o
	Hdf5x9+HmIG7xpjgzl7DMrgWDg1J2dYHOKVabJnkRAUtLUAsBm0f+UmFevEXAwF1tXl98avzQUJ
	b1yg9qJK0s=
X-Received: by 2002:a17:90b:5247:b0:39e:6c68:fd8f with SMTP id 98e67ed59e1d1-3a098b628d9mr7264933a91.36.1790580488646;
        Mon, 28 Sep 2026 00:28:08 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm25102399a91.3.2026.09.28.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:28:08 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Zhenyan Wang <maximwang110@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christian Brauner <brauner@kernel.org>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] fs/ntfs3: keep PrintName not changed when creating symlink
Date: Mon, 28 Sep 2026 15:28:00 +0800
Message-ID: <20260928072801.13714-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927180359.3867508-3-maximwang110@gmail.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com> <20260927180359.3867508-3-maximwang110@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 27, 2026 at 06:03:59PM +0000, Zhenyan Wang wrote:
> -	/* Translate Windows '\' into Linux '/'. */
> -	for (i = 0; i < err; i++) {
> -		if (buffer[i] == '\\')
> -			buffer[i] = '/';
> -	}

ntfs_readlink_hlp() reads PrintName, for both tags:

	case IO_REPARSE_TAG_MOUNT_POINT:
		... MountPointReparseBuffer.PrintNameOffset ...
	case IO_REPARSE_TAG_SYMLINK:
		... SymbolicLinkReparseBuffer.PrintNameOffset ...

On a volume written by Windows that PrintName is the display form, so
its separator is '\' - "C:\Users\foo".  Without this loop readlink()
hands that back verbatim and the whole string becomes one component.
The loop is after the switch, so junctions and mount points lose it too.

Keeping it, the first hunk alone already fixes the '/' case:

	symlink target   PrintName   readlink
	a/b              a/b         a/b
	a\b              a\b         a/b

The second row cannot be fixed this way.  A '\' in PrintName is either a
Windows separator or a literal character from Linux, and nothing in the
buffer tells them apart, so a round trip for the literal one needs a
different encoding, not a missing conversion.

Also, after the first hunk the is_absolute block still decorates through
rp_name while the copy is at sub_name; both point into the same buffer,
which is easy to get wrong later.
