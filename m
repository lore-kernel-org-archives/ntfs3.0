Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C352D97B7
	for <ntfs3@lists.linux.dev>; Sun, 11 Oct 2026 16:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735784; cv=none; b=PVr+DKZAZBYbd9CArpqiwFM1ltz0Jw30HouFnr8RMa6mYv8zBdF66JG9sBvPt3QdKLqEZX+xKehxHHHqex8/B3U3m2LQam4bMnkAK3msZwhHhyglYXuXM/NX4yFQ0i6pT6h1lP8a6seVhe06mPYd8VKzLrfyphuKCI6xFWJmWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735784; c=relaxed/simple;
	bh=na0Rs5cgYcyg96JqIx+sCGZR100qGX7janR84BnhWxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nN9aEgmvz6HzTk3x5SVw6XV+ywXyQ7wIB2r6hpA2emsoQB2KrCHuk3FI4OaVw+jXl+wzIH+wwcWiMFr3IVAnvQalPGsdUeqdvJ221seZ8L8m2BQfbpbPLqF/qzVhIxSVsOLDXQk4KzRUsrpDNPF25FPU3x6GsyNSiMuyp1uZAZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=Q9di4QWC; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="Q9di4QWC"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-535199ac562so13573451cf.3
        for <ntfs3@lists.linux.dev>; Sun, 11 Oct 2026 09:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791735781; x=1792340581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtDxIjzt4VQirv06ox/zVsY4rdSoAbkCVb7vU/cZ4HU=;
        b=Q9di4QWCqkl3TQ84aDcDGwJVCEVWT9x8LyIMyzCyJ46O8dWD+2fKvcRQIBBD5RVBVt
         PUvEnFdPhOBV5PDB2AqLprxqYICG1kJHFhqr8CZAkZtP5xYRT1Bbm0ZnuNk1fu8dfGU8
         pWZ7DvXE/zSQzcNUz02Rq+lNf+rr/UD6PAuiVAYef+2+tcyyLyw/Zs5680S2Sa0BECJq
         fXHgjxktF0Z7tr60tUqnQ9J8kkdqhNgBtA1zJfJQ0f9Hb64YefUmX1jiBrrX9ufN9Bu2
         wHjkFpgmNQqfOjkTVp6fczuV+9XHhSgFUz5Zfjx+5pgm7R+tcz6QCO1K99ye7MnouFmK
         P4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735781; x=1792340581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtDxIjzt4VQirv06ox/zVsY4rdSoAbkCVb7vU/cZ4HU=;
        b=MfXBgsXn7AgRQL1wRLo/lzffNJWqVKEk2Be0oGFaSErc02EUgCJ4vvGLW5eaUPuDeK
         6dJzk885nCbgTb45eMUQyX3qcyGMInV5uh8Pq+IyFWUKcPXqPlje8dBMPGkpwl4HSSyK
         9SKGKe4zq0M38wA4NC/gix9LfuG3WW5AedTW3RN2aGTZ/uCa91DugT0hcKmqsAlpyYTE
         64ZoTijcoC2imPDwZk245ZpDYTFtFSCUiKAtwtMahH1SOiVLGxc83SI08vI1SsCYElEs
         4hmUECNJvCr3sZmxSoQ1CQqXT49gkyZV1mjewvORkuZ4BkE4sugfTnIVn1AltWcHkExU
         Qe0g==
X-Gm-Message-State: AFq9FYIJZYBLEwWYl6cqWTNLJvAIZ4EoWsrnURiHpRznkLMbjs1hrEfD
	9GiTurijlQuYRTyMCDABfSHv44OKLLLA1mWc5ooiIbcS0MlQ2w3ckkcpZqpQkLNu2Q==
X-Gm-Gg: AYBFou1RhbL7ZvyVYhfV5v2AWlJrTw4yzikgtiHcwQnVcAyjUewyC4N+0Dt+G5JarmZ
	hop2nR1SFIUJHtiOlDjZLKK6hQofkbiTtPBGdnekzRvRL6bmVpj6mZTW3ySALboZc0EqJjwlkVB
	ESOa4Tce5uFnQ14g/4dLF03v21jr49G15shPwHOiFa/mEqWA/ezRNxd7DqyHDOZARNPkkioK8E4
	MhflFZifIzHZ2MZdMU5A+g8eNAimeBaTr/h6nLvDegcKR5+4Inq4tqxvY1BBhdGl/D58Hd9RxnL
	sa/QhKRsw36HtSsWHFBqsgaqkjQ4glZkM5oSGmQxveNN93WMqXPpazIEwfCPoqZcT1XnI0bFocT
	WUGunDqMG8Jpw0tknm7z0XTqQUt2hnWzDAZ77P5mJV1p5Fb9fL63WSf9UgMk+SYZfrxDD3o7Gvq
	j1J0jtnRmqY8HqExLgeHLStTyEI86IVygPvFuy/mHEaxIK9uBz+JTUkqIY0mo22C4kjtacflVaN
	EU2HKAhVc16AIggSA7n7Q==
X-Received: by 2002:a05:620a:2b90:b0:93e:561c:5bce with SMTP id af79cd13be357-93ebd295d73mr1148456085a.55.1791735781048;
        Sun, 11 Oct 2026 09:23:01 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98906c3sm671070285a.26.2026.10.11.09.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:23:00 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: stop direct reads at the valid data size
Date: Sun, 11 Oct 2026 12:22:46 -0400
Message-ID: <20261011162246.1580911-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
made ntfs_iomap_begin() report a read extent that starts below the valid
size as mapped for its whole length.

However, ntfs_get_block_vbo() used to end such an extent at the block
that holds the valid size, and ntfs_file_read_iter() zeroes only up to
the count it returns. As of now, a direct read that reaches the end of
the file returns the right count, but the rest of the user buffer is
filled from the clusters beyond the valid size. These hold old contents
of the disk: the rest of a large cluster, clusters preallocated for a
file that is being written, or what a truncate has cut off.

For example, on a volume with 64K clusters a 5000-byte file is read with
one O_DIRECT read of 1M.

Before commit 099ef9ab9203 ("fs/ntfs3: implement iomap-based file
operations"), the read returns 5000 and the buffer is not changed past
offset 8192.

After that commit, the read returns 5000 and bytes 8192..65535 of the
buffer hold the contents of a file that was deleted earlier.

This patch will end a read extent at the block that holds the valid
size, so that the rest is reported as unwritten and read as zeros, and
zero the tail of that block in the buffer also past the returned bytes.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
A test program is available on request.

 fs/ntfs3/file.c  |  9 +++++++++
 fs/ntfs3/inode.c | 12 +++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 95dfe6878860..1a3f1d1e6a28 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -905,6 +905,15 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 			iov_iter_revert(iter, to_zero);
 			iov_iter_zero(to_zero, iter);
 		}
+
+		/* The block with 'valid' is read as a whole, zero its tail. */
+		valid = min_t(loff_t, ntfs_up_block(inode->i_sb, valid),
+			      vbo + bytes);
+		if (end < valid) {
+			size_t done = iov_iter_zero(valid - end, iter);
+
+			iov_iter_revert(iter, done);
+		}
 	} else if (vbo < i_size) {
 		if (end > i_size)
 			bytes = i_size - vbo;
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index e6c96ef88b01..b9a5bf8352e2 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1056,8 +1056,18 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 			iomap->type = IOMAP_MAPPED;
 		} else if (offset < ni->i_valid) {
 			iomap->type = IOMAP_MAPPED;
-			if (flags & IOMAP_REPORT)
+			if (flags & IOMAP_REPORT) {
 				iomap->length = ni->i_valid - offset;
+			} else if (!rw && !(flags & IOMAP_ZERO)) {
+				/*
+				 * Read. Stop at the end of the block with
+				 * 'valid', the rest is reported as unwritten.
+				 */
+				loff_t vend = ntfs_up_block(sbi->sb, ni->i_valid);
+
+				if (endbyte > vend)
+					iomap->length = vend - offset;
+			}
 		} else if (rw || (flags & IOMAP_ZERO)) {
 			iomap->type = IOMAP_MAPPED;
 		} else {
-- 
2.53.0

