Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22DA3BF684
	for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 06:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195784; cv=none; b=QXJIfB4icPxWlGv/aAWzCPcXfb5XLhCJRI9K4dCrcjDk1ci68n3nO25KYMgxmzTx8uI2tRsMmWGS2VT/O4Kgo0EzBaw33awFshY5Kek4E5DHpaYOHTlzZyBJyCJ+5ytYklPiP7pdZifxOMO72X914i/zxZ9HGtURtlCLKZYF+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195784; c=relaxed/simple;
	bh=h2GiLVpsi59JQOStQBTzHQuFKkm/p6zC/3WNnykOkas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pjM7oOEgxS1/vMMPEgjhhymT62DCMMpDUDWJHjZUrokfWBsl9tJDFoT7Iror6TWM3p4Vextjh79W62qDHb0OcbwNaxN10Qc78U9W2Apqe31fL6s+giIxw1R+a/YkGaiR8mUeiMLh8jmknkR+ZWTDG7vsVtgUcFegN2iRO4IC2Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3tSNWI2; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3tSNWI2"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1390f75d8bbso5220142c88.0
        for <ntfs3@lists.linux.dev>; Mon, 22 Jun 2026 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782195781; x=1782800581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DcONxe5c96Wykb/9Kuf+4ZAJsC3OiG9uaaEBTU56N3k=;
        b=c3tSNWI2pFHVHBZz57tTC/IrmeQyfYGFq6zqH9xnztucXGDRqknDQcvg1HXgti6g2i
         OWBhBlHtydCRNWLfneXgtYw4mG/qXQ4u/QYI0vRUS0s7yFrKpfuEtAV+PINwIKLrv2t4
         nYBw91cgFIeh5r+qwaABPEdQNO2JAs7HaUI7/5qLD2EAQZYhsYYjJqxPVXyMx0N/hp56
         w0Hui970XStsvr9+UFbYoA3UifGFwH/pomkwwWMOM354WMRAhPFApUYM3KnyPaKj67/S
         MVUFS3EGC9z4pOzDQ5+S9eG9o86bvoxRH+uW56rmV6JxPMuheuCBgl31QdjyFIYAwhTu
         OrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782195781; x=1782800581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcONxe5c96Wykb/9Kuf+4ZAJsC3OiG9uaaEBTU56N3k=;
        b=kzl0G7SHjDe6Vo/u3cENaOwRYJuhlgyLg6Cb3dAoIWvu//NYKCsOr4pd/BVYVIhX8y
         Rb02uwQuWJzE1PqyPYJ5EqW1Z5HizLaY3dXm/uxOofVTUUr18bdmIgjRAPeAHbprYWst
         kZ6OABvBHfhb72d7u2U0p3Ih0H9+XFjDFl7bRoy4XXWXSfxveYLAM7eB8ldPyGxMPZ1z
         PEM1tnGy9uAEYwjMtDkElgq+eCvLOeFAuvwV7/YbgaaXpmCBGs/tXZ37YB6Q/W3gHCi0
         r2HFIqmbVksjOu1fvrVygxKP1GQXakmIt97Y5uoYGhZBX271tMSfAXTwiie4qqEJHE2a
         T1jA==
X-Forwarded-Encrypted: i=1; AFNElJ/cjgG0PntA6hezYd8EFb7Rb1+VJdJnHWzlLXaf6Jy3kUvA+0CQZ8qrnxv2c0UnnI+C4MGzZg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0FkeXrfrjkXsmQL3CmwS6JGsZ9zu9qvYiPyHtXla5XI4zFFec
	U84QyR0LtHW1Iz7NbMDfZWw/TzFYe8ouOaWONBchgwyyEbQ4O4w1NMHi
X-Gm-Gg: AfdE7cnQcJF94mD0p/fWp3L0gFYurx0hU33Y4Wp/vSR0sVEiGLbAKHK2RkrB55TbGMI
	aYgPZaoAtiyP+Z3VZs/hJNRJBmP5CL3Zu4Id9SSv1g3jsh4Er8ZvDiexuJD8SLzbIKH4L/FMLPD
	LJFaQPWDu4xKORQF2d5h8KsOt+sQTWx5K0G6/qMZa6ZD1rGbRm8g8hiJs3Xfq8g49cWqco73XiK
	btXsMU4DgARvlnXYCXCbooVbL/RJZGmq+teufNdqBqbPy0UJ9OcY/lXczSyjgKbvW0u/7itg0on
	qWG8N17LE2wYd/NKecHPq75J2N49BEYU6CFNOR/5yuF5ZyWMN+jhKpRPV+yBjmTHj/8YPZBd9A0
	/ZuKLkGAL0oKSr6IUrgLKWEbrolwqvp85TbSbm64qcpBWUQsveyE8GlIkrQqymeGKCqfmuf+pAz
	Fpr4iO8DPjQ/8fiLMDEr4oe3m9W+L8Zifz2uK0CyCefj5jOGPKtPuko/gd7g==
X-Received: by 2002:a05:7022:609d:b0:12d:b993:c68f with SMTP id a92af1059eb24-139c5ce08c3mr1053598c88.4.1782195780581;
        Mon, 22 Jun 2026 23:23:00 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adcb7a94sm11091538c88.4.2026.06.22.23.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 23:23:00 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()
Date: Mon, 22 Jun 2026 23:22:31 -0700
Message-ID: <20260623062230.1236506-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

read_log_rec_buf() copies a log record into a caller buffer starting at

	u32 off = lsn_to_page_off(log, lsn) + log->record_header_len;

log->record_header_len (and log->data_off, used for the following pages)
comes verbatim from the on-disk restart area and is only checked for
8-byte alignment in is_rst_area_valid(), so off can exceed
log->page_size. "tail = log->page_size - off" then underflows and
memcpy() reads past the page_size-sized buffer returned by
read_log_page(), spilling adjacent slab memory into the replay buffer.

This is reachable by mounting a crafted NTFS image:

 BUG: KASAN: slab-out-of-bounds in read_log_rec_buf+0x216/0x580
 Read of size 64 at addr ffff88800a877ff8 by task exploit/127
  read_log_rec_buf fs/ntfs3/fslog.c:2299
  log_replay fs/ntfs3/fslog.c:4216
  ntfs_loadlog_and_replay fs/ntfs3/fsntfs.c:324
  ntfs_fill_super fs/ntfs3/super.c:1392
  get_tree_bdev_flags fs/super.c:1694
  __x64_sys_mount fs/namespace.c:4360
 The buggy address is located 4088 bytes to the right of
 the 4096-byte region [ffff88800a876000, ffff88800a877000)

Reject an in-page offset outside the current page before the copy.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Assisted-by: Claude:claude-opus-4-8
Reported-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/fslog.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index f038c799e7ac..ee413dc80d3a 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2276,7 +2276,15 @@ static int read_log_rec_buf(struct ntfs_log *log,
 	 */
 	for (;;) {
 		bool usa_error;
-		u32 tail = log->page_size - off;
+		u32 tail;
+
+		/* off comes from the on-disk restart area; bound it. */
+		if (off >= log->page_size) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		tail = log->page_size - off;
 
 		if (tail >= data_len)
 			tail = data_len;
-- 
2.43.0

