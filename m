Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98447FAF3
	for <ntfs3@lists.linux.dev>; Wed,  7 Oct 2026 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372196; cv=none; b=JO7fNLvXwbwkYtSl5fIg9ilLTvbfdy8dNGhnZ/fHfRtoLXFnyhLYupEBsGhDPlShiiq3aVzxdWH4N6j+RkmdpiH5M5wUjpTP3z9tZu10EJR/hd5Svjv/C6pAK4kMdBvTXL+nVhY5Hjbj+yZ54amO42KM/77F1Tmy8Vl5V6vZ5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372196; c=relaxed/simple;
	bh=gJn4QOtoHvhrbW7akpCrWeEECzAN+PgZfCQS4O+FXGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=paPMPZlkPCarIAYSDTWCp1ebpYVPBF3rYh1UUYAtii9oR21E7Yh+nM2TzM8JeQWJSLtK7KgjgzfI7+ACvOghpz75d0/mfp1rlaoXzsupN/e0+VGEviEP9zmrKEe5AYVwiJQpWDYY0Bscc8W6HORG4n2LyBhtEvjP167Gyq9vHoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYppuP/W; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYppuP/W"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a865731ee4so1491872a91.2
        for <ntfs3@lists.linux.dev>; Wed, 07 Oct 2026 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372174; x=1791976974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFWSfdj5IMHDuOqt6PlC1JPh2KrPx0JuxidahroXzNo=;
        b=BYppuP/W3lp0zqXjkJJZJ7fwOO/HzwGZlYh8PzSLkoHbathUkw/Kvm1ZQhAVX1kJZS
         EK2OaRTJYvagScapILeQ5WbxDfhpQNN1SdEoRKko+GIt/GXIADGXUyNd5kfB+6jF6QmL
         8V5NFhv8L1ts/uwD1P15h7npPFUtICYwDTOqQcozNNKed3qfRXxEnb1ydcth8dqo2Q+I
         Z4K24jyXFa87RiyAuCQUfelsx4DNtl6k2jXwH0SyxohJNrFA5D6RYYwsFR09AgfofUSN
         GHdgiE/7vjgzj4lkTbVjheuc8cWf4CxuovtS3covTe5fbMOlbOaLoI9FpPmL4kfHHJwW
         bqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372174; x=1791976974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFWSfdj5IMHDuOqt6PlC1JPh2KrPx0JuxidahroXzNo=;
        b=dciXOV2PelcXPcIqprFJrUJZeaRTgk9WJLFhjBVbrTQ5LakC16UtfJKSxRUPu/qzva
         E+BG478q/vLnwtoggYJ2ef14aKQLViQHY5v0ZtNhRE/Z15cyF44rQArQt4QS0+hTwySu
         j5q/rZuMeNYS2hsP/oov05jFFnR2Ozb0XOIFDs+WHqWROZjOmFm+nUXP+zIxMQOjMkHU
         A669RqthpyxDRLnso8jgBvf7vw5PTWODzOD6lXLMamAf6XwSQkqCtvbMU2UZGo1B9i24
         lhCgVCaDrf7YU+kueI0UGqAXg91RSFdmOU33vgEzsa0H8iqIHAu4G+gVnxGzQFSRCH9U
         EIfQ==
X-Gm-Message-State: AFq9FYJSzBn8TfuFB7IWIWRJAR2y+q7w1rpEaNGfLKW0zr7a0Lk36rgy
	htg1USBR6pvqlPhtFHdHzemGMQF7Xe2K74uRtPXr09o2oJ8FYXTH9tl+
X-Gm-Gg: AYBFou30BaeuhlcRRSKNTIHDEbw0MU/BEL73iFD1nTbuoKbSv84x1QbLPMAEtK+jGjG
	LLkyB8z4y2ARA9VW2Y/sb299wAOtSH5EEOFCTjTZ/FXdiCLh4TTpyxp/kNLePz8BRPI4vfjx7RH
	DDVmOuEhjMHwbYG0I+6TIMJVt76rf+TJFUyaAgFXjq11ca5nYzdhqAknmiG9w0auV3dTsIOo/Bk
	uOdsHjg4flQf9r/lq+lDoxE3aSYcasVM6zSZmw1vi0dVVgRWlpwYl5ciU8sF7R5dYZwLu4Jhli3
	R0I8G1SEoPl0ZnD5DGf3GdD8MXiZ7Wn5djWVV1gkjEh8+e/HyX7hN/t6l5y+4XQOBeX3bS+uaX8
	+JmEc8I02cATeTgVYh9znLBqayqOu0KC5V776Q7FVtNPmY7JTVGAPqm8DJhnVJjbH40I9sG3+Av
	WGl3RYHcPjzpBvURvmCvPAxm5d7QdaTEfods8fwhUzf6nH67vYSxoBCrWhMyBODyVh3ZY39R30k
	4/E6FAVZsZr
X-Received: by 2002:a17:90b:4cd0:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3a8a17f8db0mr1702620a91.15.1791372174383;
        Wed, 07 Oct 2026 04:22:54 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d5e19c1sm1732592a91.0.2026.10.07.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:22:53 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] fs/ntfs3: fix out-of-bounds read in ni_query_ads()
Date: Wed,  7 Oct 2026 19:22:47 +0800
Message-ID: <20261007112247.2518924-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_query_ads() copies the base inode's named $DATA attribute names,
newline separated, into the caller's iterator:

	if (vbo + err > *pos) {
		size_t off = *pos - vbo;

		used = err - off;
		done = copy_to_iter(Add2Ptr(buf, off), min(used, bytes), iter);
	}
	...
	*pos += done;
	if (done >= bytes)
		break;
	bytes -= done;
	vbo += err;

The guard establishes *pos < vbo + err but not *pos >= vbo, and off is a
size_t.  copy_to_iter() returns the number of bytes it managed to copy,
which is zero when the destination cannot be written.  *pos then stays
put while vbo advances by the full entry length, so the next iteration
runs with *pos < vbo.

For two streams whose names are 40 and 30 bytes, the second iteration
gets off = (size_t)-41 and used = 72.  min(used, bytes) keeps 72 and
Add2Ptr(buf, off) resolves to buf - 41, so copy_to_iter() reads 72 bytes
starting 41 bytes before the kmalloc(PAGE_SIZE) buffer and copies them
to userspace.

ntfs_init_ads_node() accepts the query_streams name on any regular file
(fs/ntfs3/inode.c:540) and ntfs_init_fs_context() leaves ads enabled, so
a read of file:query_streams into an unwritable buffer reaches this on a
volume with two streams on one file.

Stop the walk once *pos has fallen behind the current entry.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
---
 fs/ntfs3/frecord.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a953f3f..5a88c875cb2a0 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3430,6 +3430,10 @@ ssize_t ni_query_ads(struct ntfs_inode *ni, loff_t *pos, struct iov_iter *iter)
 			break;
 		}
 
+		/* copy_to_iter() below may have copied nothing. */
+		if (*pos < vbo)
+			break;
+
 		if (vbo + err > *pos) {
 			size_t off = *pos - vbo;
 			used = err - off;

base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.43.0

