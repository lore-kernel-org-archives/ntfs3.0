Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215FF355F25
	for <ntfs3@lists.linux.dev>; Mon, 27 Apr 2026 03:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777260270; cv=none; b=V9JLAG7u7W/cASIcafowZr91q5cMaW8VeCljlGTS3xkIEsv773Tj5AdD1pnNGbhm3+FKI2IQKiU/Rs4MLAdUlFige/c2YJmG7l8aIHfMNwQusffAmoyWTxrJuGzy7BXDe7DFANyFBD4am0DOopc08a2xpFPWzcXinibrtanCKCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777260270; c=relaxed/simple;
	bh=MshlRyZc9nReFxORmXYZB9BQUuNzDnlEiEalF0SARIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dzl8TTHJyQhFdTT2BrR1ZquCGjTPc2UmriaFoiRRi0FAjxaZyGftnMrBW6g2ZRh/w7aYZDBX4Hva3utDMEr54uNwVWl/hkVl9g12RIQJZHiM1x1ly23xBkNCaLVGUC0azprRvvSV6rDbRfrGSt0Dtj2fPHDqUXW2TN3AOI86gkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddnhGZ7M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddnhGZ7M"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso60372095ad.1
        for <ntfs3@lists.linux.dev>; Sun, 26 Apr 2026 20:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777260268; x=1777865068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Be08TqqMlVR30uYZffn/3RWGNk1ha7qfswkNP+Y0VdM=;
        b=ddnhGZ7MC0dipaOthv0IDfKMWiReM+dT+qBCBZIPbfCJpgFIPYuXTdrNSnI8ntl9K6
         a3xsd402qs9dI72oNiFkBGjJ4B4SAqA0JxmznHlTTpK56iUpHUddl+SGFF/H/a0sVvx/
         x8Y6j7zMAwgiQSWLJrFTpDwwiGTFM6PQBRfdb2msZQAbZNXh7lX8j3VzK5ml8eC5Z8ac
         Mw5N7Yg6Qu+b9iOjOQ7pj2Ic6c1GZVWIV/i53eiOHqUsIHxiB9uTtxOdS0qVmmk/8Rpy
         4K+DbWP+rp8zT/7E4FBQ9B727a/Gr8Y6iAt2Jvf+ITRZTc4RuvIva2M7CVAJEtCIUVOh
         FVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777260268; x=1777865068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Be08TqqMlVR30uYZffn/3RWGNk1ha7qfswkNP+Y0VdM=;
        b=L/CkLSsd+SGmIOHI8WKp2+yUS8f5nu59BPJcToABBPUoIqDrWM56hyMdHOolt76NU2
         XjlsYHXbbcchYCnRLDmYvAbkq8BRLA7yzz0kwTJ7x4VBFIZD/bOoh+MBzF3IP6b7Lx/A
         JCS/PW9P2vEeonR4DXLtUlkfntNVo858YiyPK2FX4ByP3bJC9kJP3hjk5GCtsCkqpulQ
         qKiNYy2ibi5icZJaYC4VTQKm30ExBZLIUiN/DjbuCOEarcIdQ7KXGxv8kEclueJgt0OE
         JkFfkoyX4nrvSOczbVwst0WWmC6pmDggIL6Bd85PhPG0z9Vr7n5Gx+1WJD2HJBkuTG+a
         pQ8A==
X-Gm-Message-State: AOJu0YzFWO7u4MsP0k1+KVYTK1D51bTG+sFZsuM1fMWbgjGZqLxxJN7D
	n9WIY9ZPGGqYsPIdKpcz3jBE0ZYbOg8z2djh91oDRZh1VoWSSJacYzop
X-Gm-Gg: AeBDiev4A7BgbU2x9a/TaGsKXrB+0Qxknou9Px6XS2UG5F0kHTn8dMRhAo+ORvrnrg4
	xxJu3gmmDEPTbJBUBvJ0nrZCtvrLy2VU29uICOr8zfxPD44jV7EvKWfrqOdQ3I24vx7DXsEY9fi
	LVyg5uE5NYA2tbDSklhPX4MuwZ0RlehPBQKcmBlpzuhjXLTYDgSGMg5OPYATWsQoudx8DQKYvrd
	sNenNzfjY5h5Ips7kvC1WgUqAkcX6y3DBoRrlIKLUNsgHS+yMuGJXIqCHSWOgxzdiuwG6fpPtDn
	10C+78gbLNAW2G3D4cR00bukEbggwxHbVsrQgfxVFwFj9ZiKojcVc0jSpZ+RSZHeOdHOkJ52Q15
	wXcsFOCvaU1yiu2NnVNCr0lYWRqOYYni+vFOBlyiPIUVxUwoBua70K1Sa8w+D9I7EicONCYhCm9
	p1dM39Vp/AmcmcL9IpYpXWWQ7ppwXb4dLbAvzvdL0GxdT7heXMlZPAlmGeqavluib/c8piZL7Sj
	6ROMThQLg==
X-Received: by 2002:a17:903:b8f:b0:2b2:5857:583e with SMTP id d9443c01a7336-2b5f9fc0641mr416551845ad.31.1777260267948;
        Sun, 26 Apr 2026 20:24:27 -0700 (PDT)
Received: from kernel-fuzz.. ([103.172.182.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0db13sm309463525ad.53.2026.04.26.20.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:24:27 -0700 (PDT)
From: ZhengYuan Huang <gality369@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	r33s3n6@gmail.com,
	zzzccc427@gmail.com,
	ZhengYuan Huang <gality369@gmail.com>
Subject: [PATCH] fs/ntfs3: preserve non-DOS attribute bits in system.dos_attrib
Date: Mon, 27 Apr 2026 11:24:18 +0800
Message-ID: <20260427032418.2678198-1-gality369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[BUG]
A corrupted ntfs3 image can hit a NULL function pointer call in
generic_perform_write() after toggling system.ntfs_attrib and then
overwriting system.dos_attrib on the same file.

BUG: kernel NULL pointer dereference, address: 0000000000000000
\#PF: supervisor instruction fetch in kernel mode
\#PF: error_code(0x0010) - not-present page
PGD bed5067 P4D bed5067 PUD 0 
Oops: Oops: 0010 [#1] SMP KASAN NOPTI
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffff88801025f988 EFLAGS: 00010246
Call Trace:
 generic_perform_write+0x409/0x8c0 mm/filemap.c:4255
 __generic_file_write_iter+0x1bb/0x200 mm/filemap.c:4372
 ntfs_file_write_iter+0xcd9/0x1c20 fs/ntfs3/file.c:1253
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x63b/0xf70 fs/read_write.c:686
 ksys_write+0x133/0x250 fs/read_write.c:738
 __do_sys_write fs/read_write.c:749 [inline]
 __se_sys_write fs/read_write.c:746 [inline]
 __x64_sys_write+0x77/0xc0 fs/read_write.c:746
 ...

[CAUSE]
system.ntfs_attrib updates ATTR_DATA flags via ni_new_attr_flags()
and switches i_mapping->a_ops to ntfs_aops_cmpr when
FILE_ATTRIBUTE_COMPRESSED is set. system.dos_attrib then overwrites
ni->std_fa from a one-byte DOS attribute value, clearing the compression
bit without updating ATTR_DATA or the mapping operations.

Old buffered writes use is_compressed(ni) to choose
__generic_file_write_iter(). That leaves generic_perform_write() calling
a NULL write_begin callback from ntfs_aops_cmpr.

[FIX]
Treat system.dos_attrib as a low-byte DOS attribute update and preserve the
existing non-DOS attribute bits in ni->std_fa. This keeps compressed and
sparse state consistent with ATTR_DATA and the mapping operations while
keeping the existing DOS attribute semantics intact.

Signed-off-by: ZhengYuan Huang <gality369@gmail.com>
---
 fs/ntfs3/xattr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 9eeac0a..7e51182 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -867,7 +867,9 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 	if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
 		if (sizeof(u8) != size)
 			goto out;
-		new_fa = cpu_to_le32(*(u8 *)value);
+		/* system.dos_attrib only covers the low DOS attribute byte. */
+		new_fa = (ni->std_fa & ~cpu_to_le32(0xff)) |
+			 cpu_to_le32(*(u8 *)value);
 		goto set_new_fa;
 	}
 
-- 
2.43.0

