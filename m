Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630278;
	b=sNBarcUzvOJI9HDDa9U4d4VCzRkOb8D0MRNPeztvyToUxewS+AdsX7SZ70SvpYU1yc1N
	 fSJG7Dr+3N2hF2RxL5vz4oB0vqKUzZL2d5anmisUGQwcBnZP2aG9WEwU1+YBPFZREZrg+
	 ipyf3QmT/12+TYub0/xMFvdFDcdmvhK3ZNnk4/CzHt3NLP+veG+i9e7gvIOtrutZspE6J
	 QK84KJMXdjj1F/rAn5l5EFrLcMpi5Jq8DBufo/rdz2syvFg0FPSZLGa0H2Tos9+G+j7/i
	 EHngWQkDKNwybCkJDpNP4bBtwBknjMe8CPfp0G4Byp6DQl4yAbgIW72Ikwp/3CglJrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630278;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Envelope-From;
	bh=+nzFqa5/3WRg86G5ILwdY2S3U0IoUHWbs3xPCsgiL64=;
	b=ka1+x8+s0KT11Q0gbUtySkK0BrBTi786ECXu20kxvPvBqloIFyfyTWpohTGz9ogOwEeq
	 r4l1bP6RzOcud6crCxYB46ke0q6xvJl5WKf0PeHHMGdDfENggc4NkA5QH8QWfekrCzt2j
	 g+UkPgI//7W/l8fAvObzMQMG7Dv1MaPtt0/S1FVND+C3JUhIcvTIOcjCwIROw/5NN3UZY
	 sOYfRgAuP/a2amXtBcIvykD5AxOdak9dcmzm0uUABmB0LcVLfUmPeNRICg1t7fpcF6Tq/
	 LW0zGqQh14gBya5VtIn6ZmG5CEB2H0GrBx5CU+zqPw03XCIlPTSD3qq+a7wyonHN2uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=elliotjb.com;
	spf=pass smtp.mailfrom=elliotjb.com;
	dkim=pass header.d=elliotjb.com header.i=@elliotjb.com header.a=rsa-sha256 header.s=default header.b=3ljg2NrO;
	arc=none smtp.remote-ip=63.250.43.117
Received: from out-2uec-a117.jellyfish.systems (out-2uec-a117.jellyfish.systems [63.250.43.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CE607990A
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 14:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746CE607990A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=elliotjb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elliotjb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=elliotjb.com header.i=@elliotjb.com header.a=rsa-sha256 header.s=default header.b=3ljg2NrO
Received: from mail.privateemail.com (unknown [77.233.63.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jJDnj360kz8sWf;
	Mon, 02 Nov 2026 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elliotjb.com;
	s=default; t=1793630268;
	bh=+nzFqa5/3WRg86G5ILwdY2S3U0IoUHWbs3xPCsgiL64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=3ljg2NrO1JGfbl6BHqou50FrjNan23UoYuf94XrgqHO/LuobtGZe1j0hA7vcr2TAi
	 iw3FfHJ9rUe3siysGdQdE1IOxg5RK/TtK4YOtT4nhf8DjB1NMsDxPvbVyNO6wVuCot
	 gd2ydpjwG0mVcNLuoBzPu9nkSrSNGbWfDGYe3E55pWhxSB5FRgwPyr5HtmFBWfkm2v
	 1gRXxau+mpVJ8XPrlTD/cN930wEUyD6xXW8BPh+KJiY8lRJNKYqjvyeiQNU5NiIh7L
	 KOyAV8NgFCJrTYwP/Lf3C5w4D2wD52qPUqdlLZjlnyIZYCInRYXyQmuy445VaqQrpC
	 R6+WGQyE8i6WA==
From: Elliot Berman <elliotjb@elliotjb.com>
Date: Mon, 02 Nov 2026 06:37:04 -0800
Subject: [PATCH 6.1.y 2/2] bs/ntfs3: fix NULL folio dereference in
 ntfs_lock_new_page()
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ext4-ntfs3-null-folio-v1-2-4fd91ee23a4a@elliotjb.com>
References: <20261102-ext4-ntfs3-null-folio-v1-0-4fd91ee23a4a@elliotjb.com>
In-Reply-To: <20261102-ext4-ntfs3-null-folio-v1-0-4fd91ee23a4a@elliotjb.com>
To: Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Sasha Levin <sashal@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yongjian Sun <sunyongjian1@huawei.com>, Jan Kara <jack@suse.cz>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
 linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ntfs3@lists.linux.dev, Tom Bereknyei <tomberek@gmail.com>, 
 Elliot Berman <elliotjb@elliotjb.com>
X-Mailer: b4 0.15.2
X-Envelope-From: elliotjb@elliotjb.com

In 6.1, __filemap_get_folio() returns NULL on failure.  The backport of
commit 95b917a14b15 ("ntfs: Do not overwrite uptodate pages") keeps the
original IS_ERR() check, which is always false here, so a failed folio
allocation while reading a compressed file dereferences NULL in
folio_test_uptodate(). Check for NULL and return ERR_PTR(-ENOMEM).

Fixes: 95b917a14b15 ("ntfs: Do not overwrite uptodate pages")
Signed-off-by: Elliot Berman <elliotjb@elliotjb.com>
---
 fs/ntfs3/frecord.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index a44b7338621e..fa443144f6d1 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2172,8 +2172,8 @@ static struct page *ntfs_lock_new_page(struct address_space *mapping,
 			FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
 	struct page *page;
 
-	if (IS_ERR(folio))
-		return ERR_CAST(folio);
+	if (!folio)
+		return ERR_PTR(-ENOMEM);
 
 	if (!folio_test_uptodate(folio))
 		return folio_file_page(folio, index);

-- 
2.54.0

