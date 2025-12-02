Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5324E288530
	for <ntfs3@lists.linux.dev>; Tue,  2 Dec 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764673232; cv=none; b=h284JLHiQ7YzB7qAsb5kJ99RoCEyd9eKcMV5WAQBnEawSHCi2hzrJRRPLHkovIsWxv/rBgguqMox9k/HljOY3fbFXE/5EtBmiJInIVjpGV8BzUUWYON/FYmzABACUJBVwcrjIIs+1DJfdknSiv8jLehrkof9bszYm4PD6ldjjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764673232; c=relaxed/simple;
	bh=qMK7Mv40PlaFBCmSO2JqzuISXl7e/fXR8oaaFMe/yDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cje3W+mzZ33GJ2gdarRMjLo2yqeKYTTDfh/uzmaHdx1zpXZ+1OS3fA2d4Y93DFcaSQ5HIVO8PK9Gi8IpdXrTUVbSOLYMpAR3yFi9GfFRToIk0qzlldokqI9KHJgnQkke2uGPcf5ekatERVFUyU62qLLwJ6siCYaDLRHHI/EZXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy9q6X52; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy9q6X52"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso4255019b3a.1
        for <ntfs3@lists.linux.dev>; Tue, 02 Dec 2025 03:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764673230; x=1765278030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gBYxa3UdC3nz/7QeAkvaHUqNQ7Ba/NVbCG1UGH2hk2A=;
        b=Dy9q6X52UVgIDT3dT/uqXhZzRVooAI3GbiyIrDpDskKviWb7nsFEoVmOB+ggITjQEa
         lI2yLXcT7luPdxUJNRZzC1d0BSwRCM5uzjbuNm3bAks9e4DYNRA02BIsIQW/xlAiaPIJ
         TBgNg4v/1GsUo+/PNcGzHyH73L4yvsWkMZ7NSzZvnZFCYWqK837tZKLCG0ifqthsAEjx
         +FbQ65HfqrytHUVD3TDuJmzBg1UMwg7UA55UchW/OE9J1N+BWQBnFQBaS6A9fGux0k7V
         ajHnFrXlu1nt7mZbBIFRQdd74josAtQLgDIeh5Ibhm2PSmAAEMVMVC5mpWudqq1Q7ym1
         WphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673230; x=1765278030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBYxa3UdC3nz/7QeAkvaHUqNQ7Ba/NVbCG1UGH2hk2A=;
        b=oJ0HpwCzFPmCVxnUE2McdA7NpOTBcBBN4kAQWkheUpfD4xJ9tajASWJHtCKNcYBIdO
         rkkH/+SilcI3QwtlRtewmkRjyU6hNV9Wxl6Xu2O5hwAwXh0FmSumxOAovoqHSPsb2UUz
         ag5k/OBQwnuGY2qGAUHGPLOTiYfW9JZpAK0VFZ19H8PydB/rV2tk1koePesO9yda3K42
         UrwPKBIByJwOWssPjtB4yLgAjgpsQoYtyMSl8k9n+X4WRSCIRBO7CMLAHw7TlWZQp4Eq
         cNj6/yux4xFeR//Md/xsBwNjNIGRaU+LJPEbS7bH5sLMXaJnXoVOUBp5yLHyTe6VfzNj
         DZ3Q==
X-Gm-Message-State: AOJu0YyctbyoSALKTGVaAtFZbA/m4vlC90PBKq6zxtmoBAGMDDfDdFaR
	LH68hKwNISWqJkNe+E9EWYIKzn+8+EOQupXVPQtNPCtcfMNhqq2SxNfB
X-Gm-Gg: ASbGncsBFIqFLT0rsTfehaA/E3cvB341RU0xbmZJNTvgkGA0dapqfUWzY05blaEzdPJ
	fM9zmkUdTb9ed6SRymz2k+jYpZ/uZQR90viow5UVs0nVfzqWdue/oEGEG3z9gObkR6K7izaTRmR
	i9APv+z/PZE56lv+79xROY/Kisk3mCokM3RlEX4SzHvtZPJlyQ7Rq/HWIzKDNobBNHuy+tRi/lf
	2OvXlsWOwPPnG9ByT/DFMUOySBMu3nZwH6T0iYC3ocMLx/7LNX1CdrcX3v2R5Fr3NrJf2QVUdj4
	Qw1SZU52Vn4088XuvFHF5eBCE0Mhlf9sFjSJ8SbU+athrhcUyLV/Se6IxoKkoIhLIF46dk7TXjX
	dCJeTLY/wD73ScoNX457V53gFWJETBg6OTlumSg23DqGY2pk9FrYGNRTO+M6loDmunjgTP0Hd1F
	MgSg==
X-Google-Smtp-Source: AGHT+IHYrwCgl8K31v3l6HXjK1Y/dOczGrB5flMsWdXHecMWxoKNPvpAP7z9LtFaVbnI5booT4mKJg==
X-Received: by 2002:a05:6a00:2ea0:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-7ca8740d237mr31679062b3a.2.1764673229427;
        Tue, 02 Dec 2025 03:00:29 -0800 (PST)
Received: from OSVS.. ([183.101.168.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b68367sm16796988b3a.12.2025.12.02.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 03:00:28 -0800 (PST)
From: Jaehun Gou <p22gone@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jaehun Gou <p22gone@gmail.com>,
	Seunghun Han <kkamagui@gmail.com>,
	Jihoon Kwon <kjh010315@gmail.com>
Subject: [PATCH] fs: ntfs3: check return value of indx_find to avoid infinite loop
Date: Tue,  2 Dec 2025 19:59:59 +0900
Message-ID: <20251202105959.1885454-1-p22gone@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We found an infinite loop bug in the ntfs3 file system that can lead to a
Denial-of-Service (DoS) condition.

A malformed dentry in the ntfs3 filesystem can cause the kernel to hang
during the lookup operations. By setting the HAS_SUB_NODE flag in an
INDEX_ENTRY within a directory's INDEX_ALLOCATION block and manipulating the
VCN pointer, an attacker can cause the indx_find() function to repeatedly
read the same block, allocating 4 KB of memory each time. The kernel lacks
VCN loop detection and depth limits, causing memory exhaustion and an OOM
crash.

This patch adds a return value check for fnd_push() to prevent a memory
exhaustion vulnerability caused by infinite loops. When the index exceeds the
size of the fnd->nodes array, fnd_push() returns -EINVAL. The indx_find()
function checks this return value and stops processing, preventing further
memory allocation.

Co-developed-by: Seunghun Han <kkamagui@gmail.com>
Signed-off-by: Seunghun Han <kkamagui@gmail.com>
Co-developed-by: Jihoon Kwon <kjh010315@gmail.com>
Signed-off-by: Jihoon Kwon <kjh010315@gmail.com>
Signed-off-by: Jaehun Gou <p22gone@gmail.com>
---
 fs/ntfs3/index.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 6d1bf890929d..050b3709e020 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1190,7 +1190,12 @@ int indx_find(struct ntfs_index *indx, struct ntfs_inode *ni,
 			return -EINVAL;
 		}
 
-		fnd_push(fnd, node, e);
+		err = fnd_push(fnd, node, e);
+
+		if (err) {
+			put_indx_node(node);
+			return err;
+		}
 	}
 
 	*entry = e;
-- 
2.43.0

