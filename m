Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE7383C95
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 19:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018548; cv=none; b=Hb0ko0dG+i/2ykOpm3jhU/43FYFAzp8wyx6Q3ev1MMJe58I0Zln9km8SR1H86L97G8d8XacevvaoEAWQ82qYVa/u/ZKOX+CtKRBMVCwvcukzOlVdAgPRhL7n+b1ROzpINb9yDaE35RH0n3Jna87NPytT8TSxMeJTy0cW2Hh/clE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018548; c=relaxed/simple;
	bh=FORjZ+fzBUQoGWjjV47sA34KGPbyAZucnZ7k2MeTYmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cuv1hGM3vazr15CiLEZYIcS6Fzhz1PeyNywyNbISXo4ePZdRU9ly34TgNIorc4Iktvz1DhE1Pr3xZaXSmGg0uheKyf2afQii4bf4bwvNuLUSW8esMpL59hcyRuPTdK1lVexVcTDR4jB7n42hTpZhXpTj+eIhbEPT8yX6ijYkcHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=KLqKOf0x; arc=none smtp.client-ip=74.125.228.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="KLqKOf0x"
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-6a98863afa4so384301a12.0
        for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 12:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790018541; x=1790623341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GF+AtI+XGFI4gbDHylpglKuu+gz0u51gNx6gyLy45VM=;
        b=KLqKOf0x3Xaj3vlFy8SDOdZ5nMmcB4/2huSi5nxiP8SWZW0GUUHL+mvKqB9Xpr6kv5
         w7kjLMeRZpeOhXhbCI7mI2Sj+XqHSfxvU4ryrPoZL11WLhvodQHvFFtZtdlnLEmQUBNu
         8nwyfn1pQVCgfVBGqkFrHtvJOrhTf5Ldn0oCxPiwJdMh3hLoE5Go4WG4oKudinU0ZGut
         CPiKGtyOKoUoUQv4W0Tp8KHPBD0AbqOIZJB/8UAZfAiSC2ZoYuju6XhlKZk92QzOEA05
         5HKI+jJfwwJWwK3+bjAeIoMe+s7A/NOSpPc7MMlc68usTPveVv2kopERgEoVe/kgj974
         Qb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018541; x=1790623341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GF+AtI+XGFI4gbDHylpglKuu+gz0u51gNx6gyLy45VM=;
        b=RLn8DPL7CILNNPuPugsGEEdT1NjNk2EepUH5nU63EY4/YHrsN4qY8iz5baoVhvCKvh
         vSQoA4k6aghwGy84m6cHj8jTa0bYFWNASKumqDnhiViatqCgDuNYB4uyB646EYqcixr3
         WeGiYMApiI4ikLrbg9sA6wdSu6HoTtGzrFk/Xe6ujKeyx/ZEmC04J94VbT1InkSNJFzK
         ZhTEpoYXnaV1Wf4cQHjSGhppVkWux1p42fSS8UEjc3h1M+TyNHpeC+Ag1H/AVRRxY8/L
         dhxzlGh/5AETtk2ylkBAl5vxM9hAEPMCJsdSw9Z2/UiGf70lg2pWuvH8z68/vqD/rB5u
         gY+g==
X-Gm-Message-State: AFuF++nhSQSYZa9VQjSO1IGUqDSe/k/bR+RCPSFfoWWZrkqAT+acv80Q
	RGaEIhbSUg8XO1BJD9Ode5U6OAoYhDs+0lXxo2fKXb2Vq1F9ESREezn4T5Kka0iZ0Aa2
X-Gm-Gg: AYBFou0gussQ2+XiSY9c6NEWZshKMS+gnAkebhsnjwzR4XNz+e3c4h/ZNw+/rZo3wo/
	oU96FWtybq21wcGPWp8XcKuFSDrUK0cPc2DDFQqnV7YBCPeFPkHZOvG28Lzjdvkln1frsATEuHq
	AsWBSkZxVhQ5Io/pcPmjYN/aQ1C3cn6ypBW30UH0NIEq8Z9oBmCJIsnZp0OoFFjG9sOyWYxBYNW
	fDtw+RC8hazzYxP7In0gT8OC4EJQK5r2I5wscdxLTWGsjWPA4UdLbWOmNQsZAc6SbWRp7C9AouB
	S8LDet07qVXfJle2+hOXeLGlyxLKE/XLYWqd6XMbrr8QS06KCVK2DSDMMzmf2FjH3ajRwnOKQTf
	no390ozuJV1IproBNJcQJTLp+qGQZBd4rl2pUxL9sOq73MHkehyihcqOz8Ek5+0ibqMkKzcbshY
	u1qduVqNyIohpyG0Y4eoQOx/CZqjlz7jAaBXqeRA==
X-Received: by 2002:a17:906:c155:b0:c29:63f2:99bb with SMTP id a640c23a62f3a-c2a15d12004mr1081031466b.47.1790018541023;
        Mon, 21 Sep 2026 12:22:21 -0700 (PDT)
Received: from cachyos ([151.38.78.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm341089066b.47.2026.09.21.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:22:20 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cenzhang@linux.microsoft.com
Subject: [PATCH 1/4] fs/ntfs3: validate dirty page open attribute offsets
Date: Mon, 21 Sep 2026 21:21:36 +0200
Message-ID: <20260921192157.102738-2-giulia@bynar.io>
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

The dirty-page walk in log_replay() uses dp->target_attr as a byte
offset into the open attribute table without validating it first.
Checking oe->next already dereferences the unchecked pointer.

A malformed dirty-page entry can select the table header, the middle
of an entry, or data beyond the table. The lookup can then read an
invalid entry and follow a bogus attribute pointer.

A crafted table dump containing a fake open attribute entry at
bytes_per_rt(oatbl), within the larger dump buffer, produced the
following on x86-64 before the fix:

 KASAN: maybe wild-memory-access in range
        [0x4141414141414148-0x414141414141414f]
 RIP: 0010:log_replay+0xa698/0xe690
 Call Trace:
  ntfs_loadlog_and_replay+0x3e0/0x500
  ntfs_fill_super+0x1fd3/0x4510
  ...

Require the offset to be at or beyond the end of the table header,
below the logical table size, and aligned to the table's entry size.
Also require that each entry can hold an OPEN_ATTR_ENRTY; together
these checks keep the whole selected entry within the table. Reject
invalid offsets with -EINVAL, as the redo lookup does. Keep the existing
handling of unallocated entries and NULL attribute pointers.

This lookup uses dirty-page table entries and is separate from the
redo and undo log-record lookups discussed in the linked report.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260901174934.6275-1-cenzhang@linux.microsoft.com/
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23e..8ac0dbd2f07f 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4987,6 +4987,15 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	if (!dp)
 		goto do_redo_1;
 
+	t32 = le32_to_cpu(dp->target_attr);
+	t16 = le16_to_cpu(oatbl->size);
+	if (t16 < sizeof(*oe) || t32 < sizeof(*oatbl) ||
+	    t32 >= bytes_per_rt(oatbl) ||
+	    (t32 - sizeof(*oatbl)) % t16) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	oe = Add2Ptr(oatbl, le32_to_cpu(dp->target_attr));
 
 	if (oe->next != RESTART_ENTRY_ALLOCATED_LE)
 		goto next_dirty_page;
-- 
2.55.0
