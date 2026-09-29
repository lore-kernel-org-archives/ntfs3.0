Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484A4E73B8
	for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672712; cv=none; b=X6N3+okZnwEmlGMV2Cbd7u4FiOlDaU6FoQVVcfKmfRgSTohdlwdqqvGppdU/6VF3SWPP+fE6Rb3ColhvzKxvmThIlrDBbuo8WBMvMo3V0ZOy+Z+zuXxpYDelNYjzsRVEhXn8HbUY0AvimNXycNvQa+Isye1/P+MRAt684GG6LHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672712; c=relaxed/simple;
	bh=FiEp6acjtn9ALhNmIcpqBLTXpX9E8ix+zetdX0cVGG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UskZYjwLJhb23ioQ9AapfsauLn/hQESL0hqf3hA5VMR7b+IFq8D4QZ+daX7U1uQAGsKhdCT7pB3cYc7NNXVgDjhjT+PaeUj6K27fuVlWvkCi3T8WVpL8FyjZgmm6Df7wjq4GpTi465f5vOEHSNbDvyvFuNAM9oeJBbF9xNoSLhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlvFQg47; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlvFQg47"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso1941728b3a.1
        for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672699; x=1791277499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csdBaSA1RBXlbCQfI6nEWA/gudC+45f46pCBbw4ADqA=;
        b=SlvFQg47gm/FSEXiD6xvKZ+jbtKyYRxQqndsUniz9PKXxLNpwHIM4Pgj5FNw653A3O
         jOQl264xPD6CnKKNg98U/zaHm79ARYD+9KvYlBKrBupohs+5lELqxVCJhY3BOZ7GvZNZ
         ufcwxmPaSFlh9kl6wFKhg7mBCGWn0+Ivxfj9nFmUv5UBGdX1kYYhMut9WLF58+CGHRXb
         CqrGXhW2dbEyDnEzM6i+T2Yau5/LUq+yNzMULMzMlLyezIbqsb/b8eudQdFvLhNpwDd5
         ehkbBv45yeUpHjtUj+5UGwCHBc1LUlwxA+NQImKvHTPvqzFEOZ58CzsG7elCwbof9KPq
         f5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672699; x=1791277499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csdBaSA1RBXlbCQfI6nEWA/gudC+45f46pCBbw4ADqA=;
        b=jz4mUpB6g7l+/HSEoEXFtOLaMZyoz9xGVqj+jPbRubEiA1W0tz8jItWNaKHaDTTkcf
         k953lVZdEzqNbiKCHukReXKJN32FIQlMXXyTgtRk5iwsPbsAYwhXSkVX9S/2vGAgatus
         2jPYgOsv2mirH6e8fuCbzXjrjVj7U0OlHF5yFl9ZgbBq7pQiXpPupaTl4IB6EK+SXkYr
         1q+4ksGRfUNfMFN9cuUewGwfWldCV5158rL2VU68Of0SZJHzohMvaKMd+UnSTlIsfQp7
         Y4LfWwD5iBmSEh/dZv+aBJS+NanjuCnZMivlXreXzXpK0VVKTsFqXaezldzov7EWVsIV
         E2+Q==
X-Gm-Message-State: AFuF++k+McRgbnbXEnt2Si8xqHjW3C2pbzfzaFAfOG9LFNiTtNz2sR3M
	SBt1z053DnEMX/U7mT8OEiJzX/aLaFXaf7LOfSQtIzhR26RD17pUNBfQ
X-Gm-Gg: AYBFou3dajT8SnYwcAPAhcFcWmHKMs8+fYOXSKMp7ISl8Bs5HPqFm+QbMB7DE4dtEZi
	E6p5J81O8o2GWtQoQyigRcSyzufa7K7Kp0V2Re6JFLK7hxLv0bSWDMD8HiNKmZd0UUbj6HUIv0e
	russkCXW3cFxFGOQuZpouitPE26rwk200ig1BG+Ckjq1kWwwm/jC3RbJ0af9fImek1HRbcBwU3j
	M5TKY8ct5bfCCmTdBD2skSlqP1QhdS8/AWIhhIvcBKXiVhKMLxVFXP9eEDrhT+O6E0M+wGt927d
	XBK39GoBnWJdt3fA1XNwA+1lOD6dLdX1vjtKTuWK5IKnHrfNtFzJarG0sSrWGiPSCw+atYM8WUS
	xSTbgBb/VParJsDmbwW2MS/EidMBby3Q//dsB4hbFQpeMzmGhq+v27elnpENFBYrxJXuoczUK21
	OQs8QGWrJp0jypQnyvOTf+L3u4qJoUfNGjSa9PoHQPyB2v8LM6pG30QRp3Xi7szbBAcN1r
X-Received: by 2002:a05:6a00:b44:b0:885:153:c3e9 with SMTP id d2e1a72fcca58-8850153d764mr2838568b3a.50.1790672699503;
        Tue, 29 Sep 2026 02:04:59 -0700 (PDT)
Received: from gmail.com ([111.55.96.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e163d39bsm460270b3a.21.2026.09.29.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:04:59 -0700 (PDT)
From: Xue Boyang <fuchen.dust@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xue Boyang <fuchen.dust@gmail.com>
Subject: [PATCH ntfs] fs/ntfs3: fix out-of-bounds write in UpdateFileName replay
Date: Tue, 29 Sep 2026 04:04:52 -0500
Message-ID: <20260929090452.224281-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During $LogFile replay, do_action()'s UpdateFileNameRoot and
UpdateFileNameAllocation cases write sizeof(NTFS_DUP_INFO) = 0x38 bytes
into the ATTR_FILE_NAME structure that follows the target index entry:

	e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
	fname = (struct ATTR_FILE_NAME *)(e + 1);
	memmove(&fname->dup, data, sizeof(fname->dup));

The gates that run before the write (check_if_index_root and
check_if_root_index) only validate that the record and entry offsets
land on boundaries.  Neither checks that the entry's key_size is large
enough to hold a struct ATTR_FILE_NAME, whose minimum size is
SIZEOF_ATTRIBUTE_FILENAME (0x44).  de_get_fname() applies exactly this
check at every other call site; the replay path omits it.

With a crafted $LogFile whose UpdateFileNameRoot record points at a
16-byte entry with key_size = 0 placed at the end of a crafted $I30
INDEX_ROOT, the write lands past the end of the kmalloc(record_size)
MFT record allocation:

  BUG: KASAN: slab-out-of-bounds in do_action+0x14af/0x1d35
  Write of size 56 at addr ffff888004046be8 by task mount/71
   ...
   __asan_memmove+0x3c/0x60
   do_action+0x14af/0x1d35
   log_replay (fs/ntfs3/fslog.c)
   ntfs_loadlog_and_replay+0x2cb/0x300
   ntfs_fill_super+0x1375/0x22d0
   ...

The write content is fully attacker-controlled (redo data from the log
record) and the trigger is deterministic on every rw mount, no race.

Reject the operation when key_size is below SIZEOF_ATTRIBUTE_FILENAME
in both cases, matching de_get_fname().

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS3 filesystem")
Assisted-by: GLM:zhipu-coding-plan/glm-5.3
Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
---
 fs/ntfs3/fslog.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 498f63da2b96..ba61767cab3f 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3557,8 +3557,10 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		}
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
+		if (le16_to_cpu(e->key_size) < SIZEOF_ATTRIBUTE_FILENAME)
+			goto dirty_vol;
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
-		memmove(&fname->dup, data, sizeof(fname->dup)); //
+		memmove(&fname->dup, data, sizeof(fname->dup));
 		mi->dirty = true;
 		break;
 
@@ -3742,6 +3744,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			goto dirty_vol;
 		}
 
+		if (le16_to_cpu(e->key_size) < SIZEOF_ATTRIBUTE_FILENAME)
+			goto dirty_vol;
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
 		memmove(&fname->dup, data, sizeof(fname->dup));
 
-- 
2.53.0

