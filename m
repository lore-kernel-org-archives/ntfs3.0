Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F83D1A99
	for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862826; cv=none; b=iPqN/UQxGPEHbfr6cHep+keDur3eNNXeJ9Iosd70UT9vBBMsslqb6zCC8dwe4S7EWx8VuSXbsEcef3f3CP+uTL9ZNlvO89MPgr+f6OfRonwVdHkw1TcNJ9iRRZ90HQgiff7L+mVQsvpP+FBCTPD9FdBQg7HjC4whJzDBWfJvPYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862826; c=relaxed/simple;
	bh=vxetH8Avmfd4QFDfR5JZ6ol+RIrQLp8uhBHQlntbX4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7PG2dr79QkI7Hd4NCCaoyccPXcuu4V5eOo12jP4MPpYApTAtH7x/oP0P5LLiMsFm5CRtQMke/GWS/lD59EMgGTik6NrsQhK+6EsjUA+gVld4usGj6WSvspC/DJ2Pdg7jo+TFLDrU6IUw3MAS1Wa10VQ+Xy5EOFwIPLalED+ER4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzdNLS/s; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzdNLS/s"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8c92737a8d3so13833716d6.1
        for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 09:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778862824; x=1779467624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZn4Lhw7aGUHoPUqoI+ds26hnYSAESh6BVmmIrXoe1U=;
        b=QzdNLS/sJuNCOFlDX0CRTvrVUJlPsnG+4VC5ukJ3wnHY8bf0Gc6DXjxDSN53YggvSy
         xXdzAOk6Hp0VKJSh6tbEeDqMG0ssfJpWkbVCOAD6tGAqtqd0nKcDO6lMSXQQZaGtYKlu
         kg3wpuUfps0tMl8DAUepZ9fTbOGKe9htZd08u1xKEkTdbxwkWaCEkcz2BM/GlSch9HCx
         WlEuTg+MaIA0A6385sY4+rbu14S/RmT/eMdzDoXsGugRtWnHsSrmog3a533qcG54tU7r
         T3quSo9VdMRKHqriEh37af8gmFwuYIMTGSh5CtC/PCNYdxLjdvlw82jSGm/jKeFsURNE
         5lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862824; x=1779467624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZn4Lhw7aGUHoPUqoI+ds26hnYSAESh6BVmmIrXoe1U=;
        b=hwrRQiQGYCkFQnT9jjei3f83wwkMO5xxiO6hbjLp4c8zhWYCONkjHwzfHseh7MrHNZ
         x7/uEY19QOLLzA9S1SBWiaLfkZxmZtlQBcC6sxtqeJuwe4bOFpxWdmqEShg9MtRzS4OQ
         ikwF65k97mGQ3vfOKiWldREd9zWcurI5XqEe3prJWDVUtgXjlHFdly2Zlt7m6HMptil5
         WKakYqIZi7A1ubtQdDOFHdGMXgUNssano+w6otrOS2qZlSDUnaD5Uso3rbV8PAJzEYv1
         rXdrVe0MhpQGQ854ecsUEDhCxfE8euIWLVihzmhIvirth9BvOHjPU73AdryOzRtjmeQZ
         yHrg==
X-Gm-Message-State: AOJu0YwQzrCoGA9X+pi16irAQ5hW5yIS79cPGlKP6RDEZzQ7hVHwfmzk
	Gualeu4DAD92EQGptA4fdhRN05oUHPJD0F/OsH4YMrOtiGU5b3Vegasy
X-Gm-Gg: Acq92OGhvgDdAMoeonlgCDO5uoYQZssdG5hFpUgmJbOi2eMKUnx8GiTn97+h2RsKSs6
	wyEb9C1nohvYrhdrnx/X3HLNiut2EONMTWsd2Ihbs5p0qtTPHqTCY8l5590LzSmp4kNFMIz6az0
	hVAUpkZ0/sJWoqMYBLrv5aSe78UgHYA5JFei/aANGybVeP1S31GcRItEQGn2G2wuS0dbXPz3IAh
	JXvR83NlBi6uwTQMzY6jpsl3nIghGHZkWv5jgbH5bqfCJDfrGoc76n6CFQATD8m7gdZvqhE+uSA
	fNZTqvxhc53cLc1dvtXsahQfiJVJc/xjGENlfzMFjX+dWP4LbQP+xpxUrd3Zqf0mcJA7urUK/84
	NzEroIG1HNPWb5G3iV7oKhZLP/MZOZz0t0NUaOd3ceWP5jkeoePh0q1fZuYz5opSnDTNCUoCmud
	xc8jBGWdgM7VTY5c2bLXry90JRxh7/RCqRMzQcvrxKKjeYL3UufY1xaJ8XTYAUODkpeRJrHrO62
	5WmBjU/lD8n4Et3E70TJJXu7wGgevEiiwyeFtWPjb0=
X-Received: by 2002:a05:6214:8017:b0:8c7:2924:29a1 with SMTP id 6a1803df08f44-8ca0f618071mr77850116d6.20.1778862824134;
        Fri, 15 May 2026 09:33:44 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c9093e62c5sm56371036d6.21.2026.05.15.09.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:33:43 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] fs/ntfs3: bound DeleteIndexEntryAllocation memmove length
Date: Fri, 15 May 2026 12:33:33 -0400
Message-ID: <20260515163333.1573210-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

In do_action()'s DeleteIndexEntryAllocation case, e->size comes
from an on-disk INDEX_BUFFER entry.  When e->size makes
e + e->size point past hdr + hdr->used,
PtrOffset(e1, Add2Ptr(hdr, used)) returns a negative ptrdiff_t
that is silently cast to a quasi-infinite size_t when passed
to memmove().  The memmove then walks past the destination
buffer.

The sibling DeleteIndexEntryRoot case at fslog.c:3540-3543
already carries the corresponding guard:

	if (PtrOffset(e1, Add2Ptr(hdr, used)) < esize ||
	    Add2Ptr(e, esize) > Add2Ptr(lrh, rec_len) ||
	    used + esize > le32_to_cpu(hdr->total)) {
		goto dirty_vol;
	}

Apply the same shape to the allocation-path case.  Also reject
esize == 0: memmove(e, e, ...) is a no-op and leaves
hdr->used unchanged, hiding a malformed entry from the
existing check_index_header() walk.

Reproduced under UML+KASAN on mainline 8d90b09e6741 by
mounting a crafted NTFS image: the unguarded memmove takes a
length of 0xffffffffffffff00 and the kernel oopses in
memmove+0x81/0x1a0 on the do_action+0x36a2 frame.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 fs/ntfs3/fslog.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index acfa18b84401e..4b32d08441b8d 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3570,9 +3570,24 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		}
 
 		e1 = Add2Ptr(e, esize);
-		nsize = esize;
 		used = le32_to_cpu(hdr->used);
 
+		/*
+		 * Reject crafted entries whose e->size makes e + esize
+		 * point past the INDEX_HDR's used boundary.  Without this,
+		 * PtrOffset(e1, hdr + used) underflows to a quasi-infinite
+		 * size_t when fed to the memmove() below.
+		 *
+		 * Also reject esize == 0: memmove(e, e, ...) is a no-op and
+		 * leaves hdr->used unchanged, masking the crafted entry.
+		 */
+		if (!esize ||
+		    Add2Ptr(e, esize) > Add2Ptr(hdr, used) ||
+		    PtrOffset(e1, Add2Ptr(hdr, used)) < esize)
+			goto dirty_vol;
+
+		nsize = esize;
+
 		memmove(e, e1, PtrOffset(e1, Add2Ptr(hdr, used)));
 
 		hdr->used = cpu_to_le32(used - nsize);
-- 
2.53.0

