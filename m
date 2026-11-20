Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181770;
	b=cbIiZ1x4ILizJHOogknx574pFOGbze7HM20oX5O2IvmmuFSKvbdEuV2dmPtHUm8EVEEN
	 nJ+6/RscBmF70b/Cd7noda7KH3dVPGXnXhje5+c9ycjA+GqsGOyRfAfTG5Aa4auyBRNJb
	 UKJiZ5opX9Ohz9LwnSg8gNnyGGBLuzbWJApP7tjUZmyZc76xLrivkbSmEofC2+tBd+OFn
	 ZJQR+T28iylufhCb1EHnXdDodozdppbaU/sdsDn3QrX48+dMkjnBvmK7Rq4r6ddOeC3Os
	 5E3mF1lPP1b1u/C4V09bpss8YwxihrBHBr7rLFx44wTwvalNH/XM/I5XpC3Etlrxlrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/vILFpTBKVy7hMrZddb0IwK/uJclDAZCWjwJQwnPh2M=;
	b=gbsxl57NJUmG36denXvbcW0hP8Si1Db0QEJGVFw9+Izl2I550V0eHj/mtnIi1rsTSVBn
	 7wqpoIq8VGhTqA4XlmXHwFzKfdf4wzSBG3zFIGU8EUrtnddV1h+jZwqwAnu56ctZUyQwx
	 HS2UOo4he2gwwBMD3Rcj6O2XAS0IunfuzPLCE71xvclFXUBmgFr3Lv3klm9cUpGA4Y33Q
	 nid+srxTzHiQiWzk8mOa0rBCWecSBXsJE3WXjp4umgFegOcWKgky/4sxMDN6cRXSEXdwR
	 d+zySNCLiHAcmlgBn3OyX9t7br9hs9T++GkDAhhi5TNi7/JM7utSaNiIKDamxv5GiyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JehTsPjO;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522E1606A320
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 13:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 522E1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JehTsPjO
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc758830601so690230a12.2
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181770; x=1795786570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vILFpTBKVy7hMrZddb0IwK/uJclDAZCWjwJQwnPh2M=;
        b=JehTsPjOea+25w+j6xOwQfBQLfTquOn2y6tCoqYkWCf32W0c9JQvtERkZBCuOD41a3
         Ajh7YefDYKcZChQhW5jM7IgzjHK7KxLN9ldsGBn2FXejDtNlbJ8h4KgDST/eEV1twe5G
         6r87zl+eMdO0mzHQGPeGQiOxjsB0x9waqw3uN7FvW8SIvOfjejpbseUdT+6LIQcIRDPH
         ip0ad4vn6x0QgiJHTTgZREAA+lFKqIV4yR9FIIz0Q/W/1nz97npK+DXLyc5HyQGy61lO
         W+7eW4Kd5F4LN+trvWh3X3VMght4FxPkiSpITv0OKJ4rGCWNq4Krtf4ZKqMISSx2koYH
         ot2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181770; x=1795786570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vILFpTBKVy7hMrZddb0IwK/uJclDAZCWjwJQwnPh2M=;
        b=wVffhsYUb4n/9EIH8lNLQpFBoKkXQd6HVtm0SSZwIKrfOzPj7uOUI3Oyv9Yp+WHdXQ
         ar4ehMHaBS0eG38+JYItD9yRf8jUHIa0nuDpCF5fTOhH5hwTp0/qU+sV0u9bR7m9z1Ws
         Xlzk+4enM1w8y2OLwzkUt99D9YAY3AFn387G0onri9kKv2nTW1MDejyKgiz6gsuuRG/4
         HQ9k6xc+FaDSqot20kKH5ZSNkjzHFFX42DsM7N0TmaFTs/f5TNPAEMdG4D25WKX5I2Vj
         KNI6p2epOpdlrJZDD9HxM8C3CgPMJS+eGcep3MyxA6nP94HAdTPYJs1hhIeZfnGI8ZAG
         3mNA==
X-Gm-Message-State: APuU4Z8ap724TKpjo9FWXEQvVTBqcjYW6wi5b2aEKtqZDec67iNzXF7o
	C5H3d/ALbuhlN/9IbR7D6BBvP44pweoVYDyf8gqzltodPRfMijbugcnL
X-Gm-Gg: AZFdTZcnpJy9ngZU6j8Lq0680HlsZqJ/RsIxy84VlPjMpTW9M1C9JHXD350uPPjn2CG
	V++k5taQsKxeHanvVSNkZWqs6Ehsf9Lc8RpqDqjzbGM0Q2e7W/CRF+t6Y9DPJawgNg6m9tNuhU+
	+8ENctmrWSPFw+kPWouRYr/XIS+QSCbigkS60IgXQ2LaayRIfzGsLwJJLsGqgCJ5mdCWOtVnDSO
	tKLzyYGHi+n9dZn+C0Ov5hcBsUwK0qMGpv/xqud4J1YeXKxBCtGeo4Yj9UKd2phVobnA0c/mOvx
	z83pcP2y6yU76YxokdVoUQT/vgAs+27OllbPSj8fKIaw97xrVoszQg9NfUfulcoXYI5aM4ebYvt
	N0MMwWwn+xjIgVt1s5dTvXP/3VGg/naRYrPjOF5snodUl5DPj7iVCGOgHoX2L3Jht2sZc7GMqkF
	fxzm1RBtF1eZskcE1QIPrWU2POY4JIIemzR8ixAuFFxoWc/ECZrsWhnGhKSPPIsRX3Ajp7CNDnc
	GsOO0vIiMjYibPt3sTJvQtgQ5LVpuqtg/RKh1TQ5w/cuzjAg9OnsXo4uTOWEk06Sw8JorxX8MJW
	L9Z2wRh6qeiy7oSLc4ppLDiI5P0fIQNYNYh7czIX6s8ugA==
X-Received: by 2002:a17:90b:2688:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3b41c97ab4emr2678585a91.51.1795181769634;
        Fri, 20 Nov 2026 05:36:09 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm7557362a91.14.2026.11.20.05.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:36:09 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 1/2] fs/ntfs3: allocate only the written range of a hole on writeback
Date: Fri, 20 Nov 2026 21:36:03 +0800
Message-ID: <20261120133604.427285-1-zhanxusheng1024@gmail.com>
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

ntfs_writeback_range() maps from the folio to the end of the file with
one ntfs_iomap_begin() call, and for a sparse file that call allocates
the holes it maps.  A page stored through a shared mapping reaches
writeback without a delayed allocation, so writing it back allocates
every cluster from that page to the end of the file.  Only the page is
written, and ntfs_filemap_close() later raises the valid size over the
rest.

On a volume with 4K clusters, map a 4096-byte sparse file MAP_SHARED for
100 MiB, grow it to 100 MiB with ftruncate() and store 8 bytes at 4096:
97876 KiB are allocated instead of 8 KiB.  With a 4 MiB file and the
store at 2M, the 2093056 bytes from 2M + 4K to the end of the file read
back what their clusters held before.

Map only the range being written back for a sparse file.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in a VM on 7.4-rc3 (20eef29b7c84), 4K and 64K clusters, with and
without delalloc, with the free space filled with a known pattern first.
The numbers in both changelogs are from 7.4-rc3 without the series.

For a sparse file, writeback now calls ntfs_iomap_begin() for each
dirty range instead of once per extent.

 fs/ntfs3/inode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 45f894d182dd..535a2b0804af 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1181,7 +1181,11 @@ static ssize_t ntfs_writeback_range(struct iomap_writepage_ctx *wpc,
 		struct ntfs_inode *ni = ntfs_i(inode);
 		struct ntfs_sb_info *sbi = ntfs_sb(inode->i_sb);
 		loff_t i_size_up = ntfs_up_cluster(sbi, inode->i_size);
-		loff_t len_max = i_size_up - offset;
+		/*
+		 * Map up to EOF in one go, except across the holes of a sparse
+		 * file: iomap_begin() allocates what it maps there.
+		 */
+		loff_t len_max = is_sparsed(ni) ? len : i_size_up - offset;
 
 		err = ni->file.run_da.count ? ni_allocate_da_blocks(ni) : 0;
 

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.43.0

