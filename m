Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571BF233938
	for <ntfs3@lists.linux.dev>; Fri,  3 Jul 2026 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783115677; cv=none; b=bdOhgTI5aXd9i3aiC3jrhlx2qBuuMMB30oXlMxD02g8pHxjqDRYUpqagLZrQqDQKo+f5gjzc8v3F/f8i9W4w7r24xifI3+QSnNYJp1HBgf53yVpi7PG5mfL1hXViIZjVFF8wmHAUU0HZNUqRkBwNAlU4LBNX6CRKPERbQDNkITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783115677; c=relaxed/simple;
	bh=x1EGwe9OWNv6GJQxJAcEXjNxhlsCTdMZzxoblkGcTGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AmxZ8NdIML+CGzh6MP7iG+nnr8z1VbJC9qn3ZwWPUadtm3AOMvqEGOQRGKWZUYyjjoL2cGL9Nln6IwiaAeaKYEzCcQVqY8Z3dgp/fe3dD/umpuRpsEkqLEROG7kjK+a1+O4bu3Na2ekbeXt65EV2ngtHHqAdSYExy6ragWYZ2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=iwLZM9IQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="iwLZM9IQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so722892a91.1
        for <ntfs3@lists.linux.dev>; Fri, 03 Jul 2026 14:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783115674; x=1783720474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBm+rN7FiRf19d3r1j1j1FGGiBV8PU79hN3KFt/7WGA=;
        b=iwLZM9IQ0a9vI6UJhkh2UKWkSFGam4QG4myCmaRXkBBtAkOmB29ICYyOvfRO4buckH
         AdTF7zRTZxbBToEQFrHqNNIgXY1Jh7mZH6cXUU0jL2DXmREbw9wYxNKETyLLVR4F7ts6
         t9AnKm9Qvj1B1p/yKsfXC9rvCg7h30p3KiVTHciGL2SOmI/JG9NaQPCHa/ug/67CIVYE
         fk3B94M3BLc03dRkOAiN7XVIK+sGJMt1RFnJGt0kLeT/igJzBtSBT3gXtp+QnIwicyzV
         32T+UwIhY9GWjenAW9TCS9ftu2X+3y57Ig7TuF03x1X8HCxMZy8D8Nhj3zGVHbg2lKF/
         Ox8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783115674; x=1783720474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBm+rN7FiRf19d3r1j1j1FGGiBV8PU79hN3KFt/7WGA=;
        b=UmzR6CLiyyp4YltVmCEivkB9QG2TwuA04+uowF6txjKRDyUMDL69VEm9ooVtdaW4//
         fjoMnH8OFzxdZmmUTDmtTjAjNzD6lYstti+J2yQaVBO6TT6DyqzdFPNOjkexFRh56Eoo
         6rTOBzXeHt3r4xbYB3l7oqziS11jNW0lJJkqfJqV4DSP6y+An7cz3CZyX/uL8+YRJ4is
         RNEUTUt3P/kj793xZWLy+LjiSNi0+M98H2Zu9c7FV8+YkOwwlS+vjRoL9wOZsuFI/Fxz
         RC2RrWK/wllxbsUM5ciQoZyjnXTnbdYEwbiOn/b1dHKw1vT7CAXDSl/4k/XE//Cmb77B
         i8FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDuweumXtMF4fmm+TqF47opotoXj6R+1U1aJYijgRFxQiGBlaBhQxDEvisJRP6nbqzN9eIag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfwRPGVFvYWKSj+fv2FvzDvl6QrItvd1N7GpwGNLl4id9Bx60e
	JetdGK9SqyaGDl3QHZtMyyIsLKXDFTCycMJvrrt1Nik3dT+rL4OYxu28+37IKImFfw==
X-Gm-Gg: AfdE7cnXK+fmvLaLy0BQxsGBmkKp7tTZ1PMpr0Z7EHhGstgihfM1AAJtEOPYx3X54co
	cCZwFDbF/9hg3WoF2B+X7/YgEO6jO7J1Qjww8cXDznOxjkEZDDf5WhbIzHjL0+lRArx5IYozn35
	98SWyDXcnEuqHrdczH6ip+i9C45dmv4MKU3oBijN4EYqxKij2rXWnL9ezqRdR6PqZu1+iiyX1ds
	nHJSG23eCV3WTJOwRTdc1dZvBcWHj4xvIOZreDXawU4FLAeIkNnnwMaYc16tiyv7V7Y/N+PLxGb
	wrjBsP262VzEF6SMh8d2Hsf+Tdmupy9lRnatymS4oRS7o95Ll/8xDjRXj7SEWyvamgAO3qSxdgS
	7xd+XbaYsKmgEXjCsITQAkcObaLx6KaGPM67dgWpbMEmKWDFt3Ux2W7OCtfEQCxGr6a6IYTaL
X-Received: by 2002:a17:90a:c2c7:b0:381:228e:ba20 with SMTP id 98e67ed59e1d1-3829f101e13mr976974a91.24.1783115674446;
        Fri, 03 Jul 2026 14:54:34 -0700 (PDT)
Received: from p1.. ([2607:fb91:1556:80f:d8fb:4ffa:b012:f769])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-381071a5f60sm1287207a91.0.2026.07.03.14.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 14:54:33 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH ntfs3] fs/ntfs3: validate $SDH entry size in ntfs_insert_security
Date: Fri,  3 Jul 2026 14:54:31 -0700
Message-ID: <20260703215431.73681-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_insert_security() walks the $Secure::$SDH index and reads
e->sec_hdr.size for every entry returned by indx_find()/indx_find_sort().
Those only guarantee the NTFS_DE envelope (e->size), so a crafted $SDH
entry shorter than a full NTFS_DE_SDH at the tail of an index buffer makes
the read of e->sec_hdr.size run past the allocation. Triggerable by an
unprivileged setxattr(2) on a crafted NTFS image.

  BUG: KASAN: slab-out-of-bounds in ntfs_insert_security (fs/ntfs3/fsntfs.c:2148)
  Read of size 4 at addr ffff88800fa1de00 by task exploit/142
   ntfs_insert_security (fs/ntfs3/fsntfs.c:2148)
   ntfs_setxattr (fs/ntfs3/xattr.c:947)
   __vfs_setxattr (fs/xattr.c:223)
   __vfs_setxattr_noperm (fs/xattr.c:257)
   vfs_setxattr (fs/xattr.c:344)
   filename_setxattr (fs/xattr.c:690)
   path_setxattrat (fs/xattr.c:734)
   __x64_sys_setxattr (fs/xattr.c:764)
   [...]
  The buggy address is located 0 bytes to the right of
   allocated 512-byte region [ffff88800fa1dc00, ffff88800fa1de00)

Stop the scan when an entry is too small to hold a SECURITY_HDR.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-by: Weiming Shi <bestswngs@gmail.com>
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/ntfs3/fsntfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index bc7469d0a34d..6d81ae6c1f11 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -2145,6 +2145,9 @@ int ntfs_insert_security(struct ntfs_sb_info *sbi,
 		goto out;
 
 	while (e) {
+		if (le16_to_cpu(e->de.size) < SIZEOF_SDH_DIRENTRY)
+			break;
+
 		if (le32_to_cpu(e->sec_hdr.size) == new_sec_size) {
 			err = ntfs_read_run_nb(sbi, &ni->file.run,
 					       le64_to_cpu(e->sec_hdr.off),
-- 
2.43.0

