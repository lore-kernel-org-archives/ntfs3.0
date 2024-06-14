Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C572364A1
	for <ntfs3@lists.linux.dev>; Fri, 14 Jun 2024 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718380507; cv=none; b=R9zBcG00bqE+HG6zgoqebptMP96A44xh6XlXCzM9GkBPixbVnWjB7ZDXKBeFYAjmBx1hpEnai6uoWHJQfOAlu7YxSZeaC3e3IxyNTe9njI42QceaAXxfEWmfWwKx62cj1TGm8zZ5/ON73MfODMq412Te9fSDjp2/JT+BehYebn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718380507; c=relaxed/simple;
	bh=w67YVGsJIdbgvhVnX/fgOqcj5R6QGenkGbQmbzGtaJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=If9C0KLXajwc0Lpv8M0d6qu2HVijMUuvPbI1Vbpdv9+Mkr76WFWZRnGVvoOTBqqajXuJTZAIB935kB+10NtKoSCNPxpY3cW7bsj6Dbp6roNOVbysyedhSUTd8KLa8BNpEoryFE+BfQcsxkHqk0cH2BwIrw3+Yp2KalEV3gLyCEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN0Sf7+7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN0Sf7+7"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00ba6so1035171a12.1
        for <ntfs3@lists.linux.dev>; Fri, 14 Jun 2024 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718380504; x=1718985304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86Uvkq476J0alcrNmeWhOUylucKgcBqLrdukvWEy+xk=;
        b=DN0Sf7+7WEdVsiFUF9gUWsCOU3m21XP8c9C6ehIth+WzYsBQo7QDGwA03sqrM6jaT4
         Cg9HuOnQ4qg+Ui/czLDJMKo345NN6Cd8rsGA9RwLIKEYjx7ALV8/Tq23I52K2qsfSdAx
         zenurx2NyNmPtcfIOAewuLeSfBBZr0ao3nDf54bR1xJC6nWj/Dmic29B/3F3ILiIFt3I
         u9gRYpjio1tQmGIp/6eXdYVLdjQZdwkMzPv9dCirO5dTL9DCqPVIVm2DBqhUUiQhpezk
         eiLhV0YClkorGirnO2FtJ+Xd0dwU57xVbBu8FXmfyk/x2S11ilQ8E/xWx2Yglo6wmzSQ
         6tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718380504; x=1718985304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86Uvkq476J0alcrNmeWhOUylucKgcBqLrdukvWEy+xk=;
        b=ENzsZdcVa0ZMEL7/C4vaxZ1GMS3BS+l67T8dxddvg4kK9WeO6c1cogslwm7mVW3y/8
         fyH/KeWdYIeDsmmfgI0CMMKbbAkMuikMri8j79x1UxnIjY0/KatD9Pcd+tPxHQ0SVzUe
         Y+O9/VCTnnjN9ypsMzPhOc9Oj/5suHauoQk97EegFQvlps5X6ExpxGdYUNzsex9NOVvM
         aR0M2QVIc0SN+eyC3+m1dVyzU6UTEU03kgKIsASe/e76zaYgzZn2IXzOnfdMd85Rr4uQ
         km9bK5JIMzdKbqedlHlossPwGXqawTxhdkQtif4PqJEerdnKZ2hgDGBo4CvrY1c/WMav
         DA2A==
X-Forwarded-Encrypted: i=1; AJvYcCWIOpZWdotPprWpw8rB8YgQubMO9i4RDe9GC4b3RjRny9rNTBtLarPLBR9OHR/gjC50er/n7k+FQ5nWgPeRPwlXMnXEg6E=
X-Gm-Message-State: AOJu0YzBZYrOylO7zz4TBzoZuCfWwiQ8Q+n+cmDGp0bDk4xGWmtLgCe7
	0+Ui7p8h5+8X5BmNJ9jmhZfaeKeK8jO0MBvUVLwEJ+rM6huwDGUJ
X-Google-Smtp-Source: AGHT+IHpyTEe1TrHe47gTZXPkGk75LM5VZ7hyEDQQiwAcoNT5XWB6ynGaNHGpLQZAvTqmk2y0IXlAg==
X-Received: by 2002:a17:906:b318:b0:a6f:1025:8dd6 with SMTP id a640c23a62f3a-a6f60de60cbmr214725966b.71.1718380503578;
        Fri, 14 Jun 2024 08:55:03 -0700 (PDT)
Received: from buildbot.pitowers.org ([2001:4d4e:300:e::8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db61a3sm195917666b.85.2024.06.14.08.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 08:55:03 -0700 (PDT)
From: Dom Cobley <popcornmix@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH] fs/ntfs3: Fix memory corruption when page_size changes
Date: Fri, 14 Jun 2024 16:54:37 +0100
Message-Id: <20240614155437.2063380-1-popcornmix@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rework in fs/ntfs3: Reduce stack usage
changes log->page_size but doesn't change the associated
log->page_mask and log->page_bits.

That results in the bytes value in read_log_page
getting a negative value, which is bad when it is
passed to memcpy.

The kernel panic can be observed when connecting an
ntfs formatted drive that has previously been connected
to a Windows machine to a Raspberry Pi 5, which by defauilt
uses a 16K kernel pagesize.

Fixes: 865e7a7700d9 ("fs/ntfs3: Reduce stack usage")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
---
 fs/ntfs3/fslog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 855519713bf79..b3b83565365e3 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3906,6 +3906,8 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		log->l_size = log->orig_file_size;
 		log->page_size = norm_file_page(t32, &log->l_size,
 						t32 == DefaultLogPageSize);
+		log->page_mask = log->page_size - 1;
+		log->page_bits = blksize_bits(log->page_size);
 	}
 
 	if (log->page_size != t32 ||
-- 
2.34.1

