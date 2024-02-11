Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C920515B3
	for <ntfs3@lists.linux.dev>; Sun, 11 Feb 2024 01:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707616398; cv=none; b=udKBd+A9xuDN59l+KSKhUDDnTX4pSn2vQv7OSXbZwLyBuYGOWNQXWbpuHx3HwkNw0eO1bpXbAB+Ns9bFgUAOvKwullE2PWYO+DLTMqAZYmvPPk3zrOmgfM9wIuJeOfUIcFi98M8V3jiKOat3L1wPAmjaaxlYOl9tjWhnp3ea8pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707616398; c=relaxed/simple;
	bh=nuSzSl9gWOU7ThKVhsz/gLgGzU40+yE07LZq1v68Oyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIb5I4ZYv2IEq9/NK9jdu5D3ffJIWMFRuF2mW7dJZyLNBz3d2mxG0VGY7ZxaFvDQWPjBnWcKJoTje87ossUkKjhP333eFJn9ghEovv9xNcVVOTcDfaYgRNijlh7K9Mz9P6cUfe9r7Po7/i3PIuJUrKfMCsJZEwvtBP+cLyuY23o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNrgw9tc; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNrgw9tc"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68c8790aeadso16295376d6.1
        for <ntfs3@lists.linux.dev>; Sat, 10 Feb 2024 17:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707616395; x=1708221195; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1jV67d8m24PXZq1850zcH4U3UHNFlaMaq/fIupQAUA=;
        b=VNrgw9tcC9gRNAU08ufs8FeseLvAe0O3mj5Mml+erUfhAm3CH1mKTriW8TyWMhKEOh
         /FSsvoQR3via0Didpa8XmameWnFnjxJdwwEXCkCOb0oZ7I2uy+KZvjX0Es90nEsyssgp
         mna9qwiG7wM4L4Kxd3+gFqiuhjHKxoOWqgODAKAsTT+cqCmTmq2rvkKLjFRmZ9xap5SJ
         gHWtI7WPERDTiJMMQ2LG6KTiTTSvMT0aZfUS6/NQg5QVQe+4tvpnKELT+Y5x6OlCcXA9
         FFu3SbXoqdB6xt84du4XsFSCp5S7LBfFN/sh820+AU9ejc2578/mNAiD58OHijq9C6X6
         qa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707616395; x=1708221195;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1jV67d8m24PXZq1850zcH4U3UHNFlaMaq/fIupQAUA=;
        b=TysC1dRbR6onQmEx53aqxnK9+QgyHey3RvIVIFCobapIvcYF3vkPtkG2hRwD/LV889
         MmmDJkooD+6pxKnt6zd9bfWzNRTtx0hikcgeWf2/vFs0cmxNTo8uIhgjhCwRljtwS1Us
         /bCXPHLPZj5CvBI1U0VUffhaVPkrIdHdXUV+M9QKcOQz/PYniNcAUZ7V25O7D1cyXsFd
         CXOBlP9gbxVYs07IQHPMyBRIivgFMfQ5wjNqABFqIUvUK8dKClx4sMbXeM45n+bCgcSg
         dmIzvQk/bqryPRUpKVqRg+C6PcDK5QIlVN3TLtr8THKCYgcRRuotjZzezFB3AcfdiULp
         mi/A==
X-Gm-Message-State: AOJu0YzhsSQr9JPdpqV/ScTljSn68Dwc3+F0gcL/xEhjDx8uLuH65o57
	mSw2ySeCGpxMDAAitnFUEQswFjv2svmwbcz0RZuEGlIZ0I6kJbk=
X-Google-Smtp-Source: AGHT+IF3qzQja2kR2RYxGLqTqgS4IjK8n9nvUEg00vvn7W9qbbH4rgzdjr+GRq5k2l0JAplN2mPzRQ==
X-Received: by 2002:a0c:dd14:0:b0:68c:627f:ed53 with SMTP id u20-20020a0cdd14000000b0068c627fed53mr3608896qvk.59.1707616395646;
        Sat, 10 Feb 2024 17:53:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6O9Ebb21G/lrlgwem4+12w8w/ssoqnMBcmAlTA9/i7CKwYyO3yj/QoX0Faoum6H5Nkw2vH94Wf3fg5FDvLQEJZEqqle0mPfhEFd1PPREyOP8JHzxHt3gz62i7mRAJ+cE8u9Fzx/sHjNWoBqj9C3AmG7KUsfkMLKRnyqLoXBOXrCZYUMM=
Received: from localhost ([207.181.197.26])
        by smtp.gmail.com with ESMTPSA id mu19-20020a056214329300b0068ca3ed8cb1sm2285785qvb.73.2024.02.10.17.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 17:53:15 -0800 (PST)
Date: Sat, 10 Feb 2024 19:53:14 -0600
From: Lenko Donchev <lenko.donchev@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] fs/ntfs3: use kcalloc() instead of kzalloc()
Message-ID: <Zcgoighe07IahAV8@nixos>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We are trying to get rid of all multiplications from allocation
functions to prevent integer overflows[1]. Here the multiplication is
obviously safe, but using kcalloc() is more appropriate and improves
readability. This patch has no effect on runtime behavior.

Link: https://github.com/KSPP/linux/issues/162 [1]
Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [2]

Signed-off-by: Lenko Donchev <lenko.donchev@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 3b42938a9d3b..d435446537ca 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2636,7 +2636,7 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 		goto out1;
 	}
 
-	pages_disk = kzalloc(npages_disk * sizeof(struct page *), GFP_NOFS);
+	pages_disk = kcalloc(npages_disk, sizeof(struct page *), GFP_NOFS);
 	if (!pages_disk) {
 		err = -ENOMEM;
 		goto out2;
-- 
2.43.0

