Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D69208D0
	for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 19:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241287; cv=none; b=tjpWLYmaHQGKcRW+hShf/Qf7dZGpaaoLO4ckUUy+6rjyCGI7hSo2mBK40iUJU7wn7THrO/SroUnXy53g2BjyIN6ReIG2vfBHG17/kV3TmsSxUQ7WEocHcq03aXm/aP6FT2G0tX9E9M6ix1AGsxjZkkeYtz2y8ByQ6s8tcZVg4h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241287; c=relaxed/simple;
	bh=4yrM/lNVgM5LIoBfkpB20Vgsf3QetxdGNQ5Zx0bQu3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRGXDJFJBxjZhGU44riLMLw8AqtJk/4gpZSi//2x1Eu4ONnYwYvgDw9odxONuQVm4oDRjSZEPayJObTNYnaU2Vdsr5bhBlEVPfepYv2hKhE73lGHyYJ2Pr63GWMTpa9Gue8A3MFSEPRhz1X57nOuJQcMtc5mxMphPc7ZI69hiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=XXu4DD8a; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="XXu4DD8a"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so268500a12.3
        for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1782241283; x=1782846083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UzaFu7BlwLWbtc/9j40eBRy8RDI637d1HOGn/0S/MlI=;
        b=XXu4DD8aZ+5/a+eJB2GPAqSLwiDzfV8ph6JLkXEn3dUJS2LoxN0d32aqWAp21vj5mk
         AG/LTN+mGlJ76fusL9EONNN8507UPsGZ4z9Q5MhPrtgILaH8edC7Xn7Fz69bNTn8YKH/
         h3/AIOfJjbfxN6EKvLlYPP+z2UoMo9CFHRrAunQSILAZQIqjBkIQZSss2gYWsXu4zovo
         WIUICPXH19RvsOmSRC/Y4GyQx8jBnEc9/ssU4QuBTNWn6/HO1nmNnC/a28SxOu4CBeiG
         TlKQA3Yah25wc0sFw5CMihiLLNfhvRvVvUNFj8jf1Ki631DzajPtyxpDYU6/uPrOcJi2
         MZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782241283; x=1782846083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzaFu7BlwLWbtc/9j40eBRy8RDI637d1HOGn/0S/MlI=;
        b=swzMqt+kRF2530a7OsBnmDaB7WFuTGG96984pbYXk0GplllFhHfnaWxDBoeGhBrDOU
         FRzSuD6wEW8RYRNRPwHlC+tTylZ70eVtfnCiv4ZrnHt2YwFC5Ar33ykkBRyZjLiOCU/y
         TD9ueiHKKqnxGgn1ioh4S3mVLC0VnloAIuUwujnWo5Jtg5u+TBVZi5cOtPICXHZCoclx
         MjqYuYQf3eCkWcOyCEe8oBQkfHvYnBpDXgY+HIamMriHYf5R4wtbVOxBrNFsUVH35l1I
         TRhA+f/DSchsfLvV+be6svUZFFskQnUJnENDdN5ZPcT5bNK28H9hBf9GEQNDgNp89vqO
         zdIA==
X-Gm-Message-State: AOJu0YxnaJMazOMqysJtgdVTAug05eaQLIzJKVonW9TB5wTxLiVKYcbY
	/aZ962q1jTefFlDkTr07CUY1zEbhf8u9byZEL6RrG9UB0Kiv/82F9PE/nSRCsAjNJXeY
X-Gm-Gg: AfdE7cnCaccaCnk51zZSUuGpIRfOmxGAsyxhjbnzXjcDizRRFzkmpzSu5sOYAlqvuX3
	8/tpZG0N3oas+HFsHMSn9oERYBbIv12NRBKxVSroaNBHuuElFScItfho+e+2mXI+lXCypYgBQjs
	uXvwQJIPnlXbz5FM9neyJ2X9WBjl842b278gpw1otY9BS+CIhLp68RpCoVNVE2NEyFqBuN7szOy
	gAfFJvotxGA3X6riv7uIumZQPpOe7V6J3q8mHR9devsUZMFV3Ur41lTKoiNHQ0OGb4ZWBRyhevq
	ZAa3HTbticmpApjLKOauwDHl6EgU8tYQEzgvPIrNeYf8R7l8g6ef1ub8K6rIKdLpWgeKsQRMQmb
	UneTE3dZwb64pGyzz5aWR0pH7h8Rftev5WrDDDFH1R/qMk+jbVtNSKI6snmv2glxiUinuUS9ChU
	ZEWuxbcgEDFgo=
X-Received: by 2002:a05:6402:a50b:10b0:697:decc:7f87 with SMTP id 4fb4d7f45d1cf-697decc81a5mr1341344a12.9.1782241282426;
        Tue, 23 Jun 2026 12:01:22 -0700 (PDT)
Received: from localhost ([2a06:61c2:d427:0:b321:1c7a:b072:326e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697eff91889sm20475a12.6.2026.06.23.12.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:01:21 -0700 (PDT)
From: Samuel Page <sam@bynar.io>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix info-leak on partial LZNT decompress in ni_read_frame()
Date: Tue, 23 Jun 2026 21:00:57 +0200
Message-ID: <20260623190057.12351-1-sam@bynar.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_read_frame() decompresses an LZNT $DATA frame into the vmapped target
pages and then trusts decompress_lznt()'s return value:

  unc_size = decompress_lznt(frame_ondisk, ondisk_size, frame_mem,
                             frame_size);
  if ((ssize_t)unc_size < 0)        err = unc_size;
  else if (!unc_size || unc_size > frame_size)  err = -EINVAL;

decompress_lznt() stops as soon as the compressed stream is exhausted
(e.g. a zero chunk header) and returns the number of bytes it actually
wrote, which may be far less than frame_size. The bytes between unc_size
and frame_size are never written. The only memset() that follows zeroes
the region beyond i_valid; when the frame lies entirely within the file's
valid size that memset() does not run, so the gap retains whatever was in
the just-vmapped pages. All pages are then marked uptodate and returned
to userspace, disclosing uninitialized (recently-freed) kernel page
memory. A crafted compressed file whose stream decompresses to only a few
bytes leaks the remainder of every frame on a plain read(2), which is
enough to recover kernel pointers and defeat KASLR.

Zero the [unc_size, frame_size) tail immediately after a successful LZNT
decompress so the remainder reads back as zero.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Samuel Page <sam@bynar.io>
---
Reproduced on a non-KASAN, KASLR-enabled arm64 guest: a crafted file whose
64 KiB LZNT frames each decompress to 8 bytes leaks the [8, 65536) tail of
every frame on a plain read(2) - up to ~3.3 MiB of uninitialized page memory,
including kernel-text return addresses from freed VMAP_STACK pages, from
which the KASLR base was recovered and verified vs /proc/kallsyms. With the
patch the same read returns zeroes; a zeroed control image (valid_size
truncated so the existing memset runs) leaks nothing, isolating the cause.

 fs/ntfs3/frecord.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 7b035da63c12..cd11df75bdbc 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2443,6 +2443,15 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 			err = unc_size;
 		else if (!unc_size || unc_size > frame_size)
 			err = -EINVAL;
+		else if (unc_size < frame_size) {
+			/*
+			 * Partial decompress: zero the [unc_size, frame_size)
+			 * tail.  decompress_lznt() leaves it untouched, so
+			 * without this the freshly vmapped pages would expose
+			 * uninitialized kernel memory to userspace.
+			 */
+			memset(frame_mem + unc_size, 0, frame_size - unc_size);
+		}
 	}
 	if (!err && valid_size < frame_vbo + frame_size) {
 		size_t ok = valid_size - frame_vbo;
-- 
2.54.0

