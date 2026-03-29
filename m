Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC28C1397
	for <ntfs3@lists.linux.dev>; Sun, 29 Mar 2026 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785518; cv=none; b=RGb0vp92dkw9IbR/y262SQdEdhcABH9G1uGZAEry/zlKeb6NeM7GyQ54LDOPSW1hS5QgSpCTGlYF0JgGqp5t/FNwzOrV5PTEFCRVzcnx5LwbH6jGsqS4VfBiVsqPe33OSn/sejYOhBd6fP/MrjPJNIdViKIb+5OOeqFkaimT12E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785518; c=relaxed/simple;
	bh=DJliuBZ2A79EJ/xCnwoawoH2ID8regYRbZg1ZAqhJ3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5o0npPvOQC09+0qkQGOFVlzK0WZcpqu4ntUtk6Av0JNcwcA4EtbmFmrLsfifjqhtIR4MPLJYJbVH2VBcoALopQZnZ+xWpY4/9znpUaibbAp06Jg5/oldHJwPmLEirLI+CpX8F8jRmdoOhgaxKcgaNPgSs2x5pv7655FTsMp8G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCf9WIPI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCf9WIPI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so455330066b.2
        for <ntfs3@lists.linux.dev>; Sun, 29 Mar 2026 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774785515; x=1775390315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aiI2qcTLk45LT12wJuyeGmrvH8z49mR2GG6hI2S4GS4=;
        b=aCf9WIPIuJ84r/fyWNW3JZQdii+bhC+o1y12XLEfPUJ6NTvqdH1m5eaSDsFkq8CxFK
         7gnDdFnxLn4bTGLe+F7qcB4gBEWm4enfD5OaJQTK3iJwSi3JfI67SQF+c3H97adQTGjC
         Z/HiyFZBLkake4gmJJNqxN9fSUa9iy29EmyTB2ASFRbTQQqQfwtqUQBo0+h5StmV8O3e
         LmVKUrmMCliHUyaynva9dCLTgUNV0nwOuXoQHMcQ4dKNzE/8g+K2n6vHfPDawsCy8zIy
         qbAG+bzxW3X8QQNAQ3dm0kuWt0lyAHseUiYCWm7ISUDRV+kq+TzpYDFOyH9zi35HetYp
         yfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774785515; x=1775390315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiI2qcTLk45LT12wJuyeGmrvH8z49mR2GG6hI2S4GS4=;
        b=BI4tULfshYqIT+pU7bi35ut7C6JHMViR2deU38mouyFzXzqwX+h7Avh7C/GvKvcOg8
         IqkpiSHH6LQWP62onKCN2GUcdPgeQTpAhXF7anueVI773wR/LXLvWSdR17LnPhQve6cU
         tg2fRqH8ImMxGnGn95/8aD5mztvZayPMI9RJwy74SBMOapANffqj7ktJpmSPu60Ud9fQ
         R+c+aDwU24Xxqh1Q+1o0G+lbSv+7gCh98/5JBqmNYed2FrkD+0hr+tIX1o4UYFthZEBG
         pRixiAnbgAZWDJojBdbOg3bH49Ilbr/3fVAWISfOHzpsfP17FyDttOKXTKE75zJshqrY
         WSfQ==
X-Gm-Message-State: AOJu0Yw0kvBjntHVr9Gtjhz5r/LLTl8CV9ji6tErE3Srl6XvpdXdOvZC
	KTwzE9S5Q/3bix9zxLnZvqa/ua5wJMK5Fno8BZnupJpIB9axUVdJZ/hn
X-Gm-Gg: ATEYQzwYGRm8nRRhzv7l5oova5b5PV48EV7MdmM8D8StH8/ozG92VWQuwH/YeqO4nPs
	1fId0Jfl+OM1CP31yEg/TwPDqsjCXtMs2R9gNLc3EY7xgqd43HRR/HBjzycUzuIZx5BUnlLbLKr
	t8PbRVb5ODF+kU3ruzHGKj3JDr066Jz7iwOK7FiYHSczlL886XULh2oQCQAepfnq20XS+W/IiM0
	SdUpcxLwfp9kao1A5YXfJfvJPFK3FnL/yO4midQwwmhKFIsork0e2Hh6e+Gflbye5jkamr6s9Hk
	yUHkJJGTuW4TCc/iUtPVYlZE+FR+CAdyfaDfZN4YvjGMMqP82VgGcivZZrsdx6yXPofOkfLQrg+
	2jPPPVpTLNq+6ng77J6ugXpCpntWHZv1+izOmwNRCQCXzPcwHlcbvPhMkyAi/7XAfQD7U3EA/SH
	QYvqFfOF+LpAI1w2mvipqsBB+8NF87GLkC/+72lhsCo92mR/Ldu7BsQxa3PVIJblWanXPkvw316
	Q==
X-Received: by 2002:a17:907:3f07:b0:b98:2d0d:fc00 with SMTP id a640c23a62f3a-b9b5035bf27mr541173066b.24.1774785514696;
        Sun, 29 Mar 2026 04:58:34 -0700 (PDT)
Received: from Mac.home (176-22-56-52-dynamic.dk.customer.tdc.net. [176.22.56.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d6bsm164059966b.6.2026.03.29.04.58.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Mar 2026 04:58:34 -0700 (PDT)
From: 0xkato <0xkkato@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	0xkato <0xkkato@gmail.com>
Subject: [PATCH] ntfs3: fix OOB write in attr_wof_frame_info()
Date: Sun, 29 Mar 2026 13:57:57 +0200
Message-ID: <20260329115757.66040-1-0xkkato@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In attr_wof_frame_info(), the offset-table read range for a nonresident
WofCompressedData stream is:

    u64 from = vbo[i] & ~(u64)(PAGE_SIZE - 1);
    u64 to   = min(from + PAGE_SIZE, wof_size);
    ...
    ntfs_read_run(sbi, run, addr, from, to - from);

A crafted image sets WofCompressedData.nres.data_size to 0xfff while the
file is large enough to request frame 1024 (offset 0x400000). This gives
from=0x1000, to=0xfff. The unsigned (to - from) wraps to 0xffffffffffffffff
and ntfs_read_write_run() overflows the single-page offs_folio via memcpy.

Triggered by pread() on a mounted NTFS image. Depending on adjacent
memory layout at the time of the overflow, KASAN reports this as
slab-out-of-bounds, use-after-free, or slab-use-after-free all at
ntfs_read_write_run(). Secondary corruption/panic paths were also observed.

Reject the read when the offset-table page is outside the stream.

Signed-off-by: 0xkato <0xkkato@gmail.com>
---
Reproducer:

  Create the crafted NTFS image:
    python3 create_wof_poc.py -o wof-poc.img

  Mount it read-only with ntfs3:
    sudo mount -t ntfs3 -o loop,ro wof-poc.img /mnt

  Build the trigger:
    cc -O2 -static wof_offset_table_read_trigger.c -o trigger

  Trigger the bug:
    ./trigger /mnt/poc.bin 0x400000 1

KASAN report on 6.19.10:

  ==================================================================
  BUG: KASAN: slab-out-of-bounds in ntfs_read_write_run+0x321/0x450 [ntfs3]
  Write of size 4096 at addr ffff88800353b000 by task trigger-static/55

  Call Trace:
   __asan_memcpy+0x3c/0x60
   ntfs_read_write_run+0x321/0x450 [ntfs3]
   attr_wof_frame_info+0x52b/0xbc0 [ntfs3]
   ni_read_frame+0x3cc/0xfe0 [ntfs3]
   ni_read_folio_cmpr+0x3b9/0x820 [ntfs3]
   read_pages+0x58a/0x810
   page_cache_ra_unbounded+0x29c/0x5d0
   filemap_get_pages+0x2c8/0x1530
   filemap_read+0x2e7/0xb80
   vfs_read+0x6da/0xa40
   __x64_sys_pread64+0x195/0x250
  ==================================================================

 fs/ntfs3/attrib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 6cb9bc5d6..89921e509 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1576,6 +1576,12 @@ int attr_wof_frame_info(struct ntfs_inode *ni, struct ATTRIB *attr,
 			u64 from = vbo[i] & ~(u64)(PAGE_SIZE - 1);
 			u64 to = min(from + PAGE_SIZE, wof_size);
 
+			if (from >= wof_size) {
+				_ntfs_bad_inode(&ni->vfs_inode);
+				err = -EINVAL;
+				goto out1;
+			}
+
 			err = attr_load_runs_range(ni, ATTR_DATA, WOF_NAME,
 						   ARRAY_SIZE(WOF_NAME), run,
 						   from, to);
-- 
2.50.1 (Apple Git-155)

