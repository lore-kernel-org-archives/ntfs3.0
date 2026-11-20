Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181772;
	b=IkuA6xef5xmefbJT2XZbpLsoONAaedLi7bqm57cVaUM/oGpCuSfeuKoPWLAlv/LCZe/i
	 efQbckilR2ujl423NGrPQOIED9RqaRWVGfXhwXhWIZ3p0nJegXZrnWmKfo24YSmKWRyeY
	 ooFXO0XrjTjZj0Mb2K1W2Zs0K6omxuW5R+ywIkpdemPNzG5j/nDyoK1PXJURD1fhEYmUg
	 MkPbVHWPD/LZhDR8CrmTcB6XfVrY/2CfNQB70GemRh2aSTjx/NiWBJitnZL9vuDwrJiKr
	 nPfgCE027rjp59aFdiWuSMPMHIc92bH/3jzEUHTr0NAmdP7CuDojgN73/BptVJRTu6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=buQIV0vkdXGXpQqdQz4ZB0pqcKMsGECCL78uKqu8k0I=;
	b=yP1U5qhGvsgKT5zt4DdpQnQa92Vgyvz46mizlVaSDXoX2OyiqXCWNx25joCGogpO0nn0
	 vAeq+MCCZUBZB8LZtPTwcIUBkBsdyf9h7QK5x5fpXbsQRXyurGvCm8J/LN8szXj2S6Fv7
	 l/AFfaxkjhq6+6jcKv7WueK+EPpSrVKOHoEcUWYoxQ+/yb0Y1IBdoXWEA2XKUnuy2Udyd
	 74bQ1tsvV2hlFOCmsOUhCSedZ6m6rmmI4ii0ynvfUptQKsn5FQNjAVwvpscIhtrHSTjGs
	 sYSzyTVUkTkkNI4dXcSaf0J0SuXtOgJP6X8JC59z9/UQi8Ohlmslebuwtm8r7oNhMqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pZm/+8hF";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9115A606A32C
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 13:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9115A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZm/+8hF
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so531635a91.0
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181772; x=1795786572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buQIV0vkdXGXpQqdQz4ZB0pqcKMsGECCL78uKqu8k0I=;
        b=pZm/+8hF7krucnf/XIDN4Wyl53tAe8xus3yfRyaay1ZRf8n2JMm4jjtO43b3xqDUYj
         /hAejmV3UtfD7mWlJ009myRiDWxPO6frtwbjrJwRLqZW88bI005TvGSnpjAoVvGjTmmr
         /GOyxk/uEaaHAHIfIM6kCJrh8a6gmetukWqWO1Q7g9kYSL9kK90d7+qzB8B7sjShQK1s
         IwaZbbCY+fffKWlrKYBYJWxbUDlEC89s+nG3fCapoes4279542Vk7v6zHHouqb9gcZoe
         JKiOaUewSV1kVkSKY0QCT1Zp4feE+xU5tmtJKK9qGTZFBOef8+HiBzBFPztYj/T90oJI
         6dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181772; x=1795786572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buQIV0vkdXGXpQqdQz4ZB0pqcKMsGECCL78uKqu8k0I=;
        b=C8UqWIv8QO29NyN3FE550o4rBoAoqKX9tWNNr+rbbHSFm3/qTRUGyNhr90vsMQtabI
         zRGfi+bLYP1Mq+CGNz0nsuXzTnBNiCQHDMUGUbgNJI16zNv9iQq4Qcs0aQSmrttF2k94
         W2OghsXR6Jh86ObaV0JZK8hYbuP2ArAH9oONdempwA8lUAO6Kzw2KeJcLePpMrOPzGpY
         erzDZDuU0D/zN0ZOdNcKFNrjx4291fKddWqT9c8PZYSzytTzn+DnPHI2NBpHwSLXRiQa
         5kbx8y0mh/W+QYolUqM5v5wwU6kSwy9QImAYY7P+0YUdDbj2lGkKHbfNYvzDUHByGny7
         pHgQ==
X-Gm-Message-State: APuU4Z9dM5TW5fXkmBAzlgsJH/7+z9+tzffIuTlec4t3Yju4Gn5zIf08
	FQhOCYFH878yy/iJs440+OX44RGcQ8KFEvTx5DXpz6Ex0PKtLXPA5LYO
X-Gm-Gg: AZFdTZdAx5V03WJkAWqCwUE+4DFtBnFCykgKZK5jt6WTl+i7jnOWVpn6LKsrJY9nipS
	0RNhrIaBcEmmz1K6e3aIfg7nTs2DngbdeSZEFLvPKrLBcLXSGrf7VPUMqtbC1dCg3icqmGLzCjd
	gewzfEgMr3/zneS4bEGE69TMxKWuZ6Bfpw2ZOtRCJoyJnfltFPXMV4DqrP4dCJl6XSaPHtyG6vp
	LmkbqWTYYY4s3jHMlhli1kn1ZEY+JGwWaii7z9wTw8Vir9f/PSAlKKCxsSalEyita7ZnU4eeqwL
	xyj7yEpYc/Po4jKGLyXCISc1jOdTBYw+UvaQD+rxmfp+gf4abyZNiI0/rMJFCUwVqcBShgDXGgV
	kl5abuY4n0Jr+e3BR1GQGkVCF4DDYYVQVYsMOt6Gl7k6iDJYLyrPAQ4ltSznKr3oJ5zK4XvXZ2g
	5K7/5LybRX5oFrFr7QBi8fPZBkYfOH5I5fkcbjoaEsMhWFLJYVAkz3zLQMA7K8U1pBB+EGc//sZ
	cbPo1l+0sK9GarqA8eIe4alCqOTD3QbAcxWz82PoelFxldBirg7DY9R9r1oR6PQTs8NP/nIkde2
	YOpHxXgZXtDhWh581cFTQGa/WF43/nappoMR/mE0g7zIKeUG3aOrtubpMt0dMdbkyZw=
X-Received: by 2002:a17:90a:e70c:b0:3b3:a9a4:a60e with SMTP id 98e67ed59e1d1-3b41c92643amr2783153a91.25.1795181771890;
        Fri, 20 Nov 2026 05:36:11 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm7557362a91.14.2026.11.20.05.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:36:11 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 2/2] fs/ntfs3: zero new clusters that a write only partly covers
Date: Fri, 20 Nov 2026 21:36:04 +0800
Message-ID: <20261120133604.427285-2-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120133604.427285-1-zhanxusheng1024@gmail.com>
References: <20261120133604.427285-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

When ntfs_iomap_begin() allocates clusters in a hole, the part of a new
cluster that the request does not write keeps the old disk contents,
and reads below the valid size return it.  The iomap conversion asked
attr_data_get_block() to zero such clusters only for writes through the
page cache, and commit 10d7c95af043 ("fs/ntfs3: add delayed-allocation
(delalloc) support") stopped asking for it at all.  Only the delalloc
path still zeroes them.

On a volume with 64K clusters, write 4K at 0 and at 960K into a sparse
file, then 4K at 512K: 61440 bytes of the file read back old disk
contents, both with O_DIRECT and with a buffered write on a volume
mounted without delalloc.

Zero the new clusters when the request does not cover them.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Fixes: 10d7c95af043 ("fs/ntfs3: add delayed-allocation (delalloc) support")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
With 4K clusters a page covers a whole cluster, so only 64K clusters
show it in these tests.  With both patches, fsx with mmap on 4K and 64K
cluster volumes and on sparse and compressed files gives the same
results as before.

 fs/ntfs3/inode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 535a2b0804af..9c2ded9567f7 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -982,6 +982,10 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	 */
 	no_da = flags == (IOMAP_DIRECT | IOMAP_WRITE) || srcmap == WB_NO_DA;
 
+	/* The request does not write all of a new cluster: zero it first. */
+	if (rw && ((offset | endbyte) & sbi->cluster_mask))
+		zero = true;
+
 	err = attr_data_get_block(ni, vcn, clen_max, &lcn, &clen,
 				  rw ? &new_clst : NULL, zero, &res, no_da);
 
-- 
2.43.0

