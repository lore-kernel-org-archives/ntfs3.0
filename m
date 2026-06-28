Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E31351C2F
	for <ntfs3@lists.linux.dev>; Sun, 28 Jun 2026 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782640621; cv=none; b=I6svrwQiAYtl+Rxrv+Nn8uPFHodp+xZCJak8xyBeM9qyUgWEQZLExss95/Mg035MbdKxjO9/HRCT0OSgiMzQ3pYSZE3SE1jVw8QkACu4STh2w3f96B0FYWDV1bLbpH3yz0+Cxp8Uu0owP1np1K8AKTK+H21uSKTpdrGiIiUzTtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782640621; c=relaxed/simple;
	bh=iI6UpRpfUgXDkri4EcJW5TuLXyA/5MefvjbCl/LO6PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEmXspQBbuGOh75SLlnBsyo6jeZY63hVVatd2NWmoSZm94oqbO22NLePofuUZQ7AvfR6qJczdlKFe+fLKNjWOjeQWcjKMM74vfVQ4v/Ikad0FPl3y5mn74MW/nFv1tgO+6dy5uDcZ/Lkf0rtyUZaiU0FvUb0m6/+WQlm4QsCs9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sM+lKGx/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sM+lKGx/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472a14c9965so338272f8f.1
        for <ntfs3@lists.linux.dev>; Sun, 28 Jun 2026 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782640617; x=1783245417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg43f+XEb4q5xqiQSXTBL+eF+ouBz+XEK14Aa67BdH8=;
        b=sM+lKGx/YatYzXibDf0Dsl7y5kfH/ImEDDogF8MV9qEtXEqxEsA/K6G4kuSNKCk75C
         AI82SLz+jrMw6+5ovd1UpqGJlh3EkwLv36zv5bbyDm7uVRgyxE2ZwhDi/0gsici7N34I
         TGC4UU2LFG4Jj8ooPZa+6jSuE1Jou7A9dV5oUzMPdsgFHFcyRRIRnVxBC0jV95MB4wGZ
         XPSq//tnazClpbE9h289R3V9KMVseO2i5wUWrB1S08sS8FBu48UjWMOTVbrxJWPrGCAE
         UDFDAVdI+iatXQOkhjv4aaXYRN7qBlEKmsv3ISCXKrA8lSQO+fUWBR2r+Nz/yX1Bmcjv
         Px9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782640617; x=1783245417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg43f+XEb4q5xqiQSXTBL+eF+ouBz+XEK14Aa67BdH8=;
        b=P6FbIosegRxB8Od7HGSicPGSnyr2BiFi2WbNJQY+AkB950RK6ZGHNzThl8+ooA3gRG
         Pn/WvIswbYN/Uyeix3zIAtzISmhvj0RvsyNi96YttHWqifI2USy8y2HqwirWsh1q3gfA
         WdRZEjgHMAA7sb+K6LaT+50MKQa3Dc+UouU/0/ljFMRTUed1E3oqnwnKyWf8XFTl9isP
         J5XcypeT2od7m4+KsxP3J4Td1qUMdO+2umpfDZdndzMOVQ+Bl7zolfmGUCA9f3BCLvUE
         J10QSBv65sdBg8jszWR/GpMTWoZluhXML9R824cZjwtvoK2UEQ6+9RuI5ICZdJlonGG3
         /30Q==
X-Gm-Message-State: AOJu0YxqrxtLkA1gDC4o0/jgq3hXZgZWiJPbgY8jHoUdcw5a9FfzBiyp
	KjfRsuFTTRqGVERzUPXsf0jJdyA50SDE+jeIg+PvJ/P16UNx489Uw7Tq
X-Gm-Gg: AfdE7cmhvxwVxG/1Kur4pqfUYKoj8OK5dRHpuEULy7ywgLNKi7MMZhPYFkY/y9cO2b7
	2EZT/74ewKyMqVovGLeTBTOb396TJskCPQDsFA46R901EAqZbqfnhL3kcULqzq/xrsefHukZXHF
	be2B97qwqcsTLrhr88p1uuQSbfWgOmH5CI3Vv7UoJ4IoR77WbYxuaUt6OHirHxmxcV6lpmsO+Hz
	NnntufiU1WvA25VoJn128UcAQ3PLilxliyJM2DND/8zEc7Bhjuu7qVy1lntfO7VP+NpTMsweSTx
	ffFumZZjxHfgc1ts4M9Ov78dqQ0rdXKmSKsSPhKDKVfbSdSEEJenSCSn3g/Gy+UhWaK5+Vu6Uni
	YDlRHiw1ObNimPRaHTEx/Z5ufcH+v1Q6BEocZ8rJ3NkcaN54k9rOYuxFxXjOhKIPRqstNhk1aon
	w7VA03VKeDIb7ocYCu6vRsoiqb0dsbsmyLmbxr
X-Received: by 2002:a05:6000:4286:b0:45e:e9ac:42e8 with SMTP id ffacd0b85a97d-46dc0839ffbmr20802510f8f.18.1782640617140;
        Sun, 28 Jun 2026 02:56:57 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47327c47122sm2959694f8f.34.2026.06.28.02.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 02:56:56 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+45ef5a8d661162757547@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] ntfs3: bound index head insertions by buffer capacity
Date: Sun, 28 Jun 2026 11:55:59 +0200
Message-ID: <20260628095559.47891-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hdr_insert_head() shifts the existing index entries by ins_bytes without
checking that the resulting used size fits within hdr->total. A directory
index root larger than the newly allocated index buffer can therefore make
the memmove write beyond the buffer.

Reject insertions whose size would exceed the index header capacity and
make both split callers unwind the new node when that happens.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-by: syzbot+45ef5a8d661162757547@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=45ef5a8d661162757547
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 fs/ntfs3/index.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 5344b29b0577..64e1be9b7aca 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -594,6 +594,8 @@ static const struct NTFS_DE *hdr_insert_head(struct INDEX_HDR *hdr,
 
 	if (!e)
 		return NULL;
+	if (size_add(used, ins_bytes) > le32_to_cpu(hdr->total))
+		return NULL;
 
 	/* Now we just make room for the inserted entries and jam it in. */
 	to_move = used - le32_to_cpu(hdr->de_off);
@@ -1743,7 +1745,10 @@ static int indx_insert_into_root(struct ntfs_index *indx, struct ntfs_inode *ni,
 	hdr_total = le32_to_cpu(hdr->total);
 
 	/* Copy root entries into new buffer. */
-	hdr_insert_head(hdr, re, to_move);
+	if (!hdr_insert_head(hdr, re, to_move)) {
+		err = -EINVAL;
+		goto out_put_n;
+	}
 
 	/* Update bitmap attribute. */
 	indx_mark_used(indx, ni, new_vbn >> indx->idx2vbn_bits);
@@ -1881,7 +1886,11 @@ indx_insert_into_buffer(struct ntfs_index *indx, struct ntfs_inode *ni,
 	/* Copy all the entries <= sp into the new buffer. */
 	de_t = hdr_first_de(hdr1);
 	to_copy = PtrOffset(de_t, sp);
-	hdr_insert_head(hdr2, de_t, to_copy);
+	if (!hdr_insert_head(hdr2, de_t, to_copy)) {
+		err = -EINVAL;
+		put_indx_node(n2);
+		goto out;
+	}
 
 	/* Remove all entries (sp including) from hdr1. */
 	used = used1 - to_copy - sp_size;
-- 
2.54.0

