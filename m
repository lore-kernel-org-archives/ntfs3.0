Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C8383304
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 19:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018553; cv=none; b=nUQ9luu1BROjQ7jmoPfvbBzMEUkdsBmYDURLIDHx2F1E3FBXKYlrXDl5gglhyosaJ8EYgOGKfzZYA3DK28wLTBMf5c//282w75xP5BoIx6+E4meC+8kMdIQNPyB+W75mpP8d8Etz5LywjbXrPy8ewAgucBuh2uSvuufy94/8/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018553; c=relaxed/simple;
	bh=NgErlbLUKaTbV82GyCOv0H7r7vbemZOfW2qhNTDcQU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNB3GPm/XJFZsTa8tLRKVVBNk+8kyalUlqFIqEP24GB2wrlSeReayhLkKC380kmWa53pJWCAGaTq2g+MZi2BkrMpkjpIUKZ8uBx0Nxcc5fH9kY+PAvnBq/GTaMnGAgqRwlF07R9nyGmo597WBHYtlq1iXNT3Jo7Gn448XeZNNsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=fctKBg/i; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="fctKBg/i"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so414154866b.3
        for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 12:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790018544; x=1790623344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znjZZmXp9qS1UAlr/gd4YJ/jtvWf7HtdoU4GR7qfmoY=;
        b=fctKBg/ikDNNSwxCXAKP2jHoUp6LhT3Abnc/2wtz0cUdPQ5All48kS9fZOFtirLmSQ
         KzGJc6RsY0PEpeXpx7Ji3NyzxMA6S1B/4Uar9X7N+7EcxM31yD5uxfMrBwZgRmVCQ+7O
         ubhPIv26dIRgGaV/9sItXJMtKvZ+F7SFcGnVQtQ9eSNUHcCjGQufO62+1ujnGIxZQIdM
         b//dtpsrVXWtjfTRnjWvY6yib+/iHwY/ISkDzRFBapAyx0WnjmwIFY9QkSn053q8jlOB
         GBgsqsLYgX0sNYlMa4b1vxmZ7oP0K+EcXKXiwEt8u457xt07rHJtOngnYat9P0ucApsg
         H5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018544; x=1790623344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=znjZZmXp9qS1UAlr/gd4YJ/jtvWf7HtdoU4GR7qfmoY=;
        b=mHeuBlxpz5rGAEoLZ9CKmciZh/rG5agRnIip1nyPSfBN6vOR4QfbnXw84zyvivDdYB
         i51ODIq7YkKAqI7/REeFazIb/+hS6yEG0LbYkrWOWx1R7bfuo5Oe8pE7aehOcMfn0jWK
         x3OPTwc86vnS+0lJwq0gxsYmaNKxiqpFSpXqTyzSRLNO0iy9QIODK3degOSAKH4UCsRG
         wzWwk10YP9b3vl7f7ANv13TZsUaENcG9r8EjDfdbBEVD6DpK3f+HmpKcW5Bwy8aWxeA5
         5F9HizxKpIZ/2RJW6YInXXGGnbs13CIClmW2q116YNMzdeHx6g5zkfRN2glFaSp1c90N
         0boA==
X-Gm-Message-State: AFuF++n9rKRl+HkqAyMDUL59N1O4ncFw73Ez8Fq1J2ft4PVtiDtfVXEo
	JLZ/WAPCO3P318SJFZtj9SQ+gEcopnNohHW5uf5oJKUtlWMkenFw3p2IGlhZg02skuFF
X-Gm-Gg: AYBFou0XF5da/sPXWfFFkMnKABNaV0N5vLLruDhdJ4mRi+B8gSd/e1vqjvzVl7fFVBG
	oXd739w8ji4b6EFCMybVEwlQHbXNI8FTASd5gDAWWVKcEjdF3YuWeHyVSTfH5mRP17fDXlZGzyP
	SIOdHDKTFmedLEpueS7qY+CiiwO/2Tq007R0LT2/uSuAhWqGm5ori/Px02RVt0KRLCvr8mvEcvx
	A3LhgFJRkr+86Ps/gFUHPrIvQHwUmFXIvBUhL4ridZEsfo2wDpLIh7kY22PzRmyBs54ewLz6dWb
	sLHT0fX/8JVIwbQJ9Nu4EiFWi202H7U89dbdOjUIWx9rRNTATcVKbtDCPlW5bMEl6x5FY1+kIGm
	MeNL6M/eZHlAXRgsgKO89UWIe2ATDAyDUxWGQAF9IickcTcp7km81dAHS90TRTQtqQoWSuIT0mh
	mTksx/cyTMXLOFhOyY+Swi+mnr4DGEWJhGUvh1ayvCjAyKdeMq
X-Received: by 2002:a17:907:8e86:b0:c26:306f:289b with SMTP id a640c23a62f3a-c2a156d56d1mr881253966b.13.1790018544407;
        Mon, 21 Sep 2026 12:22:24 -0700 (PDT)
Received: from cachyos ([151.38.78.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm341089066b.47.2026.09.21.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:22:23 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cenzhang@linux.microsoft.com
Subject: [PATCH 2/4] fs/ntfs3: validate restart table offsets in log records
Date: Mon, 21 Sep 2026 21:21:37 +0200
Message-ID: <20260921192157.102738-3-giulia@bynar.io>
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

check_log_rec() validates transact_id and target_attr by subtracting the
24-byte restart-table header size, sizeof(struct RESTART_TABLE), and then
checking entry alignment. This is unsafe for offsets that point inside
the header. For example, offset 8 is below the header size, so the
unsigned subtraction wraps and the wrapped value can still pass the
alignment check.

The driver uses transact_id as an offset into the transaction table
when it looks up or allocates entries during journal analysis. This
happens even on read-only mounts, before replay stops for read-only
mode, so the offset must be checked at this stage too. If a forged
transact_id points into the restart-table header, analysis first reads
header bytes as tr->next. If those bytes do not look allocated, it can
then ask alloc_rsttbl_from_idx() to allocate an offset inside the
header. With crafted table metadata, that can make replay overwrite
restart-table header bytes and later treat those bytes as a
TRANSACTION_ENTRY.

The attribute-offset check is also skipped when lcns_follow is zero.
However, lcns_follow only describes page_lcns[] payload. It does not
mean target_attr is unused. OpenNonresidentAttribute can have no LCN
payload but still uses target_attr to choose or create an open-attribute
entry. Header and misaligned offsets can therefore reach the
open-attribute allocator unchecked.

For offset 8, the subtraction wraps on both 32-bit and 64-bit systems.
The wrapped value is divisible by 40, sizeof(struct TRANSACTION_ENTRY),
on both, so the transaction-ID check can accept it. The same wrapped
value is also divisible by the 40-byte v1 open-attribute entry size and,
on 64-bit systems, by 44, SIZEOF_OPENATTRIBUTEENTRY0, so the
attribute-offset check can accept it too.

For target_attr, replay can then interpret the restart table header as an
open-attribute entry. With crafted on-disk values, the interpreted entry
can contain a NULL open_attr pointer, which log_replay() later
dereferences.

This is reachable by mounting the crafted image on an x86-64 KASAN
kernel before this fix:

 KASAN: null-ptr-deref in range
        [0x0000000000000008-0x000000000000000f]
 RIP: 0010:log_replay+0xca58/0xe690
 Call Trace:
  ntfs_loadlog_and_replay+0x3e0/0x500
  ntfs_fill_super+0x1fd3/0x4510
  ...

Reject offsets that point inside the restart-table header before
subtracting the header size, so the subtraction cannot wrap. Validate
nonzero target_attr values even when lcns_follow is zero. Preserve zero
target_attr for records that require neither an attribute nor LCN work.
Do not impose a table upper bound in check_log_rec(): valid records can
require the analysis pass to grow the table.

Before OpenNonresidentAttribute grows the open attribute table or selects
an entry, validate target_attr against the actual oatbl->size as well.
Alignment to the version-specific entry size used by check_log_rec() does
not guarantee alignment to the slots used by the current table when the
on-disk table size differs. Allow aligned offsets beyond the current
table so valid records can still grow it.

Cen Zhang described the target_attr underflow in the linked patch and
proposed checks at the redo and undo lookups. Validate the offsets in
check_log_rec() itself, including transact_id and records without LCNs.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260901174934.6275-1-cenzhang@linux.microsoft.com/
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 8ac0dbd2f07f..8dd233ec7d2f 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -697,7 +697,7 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 
 	if (bytes < sizeof(struct LOG_REC_HDR))
 		return false;
-	if (!tr)
+	if (tr < sizeof(struct RESTART_TABLE))
 		return false;
 
 	if ((tr - sizeof(struct RESTART_TABLE)) %
@@ -711,7 +711,7 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 		return false;
 
 	if (lr->target_attr)
-		goto check_lcns;
+		goto check_target;
 
 	if (is_target_required(le16_to_cpu(lr->redo_op)))
 		return false;
@@ -719,12 +719,13 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 	if (is_target_required(le16_to_cpu(lr->undo_op)))
 		return false;
 
-check_lcns:
-	if (!lr->lcns_follow)
+check_target:
+	if (!lr->lcns_follow && !lr->target_attr)
 		goto check_length;
 
 	t16 = le16_to_cpu(lr->target_attr);
-	if ((t16 - sizeof(struct RESTART_TABLE)) % bytes_per_attr_entry)
+	if (t16 < sizeof(struct RESTART_TABLE) ||
+	    (t16 - sizeof(struct RESTART_TABLE)) % bytes_per_attr_entry)
 		return false;
 
 check_length:
@@ -4737,6 +4738,12 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 
 	case OpenNonresidentAttribute:
 		t16 = le16_to_cpu(lrh->target_attr);
+		if (t16 < sizeof(*oatbl) ||
+		    (t16 - sizeof(*oatbl)) % le16_to_cpu(oatbl->size)) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		if (t16 >= bytes_per_rt(oatbl)) {
 			/*
 			 * Compute how big the table needs to be.
-- 
2.55.0
