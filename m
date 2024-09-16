Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5715852F
	for <ntfs3@lists.linux.dev>; Mon, 16 Sep 2024 18:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726510559; cv=none; b=tgiLaw2es97D5Uix3cvsyfL/knw5uaX0zrFVQOQE6VBOJW7CYMNAahBvg0s3JYm3uQU+z5HQ9BEaBAgXquWErnDC+OXqKlMpBGzxsvmXbulglcUhqAbuELmcRja0NUZ8zdUKeXJ5SW4sQQFXbA1QcZBL2FlOs9BYi7c5nivsbcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726510559; c=relaxed/simple;
	bh=4Qhsku91lFKJ8KjbB5aFPJSDK9oNgKbdpsT1c9CLkqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTrtQtpmY14j+MEgpXV8SueW+NhrWuMdv/fzTCi5ZyKXVFkva5PIVgSXCpglwAvAR+b2MA007U98Ua09+LW1Ok2mYsHJaGAUEtmRHHln8ihZEtg7nK9t7YA6/wcPJRffclrfmTroTGQKA7Gd32ikebGDUzoaycMLEPdH9Tg26Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEvQuplo; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEvQuplo"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-718e2855479so3481131b3a.1
        for <ntfs3@lists.linux.dev>; Mon, 16 Sep 2024 11:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726510557; x=1727115357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5tfqQDexu4Vmpn8wv3LnZmio6F6PpZY2ba5RnBulZUU=;
        b=ZEvQuplooVKEtwJSL0DStU0QVmEJlVp232I6U7jC2mje5Ctlsu9dBgNQq7UoxN4IOZ
         hRjkgUO7EbgdybnKcN6VVbwyme5DeiCxh5hP+QCTTslYyTGC2uLoqRUfRLrA5PNwJeqV
         4W0Mxh52+xCz/iiDsmNdd/F760bU5fXxv5hzhyOVUkB5qcqU0GqHIDLfJH2JcT8zX0c4
         3ro31T7LFR7VMh6/FVxW+9KRZGqyPyMQoLpp2xTecRgkFgc2M9shxpXSKopYLTDgs6UT
         66HYNblM8a7O3OzmS51wH91epePz2xdDLPBBfYA6MPDBb+JYql0VpXATrTXSxZiu4Lu0
         AAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726510557; x=1727115357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tfqQDexu4Vmpn8wv3LnZmio6F6PpZY2ba5RnBulZUU=;
        b=A/ATR/bjI3enP7x2rZa8t43ncBR+lcK1jv0rXfHErdf+j9KVUkA0dA27lJacs7/cho
         Vp8hmBRwy32/mGEsIZqHLNdTdCeJtUnIPMOIwytIx3KmBdR0GEMrybS8O8hkFqNKUHo2
         lrUFYEEOpUmwzecQjPkyIDPrxsyeyQik6MNThTRWTSfp7jpyi9dSZrvTuC5Fga4pytK6
         dib7R64bceIckk1nS1BCnpLEBGqNOiZO8S2zwS7nLa+XgP6mwgb4QwKMNUAROWPprcUg
         ZXZXhGCV9bTPTvER65QsqBZItmipwkZ3sk/hKyk5H6maeLmi8zwKbFdN9JJvrYL1PB2N
         ytdw==
X-Forwarded-Encrypted: i=1; AJvYcCWv9+769H8MLs/CuLeBogl5of2iyeiqn/qRTVVsGEvNbrREP08Lfct0AX6F1LmvHdOZm3tNJg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1vJZMpa2iQY+ENAhNRb0pr+jxgCBKkBmnBluyA0LrbnN+ghtE
	LgOtqGOmiWX6guwNLdwCCMPPUTSYJL7h1W97JhQJaMLrSfhZVDde
X-Google-Smtp-Source: AGHT+IH+J9oOULqskqZUCMfdC6hBDHP0/oiMJqDpk20h3oWKuvbeZz90Xb1HAyM+X6Kd3sQBdHSBgw==
X-Received: by 2002:a05:6a00:1883:b0:706:58ef:613 with SMTP id d2e1a72fcca58-719262066efmr23193056b3a.27.1726510557247;
        Mon, 16 Sep 2024 11:15:57 -0700 (PDT)
Received: from diogo-jahchan-ASUS-TUF-Gaming-A15-FA507RM-FA507RM.. ([200.4.98.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a9831esm4002548b3a.24.2024.09.16.11.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 11:15:56 -0700 (PDT)
From: Diogo Jahchan Koike <djahchankoike@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Diogo Jahchan Koike <djahchankoike@gmail.com>,
	syzbot+7f71f79bbfb4427b00e1@syzkaller.appspotmail.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ntfs3: change to non-blocking allocation in ntfs_d_hash
Date: Mon, 16 Sep 2024 15:15:31 -0300
Message-ID: <20240916181544.6765-1-djahchankoike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

d_hash is done while under "rcu-walk" and should not sleep.
__get_name() allocates using GFP_KERNEL, having the possibility
to sleep when under memory pressure. Change the allocation to
GFP_NOWAIT.

Reported-by: syzbot+7f71f79bbfb4427b00e1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7f71f79bbfb4427b00e1
Fixes: d392e85fd1e8 ("fs/ntfs3: Fix the format of the "nocase" mount option")
Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
---
 fs/ntfs3/namei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index f16d318c4372..0a70c3658546 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -395,7 +395,7 @@ static int ntfs_d_hash(const struct dentry *dentry, struct qstr *name)
 	/*
 	 * Try slow way with current upcase table
 	 */
-	uni = __getname();
+	uni = kmem_cache_alloc(names_cachep, GFP_NOWAIT);
 	if (!uni)
 		return -ENOMEM;
 
@@ -417,7 +417,7 @@ static int ntfs_d_hash(const struct dentry *dentry, struct qstr *name)
 	err = 0;
 
 out:
-	__putname(uni);
+	kmem_cache_free(names_cachep, uni);
 	return err;
 }
 
-- 
2.43.0

