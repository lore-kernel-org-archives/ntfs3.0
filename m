Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9FA3859CE
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018554; cv=none; b=kDzo2wFjV2OZLIZ5OHpnSjkHsf510+WbummPnuafpUbWdk/XxiRMMFxRIZvfJLikxvh72yfqpKjak8nIuhRY6sKcFNqwlYyc1i74Ddz0z8G/KORaNzwcmz7bYgbdX/z+oUrWoBYqaQkEhQu2TUV9cLIsBaRI8oHQS7BkvV+d2EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018554; c=relaxed/simple;
	bh=DK9/H7hX+pru8m1l06zVYRmh9mh18UWQ0oNg5FaI1GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oz6kYaOwtb44nbNsxS1fGcgEwV2qOdbMX6u8e3lr+aGmfwtERDiWO+6IUg2a+2j20QUtYkoCNNoH0jtqb1QSpAX0YWtmIYpsVAu0T63H7Y6anadysRBUm+A9XpYXtiCa/Kr5ZhpUjpLLa+df/jktZiOyF0Flo55XNquz0648Hl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=k4SfFqJ8; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="k4SfFqJ8"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so266933366b.2
        for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790018547; x=1790623347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL+2RvScf1wUse1sj5lMjJEzeH15N+fw/R86yhvN+Co=;
        b=k4SfFqJ81T9QVDvnD6x9uwsjE4ZsBmfizR199bbVk3OZvu/U4HvTLfel5hHGK304x2
         bIXe8dRWeHz46/H0nx+P5KwNZ+fAaChWMUEz5pOARVub5+M15otTVvi4GG1AcHehFVlE
         56aL5HnegcCXCflDEfbLhCtEnqw0Hcl0X7/azwBWA5K1efQxJ1wL2ApIkkvztbuV2Wot
         CoJdg4kP8wUJgZe9tzihSMw+1h71Giim8XxrLMZ8M5CW7QpMXbTGFWCr/w7ZzWGRJZ9n
         /xPmb2j1B/kVzaCzePB2Q/wSJxN9X6YtIV0uY4z34HMJh8cu+AHRmY7cVdHBRMDRnsHs
         FACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018547; x=1790623347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HL+2RvScf1wUse1sj5lMjJEzeH15N+fw/R86yhvN+Co=;
        b=W9w4OOSEtImWggO7+9IT6KZI3hxR3X9rPlefdMADZEsSO/InU/BEeHZFnJYun+jSR1
         HdjYtDUegAsNCvgNPao5whpzWVhKBgS/ESwk2LhJr6cRwgf3NfCzMUWQSKHDX1jC29Rr
         02GxdzjrfriXQ9qUK7fNNShcxEQKQxFKd8krik/nU/3W/M+W3/zoDDNTqISTwcxTSKzb
         05Ag4Onu+iV1GaEUygWvl+dA0OrFDnPSRIPkrFTbUe/Arms1wPsk5hy9cZY4mhJjNNWU
         uGtgSJ9a1C7iJLcLJ10sj/8U42w1NVqM+bokyd92MokcvQ0oX8x2tYeh4kk2+p1PBz1J
         74yg==
X-Gm-Message-State: AFuF++nB77ooF02kR1JtTtG9epO9gR+W3x1ECSIArxWL5NBaAFAGY2VM
	etCDrg8nRAbSg95xFcZRkbcwDF1pbeP+YM3Hz7JNcaiVOeCKmyr4E1xfXuqh1Ul6cyZH
X-Gm-Gg: AYBFou1M9NTbL4XkQUZHwVSjrJvWcEmeSVC5meSHdxlyfMEEL3s/3fS2hl9Y6KgohQd
	KZ4wIrGq6ndH6UK9FM1+Dyz8x3aos0/RU0xrsToRnmvqx7Yk08vr24h1pucn1lQ7YJSVVamCvZS
	xeRibKOjvxcgVokayhf0spS3yLRBxN2lRNNLEhp1E3htW2P3We/a+N5JvBzJDsCcOWkC1/gUat/
	fJq3mUc6QzD+4Ux4EdQ6PoLOUPwHweXR3zRciku+SxT3aoC0tf0iKxXxKyhFQ14oX/HyeaiV0jI
	KtXB/4sPXFu9oMXgYoicWH6oCDlD7vVLRpwP2mPYQyhQplSyzBLpkrahnWP7QAAg/CRQUR97xoj
	pAIle/fH3o+8d1i33mOkE5DSKEpbawlQnPrIAo2fXBDy4PQ/yu0IpXN+fHcb1q2b/4epvCqv929
	EXeGlnLBGuKaMauLGtYTGMM2B4yr8kbPzADYkr
X-Received: by 2002:a17:906:99c4:b0:c29:f5d8:9c82 with SMTP id a640c23a62f3a-c2a15ad760bmr961056466b.49.1790018547221;
        Mon, 21 Sep 2026 12:22:27 -0700 (PDT)
Received: from cachyos ([151.38.78.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm341089066b.47.2026.09.21.12.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:22:26 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cenzhang@linux.microsoft.com
Subject: [PATCH 3/4] fs/ntfs3: validate on-disk restart tables before use
Date: Mon, 21 Sep 2026 21:21:38 +0200
Message-ID: <20260921192157.102738-4-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921192157.102738-1-giulia@bynar.io>
References: <20260921192157.102738-1-giulia@bynar.io>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

log_replay() locates restart-table dumps using redo_off and passes the
remaining record length to check_rstbl(). However, check_log_rec() does
not ensure that redo_off leaves room for a complete RESTART_TABLE
header. check_rstbl() reads the header fields before validating the
table size, so a truncated dump or an offset beyond the record can
cause an out-of-bounds read.

Before passing an on-disk restart table to check_rstbl(), require
redo_off to leave enough bytes in the log record for a complete
RESTART_TABLE header. Apply this to the transaction, dirty-page and
open-attribute table dumps.

For the open-attribute table, also require the table entry size to be
at least as large as the expected entry size for the restart-area
version. This ensures that each slot is large enough for the entry
format used when converting and initializing the table.

check_rstbl() also accepts transaction tables whose entry size differs
from sizeof(struct TRANSACTION_ENTRY). check_log_rec() aligns transact_id
to that structure size, not the on-disk entry size. Accessing smaller
entries can read or write past their end. Larger entries can make an
accepted offset point into the middle of a slot and leave too little
space for the transaction fields. Require the entry size to equal
sizeof(struct TRANSACTION_ENTRY) when loading the table. This also
protects accesses to existing transaction entries, which bypass
alloc_rsttbl_from_idx().

This is reachable by mounting the crafted image on an x86-64 KASAN
kernel before this fix:

KASAN: slab-out-of-bounds in log_replay+0x8094/0xe690
    Write of size 8 at addr ffff888101107680 by task mount/67
Call Trace:
 log_replay+0x8094/0xe690
 ntfs_loadlog_and_replay+0x3e0/0x500
 ntfs_fill_super+0x1fd3/0x4510
 ...

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 8dd233ec7d2f..e3b5a19f0e30 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4274,12 +4274,17 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	t16 = le16_to_cpu(lrh->redo_off);
+	if (t16 > rec_len || rec_len - t16 < sizeof(*rt)) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	rt = Add2Ptr(lrh, t16);
 	t32 = rec_len - t16;
 
 	/* Now check that this is a valid restart table. */
-	if (!check_rstbl(rt, t32)) {
+	if (le16_to_cpu(rt->size) != sizeof(struct TRANSACTION_ENTRY) ||
+	    !check_rstbl(rt, t32)) {
 		err = -EINVAL;
 		goto out;
 	}
@@ -4314,6 +4319,10 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	t16 = le16_to_cpu(lrh->redo_off);
+	if (t16 > rec_len || rec_len - t16 < sizeof(*rt)) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	rt = Add2Ptr(lrh, t16);
 	t32 = rec_len - t16;
@@ -4441,11 +4450,16 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	t16 = le16_to_cpu(lrh->redo_off);
+	if (t16 > rec_len || rec_len - t16 < sizeof(*rt)) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	rt = Add2Ptr(lrh, t16);
 	oatbl_bytes = rec_len - t16;
 
-	if (!check_rstbl(rt, oatbl_bytes)) {
+	if (le16_to_cpu(rt->size) < bytes_per_attr_entry ||
+	    !check_rstbl(rt, oatbl_bytes)) {
 		err = -EINVAL;
 		goto out;
 	}
-- 
2.55.0
