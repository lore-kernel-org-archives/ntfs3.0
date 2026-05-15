Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96BF42B72A;
	Fri, 15 May 2026 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836201; cv=none; b=WC+lqdE1nxknSc04r8hAAFqqDCtm6jJ7nMxIVvxq/Gx8fNZSYGuTqrFk5rtA9W7wFJup7MsvEUPCfdI3fRaObKGjws1jywyZRYKbuFOCeZOsqfFrYk+MhHcwSOi46lV1/16U4AHliEtUIu4w36jc3lkhpZjMHyqDd9RCk39qh00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836201; c=relaxed/simple;
	bh=QDgcpFDyCTOQ6HI7OM9nD/w1wuw88odgysDsig3R1Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PtP/pKxteTnaN2uUVNUN6eEBgJ+TEKFVblVkSkWV7YjXu/IBz1H2OAz+L1+/+HeZcygTL/bvgDNUi5Tr+u7xN8rFYPY3GRyjfpzggBGO6hr1T3LVxx8/FVxgcxCzCADJHlpfaDUa8V+oVvfdAiADEE/1ecdiQDwWBvMwg23RFZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QX7gp0Pm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QX7gp0Pm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09681C2BCB0;
	Fri, 15 May 2026 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778836200;
	bh=QDgcpFDyCTOQ6HI7OM9nD/w1wuw88odgysDsig3R1Hk=;
	h=From:To:Cc:Subject:Date:From;
	b=QX7gp0Pm0N8yShKvOesmpkn4k4T6oNIIOa9/PfuiSfKmQR1RXyUVcp7NJdjd6lpnm
	 cAS3A7MBNR2Fz7KjgsDOHFNFsjz9eAJ4NaQcE6aM4VBxd18j5v2w0EHmnZkptZOp7R
	 ilM8fVea42cFlJvk5Lc+IiTNQeib6J+yqZmEGXObEfLsewVv+lX1sOTJ0n56fbUu8+
	 81V6e5ZXe4belW7ttQX5nkQcpNdsESNfS/VWv9cM2pMMJ6k6m9Bxf6LiVAx8fMDd0j
	 Ks7FrPQo4rfO4DD3y1k+bBOizJVxy6JlQk/lepVPHGQvEIwzH1OPxXoVpivd1+Wsi6
	 uIdnbsUjgwOXQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Edward Adam Davis <eadavis@qq.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: avoid another -Wmaybe-uninitialized warning
Date: Fri, 15 May 2026 11:09:50 +0200
Message-Id: <20260515090956.512083-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The ntfs3 specific -Wmaybe-uninitialized flag found one more false-postive,
this time with gcc-10 on s390:

fs/ntfs3/frecord.c: In function 'ni_expand_list':
fs/ntfs3/frecord.c:1370:16: error: 'ins_attr' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Add an explicit NULL pointer check before using the pointer, and
initialize it to NULL.

Fixes: 48d9b57b169f ("fs/ntfs3: add a subset of W=1 warnings for stricter checks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ntfs3/frecord.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 7b035da63c12..d2c0b836b1bd 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1330,7 +1330,7 @@ int ni_expand_list(struct ntfs_inode *ni)
 {
 	int err = 0;
 	u32 asize, done = 0;
-	struct ATTRIB *attr, *ins_attr;
+	struct ATTRIB *attr, *ins_attr = NULL;
 	struct ATTR_LIST_ENTRY *le;
 	bool is_mft = ni->mi.rno == MFT_REC_MFT;
 	struct MFT_REF ref;
@@ -1363,7 +1363,7 @@ int ni_expand_list(struct ntfs_inode *ni)
 				      le16_to_cpu(attr->name_off), true,
 				      &ins_attr, NULL, NULL);
 
-		if (err)
+		if (err || !ins_attr)
 			goto out;
 
 		memcpy(ins_attr, attr, asize);
-- 
2.39.5

