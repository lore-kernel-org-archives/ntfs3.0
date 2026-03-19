Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B982253EB
	for <ntfs3@lists.linux.dev>; Thu, 19 Mar 2026 07:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906356; cv=none; b=TD4FLTqKKDmbwuiatRR6OrfRhTVz3fHqBDwidmob9e3G0gAhjn66Am2wLXc3lkWU4HEYz6RTP6HcftRsFyFL8JfNhu5AdQCObZO7wq9vTPfurQWjuoB2IPOl0KJVS27BrjxjyaQvTmOxKPc8mdNe8mTXQwaZbH4AzftlZEg0hSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906356; c=relaxed/simple;
	bh=m5zxzx1Q1dodJcrmXSaZ0da3wEIPfCjTqIUZL4EbOfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JpX5BTIF3dp+BycJzQ7VoUmbApJ3PrBDNCmKLYv4W1++5wlBlJ4ME0eCepXt7V7tSCglw9piD39vjzJ5u/KDmU7M8Ks5Na1hXvGPIl0VxAEG3wWMqXH21S+bqTKgO7GrGHGfOMbjWqfUugVYakSlhYTlNLGW0ik8cepHgbxLj1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgZOWcST; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgZOWcST"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a1cc6e478so502314a91.0
        for <ntfs3@lists.linux.dev>; Thu, 19 Mar 2026 00:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773906353; x=1774511153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BgkktIwZcoieTkoYehpJq/teLEqXNGiFmKYcoE3ZX6Q=;
        b=QgZOWcSTJrThvDZITm/T5NWpv5nZor3F3YPsXgtVU4AFjw67suG6K3x8it+95HRXed
         3bfogRp4cgxjQs3C3wi4LjwSU87Hdb3Q4d9ORO2wjy3w2050pehiGvRHA5GCNCpf3RFZ
         5VCmrKuWERBYjrRYDgE7Va6WFTKcv37epNBkw17TN/zXkpvDs0Tli5O1b8I1xRez962g
         4ojbDqA4Wp3xelrd0W8saTevrZqAhNrRlUVGg4o9R+kD1pzISPzriPmjsxNjz8qThvDr
         GWgDKkaSYz3jkGcybQl5luY0rwkrsNNEpreCW4mw4HbYBZcJ8mJH7HAFnkGYB1loMFRT
         Wl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773906353; x=1774511153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgkktIwZcoieTkoYehpJq/teLEqXNGiFmKYcoE3ZX6Q=;
        b=tRGGKSwQ3Ul5FWiwbwhEv3a/D2KOrIg1BW7I0Yp52A6BJ/t2tMXuu47FN3C8uSnnYe
         XEBsk7yiLHJsGy0jlkAK+CiJQzapp+oQ/hPw7+7KTgXEuAGlQ+Mvt9/XutadxBJFYVyG
         78jLiIsA2tcbXsiWZjc6ynnmAxMJVsr6Z8wi7mwC8J2zdKeYDDb5WKHruAeBs9ZURJ7K
         tkxLpGILTTVg1V7tl0xEs0RLOZfbHYQAgIv8F72HJXxw4Fd2SHbUdMqEPEKbQFlJt0M9
         7SCCIDWKb1IkFsHg+7b6brmS4t0jDRYqFHWVk66/uwYHh6Dex52dwHsevQ4yLAZ0/V9e
         puyA==
X-Gm-Message-State: AOJu0YxSfX/Gs54B6Tw89WMrIwtFP+z6mlk1Uxa1PmevFnSyHCmxVIyL
	n4f6Wtcxlx33f5mXS2VMsS7MB9zDeKK6oVQzUOnzSEwfsR9oFS7ep+MugReKYA==
X-Gm-Gg: ATEYQzyhqoCKkS4pcXZ1qC/tX3VG52m7q3DTRk/bb0RmsLnXJqDj/ACAo8MU7ZaQUkt
	/GS9vY8YkIAAoUJVds1veI/OvgzzkDymylx5o5eblM+ZbgUrgTdnGKarMNrYd0KZ9IE86opVcIt
	vcCiVtmwXaDoyXr1aM5nuOVE33ul0MyA2fZte+hG3gFBnfaD0OID1Yakbtp2D+w8jCMxI9MIVUy
	/79hEaIrIficY9rDB+A7FyjEhEBNPKLciNlM9NbKBcWsOpU0BVwpUf6e4NzT81zqpJOd9dytl24
	qSu5RqwS0Ce0J6OcA3WCIiAaBXgrpSN0bJtGxgbBD3l4NXWZGJZjaxRmFvNjfrqp3BGM5yqaNL0
	ZZ+20fiZ8kPNu0LDm6VOmF5msvehK1nU4lj24CKe7pYVlzd1QQ8Vko0CE8HrgOdpBq0zWaJHyMU
	LDqfg09qA8+bl+ZmuIM3reogMIzKSz7nVom1KBsua/pflcNhdcJbyPNzcENqCw7/kfP/jzANDx8
	dTwyuY=
X-Received: by 2002:a17:90b:2687:b0:35b:90e7:c451 with SMTP id 98e67ed59e1d1-35bb9e8cfa7mr5292796a91.3.1773906353304;
        Thu, 19 Mar 2026 00:45:53 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:2136:a371:9567:156f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff6789sm1893232a91.1.2026.03.19.00.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 00:45:52 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+c1e9aedbd913fadad617@syzkaller.appspotmail.com,
	Deepanshu Kartikey <Kartikey406@gmail.com>
Subject: [PATCH] fs/ntfs3: fix missing run load for vcn0 in attr_data_get_block_locked()
Date: Thu, 19 Mar 2026 13:15:46 +0530
Message-ID: <20260319074546.1085187-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a compressed or sparse attribute has its clusters frame-aligned,
vcn is rounded down to the frame start using cmask, which can result
in vcn != vcn0. In this case, vcn and vcn0 may reside in different
attribute segments.

The code already handles the case where vcn is in a different segment
by loading its runs before allocation. However, it fails to load runs
for vcn0 when vcn0 resides in a different segment than vcn. This causes
run_lookup_entry() to return SPARSE_LCN for vcn0 since its segment was
never loaded into the in-memory run list, triggering the WARN_ON(1).

Fix this by adding a missing check for vcn0 after the existing vcn
segment check. If vcn0 falls outside the current segment range
[svcn, evcn1), find and load the attribute segment containing vcn0
before performing the run lookup.

The following scenario triggers the bug:
  attr_data_get_block_locked()
    vcn = vcn0 & cmask        <- vcn != vcn0 after frame alignment
    load runs for vcn segment <- vcn0 segment not loaded!
    attr_allocate_clusters()  <- allocation succeeds
    run_lookup_entry(vcn0)    <- vcn0 not in run -> SPARSE_LCN
    WARN_ON(1)                <- bug fires here!

Reported-by: syzbot+c1e9aedbd913fadad617@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c1e9aedbd913fadad617
Fixes: c380b52f6c57 ("fs/ntfs3: Change new sparse cluster processing")
Signed-off-by: Deepanshu Kartikey <Kartikey406@gmail.com>
---
 fs/ntfs3/attrib.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 6cb9bc5d605c..6ef7db82a35d 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1152,6 +1152,21 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 			if (err)
 				goto out;
 		}
+
+		if (vcn0 < svcn || evcn1 <= vcn0) {
+			struct ATTRIB *attr2;
+
+			attr2 = ni_find_attr(ni, attr_b, &le_b, ATTR_DATA, NULL,
+					       0, &vcn0, &mi);
+			if (!attr2) {
+				err = -EINVAL;
+				goto out;
+			}
+			err = attr_load_runs(attr2, ni, run, NULL);
+			if (err)
+				goto out;
+		}
+
 		da = false; /* no delalloc for compressed file. */
 	}
 
-- 
2.43.0

