Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCD30F7F7
	for <ntfs3@lists.linux.dev>; Tue,  2 Dec 2025 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764673277; cv=none; b=nTpW7hdx9K5qkn/+DcZlqEjQqnaChGKKGWzpQXGekZ6uBjV63BzMBzXYevbQpxTv6sPrnx+v5eT/YrIlmbsSgHK0yI7DRf7GJjFM45zVmtPEB4znhQmMk7p+mwGEYI1Gbg8fdwmY29JNXQhc19NjFXY7KtwjThWPetVAgv0RiOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764673277; c=relaxed/simple;
	bh=f1g9bUGgHszvI7qIQ9jSyi96ql4FrsjG/3vIj0XzzRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NRq3BrCsy8+xeysiseJDOxqwUPdOoBOc3nWZ0V3UdO2BhJK/PcLcbmSvBntmxd6s8g+64rFAvJMZdi9klKwbQ8KPdlWol7HK+zq5h5CBRz5HiqDw6Vx27OANmpeicA/rDaueoiNYcChDAH/fEEVkC8C0ULk79rke9btokdXq5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cypWzYAk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cypWzYAk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so6684330b3a.3
        for <ntfs3@lists.linux.dev>; Tue, 02 Dec 2025 03:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764673275; x=1765278075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwS+WqhsHjuke59XDWQDtSJcKHrpaHNJZnKNq9EuZMw=;
        b=cypWzYAkJE2mroAaM9EDtAwkmJJW1xNTl7pVH71wZBphqQ43+pDXtacKDIi+7JTjwY
         33qG33Ft+7xpELlNVdosOL064XFGoOUGkkVTrQUzENi4drRRhxxIKYElJ0HCAxBYe+Wd
         JjyR79yAJ4wqzVYu+9wSCJs6Wt8lICe+54+VoLRuTsbxGPd0hNoW4aYNtZm0g0G3tDt2
         OsgBMXw/hDPMx4qznz590kDBtSL+qP8rxW0Fj+gDevIj8LYZnP9X272aTT4i6SMqWFIo
         zoWj2XDLumNcQ9fwIkeK446VjFrshUTrJSfOlkjHI5XhEdEqGVf5ybb6AyEKv1QXFa5n
         l6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673275; x=1765278075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwS+WqhsHjuke59XDWQDtSJcKHrpaHNJZnKNq9EuZMw=;
        b=WFl2iVfDs2s9Xqrfq/McWyFBCzCQtC8a2JsbIfJj4mHq7XTBF7lSFGQxVP3/YIeJk6
         rNUr3TPcA8f8uVzOYpdGjuyIp8XxspYwrBBCXEorLYpm57x0Qn+6Br16GF33WAyibnEz
         VqAyhQM9przKqRwZD/YDM5ij0/u7x74Ekx+uF71SfOBU2dcN7tqvlj8BwbwbP3S14K9z
         InF2wXhoeSp49cN5+NeDv3wkjuHJuJpb6Ta+mVgaRLJzoseAOs+s/xWoVnHwigWkzotD
         P/TIwdjMVXe9FMbDDn5QQjadlu63R+j3XFoKHAvCrCiuA5GAi3b+FzR24X1J7fUTmN5C
         TgyQ==
X-Gm-Message-State: AOJu0Yy++NiQRrLRO6f7b/oKwj7yzridrac7HdSfTR5AM2O+knO3y474
	vBtySYPfI1XoBHEDHZNTpaa4e5NGE3G66ZDZOBXFoRnBxxk5/guSYApZ
X-Gm-Gg: ASbGncuJMDS+XmlKkPCkzgeD38GXdgBIhk1nKGhJVgQ8WOdIWePomiIWP/9gA6aP8pV
	KcjMsi2gL7vOpet3I44QiDUEwpZlnNf2oi2zamq2XQ7Ki0hITQHqd/1WTT2RUSkePD3/ceN2bP7
	Hp+UZVDec2hodTjeRkrc4Drs8lvfgHInIxecaeL05XbknNBomV8i8baT2M3A5ON5MlsIcx0/Yid
	fzvI2izKOKHCMFTw6QFiZFxWM/GJZZaVfddDXmh8ul1k0N4RMTchticy+XKKfnnvDhF4D1ryQqc
	kVMOMDRiIs6+kJX69/maRb2QmFdIgJ5PKKJDCgqTSdH3q1kNIFU/yS2nrZyoBgic1szEWc78SW1
	nfV2X2gKTqGlO8cw76N/hJxqpjoMO1PlBn08Ytb3wZwJGNZY752qsOIk3rt1cSOIkI1DxSW4tc7
	usHg==
X-Google-Smtp-Source: AGHT+IHXE1nq98kZ2mHUg3aRKw0Tpvv5fKs7t+91cMQI+NUwiWcWV7PC6e9t6qTCTBSAW27/RbXc1w==
X-Received: by 2002:a05:6a20:729f:b0:361:2d0c:fd81 with SMTP id adf61e73a8af0-3614eda84f6mr47967215637.28.1764673274714;
        Tue, 02 Dec 2025 03:01:14 -0800 (PST)
Received: from OSVS.. ([183.101.168.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbb003a1sm15153818a12.8.2025.12.02.03.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 03:01:14 -0800 (PST)
From: Jaehun Gou <p22gone@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jaehun Gou <p22gone@gmail.com>,
	Seunghun Han <kkamagui@gmail.com>,
	Jihoon Kwon <kjh010315@gmail.com>
Subject: [PATCH] fs: ntfs3: fix infinite loop in attr_load_runs_range on inconsistent metadata
Date: Tue,  2 Dec 2025 20:01:09 +0900
Message-ID: <20251202110109.1885939-1-p22gone@gmail.com>
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

A malformed NTFS image can cause an infinite loop when an attribute header
indicates an empty run list, while directory entries reference it as
containing actual data. In NTFS, setting evcn=-1 with svcn=0 is a valid way
to represent an empty run list, and run_unpack() correctly handles this by
checking if evcn + 1 equals svcn and returning early without parsing any run
data. However, this creates a problem when there is metadata inconsistency,
where the attribute header claims to be empty (evcn=-1) but the caller
expects to read actual data. When run_unpack() immediately returns success
upon seeing this condition, it leaves the runs_tree uninitialized with
run->runs as a NULL. The calling function attr_load_runs_range() assumes
that a successful return means that the runs were loaded and sets clen to 0,
expecting the next run_lookup_entry() call to succeed. Because runs_tree
remains uninitialized, run_lookup_entry() continues to fail, and the loop
increments vcn by zero (vcn += 0), leading to an infinite loop.

This patch adds a retry counter to detect when run_lookup_entry() fails
consecutively after attr_load_runs_vcn(). If the run is still not found on
the second attempt, it indicates corrupted metadata and returns -EINVAL,
preventing the Denial-of-Service (DoS) vulnerability.

Co-developed-by: Seunghun Han <kkamagui@gmail.com>
Signed-off-by: Seunghun Han <kkamagui@gmail.com>
Co-developed-by: Jihoon Kwon <kjh010315@gmail.com>
Signed-off-by: Jihoon Kwon <kjh010315@gmail.com>
Signed-off-by: Jaehun Gou <p22gone@gmail.com>
---
 fs/ntfs3/attrib.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index eced9013a881..f0ff85b7d76d 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1354,19 +1354,28 @@ int attr_load_runs_range(struct ntfs_inode *ni, enum ATTR_TYPE type,
 	CLST vcn;
 	CLST vcn_last = (to - 1) >> cluster_bits;
 	CLST lcn, clen;
-	int err;
+	int err = 0;
+	int retry = 0;
 
 	for (vcn = from >> cluster_bits; vcn <= vcn_last; vcn += clen) {
 		if (!run_lookup_entry(run, vcn, &lcn, &clen, NULL)) {
+			if (retry != 0) { /* Next run_lookup_entry(vcn) also failed. */
+				err = -EINVAL;
+				break;
+			}
 			err = attr_load_runs_vcn(ni, type, name, name_len, run,
 						 vcn);
 			if (err)
-				return err;
+				break;
+
 			clen = 0; /* Next run_lookup_entry(vcn) must be success. */
+			retry++;
 		}
+		else
+			retry = 0;
 	}
 
-	return 0;
+	return err;
 }
 
 #ifdef CONFIG_NTFS3_LZX_XPRESS
-- 
2.43.0

