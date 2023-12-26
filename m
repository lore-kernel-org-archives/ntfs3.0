Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE94D109
	for <ntfs3@lists.linux.dev>; Tue, 26 Dec 2023 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeETJAsc"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bba50cd318so1614470b6e.0
        for <ntfs3@lists.linux.dev>; Tue, 26 Dec 2023 00:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703580808; x=1704185608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jn4iVudUfGWwocGEENajE7FASNfvXCdRZiNgIIgsoiE=;
        b=QeETJAsc3pp0KVJVllLjV5gebJ2dA4dQTdz7BvvhV+2oGIyufvB51HDP7DA6eDgOrr
         7RIJI1m7ceWXoQlsH9mAGLhiLDDHOfzrZuDhoCx/JZBlaAunlzNE8yr3jPUF73NRvTlF
         peaDZskvveKfKXA+FevUBBOb8Lj2NIxwOHH+kZdRLY4+8+8al5g77GCV0BMFY/dO0U8A
         ySexyEJP4iNlbTiT3FXWU/0GHk25WJ4OTN/eBQjVUGnV6EtkmOU+AG/EFYOYcGxIIFp2
         4NLVpSZ+UEomjnQ6GUsHbOQb9c4KeRVK4XGT2UYliIeBg5UOR7MCrj+eRKLTbLURw5jl
         UgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703580808; x=1704185608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jn4iVudUfGWwocGEENajE7FASNfvXCdRZiNgIIgsoiE=;
        b=I3+q0nvwvnJmq2/dqWG6Xh1rNvqlaBH0IEhmQyj8lhDBgGm2Z1z5SbchvUosljIRwj
         jwlwZilZUJ2JUl+aJuQYlnxnVf+Idb1lEofY+kvl/pCTswvBRD5vtAdL4sY37o89qVgs
         I+osLDK+QcDmU/ZVkm6PEiNIuAmGXBpBlayMQ0n9q6BNM60gF4FK0uvfhQCwpKFjRQg2
         nWcNfjT2YfZAF41+W28WrxpyhRxnMhoqZMjapVjSX1zc/o6VsKir/uRJvES+akSIE69X
         NkcQ65UewEWxmgZZOAaOfjNFLf2Jz/7e3QaDvIO8Ght49WfhEkdohoTquyDfkIcv3WpI
         pY2g==
X-Gm-Message-State: AOJu0YxsZsu2MRaIfk8KNVVTJPAFr4p29PTd60HaB+VA9p917PYNciOD
	+V9PmT4OwGJYdZrt1z1WiqY=
X-Google-Smtp-Source: AGHT+IGh6rpiBownpN1lkmpD2ouX5CXUhRnZ6O4r+qB409O7lMyguRMsAyL+GYTut6KDVZYyCP9Cvw==
X-Received: by 2002:a05:6808:399b:b0:3bb:bf35:f82f with SMTP id gq27-20020a056808399b00b003bbbf35f82fmr92448oib.104.1703580808578;
        Tue, 26 Dec 2023 00:53:28 -0800 (PST)
Received: from ism-manjaro.realtek.com.tw (125-227-180-151.hinet-ip.hinet.net. [125.227.180.151])
        by smtp.gmail.com with ESMTPSA id a23-20020aa78657000000b006d9b8e1971dsm3174349pfo.191.2023.12.26.00.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 00:53:27 -0800 (PST)
From: Ism Hong <ism.hong@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ism Hong <ism.hong@gmail.com>
Subject: [PATCH] fs/ntfs3: use non-movable memory for ntfs3 MFT buffer cache
Date: Tue, 26 Dec 2023 16:51:41 +0800
Message-Id: <20231226085141.2830875-1-ism.hong@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the buffer cache for ntfs3 metadata is not released until the file
system is unmounted, allocating from the movable zone may result in cma
allocation failures. This is due to the page still being used by ntfs3,
leading to migration failures.

To address this, this commit use sb_bread_umovable() instead of
sb_bread(). This change prevents allocation from the movable zone,
ensuring compatibility with scenarios where the buffer head is not
released until unmount. This patch is inspired by commit
a8ac900b8163("ext4: use non-movable memory for the ext4 superblock").

The issue is found when playing video files stored in NTFS on the
Android TV platform. During this process, the media parser reads the
video file, causing ntfs3 to allocate buffer cache from the CMA area.
Subsequently, the hardware decoder attempts to allocate memory from the
same CMA area. However, the page is still in use by ntfs3, resulting in
a migrate failure in alloc_contig_range().

The pinned page and allocating stacktrace reported by page owner shows
below:

page:ffffffff00b68880 refcount:3 mapcount:0 mapping:ffffff80046aa828
        index:0xc0040 pfn:0x20fa4
    aops:def_blk_aops ino:0
    flags: 0x2020(active|private)
    page dumped because: migration failure
    page last allocated via order 0, migratetype Movable,
        gfp_mask 0x108c48
        (GFP_NOFS|__GFP_NOFAIL|__GFP_HARDWALL|__GFP_MOVABLE),
    page_owner tracks the page as allocated
     prep_new_page
     get_page_from_freelist
     __alloc_pages_nodemask
     pagecache_get_page
     __getblk_gfp
     __bread_gfp
     ntfs_read_run_nb
     ntfs_read_bh
     mi_read
     ntfs_iget5
     dir_search_u
     ntfs_lookup
     __lookup_slow
     lookup_slow
     walk_component
     path_lookupat

Signed-off-by: Ism Hong <ism.hong@gmail.com>
---
 fs/ntfs3/ntfs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index abbc7182554a..2b54ae94440f 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -1035,7 +1035,7 @@ static inline u64 bytes_to_block(const struct super_block *sb, u64 size)
 static inline struct buffer_head *ntfs_bread(struct super_block *sb,
 					     sector_t block)
 {
-	struct buffer_head *bh = sb_bread(sb, block);
+	struct buffer_head *bh = sb_bread_unmovable(sb, block);

 	if (bh)
 		return bh;

base-commit: 4cdfb6e7bc9c80142d33bf1d4653a73fa678ba56
--
2.37.2

