Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4645E15748F
	for <ntfs3@lists.linux.dev>; Wed, 28 Aug 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837333; cv=none; b=ALu+c3LwUG+dMRmR5IKWljXBd8sQc2omcApGTLaqHmRnc2uFkCHpg73GJxwA4Rccb4ynxVGV6jDHjIDDP6ox69XuDPI3k7KkO+eaaE1mAw1Xifmilz6oEbMm2KkEZZafWqa4uSIV3JDBmIjvXgR9G/+kQD7oJGw47bZZdbmDa/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837333; c=relaxed/simple;
	bh=G0qFQ9oUEmOIvAA+6HRgAjEdV7UcjkbxDkfABWBdDRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fqLSkztcQBWCec3nFQMmI8tKjp3eoD3/BpNRi9vBt5lAh+mkIhh8aGJVYJnZ3ZIu3F/iJgc7Dj/Qtd77lOis+HF++Cu0vLdMcQbz4pDXMqM75Y1D7L8gDgphBcKuk0xzzgbsajEiIXhJBoJ0NffLwg70VQtD+74Qv1dFbn49xzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeKLHKUM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeKLHKUM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a868d7f92feso825826966b.2
        for <ntfs3@lists.linux.dev>; Wed, 28 Aug 2024 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724837331; x=1725442131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BQsCoCFEiSXVcRGxQXzqzuLe0usDHQdTEHSNrfC54g=;
        b=KeKLHKUMszAL6gSp0BrytBeZVHA5MHmGLqNT1Vspt+7E0jf3cIQcmqJPcNA+L3Uyud
         oHf0oemPPOkRb6PsDbblmG29qvtwpDFT8fF1cWFIjDilcAlblwA+nH/HPHnbJzCQy774
         U41HGl0PfJYwW2AJtqvK5YfJEunUI4wqU6NsDGImXMzpgXMPrEziFD/wchf8Cuf7itm8
         NvlC+J//FrxoxqXAOQRxCE64xrqTcjV9RenMJy1x/buApQvMPJdfhdESlwbx9dfwLGHV
         6VSWJGBWjdrsz0nauUUeJhR0gIeQumXuqQfPVJaXk8DkiFAx9rpdQKNCDmrzuh1gBwmG
         Y1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837331; x=1725442131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BQsCoCFEiSXVcRGxQXzqzuLe0usDHQdTEHSNrfC54g=;
        b=iOSh2jecvTN3MyQnD9D5+20xM+o4NLdyu97qUPcL8DhT+Dhi+7LXuK7Ae6tMiyAEAy
         RdpDrjcRy9JnGjWXTWXtQicLgC9xC52UukQRcS67e0fCHgiCjGw/00lOnox2YjV+Kqii
         J2fEh7pWt5RFc4IifrUffCSfnWKnsWPgzz5aKt5cnzUDY+n2SiDGL2UGfO4zKm5MrGPJ
         wQgOz7VdnnrXOxcVi2Zq9xMHhQEpSKdHR+lezQ64HqycpuoGzp+BrB+/kPXc7aIS5Z39
         fG3ImMXi40xDk2N9Ny5M9Fnly9uoWkT4fxFZV2u4FjVrPui5W7NkTtx7/JjgT1febqgV
         PNdA==
X-Forwarded-Encrypted: i=1; AJvYcCWCoksFagaqhOh4ni+4CvFqlB27LvpKL2IgKkp3pmY5tdJVQLiVEuMVuIEitxnRQDt1kEGX7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXpgL9VMggfj6Itf0U8uPjl4skJABrXjVS5fvnrj7J2Ac65rnb
	fWv+DCzCcn2QTt0VR+SJe8PJS6M8F+RDUuwRVU6dFXjvLr+qPMtQOjT45w==
X-Google-Smtp-Source: AGHT+IHsvmMmXLzi1s2aMB4wtmGpZMD6DO/nxH1hCgKa0l8kC5vSxDkMyu1GH+Mu5ojwuMpDIs9pjw==
X-Received: by 2002:a17:907:3da1:b0:a86:9d3d:edef with SMTP id a640c23a62f3a-a86a5188f43mr1083191366b.12.1724837330104;
        Wed, 28 Aug 2024 02:28:50 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549cb8esm219239166b.67.2024.08.28.02.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:28:49 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] fs/ntfs3: Fix spelling mistake "recommened" -> "recommended"
Date: Wed, 28 Aug 2024 10:28:48 +0100
Message-Id: <20240828092848.271137-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a ntfs_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 128d49512f5d..7c4eb9b61d4e 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1247,7 +1247,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->volume.ni = ni;
 	if (info->flags & VOLUME_FLAG_DIRTY) {
 		sbi->volume.real_dirty = true;
-		ntfs_info(sb, "It is recommened to use chkdsk.");
+		ntfs_info(sb, "It is recommended to use chkdsk.");
 	}
 
 	/* Load $MFTMirr to estimate recs_mirr. */
-- 
2.39.2

