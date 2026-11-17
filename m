Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794928761;
	b=stK6pCJ2FMnsnAiEorZ04vDdS7gwPob+PVFCnsupUdX8SiA/UFlK9fcyRrJKTc2fupR7
	 3nq1lF/mbGkEUsaPrJtpu+L6bddnei4GBMeJoiMIoIrBzOVDIosqYsQiWrgmotT9/8T6R
	 qJMEXzUiiYstxaUaSpG/I0P2uQypmD0IzGZQOAg5UZX4HROthXLNYnU0KXJP1n4zHxI2h
	 7qDHJ+xIoVe57+ErK7no/wxdutsdMOxe/O1pYKO4b4cWMLTT3+vWuKF6NeX3n5+c76rY9
	 UOVFrbZcsu3LT6UtHef2o0/TGTp1mH5mZSWjeTMad95YXH2yaq+U9jpA46FkYlIJidQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=i1opcLATHYSZbKrehl/jImCbKegTnyl1wL00MhA2upI=;
	b=t++odNfg651B5k0JTqMgqL24G7c5qebXG8lCwUT6U268yJVh7w/1uKktoewyuWBgfjOn
	 077FhluNw7FXz1nmutbUFGZDzvc2vMqWqp0eXShcb5iMZnncgUalMJYFBjGVZl5V+dPqL
	 UiIi2F2h72fKdcmM4vsnpmA2nNpMHer/7Znc/uqFc1XfLNst6iOXtXNh+eG4A58844z6h
	 0DeIrqotodkxaRHet0ZS6zVa7u4l3FIAuq42kzSNmhU7rKgD3O2WqFfd29za3tvKkAOY1
	 j71SPQSECk34qwsQBdIHFgD2gNjf3fijTsdoLK7M2zbcBsp4HB1dwKRHO/GS3T0xsVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+zRpFwh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6456D606A31C
	for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 15:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6456D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+zRpFwh
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5365f9a04c5so76131491cf.1
        for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 07:19:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794928759; cv=none;
        d=google.com; s=arc-20260327;
        b=q/LuNAL3VdlySUch6O/BXWgQ4ZuHFkHqA0mlI77+EP7l1orN6dDBjs8TJrY9lZAYS2
         ApKfwR4BtsIszz8Jz72GDOS2EB3EP9kUtgZMzMxudt3eadXIkKkpwKXt+Z0qXeNLo8bj
         d/Aji2h3St6+CzrYYohUyXbhqtii4wgXR6eptitWPKS+5rRO6rP4dFrQQRyWcjo6rS4y
         GZ2ynJEQN+4Vu8ZaK3K57v0GuCAkCaLFnjygow+o9R3FS6ZrkZ6gG+bILlRWiEgW82qE
         ysmxUUFIJCLs7iwmmh6BBZBuDRrjQVgeeikr86wo5CbLISaw86UcOlvVvmhz6opAp8mT
         yJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=i1opcLATHYSZbKrehl/jImCbKegTnyl1wL00MhA2upI=;
        fh=IIV28/3DSHNNQHPrnGGJjPRJY33SOTSd0sQCUmfhrKA=;
        b=s9MPbE1G4yCkzsdMuX1tL/VjMAcWu7yBbA/NXZYZ1kxtVBGJ8wSd+Zh/jlA8UVk2jU
         2M9cnY/ndOm6Qesbz/JFCzhPkltimm7GN8IYixhDbSLpDYiejOFGBz6G+WvP5m9CIi11
         1d3YYdq5FuhUFqsKN9FlB4QkHr9KCZn0bEXYGCyAf+lBWjYIEsa/1S668NYEJXCulZxi
         pgTVeVRMvRQ67nIaZRGCFGxjOVfTw+1PHYhwAmZsDKnpvTx0RPjK5klPDiFCKKBwjKMR
         i7dljy0Wrr6FLplcTRVJGydSZhRdTzJFPI5q/KepIgtkdh26sBo2o+3rTiku7rHoMmwx
         ZUTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794928759; x=1795533559; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1opcLATHYSZbKrehl/jImCbKegTnyl1wL00MhA2upI=;
        b=X+zRpFwh5IO+6FOiDNSYwxrXQ7fhcXPH/xMKv7VQlckGqCzMehHtWJdfiwgcqhlil1
         LyYlvp56mgj+HDi3s31CfYzMke3/W3FvDvyx89Z1FbjC4sPAfZnrqBNgqEWbGMnr6Wlr
         f8wsCM1iMWF86JAzRFm4gncCetPkBQDMRvOX8hOfgb/Dp/CvOlN+ZOSZUXZw/CVLbgiL
         +xxA9lxv/mCGCacgon6dw7G8+7zjBnU9KBXx2bG3RyNpzq7Qv6GOTeuoetugl5v5LBM4
         ubljTg2JWMxjg+BXKPzEHtP2XJjc5TTKSWPEkm8qinjyAqdfPURJPk+tMDCqQ0ecHboB
         0pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928759; x=1795533559;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i1opcLATHYSZbKrehl/jImCbKegTnyl1wL00MhA2upI=;
        b=u/5/weJiWeRau6CxRv/HmNGx3/K1FSx9z64HTLD+JgSs6UdfkPKWEmEoeVqqRRtyuZ
         2jXBkuxIZI3kySeUsjuHMk1Vd/Oggn58fNFOEIA78+qBNYAKqcKKhHc9gdyTEZTMst+H
         YCaVCjVXyd2X8G5Va0GYvO1hP/cfPYRViEwkiaGV0cFESIyXM1ImLbzjIwmimGV0+9T9
         tVx75UuwsIkv1z+uu9/bWW9gY5NfJMDLyFEL0iOdcaV8kgd/R/Pga/68YTlIU5sC8xAF
         sJ0n0XUzxzoS53NGSKPZf2mF3iFxBddS79NJV7pGrRuT7jJL3JvNwzpo+O9KrOmZk53z
         kUZA==
X-Gm-Message-State: APuU4Z9GO/pqhgaxaHzcZkoTE7JDMVs7VQ0App0ihMTsRhgZG1k7eQNB
	4sWKESs231Uxd9ZEV2vTWUFLuVeyD1lwheZqQDqGAE0QlgOWsZ/NBDDfuK/IBqipHi1/8lvjBy5
	biS3k7gzOWVTQBW7ZkA2QC2Ed6Vz0oWUVcBU3
X-Gm-Gg: AYBFou3vHdZaFy4ifHJc8DuE82pRFXaoOztx1kCM/NcQM2qWScjnWe9qojRovfMLuF3
	Vd9cWTLdA8ynjrBUMQwq+Eu22CHWX2T+D/Rboa0YiszRQqgIH1nUekFvGepBVruqxoKM+DQgYXJ
	HpVzyzxHDFA7LrbW2ssw8NRr3adJVi3REm0iZpEUcPoaQY23OmxPLU4mjlwiVzB0yXekxf1p49A
	sBevGJOvu/b+fJa228tYv8auVosndC1biZ85rfUkovT7U+NAhmXZsSOtRx8HvxY+s9cJbq0hfLe
	XvZkFYw8kVQSn2JHdoh6kTjytJFhLKmEPJpHGYDbsk0dKnAtneVwHDzI4vAY+rsgGEhJM6IsxY3
	ULq2Vlow8Y0sBeYLIpakSoafga42TxGnZ8r4uwSR624YsAUttXZZ9H9eiZA7DeRwoipn8e12PUE
	MPDvY7ga9tcVxCdxSAgH7XUA==
X-Received: by 2002:a05:622a:1b86:b0:536:6013:bea6 with SMTP id
 d75a77b69052e-55ac4890974mr233444481cf.2.1794928759121; Tue, 17 Nov 2026
 07:19:19 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Jonathan Pitre <jakeld@gmail.com>
Date: Tue, 17 Nov 2026 22:19:06 +0700
X-Gm-Features: Aa3M54pCNXWC4nGUnYZ9mUgVgL8BS47JjAVrHPkj77CyV1a8GCoGTi9EPWWJqPY
Message-ID: <CADjMKxV2F-vgD6kVoo58j83p9Cc-xn1U_L6T7V5Y+FNNHaGUNQ@mail.gmail.com>
Subject: ntfs3: valid $BadClus rejected when the sector count is not a cluster multiple
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

ntfs3 refuses a healthy volume that Windows and the in-tree ntfs driver
both mount. Kernel 7.2.15, CONFIG_NTFS3_64BIT_CLUSTER=n:

  ntfs3: ino=8, mi_enum_attr
  ntfs3: Mark volume as dirty due to NTFS errors
  ntfs3: Failed to load $BadClus (-22)

Volume (BitLocker, opened with cryptsetup):

  bytes per sector     512
  sectors per cluster  128 (64 KiB clusters)
  sectors_per_volume   7337721855  (one sector short of a cluster multiple)

  ntfs3 volume.size    3756913589760
  ntfs3 nbits          57325951     (volume.size >> cluster_bits)

$BadClus:$Bad, MFT record 8, non-resident, not sparse:

  svcn 0, evcn 57325951
  alloc_size 3756913590272  (57325952 clusters, 512 bytes over volume.size)

Windows sizes $Bad to the volume rounded up to a whole cluster, so the
last VCN covers the partial cluster at the end. Two checks in
mi_enum_attr() treat that as corruption:

  c4a8ba334262 ("fs/ntfs3: Add rough attr alloc_size check")
    alloc_size > sbi->volume.size

  the evcn check applied for 7.3 ("reject out-of-range evcn in
  mi_enum_attr()", this thread)
    evcn >= sbi->used.bitmap.nbits   (57325951 >= 57325951)

On 7.2.15 the first one fires; once the second lands it would reject the
volume too. chkdsk /f reports nothing, and because ntfs3 marks the
volume dirty itself, the error comes back on every mount.

A fix could compare against the cluster-rounded volume size in both
places, e.g. ntfs_up_cluster(sbi, sbi->volume.size) for alloc_size and
the matching cluster count for evcn. I have not tested a patch.

Other users have hit the same message since about 6.11, without a cause
being found:

  https://bbs.archlinux.org/viewtopic.php?id=301270
  https://forum.proxmox.com/threads/backup-file-restore-cannot-mount-windows-10-ntfs-partition.176446/

I can share the boot sector and MFT record 8 (no file data), or test a
patch.

Thanks,

-- 
Jonathan Pitre
