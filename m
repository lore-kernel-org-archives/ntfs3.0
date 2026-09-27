Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D71A6836
	for <ntfs3@lists.linux.dev>; Sun, 27 Sep 2026 20:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790541031; cv=none; b=ElbXYYr61n1uOztT7L6dNcNKl+giYOgPssIjKYe91aJk96cgCJnlPmwOZSo5ZQ/iWWzfaUjrgbo0iyhjAF9+yvXFu8zxIdo1TWLGgTtImY+eYsAxRFvuiNZ9GCrLNAhAsxAUqIBMRcrJAuD8Ix9rCe475+buhazIdyqopdi1JU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790541031; c=relaxed/simple;
	bh=o6cflNN+5uNq6lgPY1cP17X/raP7e0k7d2gKzGJf18I=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DeFC6bS93UQyGLKOVs/IKtpRpIaT4x8ney02VZmXG0vOdVVjAj1RL2f3YccM+i8E9wEP2c6bMQCFkPebRyFl66y5GoUnT1JLsvanEPFI1TZLED8ZFnbJvmi7YyZ6xomR/ckHZQETZBozC98NZge+OBsljud0K4tc23NS4E5sRHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIGdXDte; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIGdXDte"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-39e59dca659so726310a91.1
        for <ntfs3@lists.linux.dev>; Sun, 27 Sep 2026 13:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790541029; x=1791145829; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6cflNN+5uNq6lgPY1cP17X/raP7e0k7d2gKzGJf18I=;
        b=YIGdXDtet1g/NLcxLoLNH2MgCbfPLdukU18YMDEPLIhn9BSYXywRN2oJ0AVZMc+2Pp
         hz7bXNXT0fozafNo0RHOvAITyXJQScU+PCiIpEeMQ6BSAg0whbQfablcZBB6tc/KestE
         vA9uv/8traKmTloZaH41MwyKFDx3HU0T0t8/N135yGplZoMM28hb60plRqRFKiy8Ap8B
         ZIEsHRe4lqMCvkDX5fdlf67NYPGQWBW2ancZ6tU91nEewIzDzgENJP7RXX264s8gReu9
         ru3SwiX+xDLKu1VXolOtbYPaiBAs4ivb7ccv7SHjpCQUZq5FoF546bBwdaHuXXm3qgBu
         IDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790541029; x=1791145829;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6cflNN+5uNq6lgPY1cP17X/raP7e0k7d2gKzGJf18I=;
        b=omq8X8lu19ArRkucNRpnfHE53uU6cZEvuwXjurfy/D3Z1sF4Xsz6F7zrYwqidyxu2h
         Rzf/evMfHnGE23dxJrqY/DKdfjWZBX/sAOZeWdcQbkNh8pJnbHZDhWDxXLYuDUc/4+3M
         HwcY9m5SwHqfvwpe01HAdZy0mpqO8wCQuUjgVdbV2zyOWgaX0+zRwKgMiTijO8nbVrfP
         TZ2+mY14V8RCAh9LqOtkXjClpu180V5Gm1yAxX5kA3BHdg9FlPydQ0tdUTa/y1m4rFSv
         aaA1yut8Wl9RuENyE3vvFf6No6J7vXrdo0iv42g0MyxQ13UuyPK/bV4gXOAoNkstE6qT
         goBg==
X-Forwarded-Encrypted: i=1; AKwUvBxtoNzTAPD+Tf75v1re0TTF0vLevMW4WVfgCzBLTGp+lDU2NRDhGg6AdSaixhFWs4Wj4Jc7bA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIVGSeuuRR+kyPLSoQJuvls7FO/XA9I42blGw8Ef4oYWASF2Muc
	VOxXKHTVhZcCPHC3GGxyE3QPaRE51eeYLRffrDv8OLInXn5O0VwKTFwx
X-Gm-Gg: AYBFou2/z5eCbcdUpXvYCe231PqnG8JlWe37TI2vKG789KQfMLjJDGwIfjYPH18WXGO
	ZvZfM4gyxsOdISYbFsQLmSyUjBnv8phUXx6I4i8G775sP5+wRkGApChZxRfZyVpm+ThWGnqtC3H
	f5PWtQm8czX5jpY3/8/7BrDAiGpNnje2/4FdKNpjBra+jJjpNmjqBrFlmuOwn1QqcLeqwB1TqMl
	H/WJK9lIkxrctdR4wDccDJgssOFlYVO1Jo+2Sdjr5orR5z+FyP0kheIr8ALlUAPY/pp8bo1bm2x
	5IeKGYfLgiVk1GVJzII+7tdHFJP37ua82H+zx9AlgecBxIW+yUD2bE8OBnOsvjwg7zQ3YOXSYbp
	KECQc4LwhabLqcXtN+brZc/K3W+kR3rIg4vNXAjqi0tdDkZFEJ7CCmi8G3Ud3x77CPqbOeRV5wh
	9rLlIVjvi2Os46xLfNmu3F5V3HgqW8nhTK77ioviW34MRyLw==
X-Received: by 2002:a17:90b:384b:b0:3a0:c360:a562 with SMTP id 98e67ed59e1d1-3a0c360bd58mr5153407a91.14.1790541029308;
        Sun, 27 Sep 2026 13:30:29 -0700 (PDT)
Received: from [127.0.1.1] ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm16824473a91.0.2026.09.27.13.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:30:28 -0700 (PDT)
Message-ID: <6ab97ce4.a24da115.4bfe6.0f74@mx.google.com>
Date: Sun, 27 Sep 2026 13:30:28 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyan Wang <maximwang110@gmail.com>
Subject: Re: [PATCH 0/2] fs/ntfs3: fixes for directory permission and symlink
 consistency
In-Reply-To: <20260927180359.3867508-1-maximwang110@gmail.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

After analysis, I found that Patch 2 introduces a regression. The
readlink function treats backslashes in symlinks as literal characters
but they're path separators on Windows so symlinks created under
Windows cannot be traversed.

There is a partial way to fix. Since symlinks created under Windows
wouldn't contain '/', in the readlink function, we may only convert
symlinks without '/' to cover all Windows-created symlinks while
keeping some of Linux-created symlinks shaped like 'a\b/c' unchanged.
But the 'a\b' problem is back again - it isn't fixed because we cannot
distinguish it from Windows-created ones.

So I'm dropping Patch 2/2. Patch 1/2 is unaffected.
