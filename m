Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544766;
	b=N6CWBHLUpNxn/v7CB/rXbwn+OcXe34Je0Jnoi0J66vjnqkgLyyW0DH+dcZnUx5gf3NvK
	 YnYxs2qZGd+KiDyUFDno3+NIsJL0wOmYQvLMQZckX+M+JHtCQUKlJY56+uvmXbStywtme
	 RyMYCHrUQq3mKRkhC+V9On/aw89elELFHbGTQFggHKoa8/CBSsyX0vWqAWmtHRDqB6hvh
	 zPhbPveX4fvU6VXK6rlTHieIQ6K/508mL2+NWvrXwJHCzL3YgEyjAKks7UzeTOCPDJ9Cq
	 BzzT+DGio0bZZbVt8MQXpBFYBu5QPUk9nK1k7C270jp1YlSAwkst/KbLPJGGuVwoQBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tFaT0DZ6F3QRjTbdaYV7CT46FZwUMHFmzpgE4p3kzPo=;
	b=nLR44YStRym1XBkE7AfaWYpjGXnXN9rW9paZ3kcU+s6nVffOwCocWtDnzdyOuAwSWzwV
	 FydpoaaVWOfz2Gl8bHNe+/bKsoX/MwNiL2jmkr8clXgR6n6AnnjAzG5888TODB64J4dns
	 KOXsiYkTrot9MhX5ZxjDtCHi9bwK4mXpMMkQmU97qNgxVjVZV3hsQs2BSH6IJ4rqMUJHA
	 jtfOcV16SVfhhXsMb6nfT0GTRSbCCD5skGcrpuMnxFidRKAXKrYCtO1yxBmVC5FQoqb3y
	 fUgSlLuHF2tpdUzrVDpa7pYOoWH/2vff2jLs7jIF6c6GiyOj6Bk+r2Q0KcY+iBBBK5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=gcyDcJwP;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283F606A327
	for <ntfs3@lists.linux.dev>; Fri, 13 Nov 2026 04:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3283F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=gcyDcJwP
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-679a2b5fe87so532553d50.3
        for <ntfs3@lists.linux.dev>; Thu, 12 Nov 2026 20:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794544765; x=1795149565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFaT0DZ6F3QRjTbdaYV7CT46FZwUMHFmzpgE4p3kzPo=;
        b=gcyDcJwPbCozNFHL7LjpKgOGptI6nN1c8z9nsxYG60gR8lfcF/h+aPJo0MVuzfQ1JT
         ojhCd3oF9Lbuwt72OMWyn6GfKQT8t7HNQTzle3fooTCMxJCXPLvpcvdyL3LTPo/iqlH3
         8yPbinG7iPaiQq5Q0ZvqVE7L63eIywxtb+pVPsSNvxJz1w6cUt6y42DF5ZJX1gq1n4T7
         +1L8VVPpNLxrki4XJn55tnCXc1YA2lzWyjx6YLClV2zcN0KOT1S2pDHDK6DhD4100kzj
         MGNafGdWAICvl8ydlI4BRBSXeKoBnPkK6DGssZklvnwV2aQCPU4DWBJk5KNj/iB2cux6
         Xz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544765; x=1795149565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFaT0DZ6F3QRjTbdaYV7CT46FZwUMHFmzpgE4p3kzPo=;
        b=LGhvWXQmanxyJSwgKrFe99sx8wLIHsFipo231fn8suFfH7n3/gFRyo1dzFTUaIE/YL
         c7y9Rup32EyWgH2nCzFJvb9x2vcr0TOCzb+DkhM7VGY/x70HMjv26jD65RPcwKC2/k8G
         EX20PhB4rtY9svLLTV39tSXT/G3FyMAO3xCtk3om0RCyzkADXtBeJ/1gDMGa8cKWTBcm
         k16qCM1ymJrLEq0pI187TTRMVQXI5f5MCPzyoBme6piukdSa+gKcH+ItXKbKC2dit0MN
         7qYiXoCbi88cMrtDG3n6HQnrwudAGUJlDlHDW/j/Kqcb1uFaYaQwsJAsjFC/RVy0/aTr
         KRpw==
X-Gm-Message-State: APuU4Z84PRHjEAG4uha7Nf43lA/50ZbTg3a0h1O3mPlNwMTMPiyau8le
	pp+4ysxrPODhGm5HexxYdE1ME0t6+gztbavIj0X8pMUtU1NIwmvlSSKRColggEECiQ==
X-Gm-Gg: AYBFou2l0zLvsPAn+opeFkC9zS5PkaFNAk9c2O/5tw+17UQBpLuDHVkDR0H3D7VZ1dI
	uRYznHHSWb/3qgLyOlF+2BFDOO7uoW5LXA70sYEde4RG2Z4UlenMkPFjr968I5pd6wP8eVuScHO
	ztkBfGkw90/pJkfo/3XFc1X2zn10EMg37q+cGEKLcyuzntwZCWMr1rZzmbqMLhNic7qyCEYeSmp
	v+YEjrqt5cnUqBQ9PXKk7KHBVOJGClWYk9VT92DmoO6YwpoY4iDFNSEP3fD+YZsIV3g9TGS5fZm
	OTpYvMvFRsp9yCTtEvlCasX3Iov293Qohh0UhdksXKJ20mbIF2DzHgkcT1hivdRT3MrvjADAy1G
	M/YSPLFNpUB64LrL+G6YU24z0/qoLr5FpueqR7z6Uzco1kyEs3fTqMxitkwAJyZHNiQvPvkgUUO
	vCsiUjVG0PUPgMF7usT6kKBA+P6KTjHZ4j8Lt+wfHpBGAexfLtTn0xYeuDn0Lj6zmokATXcbGnp
	ZCexT3NTkLvphjLVC+ly1G67MYpZaTfD1LWpMRXaU3jchsrEjQqEGeFlh5lRrfQcdPue43enQdW
	45YApGrUkI5mjaLihGarRWxbnk9Zixkp7aq56Pn/J/y9d1NPsN16AM8vfkDzDDJtStm0/xxg
X-Received: by 2002:a05:690e:1917:b0:679:ba40:efaf with SMTP id 956f58d0204a3-67d895e5adamr679117d50.46.1794544765076;
        Thu, 12 Nov 2026 20:39:25 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a64b04bsm1078108d50.23.2026.11.12.20.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:39:24 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: do not restart readdir() when entries are added
Date: Thu, 12 Nov 2026 23:39:20 -0500
Message-ID: <20261113043920.2583254-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit dffc7f2f177b ("fs/ntfs3: allow readdir() to finish after
directory mutations without rewinddir()") made ntfs_readdir() start
again from the first entry when it reaches the end of a directory whose
version has changed. This helps programs that remove the entries while
they read them.

However, indx_insert_entry() increments the version as well. As of now,
a program that reads a directory while another program adds files to it
gets the same names again and again, and reaches the end only after a
pass during which no file was added.

The issue can be reproduced on an NTFS volume mounted on /mnt:

    mkdir /mnt/d
    for i in $(seq 3000); do echo > /mnt/d/a$i; done
    for i in $(seq 10000); do echo > /mnt/d/b$i; done &
    sleep 1
    ls /mnt/d | wc -l

Before commit dffc7f2f177b ("fs/ntfs3: allow readdir() to finish after
directory mutations without rewinddir()"), the result is:

    5489

After that commit, the result is:

    1837538

This patch will increment the version only in indx_delete_entry(), so
that added entries do not restart readdir().

Fixes: dffc7f2f177b ("fs/ntfs3: allow readdir() to finish after directory mutations without rewinddir()")
Cc: stable@vger.kernel.org # v7.0
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
The readdir() + unlink() loop of that commit keeps working: it still
empties a directory of 20000 files in one pass (298 files are left on
v6.19).

Application impact (Ubuntu 26.04 user space): "tar -cf" (GNU tar 1.35)
of a folder with 3000 files while "cp -r" adds 2000 files to it. On
v6.19, tar ends after 1.2 s and the archive has each file once. On
v7.0, tar runs for 29 s and the archive has 200434 members, each file
up to 48 times.

Tested on ntfs3 master: without this patch the archive has 261512
members; with it each file is there once.

 fs/ntfs3/dir.c     | 6 +++---
 fs/ntfs3/index.c   | 1 -
 fs/ntfs3/ntfs_fs.h | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 7ee1a5d4189e..defc84693e39 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -476,15 +476,15 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 
 	if (!pos) {
 		/*
-		 * ni->dir.version increments each directory change.
-		 * Save the initial value of ni->dir.version.
+		 * ni->dir.version increments when a delete reshapes the
+		 * name tree. Save the initial value of ni->dir.version.
 		 */
 		file->private_data = (void *)ni->dir.version;
 	}
 
 	if (pos >= eod) {
 		if (file->private_data == (void *)ni->dir.version) {
-			/* No changes since first readdir. */
+			/* No such delete since first readdir. */
 			return 0;
 		}
 
diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b36760448..29884bf3d35e 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -2100,7 +2100,6 @@ int indx_insert_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 					      fnd->level - 1, fnd, cmp);
 	}
 
-	indx->version += 1;
 out:
 	fnd_put(fnd_a);
 out1:
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index f400cf94d05b..12212fb7a2be 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -198,7 +198,7 @@ struct ntfs_index {
 	struct runs_tree alloc_run;
 	/* read/write access to 'bitmap_run'/'alloc_run' while ntfs_readdir */
 	struct rw_semaphore run_lock;
-	size_t version; /* increment each change */
+	size_t version; /* incremented when a delete reshapes the tree */
 
 	u8 index_bits; // log2(root->index_block_size)
 	u8 idx2vbn_bits; // log2(root->index_block_clst)

base-commit: 0c895b1f6ab37a7c72a437818f307ef6e629051c
-- 
2.53.0

