Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765844;
	b=EsO11dMl/3X6E5ibmFY6+NysAW3AZyGdqjn0DgJlz6EIlgDWuuL8DnRj9/cd9EVnH3th
	 CkJoFTcqAmrgH1avIXFsxdNVlnkGY52a8eh8puzq0XiG1RSqgcLPabBjYc5BVdsUhCqSI
	 86fmZZFf/iMU9NEbC1ZWhhxrJV4tSo0noA28b/AHmscvuAO9rL6pHmCpjpT+sJ4aQpoHS
	 JKBNRMVyEGWoxcnsWGwUnr62IXhWZFDsTmN72d9xRL0sEwP7yFTLZCsOA5g+Z5O/NqgCt
	 EehHmxomBD7utfaOfrb8ssLc935dIJBapw0BcE7JkWa4FJv5kkvoV3Ucn0Ip9cBvMaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WZMCtFvfAg1vYqohiGdP4/WJByQardm3oeHLornlvD0=;
	b=WdCdeW1sxqY8xEpRTcRO9P0nU29Va2+hq7tPW9dC28FC7Cm5IFMZtTQMvoMdaNOIN/EX
	 mC8I2cpt/DsqPGQqhwM178woRxCzMXgPV7pF5YtMXFN5d55nme8szUO3eCuUzy0KgeBNi
	 tUqZgFzv7RzF05DV7Ddd0sd/WMBGaNFxCGw0fru+3DcCpST7eaDFFbVl8nHwmKOUvAqA7
	 bjQDOK01mEWL+FfszKhihgx/NNyEWzYOEo1OxdJFA3p+YcuHV/Um/IXxu+CYAxLV74rU6
	 t2hWSnxjoFyLelQss9QYST6VYjFNggZ07d9isky7Sd0xLXUKmFOKtIJEg3ErQcs+MSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DqXErN4/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C33606A88B
	for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 18:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C33606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqXErN4/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34945395e9.2
        for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 10:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765841; x=1795370641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZMCtFvfAg1vYqohiGdP4/WJByQardm3oeHLornlvD0=;
        b=DqXErN4/Lw3LNHYsDJbdlU5AZfIdLf7CAZEyiPDwy9mlLcd3eWIN6q7T9Mops+pPxa
         lCUFxFClpM0w97M/T4QcjrkGBGO1SpZbh8tTcHUZ+IrqGKpBTtNVDq33jN3Ig9/Em0Tj
         X1XHoFHvFdyQiKxe/jpFT79lM6lbNUBAvakhbLLKx7c/2DQXRUKNiS5F8pgdd25KN6Hl
         /6Cp7+RblapxEIeuI9c7jkUd3WQwf5iZRgFxhSUoOCQrIOPt+oTfpFGkWtcupqrJwhP2
         1M1/oTyTlwy+lOXpsiS1h42fsNK6NG2mXOxIDkiFF794lRRi1Tfxn5+GtGFK9iIwOVKP
         XFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765841; x=1795370641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZMCtFvfAg1vYqohiGdP4/WJByQardm3oeHLornlvD0=;
        b=Z6jrHId1qDQoRXnDLvaBrNgOcRoRAO9VeWhBR5teu4i2Sf50NPlphlCrUEHEbawzwP
         V3O4GTdreu5wjEsCWLi/1nRvKt2KnIHKf7JMiJZmVFTrZ1kk9nkNLCNXJEwvFrvEhWaI
         FItcQYLsbM/HbNvi8yZCuE3PdkdR8RjBYaljfaCfYGy1n6WhoixJyY89LDGiY18fL6C7
         yXPqQm11Mii7wAp6lt1GTHgXfoHOVqFfp8avJ4ryNz7PVQP9pPVv9VPM8yILmRZsV5u8
         niEcWMO8P1ixm5VYKtlHfpo9YcuYUViwUlRiQH3ZfeuRfB+uHgxtnehuZ4HnPFAwADR+
         4eQg==
X-Forwarded-Encrypted: i=1; AL+hErFRTbCMfUf7cF3JfPoETnU3Xln1APY8osMCX8awbXj8obWri80A7sdGtYI5hlBNLSOkhFFvnA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/5Kjt9lkrPiAUFnTdI+8Up5Pnh2CJhJd0BRPOgVHSzj2jj2mtT
	1u9yDnQG1oE2mEREAB65f1mZF1sCU/Mq72GldnkN5MrvyNXD7QF+6XgH
X-Gm-Gg: AYBFou3MJBnOwgAc2F7Uql2H3rpHwh4Yi0T4Yk3fMKycKaVk0FrVk1Z/WfS5jQqxHmS
	ZIj4OCf2Xynpt5UuNUijVfo/iYFDQ3Dktv+XOSp7Q90RJCj9pb5u7T4oepNZbKyYXXWcjDzOhZD
	oXSV08E6Z0cyi1H1RueDvbdsvvIJ8agaQ0rB4GgSPNiJwmUKhx4coF8Z7I8JeR7G0Gj0kDsR8ok
	a0f2aIXtANZOxsNkJAhdXE25+pNC+NmfiUxtd+yirh4xqMQVJw96rPDHXF3EiVX2CFm2cDqd/sn
	UqaGnpZzbgOxOU6VKo+gCqiLN6utWPe35RQrBsv6cL0eoK0D6QVMxBcv43TqFFYh+NhzOSkT04l
	fTpDptaI6jkin6k5hsNH0ylY/ul6zzAlixM9kY0a6RhXYgj8wgSFN0/JfxrcSXP3qn5eLQNIci+
	FKuKUqnygGQCVTSRBZGgPT44SSxFu8KqBZKyxzCGdsFagSx0PeRw7JGmRwkLkxdVkjmq3o1spvw
	5dCoKpunrNJHzsopPh8h1w1Rn+GdhIrGGbpk1m8JVrIh984kWj7OneZOUkX1UHevb/XneEaHLcw
	DKuHQArqno0B7xJigj/xvRsULQ==
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb69b2d82fmr54499615e9.25.1794765841177;
        Sun, 15 Nov 2026 10:04:01 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:00 -0800 (PST)
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
Subject: [RFC PATCH v4 01/10] vfs: add provenance time (ptime)
Date: Sun, 15 Nov 2026 19:03:34 +0100
Message-ID: <20261115180343.576773-2-koray.fra@gmail.com>
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

Add provenance time (ptime), indicating the time when a file or
directory was created. This is user-settable via file_setattr() and
retrievable via statx(2) (using STATX_PTIME) or file_getattr().

The semantics of when to preserve this new timestamp are the same as
mtime, the idea being that there is a correspondence like this:

ctime <-> btime
mtime <-> ptime

so every operation (copying, moving, ...) that currently preserves mtime
should also preserve ptime.

Also add fa_xflags_mask to struct file_attr (and equivalent
fsx_xflags_mask to struct file_kattr) to let the filesystems advertise
their support for specific xflags and users advertise what they want to
change, behaving like statx.stx_attributes_mask:
- on GET (file_getattr): each filesystem fills the mask according to
  their supported xflags, e.g. FS_XFLAG_PTIME or FS_XFLAG_COWEXTSIZE,
  and provides the values in the corresponding struct fields;
- on SET (file_setattr): userspace fills the mask according to which
  xflags it wants to change, VFS validates this and preserves xflags
  that were not specified in the mask;
- if xflags_mask == 0, use legacy full-struct replacement to keep
  compatibility with older programs.

Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
xflags and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
validate that the xflags passed in xflags and xflags_mask fields are
valid.

Finally, add the missing FS_XFLAG_PROJID flag, to allow userspace to set
the projid using file_[sg]etattr().

[ This is a re-implementation of the initial patch[1] by Sean Smith
  <defendthedisabled@gmail.com>, following the advice[2] from Darrick J.
  Wong <djwong@kernel.org> of using file_setattr() instead of updating
  utimensat() ]

[1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmail.com
[2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/file_attr.c            | 75 +++++++++++++++++++++++++++++++++++++--
 fs/stat.c                 |  2 ++
 include/linux/fileattr.h  |  6 ++++
 include/linux/stat.h      |  1 +
 include/uapi/linux/fs.h   |  9 ++++-
 include/uapi/linux/stat.h |  7 +++-
 6 files changed, 95 insertions(+), 5 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 833e03810b24..12610fb6a751 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -102,14 +102,23 @@ EXPORT_SYMBOL(vfs_fileattr_get);
 static void fileattr_to_file_attr(const struct file_kattr *fa,
 				  struct file_attr *fattr)
 {
-	__u32 mask = FS_XFLAGS_MASK;
+	/*
+	 * fsx_xflags_mask contains only flags added after the
+	 * file_[gs]etattr() API, so we need to tell userspace the filesystem
+	 * actually supports all legacy and new advertised flags
+	 */
+	__u32 mask = (FS_XFLAGS_MASK | fa->fsx_xflags_mask) &
+		     FS_FILE_ATTR_XFLAGS_MASK;
 
 	memset(fattr, 0, sizeof(struct file_attr));
 	fattr->fa_xflags = fa->fsx_xflags & mask;
+	fattr->fa_xflags_mask = mask;
 	fattr->fa_extsize = fa->fsx_extsize;
 	fattr->fa_nextents = fa->fsx_nextents;
 	fattr->fa_projid = fa->fsx_projid;
 	fattr->fa_cowextsize = fa->fsx_cowextsize;
+	fattr->fa_ptime_sec = fa->fsx_ptime.tv_sec;
+	fattr->fa_ptime_nsec = fa->fsx_ptime.tv_nsec;
 }
 
 /**
@@ -141,15 +150,23 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
 static int file_attr_to_fileattr(const struct file_attr *fattr,
 				 struct file_kattr *fa)
 {
-	__u64 mask = FS_XFLAGS_MASK;
+	__u64 mask = fattr->fa_xflags_mask ?: FS_XFLAGS_MASK;
+
+	if (fattr->fa_xflags_mask & ~FS_FILE_ATTR_XFLAGS_MASK)
+		return -EINVAL;
 
 	if (fattr->fa_xflags & ~mask)
 		return -EINVAL;
 
 	fileattr_fill_xflags(fa, fattr->fa_xflags & ~FS_XFLAG_RDONLY_MASK);
+	fa->fsx_xflags_mask = fattr->fa_xflags_mask;
 	fa->fsx_extsize = fattr->fa_extsize;
 	fa->fsx_projid = fattr->fa_projid;
 	fa->fsx_cowextsize = fattr->fa_cowextsize;
+	if (fattr->fa_xflags_mask & FS_XFLAG_PTIME) {
+		fa->fsx_ptime.tv_sec = fattr->fa_ptime_sec;
+		fa->fsx_ptime.tv_nsec = fattr->fa_ptime_nsec;
+	}
 
 	return 0;
 }
@@ -232,6 +249,23 @@ static int fileattr_set_prepare(struct inode *inode,
 	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
 		return -EINVAL;
 
+	if (fa->fsx_xflags_mask & FS_XFLAG_PTIME) {
+		if (!(old_ma->fsx_xflags_mask & FS_XFLAG_PTIME))
+			return -EOPNOTSUPP;
+
+		if (!(fa->fsx_xflags & FS_XFLAG_PTIME))
+			return -EINVAL;
+
+		if ((unsigned long)fa->fsx_ptime.tv_nsec >= NSEC_PER_SEC)
+			return -EINVAL;
+
+		fa->fsx_ptime = timestamp_truncate(fa->fsx_ptime, inode);
+
+		if (!timespec64_equal(&old_ma->fsx_ptime, &fa->fsx_ptime) &&
+		    (fa->flags & old_ma->flags) & (FS_APPEND_FL | FS_IMMUTABLE_FL))
+			return -EPERM;
+	}
+
 	/*
 	 * It is only valid to set the DAX flag on regular files and
 	 * directories on filesystems.
@@ -288,13 +322,41 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (!err) {
 		/* initialize missing bits from old_ma */
 		if (fa->flags_valid) {
-			fa->fsx_xflags |= old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
+			/* FS_IOC_SETFLAGS */
+			fa->fsx_xflags |= (old_ma.fsx_xflags & FS_XFLAGS_MASK) &
+					  ~FS_XFLAG_COMMON;
 			fa->fsx_extsize = old_ma.fsx_extsize;
 			fa->fsx_nextents = old_ma.fsx_nextents;
 			fa->fsx_projid = old_ma.fsx_projid;
 			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+			fa->fsx_ptime = old_ma.fsx_ptime;
 		} else {
+			/*
+			 * Preserve unmasked xflags when running file_setattr()
+			 * with a mask, which doesn't need a read-modify-write
+			 * so these attributes would be set to 0.
+			 *
+			 * With FS_IOC_FSSETXATTR or mask == 0 (legacy mode)
+			 * this is not needed as userspace does
+			 * read-modify-write already.
+			 */
+			if (fa->fsx_xflags_mask) {
+				fa->fsx_xflags |= old_ma.fsx_xflags &
+						  ~fa->fsx_xflags_mask;
+				fileattr_fill_xflags(fa, fa->fsx_xflags &
+						     ~FS_XFLAG_RDONLY_MASK);
+				if (!(fa->fsx_xflags_mask & FS_XFLAG_EXTSIZE))
+					fa->fsx_extsize = old_ma.fsx_extsize;
+				if (!(fa->fsx_xflags_mask & FS_XFLAG_PROJID))
+					fa->fsx_projid = old_ma.fsx_projid;
+				if (!(fa->fsx_xflags_mask & FS_XFLAG_COWEXTSIZE))
+					fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+			}
 			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
+
+			/* xflags not present in fsxattr */
+			if (!(fa->fsx_xflags_mask & FS_XFLAG_PTIME))
+				fa->fsx_ptime = old_ma.fsx_ptime;
 		}
 
 		err = fileattr_set_prepare(inode, &old_ma, fa);
@@ -423,6 +485,10 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char __user *, filename,
 		return error;
 
 	fileattr_to_file_attr(&fa, &fattr);
+
+	if (usize < FILE_ATTR_SIZE_VER1)
+		fattr.fa_xflags &= ~FS_XFLAG_PTIME;
+
 	error = copy_struct_to_user(ufattr, usize, &fattr,
 				    sizeof(struct file_attr), NULL);
 
@@ -459,6 +525,9 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
 	if (error)
 		return error;
 
+	if ((fattr.fa_xflags & FS_XFLAG_PTIME) && usize < FILE_ATTR_SIZE_VER1)
+		return -EINVAL;
+
 	error = file_attr_to_fileattr(&fattr, &fa);
 	if (error)
 		return error;
diff --git a/fs/stat.c b/fs/stat.c
index 34d786c1de3e..1e4260f55f01 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -728,6 +728,8 @@ cp_statx(const struct kstat *stat, struct statx __user *buffer)
 	tmp.stx_ctime.tv_nsec = stat->ctime.tv_nsec;
 	tmp.stx_mtime.tv_sec = stat->mtime.tv_sec;
 	tmp.stx_mtime.tv_nsec = stat->mtime.tv_nsec;
+	tmp.stx_ptime.tv_sec = stat->ptime.tv_sec;
+	tmp.stx_ptime.tv_nsec = stat->ptime.tv_nsec;
 	tmp.stx_rdev_major = MAJOR(stat->rdev);
 	tmp.stx_rdev_minor = MINOR(stat->rdev);
 	tmp.stx_dev_major = MAJOR(stat->dev);
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 09e32b84e02a..42b92ccdc583 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -35,6 +35,10 @@
 	(FS_XFLAG_COMMON | FS_XFLAG_RDONLY_MASK | FS_XFLAG_VALUES_MASK | \
 	 FS_XFLAG_DIRONLY_MASK | FS_XFLAG_MISC_MASK)
 
+/* Flags only for fa_ fields */
+#define FS_FILE_ATTR_XFLAGS_MASK \
+	(FS_XFLAGS_MASK | FS_XFLAG_PTIME | FS_XFLAG_PROJID)
+
 /*
  * Merged interface for miscellaneous file attributes.  'flags' originates from
  * ext* and 'fsx_flags' from xfs.  There's some overlap between the two, which
@@ -45,10 +49,12 @@ struct file_kattr {
 	u32	flags;		/* flags (FS_IOC_GETFLAGS/FS_IOC_SETFLAGS) */
 	/* struct fsxattr: */
 	u32	fsx_xflags;	/* xflags field value (get/set) */
+	u32	fsx_xflags_mask; /* supported xflags (get) / flags to set (set) */
 	u32	fsx_extsize;	/* extsize field value (get/set)*/
 	u32	fsx_nextents;	/* nextents field value (get)	*/
 	u32	fsx_projid;	/* project identifier (get/set) */
 	u32	fsx_cowextsize;	/* CoW extsize field value (get/set)*/
+	struct timespec64 fsx_ptime; /* provenance (settable birth) time */
 	/* selectors: */
 	bool	flags_valid:1;
 	bool	fsx_valid:1;
diff --git a/include/linux/stat.h b/include/linux/stat.h
index 4f0a4af7a067..5384a77676f1 100644
--- a/include/linux/stat.h
+++ b/include/linux/stat.h
@@ -48,6 +48,7 @@ struct kstat {
 	struct timespec64 mtime;
 	struct timespec64 ctime;
 	struct timespec64 btime;			/* File creation time */
+	struct timespec64 ptime;	/* File provenance (user-settable creation) time */
 	u64		blocks;
 	u64		mnt_id;
 	u64		change_cookie;
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index a46c33692aa2..655e448cdd23 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -229,10 +229,14 @@ struct file_attr {
 	__u32 fa_nextents;	/* nextents field value (get)   */
 	__u32 fa_projid;	/* project identifier (get/set) */
 	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
+	__s64 fa_ptime_sec;	/* provenance (settable birth) time (seconds) */
+	__u32 fa_ptime_nsec;	/* provenance (settable birth) time (nanoseconds) */
+	__u32 fa_xflags_mask;   /* supported xflags (get) / flags to set (set) */
 };
 
 #define FILE_ATTR_SIZE_VER0 24
-#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
+#define FILE_ATTR_SIZE_VER1 40
+#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
 
 /*
  * Flags for the fsx_xflags field
@@ -261,6 +265,9 @@ struct file_attr {
  */
 #define FS_XFLAG_CASEFOLD	0x00040000	/* case-insensitive lookups */
 #define FS_XFLAG_CASENONPRESERVING 0x00080000	/* case not preserved */
+
+#define FS_XFLAG_PTIME		0x00100000	/* provenance time */
+#define FS_XFLAG_PROJID		0x00200000	/* project ID */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
index 1686861aae20..f3a1013ba022 100644
--- a/include/uapi/linux/stat.h
+++ b/include/uapi/linux/stat.h
@@ -187,7 +187,11 @@ struct statx {
 	__u32	__spare2[1];
 
 	/* 0xc0 */
-	__u64	__spare3[8];	/* Spare space for future expansion */
+	/* Data provenance (creation) time */
+	struct statx_timestamp	stx_ptime;
+
+	/* 0xd0 */
+	__u64	__spare3[6];	/* Spare space for future expansion */
 
 	/* 0x100 */
 };
@@ -219,6 +223,7 @@ struct statx {
 #define STATX_SUBVOL		0x00008000U	/* Want/got stx_subvol */
 #define STATX_WRITE_ATOMIC	0x00010000U	/* Want/got atomic_write_* fields */
 #define STATX_DIO_READ_ALIGN	0x00020000U	/* Want/got dio read alignment info */
+#define STATX_PTIME		0x00040000U	/* Want/got stx_ptime */
 
 #define STATX__RESERVED		0x80000000U	/* Reserved for future struct statx expansion */
 
-- 
2.56.0

