Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498250;
	b=fCb+Vls7H0Tz4qKKDT7WZqKjUfzApFNtSnaLq9OH6K39HizjYJKVw5p9FmGwsNJ/NXkR
	 TEj7xTBIcQbEcci8bds49N2FNNMiD7SxI1gL/cd1+Vw3POL8yK07O9PBZBmP7wIW8qb/O
	 xkaRxwSG2HXjFQPRuijXJG3AJKKX/EcR39zBSAPjq45rcLGy5p/qc4aN5mgF1V/SA2M+K
	 /h1zG3JTXLvFWSjnx93fuILEMaSVBlFYaAMdWJ4uoUuzsZfUgWb6JPbtLnsr5OozgDT23
	 xP0qqYwgEOFDCw+a1jZedSKZN2Lf1aYZa/ZvcdXIi7Yo/IN5TJD5lxge9//XUeinhyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z5MG08yt3Dfb74iEQhSFMIkh2RLd3WaV8uSunF8a+30=;
	b=0l7vUUGVaQh0j4o9Ee3jLzBHya2onea/Ni4s+XvlP3hqzWJYxuIqzB+yfQ/Gi8DjMNBZ
	 WTwGz2CaWtlA+RPPdP1pYBLJT2T9Q5U8aOyg2n5LbPTEg49p+yoez/EHXJXWdj8wHtb/d
	 Wz9lGy2+fSP7zfbAKEFeEaoabTkOMzIDYxxitROc6E83MCJwgnZPzdnvGo8F8769Qg6Bc
	 sTO+uDoL79Ie8lY341O0LiMov4Y6EpRK/BNeJVnhVZ2r5pMHA1+IlyOUV9/oecRwrebiH
	 dcq3jrba7eRRSos3tFBhSgPsTcYwyNK5RSh35ns1bW+mGWkwMUbR6pxryav6ECfAdmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIFixB3r;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A181A60A2606
	for <ntfs3@lists.linux.dev>; Sun,  1 Nov 2026 01:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A181A60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hIFixB3r
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so19808975e9.3
        for <ntfs3@lists.linux.dev>; Sat, 31 Oct 2026 18:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498248; x=1794103048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5MG08yt3Dfb74iEQhSFMIkh2RLd3WaV8uSunF8a+30=;
        b=hIFixB3rpqwxMrTMRHfRxmK/bAdmr6c148UAB2D1zhU1yUiMwdi3B+3cbC2NCoKVkD
         sD3NbWDhaoDBcpo5+ohQkA9w0fPnn6TtzsbvMJ7JOXUnQgCRX9ZVqS67c17vRCYVDLZm
         A31nwv5usNz0MXUtq9vRUgWhY+FlDaVcciBwu1SnoaExUYfX3mQeuUjv0mKwLZWkC9Fr
         u8eI3CjRmw/FT4LFiLRMG7sFAv8aDEzvV3UPWlu6O/tDr5b7LUI0L8+8+NwE1kFrhrbq
         497d+0+8+i31O7dddKwI50nyFVIeTEVVBfHCDZzCLapGoP0Gn06edoEdECUEmC7c6z8g
         a04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498248; x=1794103048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5MG08yt3Dfb74iEQhSFMIkh2RLd3WaV8uSunF8a+30=;
        b=zrny7dl1LNzKm5SAvZw+NK7vngU9pNOqL3gTYSKAuL/sKJL9W1eORBPpqifXCEpNpl
         x18uurVKA1oiVACZ2b7GwPHrUxbCr3uVh/uqLAx+B+1MMEKrBmxv13UMcYSkaPQRt8Kx
         8rfgHnBNQTr4RPIhjL1pUGoq6RoRWh46dO60KawCxajeitpBCUIyjtDaGWb9DnR7pvXj
         GxOIs7i5xLKuxAlcX9kThwzN3moYG5LxZxhwbjC92ubUkaN8BGU+/9ztqC9hrE63uGL7
         5Ic8oU9ddDFcz29uRrCCDIMzbTrz+Eihek6uTlHdnjLPWx0WtEg+MIB/ehsUFb/QOnCC
         nYCw==
X-Forwarded-Encrypted: i=1; AKwUvBwj95GKRHqTlKN4FOWC5ZjTiu5VhEN5qFtS4mcq74wVgM3eJiJCi3McVYjLb9JeMstKSJ6qxg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJaJu7zuV9KteRUlE6grPZC6fxY+YBCo81ZFJZ1QZkZgKBeE/mL
	vqL3/ZjR9rO3UETaA2uo0KitLABcTBSGIRyqR6ASqB2KTRMx4AJeZrjs
X-Gm-Gg: AYBFou3h3u9VMeRmf3kiFkrQ/MK6dm7uzwuJy8n4f8lI0FA73kV6JB6IfUMGvi9sarE
	hKDgCHwK0RDb+OnTUoz/REWuIsSaxTI+0lNeV2GZfEqdtnMJIFbuGT6C219Io6MQIViYNkPWhfv
	ruaAvpRh+sA+hYtjcJQR8ciZ/NUGoHw48j7VGsl8k2GZDGVzh+MLckeDfRDIko44zNs2ETd+z7Y
	F/OrIyr9uSiNYMGyCw12i8MLkDFk3LFotqQr3QluKvqhGfgnw5Ex/sLlstvKsYF0ExPAIRfGFJM
	NlLS4Pn2PeHET7nK1//YfLFn3DY6skRM6zeWPpHhWiYVeyeXmbPNYvtsKvw6+vBDylh9oFjLEjw
	7Zm4gYOoVZ64l/wwQVczbxdD/OcXfhInxKEmw7RaaLluqymrpkOksINrDhB6fcndd+MscEmQ/gY
	O8nN/6kFP3Zju/S/rSQOxBvnzTtBqqCdcIHNFbFM4KtilV7wTCuOnnYo3ktL1I6UFVxa4UAVTY2
	RXQ+z5ptGmKhGKMRF8dgYHcuMrIY8EjjkcBEpl3FJo0slPcW4XiKg6Kx2aFNlqFpo3gw0Hwxc0c
	+owRNl8zQC1QdXoAc6ySnz78
X-Received: by 2002:a05:600c:46d1:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ac187a72f4mr145723175e9.22.1793498247899;
        Sat, 31 Oct 2026 18:57:27 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:26 -0700 (PDT)
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
Subject: [RFC PATCH v3 3/5] ntfs3: make crtime user-settable using ptime
Date: Sun,  1 Nov 2026 02:55:49 +0100
Message-ID: <20261101015551.786044-4-koray.fra@gmail.com>
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
 fs/ntfs3/file.c    | 14 ++++++++++++--
 fs/ntfs3/frecord.c |  8 +++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 1624f9b014e0..b334449e9beb 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -124,6 +124,10 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 
 	fileattr_fill_flags(fa, flags);
 
+	fa->fsx_ptime.tv_sec = ni->i_crtime.tv_sec;
+	fa->fsx_ptime.tv_nsec = ni->i_crtime.tv_nsec;
+	fa->fsx_xflags |= FS_XFLAG_PTIME;
+
 	return 0;
 }
 
@@ -142,7 +146,7 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (unlikely(is_bad_ni(ni)))
 		return -EINVAL;
 
-	if (fileattr_has_fsx(fa))
+	if (fileattr_has_fsx_mask(fa, FS_XFLAG_PTIME))
 		return -EOPNOTSUPP;
 
 	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL))
@@ -154,6 +158,11 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (flags & FS_APPEND_FL)
 		new_fl |= S_APPEND;
 
+	if (fa->fsx_xflags & FS_XFLAG_PTIME) {
+		ni->i_crtime.tv_sec = fa->fsx_ptime.tv_sec;
+		ni->i_crtime.tv_nsec = fa->fsx_ptime.tv_nsec;
+	}
+
 	inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
 
 	/* Save nodump flag to return in ntfs_getattr. */
@@ -275,8 +284,9 @@ int ntfs_getattr(const struct mnt_idmap *idmap, const struct path *path,
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

