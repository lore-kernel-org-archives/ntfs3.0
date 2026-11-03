Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686302;
	b=Q8JxCHB6h6oS2ZVwllxJjaE5kv7cou4h/n+AG8jbFPXWBfnKjGDhVK6gZr4BANuhcqoY
	 Rr9sg7GWT1CHv7CwrIo1G+GS1D371uw6ayqLVAc9WGzM3iPmnDQrMwd+xHDNNI/T8QSQM
	 snPvGGTdcSW6TJFsS3n4tbYkoAmAg4vvpSOwJymyigWWiHmbpea3bgQh2oVl9cNhT5I/y
	 q6A8zVR1Sh7ZwdK1LiLiL73Aa/SX4jY/OKfkxF8x4aItWgauPsmjW1E/Ys2Gtw+5zJ7Ij
	 ZJCnk/EoWNIpRZaZZs0PTaftUlEVloH9NN3c+Zi60PDKQZ0o+FUjLnSpFH8rppxITnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BYXUCwkPXhE2WOYZgJcFT+Ca8H8+sCFYPzL9CHP8/xA=;
	b=cgfBz03AMUFiSsmRc7wH2JxxuAEmvwu4a1gCQo3XLwatAzO3QGiJHep6xy72sQqs7RAt
	 xm9FdlXDp2WQbYrswWWVuUh0e2sZ8XUmy4CkpTOKEiBJKGY8NbQ7kyahZ8eLx1rEuhopH
	 MWu8UvqxIfweTJlk5TjIic5oxsdkFy5fSXX3fFOGP9P9Mlnn81HaCFhGkSplKt9BFtfSN
	 E/cqkj2gE0nXG5JExTOF7ZJNMBhxnLjRffXM8kmI+lFMh1KIAS30fdiha9ay9T1bYfQvF
	 TmbawlKuSsIHpYt5wMv7i3aBY18+rpQRNUF8NNTgX+aSR+Bg0xdjj0asaRdXIGK/yTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2NJrSFS;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5488606A32D
	for <ntfs3@lists.linux.dev>; Tue,  3 Nov 2026 06:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5488606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2NJrSFS
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac749e0719so988391a91.0
        for <ntfs3@lists.linux.dev>; Mon, 02 Nov 2026 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686301; x=1794291101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYXUCwkPXhE2WOYZgJcFT+Ca8H8+sCFYPzL9CHP8/xA=;
        b=g2NJrSFSqN04s9lIDmm9jck/PmXIWjHTxcBElR+0EjcSig9zgvQ51nkaWHj5erXfyD
         ViDlsFgVtffpvxZspZDSN/19kfRQ97gFHVRG/7rU2GDO+xrDW96dWqIrDNMjD1YT2RsX
         8w3otk82W4uhVtezlAM8aBN1EVX8vU/FewcPpk24RbwNm+xA+oorDhiv8cRZh1LL37/Z
         mdA9e/K5TVKZI9gsP4smnRxD28L9HYYo6ot7LhzOd08ckAPUsO5GPFuo2wzrTlwwxLge
         ZUWJ5e3SCK9/EZ3wCiK7Rpy6nw9hijdmbYotAfpt+t5LVYQzZKZh2mKnhq7piX+QXrIx
         nsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686301; x=1794291101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYXUCwkPXhE2WOYZgJcFT+Ca8H8+sCFYPzL9CHP8/xA=;
        b=pcYuEslp/LoN8mYjegf4hvdXBOp/MtN27ca/+Xi4EVvR/wr8vYS92RL1Z/csfS9RBX
         97mJRQxI5PHozE9aZMQdY2EMF4tUPSzjzWBItoefH4pWex2e6ltGgrMa5myH+Pu3yTWy
         KwyGBqFPfVFaHmw+J0f3i8feAWYV1BIQuMVgk1SrMEKWkUm+2nnJPu99qlsL5C/rJasc
         WcTvc3lp6bHFxpGixVQyIFBuq9opJKPSK0KZ1LBapt4LJNhQidlOjBAcF4ZEiUmIuctB
         WAYeZqhUMVro9SJAIZ5XxdAFOTbXBmj1RQGkmQtfupDJC/0QSRqcumujkqgx4nZiURG/
         aDFg==
X-Gm-Message-State: APuU4Z9UyUGe5d1ueH3qwtYXnF5d7tTnfLgCFnnzuV/yqaw5505WosYZ
	kvUQnm3J7TXfPyUMVuUUZhRKTBvblil04hYFIsH9pOrFOXB+AJ2PI95e
X-Gm-Gg: AYBFou3I/qsmH3eVlP7H7DLTHbyagp/5aIvesSM1f6UmlAYzj659FzvNqys/n+QoO6b
	p3vErovX4qUobRYKIjiEM0yHlFNIVXPqUcmMdK48JJuKFcVR75/gnSKQRHg/Tl3LvEPKIVXr6xM
	RyLa4bVeoPcCCp7inBOooAFM1Rm1vBS89MJBpoNm0u62xDqbpuqma3vMt3MSMDx1gnN675IuQ0p
	tnhu1NwS+Bxh0NtamFCTKZlZiyqcmd6a1dlh0hilAPnI69Kzz5CBRFQQBEbzdnIIfB3bZP10v/R
	OpcLuWU/tN8jUu5W+df/QZ3oWETG+kpfjrFHyY4jKK1FFh6xJQ8RtXY5FLFSFZJhewixargwTqh
	05nLtQbdt+55VF+UvjSetIrGdpLe93imMgAvVC9f7jSFoP3D0FxsVzpWtDlKJxaCMilZuSjy+d3
	fKAJCsusmghuJnbb1D/WSe6Rd5b5jYd3CRUMhB+vBsdvgmbehLpcJ0KTiL2qMbk3AztkirH6oSS
	rZkfaZtqd1n2i/Crv260C7TNF8gaTu7LxyxFZgjzTxtYOMfAj3or8/vIeSbWUydE3pLWY/5aqui
	/ha0ECmZESpb03aohUOlj88E/5wN4ne4Rx7JUuyuSH0cA9X2PrFTsX11
X-Received: by 2002:a05:6a21:a101:b0:3e2:a9cc:3ecd with SMTP id adf61e73a8af0-3e928aaf420mr8144984637.7.1793686301096;
        Mon, 02 Nov 2026 22:11:41 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb363a62e3sm748229a12.4.2026.11.02.22.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:11:40 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: end trim runs at fully allocated bitmap windows
Date: Tue,  3 Nov 2026 06:05:56 +0000
Message-ID: <20261103060556.55571-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ntfs_trim_fs() keeps a free run pending across bitmap windows. When
the cached free-bit count of a window is zero, the loop skips it without
ending the pending run. Free clusters at the start of a later window
are then added to the old length despite the allocated gap.

For example, two eight-cluster holes separated by fully allocated bitmap
windows can be submitted as one sixteen-cluster discard starting at the
first hole. This discards allocated clusters while leaving the actual
second hole untrimmed.

Finish a qualifying pending run and reset its length before skipping a
fully allocated window. Preserve the minimum-length check and the cached
window optimization, matching the analogous handling in wnd_rescan().

Fixes: 3f3b442b5ad2 ("fs/ntfs3: Add bitmap")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/bitmap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 60b362f388d960558cd8ea65680df266e26dabd5..8875e6feff9c9715933545dc2fc173a191302ddc 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -1447,8 +1447,16 @@ int ntfs_trim_fs(struct ntfs_sb_info *sbi, struct fstrim_range *range)
 		if (lcn_wnd > lcn_to)
 			break;
 
-		if (!wnd->free_bits[iw])
+		if (!wnd->free_bits[iw]) {
+			if (len >= minlen) {
+				err = ntfs_discard(sbi, lcn, len);
+				if (err)
+					goto out;
+				done += len;
+			}
+			len = 0;
 			continue;
+		}
 
 		if (iw + 1 == wnd->nwnd)
 			wbits = wnd->bits_last;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
