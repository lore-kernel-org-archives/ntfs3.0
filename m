Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155491;
	b=rpV5MqRieIaotZ5b0nQXsn8sJQqHZC0R5nYur+NdpHMDr7nUf/UtsewCNBqYzVVm6p74
	 htcfbtz+el2JO5G6cqlsPN3nzAUo7GWvFLsryYBi6iMPZi/VnsrrXap0eCN7GTnfkTJcn
	 xa2oD6hwdaWnUEyc2pasmQ2ySiWoCp1tAh3bxWdP0/g4kvdR4imwEMLyDBy0VF7P95Vhy
	 9cOjGaUd0hjYgwVzXfoUBP7R3teL3u2M3GsT7t5plCjm2J4XxHVJUE1eSNVMt43w//a04
	 wjN5y4DhBPR0yjZUhbD8WTohGanGfPr0hX3b1B7H/TlZGDMTyCg9RJBcf5+HMLwgCbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155491;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=WOL4+D5dXDoziRa8ClTS8VQqRnnMXSqv697kaQ02AW0=;
	b=xfm+PT2c4PqtPWxJFVPDl5+dQhOAcMakV8j1oWJjNSfoaQQIG2wuEZiTJS4SyyaskLGu
	 xYWV078se8WAnDCs3hF1gLuYMqs+Pkzvtom0D2uHS0/rcjL7WPB3JOi5uSXeoLGi+n7Hf
	 DYjHt1cwHHznou4HNkgbqmUHvF+4n55S/HdcHO0pi4ZXnKMCi5cl33Z6rf9WNj/mKILUr
	 vvSzjlmeiO+DFZNT43XmFxSEXSgYgvGFMXvPNBjKQxquFbJMU90tBAt5OJB5/D/Hjv1Rj
	 OrTVLEEhJXA9++W+yWagSk6SLxeYIfM9LjV3KbpqO8TCBjATC5bKPY2k1mdwjg+F+Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=COJbszoA;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2174B606A31A
	for <ntfs3@lists.linux.dev>; Wed, 28 Oct 2026 02:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2174B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=COJbszoA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=WO
	L4+D5dXDoziRa8ClTS8VQqRnnMXSqv697kaQ02AW0=; b=COJbszoAoNmXsaPh2v
	XtvSfcNLEw+xkIorW7T7YwHQzn1ybiSJ0mIeuhm4zk9k7nWDDwGNDTpWXzrfiCd3
	xonlTPyhCP2NQoUB3y7Xbyqgk2m5z0meB1z+++UM8Wi3aIcHtYqYnnK16IWByGfS
	LOw9ibiNFaC+DMmNSj9VldwgU=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3wCicYeFqV0gkCg--.55043S2;
	Wed, 28 Oct 2026 10:44:44 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: validate INDEX_ROOT size before reading its fields
Date: Wed, 28 Oct 2026 10:44:43 +0800
Message-ID: <20261028024443.25-1-shxzhaosr@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:PigvCgD3wCicYeFqV0gkCg--.55043S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1UWFWDXry7Wr18Cw48JFb_yoW8Ww4rpF
	n7AFZ7GrW8Gr129wsIyF4DX3y8Cw48Ww1UtFW8Zr4Iyr93twn7G3sFyryrAryDtrWDJr9x
	XFs0qrW7W34UGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlJmUUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7R2S0GrhYZ026QAA3a

check_index_root() reads root->index_block_size and
root->index_block_clst before checking that the resident data is
large enough.  check_attr() accepts a resident attribute with
data_size == 0 and data_off == asize, and mi->mrec is exactly
record_size bytes, so a crafted $LogFile record can make the
first read go past the end of the allocation.

Use resident_data_ex() so the attribute is validated before the
fields are read.

Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
 fs/ntfs3/fslog.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 2460a4a..e208f4c 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2721,15 +2721,21 @@ static inline bool check_index_root(const struct ATTRIB *attr,
 				    struct ntfs_sb_info *sbi)
 {
 	bool ret;
-	const struct INDEX_ROOT *root = resident_data(attr);
-	u8 index_bits = le32_to_cpu(root->index_block_size) >=
+	const struct INDEX_ROOT *root;
+	u8 index_bits;
+	u8 block_clst;
+
+	root = resident_data_ex(attr, sizeof(struct INDEX_ROOT));
+	if (!root)
+		return false;
+
+	index_bits = le32_to_cpu(root->index_block_size) >=
 					sbi->cluster_size ?
 				sbi->cluster_bits :
 				SECTOR_SHIFT;
-	u8 block_clst = root->index_block_clst;
+	block_clst = root->index_block_clst;
 
-	if (le32_to_cpu(attr->res.data_size) < sizeof(struct INDEX_ROOT) ||
-	    (root->type != ATTR_NAME && root->type != ATTR_ZERO) ||
+	if ((root->type != ATTR_NAME && root->type != ATTR_ZERO) ||
 	    (root->type == ATTR_NAME &&
 	     root->rule != NTFS_COLLATION_TYPE_FILENAME) ||
 	    (le32_to_cpu(root->index_block_size) !=
-- 
2.53.0

