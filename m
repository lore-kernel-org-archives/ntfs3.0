Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044E3FF1BD
	for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 16:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862871; cv=none; b=Ds7fhNp21RlBQzbnybJybui4uqmJlmShw6/C0ekd2pafuuKRqjpwsMhrXQv5lBgAlHr+actfMhXXTRfGjB9DPd8OxXl3kOY9Zt+jrHUMwscVTfxRGx1JRhHpxnb1IxR1651rpJvgqskTOC7BMj/O9S1kZgXMSRBX8wL6PjacBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862871; c=relaxed/simple;
	bh=xlcAFzQ5anxdBg4vLnjX9Kl2UmzhDPu4qRy1NeSloO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gl1j1yBKGAgX9kml+VT3UM2NX318Q/torukItGsM+dKNZOWv7j78MxTiML3s1ryfLmmkTiF+cd02wKm+wVGJWZ65ampGEGEOf2gbtn+7g1l+R7tuWrFGfe0N3z8+6DReFqzM8w/nuQMPeE0pvHhW9qebx1RfRjwQo21+N+93wMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZxnQIN7; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZxnQIN7"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9116861f004so6518385a.3
        for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 09:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778862869; x=1779467669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8oJHB857643S9JSuhJvdTYsAdyjAOzUqURlAvQ8IEs=;
        b=WZxnQIN7VZret/EnxEnYRwniMBvdBxjKmEySjyK5dljrLuegtDXUEvvBGGfoLyzHsr
         XMea7qRcYuB0eAptFuZOZAkS0Ak8OdIzCzf4Uan6eQ6BTuvYtr4bS6qPOjGMmprqjN9j
         jGrIBC2cn7taT5IaXmxcbjjvHldLIn2mYWba/hpytFQb1hkqP9tEpVGAa8dVagAV92QS
         AvSBeq+lIqI8KEi6CcgVRSnNKA8GBGstwDkXHXAmAZt14xyqu854Xf+jfEn+0ag3cp+C
         2WtXKPtqFwhNycCSzzTJPmmKx62DpdB53GRCx0h6zpkK1gnFLf8AJIubipog6w7gtpIk
         uf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862869; x=1779467669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8oJHB857643S9JSuhJvdTYsAdyjAOzUqURlAvQ8IEs=;
        b=mR4PtICHjBkRZNZQyLtB/Zhsh/3hs/9As7JKD/ErM3L1ZleWnuwQpAJ/CzHm7tfBtU
         VOYVdExzpw+DxmaocuXgMws7hM6Jkpf3ZgVLanYr3a2HyvdgUm7i95sl1SmGjKvQRGku
         VnbWtcdoZxb6pmV2Z4mmCQmRWqCuJP7G5F5hBdHUHtAQwCw/01nf1PCxwqKfJI9wNzcS
         D9Y8ExuzNu7Bm2YsugFPPAg6Nwg69amuRqlLYi4IhlaP3UlP9XvhkjZyKIfzVuEL7YcF
         h+PhyC9+bxCbW/QOoHNdN5iD2WsR12/3PFtAfem74O1WbS3h7ILY4up4ppi2ccqRmAJn
         yS7Q==
X-Gm-Message-State: AOJu0Yxv7YhwsTMme4fBwdXoC9UHjhsjbAMDsddWQbFMnuzLekKWX0Rc
	CN0ndmaoCDehoIE5lwFA7sS0CsnprGBI/1RApaQOzsA3+2p4sqWZ9DzI
X-Gm-Gg: Acq92OEcZkubm4/4WlEkB1GMcFcHWslOG0gBRhWIslxe/tIuu3rsWO9DHem35uMdxYl
	uyGn8NvmwfjH6nvMCbWEXzbZbBrstdDfe6iSbY9dPVwnUTqRIgbzOD0lsl+H+KUZvHPb2+dWB/W
	wucjkP2sYfzdnUbaIer9pxYjbPhWYqpGRZWS5bHrQ7OzlLs7aEipYE2pmzzwjRffLlMp6zMh8up
	rYdCLd9Og4dqOyv4QAkIPMuRv9lTah5gtuCpQ4qrFRzqkIjhYDVOXAKRcoKua+Xh3tQadS7ohID
	e+xoeVTnA8WOgRnAU9n51p5JpIdxuXAatXGyddE+W8kzLGh0EGU+G1tG/64pq19CMTPvFbpqmDI
	rti49q1eweCDWp2qMiB+r2Yerx8k2QmXwNptin5/dO6LhAYdym106vK2Ae/lC3CEd0+qdpqgGLz
	pOKdc8l08T0X7h4cwjwNv7ImzgSs5dONtUSF1Xx65GX4ThmZ9c9lZgPR75oyZBDxJHbS1S5VYrs
	bDySpd53/u8aCLfLfJPBm6VW7Qla8CGylPMcZ6884c=
X-Received: by 2002:a05:620a:6307:20b0:912:1:b413 with SMTP id af79cd13be357-9120001b670mr481513885a.15.1778862869007;
        Fri, 15 May 2026 09:34:29 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba1825dcsm585339185a.2.2026.05.15.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:34:28 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavitra Jha <jhapavitra98@gmail.com>
Subject: [PATCH] fs/ntfs3: bound NTFS_DE view.data_off in UpdateRecordData{Root,Allocation}
Date: Fri, 15 May 2026 12:34:24 -0400
Message-ID: <20260515163424.1575298-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
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

