Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D31C84BC
	for <ntfs3@lists.linux.dev>; Tue,  7 Jul 2026 01:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783389285; cv=none; b=mmvqt9gqazZn9asw5ZfyK/SXDSb1xhTkrfP+q9uyG8yny35XQZuzULxmVdOnzh4sIXCFLGVMZcugFSd6Qs0+dTWWIBYPKjU1QNenbZm/XBau5QjJXVNpeMzPNgmKhHgo6ISKPsGLL8Hi5D5YGLPuQMN7DEGpqstWMPNS1UIMri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783389285; c=relaxed/simple;
	bh=0VNxjwMBbTsaGDD/XsLcIDBGMzsr+w4yjDvYAEOxj4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FGmQ3UZkwJAueXtNuDYd5hrjD6yaBtbxnPeuYeI6hgKYBNcaN2t6/60W3f5Kd7Mu8zzBU/GhQbRXHFVZs0UBXlVU6rz/0F8nxLAysJCUFOLailLm6fJQxjR4713yX7ByvjJUKzjgV7lkp/CfC+jb5x2Ik5bX08cAHra9Y+caNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=tjQ6oVUo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="tjQ6oVUo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-380cda7f00cso3126864a91.0
        for <ntfs3@lists.linux.dev>; Mon, 06 Jul 2026 18:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783389283; x=1783994083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6x0rchg7luTyAcY+EvagpUgJxh15LjPhci+G9ftIjQ=;
        b=tjQ6oVUo7wyAqIknmR8QFWJS6ToojFceYA9Yu2AZDMJDANs0nfH0lpkz2v98smFZRW
         nLDo8Stj1Lg9dK3pwdn7ZVrX3O2gK9Kxd7qohkfyJRi46p/Jp7o2CB4nTE6e8flAj3Lq
         SzVA8sduFPcX28BS0xn64J2KlJ0TPyD5zVjKdSo7Xo5a1ZjHy4ohoRoBGP72Fgav3wzL
         SfkS6l+bFhHDrVyPCHNIl6lgdmAsgGfJx4xo8XBm6RVQPupe5Ggzm2PAGepgaHXgIBAZ
         SFzekpI62dxVRVdoK8sMzzSWS80bHj/durEFWCMLZO6DHkC/NEackfIDTHeX64SUSVa2
         30+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783389283; x=1783994083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6x0rchg7luTyAcY+EvagpUgJxh15LjPhci+G9ftIjQ=;
        b=UuJxLN+kRwhAyjYMeBpjm7jpfNrK579XfbiQWGn5yAoO8Ao5i8TzvKO1VyycxWQt/I
         o8XDZOaPZ/vuNtzZ+V4i6x1moVxXLpHR28mGRct+0A/c993is4QmUtwRb+LUVw1+WHql
         q8sx0cERetqhhLQFw7lEWuxD3GXvUPeYUJTpBq9U0PqGKM/m6VBSVtE1dIe+4F3OkVsE
         hYmR+il1Mf7HYw8LYf+/mNGiu+xEJnnJXDP7d3PwvZton0DLE5T2aoqnDBmqH1uSXcb1
         psmUcI96GELyxGyAZwN9XOlCA0dD6TZcFm6EwucwoOX5MegB6mLfdIE1nuhwQMds42L4
         FL+g==
X-Gm-Message-State: AOJu0Yy9t5xs8eENQSBwABllajOFQj2srSru1t1J3sV1cbrY9fBhrEQY
	0PO8xRi3tvUlQ3ztp7ojiawdX/WhVC6QOoqqSlbqUT2FestDkUG1LFhzbL+G+fwO5Q==
X-Gm-Gg: AfdE7cnMnFzdCMkloempzZycRuACSc06ydfxopWMysQ7BpysUFvF5BdB4IkBLPr2eeD
	+lSYrlOE0W+eiYe6pUYkXYjGCevNLcfCC2mju/yrGXu2eDEsmyCQBfygSeQDrRRrziL7bLlCMc5
	/V3mRcYMcx/cpWGXk8NSlGAANdXf+rDO35bh3wudRbiqE05g568jK1M5JnrFWj6+8VF7HOx1ffq
	qSwez4LV9oT7P2Nl2v8r33VlooXUbcNZ6Qvumq4x95o8WxVPFcxCeE6UslWWYs9Lxh2jwB226Zu
	n9ymaqXEY9+kcHfzfKHiJx2hy1Cw3G1+F7WNZFYVn5MvXTIAV4dU0BXOOTdRJha06/X+lbSFvCV
	y1sjggukD1iM3/tyM8SqbOJurjeV/SlNYWCbwOhC7phdDioX5IiAuavKq9n0S1iygv1Edg1WeBq
	Lz0/p1TaIoiS6my+KtB86eKipdGDfm
X-Received: by 2002:a05:6a20:c5a7:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3c08ee3631bmr3895348637.31.1783389283166;
        Mon, 06 Jul 2026 18:54:43 -0700 (PDT)
Received: from xiang.tailc0aff1.ts.net ([20.171.14.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a9e2f2sm2028442eec.25.2026.07.06.18.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:54:42 -0700 (PDT)
From: "Xiang Mei (Microsoft)" <xmei5@asu.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	"Xiang Mei (Microsoft)" <xmei5@asu.edu>
Subject: [PATCH] fs/ntfs3: check INDEX_ROOT resident size before use in ntfs_read_mft()
Date: Tue,  7 Jul 2026 01:54:40 +0000
Message-ID: <20260707015440.3420673-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ntfs_read_mft() parses an ATTR_ROOT attribute it computes

	root = Add2Ptr(attr, roff);

using the on-disk resident data offset (roff = attr->res.data_off) and
then dereferences root->type and root->rule, and later passes root on to
indx_init(). Unlike the ATTR_STD and ATTR_NAME cases, which validate that
the resident data is large enough (asize >= sizeof(struct X) + roff and
rsize >= sizeof(struct X)) before accessing it, the ATTR_ROOT case has no
such check.

mi_enum_attr() only guarantees data_off + data_size <= attribute size, so
a crafted image can set data_off such that root lands at (or past) the end
of the MFT record's slab allocation while still passing that check (e.g.
data_size == 0). The subsequent read of root->type is then a
slab-out-of-bounds read, reported by KASAN when mounting the image:

  BUG: KASAN: slab-out-of-bounds in ntfs_iget5 (fs/ntfs3/inode.c:283)
  Read of size 4 at addr ffff88800c06a400 by task exploit/142
  Call Trace:
   ...  [KASAN report internals]
   ntfs_iget5 (fs/ntfs3/inode.c:283 fs/ntfs3/inode.c:542)
   ntfs_fill_super (fs/ntfs3/super.c:1690)
   get_tree_bdev_flags (fs/super.c:1634)
   vfs_get_tree (fs/super.c:1694)
   fc_mount (fs/namespace.c:1198)
   path_mount (fs/namespace.c:3765 ...)
   __x64_sys_mount (fs/namespace.c:4174 ...)
   do_syscall_64 (arch/x86/entry/syscall_64.c:63)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
  The buggy address is located 0 bytes to the right of
   allocated 1024-byte region [ffff88800c06a000, ffff88800c06a400)
   which belongs to the cache kmalloc-1k of size 1024

Validate the resident data size in the ATTR_ROOT case the same way the
neighbouring cases do, so that a truncated or mis-offset INDEX_ROOT is
rejected before root is dereferenced.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-by: AutonomousCodeSecurity@microsoft.com
Signed-off-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
---
 fs/ntfs3/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index c43101cc064d..efb6a855c5ad 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -271,7 +271,9 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 		break;
 
 	case ATTR_ROOT:
-		if (attr->non_res)
+		if (attr->non_res ||
+		    asize < sizeof(struct INDEX_ROOT) + roff ||
+		    rsize < sizeof(struct INDEX_ROOT))
 			goto out;
 
 		root = Add2Ptr(attr, roff);
-- 
2.43.0

