Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C64E0B93
	for <ntfs3@lists.linux.dev>; Fri,  9 Oct 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566263; cv=none; b=Lxb2JCZkmM+0jyfVZ3LvHDolN/bI2ifUawxpjci/OD60XLvEFHIdXvlnL5QjUeBK/4PD6ppf538gvIS12jVWXjYeLRzRQ05zIYJDvWnWImQcd7ev8MBPrBatd+2olj1nnocGbdtmSlBmqeH3g/OHBloE2YdGJjZo9/bfpvuY6nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566263; c=relaxed/simple;
	bh=iXvwLcCV5A2D0tezmDF+fuguR3oz08IBevn9vq8GAkM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+9Iw1Uey66G9BP9K3WCYJbZgXXqPMwh6bxeYL7JSxJzSJe1/A7LT0rihoTD2gFF0ziXVwxGNZBuowDXLHLRcaCBptaKK+b8nZorisQ1EV44T7BkmZWQkKkXeRegdco28bWRvQQgQg5dy70DHQUJ0hu006+pLCzIod8NccsqONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=U4jPoz9L; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="U4jPoz9L"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 0949C1D6E;
	Fri,  9 Oct 2026 17:18:28 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=U4jPoz9L;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C70D321AD;
	Fri,  9 Oct 2026 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1791566256;
	bh=SnVT2NSmf5BohIaNNnFatw3jHWjFSN6nZ5HtyKz4B9E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=U4jPoz9LIPwcDOGIHF5/drqV6zi+FsQBkPgEgvl/UdGmrCphtLrvGKdJxqeYOxRzy
	 ZM0vhuZ9Ws+p4IPU2jknMsxrLlkROnGEYUwSHwu28d9gcBPSm+93JDnhED6AUe7JtJ
	 jcRCvobWGo/WvokLVniWHlpQgiH3fsHMp/Gl8wxI=
Received: from localhost.localdomain (172.30.20.199) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 9 Oct 2026 20:17:35 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 08/11] fs/ntfs3: reserve a compression unit in maxbytes_sparse
Date: Fri, 9 Oct 2026 19:17:01 +0200
Message-ID: <20261009171704.11379-9-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009171704.11379-1-almaz.alexandrovich@paragon-software.com>
References: <20261009171704.11379-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

With 32-bit clusters, the maximum size of a sparse file was computed
as the largest offset addressable by a 32-bit VCN.

Reserve one compression unit below the limit so the rounded-up VCN
still fits.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/super.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index cf67d34568d8..0c347085cb85 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1235,8 +1235,13 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	sbi->maxbytes_sparse = MAX_LFS_FILESIZE;
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
 #else
-	/* Maximum size for sparse file. */
-	sbi->maxbytes_sparse = (1ull << (cluster_bits + 32)) - 1;
+	/* 
+	 * Maximum size for sparse file:
+	 * 16 aligned up clusters should fit in 32 bits.
+	 * xfstest 308 on sparse file.
+	 */
+	sbi->maxbytes_sparse = (1ull << (cluster_bits + 32)) - 1 -
+			       (sbi->cluster_size << NTFS_LZNT_CUNIT);
 	sb->s_maxbytes = 0xFFFFFFFFull << cluster_bits;
 #endif
 
-- 
2.43.0

