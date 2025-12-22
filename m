Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968A5320A2E
	for <ntfs3@lists.linux.dev>; Mon, 22 Dec 2025 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416222; cv=none; b=vGK67hRGyJjDbNQZ5toNuTTdzf1SewysjxPdBJqL/YDzH7XmsvNNxMqq8Wt+lgdL5PIB3aX5/VgaN0LCfFq1pL3unaX3u2csnxNyZU3nyRESJzChzgFNgc0Nbcu2blRYqJ56IXQNSleZBZA1/XDWfFwr/EGUdhN9foinsmY7zjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416222; c=relaxed/simple;
	bh=SfqGh80I8FrcSVKXevuE9/FvTdIBLuY3heHppSf+wgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HfmySZRKJCIujIv1sPjyFz910E+a3HXDEpOY+yNba8Ujz1M2TRB1ptzp/RSCIyB7Rw4jZGa+SKcOssl9xhgJfnY6xt3vR/7jRdMNTo8iN/Fim4BtT2c3yAZT5//xR6zEtsI+gXH8fJbHGZ+bQLiwbZgRuN9QZK+SDThWya8hUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9KnV1yi; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9KnV1yi"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b73161849e1so880324366b.2
        for <ntfs3@lists.linux.dev>; Mon, 22 Dec 2025 07:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766416219; x=1767021019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HlPdAwyqnDxqYQtejdfqu1lBbHFrUQJCJLatEJiEsKw=;
        b=c9KnV1yig0RBugAOgOmA5xdcxbx9znVLjpZivobf8qWSwcK6gxNWxWc33Nh7G4XJbp
         rIZnslRZojKmGAQznQPbZGdg/esJJewaf4elMIAQdPIYKdkqK15bnzKWj0wlXbtaIues
         Qi6cTK0XHhO6l51xUiLizAgC91XSkUaXQjNfGFn1G8XQYlm/rIE1YDR9/oOzIzWCbYTv
         rAl7Vvj50f57dVgB7l132Y6Qq103wxHTNETsU/bB8Y6X3JYIokdAxYvW9+ojSHpGmSyk
         57uQXWkDF1/TuRi48M2D7BNd9VDf0lGocL6TKYwanvvuZiZTUhKDuZ/r5rvhjuqzOpNu
         I6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416219; x=1767021019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlPdAwyqnDxqYQtejdfqu1lBbHFrUQJCJLatEJiEsKw=;
        b=CBtnW1ActlN92ig8NwYioqvmgqZmFM7Sgwd1k8JjcVfmcctM2NHk5WQGSyxD8+qhlQ
         IAyIG+QDw/3L8xpV9htWsXDOq6tJeaAmc5fKjMzaqrN01Sk/sDM++Q0/HhiJ4M6X0j7c
         6c+AtV6B0HKbvQK3ukFjC9aSMfU7Gl6AIBG0oSo4QPjUoLr72daIfP9PO1Y1IA7ZWoed
         gL7yiLnhMpkS6M8DLJs7B7iynoVKDxeEXlNmwx6pJlcnxM7Oqarbthfo5C0k4n2ZA/dJ
         MSX8krZwt1ZVMP+OAPWYy2pM7zyBS0ga7GtlPia4B5/IADz5HPIkX6R6/whCkWSew4dV
         WLfA==
X-Gm-Message-State: AOJu0YxBsBtdyFyrnsKoZtJBf/6Enn+qdFM3jgqDyxorYD4ylVAiAnSE
	9Y8RkHc7VOdnQqp/ajGoGuETLJqHysjnsluHk2+Ez/6BLuV1b9wEJ1oO
X-Gm-Gg: AY/fxX4lVPiU6BVKa8OpYkd94kFWuS43Qf3BxcjD+3D+iWFqepDzS83mjreGBaAoKNa
	E+5bJL0nsuJpvKe5yTAJq/M5bDgr1TXcsJi5esvXFSfIQSFNqIwU4Bj1hSBXcGMmNmLuDbWYZFT
	7n1CrMuesTXhHThiJ7CsVZp4wiEQZ2BbNdf1fMI5OqSzEdaEqWy7zusrMwgI0J+DbNeq6c5u+gv
	yM2fJTanen1zvuitIbH7uMMSg4nU7ulMbjhBfcmgAcfBpXaGSYhkv7ecHjd5KvYrw5TEE/Y/HL3
	NhyLnOFt67TwaBi6XhtPPq6J4J9jGYa1q+mv5Fiv6+CnF4luYuP4WSa2k8CiB5y/MDeSyVKnEaf
	DLPozf6ASGUTTY18x83q+25DhopUfPUdqPLhqhchFhZIA87rpZTwOy/rSzv0zyVjseEZVgZUj+c
	4=
X-Google-Smtp-Source: AGHT+IE+DjLxllFCwHUucgC2ZGTAQWGoVl85Y1fOrYxe1JQ5f1u8ECZC9skOekjzzCH+Nvc7RsyrEQ==
X-Received: by 2002:a17:907:6d22:b0:b79:f965:1ce1 with SMTP id a640c23a62f3a-b803705df6bmr1191603266b.42.1766416218828;
        Mon, 22 Dec 2025 07:10:18 -0800 (PST)
Received: from prometheus ([85.11.110.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80426fc164sm967450466b.30.2025.12.22.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:10:18 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+5af33dd272b913b65880@syzkaller.appspotmail.com,
	Szymon Wilczek <swilczek.lx@gmail.com>
Subject: [PATCH] fs/ntfs3: fix deadlock in ni_readpage_cmpr
Date: Mon, 22 Dec 2025 16:10:10 +0100
Message-ID: <20251222151010.17263-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a task hung in ni_readpage_cmpr. This is caused by a lock
inversion deadlock involving the inode mutex (ni_lock) and page locks.

Scenario:
1. Task A enters ntfs_read_folio() for page X. It acquires ni_lock.
2. Task A calls ni_readpage_cmpr(), which attempts to lock all pages in
   the compressed frame (including page Y).
3. Concurrently, Task B (e.g., via readahead) has locked page Y and
   calls ntfs_read_folio().
4. Task B waits for ni_lock (held by A).
5. Task A waits for page Y lock (held by B).
   -> DEADLOCK.

The fix is to restructure locking: do not take ni_lock in ntfs_read_folio().
Instead, acquire ni_lock inside ni_readpage_cmpr() ONLY AFTER all required
page locks for the frame have been successfully acquired. This restores the
correct lock ordering (Page Lock -> ni_lock) consistent with VFS.

Reported-by: syzbot+5af33dd272b913b65880@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5af33dd272b913b65880
Fixes: f35590ee26f5 ("fs/ntfs3: remove ntfs_bio_pages and use page cache for compressed I/O")
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
 fs/ntfs3/frecord.c | 2 ++
 fs/ntfs3/inode.c   | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 641ddaf8d4a0..f09a149cff9f 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2107,7 +2107,9 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct folio *folio)
 		pages[i] = pg;
 	}
 
+	ni_lock(ni);
 	err = ni_read_frame(ni, frame_vbo, pages, pages_per_frame, 0);
+	ni_unlock(ni);
 
 out1:
 	for (i = 0; i < pages_per_frame; i++) {
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 0a9ac5efeb67..33f819b162a5 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -735,9 +735,8 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 	}
 
 	if (is_compressed(ni)) {
-		ni_lock(ni);
+		/* ni_lock is taken inside ni_readpage_cmpr after page locks */
 		err = ni_readpage_cmpr(ni, folio);
-		ni_unlock(ni);
 		return err;
 	}
 
-- 
2.52.0

