Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B401398
	for <ntfs3@lists.linux.dev>; Mon, 15 Aug 2022 11:07:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bv3so8682200wrb.5
        for <ntfs3@lists.linux.dev>; Mon, 15 Aug 2022 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=0w9+PjA609EvTdhJ21FdPZXkjOwyQWsh3sVgxJTFZ6o=;
        b=mpIQlUx8naMiLfDubLm93ghNfu2hM9q79depVhpdHOHndayUW+ZQqz3R6VCFDtTWaV
         dqU1RsDPCKbEvO772qY0rFXbU0jSZmMJbIws0Afa9Bxo1bJOaTbAd1pZQSmP5vEOCKsK
         i/c4Id14Mu91nbCJVk1FfQoyoi+guS86d8/S9yGGmg35o8bhJiUpqZUuxHEuBfJQACw3
         jXH9qSKAUvBsYHJ+ZegPDcZAJ7xOQHAKOCHGKEHkNLqSkqIFJF18l7sPDEGolyOMgRnL
         52+CvGaw8LTAZt2LjjNWTPFJnJArztIZry18J1ZzHAVhy/Lvp1RYVNs2m7WtFU4iR+f3
         NUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=0w9+PjA609EvTdhJ21FdPZXkjOwyQWsh3sVgxJTFZ6o=;
        b=muQ3+ypjIxgzW4yrjlblpcfOXb43DjJHoOiW0HvFjX1FCZnwVavq5132gQlAw4iQx+
         d1Z5r+pWP+B5OLhYeK1P/cvvo4oy+t/RlbXq3T8ga/CPmwRKZD3ZhvvGQkCTHEr2vn9M
         kTxRdILda4EsX/j1Sr1ksWoZsIdqvos7knlLZpRwxf8wMny3fO6AUWc/0F2izOgDn47H
         Ksot7Ekrh14kphPpQ2tLKlUQe7oOdymGbH6z0Fjio6JvH26bzYM6HwXJa8RVNbF6rXnP
         NfUezAKO1mfO7y/JUn5oi0KdAHvcinp/399081de4SXoyuUbbVG9pOFnCeT1Rwxz6pzL
         GmEA==
X-Gm-Message-State: ACgBeo14roNY1fFiJV1YU01gUdIGxQcLsIf3wCWRYoFiz8vNpRbOcTvr
	tU1XXTcQS4FmlVKBEzTYREI=
X-Google-Smtp-Source: AA6agR7i31Xj+ZM9+1J0Djq7tauEnM82gZdc579QUNS1r4rvynLN98xgq8/gthUZVGoQ9ljutmcSQA==
X-Received: by 2002:adf:eb50:0:b0:21e:3d13:3a91 with SMTP id u16-20020adfeb50000000b0021e3d133a91mr8213168wrn.484.1660561647708;
        Mon, 15 Aug 2022 04:07:27 -0700 (PDT)
Received: from localhost.localdomain (bzq-233-168-31-62.red.bezeqint.net. [31.168.233.62])
        by smtp.gmail.com with ESMTPSA id d2-20020adffbc2000000b002206203ed3dsm6996651wrs.29.2022.08.15.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 04:07:27 -0700 (PDT)
From: Alon Zahavi <zahavi.alon@gmail.com>
X-Google-Original-From: Alon Zahavi <zahavi.alon@gmail.com
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Alon Zahavi <zahavi.alon@gmail.com>,
	Tal Lossos <tallossos@gmail.com>
Subject: [PATCH] ntfs3: Fix attr_punch_hole() null pointer derenference
Date: Mon, 15 Aug 2022 14:07:12 +0300
Message-Id: <20220815110712.36982-1-zahavi.alon@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alon Zahavi <zahavi.alon@gmail.com>

The bug occours due to a misuse of `attr` variable instead of `attr_b`.
`attr` is being initialized as NULL, then being derenfernced
as `attr->res.data_size`.

This bug causes a crash of the ntfs3 driver itself,
If compiled directly to the kernel, it crashes the whole system.

Signed-off-by: Alon Zahavi <zahavi.alon@gmail.com>
Co-developed-by: Tal Lossos <tallossos@gmail.com>
Signed-off-by: Tal Lossos <tallossos@gmail.com>
---
 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index e8c00dda42ad..4e74bc8f01ed 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1949,7 +1949,7 @@ int attr_punch_hole(struct ntfs_inode *ni, u64 vbo, u64 bytes, u32 *frame_size)
 		return -ENOENT;
 
 	if (!attr_b->non_res) {
-		u32 data_size = le32_to_cpu(attr->res.data_size);
+		u32 data_size = le32_to_cpu(attr_b->res.data_size);
 		u32 from, to;
 
 		if (vbo > data_size)
-- 
2.25.1

