Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009238D3F7
	for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714470; cv=none; b=r6adIe5f7XjKtHtqpFNefsnnOJ4X0pX7HqODkQnBG3tEEzL9tg/T48IVfjIWpIXr/QWwRNOm6Qvd6PoBsVoK4qoUlB0tS07Am+9DTsJUHQJ5+bvPWRw9ui3NWxmSfahQeaZc1bR2Wj8zA28qDoPygOr5QO+IjRsz/gCVXSJWI9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714470; c=relaxed/simple;
	bh=Slvyu9DiqG2WkoK+wCk7NMUEKZWwNVoV8NyAOHiygx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p0hnseJwX2HUkqJJjv6MscPeB/E1ap9dmJGFNTRHuV0UlGAOpuex5QHYCRAivDbORKDzV/mlfrFPj4mTivlzUIk5v0RG+qtxp5xaoH8d2rmLCH8TBg8RNhGgAt5Dg2APcAJYRn5+7sfi+zj+Km7lWbBQBnPb+9ZMje0tGGswZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keNr2q0Y; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keNr2q0Y"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso4607800eec.2
        for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 13:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790714468; x=1791319268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwQ1SxgN+pXJaELo7dyIAhb9rYmD56HQJqLQ/gzjhs8=;
        b=keNr2q0YU6p4c+TPIMYVYjkQEnAAsj+S1PSGB7qkxTEKf5xaVMvsy7WkVc6Avs7Q6y
         EBteXeurPWIT8IguJ7Fkf4Aia5VsFxzMhGuzbMmpAqPId29kwJ1NR/g69PnsA7+O29/3
         HFLJGxl5E1jNErL7AWldrPJWcrgmTDPq8Rl4IKJuVAoETbIe8yz8neZhlakYj6ASynfY
         LPyTC2sIElLlt1jP7+pBr49BGphZvhAM9XrvwYT3+Eg5jtF2LVPw5VMev1uYzpY5D691
         ijTPsx5sC0ZbGWWG4s4WSnxjqp6O4V48MCKFtwJFNg4OOLunqraFF7E73BKudh/Oik73
         Km+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790714468; x=1791319268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwQ1SxgN+pXJaELo7dyIAhb9rYmD56HQJqLQ/gzjhs8=;
        b=ltVmJHOpUCD3OETHnj5nkWmaRqjebyKsQAB9bO3PtjLF8KC7BCvQ90HTgtnAmcRbDb
         QkJ7YgyQHnk/PoU3HUpspe4dSQVMeJB6KEVUAsZ4GVPzb/+eUutwxh78FdeBKm2sC10/
         njENfaPe3N6BpEosOx/T/zK5kKlF8GMJEiFJTBOckp/TrrmCYqMcX1saGMRVXyYWvOBC
         bQRxtBLVUkQ/kvkrFwDkYdgEmIIkI0bGPFDQXpjRamTwAbGM3opmfWuQBD5lbBllMA65
         274STjD9eL56Qav/JhSQgKeJRpqoAP2oVWgVe74X9h4YzWAzU/izgLlZ9hNI9HUc3BOZ
         aFHQ==
X-Gm-Message-State: AFuF++nvtcG7F+qcEuuFY/kEBjxVL4w7LPIPNVtkglJM4breiMvLyxQW
	wEGi9Ay6GLrKmuyasFv4ZBnjmmEd/LqqL38UDgxKxfvtKOSdVBLzRSBl
X-Gm-Gg: AYBFou2ddauzM8ISiMBSFMZSvX8sHhhXc02lxDPOcXuapx7hSSF/L2O8oEaxkJZ5d9Z
	qPKzixWCgh3pZ1yjq9mutEZMcaJkXNWWWd2+Nvl+5boIdzHBqpux5Sj3jWjtrwJFz3pcXpBYR1j
	CJEz9VwW/7R6BaKQoRXFlKO5NXJYMzAl+kgJ5azpNI1gjDjAL3OoBecji0xENj+2C2SJkMtaUTA
	MvaTl6kF0O79OtaK7OJSw/apHYKXBKizVUQDFAYro2aKdp3s5WQQz4VkjqWl/I+DFZa93OwTUh4
	wZ6A3+UtXRIgmY/EvQz+JohzN6Axg+WJ/T8GsaJesq+829Ja1/V6qkJ87c3jPjqAoG0HwaY2vVS
	q6W+QHTybiKMxMUv8AWTcqPqtpLegSxwwhsq++3ou7JsDbushD0gYE2aXYZX+i6o+9FMcc22Vv/
	SI3sBZsXtk48dgnVXFizOQoysbsm/6TxPlVjZacpeacuWd8hJlCBRg2g4OFdY6Jj6N+bi2Orn76
	+c2p72BmLjC2bmZNbHfMvb3EqK9j5BDMUc6NMKxCBhCbaFrN2kKSnudgfSHp3psCt45QLX7
X-Received: by 2002:a05:693c:4092:b0:33c:e82:70c7 with SMTP id 5a478bee46e88-34c63bfd154mr573060eec.30.1790714468139;
        Tue, 29 Sep 2026 13:41:08 -0700 (PDT)
Received: from localhost.localdomain (c-73-241-100-55.hsd1.ca.comcast.net. [73.241.100.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38beb048sm1364712eec.24.2026.09.29.13.41.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 13:41:07 -0700 (PDT)
From: Stanley Shen <stanleyshen1886@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] fs/ntfs3: fix out-of-bounds read in the index root ops of do_action()
Date: Tue, 29 Sep 2026 13:41:06 -0700
Message-ID: <20260929204106.41921-1-stanleyshen1886@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The five index root redo handlers in do_action() (AddIndexEntryRoot,
DeleteIndexEntryRoot, SetIndexEntryVcnRoot, UpdateFileNameRoot and
UpdateRecordDataRoot) read the index root before anything has validated
the offset the attribute was derived from:

	root = resident_data(attr);
	hdr = &root->ihdr;
	used = le32_to_cpu(hdr->used);

	if (!check_if_index_root(rec, lrh) ||
	    !check_if_root_index(attr, hdr, lrh)) {

attr is Add2Ptr(rec, le16_to_cpu(lrh->record_off)) and rec is the
record_size-sized buffer allocated in mi_init(), while record_off comes
verbatim from the on-disk log record header. check_if_index_root() is
what bounds it, by walking the attribute chain from rec->attr_off (which
check_file_record() has already validated) and accepting record_off only
when it is the offset of an ATTR_ROOT of that chain. Until it has run,
both the attr->res.data_off read inside resident_data() and the hdr->used
read that follows can land outside the allocation; record_off and
data_off are both __le16, so a crafted log record can push the access
almost 128K past a 1K or 4K record.

Once check_if_index_root() has passed, check_attr() has already bounded
the attribute and its resident data inside the record, so run it first in
all five handlers. check_if_root_index() needs hdr and stays put.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Assisted-by: LLM
Signed-off-by: Stanley Shen <stanleyshen1886@gmail.com>
---
 fs/ntfs3/fslog.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23..c7c2b477643 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3471,12 +3471,19 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 	case AddIndexEntryRoot:
 		e = (struct NTFS_DE *)data;
 		esize = le16_to_cpu(e->size);
+
+		/*
+		 * check_if_index_root() is what validates lrh->record_off, so
+		 * it has to run before attr is dereferenced.
+		 */
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 		used = le32_to_cpu(hdr->used);
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh) ||
+		if (!check_if_root_index(attr, hdr, lrh) ||
 		    Add2Ptr(data, esize) > Add2Ptr(lrh, rec_len) ||
 		    esize > le32_to_cpu(rec->total) - le32_to_cpu(rec->used)) {
 			goto dirty_vol;
@@ -3498,14 +3505,15 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		break;
 
 	case DeleteIndexEntryRoot:
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 		used = le32_to_cpu(hdr->used);
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh)) {
+		if (!check_if_root_index(attr, hdr, lrh))
 			goto dirty_vol;
-		}
 
 		e1 = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		esize = le16_to_cpu(e1->size);
@@ -3526,13 +3534,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		break;
 
 	case SetIndexEntryVcnRoot:
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh)) {
+		if (!check_if_root_index(attr, hdr, lrh))
 			goto dirty_vol;
-		}
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 
@@ -3541,13 +3550,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		break;
 
 	case UpdateFileNameRoot:
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh)) {
+		if (!check_if_root_index(attr, hdr, lrh))
 			goto dirty_vol;
-		}
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
@@ -3556,13 +3566,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		break;
 
 	case UpdateRecordDataRoot:
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh)) {
+		if (!check_if_root_index(attr, hdr, lrh))
 			goto dirty_vol;
-		}
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 
-- 
2.50.1 (Apple Git-155)

