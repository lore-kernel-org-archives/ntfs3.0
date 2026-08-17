Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158A837EFFC
	for <ntfs3@lists.linux.dev>; Mon, 17 Aug 2026 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.188.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786998655; cv=none; b=KpvxngfbkWCnjO3wQeE1UquP4fMdSZgQcXBDlXaqF50W3tKQV+vXNKXRR5KjyGY7dm93iP/HF1VmXLhl2cnl3rg4d4G8T98KNoObDKbzSglzYP9xXPor+6hkcVDZNoXgXuxIW+iyYcZ/+H2hD5Jl8mBX6vwghi19y1OiLUNx5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786998655; c=relaxed/simple;
	bh=VH/yuiTyhpYn5Mi7rWcew3j11Zwcbs6RudhYrF5PCYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=POY9bdW4zzSr0baaJ0H4YMR1sRIgC+ne6hqnkFy2VaSeMSoDk3kzYJBH333x2HSAk7YuUbylvptAzO94rxrgYVJaKF7/QI/3B9IZFd0czIzvP/psM17COqQ0a+hom4kI/hoPRpewm/farp8FrA53875cvTIVUzqnN+TtCOEaB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=IXbVuEhM; arc=none smtp.client-ip=51.159.188.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="IXbVuEhM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lx3S+Urq6M5BDZmS8au3VXetBoK/wh9IuHtyskv7EuE=; b=IXbVuEhMgv8853h87wUtl9S49r
	rEEyq4ukBwS1tuCjwmIICnnKrkzy/XVDttUTrDJvwwv3jpuG57rDIwPgRz1avbbhEmCEAYIqCw3cu
	5Y8JHzOVRFCwh8lnGyw0dCmWssOU4/3LmdYstUbtz6mBEAtOgm13womJhnOeWU267YvBdYElIK+6X
	BlG+fZQPHHkQoWTDKba8VYCMMvIcUEFgheuMzepjdiKqI8dFzjIv0qDyOrVLXOCtw2daIaoOI8o8I
	nSgV+kfsENCRNCorVKW4CGV1WjLSbvbZU0y32Dhbfp8y7KSu13/oLgxAhw8cLsih6+YKyxAdh0e52
	zpT9Y9ng==;
Received: from [151.115.150.205] (port=41500 helo=gepetto..)
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <Jeremy.Jean@oss.cyber.gouv.fr>)
	id 1ww3yt-0000000CZEG-18an;
	Mon, 17 Aug 2026 22:30:50 +0200
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: [PATCH] fs/ntfs3: validate log replay bitmap buffer spans
Date: Mon, 17 Aug 2026 20:29:42 +0000
Message-ID: <20260817202941.1635505-2-Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

do_action() derives the read buffer size for bitmap replay records from
lrh->lcns_follow in u64, then stores it in u32 bytes. A log record that
covers more than U32_MAX bytes therefore allocates and reads only the
truncated tail while the bitmap range checks still compare against the
full u64 span. ntfs_bitmap_{set,clear}_le() can then access past
buffer_le.

Keep the span in u64 until the read size has been validated against the
u32 ntfs_read_run_nb() interface. Also validate bitmap ranges in u64 and
reject lengths that cannot be represented by the helpers' int len
parameter, so crafted bitmap_off/bits values cannot wrap the existing
u32 arithmetic before the bounds check.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
Assisted-by: Codex:gpt-5
---
 fs/ntfs3/fslog.c | 53 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index f038c799e7ac..21d89de96ba1 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -7,6 +7,8 @@
 
 #include <linux/blkdev.h>
 #include <linux/fs.h>
+#include <linux/limits.h>
+#include <linux/overflow.h>
 #include <linux/random.h>
 #include <linux/slab.h>
 
@@ -2967,6 +2969,35 @@ static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
 	return o == attr_off;
 }
 
+static inline bool calc_log_buffer_size(u32 min_bytes, u64 data_bytes,
+					u16 roff, bool align, u32 *bytes)
+{
+	u64 bytes64 = min_bytes ? min_bytes : data_bytes;
+
+	if (check_add_overflow(bytes64, (u64)roff, &bytes64))
+		return false;
+
+	if (align) {
+		if (check_add_overflow(bytes64, 511ULL, &bytes64))
+			return false;
+		bytes64 &= ~511ULL;
+	}
+
+	if (bytes64 > U32_MAX)
+		return false;
+
+	*bytes = bytes64;
+	return true;
+}
+
+static inline bool check_if_bitmap_range(u64 bytes, u32 off, u32 bits)
+{
+	u64 start = ((u64)off + 7) / 8;
+	u64 end = ((u64)off + bits + 7) / 8;
+
+	return bits <= S32_MAX && start <= bytes && end <= bytes;
+}
+
 static inline void change_attr_size(struct MFT_REC *rec, struct ATTRIB *attr,
 				    u32 nsize)
 {
@@ -3114,6 +3145,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 	u16 roff = le16_to_cpu(lrh->record_off);
 	u16 aoff = le16_to_cpu(lrh->attr_off);
 	u64 lco = 0;
+	u64 data_bytes = 0;
 	u64 cbo = (u64)le16_to_cpu(lrh->cluster_off) << SECTOR_SHIFT;
 	u64 tvo = le64_to_cpu(lrh->target_vcn) << sbi->cluster_bits;
 	u64 vbo = cbo + tvo;
@@ -3225,6 +3257,10 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		attr = oa->attr;
 		bytes = UpdateNonresidentValue == op ? dlen : 0;
 		lco = (u64)le16_to_cpu(lrh->lcns_follow) << sbi->cluster_bits;
+		if (lco < cbo)
+			goto dirty_vol;
+
+		data_bytes = lco - cbo;
 
 		if (attr->type == ATTR_ALLOC) {
 			t32 = le32_to_cpu(oe->bytes_per_index);
@@ -3232,12 +3268,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 				bytes = t32;
 		}
 
-		if (!bytes)
-			bytes = lco - cbo;
-
-		bytes += roff;
-		if (attr->type == ATTR_ALLOC)
-			bytes = (bytes + 511) & ~511; // align
+		if (!calc_log_buffer_size(bytes, data_bytes, roff,
+					  attr->type == ATTR_ALLOC, &bytes))
+			goto dirty_vol;
 
 		buffer_le = kmalloc(bytes, GFP_NOFS);
 		if (!buffer_le)
@@ -3717,10 +3750,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		if (!check_if_bitmap_range(data_bytes, off, bits))
 			goto dirty_vol;
-		}
 
 		ntfs_bitmap_set_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty = true;
@@ -3730,10 +3761,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		if (!check_if_bitmap_range(data_bytes, off, bits))
 			goto dirty_vol;
-		}
 
 		ntfs_bitmap_clear_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty = true;
-- 
2.47.3

