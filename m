Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E45625
	for <ntfs3@lists.linux.dev>; Mon, 12 Oct 2026 03:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774774; cv=none; b=LqwEQjdkUW+T/XmTBE+NHbeo4FbL+szwAHT8Dtsla7KTOeoQ6BV00mKxKw2rbOP3V0qnv3i4JC5JVAe7zTRhPDGzTXhMPRgXwm1199cnEhgWlBYlxCMF3tC0ibUYGPCojzCsdI17CeLMPhiVOfXJreUUitnZEcjEw19xdeCFBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774774; c=relaxed/simple;
	bh=CqRLrY7cBu0pfQpm954C5m+z2mDlO+62EotdTGqWiXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FBqVky209AZODXp4Y3wJZMp6TSebjUah8scwK2rBdPmXX70QKlD7Tw3fFqW0yz9p3/icSwf2jqyd9mAc4pL4XdaFoW/UB7WWYQCcbiuNF98dOI+OrjsG8JN6NrGQjB4WScyse6ev2UR0k/EBtS+DcGmIJXycFVPyalhxY3+hnfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=bdDoRVYo; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="bdDoRVYo"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917a20e9efeso22121506d6.2
        for <ntfs3@lists.linux.dev>; Sun, 11 Oct 2026 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791774772; x=1792379572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TuOPx6DZfe3I+EYLRPeS51iVBzZ3ssHWUrzBdEIqs0o=;
        b=bdDoRVYoAYtL0M8DM/T1xd+rbyguVYY94j0+LsXEvOlKSosnr7kIBsNnISisrynU8h
         Szxv1mcK7hoJnJvlQ7X55wuZlYqEOGDu51AaWDJhJAw43sIhyVwTS41dE55XQrtbRIP9
         mOwh7UR0Ev7LgM7FsewC/4NhflOtXDwRr+lUHQD3WS0hoK0WHjPfC0ZvmJlAi6PlB5L/
         5mTtBhocDMcMtBQLMEbnBIK3YnB+Tq1XquBfh0RvHFTYsNQnZYp8RDOV0cslS5lhsiqd
         umgJ08Fm+uYPN1HN7Y4clI3/Z/r5JSnugUntPK5RnkhW2+YxrhKSMiohnEZ8qXPnC56f
         OZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791774772; x=1792379572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuOPx6DZfe3I+EYLRPeS51iVBzZ3ssHWUrzBdEIqs0o=;
        b=TyEiWOTCaqAAL4Zk1iKzcu0I95Pnz/wjauUquhBBgDoSnATK2gsePxy9eZnZ4AHYlI
         fBMpIu++g+fGRfVfxp3zoRWWbxaGh4lU2tUvgsbYBd4RQV8pC/OM0M+wT12HV8NtAiLM
         zPqfUdwSwORF0DUfD90N/ZH8KKneqRAzLsrZbSirkjxKrJR0uCIe20RQDDSgdL4Hf4ky
         48mC3XDgvPnqdgITgpq4RmDcfWioyyFaFaiZ+5zEky62oCKRxMad4+KLTPblrAGO2P2g
         wnxPHsl/UT+YcFGasHbDGYkj+dXDc18EfozkJ2FmdvwknQC/MjOdYFSTU/lPUwlWJusj
         gzWQ==
X-Gm-Message-State: AFq9FYKJWqvUtsOBq5cxs1l0lEuo09EG1cfL02cZnbj76eu3giglKKBo
	fNYJN4Ix8L/2FR6wJATVs9Szon/9yPPfPXBu+JVvVhf25i3S+bPDu2DVIu2oh6Nrvyt9GyuAqIl
	wcROFrw==
X-Gm-Gg: AYBFou0LN8gMMu0aBW22wT/z0hFywUUMmwc/fhYVIjrOAW3G4ObVe3QYL7XyQkFyBkH
	t/qVWN1HJp/v7GkLCBNK6FKTdJK8RkFC3vq5+eocU7JgmSWS+6wyR9c7NrkEOTixThSc1S9n4Yo
	LycGltamU/++sOmAMk0vT10y/G9XmdB6mNFrwfZSlhujYhg8XmkyOCBI7ZQ3JEvqjZ7Db3juGfD
	GS7AgQ1A08KfERFTtaDVR4gLnosTM4yofZSfhn4i8yfXY+d6tPuy+rlWHMxyAiu8L9oihF78zNV
	VV1HVxcKNxX4wS1FtnN2eI1+7Z6RHb+kTSGBU+mVnAbz44oXIFGZQcoblwQ8D60CgJxeTP6jDaz
	n0PLDSPPThYYjZJGZpvgrfVNk2Y6gjkmALymdVyyFJJdZhqFsT1CvVRkVM0uBs7GPEN/3t/WPJE
	S58zKsmyvf2FIbQihUJdaQmrUuld1FwZtXK98VQyD5WUVlvoyOTRvBpHXj43+P5f5TlFI2NbcNJ
	kUm8Fju/aeqsY23YTH82w==
X-Received: by 2002:a05:6214:1d28:b0:91b:87cc:6d52 with SMTP id 6a1803df08f44-91b87cc7740mr14383666d6.0.1791774771901;
        Sun, 11 Oct 2026 20:12:51 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e80353sm84864796d6.1.2026.10.11.20.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:12:51 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: zero clusters allocated below the valid size
Date: Sun, 11 Oct 2026 23:12:24 -0400
Message-ID: <20261012031224.2237300-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
made ntfs_iomap_begin() allocate the clusters for a write into a hole of
a sparse file without zeroing them.

However, everything below the valid size is read from disk as it is, and
a write does not always fill the clusters it allocates. It can be smaller
than a cluster, or stop early when a part of the user buffer is not
readable. As of now, the rest of these clusters shows old contents of the
disk when the file is read.

For example, a volume with 64K clusters is mounted with -o sparse, a file
has a hole followed by data, and 4096 bytes are written at the start of
the hole.

Before commit 099ef9ab9203 ("fs/ntfs3: implement iomap-based file
operations"), the other 61440 bytes of the cluster read back as zeros.

After that commit, they hold the contents of a file that was deleted
earlier.

This patch will zero the clusters that are allocated below the valid
size, as it is already done when delayed allocations are converted.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
A test program is available on request. Tested on ntfs3 master and on top
of the 11 patches posted on 2026-10-09.

 fs/ntfs3/attrib.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 3b4ef15162da..49ed2b06e7b8 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1015,6 +1015,7 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 	CLST hint, svcn, to_alloc, evcn1, next_svcn, asize, end, vcn0;
 	CLST alloc, evcn;
 	unsigned fr;
+	enum ALLOCATE_OPT opt;
 	u64 total_size, total_size0;
 	int step;
 
@@ -1245,10 +1246,14 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 	}
 
 	/* Allocate and zeroout new clusters. */
+	opt = zero ? ALLOCATE_ZERO : ALLOCATE_ONE_FR;
+	if (vcn < bytes_to_cluster(sbi, ni->i_valid)) {
+		/* What is below 'valid' is read from disk as it is. */
+		opt |= ALLOCATE_ZERO;
+	}
+
 	err = attr_allocate_clusters(sbi, run, run_da, vcn, hint + 1, to_alloc,
-				     NULL,
-				     zero ? ALLOCATE_ZERO : ALLOCATE_ONE_FR,
-				     len, fr, lcn, len);
+				     NULL, opt, len, fr, lcn, len);
 	if (err)
 		goto out;
 	*new = true;
-- 
2.53.0

