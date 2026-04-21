Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179AA33F58C;
	Tue, 21 Apr 2026 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803208; cv=none; b=jcjVqcnlGF6sFvzPbXF4zTgDoaWJ/kRZoGRx/LAKt2uMx9fROLVd/IgT5pKvKOOHGH0pxwN4t+ST8fEO1WwHw/HpSUKzxB/DojqLYVxWVFrfQKdV5YXzBwd4iyjFNNFW5A4UWkcKZfWgjyypPZFt6PNS1bgxYWMLuJWjLjnSOEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803208; c=relaxed/simple;
	bh=E3TboDXd5bWwTa6OE+3VOKxPal6YUCX3+15LriRHQTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FeVFZTjQLICimUIZowshQiBETXr9CPVDDyFG3vzArPcR+aGLNROUvKck28F9rkmDY6j12WIbF908Z2eoA2mz+uazHparB7gsmkaV0LAU7ROWbfmTM7nFsl7AmRdGLp5DW2LUVVZPG8kY6Pzk/x6oJleKXFpbXNVsRkIj4lZn1g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOdcWKir; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOdcWKir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCC7C2BCB0;
	Tue, 21 Apr 2026 20:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776803207;
	bh=E3TboDXd5bWwTa6OE+3VOKxPal6YUCX3+15LriRHQTk=;
	h=From:To:Cc:Subject:Date:From;
	b=SOdcWKir63GLdqFEe/mrWs9zAtB0INogIx7CfddU59UgovyFtHbsVfYYSwdKtih3H
	 n5ZzTuxHW7E4Y8jCzBddN6FpJeDj71nTmE8SpDVoYLiHtE0V0PRk363pX5gnKcXktz
	 +xYEphtLDdGq8ohmu3fcU32Q4w1IGEtaIqQDS14ew7F5SWJsp7BmBcsVUveXGItb28
	 HMVWC5RHMA59+7jkrn4a0wCeebiwHT/tUJ0ooOmthewEwykdC3aSmw9SXivg0FQtWn
	 cQ1iwSC+Fnt2DUBVengXp85lOXDsdbFMtIwJZiyMseZlYlso3zUHRx01Hhi4i7mRdQ
	 Nj0LLmHH2qy8A==
From: Arnd Bergmann <arnd@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>,
	Seunghun Han <kkamagui@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	Andrey Vatoropin <a.vatoropin@crpt.ru>,
	Lalit Shankar Chowdhury <lalitshankarch@gmail.com>,
	Lizhi Xu <lizhi.xu@windriver.com>,
	Adarsh Das <adarshdas950@gmail.com>,
	Jaehun Gou <p22gone@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: avoid -Wmaybe-uninitialized warning
Date: Tue, 21 Apr 2026 22:26:20 +0200
Message-Id: <20260421202641.1157171-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This warning shows up with gcc-10 now:

In file included from fs/ntfs3/index.c:15:
fs/ntfs3/index.c: In function 'indx_add_allocate':
fs/ntfs3/ntfs_fs.h:463:9: error: 'bmp_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  463 |  return attr_set_size_ex(ni, type, name, name_len, run, new_size,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  464 |     new_valid, keep_prealloc, NULL, false);
      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/ntfs3/index.c:1498:6: note: 'bmp_size' was declared here
 1498 |  u64 bmp_size, bmp_size_v;
      |      ^~~~~~~~

The warning does look correct, as the 'out2' label can be reached
without initializing bmp_size and bmp_size_v. Initialize these at
the same place as bmp.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Note that this is one is separate from the one I reported with KCSAN
---
 fs/ntfs3/index.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 5344b29b0577..2b8b5779ff8a 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1506,6 +1506,7 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 
 	if (bit != MINUS_ONE_T) {
 		bmp = NULL;
+		bmp_size = bmp_size_v = 0;
 	} else {
 		if (bmp->non_res) {
 			bmp_size = le64_to_cpu(bmp->nres.data_size);
-- 
2.39.5

