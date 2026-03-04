Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020C396593
	for <ntfs3@lists.linux.dev>; Wed,  4 Mar 2026 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618059; cv=none; b=ik8CiyHL5pzOC0tfsMOftmg9noNPRHK2zOCduvOSnMn6yEbZ9toL346BcR/gXPQeOwqAfC6Y4o7GghEdAofIc6T+dEj5PFfYyyegmr40SJVHECosU5+okpWfUytpzJauL5eL4xuy44DIM/AJB+Zs2pgovuc5JhmLUoqKrDzjY2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618059; c=relaxed/simple;
	bh=KoeP/sSndgk3hzd/1RyRofRtko5Fxip2FmW++HU6Fbg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ylp1En99UYT01CF3QaZR5x7BtOqr592s2bVAfOb5b0kZPgMApxSjjgVDYaRuvwo/PTbkOamTwGv/1fHaOOfoOAK8VIFgX5RPo69Oan1uXzKl+0G54KISNTlMb4+ya+I1hdlLq2ES96E0FNt8AvkjT/2TwrzseF0kOfrPEYwEw2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=jE4b8F8B; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="jE4b8F8B"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 4117E1D40;
	Wed,  4 Mar 2026 09:52:30 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=jE4b8F8B;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3B870455;
	Wed,  4 Mar 2026 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1772618026;
	bh=QPPOmNDtA7oQx0JJ46Y5RIxEj2nWDwbzb2bdPOKzOy0=;
	h=From:To:CC:Subject:Date;
	b=jE4b8F8Bw6jNMNKPmAoluPRBkPhBp11CL9DK45pQYaTF3DIQUOZI6ak9AOk+qpGVy
	 764s1CLDNZPAHvDvLv09xFl3t4OXvh03MI1h5Lk4WxLONX2y/KXD+3TrFpjNPhVz2z
	 i14H8VuCUrQs+QXQYzsXtZzFYljcCChVFpqHR04M=
Received: from localhost.localdomain (172.30.20.150) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 4 Mar 2026 12:53:44 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH] fs/ntfs3: add a subset of W=1 warnings for stricter checks
Date: Wed, 4 Mar 2026 10:53:34 +0100
Message-ID: <20260304095334.4254-1-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Enable a subset of W=1-style compiler warnings for the ntfs3 tree so we
catch small bugs early (unused symbols, missing declarations/prototypes,
possible uninitialized/mis-sized uses, etc).

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/Makefile | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/ntfs3/Makefile b/fs/ntfs3/Makefile
index 279701b62bbe..53bf2c17ac28 100644
--- a/fs/ntfs3/Makefile
+++ b/fs/ntfs3/Makefile
@@ -3,6 +3,26 @@
 # Makefile for the ntfs3 filesystem support.
 #
 
+# Subset of W=1 warnings
+subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
+subdir-ccflags-y += -Wmissing-declarations
+subdir-ccflags-y += -Wmissing-format-attribute
+subdir-ccflags-y += -Wmissing-prototypes
+subdir-ccflags-y += -Wold-style-definition
+subdir-ccflags-y += -Wmissing-include-dirs
+condflags := \
+	$(call cc-option, -Wunused-but-set-variable)		\
+	$(call cc-option, -Wunused-const-variable)		\
+	$(call cc-option, -Wpacked-not-aligned)			\
+	$(call cc-option, -Wstringop-truncation)		\
+	$(call cc-option, -Wmaybe-uninitialized)
+subdir-ccflags-y += $(condflags)
+# The following turn off the warnings enabled by -Wextra
+subdir-ccflags-y += -Wno-missing-field-initializers
+subdir-ccflags-y += -Wno-sign-compare
+subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-shift-negative-value
+
 # to check robot warnings
 ccflags-y += -Wint-to-pointer-cast \
 	$(call cc-option,-Wunused-but-set-variable,-Wunused-const-variable) \
-- 
2.43.0

