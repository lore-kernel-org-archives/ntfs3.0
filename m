Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120B3128DF
	for <ntfs3@lists.linux.dev>; Sat, 10 Oct 2026 04:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607964; cv=none; b=kdvRzyc7s18IKVmiZe2ugVoWDcbuh24j9t+y++OFChCD103bcm1zXDDWZr1z90qAomf2YfFyPhUhQKM5WPQ+2c6sX4q87/dxm5LyAkWoj7XxwTLZyHgVDdH7qGqBO7ru3Rz+EYutFC5M36P1yAZL5BLyBfvF4FKBCrTWEqXFVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607964; c=relaxed/simple;
	bh=indP8u5ErlDBlEbDJ73E7lpccIOnRAgGO3JQCr6tKuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ALYhP4N8FTi4nSZqxWW9+j8HkDqTI9ogT+ORYFUIzhkgPbwFjqjXSIKpbPvGtaTGHgfmWZeaIZwbQQ/rObE9WnEJ+9OUtA2tV8PPVHo+88FNQytr1jrEheT2OIWUJLaT6wDq99jq34EnyLCV8cIVUeihF9aMrfF+V/xb0Oc9K4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=gKt8yG9K; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="gKt8yG9K"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53512cd2f85so4727651cf.1
        for <ntfs3@lists.linux.dev>; Fri, 09 Oct 2026 21:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791607962; x=1792212762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dcJoubrr5zFEKtQA78Ir1Mu8Xuoy77V/79B9yY3I7o=;
        b=gKt8yG9KpUtfio+9povSKrB5k6fXkzK+0aQl7Cucczb/+1g5wjzJRB1Vn91++TBEj0
         oOQKh8B8WMH/er7duZ2iRlcaAg2MH5YC7/NysIfZyKZA317ss1LOYrip5ctG2bbaDnam
         J8FQ0I+jd/Mha9A5pZ/IeSwqgbQNwn9U+TXM/iGWackrjPKLpf1ILazY2lkN+I2GxL4E
         /2aMpk/kt58tO34DrHAtfGL5qY4Wftk8SQZIUmKaZKWL1f+LBj2ITMYAH6KybJbFZ0Gj
         rEOeVZXCgW5DRM8RDs+gtqkvaVbn2i6OLvtFJsYYX6M3TkuH3Gijx0BoM3MAmSg/yC+K
         zygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791607962; x=1792212762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dcJoubrr5zFEKtQA78Ir1Mu8Xuoy77V/79B9yY3I7o=;
        b=1PcfQs5XIa3oL3HD+3Y78xMF+DU77LK8NjnGt0kTI8gDwOl2RkYkAb9idZbFffEYjl
         nz1cKagbyxbXzQ0F4dnH9osVfZ/XYPKh1NU1/3B2A/OXLkwkzDm27nLvxEMF16Www64X
         camTKsg590owOLkYcJocSbJKNvovWi3INxgsPGPky+swlE7o+ktonto1a3a5bbMS7Rah
         lhsbsNnnjxbJSuGEQKKK6NYMjynH+IZDtSTaz7Zfnjo/12nc0WCavMkwRtqf6wi2maI5
         HvGUPq0LukAa3OWRAefNc2D4IgYlnpEr9EKMVqo0NTEkJmFKQGDRvuPifGdaTZyPSmJ9
         zgvw==
X-Gm-Message-State: AFq9FYKGP4dIV/zlqkjxW2ZI+pC3jlnKlwsC8TOQF6Wr52EcOrHxLuji
	X+HOLEUY6pf7ZgpJ0vs+7HiLL2dqSH0krVwJfn/lk0PRdLyPikr+VE65kkCzL0S88say2qv+BVv
	GHSQOMw==
X-Gm-Gg: AYBFou3C0GoF/B/6lWKd9mxpeoTEfH9EIzgG6xzx+96DtHp1JuVCYw+jjE+UHaOS3Bl
	sN6PthV5D/HWMrRSEaVfDMqlqO8By3CfMRXKqazqgOu64X4LFV91yU6GezLfdbQVcC8rf2VBKH5
	ZI/gxe6jxj136uTAF34RRLO2IY2tWs8Ct7WY5LIy7DkDb1Bcqw/NFYHgfDhMKMw/qPpQ7uqlVJe
	N6VHPA3ZOWSJ+wbR5oBntfvCMrQJzXSHHed3LSvOYeaLfzoqx48UmgPwPd1qDjy7vxhdFxQkdpw
	5mekLJS9uDPrFiwDSCqCEEF0D0K87te9ssAfRP1NwNsCzeOVKUfIFDoEV8Ui7SLP2Ay78PQ1dN0
	VmxfaZiTiPR43l1jhNGxp4C5hmGCtxEi0//V8bQQ7beMJ56wcVuTpDzeWWKn5gcbll9w+vWd90F
	3NDycNtosfIPI0SWzX5oM1r3twu2tDygz/asTQQAQoxUWCzL1nTnV2bfnmUm7svVoUqC6Xda320
	JrxUCAoJd/qKxQ88fyTLA==
X-Received: by 2002:ac8:5f49:0:b0:535:1a66:d406 with SMTP id d75a77b69052e-5359fb31582mr72152881cf.29.1791607961694;
        Fri, 09 Oct 2026 21:52:41 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501750fsm36208786d6.14.2026.10.09.21.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:52:41 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: restore the file size when fallocate() fails on a sparse file
Date: Sat, 10 Oct 2026 00:52:06 -0400
Message-ID: <20261010045206.4051041-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a sparse file, ntfs_fallocate() first extends the file with
ntfs_set_size() and then allocates the clusters of the range.

However, when this allocation fails, the function returns without
putting the size back. As of now, a fallocate() that fails with ENOSPC
still leaves the file at the requested size, with a part of the range
allocated.

The issue can be reproduced on a volume mounted with the sparse option:

    truncate -s 16M img
    mkntfs -F -q img
    mount -t ntfs3 -o loop,sparse img /mnt
    dd if=/dev/zero of=/mnt/hole bs=512k count=1
    dd if=/dev/zero of=/mnt/fill bs=4k
    sync
    rm /mnt/hole
    sync
    fallocate -l 1M /mnt/f
    ls -l /mnt/f
    df -k /mnt

The fallocate command fails with "No space left on device". Before this
patch, /mnt/f is then 1048576 bytes long and the available space has
dropped from 912K to 400K. After this patch, /mnt/f is empty and the
available space is still 912K.

This patch will set the size back when the allocation fails, with the
call that FALLOC_FL_KEEP_SIZE already uses.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/ntfs3/file.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 95dfe6878860..98fb4116031b 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -673,8 +673,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
 				err = attr_data_get_block(ni, vcn, cend - vcn,
 							  &lcn, &clen, &new,
 							  true, NULL, false);
-				if (err)
+				if (err) {
+					/* Do not leave the file extended. */
+					if (new_size > i_size)
+						ntfs_set_size(inode, i_size);
 					goto out;
+				}
 			}
 		}
 
-- 
2.53.0

