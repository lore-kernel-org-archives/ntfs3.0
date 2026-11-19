Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101186;
	b=m2UiWDB/JCFw3mO8EEw6DNlVQJrYtGys4KWG5fiHl2/p7fzRp3RvBjAruuydPWxUDDuw
	 e2Lp0f+H3ObO7k+noz5DHKgfm/43CoThc8UbVRl1ZDYtDSRiuonm3PcHMw8d3t2H+C95X
	 J8n1LB+go4s+/qIKl3nOeBD15AtUgfe4yiko0l47vGFjritcdAyUk8jzzsvQBPlc5ij7C
	 SpXW/QMvrpbIc+MpRzxAn2obnsfR/bde0qg8C+aLvpVYTQ3zT2GLb/2h82/w2g0H42qBq
	 kAhZN80otjJzVkcfoCt+OezoCnwzgs1U/JJ7VF1zB/5UmtRFWW7jvsQw8TiaMmcj4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JpxIvevc+k3PDqIuz3tCAw053u2XWq+vX93HZah6pos=;
	b=s9N54EAfBbxMFbhH4AeUvHv6cZYjmbI23PxjoGtRQ/DJ+MCGRGy/m7oh/7Whv+i6ewoj
	 KXVh5ioxUL6nhZU5edpcK8SUHK+UjpASDZFw1z8+uu/VJZk8KzJOWqS2fHrUT23STybP9
	 PF0I3NPXfiQxJCBz6f/c8Rderrs+I41tq/dDZjf2wHDof1Yre1r6XhjbTyfWEvAMxnPa3
	 dfxtXk9jvLkkjtXMcTcJC/767LVXtUCkb1ML4bEJ4FSHHVRo4v0lz+VPbNhKWCtTvuEhY
	 HLQFPJXba1XdRPZeUdHWPG6lzRt8b6IIixw6doQmfyhjM+xyJJLxFlcPRa0aOQaPofA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuotuOeo;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2667606A324
	for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 15:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2667606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuotuOeo
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2efddf749e5so4878175ad.1
        for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 07:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101185; x=1795705985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JpxIvevc+k3PDqIuz3tCAw053u2XWq+vX93HZah6pos=;
        b=RuotuOeodKwMFAVH15X0TiZmmJuecjfUI/gD1/XU1VjCP9suTJK8lXHftDOTgrzg4k
         rq6eOT53pc6nZMxLpSsBXpcA8TGf/f8aw4PjiSVZlqqm07OMLbdSOvNxZ+ANli9HcQH+
         DP+yGIL6wIlmqO4opAa+uCyOfyqXW85lcyUWEAJ7jNEnjQnI759SaS61dEKbsghn7Bo9
         UGOsSlCdsJxZtIlavcJ6YO7VkTSia1oKghpieCDBuIKqhjMFjal+hXbkYja/cr8NlonL
         Gw3xxHJBVV1ddp7+EA/dv07iMwxWRdjvb0Ikw4bFh3EXUeR5bmmzNIIBN6ht2L9RN0WC
         e5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101185; x=1795705985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpxIvevc+k3PDqIuz3tCAw053u2XWq+vX93HZah6pos=;
        b=p6Y7PmfiO6QT2eAUMfbkuEa+TYdCXoPrKeviWtAWWl/KTyIr4BE+wv6VWnu/VUXbmD
         ubaAzK2b2qN13OnEjff3cGsv9ZsRu1azHh4CfkerZZtFN67BT08AaZ3/HnL4FspuxUVO
         p/Kf79phAUMOJXuvLExfBC/jT0usZZUhKb5TJAo2EEBgm6/znOC3026zJ67XG6vnD20J
         RB3Eg1HnpBAQ9uOO3M6ekAKeoYRKR/VSQ+WiPSGppIPP3ZOMv1bE5R6zmYvix50tFO6i
         zQqvGh9k8S6xjNr4x5e8stPhR7FcU1DKsl5muNxyq0gmSHGWHHgeiGArpJ5Y5BJymNA/
         zPaw==
X-Gm-Message-State: APuU4Z/16TFsZ+LycaHSaNfDroNed2riFBvA6T3v9Zkw+PkFSqWJzv5o
	kD4/hw1pczCy3MhgHRnu4Z+hHTDc6OwiRZaSTnpI7b0AMpPrIFWybMD9
X-Gm-Gg: AYBFou3LJtWtomi/fC+i/rchxz7xOq4TihENU8s68umcydIRXGSvNGWpLfAkByh0GNo
	Cfey9vjjOCdVjnLebMidTx3N8vvT+kW9AIqoTew9o64hd4AI+GQ3MyxBOUIJNtjXtjvPFjt5F8A
	YkBSLMVPjM6m6WGTDgKg1YUrfVFLuZ19OaZEowq5XIdIyP5RufY7RREepyiBK6qhKBrQtSS0FAi
	jtlhVBjMWUtY8jVknokVX4/Z8DtSgI9jONwBWD4oc7F2x+IcngjkMUR0qg7Ph4OAXoodTlLHxIf
	wTqoStLpFp20R7t0ev09xbQPlVh9W4/bYzctY2FlK56CLHunnAAIr2fLgFkl1AFIAAHH6wHCZfT
	k27G0PGPBJbolptSd/YrkcS+eSNqFilymZTSedHLAU1Fqx9+07/6NFyYhawAti3Wfj7cWdT+mkB
	cYnoa2VRiRBdv6eiPz9Kq6A5B615ZTpVzjigAXglDka8nKTT6B8xl9uf/YgtKrz5FSbDtf3RgZl
	NGaiH+t88GffFeqP2tbpVjqw+jEVoN+i+j6Swu3IkPGzlgsmE57CFL3Cnxdi7fmdWY9Md/V9ENZ
	pzWDQxj5KPWl3FT4YzKGGfr0HeON9Y6v6rVIvTPOOH121A==
X-Received: by 2002:a17:903:198b:b0:2e8:95d8:6423 with SMTP id d9443c01a7336-2f0320782aemr12269375ad.38.1795101184871;
        Thu, 19 Nov 2026 07:13:04 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm1157095ad.67.2026.11.19.07.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:13:04 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] fs/ntfs3: don't prepare private mappings for writing
Date: Thu, 19 Nov 2026 23:12:59 +0800
Message-ID: <20261119151259.3965463-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_mmap_prepare() allocates the clusters of a sparse file and
zeroes the file up to the end of the mapping when the mapping has
VMA_WRITE.  A MAP_PRIVATE mapping never writes the file, but it gets
the same treatment, so any user who can read a file can make ntfs3
write to the volume, also when it is mounted read-only.

With -o ro, a MAP_PRIVATE mapping with PROT_WRITE by uid 1000 of a
4 MiB sparse file zeroes 4 MiB on the device and marks 1024 clusters
used in the bitmap.  The runlist is not updated, so the clusters are
lost.  The same mapping of a 4 MiB file with 4096 initialized bytes
writes 4190208 bytes of zeroes.  On a writable mount, it allocates all
clusters of a sparse file that the user cannot write.

Only prepare shared writable mappings.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in a VM on 7.4-rc3 (20eef29b7c84): with the patch, both read-only
cases leave the device unchanged and the sparse file is not allocated.
fsx with mmap on 4K and 64K cluster volumes and on sparse and compressed
files gives the same results as before.

 fs/ntfs3/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 6c84a3e1c7fe..3da8b65793e1 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -388,6 +388,8 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 	struct inode *inode = file_inode(file);
 	struct ntfs_inode *ni = ntfs_i(inode);
 	const bool rw = vma_desc_test(desc, VMA_WRITE_BIT);
+	/* A private mapping never writes the file. */
+	const bool shared_rw = rw && vma_desc_test(desc, VMA_SHARED_BIT);
 	int err;
 
 	/* Avoid any operation if inode is bad. */
@@ -417,7 +419,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 		file->f_ra.ra_pages = 0;
 	}
 
-	if (rw) {
+	if (shared_rw) {
 		u64 from = (u64)desc->pgoff << PAGE_SHIFT;
 		u64 to = min_t(u64, i_size_read(inode),
 			       from + vma_desc_size(desc));
@@ -452,7 +454,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 	}
 
 	err = generic_file_mmap_prepare(desc);
-	if (!err && rw)
+	if (!err && shared_rw)
 		desc->vm_ops = &ntfs_file_vm_ops;
 out:
 	return err;

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.43.0

