Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765848;
	b=0Xs0QKyKc0IvxnIsmg7IjiWOJawI69pIHrqIU3zm7EIpKa19uh0panVJMUQCmVlqhQbX
	 3Ku64HhQXbALtv98d0DcSa1Hc1HI3e9yPsqnk+ioQvyeo4oCojEyvmXEzKosA7aIrj4X+
	 jmaUvNI2JKMq035zN7QtS7B4WtIRCM2up+RsuD7X5PR9lTqek3Ow7H/BPSe5KchA4SfRw
	 3WOviExVdpcVjsEUaD5/ga8ACOUrRQAVjueMJFhdFZIAVzK/2AwjJgwSJNfqJU/uc+Jcy
	 MFjsWq5Fivja5I1hDxsBNvKsag9nMy7To5J3MYgWnXUqEMIkpClA94V1upqO9MZFu1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2ER6/NO7zpzo2Xjo4XaIJ1M2igxcKQmZBMoJ1KN6Ri4=;
	b=FH/ulEK6lND5DPPrBDcKnl5Y38/p7ERNvQ9boiMAeORl2SurE0/50xLUHev4YdLHC1Yw
	 nFQhRIb3mFqursoMaDnVQ09uIQ80lICgmFwX998ApkLEw7xiEitxUGmRf1u/mDbvC3S41
	 AE9x+zrM3YPOXIWEz3uN3jKs24zMipS48/qcxP9yIAeoLalQFf4v7w30WKfWy66AqDoZF
	 5cufc3cpLowToEHJcWeZFSP/IQ6588gxNKcpDUNJx1qtiFvzc3eneo+5zil37MggYrvpl
	 DUBxr6LeZSJtB88HqszyXo8JI1ElJeZjsyvd18coqLhVZxJsTpV3IdwjTm+lSa1/vxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnd6KREC;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA0260A261D
	for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 18:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA0260A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnd6KREC
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so2446069f8f.2
        for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 10:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765846; x=1795370646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ER6/NO7zpzo2Xjo4XaIJ1M2igxcKQmZBMoJ1KN6Ri4=;
        b=lnd6KREC5g2gTnk9StDpeeFvXZIvySfDHMghWW6ZY2XoKFgUNPBEayRo8jKh5nmXhr
         5ku8IVo+NLog+jreT00yOO+u0Ddw0nkTd17RFb3rXn3auIuDaUdMz0Z7pLI39GK3lH6O
         UXpF/Oqxv0aXAYnYEVWrr2EqSRi9GRYqdFfU8OHwU9abs1mlC+unoU2EpcX25ZvZoFAT
         KMvYjDXEz2SPMFTCA5tRp13cGvH0F9xjsKcgRzvBH+NQKSytcaom5/5JTgnSc7AJvI6n
         L98+WXQPDCj8Lr48Rz3f2m1WH2vR5roN8jYwNUc0Cx0jrTzZf/aZdZkUQCU73065k8XM
         ZC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765846; x=1795370646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ER6/NO7zpzo2Xjo4XaIJ1M2igxcKQmZBMoJ1KN6Ri4=;
        b=vffVmaeje5EV1SDzAziiDKYf1gZL406Kbucozp7xUUdvetl1FtOuwS6IG4419SCENg
         hlWg1EMvE8Rdq1QhIuBw1Va4+2JRKqt5Zt1II9RaGzD+7IhpwrKc3KIWv6PIx30pXNqi
         MyEuTIG67bdLp+w3iVmZpWtEeLzFe2XP1QCfnBQ2TXzzDOtLg424QRtE4eEBP/31auJh
         hbDPfeyTfCRRNWAA4poe+J7cmFG8NhRo5p3L/3F/E4Y4CieKbXYzi4GwFk3qlTASO9TN
         sWm3Sj4XFMbH2Dl2gea1Q8/T8wBQt9YansysrVRyYp3diAA6/PCzOd5jgDmY2bVy32gv
         Xpqg==
X-Forwarded-Encrypted: i=1; AL+hErH5+coaxi0Qqxeefb851pj5t844vIXGNAbMvXpgbsl3vQxDd4DeE/LH1Sp5p6KMpUcLRax8sQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z98Orop7oxbEJXQmUtYGfI6iknS5tj1C3atekV1O4uKQrE8JyRg
	XNVQHgotIclgC6ukiriAS0jyTc6jgk606AlTrbSJ8pSYVM6a+A7VYpWy
X-Gm-Gg: AYBFou0HPDUw8+oSjlSiNCIR/3E1gCSNfHVYVG/z7l99NFJ3vURMN7svYr5TxNqLYbM
	TZETVsmVVk7XEFF0NKZ5bC56gRANJ+0WQXv4idW9OxiGEfjarMO8NtfxTwjEj6iiUAm+wnQhPES
	qVY64njBMeJ4hPiDfUeaYBn9csfg4idS2fdlVVgR2qfP2QKTa+/xNAOnkiCP5IBjPL7LDeBcMHH
	xERlHaMpeah3yp2H7PWT6VnjonXp3RT/pRgVoBQ3XIcKKh4Y1/HVl2/snEQPH4FkeDYgs9A7MgE
	XSm1qkpfIOD3Mz4j9RCni7dbGRTnJk7kXZR1m9xwPUxkeBQHC8X6/vlML3jRKVNbJyKKAUku5eM
	79kloRG1wioFGQkNuGqQWsvTs8cnj0lSZ29Hh4RXXM5apKo8KVyXmeOwcGOCS2jqLUjL0ewP6t/
	D7GwcCr3PCz40qsnrLBTEyjYh3zwMmix2g9bsey76PXyesdmENjrjRuSKIg8bwvPOOb2KXnxCHE
	LlR8BuB9MJ1de8xlO+r+rD2BS1gXgO6/gpd71qc4oz5rWnSz06AMkwZTbbcs55KLsBAFYDrd2S7
	bqWUOlaDAPR1CEiSLUuVsfPp
X-Received: by 2002:a5d:5d88:0:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-49c70ed8eaamr19692466f8f.18.1794765845937;
        Sun, 15 Nov 2026 10:04:05 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:05 -0800 (PST)
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
Subject: [RFC PATCH v4 03/10] ntfs3: make crtime user-settable using ptime
Date: Sun, 15 Nov 2026 19:03:36 +0100
Message-ID: <20261115180343.576773-4-koray.fra@gmail.com>
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

Since NTFS supports user-settable file creation timestamps, map
provenance time (ptime) to NTFS file creation time (crtime) by using the
newly introduced ptime API (in commit "vfs: add provenance time
(ptime)").

To do this, update ntfs_fileattr_[gs]et(), ntfs_getattr() and make it
persist to disk in ni_write_inode().

The timestamp is now retrievable by using file_getattr() or statx(), and
is settable by using file_setattr() with the FS_XFLAG_PTIME flag.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/ntfs3/file.c    | 20 ++++++++++++++++++--
 fs/ntfs3/frecord.c |  8 +++++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 6c84a3e1c7fe..1a9301006154 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -90,6 +90,8 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
 	return 0;
 }
 
+#define NTFS_SUPPORTED_XFLAGS		(FS_XFLAG_PTIME)
+
 /*
  * ntfs_fileattr_get - inode_operations::fileattr_get
  */
@@ -124,6 +126,11 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 
 	fileattr_fill_flags(fa, flags);
 
+	fa->fsx_ptime.tv_sec = ni->i_crtime.tv_sec;
+	fa->fsx_ptime.tv_nsec = ni->i_crtime.tv_nsec;
+	fa->fsx_xflags |= FS_XFLAG_PTIME;
+	fa->fsx_xflags_mask |= FS_XFLAG_PTIME;
+
 	return 0;
 }
 
@@ -142,7 +149,10 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (unlikely(is_bad_ni(ni)))
 		return -EINVAL;
 
-	if (fileattr_has_fsx(fa))
+	if (fileattr_has_fsx_mask(fa, NTFS_SUPPORTED_XFLAGS))
+		return -EOPNOTSUPP;
+
+	if (fa->fsx_xflags_mask & ~NTFS_SUPPORTED_XFLAGS)
 		return -EOPNOTSUPP;
 
 	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL))
@@ -154,6 +164,11 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (flags & FS_APPEND_FL)
 		new_fl |= S_APPEND;
 
+	if (fa->fsx_xflags_mask & FS_XFLAG_PTIME) {
+		ni->i_crtime.tv_sec = fa->fsx_ptime.tv_sec;
+		ni->i_crtime.tv_nsec = fa->fsx_ptime.tv_nsec;
+	}
+
 	inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
 
 	/* Save nodump flag to return in ntfs_getattr. */
@@ -275,8 +290,9 @@ int ntfs_getattr(const struct mnt_idmap *idmap, const struct path *path,
 	if (unlikely(is_bad_ni(ni)))
 		return -EINVAL;
 
-	stat->result_mask |= STATX_BTIME;
+	stat->result_mask |= (STATX_BTIME | STATX_PTIME);
 	stat->btime = ni->i_crtime;
+	stat->ptime = ni->i_crtime;
 	stat->blksize = ni->mi.sbi->cluster_size; /* 512, 1K, ..., 2M */
 
 	if (inode->i_flags & S_IMMUTABLE)
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 16ac847de48d..5e4f743a5930 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3215,6 +3215,13 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		}
 
 		/* Update the access times if they have changed. */
+		ts = ni->i_crtime;
+		dup.cr_time = kernel2nt(&ts);
+		if (std->cr_time != dup.cr_time) {
+			std->cr_time = dup.cr_time;
+			modified = true;
+		}
+
 		ts = inode_get_mtime(inode);
 		dup.m_time = kernel2nt(&ts);
 		if (std->m_time != dup.m_time) {
@@ -3250,7 +3257,6 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		    (modified || (ni->ni_flags & NI_FLAG_UPDATE_PARENT))
 		    /* Avoid __wait_on_freeing_inode(inode). */
 		    && (sb->s_flags & SB_ACTIVE)) {
-			dup.cr_time = std->cr_time;
 			/* Not critical if this function fail. */
 			re_dirty = ni_update_parent(ni, &dup, sync);
 
-- 
2.56.0

