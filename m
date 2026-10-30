Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350401;
	b=WgJbdoevM9oAbU4qVDN4oLA/F1zc0tVZVweqxneHj1O7PQ8i8MCS1OsewqcAxJSOa/r1
	 OnQGQWKvcPTx3WORDCHlSYyqEi0+4D/Ag/jxP0e+7kyJg28XYOXxVIjW1ZzSGmnMKPCeA
	 iKAzqvQD/O5DtFq78GjHPrvKUQYvOVuFN11G6UdGJTdv6mv8JjRqla3IiGWhYpUEmGvZW
	 bPjWa7RlTQEvf2W/6KXA5JOBJYvCNstVPw0lTgOqhQNmKoEGAYV8GDLEjy0oXatV8FkzN
	 wCZ0YLUhJ6QEcAEXxE5FrSdZbzS68FKZDZQqv9+F6Idx+0NV9BgcFtmqXyzRBqMfFXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350401;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KOWLgTTNF56L+ttK/sHSbzAGSYyGQRT1y5BH1OOM+sI=;
	b=YN3IFJqpcRdU2lK4EVC3fdy/tHSgDv9+uljGMQc5Z25jY+QdDspZfgp0BKK3IPOWdXOL
	 ZJIvZjvbjjNfXE+foRT4qpHc99Ym/zt952X+nWefY5ZWx8vzxqSDCNlyUyj46WwaAI1o4
	 5wG8Rsrek5xKFr7AZx/N6IbTHj+ksIMf5odTzItrrhvnSttg37CqAxu8zCBbfUor3j6Cu
	 aiUA7Ok+vSQwzbSUswATohgE87fc404/S7VzKRU3yhjTDD3y1bXZT1jKXuPbJFrgLm9dY
	 iqDxBW+lk55i6OER01wW3N39eRQ1K8IrBRgyZ3zx7Qw3FDOMTOFhjZ6GbcRR4hPNB6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vqlrnKlc;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A3C606A320
	for <ntfs3@lists.linux.dev>; Fri, 30 Oct 2026 08:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A3C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vqlrnKlc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vqlrnKlcMUGQL9YtFdWW/LLvN5QB4qq2LS9Wym8oEtfgVtnN/PoyKzq0x8SFQwyuYlWpkkjRNzeqL
	 Brx0JwB7TVYzOgeLwucIyNNHBnXNzrVdhenUYW+glc4pgU7A+ME94SwhvTAZUoq6cAMxSvnsmZ5MS3
	 aMEQesdVllSM7/m4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96ae45afc001-78b2b;
	Fri, 30 Oct 2026 16:53:17 +0800 (CST)
X-RM-TRANSID:2ee96ae45afc001-78b2b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86ae45afb1d0-5759e;
	Fri, 30 Oct 2026 16:53:17 +0800 (CST)
X-RM-TRANSID:2ee86ae45afb1d0-5759e
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] fs/ntfs3: Fix memory leak of ntfs_fnd on corrupted index root
Date: Fri, 30 Oct 2026 16:53:15 +0800
Message-ID: <20261030085315.1814-1-laixiangwu@cmss.chinamobile.com>
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


