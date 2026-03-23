Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5199289340
	for <ntfs3@lists.linux.dev>; Mon, 23 Mar 2026 05:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774243317; cv=none; b=LrAThMiM5dQ0WaoJrxSsnAwHYT1r8emNJU76wDm10K88IC78NVBnjXADE2Bav3+PMagRlYz4ZFaphtd28gMSeyhWz6xHxMICxUOtKSBs+yFpblfGdzaSErMyH5bQzptJdViKqNNXclV4LxjFYQUOCwCZKte7OXoolckDuIyagbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774243317; c=relaxed/simple;
	bh=nkpfooB231w08yEuMmEI3pOCLhwFDkpkvgaj5ETgiwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HONU9iQmMVN2m8WA6TWAIAh3j48i/HQRwPIjj+VKxWJb9nTtm9WR7rHJMd2tuAk/7q0+F6W4n7lb9NQWvqCigh5C5hjmW9Ka+plPzk1XSvIQVyFtnJIfuvtXdlvlV9PKYZvNKAqwBgANpf7AoDcHCaA/A6KYkRrTJZPLdSKJzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpa3tYfn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpa3tYfn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a871daa98fso20573925ad.1
        for <ntfs3@lists.linux.dev>; Sun, 22 Mar 2026 22:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774243315; x=1774848115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NanPiL1bkZBnaJPUdNrmZem0Ql51ml2Y45NTYmJIv+I=;
        b=hpa3tYfn5OqTNQuS5/hX2xQCs22Ucyo9GoZE3JyAlPIwl4VJaPWwyZz6H820avJrVH
         YMIQuiQQVEz/7lDMMydQQIEPqEZ5N78/jo509G/X2f1J7mbD+34X0mX8snT6inbrxIqq
         8VAozw/q2nlQledodxrgsIWdb1CDnBHtMzRF1Nme9WkaS+FBRCslR50S80zx1yVvn5Ck
         T6IlbZxk//mf7BzTbUCSq3gAJppkWcbrAV9yz9iBk0M0AVP5ltA+D1t8jbwUuNhD2ha6
         3kgU0Ozk6uN67EZBY/H+8HWnsOlmylSI+gFmqo60l+iYe13XR0ZQtHQfv+05x2Spdz2h
         A/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774243315; x=1774848115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NanPiL1bkZBnaJPUdNrmZem0Ql51ml2Y45NTYmJIv+I=;
        b=r+9kXVq4VNb6csFf5ak+qcVdic/hfWc1cf+Xg/z8eKCYOOTL9D9Yq51urACg8xQNby
         SHQo+2l9O5Ins+IFAUU+oOKXUPT43wO5NokC5xYNdu15Avqy4DHzLSlt39Yhc5HLNUIW
         6RcG0OgcIpoisYfmup+RjYCOSWj2/4RyeLDoPQcEEtkpNeLfu1R9kV2GQzXIEVrJxO00
         0WsFQc4Ciqh7nT53FiEhZ+fwGwYhuvEx7c6BzYHD/DbdKkOBfJXeAJujWd/NwhudPnDw
         Bm9K+/GypMjShDZEvn3DiK8ewgnz6LpyLzmRQ3S7Id5SiHiUCono/X9jafF0dxkcQJjJ
         X71A==
X-Gm-Message-State: AOJu0YxPd9LiEWHST8VgDLyp/5Iy5UK4j9DkmlaRUz2cei5kjL8bJrgb
	FS0YsHz+PuD/fCTtbWnK/j1iH44W4l5SIefTolcRaeH5XUxBWpXVBeUD
X-Gm-Gg: ATEYQzxgzcncaJszE3/vx7Ncr3R6qrNnpms1g4EmSH3ZdH9NMdWwKqq2X5hl9dbBW2R
	m75iTUbSvy9gEKdJJGc997dxXRq8QhbuYI7fwiPdQD4R1O6xrzlgXWzKGdO9cg45PCG5PJSj6aT
	/qzXeKOxOEusaCmuhJfN+x8/jvCSTgTz85raAwAnqcBorLVL0EV3Hnbh62UWM+PYLUmcIwCANMU
	2Kf19KqDHXw4/ZKjh0EseSN/5x8KzQZHNi2j5Wi5rem26Mtzcumc+gbE2zIYtaWFekY9jnPQGLA
	11EGE7PTc35W/8B/0PWSHG/sCxXwZe3oCm11lS4jetTWJCCAvpdYNRSjiVJ7vsosMScf594iOgb
	66+ogLJvZIy1v30nyXp0qpk8hhKtNm7QPz1RpBlYbB+sMUm1qcfk5QIxhZqaCOoBdHuoNLUSbzP
	GOsNB1APkdcoEcWTusouQCndwVIQ7vIkha+136tzys52hsIZG1gRH9I8JJe6B1EU2Jojm22yrvK
	iJcbA==
X-Received: by 2002:a17:902:cf05:b0:2b0:665b:c7de with SMTP id d9443c01a7336-2b0827c1676mr102331455ad.40.1774243315196;
        Sun, 22 Mar 2026 22:21:55 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:b0b:762f:8715:d6ad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b45sm127608245ad.42.2026.03.22.22.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 22:21:54 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com,
	Deepanshu Kartikey <Kartikey406@gmail.com>
Subject: [PATCH] ntfs3: fix memory leak in indx_create_allocate()
Date: Mon, 23 Mar 2026 10:51:48 +0530
Message-ID: <20260323052148.1239035-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When indx_create_allocate() fails after
attr_allocate_clusters() succeeds, run_deallocate()
frees the disk clusters but never frees the memory
allocated by run_add_entry() via kvmalloc() for the
runs_tree structure.

Fix this by adding run_close() at the out: label to
free the run.runs memory on all error paths. The
success path is unaffected as it returns 0 directly
without going through out:, transferring ownership
of the run memory to indx->alloc_run via memcpy().

Reported-by: syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7adcddaeeb860e5d3f2f
Signed-off-by: Deepanshu Kartikey <Kartikey406@gmail.com>
---
 fs/ntfs3/index.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 97f06c26fe1a..11f59d7b9ea4 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1481,6 +1481,7 @@ static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 	run_deallocate(sbi, &run, false);
 
 out:
+	run_close(&run);
 	return err;
 }
 
-- 
2.43.0

