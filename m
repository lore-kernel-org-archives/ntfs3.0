Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4907C44685D
	for <ntfs3@lists.linux.dev>; Mon, 31 Aug 2026 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186250; cv=none; b=nkVZ4wa3Fbxdr9Do6TjicvjmU86n3zdmpJEzlyG4f3Ic79iAzOKt9ldlcgi+3TGvtCnh8D+roEVYbamUwjfvt4inqYkTcAAbWeuwZjPtSwacvkHFYaeouEWh0KL+S+gJOgQoZEupa0EMe8B/K8vWLMS4sOAhuXOBQ2exAeTraLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186250; c=relaxed/simple;
	bh=O2SVbTHvj0WJUPLNYYsmSk7cCIYmPbczbK+T8dhHd0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UAKLsiWGIXj6h9fZLdb/NjWALmR588ylYOad0mEjNpV45/amQedcW51Jo89vs/MxPYsHxFK2zLqL9s1vWAMo/+bPwXxFchr7IsTcU4sXLuFPUTEEsykDfhsu41rpfN8+2mQ34oxouW8aeiACiRTZkUGjyB5pHDoKqHA3FD+8oPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBb2f+X5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBb2f+X5"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so3680908e87.0
        for <ntfs3@lists.linux.dev>; Mon, 31 Aug 2026 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186247; x=1788791047; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUygTJjgNQhdqNUISUim/L+lF4+6MskNxbn6GUClEFw=;
        b=rBb2f+X5FNKwTFViFFOXNgIjhMZ54pduSYI3l6sVsPVg+Oi+fd4IhIlViqoMkrtENh
         6CIRPiyI7Torj4HeRi7B/7erSfS6xa9DknddDzpoVKr9HWL6HCrQM1dquQ/QuiWSt3VZ
         rLIaDo2zKevs2+oC9Pt/oPjIhUrY0pp8G4JCqQml0p0gJSefSujAEP9GCT5SKf/yb9L3
         U8TlVkgNpOiQ+xyVnZLVm+43XWbf5jjLXeP5vn+oeDYuO6pYxZdzji6OW+A1SoZ4TOZu
         0kjDvFXUQOu4mcAvyyD30bI5EJwdyBa3VX+iHRGAoEVjH/RDnOwLxbGgDsYJDNaz7JTL
         nIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186247; x=1788791047;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUygTJjgNQhdqNUISUim/L+lF4+6MskNxbn6GUClEFw=;
        b=UammbCvoVsD4fK8oEt4HFv8z9HtG+d4Mai5OtatxUnxw9FNPeiKWkm/b+O/FdzkdgO
         6sKsYc/RPr72C2VjO+iGuEKpPwMcMurk0bOEHVVvwRBwlOjtHY4K4nSezyqvQ1765ETX
         fDHkvw5wBMC2WI6SRnbCk/hQr7ZcDtrUrvPfTC1SIhrd4iuYsg+AY8jeq+ljIJksGoZ3
         dGNi74owTOSkMKVYaQ9uCl1WgHy4T86hc8sFzaC73IvL1xd5MPVx3scvvURDP3JU3yZ9
         hP/enDs4C2enKJglhyt6sF0OwHq5GEzCS7R2hM3C97GgqbZAd84irKxXxbNpf2fwPTDM
         +qAw==
X-Forwarded-Encrypted: i=1; AKwUvBykcwzFOibj5abNa6jQfSeXmsfvcbaAllOCmViShF/vkHGHfx0wXlV0I4FQBa3IScjJxyq0BQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lzznnQk3mv8hRMLzrUtXFhYiJ4xPxzSOOJe/SyXwKTSZVPjwhY
	idpOYZc7lBv3XkMEu5BqX6Z4aLOOEgqo5G+FuO/pBmktNyyCYgz+RF5j
X-Gm-Gg: AYBFou3Zje3oOLEzRpmc6UX8fH/RljaODl8OceCzChYCQ9towsR6LNvPr6kzkO6jEQH
	lyWkoF4ukWs3t6rgblgM3e+r1Osv5HxBw5kBcZpKy7FD7xJ8OCqDeL8QS2ySYgjdk1sUxk8NXpD
	7zSod4iahzqb2humaaLy3MseqcATFsP2A+IjhGWMNHi/vNEoGUhqAnGlLQiOjr9W6tG9nmWWqrj
	nAyvouVM+Sr4EHrMSrsMJDQlGw96f22tvGpkz+ER5crkmp9tz5WVIwEOVMd6wjAr9rPDyhlH6qc
	bdrQj7gvy/NXnpSOYNVNXuRzYUWMrWjvzsK3ho1XV/jBSMJ/Pyv/GS1HDR29cJz6ISHGYkrVuTm
	x2gfO2/od4U56asap0zYLKr0Ld12MvwUQC+4c3qniREI7lFdYU8jU6YzT1itDWxtMqfnjCTYVNd
	1OgBGPcp9cj4glE1lEmtHi3vtgfa/LWs8bOzxHhArHQTW9d8meprfAGquZvoe41QkmOA==
X-Received: by 2002:a05:6512:4605:b0:5b2:a6e6:8d83 with SMTP id 2adb3069b0e04-5b5e6b07d24mr8649241e87.23.1788186246778;
        Mon, 31 Aug 2026 07:24:06 -0700 (PDT)
Received: from kali ([37.114.129.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5c8fsm2292919e87.9.2026.08.31.07.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:24:06 -0700 (PDT)
From: Tabriz Hasanli <cybersec467@gmail.com>
To: linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	w@1wt.eu,
	Tabriz Hasanli <cybersec467@gmail.com>
Subject: [PATCH 1/1] fs/ntfs3: validate target index entry in check_if_alloc_index/check_if_root_index
Date: Mon, 31 Aug 2026 10:23:44 -0400
Message-ID: <20260831142344.472594-2-cybersec467@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831142344.472594-1-cybersec467@gmail.com>
References: <20260831142344.472594-1-cybersec467@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

check_if_alloc_index() and check_if_root_index() walk the index entry
chain to verify that lrh->attr_off lands on a valid entry boundary.
However they have two gaps:

(a) They do not stop at de_is_last() — they walk past the last real
    entry into the trailing gap between the last entry's end and
    hdr->used, which check_index_header() leaves unvalidated.

(b) They do not validate the TARGET entry at attr_off — the walk exits
    as soon as o == attr_off without checking the entry's size, flags,
    or bounds.

This allows attr_off to point to an attacker-controlled "fake entry"
in the trailing gap of a crafted NTFS image's $LogFile.  Four do_action()
cases then use the unvalidated entry:

  SetIndexEntryVcnAllocation / SetIndexEntryVcnRoot:
    de_set_vbn_le() writes 8 bytes at e + e->size - 8.
    Crafted e->size yields an 8-byte OOB write up to ~64KB past the
    buffer.

  UpdateFileNameAllocation / UpdateFileNameRoot:
    memmove() writes 56 bytes at a fixed offset from e.  If e is near
    the buffer end, this overflows by up to 0x50 bytes.

The sibling DeleteIndexEntryAllocation case (commit fc4626bb3656) and
UpdateRecordData cases (commit 3e127829e57f) already carry per-site
guards for the same class of attack; this patch closes the gap at the
validator level so all current and future callers are protected.

Fix both functions to:
  - stop walking at de_is_last()
  - validate the target entry: size is 8-byte aligned, >= minimum
    entry size, and does not extend past hdr->used

Found by static source analysis and confirmed with userspace ASan
harnesses transcribing the kernel's exact validation logic on a
512-byte INDEX_BUFFER with faithful check_index_buffer() geometry.

Signed-off-by: Tabriz Hasanli <cybersec467@gmail.com>
---
 fs/ntfs3/fslog.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c..d73e3ff1e 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2953,10 +2953,13 @@ static inline bool check_if_root_index(const struct ATTRIB *attr,
 	u32 o = PtrOffset(attr, hdr) + de_off;
 	const struct NTFS_DE *e = Add2Ptr(hdr, de_off);
 	u32 asize = le32_to_cpu(attr->size);
+	u32 used = le32_to_cpu(hdr->used);
+	bool has_subnode = hdr_has_subnode(hdr);
+	u32 min_de = has_subnode ? sizeof(struct NTFS_DE) + sizeof(u64)
+				: sizeof(struct NTFS_DE);
+	u16 esize;
 
 	while (o < ao) {
-		u16 esize;
-
 		if (o >= asize)
 			break;
 
@@ -2964,11 +2967,24 @@ static inline bool check_if_root_index(const struct ATTRIB *attr,
 		if (!esize)
 			break;
 
+		if (de_is_last(e))
+			break;
+
 		o += esize;
+		de_off += esize;
 		e = Add2Ptr(e, esize);
 	}
 
-	return o == ao;
+	if (o != ao)
+		return false;
+
+	/* Validate the target entry itself. */
+	esize = le16_to_cpu(e->size);
+	if (!IS_ALIGNED(esize, 8) || esize < min_de ||
+	    size_add(de_off, esize) > used)
+		return false;
+
+	return true;
 }
 
 static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
@@ -2978,10 +2994,12 @@ static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
 	u32 o = offsetof(struct INDEX_BUFFER, ihdr) + de_off;
 	const struct NTFS_DE *e = Add2Ptr(hdr, de_off);
 	u32 used = le32_to_cpu(hdr->used);
+	bool has_subnode = hdr_has_subnode(hdr);
+	u32 min_de = has_subnode ? sizeof(struct NTFS_DE) + sizeof(u64)
+				: sizeof(struct NTFS_DE);
+	u16 esize;
 
 	while (o < attr_off) {
-		u16 esize;
-
 		if (de_off >= used)
 			break;
 
@@ -2989,12 +3007,24 @@ static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
 		if (!esize)
 			break;
 
+		if (de_is_last(e))
+			break;
+
 		o += esize;
 		de_off += esize;
 		e = Add2Ptr(e, esize);
 	}
 
-	return o == attr_off;
+	if (o != attr_off)
+		return false;
+
+	/* Validate the target entry itself. */
+	esize = le16_to_cpu(e->size);
+	if (!IS_ALIGNED(esize, 8) || esize < min_de ||
+	    size_add(de_off, esize) > used)
+		return false;
+
+	return true;
 }
 
 static inline void change_attr_size(struct MFT_REC *rec, struct ATTRIB *attr,
-- 
2.53.0

