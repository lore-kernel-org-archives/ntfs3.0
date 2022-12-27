Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD768495
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE9DC433EF;
	Tue, 27 Dec 2022 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173292;
	bh=AhlfT/ar6KkfA72yOOL2q9tadrb57H/GbX+37Aq1Rag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V0tGTm9hOUyv+cXOUG70kwmIs5Uf+WtPB2oZ/20gymnWf+mBW9NmsgYJJZbAgxvr4
	 Dmd6DCKfz6ycYFHsQWKOD1QXygw1VTERLGHkbMaGxObUu638AwN5GY/vrIDeE22Ldb
	 jyE7L2IQW7PI5+H0qFzOwOmqea5z1YU+8SFcGZzXfPi+lCccCx7DzK86EHDPqYgLZ8
	 F1N+PuX/6M2/eWmvC1Oa4OasC5iRDt4w0YJvmfuLeAbNSZI97f87qM6tFMHX789Dsg
	 8fqEb1dCWzxn5vlVduXQNaoQkdFmJUvVaPnGdA47n2CRgRtrUqUaROp1/5l8A73w40
	 Tuvfz6rKxLDag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 15/22] fs/ntfs3: Delete duplicate condition in ntfs_read_mft()
Date: Tue, 27 Dec 2022 15:34:25 -0500
Message-Id: <20221227203433.1214255-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203433.1214255-1-sashal@kernel.org>
References: <20221227203433.1214255-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 658015167a8432b88f5d032e9d85d8fd50e5bf2c ]

There were two patches which addressed the same bug and added the same
condition:

commit 6db620863f85 ("fs/ntfs3: Validate data run offset")
commit 887bfc546097 ("fs/ntfs3: Fix slab-out-of-bounds read in run_unpack")

Delete one condition.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/inode.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 00fd368e7b4a..ed640e4e3fac 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -374,12 +374,6 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 
 	t64 = le64_to_cpu(attr->nres.svcn);
 
-	/* offset to packed runs is out-of-bounds */
-	if (roff > asize) {
-		err = -EINVAL;
-		goto out;
-	}
-
 	err = run_unpack_ex(run, sbi, ino, t64, le64_to_cpu(attr->nres.evcn),
 			    t64, Add2Ptr(attr, roff), asize - roff);
 	if (err < 0)
-- 
2.35.1

