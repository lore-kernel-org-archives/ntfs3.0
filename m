Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371AF39A061
	for <ntfs3@lists.linux.dev>; Sun, 12 Jul 2026 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863288; cv=none; b=BcUJzpgs1yfZaGcMVU6CDlBiG3wcQMCnG5vlHuBVjeQM0JjPRDWSghIYexpPIfZxdtGRU3rvG1+5U7BiW1o8ExKiAIe9zSDAtMQAtK2rV8XUSH29ytI/3du7C85EuXlCJNSSAvjBuortowO/00u/e945BPjMlAhgAxahJl3R1s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863288; c=relaxed/simple;
	bh=SRX9mHeiwzKQkz+Dne4S1XGxWnRHLWPmixGyWmOgWHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gEPsx3mRZ/iipR/PzPgO7zY6mFaFnXx3Jytc0bsHEMD0ricq2bbpyxOp2SZtXFtJ+rDt759+SEUygvpcXlEe5P6vlSAOQWYeNGwWDX0AKptUrtxj/DbSTe/i8+0QpQXGZgk+g3WyBE9STfyIZad7FhEIhmCQkoUEppLxjTlmqOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmVpeWD/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmVpeWD/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3048523a91.1
        for <ntfs3@lists.linux.dev>; Sun, 12 Jul 2026 06:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783863286; x=1784468086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tonu3RNgJXI3ufg6NmZZ2X740hE2BOXsOBfoXwm3l2o=;
        b=CmVpeWD/WDssKeFQjU8xBqEonkossCcmEhq8hF4WJWICHez9yNb2lhIYYZxNexqJHN
         lAx1TIpTkXQ1rAxBaGhn5S8b70n4CWOmjvZ4G80kdiePZbg3JjaeFqDGd6Ix6m92adEB
         VKq4rS3j9nLaO3pbFoSw9yD4MRHorxv0QyFp4Fz2h99nmRL3eplu01GeguYW0fMwvE/d
         sotJ3lgpBx0Ed635INaxIXBeoG4TtgMhwujWkteyueFQf4FCZ0DCoWVntDQAhgNPv1/E
         mC/ulKbp1soOJJSKFa0c5YUtA5TxdlsvHNfev0Rjlup4LsSQN3OtAzn0hYikIr0IrzI/
         1g0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783863286; x=1784468086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tonu3RNgJXI3ufg6NmZZ2X740hE2BOXsOBfoXwm3l2o=;
        b=Y6E1+DlP3raiXd8SoeTtr0qVYd4to3yzlJXiIgj0ybI83jPk4ugUtHO+jyUgOpONOl
         cPcyk9IFW6xjkCBAioFJHDsy6pxoms1IFh4VXc1L0hvJRzgs1ftsTyoN+GNi4wF9U2fU
         cUoULjgjbGgwhhvnQAY8tZtg2lY1f/rvs70jBCvjTiiGA4dCFwNLDja6Twol4zaFGlpZ
         5ebojZtHdH1RrP0+GxS93kG7Rb9FURccwJFhk8tMOkJDf708Jbmp+oA00JBPlBZHetks
         60sfwAeDAa200oyJBeX9R2Sdz4kEyljQ00AZcWlPe6k4kW9G/FpzUN7R3eQF/asJWUVd
         lSRQ==
X-Gm-Message-State: AOJu0YxfVmTaUC+31yc37wKAZXfWHd6+sAAsdSWCrQ5cJr6qNzajNyFo
	a4wkmJ2lEH1uE5KVSTCcaDsAxLOYkI3JJ36l8Tis/aupu+ps0RyqjD97
X-Gm-Gg: AfdE7cnft8sLUcxNug9XZxkNU7u/MvKipIpvMum0ZxIVsu9y16/1C0NxGLLeOJpHQR5
	eATzNr8I4PwQMvnYWJgzhwJedtYIpk4dj7Hop4GFGnBYQHuAvegA6n5DJL3OtnfF/W6l9CyEgI+
	6LdlfMYBWWIMpx7C4qU3jY7NlyvYqL4ricMZEwbfg3JBTNY6BfvDbpU9vYtQOxuJynT34TEQgC1
	xNLcpDqTnlw6aMBw8EG4UXrvLvzS+O21/ppB9zdfoD7FwcgG/YiN+8o8T6xHlH+BJsh5ogfDAHy
	1/jQ2fG7Mkmrm9fsMlYfzszqCth2KwHVQ4UMQQAn3cd+AcqVGkYo/J/1cdAIGqJ802PY937cdDH
	BjD8DZUO0bp5zRcEPh+5vIx5131UAJ/Jd4gcC6burqlBgM8iCQvDGAIXS/lmuZe7vxaWomHq8xW
	VE0zhp0m8RToooVsoMUJhA3rvEuQ3QIbo9Z1VW6TWR6jus8GpdLUAXpnuWpmug+GZhYgty
X-Received: by 2002:a17:90b:2641:b0:387:e0db:3fab with SMTP id 98e67ed59e1d1-38dc7776ec1mr5836853a91.36.1783863286514;
        Sun, 12 Jul 2026 06:34:46 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm19813101eec.23.2026.07.12.06.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:34:45 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] fs/ntfs3: do not mark frame pages uptodate on read error
Date: Sun, 12 Jul 2026 06:34:26 -0700
Message-ID: <20260712133427.435377-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_read_frame() ends with a loop that marks every page of a compressed
frame uptodate regardless of whether the read succeeded:

	out:
		for (i = 0; i < pages_per_frame; i++) {
			pg = pages[i];
			SetPageUptodate(pg);
		}

Non-critical frame pages come from __filemap_get_folio(FGP_CREAT) and are
not zeroed. On an error path that reaches out: before frame_mem is
written, these pages keep uninitialized page-allocator contents but are
still marked uptodate. A later read() is then served from the page cache
and returns that stale kernel memory to user space.

For an unprivileged user mounting a crafted NTFS image this is a
repeatable kernel memory disclosure.

Mark the pages uptodate only on success; on error leave them !uptodate so
the read path re-reads them or reports the error.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/frecord.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 2d2644d80017..862baafb80e3 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2467,7 +2467,8 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 out:
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
-		SetPageUptodate(pg);
+		if (!err)
+			SetPageUptodate(pg);
 	}
 
 	return err;
-- 
2.43.0

