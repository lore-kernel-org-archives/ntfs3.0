Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561BA1465B4
	for <ntfs3@lists.linux.dev>; Mon, 25 Aug 2025 05:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756098535; cv=none; b=QOWQLovFFUJKBR7WnkOhZ5DSLDCFwuZt63bwh4zYAKo1CMourpUlfS4LvNZMnTyPA5zVvn/xFS/qfnLlQ+aVf3CeW6gf14zliJB4EIrgPSVd9wrEWMo9t22XRK3GSaKcgKRYU8PjXxZR+6uMqqcQz6YrpIr31nCblh7KB/sPMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756098535; c=relaxed/simple;
	bh=TjWukWyg/1Yl+QsAk2myzOzlUeTwPDjoupR7OI9d2z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DGQiZe1CHw+o7zrGRe0JURViG5iMl4lfIf5TnhT0L94bsejaVAez7cVzxmK3CJU5AvYDL3CjboTQZDr3yZmtR2YJIXn7r2+srHZbHuW5GR4cOhOZUodrrnWsw4Xoz23bZUzYtGLOYkab4j32jgjwi9pzJ9LQYaEmxvmtHlOsLqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRfrCIH6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRfrCIH6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so3805723b3a.0
        for <ntfs3@lists.linux.dev>; Sun, 24 Aug 2025 22:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756098532; x=1756703332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dSX/z7sKvGoE7FpCC2Ikh1rgDq+TwRfOXAyJO6CPWsI=;
        b=FRfrCIH6LQ26Udx/HUQ0B64zeHVs1Vn+SmVhuoCYoq+p5RHwN/S8TbK/DkEtqk2A6p
         gP7CghBEbL+vQa1YpHM4hrB/f4bD1oE/DpHUN3TT0TK1AY+wJVTJ0RLVuXDWwYpVFE6a
         7GxPrK+8Vj0ChRMOZw+5ewS0RIEDAjifp5n+4jZE71cIgvnpjDDGKjUEvqUI4oPHZ7El
         N74YYhIzlPI2FiihkzPhrT7C17VtR72jgu8tAdwWMuucYb9hXNN5RLnaHc+yRUXtOzHo
         qF0ySB8cV31WwsFEb83yEIWuiFaTtZdfT4o9MXMWfcZeRuHPw3dUj8/evIIqi37chgRk
         WlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756098532; x=1756703332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSX/z7sKvGoE7FpCC2Ikh1rgDq+TwRfOXAyJO6CPWsI=;
        b=h+dg0aMr656FWe3A6/dTCSnFmcVPFgqNYU5M6AkG4WBDjkSExKcpk0em1PF1juOzNv
         ysC95gQ6sWxBJo2NU0UuXWOfVcydPhj27Dc/eJH9GzUMPbzHQCsGbE6O6YJjnd+ElEic
         ih6HiTYwU5sRb5uaqaGXSr5FkBKBc5MajjAYQJWH5dU6N71qI6rMiGWkhODfp9RcZ+Nu
         Pln480w16S1Oo8UAIyd+G17UJ6d+NPP4mzUZdFJEczDtLurVbOMvJ6VQOicMZeVhlgaN
         pBWvhnXt7wNUx94VSx2vP9uqspSYXMJ+J3w4x7hP5PafYaHqtnfISpN75hXP/5KOKFh4
         zBLg==
X-Gm-Message-State: AOJu0YyYhIgBORvc2KfY0IDT+Dg+yNfl/azD/Deovjl3eY+H5KH9l9nr
	HRKeIyptpyvIWajywLukpUK8sgiFMvtExxum6EPHa12LzO6KQo6W97ce
X-Gm-Gg: ASbGncu//F74GsEQrLaQivUWAz8e9UMb2Z0h1RMznr9X7ehOm5UCS/iI1RTgrlYRmic
	/gdE2J1opnPoPo6t+cgp0Xfyr2Ukdg3uYQS+CSSVNJOt/SMwq5IF1IdotsGPUAU/svcxkSJRZP5
	xVqe8b7KQRcwmMrxhOb0MEAG33DA99zQxrGYLu1BcsFtXiVolMSCoYXNs+jSNyj8psTm/T86FrQ
	GlTJGq9GQofQ6/2Ar0fGEotb0EDL6rV+XuTxOC91okbQY6aq4xF3tjQAPIMlIaYKr/1hyeloC/P
	8fPEyCob5iUJmHddr+5ZG3CjWA3xwGo1CaCt5eLZUhNoWuE6d7AVcXdUHWSri4MQsmesLqNI/S4
	Dqe6bpYC+fHTkuRs7N6dsnmPckY5Pv3617U9nLEJ3EbUONrLZgFoHLQqScw==
X-Google-Smtp-Source: AGHT+IHXwkWTxBTR4OSwy3xyu2bs2rZiZ9lY29qqyPJvSOtaS3ZlAjIaRjuaXd3gQ3FbBPApMZQ7lA==
X-Received: by 2002:a05:6a20:938e:b0:243:78a:82c4 with SMTP id adf61e73a8af0-243302caa1bmr19040399637.25.1756098532506;
        Sun, 24 Aug 2025 22:08:52 -0700 (PDT)
Received: from archlinux (201-13-80-9.dsl.telesp.net.br. [201.13.80.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbbbbf5asm5446800a12.50.2025.08.24.22.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:08:52 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH] fs/ntfs3: fix typo in ntfs_info() message
Date: Mon, 25 Aug 2025 04:00:28 +0000
Message-ID: <20250825040038.4524-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Correct a typo in line 1296 of fs/ntfs3/super.c, it was written
'recommened' instead of 'recommended'.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index dd5004efdabb..fe40d12e3353 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1294,7 +1294,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->volume.ni = ni;
 	if (info->flags & VOLUME_FLAG_DIRTY) {
 		sbi->volume.real_dirty = true;
-		ntfs_info(sb, "It is recommened to use chkdsk.");
+		ntfs_info(sb, "It is recommended to use chkdsk.");
 	}
 
 	/* Load $MFTMirr to estimate recs_mirr. */
-- 
2.50.1

