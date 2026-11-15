Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765850;
	b=1hEULaaX1o2IDlku2PX+pEB8jGk3A6EdTXMN0ItkDdxfUOwclqQmF6EadF11bUYDfbgH
	 kQ/2VtwwDMDwX4/ajT2SV6Mwl26Qpf37vAcpvZKGSFWaQ2QeCaeC+r0YuOnu6iK9msItZ
	 2elt8QpFcGZi4/I7SL5H30xv+gASoI8mrxM0BjCMEtAQBfl9U8A/Z+5K8VBkfsv5RrRvp
	 jyWH0UGL1tkooUk1InYnQeik1bnsDkpOgb40NAKrGKKleUYKEAqTSSs5GvM5qu/wuBru5
	 l0oIWT5nwBy74S/z8ypqBJU3AMbwDKdZp7Xj+C34ewjE6SI+bpEMrB3H7HfZi9LDINg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UA38+n7c+RqbQlIN4Q8phpqWE0RWPQHALE9HzRQmyvE=;
	b=uAXl8Y040pVTat1sulIGps2/Zc1m9/+66Ot5XLAR/+pHdtF3ekv3GqZjcarzrv07nqmR
	 EMrG4AB9KojQufijvlJwCTOGscLW515mDc7JjV3alwu358nAFNSnFMrDNVW4pWkSAVcbH
	 eOrt07iaBcBN+WHKO/t5D938HhrWKjk5ck16ccwnQzbQBBR2UzIfoAPjWFSL1aq12l0IQ
	 f3XDk+3fnV8ZcTXJS9EgSwR+J9tTZY97FIia6TYMieIVYHLm1VXfAFkgi1HGw9/IC7ubL
	 WjGPHgo0M3qiOiOQ6emvNxUQ8zcCelNVdMVcLNp2SK/L2MZFvmwIzupYki+lMKABw9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Kr/qqh36";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC8460A3809
	for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 18:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC8460A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kr/qqh36
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4922523d1afso1289657f8f.0
        for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 10:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765848; x=1795370648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UA38+n7c+RqbQlIN4Q8phpqWE0RWPQHALE9HzRQmyvE=;
        b=Kr/qqh36d8h/Izg3psbN9QgDYu1tZmLu6OgpftqYF695ikTP1xQr+QlQSunyYXRR8J
         wi5F9RqkLL6BkFJtpZiGQYx4DJm3eclPE2zDtk+/GJ8aiijv323K/1r86XLEO0Yv0mfn
         6NHakix7qQv9Z8f6c/Zk+mVfcmOGkIpWkyDhsvYMARUgv0Fo5d3xaRbE//jDhPWvkG0M
         wqNcR8orcgBSrjxYMmjlYETGHjNLNZAIDwl9AqsBtafFcanewCUdYlzqJAZ6/drtm2VT
         1LO7ambcNCQkd1lfh/aTlcceW0DpbCKFzEsNNoBN/o5/xbfbtlMIFr9dj5g5Qq+Fosg6
         l0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765848; x=1795370648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UA38+n7c+RqbQlIN4Q8phpqWE0RWPQHALE9HzRQmyvE=;
        b=YgqD7Iex0BmvFABT7Zewy2S4l5OcBVXWxIzDo19oG4LlJWCf5kchZulfjoVlthzy14
         2nQgOM7EQNJqPQMXqmnCGuBCa3xWgWVpRMCNfMfTDp7NzH692OqFfvPOGfUK8r1H05eL
         rIctEyaGrF31mi4csaHVB+909YWRb5RA8hSIgI3PYW5cGxs43qk+tCPINIQXPzIdSFRu
         ZfF2/aIBJHuHnTbHoI5uv5cIUAv0qEivVl86PvfMNLq/5AAAzJ+YVGjszoYbCAVbY/zP
         BHtZ17/lzxRpJWYTd7Ha4ZvHhmI+2I23q3RrPKxyyfy4OtWNG4YZsev1tscLNJyhwCIL
         1WAQ==
X-Forwarded-Encrypted: i=1; AL+hErG5I+ZmMPvtvaNjZB/fK3c6oWNihEFd4emJvbMCn2o3fZHZ19o+sAXb7dwcH0U7K77KyDmRwg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Eb8ynO0M8digVq5ZEJXTw+LZXtBb/jfjf12vg+S4EVNs9kYza
	rmFGCei7JcWdDUXzCtw5/omNKcMMHI0JFfWKH7G4wdLpSQ9T5ixZoz9d
X-Gm-Gg: AYBFou1y2GkmBBLXPq4FfGxAQn+lU567DoE+v+OM25iNkxzwLLYDcLfYI9RSd+d7/SA
	/ZuaseNm9t9KpPLA/+VX7LUoTURVP6EpJwNNv+mrsOap+KqXtIoqU63bz5rAsfEmZga+6o094xF
	b5oZ4QPjYS9RGMo8nptgGUfZhJ9SSg5qOMRhn2DeYAW/pCBfd7GjhhWj14kKLaWuRnDEmJ2gFOu
	SSFjZSMOKUzbdVChTjMHeWRUVB9S+el4EuG4bDM3paSPzfBTf+n1MVHS4ED5NYA7Z7TUapm1XNN
	er+WBXYFevQXN6YtsBy+KrD0m7YHU+CBrmi3p1gurJEq3n+qqQE1yJ0t2Y3+UWpWnIsCVnpTugJ
	s6Q4aGzuWNhrkx4XY8oZvXLs2g6JpX0STmWLKV+hu2CAUlRkgwYEP5nOf8NsDZUYMHq9/zKMwUM
	QRRpnm5YMpvUQi5MEfk9JfP1bnGdjSjRC69vOYdI8xv24cQjzuQE25/qdlRsepeoQT/5YLCnD6s
	rr1LycDkVjjRlkKbVrfpVqeZ9jVaBOf+M4JwvTan+l8dZ2kr0eN9PvqYmxJxmDJkyoLB/nQ7J0W
	mi8I7nTg85BI/g/JcFS3ZVURubivirkWmiZvGHdtBkbNcg==
X-Received: by 2002:a05:6000:455c:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-49c73259e6bmr12985016f8f.13.1794765848134;
        Sun, 15 Nov 2026 10:04:08 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:07 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Chris Mason <mason@kernel.org>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v4 04/10] exfat: make crtime user-settable using ptime
Date: Sun, 15 Nov 2026 19:03:37 +0100
Message-ID: <20261115180343.576773-5-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115180343.576773-1-koray.fra@gmail.com>
References: <20261115180343.576773-1-koray.fra@gmail.com>
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
 fs/exfat/file.c     | 42 +++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/namei.c    |  1 +
 3 files changed, 44 insertions(+), 1 deletion(-)

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
index 435bbef288b8..02390b03eecd 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -384,15 +384,22 @@ int exfat_getattr(const struct mnt_idmap *idmap, const struct path *path,
 
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
 
+#define EXFAT_SUPPORTED_XFLAGS		(FS_XFLAG_PTIME)
+
 int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
+	struct inode *inode = d_backing_inode(dentry);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
 	/*
 	 * exFAT compares filenames through an upcase table, so lookup
 	 * is always case-insensitive. Long names are stored in UTF-16
@@ -400,6 +407,12 @@ int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	 */
 	fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
 	fa->flags |= FS_CASEFOLD_FL;
+
+	fa->fsx_ptime.tv_sec = ei->i_crtime.tv_sec;
+	fa->fsx_ptime.tv_nsec = ei->i_crtime.tv_nsec;
+	fa->fsx_xflags |= FS_XFLAG_PTIME;
+	fa->fsx_xflags_mask |= FS_XFLAG_PTIME;
+
 	return 0;
 }
 
@@ -485,6 +498,32 @@ int exfat_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 	return error;
 }
 
+int exfat_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
+		      struct file_kattr *fa)
+{
+	struct inode *inode = d_backing_inode(dentry);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	if (fileattr_has_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
+		return -EOPNOTSUPP;
+
+	if (fa->fsx_xflags_mask & ~EXFAT_SUPPORTED_XFLAGS)
+		return -EOPNOTSUPP;
+
+	if (fa->flags & ~FS_CASEFOLD_FL)
+		return -EOPNOTSUPP;
+
+	if (fa->fsx_xflags_mask & FS_XFLAG_PTIME) {
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
@@ -1110,4 +1149,5 @@ const struct inode_operations exfat_file_inode_operations = {
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

