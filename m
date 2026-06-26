Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07403DCD97
	for <ntfs3@lists.linux.dev>; Fri, 26 Jun 2026 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467370; cv=none; b=ZJdQ7eQlfqpLi2eenaxgUeYcioSgHahawdvWYinlDkR+hfE6DaAfsKpvUBjVDi7XxjwG4uwZB77E1QKkmf/KmagsxrRaW3uosKk7NFdl1ypKlbgUw8Hm6IpfwnMkiDE13ndEvhKZgJxWD5JjQ+ffY+OMcH/pq4Y0vVatB3ADesE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467370; c=relaxed/simple;
	bh=sHDMy5J/1yVZt2DCmjg4m+myLNlnNxqfxBTl3xomjzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rSzo8EK70TQ6ueC0GV6M+IWMbMBMTcAFw4cytG2hgWpooP7Yz3lEe2nj+k74RBAWZT7S+z8W6xLHbPAsGnVSPW0FODkE4YE/69pv4eMOXZjxtux1oIh/yqPwoCwvsRKarHQxdAXaisWkZrL1UHNUvzUFDoyeKjhVBrwf+TXKfbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KNaJLicN; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KNaJLicN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=to
	sULOS8ts1ksjOpe2AuSDAIJMv4PhwFx9HjEgiM7tw=; b=KNaJLicN+fQ/xdiNMX
	+6YGmRIZ0NvfJWaXUu1oeCxJMMH5GEI8RW7oFvLQtdsILFzwwuVBdKa6K2aiJrfu
	Pmx4SSBAVIav1ZjvG0mbzuhCpdu85MYqpY6mKmI/GKTqICfnHBI4mDx9GMzC1SKE
	beyLIafcLOLQSsxeCv+xlq8/M=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3T4geSz5qwi1TGA--.38655S2;
	Fri, 26 Jun 2026 17:49:19 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH] fs/ntfs3: update ctime only on successful setxattr
Date: Fri, 26 Jun 2026 17:49:14 +0800
Message-ID: <20260626094914.908224-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3T4geSz5qwi1TGA--.38655S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyDJw4UAry5WrW5Xr43Wrg_yoW3Zwb_Ga
	42ya18tr4YqFnYganrCF13trZavF4vkw1DG3s3tF4ay390qF4DZryktrs0yrZ8Wr4UXas5
	ArZ5W3yxAF93KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtcTm7UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h8Ezmo+Sx8m7AAA31

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_setxattr() updates ctime and marks the inode dirty even when the
xattr operation fails.

Do that only on success.

Fixes: 2d44667c306e ("fs/ntfs3: Update i_ctime when xattr is added")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs3/xattr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 9eeac0ab2b71..9743a63a152e 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -960,8 +960,10 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 			  NULL);
 
 out:
-	inode_set_ctime_current(inode);
-	mark_inode_dirty(inode);
+	if (!err) {
+		inode_set_ctime_current(inode);
+		mark_inode_dirty(inode);
+	}
 
 	return err;
 }
-- 
2.51.0

