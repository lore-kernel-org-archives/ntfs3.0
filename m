Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569CB400DE8
	for <ntfs3@lists.linux.dev>; Fri,  4 Sep 2026 06:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502564; cv=none; b=Mq9E4vUe7GKldpt0gOfA40k3kB6rHUHNPL002JBkNZNzlaogEf3vd5zFTbjHD4mevZo2xXce9M6u9UQM90SCQTSDE4iJABeEXiCWDfkbaOip8my1sxQxy5HWp2N/kDebNLH9qouFT87E6DPUWGOYQGtMKw7UB/t8N4rmLax0kRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502564; c=relaxed/simple;
	bh=d+XQMxfmtF37dFBwLnZYYwWxlVcCUb15+TV0NlBbmF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bbUGFmMFfJPwI94AJsDW0T7X7HVXBNDd8rBZ72cttov5km52hspg0W/KlI+1X/X27t7oQkbCy6xEF+KI5GiYFQ0jr8A1g++LsIjsXVmUxanEDw44NIzr7jOMRSPKvkjhQ10yINAa6NiHnIzrm1I9IKglKkK1Pc59ZF3eacHyCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpEdjfT8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpEdjfT8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso517755b3a.0
        for <ntfs3@lists.linux.dev>; Thu, 03 Sep 2026 23:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788502562; x=1789107362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KbzS92DGnEavUtbT3swzYfSA4NDGZ/nU8LrjJMa9/B4=;
        b=BpEdjfT8uhulXgJ4N/LME3+KqVyayPQiA8TMdIRJ+RNjA06ywwxOp8RXmvGsHMuG5h
         oJQTLnF1sjX9ycXvdQ0sShK4D48VYPdDMdV3Lmhcbh+3tPzSJ0oWwhxYNQ+Zxb5g4XkH
         zRH2Wu8hhcboRtd0BFAYbNbZCxnTbSQgltRhHx4WUbmfcyrKeKoqYeniGyKOP5tzv2L8
         UQUgv1dOg/cNGntcRZn4qCC9iO2dmmblbuKJy8DI9WVIO0mPvy7JRExkPGqE5qrSXUmI
         RRJvXHBTaAscdmu9tvOjuu2hqZ7IncvlrfxnggXPMC9X8GNUwd6LiiKRMF/edcjBJrYD
         EqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502562; x=1789107362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbzS92DGnEavUtbT3swzYfSA4NDGZ/nU8LrjJMa9/B4=;
        b=Pc239LcUpf2KFyzwo3ksYQ91ytl7r7tpv9agGt27xdMSipnCfrw4kotc1BhwlM8sm0
         DczEW5DxN8cVSgMjpBbLaNpMEWDXc25WRkWtyi8bx/abCNEx6s8LvauJGtPAI6voMs2h
         upNgmxtPj2Ja7wSTgfvfQMP4gy6v0GLEITwUzYyx363lV/qgi2DKQ0Yte2FR8w1rhoLW
         xGSsIqQKbkXZ2J1bTe/X85iBWQrFdZA1cCT5R0VBlk3FmeSAXJfqqeNxdjIXJgsRPQ8y
         AvII4MXaB0bhxiso5JI8sg0yThv8uKwM2ALY4buimh7c7v8bGiuiFasiaFfugFppvhjx
         1kRw==
X-Gm-Message-State: AFuF++k/4f7X5zS3M9Yd5AtPWEMFrN/vgDs6nW1K0ph7K5Xkklwap10C
	k72WtgP3lEgGzHJh4611X3iprK9tNnuxyDUhndd1/sN8hrBM5HLmw734
X-Gm-Gg: AYBFou2Thymd/jsgZqiXdyZbzfNSlLVqZMcXU8mOaXTiOIvhUYAOzVHFhmZPVNMOV6v
	j/QAxtYlY83dBCiBt3XnCtnt+ptoddPSd93JAn21XYXE/jPIozeqDCP+tmlPfzJntOzMEYnC1tw
	yaI+P488k2ViJhtebDbLMnt4HRwku/V2TkfxMnfjFV6/Vb+OiFbuUBLXV0b40+pNm3OZUih44Wx
	0GphIEfGzjNuiplfw2XcXhUhZAx2pzlgFeFT8tu8IRuh9eQSNVLEEuCqNy+X5RBXwn7PilVDOdb
	Uhkz+faeXKI1nTrSnewq/XU5kw9IPVwhPvzT5VlqPQKGzZ4NXQ90eSpHZ7LggyKq1pf7Eo9l/nM
	WB9wcAkcHWN6/wkyDwPcri/6prkweHzEoxcSIM8CedgFRtcE+ojWr82PYK1FYphHyWrXYXxbpaL
	j2KkUwwPFt77P8f46iS3AR7xSkEFi673OVNVFG8D62KzAIuAQCup98h96ZGAtvdyx0w3em0+75n
	o97T2E7O3c=
X-Received: by 2002:a05:6a00:10c9:b0:845:363e:12d9 with SMTP id d2e1a72fcca58-861660e3dacmr5209555b3a.3.1788502562476;
        Thu, 03 Sep 2026 23:16:02 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615332dbdfsm753216b3a.42.2026.09.03.23.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:16:02 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH RESEND] fs/ntfs3: fix valid_size not being updated in attr_allocate_frame()
Date: Fri,  4 Sep 2026 14:15:56 +0800
Message-ID: <20260904061556.939195-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the end of attr_allocate_frame() the on-disk valid_size is meant to be
updated to the value passed in via @new_valid:

	valid_size = le64_to_cpu(attr_b->nres.valid_size);
	if (new_valid != valid_size) {
		attr_b->nres.valid_size = cpu_to_le64(valid_size);
		mi_b->dirty = true;
	}

but it writes back the old valid_size that was just read instead of
new_valid, so the field is never actually changed even though the record
is marked dirty -- the intended update is a no-op.

ni_update_parent() spells the same read-compare-write out correctly a few
hundred lines away, storing the newly derived value:

	valid_le = cpu_to_le64(new_valid);
	if (valid_le != attr->nres.valid_size) {
		attr->nres.valid_size = valid_le;

In practice that path, reached from ni_write_inode(), re-derives
nres.valid_size from ni->i_valid on inode write-back, which normally masks
this, so the visible impact is limited.  The assignment here is still
wrong though; store @new_valid as intended.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
No changes; the fix is still needed on v7.3-rc1 and on the ntfs3 devel
branch, which currently points at v7.3-rc1 as well.

v1: https://lore.kernel.org/ntfs3/20260701061451.385659-1-zhanxusheng@xiaomi.com/

 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206ffa..792838676352 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1995,7 +1995,7 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
 
 		valid_size = le64_to_cpu(attr_b->nres.valid_size);
 		if (new_valid != valid_size) {
-			attr_b->nres.valid_size = cpu_to_le64(valid_size);
+			attr_b->nres.valid_size = cpu_to_le64(new_valid);
 			mi_b->dirty = true;
 		}
 	}

base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.43.0

