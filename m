Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1852563
	for <ntfs3@lists.linux.dev>; Tue, 28 May 2024 18:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716922366; cv=none; b=XvbiUP1xGXl72SQ073+aUQwdBMW0UsB6MLwZ6+0nZDLaPW78YbyvnwP179aUba/zD0o4z73BAKLm835JY1UiUW1IlF6JjbrChqAnVwT7kMUqFR2SIC0w27uivM3aou9P48N7NHlGUVCxjzCF2mwLBkFNuIucfnIbO12sMsX+Hi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716922366; c=relaxed/simple;
	bh=x2YTCVkTaV8GhtiSzQwhvAhcVJC8QQDzu8d2mLajndY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PLMlOgEzNr4eN1rH8wXkHeKDEkS2B59T+bkA5ObiMHT+Pexx/t1NUP5KBcib9WefHplf8FroWKXFwdk6ECp/QK3i8YbDCH4+xLONPWzsrWfKL5a8+UarbOMtrh2kSGxGsTkyUbPdHDjYpG6L1EKOujn4jlVBeP/RzwsX8oT/fzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMObl67+; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMObl67+"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-656d8b346d2so837868a12.2
        for <ntfs3@lists.linux.dev>; Tue, 28 May 2024 11:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716922364; x=1717527164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0+BnDT3v6Msbvox91zkA3JaKkw+aVuJFbF+2+7M8wY=;
        b=WMObl67+6yWguczN5DDHwLvWwq/AksUHrOSoM3vifzeptVVIJz16YExAVK2h/XMBXQ
         Cdhw3AIOdXAxgjTFYAtsav9eEhBa8x5gagHXiQNrDMljNBpk5WLV6f2lWZzgVakfoW+O
         tLm5G7vqPTfKj9X9ZQK6gdZRNUmLCQFtUFvvLDgVi2CoRRU5heVrZ258R37bYPr4r7cP
         TIRNSOuTjIsdQmEGHakKfC2VMqK1nQJqk7gGXiZctRWndpTv3W+nDDiMZ7ZtN9mLNV5f
         wOoaeFCu2Hl9JLiHxToJNYZcQk+nlWOBaM490Vj3nW3xLa+jgrXAGB3VH1btu0os8ofp
         8z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716922364; x=1717527164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0+BnDT3v6Msbvox91zkA3JaKkw+aVuJFbF+2+7M8wY=;
        b=YcJ0g9RSZR/F6WqIv3TwZyqWa+DHMBD4Hft1M2XOiiDv6y7ghjgm66gMBEuE41RQPQ
         1WcpmMP5aR+ipU2FeK8apCp296+okHTof2uPOpbS4LeZeprQEWYktSAh87USRXyPI+a3
         Dpl2IkuQpuO2yxvHHZAGUm3Pm9Kf402WE7O+AMOarvBdgyPagHoUXfgS+dNjhnrX0dzr
         VlmK8OBeI6ON9E1J9JwLeZkwNQE45iLmiEWSBlH2sAPUrEWO2u6cO28Z7i9b21INBjJx
         +ovlY0KU69ogtpL/vlOXxvcc4XoIbYImPeiz9S1/jUUZos8Jrhe5qcnTvAH3duZQcN5c
         qW5g==
X-Forwarded-Encrypted: i=1; AJvYcCUODrZELYi5dr4vyBlrQpeCnXhYx60RGW+dfqwgTL3jcrwt0id3h0uDtWMxEIHn2CGZqLU2lS4oqI+UAx6dQWq4+nV4EI8=
X-Gm-Message-State: AOJu0YxwW/4/VvZAmOIBqMEFNuC8IDqJX5OfZeGrSDre9ToLpqDonL1D
	jMAbO1mu/Euzkpn47Eoojtd+0fMn1p9v14bNGagzN42ptuZJW/U2
X-Google-Smtp-Source: AGHT+IF2wDjg5MuVRE2Gp2x4TxMHhvTjrITFFIA30NsZp6ZSsnya7nlquUF+bAowkgku9xl5GRle+Q==
X-Received: by 2002:a17:90b:1983:b0:2bd:92c3:6b93 with SMTP id 98e67ed59e1d1-2bf5f710008mr13759808a91.34.1716922364065;
        Tue, 28 May 2024 11:52:44 -0700 (PDT)
Received: from localhost.localdomain ([47.238.252.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf5f615b9fsm8948844a91.34.2024.05.28.11.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 11:52:43 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: lei lu <llfamsec@gmail.com>
Subject: [PATCH] ntfs3: Validate ff offset
Date: Wed, 29 May 2024 02:52:22 +0800
Message-Id: <20240528185222.17398-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds sanity checks for ff offset. There is a check
on rt->first_free at first, but walking through by ff
without any check. If the second ff is a large offset.
We may encounter an out-of-bound read.

Signed-off-by: lei lu <llfamsec@gmail.com>
---
 fs/ntfs3/fslog.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 855519713bf7..be969086c4a0 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -724,7 +724,7 @@ static bool check_rstbl(const struct RESTART_TABLE *rt, size_t bytes)
 
 	if (!rsize || rsize > bytes ||
 	    rsize + sizeof(struct RESTART_TABLE) > bytes || bytes < ts ||
-	    le16_to_cpu(rt->total) > ne || ff > ts || lf > ts ||
+	    le16_to_cpu(rt->total) > ne || ff > ts - sizeof(__le32) || lf > ts - sizeof(__le32) ||
 	    (ff && ff < sizeof(struct RESTART_TABLE)) ||
 	    (lf && lf < sizeof(struct RESTART_TABLE))) {
 		return false;
@@ -754,6 +754,9 @@ static bool check_rstbl(const struct RESTART_TABLE *rt, size_t bytes)
 			return false;
 
 		off = le32_to_cpu(*(__le32 *)Add2Ptr(rt, off));
+
+		if (off > ts - sizeof(__le32))
+			return false;
 	}
 
 	return true;
-- 
2.34.1

