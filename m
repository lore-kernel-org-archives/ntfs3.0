Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357632D7393
	for <ntfs3@lists.linux.dev>; Fri, 10 Jul 2026 02:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783650662; cv=none; b=HgPmkssoE7AJuuL9Bk8fSqEIp1ktvjDWfw18ZKE5y2g3zQ+qTtEt1mmKP4jvFfkn4k0JWkqkPug9yY5KDEW96noXq5IA/9/Z4aAgRU0DmiiDXY+KnjMNnj6tzjUEWNgW9gejggDFvPgffqXCvTPJQWdtIgzjIEcHnhqb5r5HRfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783650662; c=relaxed/simple;
	bh=46IHW5kOXqyiB5yT1qHGgFEZCMXtxEsKIeHLPwqmOc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XJ7obIYysm6HPJG9YdoRuu0GCMNrt0CxsfBYW+uAqyvfcJ9bz7iFx4nwwjf8cUt0/Soz1GQLmf8ufi8dZPO4fJSjaY/xSZ5voRWq1rqV7LU4zOwPkbf1DaWIG9Kvx5ZAorWF285bDsh0PTw1xwNZ7JcJvnLm19+0eXcKHODtwWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvuYzAzX; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvuYzAzX"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9217d13c276so18346185a.1
        for <ntfs3@lists.linux.dev>; Thu, 09 Jul 2026 19:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783650660; x=1784255460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcg048O+IxpZhUZpV0edccOsRb7Kf/SXUV8o+WElGKg=;
        b=hvuYzAzXvOHm/8Tp5wJUueovocZTYzXNhaoDvTxzNIBUqkxMvQx6A8DTK9i4e66sRB
         m5dP8TrEtIOir2Y0vL+Zv1ElngN+YI/dkVSUur+c5MLT/xHAamEDsr6NlplAF+XH0bVK
         xsib7ueXclMvd/ummQvk5tq95vjUInHIcBcm+YBla9AH6oxAAdYXbzuM/TsMvaCYl8DM
         f+4ex3w8xOCkdTOACojqFbgXOJPbLa1TswHPdepBQRDsPe49tIJAm+s3K6VvQ/P7m9oW
         6SBh/nqt48W14esd8yp4oLvmoPE1uYRDHNtH6uvjzhSSyOLG/lHXJx2rx2FTdMZFPSYE
         Gojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783650660; x=1784255460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcg048O+IxpZhUZpV0edccOsRb7Kf/SXUV8o+WElGKg=;
        b=MgqvikeVP/wdW96No6jqUSI7sMui2ACVnSll/RdB+K1lCo5Ev6Yn0uKBC5F4YT8pkB
         ULSyBDr4dvoQMOBAxH9/QSBoFjevRevKxLcOyWb1vDrVB8JDG9QZRuWmlOBs3E8pdiOp
         POyO6VWb0hK6VZ/rMUhi4hHbeCRPzQgvI/b1OEYe0WBXdo3aGC8XHkMCX5pw2pOM5yBv
         5poagitu6lINUiGvfgtPo8yjCeHKkVX06Uana9lmlboOUQVHDzKFnjUy/ECKO5GEu4mk
         UlTy1zheqCkeRnNeyVamQ7pJ0zLOm03dwa5Qe56mosT7HYJlDzI0UA/uZs779KfST3zw
         JE0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp/kZ5WeyG488xVSrZQviVXOtkJhSFt8O0k0M4rvea0C060Mb/2AaCL6APfbAueJeArY4nZjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRy/wToVjgvWKZ30hqTW5Lpp3a7Iw+r7k+udzVekUQ8wAo+Hl/
	Q/Dmqo9oSb203fatsyXdGUPZ6mkjzCLYoxZFNAPpBu1ldlDezgCOIEit
X-Gm-Gg: AfdE7cmdKAuDmKIi90UjmTg6OesNUeKOy3dnf3SAxK3dp7IYuIe2gRRnKjpi4vqyXIT
	mfbkoCYFxJwOnzHiU8DBvr0Y7m7JIQTAmdmTngZzKNLDplk7R1dWKR/edTaMhW36olxch+Y2R3b
	qcqtsR+igl8e5IFX0U6HoVSXcBWrkXiE7yCH5jD4CraqjRzZqZb8YhBluIdMOx954CP585thRhT
	grGD9my7trjDwrFpLiHSUnVhRnEMpZdSkWi0Ig17yDJwzXQqBhfJ34hEdOln9VoJd8l5tsNObXt
	uj85KUIaNL+/XP62iPKsMlgiFKb7COZ2cl58phGIHkTn9Ya7BX2OSA5hKR2shWRCl2itW9dCI+f
	FtEv1yhizRbLKp4x2bBjG/QiDMbWqpEka7qlRlNYaTtwyq02CNtLvWA0300oQt0drG5Su/6N4fq
	yFE27N+dfe8L+QLEsbRsLaHFdqQmcpOealK7WYujDiCZxk+JwFsReBZuvSNgvPnNIFd44iZJUlp
	jMrx/7uKgYZqXNrvnpPswyVA4ATxh2PdQIOFH2/cm8=
X-Received: by 2002:a05:622a:a591:b0:509:3cd:b22f with SMTP id d75a77b69052e-51c8b2e2428mr106477241cf.23.1783650659833;
        Thu, 09 Jul 2026 19:30:59 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caae24d04sm6804331cf.18.2026.07.09.19.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:30:59 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Mihai Brodschi <m.brodschi@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: reject an oversized resident attribute on the inline iomap path
Date: Thu,  9 Jul 2026 22:30:54 -0400
Message-ID: <20260710023055.3746252-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

attr_data_get_block_locked() maps a resident attribute as an IOMAP_INLINE
extent using the resident value length taken straight from the on-disk
attribute, without checking that it fits within the single page that backs
an inline extent.  mi_enum_attr() only bounds that length against the MFT
record size, so a corrupted volume with MFT records larger than a page can
present a resident $DATA whose length exceeds PAGE_SIZE; on a buffered
write the inline extent then fails the page-fit invariant and
iomap_write_end_inline() trips BUG_ON(!iomap_inline_data_valid()).

Impact: writing to a resident file on a mounted crafted NTFS volume whose
MFT records are larger than a page oopses the kernel at
fs/iomap/buffered-io.c:1061.

Reject such an attribute in attr_data_get_block_locked(), before the inline
buffer is allocated and the size reaches the iomap core.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---

The oops on current mainline (the inline buffer is kmemdup()ed), reproduced
on 7.1.0-rc4 with KASAN by writing to a resident file on a crafted volume
whose resident $DATA value length exceeds PAGE_SIZE (reachable only with MFT
records >= 8 KiB):

  kernel BUG at fs/iomap/buffered-io.c:1061!
  RIP: 0010:iomap_write_end+0x48e/0x5c0
   iomap_file_buffered_write
   ntfs_file_write_iter
   vfs_write

This also matters for the queued "ntfs3: Allocate iomap inline_data using
alloc_page" change: there the same oversized data_size makes
memcpy(page_address(page), resident_data(attr_b), data_size) write past the
single alloc_page() page.  Bounding data_size here prevents both.

With this patch the offending write returns -EINVAL; normal resident and
non-resident writes are unaffected.

 fs/ntfs3/attrib.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index e61c5bf7e27e4..d41ca930daebc 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1039,6 +1039,21 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 
 	if (!attr_b->non_res) {
 		u32 data_size = le32_to_cpu(attr_b->res.data_size);
+
+		/*
+		 * A resident attribute is mapped as an IOMAP_INLINE extent,
+		 * which must fit within a single page: iomap_write_end_inline()
+		 * asserts iomap_inline_data_valid(), and the inline buffer is a
+		 * single page.  mi_enum_attr() only bounds the resident value
+		 * length against the MFT record size, so a corrupted volume with
+		 * records larger than a page can report data_size > PAGE_SIZE.
+		 * Reject it here, before it overflows the inline page or trips
+		 * the iomap BUG_ON.
+		 */
+		if (data_size > PAGE_SIZE) {
+			err = -EINVAL;
+			goto out;
+		}
 		*lcn = RESIDENT_LCN;
 		*len = data_size;
 		if (res && data_size) {
-- 
2.53.0

