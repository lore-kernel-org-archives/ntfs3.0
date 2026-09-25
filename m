Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0209149892B
	for <ntfs3@lists.linux.dev>; Fri, 25 Sep 2026 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790335001; cv=none; b=bSuG5Xy+MS0lG1w/9TIgaPuvv9SBQBh8hrHZkl4LQRD+VM07g+zFhiwmFjeuy8QziGQEcy/1aJss8174mFU8nvV2+E5C6St4trTg5Vt3aJmFOocdGFQkZAMv6v23QxqxXll2nLOq1qVtiLYOWab4JojVKBfOK0h8o4XFzU5PS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790335001; c=relaxed/simple;
	bh=5ZujRSyQJregJPMUymk/yiSTpGUWq/0YVKoOx5Zs1Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncQhCVfZLzxDY7x00TTXti894Hw4VrQdQzWDKaOMMafEhkB8zEH16dUMzK2SPHjzY9nNbTFQCR3llRRC7R8iNiMnjMDdL++3NpjAdaTF4Ln9l6ZinHamFGVZvDoQWD7DifXz72ozeI0x0J/N+VN2pQ+ypcMVjVJYzimIBEqoaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=gPXMK1Bf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="gPXMK1Bf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so4478305e9.3
        for <ntfs3@lists.linux.dev>; Fri, 25 Sep 2026 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790334998; x=1790939798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXXodn/Gz9EuJ+FWpPi+CnP7LgY7X1c9rtJL7VC41Io=;
        b=gPXMK1Bf9m+22X7vXdhpSMApik0aN+XIz8yCXzUcIdbdaF2azmBNEVzbcFZ5ixokQ5
         QPYMlvXZNNnt010/uYhGfM/S9rPYLnQbayMBhD/gl6h84i4VNeYtQrbI4lY/u3nPc1cU
         GDB8dHua38pfk+o3EYYsU6hdRqcdIsJeBzNb0rWV1+EFEvUF/UL3xQoc2jrMuhKFa2cT
         b7H+QyGpSEx2RDrsC/jeraD1uvDlPmYMpxHGYsZKchjYS75mfjyFEjHAsrMdoOBVP07k
         XCd5AqBjhyj/eskyK1py79pLAqktU1syEPAd4+xgkdpIMr6iNohZYpSHzR314MGBX0Rv
         8nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334998; x=1790939798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXXodn/Gz9EuJ+FWpPi+CnP7LgY7X1c9rtJL7VC41Io=;
        b=yWUrGNdUYY7AUvVqpnnIajA5OoE6s0Fzq2fLr1ze3mSDSyU/0dW5gt/nkxK5DIU87K
         jdka3j3spEvjtpqiJoQ7aFwIKy1b16bHRQR1+PdOEKU+8zh0LXyrTk/xYpmCLfcLEHY+
         UR22iJRw5Eyo+K8asvi9iCj38IOpLoU95jt9igGzcIdwX5WqTf1asLd5UORicRuWbAEJ
         BANFNRd4FyDNmFicKV7gxNw0ut8AP/4pt2bWQ1W2x83ZLpM5AMT1a+LpXsOQa4C08hG3
         fJXGxLK1WuDdG9DoluSSgL3EM2Cl1R/N3Da/G3wrR4HfqUPf6RddgucwDzlva6T0yQ8d
         QoqQ==
X-Gm-Message-State: AFuF++ntZa37d2wAkcHpyepojYbrxegUcvvEmsXh2cY/Q6M4T6i/1Qre
	qd5zEWtK9tOsowjv3QVgeP4XcOEYWBJvbquYjply4vc8XVYFiu/5VDFGkfZStJI5SyNgPwApMrq
	x9n7wN5Tvuoxlkw==
X-Gm-Gg: AYBFou1ed4fmpjebRbdQLtEAQ4AogIWyIEyE/Q98Nf/CcAvu01injZA2okytgDV4pZz
	kqWH0ZGxbd+ctBNXe/wpKJ3jEG5O6F0+pi6Aqe8/Ew9WXDy3q3dzxOfhsTnv+ObetEKqkBb7c0K
	FhJU222oQ/Qpab6QkpsCf8FsXBBdHaAoD/Oqrn6qEQaswfC0u6zN3AdxHWEuczANP9iJIQEkBE8
	WdaUnsB2wiGYIuKNW2E5QzosGTZ4z2L4SUAxVHA7+bZrXzr8o9X4kGWFdaDXWtMVhCI/8iECA3E
	tFa96gIKqKfH31fmg1nUCZpNCzE4LEKB0zYphZTTMSi5QfjsnOdE8D5jDTXlUbYxAInHTSvWW/9
	YHmEKg/7XUJUCsF3ITXOtdlnAOt2Lx+Iw7jrjJoYNb9wMViRt1RPLZAjBDVGGmXwv31bQvM/iO5
	iljFPy8PEGUTSUInEPDRxUINsCS3iESkMgQbSEWY8=
X-Received: by 2002:a05:600c:3b1b:b0:49f:e4d4:dd70 with SMTP id 5b1f17b1804b1-49fe6705bd7mr95338555e9.31.1790334998062;
        Fri, 25 Sep 2026 04:16:38 -0700 (PDT)
Received: from cachyos ([151.36.34.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm50237695e9.12.2026.09.25.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:16:37 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fs/ntfs3: validate SetNewAttributeSizes payload length
Date: Fri, 25 Sep 2026 13:16:14 +0200
Message-ID: <20260925111619.68345-3-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925111619.68345-1-giulia@bynar.io>
References: <20260925111619.68345-1-giulia@bynar.io>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_action() handles SetNewAttributeSizes by reading alloc_size,
valid_size and data_size from the redo or undo payload. It only treats
total_size as optional, but it does not first check that the payload is
large enough for the three fields it always consumes.

For LOG_RECORD_MULTI_PAGE records, find_log_rec() allocates exactly
client_data_len bytes. A crafted SetNewAttributeSizes undo record can keep
the undo payload within client_data_len while setting undo_len too small
for the fields read by do_action(), causing an out-of-bounds read.

Before this fix, mounting the crafted image on a KASAN build produced:

  BUG: KASAN: slab-out-of-bounds in do_action+0x7640/0x89e0
  Read of size 8 at addr ff11000101d94ed0 by task mount/61
  Call Trace:
   do_action+0x7640/0x89e0
   log_replay+0xcd38/0xe690
   ntfs_loadlog_and_replay+0x3e0/0x500
   ntfs_fill_super+0x1fd3/0x4510

The same report showed the object came from find_log_rec():

  Allocated by task 61:
   find_log_rec+0x17d/0x5f0
  The buggy address is located 0 bytes to the right of
   allocated 80-byte region [ff11000101d94e80, ff11000101d94ed0)

Reject SetNewAttributeSizes payloads that do not contain the three
fields it always reads. Keep the existing total_size check unchanged,
because that field is optional in the current replay code.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 88bd6ef98467..c5de4ebcc7ec 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3463,7 +3463,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 	case SetNewAttributeSizes:
 		new_sz = data;
-		if (!check_if_attr(rec, lrh) || !attr->non_res)
+		if (!check_if_attr(rec, lrh) || !attr->non_res ||
+		    dlen < offsetof(struct NEW_ATTRIBUTE_SIZES, data_size) +
+				   sizeof(new_sz->data_size))
 			goto dirty_vol;
 
 		attr->nres.alloc_size = new_sz->alloc_size;
-- 
2.55.0

