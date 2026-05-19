Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB637E308
	for <ntfs3@lists.linux.dev>; Tue, 19 May 2026 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184337; cv=none; b=KgBhqIOZjFvtqLw7th6tN+xaCeqIyikz84TZkt0PaBeND8hhSzdeupykV4eW0yduMPG5xT9f47BMKEOnWnnC5uDgm96DiqCshYiWI0hrB988Ev8M7tTdOQijpuzTvaD5SLCN9cCAWYgD+GPzwOY71H1+u7l5kp4Mlu2mogeWiJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184337; c=relaxed/simple;
	bh=oj+KFARW3atpzddg8zMv78o7rWNm5zu9UJAVmegL0XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCiNjc8T3MGVCgWkfRCmEqD2nXjNPnV4rDXvji9cEm2+1okqiMepxTOVvPPbYk92z2uoeqXBnK6wVOx8mDcmYwLX0qrVmuYl+anMLzdolfKhdL2/udCcL/peiRg47aHOGGbQFXOpxhlRPLLq2tIFYYAbNba9Gqj1C2UoEVOvGes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxf58LGL; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxf58LGL"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so66545206d6.2
        for <ntfs3@lists.linux.dev>; Tue, 19 May 2026 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184335; x=1779789135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRCR11qUHaj3Qg7MbFr/xCdePGzcx00slw0JQNYdwuQ=;
        b=cxf58LGLExjNAxsA2CU/81oDh0XJRzL9W+EOmOtQgfHLKfcx/lSZ3rKOGAu6OO+9lM
         B0AY+1MYpvZQw9D5zxtO8i4kAA651UTFCI0VCK/G2ea3b0d8LmCAp2h1ulv1e7HcJgIk
         JUGdITwM5XGuIHvS0BSJPYNCKG0mhJdZjmdpSXcp7XKuGSo1ljuyj39dyi2ZjBtkMdrb
         Tq4UZCTxm8k/S/581Hv7/Y4yQbcXvz2X9u/Lzr3JvyV+zFBSSbO1FdTPz3NgCyztdmF9
         OHeTF/l/TIe/A+c1RWGRF6aEg1jdtlRZZlT27HdeQGsOmShCYkevG+Jhs8ADrJc34XfO
         dlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184335; x=1779789135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cRCR11qUHaj3Qg7MbFr/xCdePGzcx00slw0JQNYdwuQ=;
        b=CX8XMS5RRbRU8Zyv+99TLPfks1988JODytI208Du3H2JYPQ2SQSW/PEGd4fOIGfcQ+
         YbiddxsaK9JdNO0+0GsaPpCE90PsPCyhCq8u58j4aAIbDBhlAUHX0pA8da5JGU+/l0bT
         WtabvwOD27mG9iB05v5n965vmnJb+fmqQ5a14Fm2rMvGdMeL0YgZTJJF7UScqPGb7RWp
         p0tEM6Nd+eyuk3ET4lXL8HrTpLCAFLYM0oT3sTSYhGQY/PYUe7865+h2pYDFx5+usIvB
         T1UeLTC9ICR4cRpksgev+ZQvQWBNQCAvEk5t+YEbRTR8+1Lr16ur836OZ+pxIbfDbJTo
         O8Ng==
X-Gm-Message-State: AOJu0YxbVbK54zsZcaFnJ++uENKQdZZW1PTLRJPJyZQvH2xpy9plv+ma
	3FUnCPAKReYACbEf2LlDhCqH8b05EspLp0kQbEZh1Ab+qMetlSxS21K5
X-Gm-Gg: Acq92OGYAeGr8yAfE2PPBIFnGh89sc4yoRhuz0Bcrrj6JltLM+yuhT83TS+xWmMLkn9
	EYy2EmRJ4+upYoWU3vMc0UDxMB8/QZhxEBShIW1Y1sUcWAJcuxSgd8N0s+5etWIMz6txB6n+XaI
	o3eeD1lLH/F265MAXlq7WVzxqtco/TYEpLwRKQWfthhdnu34IUxh1OzYjj7a9lRJLmqHoiW32Ck
	rgSFZjlXf1ufsQj8jkH5xy/5MbyYLUonzEzwR7IyRdXg9RLCMvHMxRqkhlP+yufUBhM3B02kouF
	WDhoumGe8z+u/cN80pAeidBZblx18I4/jeoWZJektDjrVMH+V+sK5Bjq2bHAxRyMk0MsXOEPfeN
	snB3fjfsxwdHj2R71XaY/LE16oLhEnZeNpFYM10iLyFhzPkRi4S4aPRWhQZS98HyPhjEzndnwrb
	jJoAwIbibyQm/hHol+QvXh94dsZ4K9KqUANAuCWTs0M8ch0O/q/j4FLGYAbPpwh18mb23mHLqWs
	iZjJTy5om+fPf2wbRgZ
X-Received: by 2002:a05:6214:4e06:b0:8ca:1dd8:10c with SMTP id 6a1803df08f44-8ca1dd803bemr234592946d6.30.1779184334701;
        Tue, 19 May 2026 02:52:14 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3619c7d9sm84697036d6.36.2026.05.19.02.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:52:14 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavitra Jha <jhapavitra98@gmail.com>
Subject: [PATCH v2] fs/ntfs3: bound NTFS_DE view.data_off in UpdateRecordData{Root,Allocation}
Date: Tue, 19 May 2026 05:51:35 -0400
Message-ID: <20260519095135.1609973-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515163424.1575298-1-michael.bommarito@gmail.com>
References: <20260515163424.1575298-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

In do_action()'s UpdateRecordDataRoot (fslog.c:3489) and
UpdateRecordDataAllocation (fslog.c:3697) cases, the memmove
destination is `Add2Ptr(e, le16_to_cpu(e->view.data_off))`,
where e->view.data_off comes from an on-disk NTFS_DE inside
an INDEX_ROOT or INDEX_BUFFER.  Neither case validates
view.data_off + dlen against e->size; the existing
check_if_index_root / check_if_alloc_index helpers walk the
entry chain and validate the entry's offset, but not its
internal view fields.

The neighbouring read sites (e.g., fs/ntfs3/index.c when
iterating view entries) check view.data_off + view.data_size
<= e->size.  Apply the same bound at the two memmove sites.

Reproduced under UML+KASAN on mainline 8d90b09e6741 via
pr_warn-only probe instrumentation: with view.data_off forced
to 0xFFFC, the memmove writes 32 bytes past the end of the
NTFS_DE.

This is similar in shape to Pavitra Jha's 2026-05-02 patch
"fs/ntfs3: prevent oob in case UpdateRecordDataRoot"
(<20260502105008.21827-1-jhapavitra98@gmail.com>) which
proposes calling ntfs3_bad_de_range(); that helper does not
exist in mainline.  This patch uses inline checks.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Reported-by: Pavitra Jha <jhapavitra98@gmail.com>
Closes: https://lore.kernel.org/ntfs3/20260502105008.21827-1-jhapavitra98@gmail.com/
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
v2:
  - Add Pavitra Jha's Reported-by trailer and a Closes tag for
    the original public report, as requested in review.

 fs/ntfs3/fslog.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index acfa18b84401e..127860fd2ab50 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3497,6 +3497,18 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 
+		/*
+		 * e->view.data_off and dlen come from the on-disk
+		 * INDEX_ROOT entry / LRH.  The neighbouring read sites
+		 * (e.g. fs/ntfs3/index.c) check that
+		 * view.data_off + view.data_size <= e->size; mirror that
+		 * bound here so the memmove cannot reach past the entry.
+		 */
+		if (le16_to_cpu(e->view.data_off) > le16_to_cpu(e->size) ||
+		    le16_to_cpu(e->view.data_off) + dlen >
+			    le16_to_cpu(e->size))
+			goto dirty_vol;
+
 		memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);
 
 		mi->dirty = true;
@@ -3689,6 +3701,12 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			goto dirty_vol;
 		}
 
+		/* See UpdateRecordDataRoot for the rationale. */
+		if (le16_to_cpu(e->view.data_off) > le16_to_cpu(e->size) ||
+		    le16_to_cpu(e->view.data_off) + dlen >
+			    le16_to_cpu(e->size))
+			goto dirty_vol;
+
 		memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);
 
 		a_dirty = true;
-- 
2.53.0
