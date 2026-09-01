Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA9B490BE6
	for <ntfs3@lists.linux.dev>; Tue,  1 Sep 2026 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285533; cv=none; b=ln+sl3q4Ekd4BpnjC6yMwScxKj8CWyUYNEUQq7WZUjdBENbG0jf65SdDQIc8gt8NOuTzLP8aYAZT7CSP/qxOoRLsbE5dht5Unjmf9VWK4ms3hO3ShPoJUNnsiBD191cK7KOvoZV6JXQ/Yrw68Wp2t9cqcHpcRZUx5ttOuS0sW/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285533; c=relaxed/simple;
	bh=2W8npXJoJZbijCjhRseirFQjDutKhflMtpGqwMrfhl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOakpfrG5+bIJP00y8TdsWk6m4ybQUFneGRw81e/3mBVgaUt3/hhlrWrHES3AibWym2mtUOEo0Ad9y2GOJ1WytzPybV9RwNZb+faHdyjTBoKGtAQqLzdYSa2mjipaCM18ynFeJUpl/LoLRiXet4uxWs59A41chKABntj24WnAc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=rfUKe7To; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="rfUKe7To"
Received: from localhost.localdomain (unknown [4.194.122.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id AA6AB20B7166;
	Tue,  1 Sep 2026 10:58:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AA6AB20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1788285495;
	bh=3ihD57aXs5CmbpTZxGzE5aopK/AIL3W0/70G+AGNwtg=;
	h=From:To:Cc:Subject:Date:From;
	b=rfUKe7ToVhjNyWs7b7op8+XYIsBIjE7C5kGJnArHPITfS6/3olQ6AVflkbaDXNRjj
	 9P7yh5LTa6dpGdTSp/lGGjnsgq9P9ptHM+nYOR+zr8QnjZnHtbCzJDbi5pmOSjebQu
	 R0iHrqZ3BTQ6EiDxLWMPsSiMGcI+qN8Hi4NV8dTY=
From: "Cen Zhang (Microsoft Security FORGE Labs)" <cenzhang@linux.microsoft.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	xmei5@asu.edu,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	"Cen Zhang (Microsoft Security FORGE Labs)" <cenzhang@linux.microsoft.com>
Subject: [PATCH] fs/ntfs3: fix slab-out-of-bounds write in ntfs_create_inode
Date: Tue,  1 Sep 2026 13:58:34 -0400
Message-ID: <20260901175834.8557-1-cenzhang@linux.microsoft.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_create_inode() sizes the non-resident reparse run list as
record_size - offset - SIZEOF_NONRESIDENT, then sets the attribute size
to SIZEOF_NONRESIDENT + ALIGN(run_pack(), 8). It does not reserve space
for the trailing ATTR_END, so a maximally packed run list places that
4-byte sentinel just past the allocated MFT record.

BUG: KASAN: slab-out-of-bounds in ntfs_create_inode+0x4390/0x5220
  ntfs_create_inode+0x4390/0x5220 fs/ntfs3/inode.c:1796
  ntfs_symlink+0x108/0x170 fs/ntfs3/namei.c:224
  vfs_symlink+0x137/0x420
  filename_symlinkat+0x326/0x460
  __x64_sys_symlink+0x79/0xb0

After packing the run list, check that the 8-byte ATTR_END slot still
fits in the MFT record. Return -EINVAL if the aligned run list would
place it past the buffer.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
Cc: AutonomousCodeSecurity@microsoft.com
Cc: stable@vger.kernel.org
Signed-off-by: Cen Zhang (Microsoft Security FORGE Labs) <cenzhang@linux.microsoft.com>
---
 fs/ntfs3/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 56b4f6469a28..d6e4b4b3154d 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1769,6 +1769,11 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 			}
 
 			asize = SIZEOF_NONRESIDENT + ALIGN(err, 8);
+			if (asize + PtrOffset(rec, attr) + 8 >
+			    sbi->record_size) {
+				err = -EINVAL;
+				goto out5;
+			}
 			/* Write non resident data. */
 			err = ntfs_sb_write_run(sbi, &ni->file.run, 0, rp,
 						nsize, 0);

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0

