Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191E12D0C92
	for <ntfs3@lists.linux.dev>; Sat,  2 May 2026 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777719033; cv=none; b=eepumcxw8e1dfmZko7raFm/z9VUVrvuVQtWxK+yEs+Lyyh6cca+WW5AkwPldWkTZTEV1BrayY9IyvTQmuINOsbPakdnzegB2gmqqGCN1QERC1qT0XC7PouVcmd/fQ4pzFsLCL6W2CJglQlqr5nElEuTazVtog+5X84mMVe7OBFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777719033; c=relaxed/simple;
	bh=T0LW7yB+RCgEQIoEqn/+YxOuIPaN4zMuZoZmeMEwP4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fytJpfyA8q3TqqV6YOnmZhygpMV12oRoBaCsNb9y6C/9nLz90rhBwaca0PsUFteH9nN6E0rs7BbQFBMG0AlC9QlhG30oRTNf15LEygLQWzmW2m53byoPKfENdv8d2rKxONQxFEmxfdHgBJZEaYgbfUAk6ef69rFAvJf7QvH6j+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jeo+/hxi; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jeo+/hxi"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35fba4f0a53so423541a91.0
        for <ntfs3@lists.linux.dev>; Sat, 02 May 2026 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777719030; x=1778323830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExtEosiCiZz24wtaV6XMqbxMv7x6yLKAIrTwUeohUmY=;
        b=Jeo+/hxiF50pJ4efzURuAd/VxoXfH38J8LQ91Nye0RB6eNv9OqeMAeJEsApzMkShnk
         UQPbOQ4tuzV9mcb94kJPUxWrV68hEnZ/gYXKcxrh4k1AWqXJ0I9mJ+DZbcKAJ24e/fxx
         SAP4qBc8b+m8Q9q+6PqJzjYfxN6jn0cBrXK0v4zCRXKxMVuiMFvGvBxCz6msdgjxacVk
         /3zIlU0vlhnCIPs9owMHeox/2rKT3MO8OrOhchqDP8vvmwl6MuL1T0eFSLFQzD9I4NWe
         Ev/RBIRneLhiWqrwwuojNDSMK3tbRgZlef1FPkGtEGzauZFQqTCdWWOtDHLpb4xX9kpW
         o/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777719030; x=1778323830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExtEosiCiZz24wtaV6XMqbxMv7x6yLKAIrTwUeohUmY=;
        b=rhbmZCdainzBy99NWjCXhHcdS33sg9cOjxbbAjwXV8W8akUG/qSNJNQmJU6MSJT3G+
         VweZXiQVPjZVoBxOIejsV/Bjf3PGVGw4QgD76u5XBkG0hhoKqYD4CzluGBpboqP7l4Mv
         s6OJ8v/9eYMoXEAEBCPk/rNw0Q4P8HEP37nCi3G7v/8hnvIrWu4D/U6a+tfLwgAKDtWD
         EwSXudXsp9iD+TybNxPKhyBgdZxNbgan+lj7XDMfe4KVn417z9aCv6PZZQaDTVjV+DL0
         fpjsvU0ddwDXlkTH8mJ/26KYlWKMYB1kpGm9wJweRjrODnUZSU8ajJMQaMkJQkr355FZ
         qIhg==
X-Gm-Message-State: AOJu0YzP9VgyGGoL3I2VO8QlcVCgb1x7znAQyq9r9kDkhrU/oA2w0T56
	IMaAYFB+4TetLaRRmjN3kQr7XXwLdpVUU0AwovKCrE9mf3DUfhK3rpynEBL34i4H
X-Gm-Gg: AeBDietyCGphzq1TMBrzHi1kLOl7G/Pq7yMsXGpEaM9q+TPd3r1OCyVc99PSvBCfbxB
	siOo7nxQuv3WRuKaBFs7HxwvSMxZXHDYefBoWa3yGG/5iqGmrMphIw7uGjBRK4sIoZPA17eE4vo
	aYaFtnan7BklaTcWZDjVJfePz1PM6G+q5RLz6LLaWdZpEi+VoEjMeKvJmHkHsMKbK8v3xPLsl2w
	eJczyOlSv5P2oQL+QhwITxg7H2DR0A+6fyBuZpjB8o1JHtqJ9ifAwNyEm5UMtFLarKF8QzK5uab
	quyCUSlOYP/EzZn5oDJ9ru0WK83xzvBeNp23gjqefiDWwMxxiQvkCEYa0Ds0Nks82ysSqBnrKPP
	xT9ycnWgTqOtt8lCgl9hIOgdjZc3aaBBNeXnXIZNf5pSecOf2iPqBT0ZrFxfXKEbY3f43Fa2Dfw
	/RAU2tIr6XE0Qn4eYG8pFYmKdAO8PR
X-Received: by 2002:a17:90a:d407:b0:362:be3b:c8d4 with SMTP id 98e67ed59e1d1-3650ce10197mr1415546a91.3.1777719030297;
        Sat, 02 May 2026 03:50:30 -0700 (PDT)
Received: from kali ([103.195.202.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbbf298sm4482616a12.13.2026.05.02.03.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:50:30 -0700 (PDT)
From: Pavitra Jha <jhapavitra98@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Pavitra Jha <jhapavitra98@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix Out-Of-Bounds write in log_replay() via unvalidated data_off
Date: Sat,  2 May 2026 06:50:07 -0400
Message-ID: <20260502105008.21827-1-jhapavitra98@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

log_replay() applies UpdateRecordDataRoot and UpdateRecordDataAllocation
redo operations using a destination pointer derived from the on-disk field
e->view.data_off, which is a 16-bit value read from attacker-controlled
filesystem data:

    memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);

Neither check_if_index_root() nor check_if_root_index() validate
data_off against e->size. A crafted NTFS image can set data_off to
0xFFFF, causing memmove() to write attacker-controlled data out of
bounds of the NTFS_DE entry and its backing allocation.

The same unvalidated pattern exists in UpdateRecordDataAllocation.

ntfs3_bad_de_range() already exists to validate data_off and dlen
against e->size. Call it before each memmove(), bailing to dirty_vol on
violation. This mirrors the fix applied to DeleteIndexEntryRoot in
commit b2bc7c44ed17
("fs/ntfs3: Fix slab-out-of-bounds read in DeleteIndexEntryRoot").

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Pavitra Jha <jhapavitra98@gmail.com>
---
 fs/ntfs3/fslog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 272e45276..c0237f7d0 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3487,6 +3487,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 
+		if (ntfs3_bad_de_range(e, dlen))
+			goto dirty_vol;
+
 		memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);
 
 		mi->dirty = true;
@@ -3679,6 +3682,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			goto dirty_vol;
 		}
 
+		if (ntfs3_bad_de_range(e, dlen))
+			goto dirty_vol;
+
 		memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);
 
 		a_dirty = true;
-- 
2.53.0

