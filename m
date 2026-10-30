Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349940;
	b=ZvjCdWbsoiJaSNOIOInaijtTVJ/Nll8oCfY2/hstbQ+ZrZ+N5zg9jNS4O4ECoX6IeEYZ
	 zo39sCvlJxNL+o5kuJbEgnPuJbPydPxDuvC9w2DxS09g1rp57txcl8P3uCv8FD/hXc8eK
	 GbDu/TfLuBXV4bxT6UJcbBqdDNtgLjBbjQ/Zc4W5fWRoIiTwDjDd/pB7MuE4QPKGMO19z
	 s9X834v+ZKNbFhzvvi1fWMJWgGvWh6uJ0jS1JqP4l7kPhaFvOqYd0P+lBLIv8OzouX3DF
	 3TEUXGuSPo35NuZMTKGZ3wllrJo8EAwfnTVKFJ4IjO8pqUBjtRgdTmtYZ5cXHceMLNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349940;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KOWLgTTNF56L+ttK/sHSbzAGSYyGQRT1y5BH1OOM+sI=;
	b=Y4G7ZyytBz7cqU3D4eOT8MkBP1HOs87y/9VTePZz81mOd/tE0YXgM1+OxzhZsbLuGmxP
	 xLG/1BAJgVr8KehEEwfYmfXPE3qszNS+1xB0wg9LOEJiGFcv9gnho8hvpUOM0qFGmY/CY
	 ALb3b2GGzCxMwgouYrrkeAp/6Edaro84QFuizSExMweR05RHjcb4THsOp7UQIGN/KK5LH
	 1hgjlFG/ojyiYAZFvRnMTQfOXhfVGzi1qrryZtZ7SrGLMnHsmXpOVZLJ/BqVsqL8j0Glh
	 ETbmT8P8V7/o3M/TnDqlZ0bDZzgLLHHjPZmGXSsWZJvj0yM2GB9YSSut3xGB4r1UrMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=o0L1NIFX;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28A0606A31D
	for <ntfs3@lists.linux.dev>; Fri, 30 Oct 2026 08:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28A0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=o0L1NIFX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=o0L1NIFXpelSbCkoJUycPd5LABJVAZgjzv4wkfnezexDTMWG8pbYaAQP2qg8L5bJjDFt4flhCUnRX
	 juaco6gaE1SkPnsIWV4QpWfJHLD7O6V1HIXhS520kmC1REbXDc24++/6z6OSslsxud7kFshVmSo43K
	 p+maDsZ9KurtYwHo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66ae4592dd0f-40184;
	Fri, 30 Oct 2026 16:45:35 +0800 (CST)
X-RM-TRANSID:2ee66ae4592dd0f-40184
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16ae4592d047-57447;
	Fri, 30 Oct 2026 16:45:35 +0800 (CST)
X-RM-TRANSID:2ee16ae4592d047-57447
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] fs/ntfs3: Fix memory leak of ntfs_fnd on corrupted index root
Date: Fri, 30 Oct 2026 16:45:32 +0800
Message-ID: <20261030084532.1748-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

indx_insert_entry(), indx_delete_entry() and indx_update_dup() allocate
one or two ntfs_fnd structures with fnd_get() before validating the
index root with get_cmp_func(). If the index root describes an unknown
collation rule (which can be the case on a corrupted or maliciously
crafted image), these functions return -EINVAL directly, bypassing the
"out" labels that release the ntfs_fnd allocations.

Since the index type and rule fields are user controlled from the
mounted image, every operation on such an index leaks the ntfs_fnd
memory and can be repeated to exhaust kernel memory.

Release the allocated fnd structures by jumping to the existing error
labels instead of returning directly.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 fs/ntfs3/index.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 689712d34..9b6f410a5 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -2049,7 +2049,8 @@ int indx_insert_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 	cmp = get_cmp_func(root);
 	if (unlikely(!cmp)) {
 		WARN_ON_ONCE(1);
-		return -EINVAL;
+		err = -EINVAL;
+		goto out;
 	}
 
 	if (fnd_is_empty(fnd)) {
@@ -2406,7 +2407,8 @@ int indx_delete_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 	cmp = get_cmp_func(root);
 	if (unlikely(!cmp)) {
 		WARN_ON_ONCE(1);
-		return -EINVAL;
+		err = -EINVAL;
+		goto out;
 	}
 
 	/* Locate the entry to remove. */
@@ -2787,7 +2789,8 @@ int indx_update_dup(struct ntfs_inode *ni, struct ntfs_sb_info *sbi,
 	cmp = get_cmp_func(root);
 	if (unlikely(!cmp)) {
 		WARN_ON_ONCE(1);
-		return -EINVAL;
+		err = -EINVAL;
+		goto out;
 	}
 
 	/* Find entry in directory. */


