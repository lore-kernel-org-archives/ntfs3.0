Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D7B3128CD
	for <ntfs3@lists.linux.dev>; Thu, 25 Sep 2025 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832689; cv=none; b=iPWW2qb6/88pJ5K2rEfQz1FlAhSgoqFVgy1OgwJoZCwwZhT4fAvxAdZL7Vp0Ovs6hRXbNR71ucqWhC1ZDl1f6VyXU5BrlxNWlz9l++HZyoJaEjTteUE3uIV+uAXgqkjRM47PY/pa3665x94vm1+DrIX5lFcSIldhJQXlnIOwdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832689; c=relaxed/simple;
	bh=gyNOq+vjfFASVKnd7byhOaLzYQarFIGc/atZTUlby8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4a3d+VjRYA7YUttPy69+Ria33067jSkBSFXHp76gWy/HF81ca0Kr8rS9787E1ooiQ1Tm+4OgbepEB435XLNlwX0EhkXZNCb6YYLMvRJD1NdcCeMdAMoIJZb4gZMqFx61KnngcSMW34+gR8iX8eiO2FIqtFu4M+mfFWgctaSmvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJMjsO6q; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJMjsO6q"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-78eba712e89so10605236d6.3
        for <ntfs3@lists.linux.dev>; Thu, 25 Sep 2025 13:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758832687; x=1759437487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/3obq1lco9YVj92DdZN2mSKLWVBc5lwf9ZWKpWyI424=;
        b=DJMjsO6qWzP6Q+pXEa1YFkG7NJ8bX7JZ8eWdfCHn8fD3deFFruIx5fpo+gOOBxRJFw
         t2BjoCRtv1b27bHHyj20/UwAs1nnEwfItAGI14cZ2ycWdi339wf7yRsq0W5nfYdGbbEU
         74/FOWv4K1J7hNSgiPRGjMn5UaDr/jUG6zKrzki0SE448lB6CaGY30tfWEVVAA5Cyg43
         8lCGCeAAHlAcNAas3DKMOY1Yp09L1UDBi9Bvzbh+E3VZSFGDRCkDnH+vtxQS4o8jqipr
         yUZvPSkHX26O7buX5H5M4nVrO7cgwiA5AOYjhjjD8OvznUH8PalMP61guapbZyKxtY+K
         5uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832687; x=1759437487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3obq1lco9YVj92DdZN2mSKLWVBc5lwf9ZWKpWyI424=;
        b=IkBTLGR/o+taprZtfQzUfTwOSDKolUWiW06Ms9vFosVq1TcaIGJH8HkZNaYkM4P8YK
         5vaUMtF6k7+oxE/hZFDn/BFHlm00y2EOdt9/GzfZeninR5edfu23PHZk87eTbCfTgoQk
         lgHhYfobyeuSZiCGDRxxcZENmhevYpX0QigPsHNteiHrBHMSyq1WcViPyjaVqBhkelJP
         upSb2Kgt+OpkiGTREosa5DBKaNLDerJSxCXY8w9ZWD4k54hSZwKciYeKuBKMZ+zrak26
         eYZzIMCflhUmqL8WLvEr2ddkKDGdQlJP0Rp+QPzX15WWVARx5wZE2ZPvVpezeEnQOyZP
         SUlA==
X-Forwarded-Encrypted: i=1; AJvYcCUqpJaV4VixH4ArKyZPHsoBgYWnvV4FYb9RET+Q3pPtdh+53HT1jcb9PQ906Do5udHMbezi1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YytoHNw6C1cWg9zR2hVO6+2MjGPihDEBabKBMKwY3uDWNPvuu84
	hQd1DbQuUxFF/8KAXZNdy1nmsrST2uiL3lGcQ5LlghDk3zbrUog2IHdO
X-Gm-Gg: ASbGnctpz74rRlQuEoM3LjLwXV0FU8vT4iaZlGYagYGrFYUeT3Gt5cDmd1mPP5vsQEe
	U4tuKSnPT9Be5M3E34X0l8mLM+THq9sm0W0NWEKM1CuWvN9M1CEa24YhvFqBtHOcj1d7IS8PhsV
	3hj+HPzR5pN2Mdg+jgUntRq93x3cvghpCY6J7olVbRr8qzRIz9NRxWRjV0lyEurmvkBbSWoZkVS
	KfjWq3oqP20hdLbvqcLTZT6fPrfK208dLiX6XT9CYzz/zMd40COV7JHT42JU/ouO7OqtFY2+kIJ
	vEQtMA+bKCsq6Os9nQfxqCy0vN4h0PI1MXqRkc9hBQC1vzbCBlDK5bv3yaDbCTjwry8VAhO7YDm
	fdADUBEF2iclIIDNeIC96/lywBv+tkBeaOaWboal6m9U=
X-Google-Smtp-Source: AGHT+IHbYhfGDjyNvmvJZMKZPPt40kN0VMaibW2U8d0/Cl6QStbX0UHbkCPSSEtNvMQu3xpUc9rC6g==
X-Received: by 2002:a05:6214:20a9:b0:726:91d:bdb8 with SMTP id 6a1803df08f44-7fc45172a40mr80850616d6.55.1758832686606;
        Thu, 25 Sep 2025 13:38:06 -0700 (PDT)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8016cf8f949sm16430056d6.54.2025.09.25.13.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:38:06 -0700 (PDT)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com
Subject: [PATCH] ntfs3: fix uninit memory after failed mi_read in mi_format_new
Date: Thu, 25 Sep 2025 16:36:59 -0400
Message-ID: <20250925203701.223744-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attr_insert_range() called from ntfs_fallocate() has 2 different
code paths that trigger mi_read() (which calls ntfs_read_bh).
If the first mi_read() -> ntfs_read_bh() fails with an IO error, it
leaves an uninitialized buffer in the buffer cache.
The second mi_read() -> ntfs_read_bh() then uses that buffer,
where we get KMSAN warning "uninit-value in ntfs_read_bh".

The fix is to check if mi_read failed in mi_format_new.

Reported-by: syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7a2ba6b7b66340cff225
Tested-by: syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com
Fixes: 4342306f0f0d5 ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
 fs/ntfs3/record.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 714c7ecedca8..98d2e5517077 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -431,13 +431,18 @@ int mi_format_new(struct mft_inode *mi, struct ntfs_sb_info *sbi, CLST rno,
 		seq = rno;
 	} else if (rno >= sbi->mft.used) {
 		;
-	} else if (mi_read(mi, is_mft)) {
-		;
-	} else if (rec->rhdr.sign == NTFS_FILE_SIGNATURE) {
-		/* Record is reused. Update its sequence number. */
-		seq = le16_to_cpu(rec->seq) + 1;
-		if (!seq)
-			seq = 1;
+	} else {
+		err = mi_read(mi, is_mft);
+		if (err) {
+			return err;
+		}
+
+		if (rec->rhdr.sign == NTFS_FILE_SIGNATURE) {
+			/* Record is reused. Update its sequence number. */
+			seq = le16_to_cpu(rec->seq) + 1;
+			if (!seq)
+				seq = 1;
+		}
 	}
 
 	memcpy(rec, sbi->new_rec, sbi->record_size);
-- 
2.43.0

