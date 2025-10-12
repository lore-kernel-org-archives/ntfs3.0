Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41393223DFD
	for <ntfs3@lists.linux.dev>; Sun, 12 Oct 2025 20:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760300281; cv=none; b=tbw55KykURi5Yg5ALGr8dWPp+HvMapduybAigWuG2dulTcmO0KMa9zwz0r20iq/2vNVBG91bQG/ijh5icFFjaUm7DAmbTdPcUwyRkw9Y/Gg6IUnjEqF5G1O1kqRcbhiOsbfmUJ4xltMXXsCzK7xCA/UjJszJk9HHxmeLIv4xJYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760300281; c=relaxed/simple;
	bh=7TgWHHpxv+HeA3DLK127FYyUNPx+CBHJ6cbxxBcbkzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h7KuHSpE+kHTH3Yuzp0HL7nKiBdOsZ6Iu2/iQz59rNOTaP8JAWxkfG2RBoZ89ynNbkkZL0kUX7qDHmOrekrBnUYuj1PGHo1TLLK1+tfeVDWIqtom10UOwdhUUbker45m4XvG4MCUoqLEWtT7mnV/UAduY4Jb6X35dHq1ej+kD1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5iOHcRg; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5iOHcRg"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-78eba712e89so42343196d6.3
        for <ntfs3@lists.linux.dev>; Sun, 12 Oct 2025 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760300278; x=1760905078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EfJd41GGgbsw5kea6lHDnwRMbxMS1g92zUpAQvrRa8w=;
        b=e5iOHcRgxy0u7izfqEXbZPvwyvHy0SqLymQbjNktNVFCFZt3t26FIUF/MtPaEQ1MNZ
         Gftr1ol8ZIRdJoRJ+gZIM2H5/qycPPYiCHRLEwvUkAn/FcfpXwNj3rE9dazdO3mIXJUT
         lkIWU5Udjza3KFn14bz9vfhAtBzo5AoDjuJYjEr4MubhazFxFrIwj5ncHYcRFBN2yFUV
         06PcRw58wrX81b8fOxCgeGELnFt3uLhVudXrtBZUnL9gPKYbd7CPD2951spoiL1Uvdvp
         yiEPgcfXWErs4FHMT2Yqed/jxwQ7T+vDDaSZsfBoZ66Zt55DEEmdNCF4KlZprRfk3UxT
         4aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760300278; x=1760905078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfJd41GGgbsw5kea6lHDnwRMbxMS1g92zUpAQvrRa8w=;
        b=g7Keh6Scfrj1rZyHGWdaFh+SvS+vF5JcwUkdnmteBZqKlZO6EcayDvPDIuYmiKDA8X
         0ZO5AAd0ZUiBNIQsQ65vE+XQT5D14wEvnmlFdMmFZ3pFQzdCZNlcvhyvUyV3Qal2niWT
         YA+3rLrL+axIXELqiPb1SqhwHb7Ho0/Mk375e1RHTlbeuNaVLLZnJ8uTvQ6OJLCkfYsW
         sBITt+3/P/fqW9WU9fkyvx7TrTwYglvmJ9/GEUaFDchecvpZHFiRpUMzFaM2b3PjfeFV
         2BUws0Fy9mtjZd3fdEumV96mKcJLOhPysjH0dHQJbFFTvoDCAar+APq4vgYr2XkPfHpc
         /n6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnopfFMXP0BqMGn9DM1K//igck5Lb6Lkn6He+ILJFKIh7gOJdUm2qRC7reoPZ2FzVZOO3qXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsCKlVekGSaotpYeMsOTTutg3xWqBOi8MqOafUPPyH4Ft/fF3L
	gxCN0tIovpC+v/6AqQaSUGBVljHIZy/m4aJqu1cbHIOmAUGOCUSYQN2g
X-Gm-Gg: ASbGnctrtDuXIeU7t3CsDqZGGg0xcqJvC6QjWbFeLS1OAcxGKhqDO6IDupDs0M23R/h
	fBYdJGKp8YNRbO7vVfX8J3G3/oPPO4r0Ejzy6X476BH3b8P8dmZpZBVR2c1NY5AsdPZNGzGtvD7
	soNNZZ1h/8qlpGHVjjUA2yscPx+AeLUj7UIhIRbkg+LYdiC047f8CxoGMT2ROWWEWp3F8JOfqZ+
	LZEm5tsRvbxrAmBtLdLUAdJaSNf25FSWkNNgWY3J+Gdlwor00BuERP4yHqYgCZwRICvuwXqhlHN
	f4Vgw0TPlhV0lETVVYCcVr6kPklKdBGIWplCIBABDw/BAxeLpYYsN3dGg4+vOq2uoQledDC6cbm
	hslFBJAo7QDZcSrsoqEHBdSdPVg2g9TIJCuu4HZb0iLAaxU9GlZpmc7m+KsWCDUofikWakuC4
X-Google-Smtp-Source: AGHT+IEXNZfIsQ3rZppSYl9yKJqq51uYM3J03ronY6LA6N72xZZ4IQB+Z+RZJDQoCd6ufjnL8w2bng==
X-Received: by 2002:a05:6214:1946:b0:75e:f088:4a2 with SMTP id 6a1803df08f44-87b210724a7mr257648626d6.1.1760300277960;
        Sun, 12 Oct 2025 13:17:57 -0700 (PDT)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3479578sm58440126d6.19.2025.10.12.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:17:57 -0700 (PDT)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH v2] ntfs3: fix uninit memory after failed mi_read in mi_format_new
Date: Sun, 12 Oct 2025 16:16:34 -0400
Message-ID: <20251012201635.378419-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a KMSAN un-init bug found by syzkaller.

ntfs_get_bh() expects a buffer from sb_getblk(), that buffer may not be
uptodate. We do not bring the buffer uptodate before setting it as
uptodate. If the buffer were to not be uptodate, it could mean adding a
buffer with un-init data to the mi record. Attempting to load that record
will trigger KMSAN.

Avoid this by setting the buffer as uptodate, if it’s not already, by
overwriting it.

Reported-by: syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7a2ba6b7b66340cff225
Tested-by: syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com
Fixes: 4342306f0f0d5 ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---

v1:
https://lore.kernel.org/all/20250925203701.223744-2-rpthibeault@gmail.com/
Differences from v1: 
In the previous version, I thought that mi_read() returning an error was
a genuine reason to stop trying to format the record. That was wrong. If
we find that mi_read() fails and that therefore we cannot reuse an old
record, we should try to make a new one. It then follows that
ntfs_get_bh() should provide an uptodate bh for the new record.

On testing:
I could not get xfstests-bld to work for ntfs3. Config nightmare. So I
first tested with the syzkaller repro, then tested for regressions manually 
with a program that called all the syscall code paths touched by my change: 
mkdir, fallocate (FALLOC_FL_COLLAPSE_RANGE), and 
fallocate (FALLOC_FL_INSERT_RANGE).

 fs/ntfs3/fsntfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 938d351ebac7..0c07502fdb0f 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1373,7 +1373,14 @@ int ntfs_get_bh(struct ntfs_sb_info *sbi, const struct runs_tree *run, u64 vbo,
 				}
 				if (buffer_locked(bh))
 					__wait_on_buffer(bh);
-				set_buffer_uptodate(bh);
+
+				lock_buffer(bh);
+				if (!buffer_uptodate(bh))
+				{
+					memset(bh->b_data, 0, blocksize);
+					set_buffer_uptodate(bh);
+				}
+				unlock_buffer(bh);
 			} else {
 				bh = ntfs_bread(sb, block);
 				if (!bh) {
-- 
2.43.0

