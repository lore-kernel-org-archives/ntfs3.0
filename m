Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E562DFA3A
	for <ntfs3@lists.linux.dev>; Fri, 17 Apr 2026 22:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466649; cv=none; b=Mh7dNRvmQ6ONY/MOBn6vuowzIG9retJsgOoRVOPoXL+42MEg89Ya8jYhYXXwVd1nvGAmiV1/OPB21+x2Txu00MkbZ7Ts9qZoWu0Zwab8u+sQs1ES1YdmWgrw202YVbZ0lqo2zG7VYo4czT7ss1IK0o+mpuDz43b8H0hYHUr1r4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466649; c=relaxed/simple;
	bh=sPqyP5bAWRLVQUQ1xHjl8LHnserzJPjwHB0RoAyAe1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NKMId4OGWJ3xZ1KUGgsBBQwQjMvoRPgMlxZ0AQwk3W/cs5oxYtb0MHBcbxpMhMrADqkrQoNWu8LORQTroKPlOygnRHUFDm754lbeHEQg5hC2Trh4RdoRvNs6WKixLvOMbadjHZM61KIhXFwDUZN2a26l4FXXyxyeN4hYSsrfcGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuU2L8F3; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuU2L8F3"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8acae26e564so12832916d6.2
        for <ntfs3@lists.linux.dev>; Fri, 17 Apr 2026 15:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776466646; x=1777071446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8lfDYWV8wgoMG9u/N/hKMSAzR1cznOubbXPV8IlRC8=;
        b=LuU2L8F3vDl7/NKKIRC0Puez9z/4C/yUUD9GWmy33vEJW0BiVx0XwNyp6AFuntzqOq
         U/GCOuc/R9GIZTZsxEj8E1QpcYOKBxmhLCFvmRl/Xku+xavuxkpeqUKAbSjcPrpxLney
         G3DHuKswZFTUA7ihptm5jJMwpU6Ks4ikou0+cMfX5d7boExP2y0FNV4bYF77ho0mka8Y
         pivjwbbk3wHw06iy53NlfTh0CjNWl0fnRUYTGHQaD2SRVrWrppMjdPbXYHnh2qOxXpPS
         0rSRTqzmKShTVb6gbluEDyEAGOEFELouY6c2bxZ1JPwbMTH13Gp9G3/Sw5xeaN0bU4so
         q3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776466646; x=1777071446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8lfDYWV8wgoMG9u/N/hKMSAzR1cznOubbXPV8IlRC8=;
        b=ZsnQ0pK1A0P4w4eZyOJRO7Lg0oNq1e6lUHd6LGRF0HaX4T0VK62NNBjH7tbJDg7Jrx
         sLpEB5RWgTJXQkJ8MHZp3ldC/RKtR8455rjLEc3M6TEaDcdfs5SW33MITKhgByYemZRb
         m33xZ3TIjbo9U4uQZuiHjI50gdYs4inLpbqULQGJmwdCSifx+ShGhHQv5835mflTSfeS
         0VhwQ7YiSpeM3sJ4pI+7JN4lFdXh7thoCehk4LHpW42d8stKrKfPj0/je2EvO3aJdjAl
         023ySxI77PRjzOKw4gqqWeASBgbJbUQcuQBQLLYYboXiHQYYFxPA/qcFoqEr0eajHdXj
         M+JA==
X-Gm-Message-State: AOJu0YyOSSv+6Ur48E7wmkI/AXRIwnFq/SHeIYFtPNN3R7sY9upRnSrg
	mOlaYezJYYblLytHf3QGJV3CsI7iJOUR7P7Nzua74xtdVIvwUzGHoEYh
X-Gm-Gg: AeBDieudVQeAIqTv/g3E4HFiE1zmB+bjRD5rP8SW3sBMH+20OtDPXEl3E+M0qF16Ns0
	p+m8V6lcUaJ3rcvdsoAUUU5kHifH3pqGeOqAvuVrweRjr3x7TcPFEBNu/RYfVIFB6DnHJo+Kzx6
	27yvRQF1420HyMhtu23xMSZTi+aMk1pcM8wCjkL0sFt1L5ZpQ+/sNaKlJTQ/DphD6A54MEw0NL9
	nxzJyiAznPmLQsEQTQ9g0RF0RDMgvsKQI2X6CT479eQ5gYgy116Ww7qRDPTJ9HH/Fgyhd/+7dU/
	oZDiQ8O8sm2q7CepLPzddO7PvAODx/HRSN6WE5dutH5pBYk7nNlF5JhT8LeYdMWKhd3OUJXwFK3
	3qDXL0a1vyA1GgfQHF+PT82JDLVrb6qTDuXebzoEjj+zgJ3/znQNcn+6MH0IeslhGPstO4E2XT9
	5Y5qwXUcpy0aWNtCXYrwoRjB7xYvqy9UEgZQ9/RCFjqpzlBlcXWPK4lP1smdxjRCv7pzhJK5gte
	VEIGdr4t/URm+tKCOWc2Cx216ZnS2H/GZMqwfRciYzqyYsspyvJRuQJQYLaWnLZ
X-Received: by 2002:a05:6214:4019:b0:89c:da2b:4903 with SMTP id 6a1803df08f44-8b02822c9cfmr76690446d6.46.1776466645910;
        Fri, 17 Apr 2026 15:57:25 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5c4b9sm28948896d6.28.2026.04.17.15.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:57:25 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ntfs3: validate split-point offset in indx_insert_into_buffer
Date: Fri, 17 Apr 2026 18:57:12 -0400
Message-ID: <20260417225712.1736320-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

indx_insert_into_buffer() computes

    used = used1 - to_copy - sp_size;
    memmove(de_t, Add2Ptr(sp, sp_size), used - le32_to_cpu(hdr1->de_off));

where sp and sp_size come from hdr_find_split().  hdr_find_split()
walks entries by le16_to_cpu(e->size) without validating that each
step stays within hdr->used or that the size field is at least
sizeof(struct NTFS_DE).  index_hdr_check(), the on-load gatekeeper,
only validates header-level fields (used, total, de_off) and does
not walk per-entry sizes.

A crafted NTFS image whose leaf INDEX_HDR reports used == total but
contains one interior NTFS_DE with size = 0xFFF0 therefore passes
validation, descends to indx_insert_into_buffer() through the
ntfs_create() -> indx_insert_entry() path, and makes hdr_find_split()
return an sp whose sp_size (0xFFF0) greatly exceeds the remaining
bytes in the buffer.  The u32 subtraction underflows and the memmove
count becomes a near-4-GiB value, producing an out-of-bounds kernel
write that corrupts adjacent allocations and panics the kernel.

Reproduced on 7.0.0-rc7 with UML + KASAN via a crafted image and a
single 'touch' inside the mounted directory; crash site resolves to
fs/ntfs3/index.c at the memmove.  Trigger requires only local mount
of an attacker-supplied filesystem image (USB, loopback, or removable
media auto-mount).

Reject the split whenever the chosen sp plus its declared size
already extends past hdr1->used.  This is the minimal fix; it
preserves the existing hdr_find_split() contract and relies on the
same out: cleanup path as the pre-existing error returns.

A prior OOB read in the very same indx_insert_into_buffer() memmove
was fixed in commit b8c44949044e ("fs/ntfs3: Fix OOB read in
indx_insert_into_buffer") by tightening hdr_find_e(), but that fix
does not cover the split-point size field path addressed here: sp is
returned by hdr_find_split(), not hdr_find_e(), and the underflow is
driven by sp->size rather than hdr->used exceeding hdr->total.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Reported-by: Michael Bommarito <michael.bommarito@gmail.com>
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-7
---

 - FYI, I have a larger refactor variant that migrates
   hdr_find_split() to the validated hdr_next_de() helper and closes
   the whole per-entry size-read class for that walker.  Happy to
   send it as v2 if you prefer the wider change; otherwise this
   minimal guard is scoped to the actual memmove underflow site and
   is easier to backport.

 fs/ntfs3/index.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 2c43e7c27861..24add048b4b5 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1844,6 +1844,20 @@ indx_insert_into_buffer(struct ntfs_index *indx, struct ntfs_inode *ni,
 	memcpy(up_e, sp, sp_size);
 
 	used1 = le32_to_cpu(hdr1->used);
+
+	/*
+	 * hdr_find_split does not validate per-entry sizes, so a crafted
+	 * NTFS_DE whose le16 size field is out of range can place sp such
+	 * that (PtrOffset(hdr1, sp) + sp_size) exceeds used1. Without this
+	 * guard the u32 'used = used1 - to_copy - sp_size' underflows and
+	 * the subsequent memmove count becomes a near-4-GiB value,
+	 * triggering an out-of-bounds kernel write.
+	 */
+	if (PtrOffset(hdr1, sp) + sp_size > used1) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	hdr1_saved = kmemdup(hdr1, used1, GFP_NOFS);
 	if (!hdr1_saved) {
 		err = -ENOMEM;
-- 
2.53.0

