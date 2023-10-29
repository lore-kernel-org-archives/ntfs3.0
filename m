Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C802512E70
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qx98kh6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D72C433B9;
	Sun, 29 Oct 2023 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620272;
	bh=ByJu4CYc2cPSTybF4P3FBZNRDMDWNhp/xY9vw5o6EEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qx98kh6h8bB3d5Te9JLUx5MYiauKiDgBx8EDUm2QcgoQgplPcfevLZKS/yiSMZdqs
	 inTiT02MNKG7NyEpgBWvwKhVgUnphXMQ7KAniVTsDuyr6C+/UT2o3zfohD4aHCiSBc
	 87jfJwx6NHLVgMrNYfc1jPNsAVYwih4WA5KQlrFcnPPA0ds0foqNd+9vW+kyutsov2
	 BlETmBAZdmIbwCcEN6yKC4mDdvRctV8dElk97vCKcMhUwDykgAi6LIzJI//gl3v6DQ
	 eiAfCWQoA+kP18yOknIzVQg5J/op++C24Ly6K4C1sPq1Uv7UJQeQMzYdlh4v1EkyNE
	 DGcoCvK7QWnOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gabriel Marcano <gabemarcano@yahoo.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 09/39] fs/ntfs3: Fix directory element type detection
Date: Sun, 29 Oct 2023 18:56:41 -0400
Message-ID: <20231029225740.790936-9-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225740.790936-1-sashal@kernel.org>
References: <20231029225740.790936-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.60
Content-Transfer-Encoding: 8bit

From: Gabriel Marcano <gabemarcano@yahoo.com>

[ Upstream commit 85a4780dc96ed9dd643bbadf236552b3320fae26 ]

Calling stat() from userspace correctly identified junctions in an NTFS
partition as symlinks, but using readdir() and iterating through the
directory containing the same junction did not identify the junction
as a symlink.

When emitting directory contents, check FILE_ATTRIBUTE_REPARSE_POINT
attribute to detect junctions and report them as links.

Signed-off-by: Gabriel Marcano <gabemarcano@yahoo.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/dir.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index fb438d6040409..d4d9f4ffb6d9a 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -309,7 +309,11 @@ static inline int ntfs_filldir(struct ntfs_sb_info *sbi, struct ntfs_inode *ni,
 		return 0;
 	}
 
-	dt_type = (fname->dup.fa & FILE_ATTRIBUTE_DIRECTORY) ? DT_DIR : DT_REG;
+	/* NTFS: symlinks are "dir + reparse" or "file + reparse" */
+	if (fname->dup.fa & FILE_ATTRIBUTE_REPARSE_POINT)
+		dt_type = DT_LNK;
+	else
+		dt_type = (fname->dup.fa & FILE_ATTRIBUTE_DIRECTORY) ? DT_DIR : DT_REG;
 
 	return !dir_emit(ctx, (s8 *)name, name_len, ino, dt_type);
 }
-- 
2.42.0

