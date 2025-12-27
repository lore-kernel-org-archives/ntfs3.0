Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073F0313528
	for <ntfs3@lists.linux.dev>; Sat, 27 Dec 2025 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766846597; cv=none; b=QJE4DT8CY0uK+bQ12kzq82hGUkYSniqQ8rIdp+oLCxSv342DFW8d6EgiYjcaJB4kfTs3Mn7SBl2QX6eliRA8Lp7CKLgTW0y3WsZa5+RqhU+xTlomdjSIWtP+GdBDwJimooVWr9TySqGdf69/GatNnrp8tIeXad66jgrbKgJ6CVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766846597; c=relaxed/simple;
	bh=fE9YFuhtMY/tWwsrFjtDQbxan2Ssn2OUmEfhPxWlfBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4M9iikB79rTx/U8aPYlPoCZ8o9GtuEcvucMV83rYR8WlGnP0HHjFclGvFWEGbLaBLYgncxsTCos2zQ1kPXgMpaGCREVy8MPuJhwWAL5wqARRv4XWyk1MvzQlJUO7iwfOmSqTvP/339ElEdNyfik20A0vyf3P6cPpPCRQZpJ1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHR+Bp9d; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHR+Bp9d"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so8784111a12.3
        for <ntfs3@lists.linux.dev>; Sat, 27 Dec 2025 06:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766846594; x=1767451394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5IipJosq024h2NnkQBe99YlRXK6t9JhfmewXuxzAAY=;
        b=YHR+Bp9dWtuemnZywkQn3vALHsi7QQ2hDeb1NxrP0IF3uF4M5SEf+Cd2ZI6tcj45Y0
         4+Le/Y5wnygXvtmQykSYZmYFLn6edml4N3+WGRqDGARXL0P/HyYmx3jUxxhVF6MF7QoG
         GZc+gj+FQARq0ByyAde5lYfAkpoE2brM+yez4tjjWConY3vgjwe52/BFzuVpBsmXMQfb
         9OGEu73luuIAPvwPfHy1Jefa5rzfsvWC11XC/GQicwUlfIRFbceytybDu3G7DVsTRgEg
         HurLB2pemEKYBaDk6DuXSjtYV760qh6RvXvoywvo1A3xgw9pY0mSy3T21KWpSaAr3A8V
         BBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766846594; x=1767451394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5IipJosq024h2NnkQBe99YlRXK6t9JhfmewXuxzAAY=;
        b=m55xOVVkJT7FTJpUdJScOVpJuZR5W/iGyNIuEFOB2aFHlmIZi+4Rm/uyjGccilNHOb
         k2gnzk5K9fPkWaIo+WA265Ni9O/emW5SFO97rIctWeThBjXHOcalcZHvx32WaTF3C+IT
         GXuvQGoloCU4n68KUbZZG8Y0SMc16DdaHgcBDmCURmWAw25/ybego2DLJ6NiJ1oxcD1Y
         lK7EMFTD8K+2LJOZpKqrZ9hLgJMA2xSzhEDCsO8E1ADr0mEYj400Mz6pRwmlEuqNQDIH
         WelKuY2qptWRGOzMInIEoj/4DcxIeCR65fPmOopOYIe6hthQLfGRT7qiHdZq6KqNR5tc
         8uGQ==
X-Gm-Message-State: AOJu0YwHOY6BPFO1ZJEHOaahiCTMnwMI3r+itZ8zdt7XiAW72tMsfdhY
	VBEtOOGyWrb7Eu4dqRIKvMI+weyHaUO9pUI+Vspcm/x1QkQPDsBrfmTU
X-Gm-Gg: AY/fxX78NzOjGTHC+dq28NbMvRtRRFqaj8xBQr3GB/8fd1tJansOK51viD8QhH37Lrf
	YLWp4d2XE++MQtj4UWOZ6vM2SiaKc9bn0M/hVaMVYdpMSBypWxXthGOgtVkNkQfzaQ8USZ7bVi2
	XA2rB+oY+/lErf1NNwDUX217lLCebwsuRICTG2Ve/XQK/R1yh6peeWw5Iz7gJZcrTPalbtyIy5b
	xaLqNCdj5McUPF/NJsiK/Ujb9qP1irGzLkxAGBTx2ZCSkRjaPJdxzbOw//xSPGs96tTGj/orml9
	tP3tH1A9vY0hwymI6etRSjWCnp2berjHGI8GwaIUmCkwNdTIenL6NpVRvC26IpSGJVS1dexN8HZ
	XCmGFiJajL63HyakCrt6bz9nIG3Vo/QNoUUbbeKZDt+RUzdO+R2A5ysyu8f4B1jiQY2rpXAFktg
	vuUUGc51c8vEf3cw==
X-Google-Smtp-Source: AGHT+IEgYGogOzEhvacra0Ga7X2m2ZB6qkZnEpSlZtXui+cuM5+ThslZRrxTsm6WtINY31vLK0kncQ==
X-Received: by 2002:a17:906:f597:b0:b7c:e320:5244 with SMTP id a640c23a62f3a-b803719d9e2mr2585165566b.45.1766846594068;
        Sat, 27 Dec 2025 06:43:14 -0800 (PST)
Received: from prometheus ([85.11.110.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b82e7sm27907219a12.35.2025.12.27.06.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:43:13 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com,
	Szymon Wilczek <swilczek.lx@gmail.com>
Subject: [PATCH] ntfs3: fix circular locking dependency in run_unpack_ex
Date: Sat, 27 Dec 2025 15:43:07 +0100
Message-ID: <20251227144307.8966-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a circular locking dependency between wnd->rw_lock
(sbi->used.bitmap) and ni->file.run_lock.

The deadlock scenario:
1. ntfs_extend_mft() takes ni->file.run_lock then wnd->rw_lock.
2. run_unpack_ex() takes wnd->rw_lock then tries to acquire
   ni->file.run_lock inside ntfs_refresh_zone().

This creates an AB-BA deadlock.

Fix this by using down_read_trylock() instead of down_read() when
acquiring run_lock in run_unpack_ex(). If the lock is contended,
skip ntfs_refresh_zone() - the MFT zone will be refreshed on the
next MFT operation. This breaks the circular dependency since we
never block waiting for run_lock while holding wnd->rw_lock.

Reported-by: syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com
Tested-by: syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
 fs/ntfs3/run.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
index 395b20492525..dc59cad4fa37 100644
--- a/fs/ntfs3/run.c
+++ b/fs/ntfs3/run.c
@@ -1131,11 +1131,14 @@ int run_unpack_ex(struct runs_tree *run, struct ntfs_sb_info *sbi, CLST ino,
 			struct rw_semaphore *lock =
 				is_mounted(sbi) ? &sbi->mft.ni->file.run_lock :
 						  NULL;
-			if (lock)
-				down_read(lock);
-			ntfs_refresh_zone(sbi);
-			if (lock)
-				up_read(lock);
+			if (lock) {
+				if (down_read_trylock(lock)) {
+					ntfs_refresh_zone(sbi);
+					up_read(lock);
+				}
+			} else {
+				ntfs_refresh_zone(sbi);
+			}
 		}
 		up_write(&wnd->rw_lock);
 		if (err)
-- 
2.52.0

