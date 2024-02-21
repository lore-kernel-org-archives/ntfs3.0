Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73120DC5
	for <ntfs3@lists.linux.dev>; Wed, 21 Feb 2024 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708512293; cv=none; b=A0TEudrTNlTqjFQ0MXX9xAbkabiEJEK+jBufb2ypvsQDKdxGt6crT/J9Q2G/nJsPNpB3kU5DqSiIYQNa+SpUEKF9X32TdNJ7pzNiZ0AUoFuVEoV4KmjOAH/sL4+mOyva7Hjf45RQ7DGdpB59lj5qzSs2TZMAWHLawqGkDcX9IYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708512293; c=relaxed/simple;
	bh=ghhI+nFDhm0hnOFhmWeoRf94hHK/gPArrHEfJeQ/EBo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=l86LxJzfQJOaqtVX6fu6DSmgLb5iSEQg0l2cBfpS5NrKjtEI3GyP0ZZZmPTU25YfPyIwtGnt+t9EPHUEhGbMS09/GJlx+quGKUu0VYf31kOuvo5oG/H5aVha1BvLvkEU9VdKYZ3g2G1nCSUEmc2iX3fzWpFXhu0YSAFr5rFS1Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Oi6z7vhJ; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Oi6z7vhJ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 488BE240101
	for <ntfs3@lists.linux.dev>; Wed, 21 Feb 2024 11:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1708512288; bh=ghhI+nFDhm0hnOFhmWeoRf94hHK/gPArrHEfJeQ/EBo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Oi6z7vhJIUx+/QyafXRCdMFngP+BSIvcY4JjGHxacW4b1sOP3E3NwYU4dNHaI9ezt
	 f/P1ez3QdLHnQV1U2citr8UM1vMw+UDavSuJ7VN8u0sYt8h0TbREiEPUMg2pmG/hcp
	 jLKaQsRSsX/FoRwaRxSsMC2J8Xgx9xa1BEypPPVdlt6ImkK6CTYmglfVATfDWtTYdp
	 x3HHNmftGJP6VJMQffun7ragIxowbF3Na86f8ukyd8lNmDRlSjg+5KK3pDEGwiwd/N
	 5SPbgaN+rjV9ouUlLFRwu6pAz4RG4ZcyPgQVT9cpgfBiQkVZVVpbRG7XkNGsDsLKUS
	 iqPuJTJxV+EEg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TftFV4nPvz6twm;
	Wed, 21 Feb 2024 11:44:46 +0100 (CET)
From: Mark O'Donovan <shiftee@posteo.net>
To: linux-kernel@vger.kernel.org
Cc: ntfs3@lists.linux.dev,
	almaz.alexandrovich@paragon-software.com,
	chris2553@googlemail.com,
	regressions@leemhuis.info,
	Mark O'Donovan <shiftee@posteo.net>
Subject: [PATCH v2] fs/ntfs3: fix build without CONFIG_NTFS3_LZX_XPRESS
Date: Wed, 21 Feb 2024 10:43:58 +0000
Message-Id: <20240221104358.2290969-1-shiftee@posteo.net>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When CONFIG_NTFS3_LZX_XPRESS is not set then we get the following:
fs/ntfs3/frecord.c:2460:16: error: unused variable ‘i_size’

Signed-off-by: Mark O'Donovan <shiftee@posteo.net>

Fixes: 4fd6c08a16d7 ("fs/ntfs3: Use i_size_read and i_size_write")
Tested-by: Chris Clayton <chris2553@googlemail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 3b42938a9d3b..7f27382e0ce2 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2457,7 +2457,6 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 	struct ATTR_LIST_ENTRY *le = NULL;
 	struct runs_tree *run = &ni->file.run;
 	u64 valid_size = ni->i_valid;
-	loff_t i_size = i_size_read(&ni->vfs_inode);
 	u64 vbo_disk;
 	size_t unc_size;
 	u32 frame_size, i, npages_disk, ondisk_size;
@@ -2509,6 +2508,7 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 		err = -EOPNOTSUPP;
 		goto out1;
 #else
+		loff_t i_size = i_size_read(&ni->vfs_inode);
 		u32 frame_bits = ni_ext_compress_bits(ni);
 		u64 frame64 = frame_vbo >> frame_bits;
 		u64 frames, vbo_data;

base-commit: 9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8
-- 
2.39.2

