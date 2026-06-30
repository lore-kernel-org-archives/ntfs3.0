Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1506B270EC1
	for <ntfs3@lists.linux.dev>; Tue, 30 Jun 2026 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854280; cv=none; b=eXiU+WrkFqAUEZ2axv1oLX4i41TowqXjgdukAtenYzCKjTCxgIGuDbpUfSbXWB+7SManVpx5Gg5KJt+2n++B1U4XqpcjV6pFDDJncwae0s0Y65p8M3IJJ0AKI7WfQBOrNzVOziR72L/HBpLkHoZihsIT3sE3EBpubAqFtX/rPgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854280; c=relaxed/simple;
	bh=1gfTG8r17InAvWVOuauyVqtQhqiNXbc6nH97XNyOiec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sqysz8Ll7kO4B9aGmfzoylfCpRstydyeTUAB4mQUsev77NKsA8fJf1jxRvt0G8RTH3CSPuMJVFBted4ybYBY7MAcO61hrnMphke5gwIsoxyLq+FQz3G/l7Xzp1Kx8ZP3I4kE8AVEEwBnd/dL3JOIS5C0fuiwv9DftBEHHwtxGXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jnrorjlw; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jnrorjlw"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8111c0c7561so11180137b3.3
        for <ntfs3@lists.linux.dev>; Tue, 30 Jun 2026 14:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782854278; x=1783459078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPhVhhlEs/4/VupytmipRMbVj77VuW2OuCbqLDIFyug=;
        b=Jnrorjlwn9Fci1z/nmeVAfXLTcxil4UHM8GejmhHG2FQsxSvwWmry+Z6AxNxuywrZ0
         VERgeYkyxFzck8b/9+O4420Mu61u+cq9VJa0N/rflv1SPACxI+pwAUFfvhpyzUEOyVgc
         XJhqVg7c5bVhyrz7WcN7dXzRLftgY/qcjHfASbSb2/mDvaBX9W5v03Ma/04wJsALNumE
         f0gc7cjV2NNNd9xSIBGVLuegVq6da+wRy2IsJZ/ZPtnGNKDQ9c6Th/6fr7eL6FTx4ZNd
         YnK/fjQz+69xMb30j7fRSPNnQGuZxMllib1l5J9WBMC2spRw1ipBuz6xJ4cdt88S1HBq
         tQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854278; x=1783459078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPhVhhlEs/4/VupytmipRMbVj77VuW2OuCbqLDIFyug=;
        b=OlHLbHZJbpiGNn+WgsMK25ul4EDerMOHUjkDK2BfQvi4H286alt+xqoEFeSDnnFMLt
         SY3sjnKcUK+u686nxKjfhUJIp9MlSvLK16YmBMWUBv9FK/jFrhyoWsnqzAdaQANI6/ip
         ieqc7W7AB97u5zuDZSx1+3z+b4dideQSwZSQ8EqdS3b5eI1uoC1gumhBGJM3ckFjT9yg
         E0XgOvWpl5YlFFNigZmheQ2R4/9q7CfWKPj8oV/nHnep/xcCwxyi1UUzrVoxqvqqK+HA
         kJGD1irNTIQHK/mSpMPRQIAvrBaIOWk/JIpQbx41jIcEMUhA8vw5FWRkpYJHf/N8AS4L
         eh2Q==
X-Gm-Message-State: AOJu0Yy6urzrh4vMhBpaviX/p1P5XfKh30ePPNbjQ6ujPOl2+XLV82+0
	JsIbOv8m0t596hV2HFePrZ1pQ9BSrwN0SxwqdyQio2e5ew2amtSUVm8l
X-Gm-Gg: AfdE7ck8lTMgOrIFuRqWbW7vr2MPy9eXa/RLQci5W5UmweWZ6As0esjpBHpESCatSq7
	Hqy16eTAI/fAL8/NTGWLS8vs7iLy9SvEbaN4e1hrJCxJZ7aYSHHwkzN0xAE9L6ZQ1AmaGXbHCCE
	CxXR8guN5EpJX54H638kh1yrhiJ+C4CrzRnOnoXjRwDwpQbuybf9NjgvKqp1PTNqbkMYl2gnp7q
	AghwciflP3wUJPjavYXHRf7Azhy2vG03r17oaZky8GZpSiOxkmJgHFBlEG2KT9KYUWWcisKPYHM
	GhUx5lp/8JSq00MWP+KL+v6q8Nb2P2an3TIQ8lC42qhMT8wbhcv1oMDA9YG2ZiJ/Nhbkwvh2eI6
	SQQNm/wRDYzhxFObWQG4AyCRRZrs67eSe+jgNx5thgmO3OKwKKQoRCGVzmkc5x9GClkz9K6uyH1
	iw/ObnwLZ4QRRFKTWUv7smvQXuXtZZj66osNhR
X-Received: by 2002:a05:690c:670f:b0:80c:85b6:765f with SMTP id 00721157ae682-810da90d417mr63206517b3.68.1782854277959;
        Tue, 30 Jun 2026 14:17:57 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8128d450908sm13827b3.36.2026.06.30.14.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:17:57 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+4b4ec878e25fafefa70f@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] ntfs3: reject empty iomap before reading its LCN
Date: Tue, 30 Jun 2026 23:17:43 +0200
Message-ID: <20260630211743.50400-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attr_data_get_block() can return success with a zero run length when no
cached or on-disk mapping covers a read VCN. In that case it does not
initialize the LCN output.

Check the returned length before comparing the LCN against the special
mapping values. This preserves the existing -EINVAL result for an empty
mapping without passing an uninitialized LCN to the comparisons.

Fixes: ecbb433f9a8e ("fs/ntfs3: fold file size handling into ntfs_set_size()")
Reported-by: syzbot+4b4ec878e25fafefa70f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4b4ec878e25fafefa70f
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 fs/ntfs3/inode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index c43101cc064d..a428f03a695d 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -777,6 +777,8 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (err) {
 		return err;
 	}
+	if (!clen)
+		return -EINVAL;
 
 	if (lcn == EOF_LCN) {
 		/* request out of file. */
@@ -811,11 +813,6 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		return 0;
 	}
 
-	if (!clen) {
-		/* broken file? */
-		return -EINVAL;
-	}
-
 	iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = offset;
 	iomap->length = ((loff_t)clen << cluster_bits) - off;
-- 
2.55.0

