Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917B2F5313
	for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862853; cv=none; b=dUVioQ2H2Ttce9TUKFiA7tY60nou2HVoyJtW7C/S6AX/jNbwsNF+AEU/f6RGe/LPl+FWlP3k2i1s8QMxLGyepHj2XYDzZ7jqI+Ojcx+YoK6VwdPTf+WjKbB6XQpZHNFFmXfOwW6Taw+0b5XctMiRqI0gUiuPoTwdjtWP9/EifHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862853; c=relaxed/simple;
	bh=7Df2gMCwHySOM5tzzLwMPrmlUXYyTp68cLZgj5pJeVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COzisPX/lY2Yjyk73oGnAfd7aTtVqY6LdqCHXh1ZyXUp2cM96h60rQ0fQ+IIJ2sANeV/6+FkvGlnlOYQlV3NQlqMTjz14SaQXnRECkcptrDYqLogn7mr7Wz6Ln3DZAnK9rIO1V0SwRVPyKSWG+WmTE7NshSoK5U/z878LhTqRrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CG0BscR0; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG0BscR0"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8c92737a8d3so13836576d6.1
        for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778862851; x=1779467651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6NAfPYKbFnWXLt9agv/gcIEWKO0+qxbRSgNKDk/o5mk=;
        b=CG0BscR08C0UXmP40D79Ixt3kqUNfE7wrm8TVclvnSHjuG3c/FvWLujOXEWcz6/h+c
         eI6uFo49ZXq3fgXAK054f/yiUNzFDhwlmVoJWM+jI4VnyljqCmzalXkqnQtfKLVRThaj
         hAmyX8pf/DQUCoePqiduGHxsObelPbE921RhDUGlqHqg06/avWMeD+tVE7jTHR29Tqm0
         SGU9zOZwGfJ+mPNfWIeD1A3qLCzFDT1G4EIbpIpSj8GrTZ10qagKSvuH7RDfViSd/djQ
         gjMdVHCBJgsvavixW/Vgo7YUUXCSZH9ISkjqkvWP/Hsqvc6Jbv19hX2HsteGfRMeUtrR
         7iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862851; x=1779467651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NAfPYKbFnWXLt9agv/gcIEWKO0+qxbRSgNKDk/o5mk=;
        b=Zve6ardEvA+CEV7betndHrIjWHsCxCoiCwKjGBcrNlnrv2/PXoV20GEinfPXcwFjE9
         z4+BQVCk4Ta3imxuXUgUyEPMz5hzXHJu2pxbYlGE/s3lIMWQ/ZpQb1yMzZufVSH1qmeK
         yQOJyLFUFPHn2vW6vJYd67TQwZaO07qULMmlAdXzmasod0yNQ5c0yCFeoBpk9yD0kIdv
         pTMakW+wh5+LfomIVtcmSCUiBKPI77SZrGa1id6D5LpDZF1dhd8kb8kJxUqhTBnFZXbn
         twb5lll4sa8I13N5B2QoUw0ar29n/COibVwgocMKYo2/axbweWH3qK8mJODeFRm5sQu0
         rlGA==
X-Gm-Message-State: AOJu0YwNDyWoahz3vmVHUPt7iDGNNAXxxzNLxm2E01tSh+y80R8yOrwT
	UecGDclvYlXChmLjLfYp24CFS/xOOHWH3LyOuZuiGBiinPptoonLb2N6SKwvpnmT
X-Gm-Gg: Acq92OE67RyzLYPFfMqSSqMQX2Nhz1gwGrW3p26Z2pu+XmOVpC9q7vrxV7fMLDy5HBY
	EXkjPKK6se301VzRBB3STpHmSxsL9idDupUyl15u/cHQILesU257IMLAIDUvK34mDwnpi89Tcd/
	E/4DiO6IGzIudqNoqjd5lQ+i/hWyk+CEH+Zz845klYPsSsRcDE8oa3ItMi4dhrEmamHj5uQB5Z9
	9TNMs4an4Ce9Ag0EK0PJFSh47HmtW7BhcUQU1wk0TuxQr5pq4ZBK8vv58rkfYQjasv5sM67y+i1
	v2ylvTV9juiXAVc5oR7lJdwrLx7wN9gV/mRSUtLR7Qz63jTHrt4Vv+FcExtaHdRaeqxq8ZxzYzN
	2tQMK8pcwDj93QDSu8uzBfp2PajOVCxtxLCBxkP7IDn7AKfPuNv7g+JTP0oLk6pnwY0mn1dTELM
	OwuwR9HAeGe7BrpGZVd1YM0Ey6CtrnhvRvruhLs/sGeDgx22vdrxn0MZqvJhPhdsds9QneIBlBu
	DvNaSkmsTVBYySIOQh0xkKqwFXIcsW9im6Fw2sTqXTHnpBXDi0OAA==
X-Received: by 2002:a05:6214:4384:b0:8ca:174d:187a with SMTP id 6a1803df08f44-8ca174d1b42mr42827216d6.15.1778862850633;
        Fri, 15 May 2026 09:34:10 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90874e4besm55861956d6.2.2026.05.15.09.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:34:10 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] fs/ntfs3: bound copy_lcns dp->page_lcns[] index in analysis pass
Date: Fri, 15 May 2026 12:34:05 -0400
Message-ID: <20260515163405.1574574-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

In log_replay()'s analysis pass, after find_dp() returns a
valid DIR_PAGE_ENTRY for the (target_attr, target_vcn) tuple,
the copy_lcns block walks lrh->lcns_follow further entries:

	t16 = le16_to_cpu(lrh->lcns_follow);
	for (i = 0; i < t16; i++) {
	    size_t j = (size_t)(le64_to_cpu(lrh->target_vcn) -
	                        le64_to_cpu(dp->vcn));
	    dp->page_lcns[j + i] = lrh->page_lcns[i];
	}

find_dp() only validates that target_vcn falls within
[dp->vcn, dp->vcn + dp->lcns_follow), i.e., that the FIRST
cluster is covered.  The walk through the further entries is
not bounded against dp->lcns_follow.  For a malformed LRH
where target_vcn = dp->vcn + dp->lcns_follow - 1 and
lrh->lcns_follow > 1, the i > 0 writes overflow the dp's
allocated page_lcns[] array.

Add the missing j + lrh->lcns_follow <= dp->lcns_follow guard.

Reproduced under UML+KASAN on mainline 8d90b09e6741 as a
slab-out-of-bounds write of size 8 from log_replay+0x68d4 on
the mount path.

This is distinct from Pavitra Jha's 2026-05-02 patch
("fs/ntfs3: validate lcns_follow in log_replay conversion",
<20260502154252.164586-1-jhapavitra98@gmail.com>) which
addresses the separate version-0 dirty-page-table conversion
path's memmove(&dp->vcn, ...) call.  The two fixes are
complementary; both should land.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 fs/ntfs3/fslog.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index acfa18b84401e..f409611f2530d 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4547,6 +4547,19 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		 * whole routine a loop, case Lcns do not fit below.
 		 */
 		t16 = le16_to_cpu(lrh->lcns_follow);
+		/*
+		 * find_dp() only validates that target_vcn is the first
+		 * cluster covered by dp.  The walk through lrh->lcns_follow
+		 * further entries must stay within the allocated
+		 * dp->page_lcns[] array, which is sized by dp->lcns_follow.
+		 */
+		if (le64_to_cpu(lrh->target_vcn) - le64_to_cpu(dp->vcn) + t16 >
+		    le32_to_cpu(dp->lcns_follow)) {
+			err = -EINVAL;
+			log->set_dirty = true;
+			goto out;
+		}
+
 		for (i = 0; i < t16; i++) {
 			size_t j = (size_t)(le64_to_cpu(lrh->target_vcn) -
 					    le64_to_cpu(dp->vcn));
-- 
2.53.0

