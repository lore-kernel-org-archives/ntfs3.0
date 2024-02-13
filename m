Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2773225A6
	for <ntfs3@lists.linux.dev>; Tue, 13 Feb 2024 09:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707815853; cv=none; b=CAm/60/IbnJ3k9YjO+ekXJkwGl6V2ZzHoX1q+eWG4ONoHsfICbTGV1q3CP+AdIRHgqXNmacMBwrl6Tf6C/r1llZhI5qMo61C4dpmdkNdKh93pE24hEl6UWXQo1GIIxGxdkwxIRaAR+4JI3ij8slTeXW6edSTyVt9k/WW6qM0PcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707815853; c=relaxed/simple;
	bh=ZfYUeVMl6AYblsdyIrX3nVKH+xT9BNV6zy6NmrP+hoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=doSlJa2yEESvBqnfMIoQsCJKWxEjBCBa4Fc8m0F4VKWuAI9xTC9c8Ur+gKf2Qf/Awamb9tgV/yITE8yg3L6diOIINipVOb1StdvoIJGp7M7H1T80ts6mY/JCa4859laUlClUfoqL0KmE0C/9BWDxzQ3EwwdtZPrX+u1ikNnwvCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaJlg3+v; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaJlg3+v"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-785d5e6c87cso173707485a.2
        for <ntfs3@lists.linux.dev>; Tue, 13 Feb 2024 01:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707815851; x=1708420651; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8l8YBrC4jhYQEFBTPrrabrCLybr3DvkI5ByH89g4rc=;
        b=PaJlg3+vG9cvPs5ejMMgrU4z0emMBuxm9Fjjx9WUehkjVWEx+raCDkbjCPzKCWU5Aq
         cfJ8NTLgA7unUWp7B4LBa5wXPOqXDM8Zwv05s6ErotzxqNkZghP3lKk5yQNVaE1gLo2L
         5eC4WylWXQQ/j9jTUiR4z61l19P0K6hRu6haQonBW810w//5ED/qY//tIayGB0bKavTA
         mHmkjZp6HNy9Gt+94icmOtaj9Xd9NR/sGg7ZeTLfZMwyqcXJZlQV0zd6h5QhQkkBP9hR
         RNnDXZahWGev4/y/U1c/MbTBcZpMjygZulS2mHD7ENCUdEMVjzlhizwZUalgSm8xHZx+
         O/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707815851; x=1708420651;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8l8YBrC4jhYQEFBTPrrabrCLybr3DvkI5ByH89g4rc=;
        b=WQMGL6fZs5Dt3t6xbygiHV8kNPnRUZUTNpEBaBZdd2xaEkOyA1mXR/6jr5GxUtppPL
         Fq028ZFsGK8CAFT5Y0iprGMC0H/0REg6Vz4ra0ZMNYq4wXVLOu5Tj5xEK5OwPlpVW8LZ
         dyf9pEWqkBoPmWpQKBuUFUHeHJy1A0AS6d6CELgNE0V13ZxrtAMyAuaPqyfXdhaxIQXc
         ewyMpAY1bdTOi2+E7SYU6YZa+Jf03jnonLIHdeCN2s4o1tjFOo6RhNvXFJpV9EyN7CsY
         Qxt7qgrcWBka5izFlQ9NLqF7OMEJEupqJS3lcVqyqUxDz1386r0gC9uO8rfrZsUqH/tH
         ptzQ==
X-Gm-Message-State: AOJu0YyEzvizaDSOSgSlE0nv8lIKzc/qP32GlzJskFWn/U3HrdWhFx9Q
	jkKdHSoZ2sSipk3dWVFmLCWWOXhlXdqvuBXcO4Fkl1DlHpn516g=
X-Google-Smtp-Source: AGHT+IEr6JjDsOTC5+jgquFmev1o/xNjgQ72kQIXg07hiJvXnWbnKoP7UbRqufY0oe1W1Nodgvctxw==
X-Received: by 2002:a05:622a:44b:b0:42b:fda6:dbf9 with SMTP id o11-20020a05622a044b00b0042bfda6dbf9mr13589667qtx.60.1707815850629;
        Tue, 13 Feb 2024 01:17:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXr7WfCVPQHipV6ZVVxCf6WWqNgWUWFQXPGtE++2Aa/OqMmr2Skc++a/B6EKs4gNGX/BYWJ0M3bhYONWrjM0/cI3w/dtZcKpJ+StNSsSwjUXm8IV0v1VDa3UCvMTNm0D1ybCJ3j/BqlrnUArL7omtuqhxJYlXqJ1yEOeG0S6m8i8z5dx3A=
Received: from localhost ([207.181.197.26])
        by smtp.gmail.com with ESMTPSA id r13-20020ac85c8d000000b0042dabcf07eesm596424qta.6.2024.02.13.01.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 01:17:29 -0800 (PST)
Date: Tue, 13 Feb 2024 03:17:28 -0600
From: Lenko Donchev <lenko.donchev@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] fs/ntfs3: use kcalloc() instead of kzalloc()
Message-ID: <ZcszqPoW8RMaOvTN@nixos>
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
Changes in v2:
  - Use sizeof on actual pointer.
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index d435446537ca..725aa84dbd22 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2636,7 +2636,7 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 		goto out1;
 	}
 
-	pages_disk = kzalloc(npages_disk, sizeof(struct page *), GFP_NOFS);
+	pages_disk = kcalloc(npages_disk, sizeof(*pages_disk), GFP_NOFS);
 	if (!pages_disk) {
 		err = -ENOMEM;
 		goto out2;
-- 
2.43.0

