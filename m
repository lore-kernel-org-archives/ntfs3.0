Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498253;
	b=kFK4Kj7xEZG21jqIfWINRjrxaUIW2NwatGZ3CWwRceqhqf2bcZMCvPfnQtlyDQI9SyOm
	 l5A0LyHinqcdoP5/dvFyhoMEMukz+FoPa/9Zgh5+bBOh7r/HGDbCaQesAbZFASxJhlmJS
	 KMAQzzOXMbf9m9p6G2UIopgXwOTYMfoVq0jXcbmny5eXup+eZqfdjRsOicQhn+rAzL7lI
	 GAZa0zy/utETBQGNEnZuAGr0AL0hfkbov8GuryqdP5SqZo1e7vwun0D+4onN8Omb91Rcy
	 hlilHVZ+UhIkawOl9fCyKo3K3gTOgKHVqW7W5jxDIIlUFdD8fVGcM63Z3ewH9BwaBkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p8gqfUFSv+Rji6NVZjPl0fEsf893Obde69tyzuNJ1VA=;
	b=AvYcMdEDhJNWrYJgBZTg+M4UgVqekv1jPWbmWxRkh0dHSymeXAf3FzN2tExAz3Pa9NR3
	 wFnfoj6XS0iqalJm/+ezbWNalsw3S2OOU0LzXJcpmlf5RgXBKksY59h9M6rOVqOyCdCQR
	 ABgPE++XiFgXhp6YD2Hn9c2XZCbES7dYVnmpqY/gysacIrcx08j6P0cBiK/e661nPkboo
	 AG6XMfDoOyV84SusAFd5Y9fLR322SiOyuCYGgLpQOlLy51lHU5byFnJGH6H5NPdFAubLO
	 689oWLZaFzcOxFx+kXGfjxuaQ4ayKrbLWKyid7d0smR9vLkCTp617dvfB1nZh3S9/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1+JwzIA;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD260A2618
	for <ntfs3@lists.linux.dev>; Sun,  1 Nov 2026 01:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAD260A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1+JwzIA
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so14831465e9.2
        for <ntfs3@lists.linux.dev>; Sat, 31 Oct 2026 18:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498251; x=1794103051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8gqfUFSv+Rji6NVZjPl0fEsf893Obde69tyzuNJ1VA=;
        b=e1+JwzIABe//C0MnLCRGQx8z0PtJWdQbhiFrtur/FiLY1LlakN2eej/MRMpaQ5sA0C
         npC2rUNZfVADq5reHslZuoA6iKBThuSzmpTxPVUCWG/VZNUKGyAKbnIFKvtnvDNeYTeN
         2si1+OHWcibbwFgJvmW1VFfGMaag3//Yy1em2vwO0gEg/lcmViwMEF5h5fpDM45IpXT1
         pBZfN49wzIsChZZnB53+KZBcuFASB1c8RDhxKgr7WwIJBcRs+DBCjcfRSc7pzftS95Yz
         Z5Q6HwB1h4l+4N1HzUWNy7cH/F0LdIyKzeo/ukQlNXXewplofti1OyhqPtRWto1nUva7
         EPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498251; x=1794103051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8gqfUFSv+Rji6NVZjPl0fEsf893Obde69tyzuNJ1VA=;
        b=db69DKrAILHV5oX/Y64iuM086aGDR/SCcRDOh/RjbJtTvtV37FU7lJvg9L9WRDgsso
         V0YSR0++aJz+ikr2jjXaHMks3wZr2I7WhupiRjXeU/Ev3le4gmfrsq598dvFBiRlTNc4
         oPKeH7Etut4ls1NK7tjK4GI5JMfq9GUEgh7u04TOFXkh/V8mYqWgJujJP0GnW5sur8as
         Plg7gEekrtDFMyurygJcJOoZ4XMrwKeOzwM/QGVcwHIJNL8gF5JUslddqhbt8BTYXl7r
         JTI2C0JJDFyKktkNwPkb6F+GWsfuQPFzDYorYb0oGqCnhgtVzNKOkIE8bfVkjR9qceNG
         /Vcw==
X-Forwarded-Encrypted: i=1; AKwUvBwyCc06M0ZaLPUSqPKh1WIuKgp5t1bGMwu11XfxeHLKhDlOT6TOlQB+Pdw/mcEozG8kVAEt5Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYIg4M2dvmsgEfEgyJAFSZiswUMo/rqbG6AdK/ZzdI5+ijNaBVtH
	C5wqnC/+S2jXoUvcq5uL6WSp06lgAOsScl09i4HwN9KpITY5i6KsobCi
X-Gm-Gg: AYBFou2a7ouwxCERtfdshQMIP0dfqaIiO1L7Q5x3kNdtRJGreka+1qWD6kLvmiQGR8e
	fUh7i46tVACGgpkQcjlUREo5XsTqNs2/sWS73vT1X5dmCmThyX3vyy5QQymWf9mMdCUjq0Xrbds
	YLmisvwcnIGyagBWjLwUzCPtN7hPAPoQf9SvHwsqA4rf9tw1jrJmaOgLXYt7XIuvByWTeafL6Ew
	OHbu1qaqgVIvqPzhQd/LJF+60pAH8cMZQDngDD5CrUpil+YKSJGcTTmQzPWHaL3UZJ8MriqQVDO
	t9162Xl0oyQXp7Qu157lP76y1jSX/co/A4n5d/Nd4fG4M0W0e7foAjA4MudjjT7vZq2S/siXWdR
	Z88YoTyOayhI6w/ESl1HJs8OHbKrtXpstJ3byz3vvp1i/8sxgDtnGwHxHjsiA3hpCLHSdAsn7CJ
	K56YyN0dAJNmqAvONJJtJ8tG+8lyS09PAhBwhoMJzLNJ41pds40VjqYqj+1vtOJi05NU0m7ObcC
	8qshAnrRBHCi4TwqPYMJjT7adYoKFpNnDtW49Q5s8iyWPM2b98V/Co60aHOUWLM7jgYB/gDDB1n
	MGykMEV/ISzbt9+EFL+3lTzt
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr144286495e9.17.1793498251133;
        Sat, 31 Oct 2026 18:57:31 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:29 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chuck Lever <cel@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v3 4/5] exfat: make crtime user-settable using ptime
Date: Sun,  1 Nov 2026 02:55:50 +0100
Message-ID: <20261101015551.786044-5-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101015551.786044-1-koray.fra@gmail.com>
References: <20261101015551.786044-1-koray.fra@gmail.com>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since exFAT supports user-settable file creation timestamps, map
provenance time (ptime) to exFAT file creation time (crtime) using the
newly introduced ptime API (in commit "vfs: add provenance time
(ptime)").

To do this, implement exfat_fileattr_set(), set .fileattr_set to it for
both file_inode and dir_inode operations and update exfat_fileattr_get()
and exfat_getattr().

The timestamp is now retrievable by using file_getattr() or statx(), and
is settable by using file_setattr() with the FS_XFLAG_PTIME flag.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/exfat/exfat_fs.h |  2 ++
 fs/exfat/file.c     | 36 +++++++++++++++++++++++++++++++++++-
 fs/exfat/namei.c    |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index eee573d1697c..aff96afa258a 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -619,6 +619,8 @@ int exfat_getattr(const struct mnt_idmap *idmap, const struct path *path,
 		  unsigned int query_flags);
 struct file_kattr;
 int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+int exfat_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
+		       struct file_kattr *fa);
 int exfat_file_fsync(struct file *file, loff_t start, loff_t end, int datasync);
 long exfat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 long exfat_compat_ioctl(struct file *filp, unsigned int cmd,
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 1386149916bb..70e226cb4ab7 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -384,15 +384,20 @@ int exfat_getattr(const struct mnt_idmap *idmap, const struct path *path,
 
 	generic_fillattr(idmap, request_mask, inode, stat);
 	exfat_truncate_atime(&stat->atime);
-	stat->result_mask |= STATX_BTIME;
+	stat->result_mask |= (STATX_BTIME | STATX_PTIME);
 	stat->btime.tv_sec = ei->i_crtime.tv_sec;
 	stat->btime.tv_nsec = ei->i_crtime.tv_nsec;
+	stat->ptime.tv_sec = ei->i_crtime.tv_sec;
+	stat->ptime.tv_nsec = ei->i_crtime.tv_nsec;
 	stat->blksize = EXFAT_SB(inode->i_sb)->cluster_size;
 	return 0;
 }
 
 int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
+	struct inode *inode = d_backing_inode(dentry);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
 	/*
 	 * exFAT compares filenames through an upcase table, so lookup
 	 * is always case-insensitive. Long names are stored in UTF-16
@@ -400,6 +405,11 @@ int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	 */
 	fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
 	fa->flags |= FS_CASEFOLD_FL;
+
+	fa->fsx_ptime.tv_sec = ei->i_crtime.tv_sec;
+	fa->fsx_ptime.tv_nsec = ei->i_crtime.tv_nsec;
+	fa->fsx_xflags |= FS_XFLAG_PTIME;
+
 	return 0;
 }
 
@@ -485,6 +495,29 @@ int exfat_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 	return error;
 }
 
+int exfat_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
+		      struct file_kattr *fa)
+{
+	struct inode *inode = d_backing_inode(dentry);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	if (fileattr_has_fsx_mask(fa, FS_XFLAG_PTIME))
+		return -EOPNOTSUPP;
+
+	if (fa->flags & ~FS_CASEFOLD_FL)
+		return -EOPNOTSUPP;
+
+	if (fa->fsx_xflags & FS_XFLAG_PTIME) {
+		ei->i_crtime.tv_sec = fa->fsx_ptime.tv_sec;
+		ei->i_crtime.tv_nsec = fa->fsx_ptime.tv_nsec;
+	}
+
+	inode_set_ctime_current(inode);
+	mark_inode_dirty(inode);
+
+	return 0;
+}
+
 /*
  * modified ioctls from fat/file.c by Welmer Almesberger
  */
@@ -1110,4 +1143,5 @@ const struct inode_operations exfat_file_inode_operations = {
 	.setattr	= exfat_setattr,
 	.getattr	= exfat_getattr,
 	.fileattr_get	= exfat_fileattr_get,
+	.fileattr_set	= exfat_fileattr_set,
 };
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 68ddb9c5504f..15ec7f1942c8 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1349,4 +1349,5 @@ const struct inode_operations exfat_dir_inode_operations = {
 	.setattr	= exfat_setattr,
 	.getattr	= exfat_getattr,
 	.fileattr_get	= exfat_fileattr_get,
+	.fileattr_set	= exfat_fileattr_set,
 };
-- 
2.56.0

