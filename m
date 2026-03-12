Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95874372676;
	Thu, 12 Mar 2026 16:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773334184; cv=none; b=MrcFDKS/mPVnhDdEeuAPi87j5l2X5dYn4YlZKZX9WxiVQYXMsfPgqGzrdIYSZwgYNQVORHUAVL1RE2YPrItxW5ga8Hmhmr9a3yZL30BFGetgMkKGSFiTsABOFv/Mhx1yntzMCEYR/RmpewT6sUzNb1OvzjLLFQBD3w0MW6+QRcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773334184; c=relaxed/simple;
	bh=/kVi7eY/tH5oeg3AWS8dgNy0NPONEoD73pAZphvE7V8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RQsjGvDiA1Fr8fZEF4yUclmzmbpqAEvySSYvY9ZSidHGwCz62fSbt1pkc8bcJoROBNSovo6TlnnwwIU0rUQHStmZmRXfOJeJWb3jkLM0okNE1I5bObFDco7SBBiv9HrjKXnzs48gCG9g1gGZYbRSvHpKCHRFHjNHG6FmLWS2YN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dy672Ygn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dy672Ygn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4F9C19424;
	Thu, 12 Mar 2026 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773334184;
	bh=/kVi7eY/tH5oeg3AWS8dgNy0NPONEoD73pAZphvE7V8=;
	h=From:To:Cc:Subject:Date:From;
	b=Dy672YgnWY4QgL3pTjgKPEjf2aX8kRrtYWA4OrhD3C6yyBGjgY+Vdb9Sg3/hBNqa0
	 v6noVkk2q0Ah8h0wnA47EhohJPYZ4bAA2V2SSfcdVvtpO7x90fnQE74MTLiIblR9hw
	 RYs3MR8qGnYyBy7qf/GcwpLpFbjsYHwmDoSkXMdt6LNo21+jHf2s7qXLey084WKTAw
	 GNVlDYCKjkr2OxUYZcQ6DszfL3EOSpL27O76ro9L/aDrBJaSOG2g5upJNK10UY889f
	 qxYBWLwdTzZICDvrxkYgxvvY0N8iRBBoJrw4HIjIMyORyqWv/wO9m+NMporYXpH1Sn
	 apM8pvSp1Dnww==
From: Arnd Bergmann <arnd@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
	Lalit Shankar Chowdhury <lalitshankarch@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: work around false-postive -Wmaybe-uninitialized warnings
Date: Thu, 12 Mar 2026 17:49:33 +0100
Message-Id: <20260312164939.946523-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

gcc sometimes fails to analyse how two local variables in ntfs_write_bh()
are initialized, as the initialization happens only in the first pass
through the main loop:

fs/ntfs3/fsntfs.c: In function 'ntfs_write_bh':
fs/ntfs3/fsntfs.c:1443:17: error: 'fixup' may be used uninitialized [-Werror=maybe-uninitialized]
 1443 |         __le16 *fixup;
      |                 ^~~~~
fs/ntfs3/fsntfs.c:1443:17: note: 'fixup' was declared here
 1443 |         __le16 *fixup;
      |                 ^~~~~
fs/ntfs3/fsntfs.c:1487:30: error: 'sample' may be used uninitialized [-Werror=maybe-uninitialized]
 1487 |                         *ptr = sample;
      |                         ~~~~~^~~~~~~~
fs/ntfs3/fsntfs.c:1444:16: note: 'sample' was declared here
 1444 |         __le16 sample;

Initializing the two variables to bogus values shuts up the warning and
makes it clear that those cannot be used. I tried rearranging the loop to
move the initialization in front of it, but couldn't quite figure it out.

Fixes: 48d9b57b169f ("fs/ntfs3: add a subset of W=1 warnings for stricter checks")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I don't know how the set of warnings for ntfs3 was picked, this seems to
be based on what W=1 used to do many years ago. -Wmaybe-uninitialized is
no longer part of it, and some of the other warnings enabled here are
turned on by default now.
---
 fs/ntfs3/fsntfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 0df2aa81d884..d0434756029b 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1440,8 +1440,8 @@ int ntfs_write_bh(struct ntfs_sb_info *sbi, struct NTFS_RECORD_HEADER *rhdr,
 	u16 fo = le16_to_cpu(rhdr->fix_off);
 	u16 fn = le16_to_cpu(rhdr->fix_num);
 	u32 idx;
-	__le16 *fixup;
-	__le16 sample;
+	__le16 *fixup = NULL;
+	__le16 sample = cpu_to_le16(-1u);
 
 	if ((fo & 1) || fo + fn * sizeof(short) > SECTOR_SIZE || !fn-- ||
 	    fn * SECTOR_SIZE > bytes) {
-- 
2.39.5

