Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795227770;
	b=nD4ZsGUWCNdcwH+qH/Lv/26n7JLA9qznLKhrm1tQjM5vAU6b3EwjCvHwTC4GuuQt07ab
	 Y+/Gxr0Wx5oupnJfp8E7SoSu+Mhtrm+eKv4wZQ9C71Pdaz8FqIrkGKXTSC2ZFoRgL1vtm
	 s/mbOglM1OYJyCtmiB8MSZOoSvQnqcpXm/bwgthOn4m76oKfxQFSAwyaaDIWSgSyhwJ7A
	 Cu2UaBXBo3nG5hE4TgctfXU5lUaLgaqMl7hWM3A67vc7kenXEU3oZEyHPUKGx3lnFJQ3W
	 shXfklXMHA/Eu4ZRIHYBl5OuDMrrOF8F4lR6mY3y8zIOr5JsciqP/9TjtVnMZL/3kaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795227770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ULMqDPAIp2srWXkfEvxQ7kXK1Eoc5pC2DGM2zNqyAO4=;
	b=UAoyR/fezFdET5hK61X0l4HYf+CExwQQ5kw6I/mn0jHl9ILINMd2B6NCPtMAIzSGQ+aw
	 gb5ePehT8i0GX3iG1VK97rkDn1PBq5HOyQQ6YC7XXj9216Or0JF9CEeXrWSjK2Lwarn69
	 6cGi80GjU7aMcQmJNQQXq+OUNG/jalnIEhEc7GDVPkXQgqdHi99aTv9ZGlc9WXK/eoJ5X
	 W2umsDSfte5Q62CVL1xJQ5bgfEee18BI45JKMWtzKWaf51sXuNzEAolZifVU2sAEGQR8w
	 3wMpZRrI3QZKmbpJpWvBVjk1obmTfNiPL1DwWEC/atkwgBk6AKMq/5Ru4BkqhAt6ULw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZsb3zMI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35032606A6A8
	for <ntfs3@lists.linux.dev>; Sat, 21 Nov 2026 02:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35032606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZsb3zMI
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae85add512so9979491fa.0
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 18:22:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795227765; cv=none;
        d=google.com; s=arc-20260327;
        b=IvuYgK+zeLhFSucFGLUYc+J75ITOpcEaKlQ3C9ocS29RDrW6KGSXNdyac+fZD5Hv9g
         CHt7QJwqcfV/M8CHYJxvDMiz5O82bCL+haQLPgXN4pDhi9dUGCeXCa/OW5L4mTsSW7L1
         cHyGijxdB4RTFhEwzfCLvmSv+vMdcBjkABLlBFlG9cVdrhikweFsiPRxHteofSilpPxC
         ROITdDgCcagZQygTDMNlXOdduMEO3g9zwTKTKFwQC7Do0AxzZsxC4CsQXeFQJ1gP5XYP
         +KYH0Bn1tBIMAPwEphG27tSBd9KFalSRQB0xFl4y/8wHx5qqlXSNgTf3CViqXwIybqnF
         xHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ULMqDPAIp2srWXkfEvxQ7kXK1Eoc5pC2DGM2zNqyAO4=;
        fh=k81t1+qqRniqj8UMIlOnBPEUVXSczYAI3Rtx9t4QeU4=;
        b=WR9guydT3BEIsnOix0W1rpAplzn9mNqcopDJzpSDc/l5ecoAFYn8TWY8a1syHqGyYE
         Mb7bjQaRYCvHaeCEiAiKQb/l+O8WlItPwPys+0zXWQNbSzAvZhPxZ671o5BJhANwmkxN
         1xpdQr9D3DFeZyyH9IWaq5WFwfEVKg5BsJQcvgFhirbKVnJEGSuklRASiPAoWRnbZPv0
         dGCPvrItmDN/XfMaB9ln05xHtEseLI95QaJMGRjLUSucJD+e4cXrxhTtcrWC87KRGp1d
         HBm60a2BfClgKqakQ4ZBnJppiuypRVLPs09yGx9R/z+mmT99k6BujlD+zcg0sNoyVkPA
         zC3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795227765; x=1795832565; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULMqDPAIp2srWXkfEvxQ7kXK1Eoc5pC2DGM2zNqyAO4=;
        b=CZsb3zMI+tEigwYXDdJgC9Tmq5M0aJnsTleBor9abCAxnc9mUfMC2bOt7/ovHh4ySQ
         6BtUefJfl78NWp1CxKsxlTPj/zFz+/WxDCfMBo/hNGGxTvL+js+DqOjgHM2dX+nvzzCL
         w8tf6sUWjB7OrQT7pa4wDKHvdN/XuEcY+QyB/W5H3zBLxDqVhhSdKYgIuL1lSu5IiFTe
         bZ55dw4IQfZG+mQmZnWLQjEBQ11MRJc38OKwubV9qNMZPWEQu00fWHEj8rb4wUXHPOXV
         r3jyf1ZPgYFT+COZCMOKXjbBI9Djvrqf9hROZ4l14WJGlwpJMFsDNcJdu3BoMEtWQLwS
         WNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795227765; x=1795832565;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ULMqDPAIp2srWXkfEvxQ7kXK1Eoc5pC2DGM2zNqyAO4=;
        b=bK5fn4fBepAbN1rASMU1EDOBh831d3AnjoxEq6BFa8/a5TIoynLq86vnKJtSRz+8C5
         aapoLfKwbHbFpEHNTJkUCfWo+wa35FVO3Kykf3lqtZAySAwPC6RgRDv5zZ0YlDcKdfcM
         9ZHgmZt0YsvyLrBYMcWmxfg/cr7itY0ae0aFNwbT427hL6pBjwcDxr1ollDgSW0Vmtv1
         xXg0gUc9fu21mq0KoQzDmTWK5lWR0IfAP/GZlp/bfVLcsw4Axjok96GN7eGHQR7Vm+yh
         /juIMWtKE0LScM3EMv9lqEt1YYMdpIiVLMCvQiBfyMXSsh+vDgq0adWpYC/Zq5CuX5+m
         /u0g==
X-Gm-Message-State: APuU4Z9UYzJFRhNm9IHPqDrW2mV5Yk7uZUybvcsStEhfBFwyJzueVU8Y
	InWh9+Qd884Gt8zbjGShL6JhAVbXL9KtXcy1i0iUjtHJq2YiDRYQX7o/JrdM1t05ByvbZ8E6gzA
	iiKcOYuCFM2B2DU3K0bvu5yXDu5FLovcEVta9D/k=
X-Gm-Gg: AZFdTZdSYwpr928goBPX8vO0B+4suZSjyUlIaE5V9vtwEQwW681SS1m7BHEZWCVb4au
	y0/+fkaAyBI3eHkIKJR/kuNmGdV8oPOEmvzQT5NTHcMMErmGHc6ruBtYQgC2QCnzaEgxIF+7pdW
	+47SGWOuJSM7+d+dU9XFjYaP1cJdGKJSeorxWftdaD3MX1h8ZEYK/OSsudK6RL5orHosiuXIL8Z
	hq+2fJ28+Csu/P15ivulO6gYUlDml5/n/RBn5feua64EPqwToSHv8s7B2kWfJcP3LHB1z3vP3H3
	hw5RSa8upw1dlmknd15jGYnOP1Pb1sGd8WQdNPbdIpyvN4i0EziB6Hgh3bbtiCvL2BUbDIklZJr
	JcYXIm5DB1KFwAp21b9xJwIE85dHhblE/uU94xdYEhi+GrpQWVJtjpJbNyA1Hu3QfBRG9dO8=
X-Received: by 2002:a05:651c:12c3:b0:3a9:d70c:f75e with SMTP id
 38308e7fff4ca-3ae7f9b13fdmr13720461fa.7.1795227765107; Fri, 20 Nov 2026
 18:22:45 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Tanuj Sharma <ertanuj96@gmail.com>
Date: Sat, 21 Nov 2026 07:52:32 +0530
X-Gm-Features: Aa3M54rDAXJcpA9nCVZd8G2ChiOyncW1wB5IyOLgej5uGhtNbAmnkCcdrDrsfTQ
Message-ID: <CAAnb6FRwYjE0jXUxqFHKu8ZAmLyX_+hwpjSuuD1RHjKGVeAOcg@mail.gmail.com>
Subject: [PATCH] ntfs3: fix out-of-bounds write in do_action() bitmap operations
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch fixes an out-of-bounds heap write in the ntfs3 log replay
path triggered by mounting a crafted NTFS image. The buffer is sized
by bytes_per_index but bounds-checked against the larger lco, allowing
bitmap operations to write past the allocation.

Thanks,
Tanuj Sharma

From d6abed28f9eb5941da61bbe2b59876f93b4c75de Mon Sep 17 00:00:00 2001
From: Tanuj Sharma <ertanuj96@gmail.com>
Date: Sat, 21 Nov 2026 02:15:09 +0000
Subject: [PATCH] ntfs3: fix out-of-bounds write in do_action() bitmap
 operations

In do_action(), when replaying log records for ATTR_ALLOC attributes,
the buffer is allocated based on bytes_per_index (typically 4096 bytes,
kmalloc-4k) but bitmap operation bounds checking uses lco -- a larger
value derived from lcns_follow << cluster_bits (typically 8192).

This allows SetBitsInNonresidentBitMap and ClearBitsInNonresidentBitMap
opcodes to write past the allocated buffer into the adjacent slab object
when processing crafted NTFS images with malicious $LogFile records.

The bounds check compares against lco (the full LCN extent size) but
should compare against the actual buffer capacity. For ATTR_ALLOC, the
buffer is only bytes_per_index bytes, allocated here:

  if (attr->type == ATTR_ALLOC) {
      t32 = le32_to_cpu(oe->bytes_per_index);
      if (bytes < t32)
          bytes = t32;
  }
  buffer_le = kmalloc(bytes, GFP_NOFS);

But the bounds check uses the larger lco:

  if (cbo + (off + 7) / 8 > lco || ...)

With bytes_per_index=4096 and lco=8192, any bitmap_off >= 32768
(byte offset 4096) passes the lco check but writes past the buffer.

Fix this by computing the bounds limit as the minimum of the buffer
extent (cbo + bytes_per_index) and the LCN extent (lco). This ensures
bitmap operations cannot exceed either the allocated buffer or the
on-disk extent, and also prevents a crafted bytes_per_index larger
than lco from weakening the existing check.

Found by code audit and confirmed with a crafted NTFS image that
triggers the OOB write on mount.

Cc: stable@vger.kernel.org
Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Tanuj Sharma <ertanuj96@gmail.com>
---
 fs/ntfs3/fslog.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 1879d04e3cd05..85590f56587c2 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3751,10 +3751,16 @@ static int do_action(struct ntfs_log *log,
struct OPEN_ATTR_ENRTY *oe,
  off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
  bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);

- if (cbo + (off + 7) / 8 > lco ||
-    cbo + ((off + bits + 7) / 8) > lco) {
+ {
+ u64 bmp_limit = attr->type == ATTR_ALLOC ?
+ min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+ lco;
+
+ if (cbo + (off + 7) / 8 > bmp_limit ||
+    cbo + ((off + bits + 7) / 8) > bmp_limit) {
  goto dirty_vol;
  }
+ }

  ntfs_bitmap_set_le(Add2Ptr(buffer_le, roff), off, bits);
  a_dirty = true;
@@ -3764,10 +3770,16 @@ static int do_action(struct ntfs_log *log,
struct OPEN_ATTR_ENRTY *oe,
  off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
  bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);

- if (cbo + (off + 7) / 8 > lco ||
-    cbo + ((off + bits + 7) / 8) > lco) {
+ {
+ u64 bmp_limit = attr->type == ATTR_ALLOC ?
+ min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+ lco;
+
+ if (cbo + (off + 7) / 8 > bmp_limit ||
+    cbo + ((off + bits + 7) / 8) > bmp_limit) {
  goto dirty_vol;
  }
+ }

  ntfs_bitmap_clear_le(Add2Ptr(buffer_le, roff), off, bits);
  a_dirty = true;
-- 
2.43.0
