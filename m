Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262134;
	b=P1Nzv97QO3V4ZuE3DxLp9cT9UbIEVHBAhPAT1pIujv8j/n7yEEbjB4CA5zHXm8ee/h46
	 OqaJpS9Yg8JjVK2A308sDM+DzQpJYfR6Cu2CDY2n/mQVDRPa8IRu8m/I7bgGQ/SnrvHdN
	 NtpS5+n8XCqMXGccGHsXJ02Qn5SsJRxmTVr8yW8uaUnn/7TjKQb8XM7kOazzGxmuqyXnJ
	 1VGks65yL55znpd3AA7uisJqEFtkwWfjThK01Rd3vrhgJG2L9FUQ1jAlJYeyBrNY99xqa
	 vmhU9efCkzB96npibnDvmMphIzbfhx4uc5awT9DbVRGWW3MLc4ZDU/w5jftzuUcHvWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Transfer-Encoding:
	 MIME-Version:Content-Type;
	bh=Udl+/K1uwpei4wEZthYxSyLuxFRGO3vhDmEacUQwYcU=;
	b=2zSe8eumUs5hFxG9OdPo0dKrni2VZX1N1xd2QI7FoyhVuw0GHYVLa8jo6lxmAp1znanc
	 2oXzQ42Igu7lmCqdMBBhI89fgZyM+w+5V1XapvKD17LUrSSi+Ebvx2ecfU7Hn+ebQjsIE
	 CWU3rYVQmn0Q1lXyhA6TfznUAjTZ5ZQyfAkz7W7tmIDSHfVuqFr9WZS0g7B4bqQFuXNOr
	 4H9d1OlphZVMBdCF+4Hn70yZiE1ic3gGJkk8MecoMACVRiyKziVdna426BqxrZgNDesTK
	 yBmCnUIK64ZGySV2v0shgWHY8hLXh7Mzg7AVtD45jUDeHzMpYFEM7kZrxO+uDF0ZkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mvD+78Yu;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B923B606A331
	for <ntfs3@lists.linux.dev>; Sat, 21 Nov 2026 11:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B923B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mvD+78Yu
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38431138772so2282805eec.1
        for <ntfs3@lists.linux.dev>; Sat, 21 Nov 2026 03:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262133; x=1795866933; darn=lists.linux.dev;
        h=content-type:mime-version:content-transfer-encoding:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Udl+/K1uwpei4wEZthYxSyLuxFRGO3vhDmEacUQwYcU=;
        b=mvD+78Yuts7vSGRziKCgotE2VWpsANG6M+yEp6NQBLkQpyUUrrTqdhZvaYjW0OqZk2
         uNQmXCWgyt+7axM6wqHk4I9CXLhOXQE/+SW5CXsDLNfQSqjjRzPfsINr6SlSWRnl6C8a
         k1vRE2G2YXIyl0GjtIKCY3FH4yL8vCJsozkE8jmOla5d9/rNodYG3GMwwR4HmTtGkk25
         lExc4QCaNhZdplOfAsIbA6nfQtgOFH0Il1pQECgFYOxN2Ni3yKNc+awGPElUL1DUXPWr
         TYtyHjvQgViWAirqXQtaBsZ5ET5ZNVgcI3ZV0ApAhpACCnE4FuFCwDx2AWll1+aEmb6C
         IcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262133; x=1795866933;
        h=content-type:mime-version:content-transfer-encoding:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Udl+/K1uwpei4wEZthYxSyLuxFRGO3vhDmEacUQwYcU=;
        b=jh9kaDSAjxAC8sundCHUcXlNkaiHeTF6sDsliZ+fcMRknRmEMQWIbbRpUBl6L1818t
         CJhMhf1JCwEGWBKfPM+E/K0H6p3aVfaKmPBKF7bZN2gTS76oZ/X7a/lpjfx+Lk18NutD
         GILrTodZC+MkkA+NOToWSe6ZaRMtmIL2ytnR1cMJp90gYROvtyrI1KkW7Bh7ss8Gsaas
         y/V98edvlLRf2hErplN3SkXNiD0bZ+h+NPyVGBvJE21K6ImaicTZ2lv/5ifveUo2R6vm
         IGOzb+Zeyg5dyUGMUv8vT9sqoCFPVMyNfXb7NrPB1NP0MLWRNRaG4tOPtpl66hig45Z8
         yMGg==
X-Gm-Message-State: APuU4Z/93JSWYnvpPW7Bfxi1+42gM/uhBfkUTtGn/c3x6dfVA3ooaII3
	k8Qnx/1B/ynI+QJiAm1SPcfuMXt3Bczy2NT1yQEHZVxsEbg48evwN80oJkMejafS1p8=
X-Gm-Gg: AZFdTZeMiSyzCMtbV/dwWMIxLfDCywPZIkdFfZ+fYfDnXDlm6uvJbWnhIGLRytj4VEq
	4YuPNgA5PymdMRS7TulU3cMiuPG/cha/bhoMhK83OOmVnS+rIXmUjUxtrpccTB0eOcAw5cBNwfQ
	e6p3Vb09e/TQg/VK4LrgYsdbH9T7rGVYnqehbYUe7AL5NtS/XT2SiCHmp+5vW+FH3luI4AOBJFa
	wQTp1QG36ar7cTRQpZtBrX/tghMoORwAMrxLfdhnhpT9vSr7JXE7jt4/+vyEDAhjcXrMbSvMnhY
	oqAJyCx0ArsmVi7Rs8CddRDYuLOMVVUL+CjNL1dYcVF03OvzGxjoIWCz1ss4JnUIgrJLqrJH8TZ
	gp4gNmUDsqEfs6vj4m/BYEAw/kdZ+IrlcuTGkc0m3yNCa2yiwk6r/xtd+WMn24TmOrY5nI7p1v2
	2hXhhLS7HPP+sTrUT7T33N66cefkX+Sgl3Xc6LEqnkYkFQ+1hFkQLviIzVyGpU+vkymfef4WFd9
	jwUFGG2YOwppeHoM2Yf87BukBJc/xDysJn7ES9HqFLo2E8gSbd4zV9/NJ62uNnksnl+FImynN7G
	1PKB4oGKp0gTpCV82JZwHnYHy1qlhgPxuiepxae4eqT5VAvYV9w=
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3856fe5971amr6534175eec.13.1795262132618;
        Sat, 21 Nov 2026 03:55:32 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:10d7:e30e:302e:83a2:5a33:afcc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm22261925eec.4.2026.11.21.03.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:55:32 -0800 (PST)
Message-ID: <6b0186b4.6dbf942f.174087.451e@mx.google.com>
Date: Sat, 21 Nov 2026 03:55:32 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, gregkh@linuxfoundation.org
Subject:
 [PATCH v2] ntfs3: fix out-of-bounds write in do_action() bitmap operations
In-Reply-To: <2026112159-sampling-unmade-c123@gregkh>
References: <2026112159-sampling-unmade-c123@gregkh>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"

In do_action(), when replaying log records for ATTR_ALLOC attributes,
the buffer is allocated based on bytes_per_index (typically 4096 bytes,
kmalloc-4k) but bitmap operation bounds checking uses lco -- a larger
value derived from lcns_follow << cluster_bits (typically 8192).

This allows SetBitsInNonresidentBitMap and ClearBitsInNonresidentBitMap
opcodes to write past the allocated buffer into the adjacent slab object
when processing crafted NTFS images with malicious $LogFile records.

The bounds check compares against lco (the full LCN extent size) but
should compare against the actual buffer capacity. For ATTR_ALLOC, the
buffer is only bytes_per_index bytes, allocated here:

  if (attr->type =3D=3D ATTR_ALLOC) {
      t32 =3D le32_to_cpu(oe->bytes_per_index);
      if (bytes < t32)
          bytes =3D t32;
  }
  buffer_le =3D kmalloc(bytes, GFP_NOFS);

But the bounds check uses the larger lco:

  if (cbo + (off + 7) / 8 > lco || ...)

With bytes_per_index=3D4096 and lco=3D8192, any bitmap_off >=3D 32768
(byte offset 4096) passes the lco check but writes past the buffer.

Fix this by computing the bounds limit as the minimum of the buffer
extent (cbo + bytes_per_index) and the LCN extent (lco). This ensures
bitmap operations cannot exceed either the allocated buffer or the
on-disk extent, and also prevents a crafted bytes_per_index larger
than lco from weakening the existing check.

Found by code audit and confirmed with a crafted NTFS image that
triggers the OOB write on mount.

Cc: stable@vger.kernel.org
Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Tanuj Sharma <ertanuj96@gmail.com>
---
 fs/ntfs3/fslog.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 1879d04e3cd05..85590f56587c2 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3751,10 +3751,16 @@ static int do_action(struct ntfs_log *log, struct OPE=
N_ATTR_ENRTY *oe,
 		off =3D le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits =3D le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
=20
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		{
+		u64 bmp_limit =3D attr->type =3D=3D ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit) {
 			goto dirty_vol;
 		}
+		}
=20
 		ntfs_bitmap_set_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty =3D true;
@@ -3764,10 +3770,16 @@ static int do_action(struct ntfs_log *log, struct OPE=
N_ATTR_ENRTY *oe,
 		off =3D le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits =3D le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
=20
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		{
+		u64 bmp_limit =3D attr->type =3D=3D ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit) {
 			goto dirty_vol;
 		}
+		}
=20
 		ntfs_bitmap_clear_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty =3D true;
--=20
2.43.0

