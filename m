Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ED73B27F7
	for <ntfs3@lists.linux.dev>; Tue, 18 Aug 2026 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078101; cv=none; b=btJaIvBWhCjbXWik+MD2OS/MZhfXIODsDvp7VUOrXjHmbo1qIwheWcrT9bHf7P4CFKcyx3ODAO/x34FaOB25D1qTwibw6K8Dy4qS1T7ho7FVo4kv13v9NFndLvp4cNdCE4hpw1Em1EjAbGwOpHIz4tWArYZ/g7LPpYSoh5cWgRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078101; c=relaxed/simple;
	bh=BxBF+8x9UjMh3E8ulq8bv8YVwNO01tkfCeLGtzpVrt0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oUMZrty3j/8Fp0lCOlBUx1ThGJjdwjQfgYJebsx1gy5fyajk3LXfpFwLP24HP4Vn3XNnE1f4Lp736VTkJLCAgG39HlpwTjqFXZG3NO8tdHsbLi4e5pvDkHnmDHLodzDkXXV0zXxJHghCA3S2SEbgR90ovjaA2ogVBKuGt3Hmv/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SSjpF1ZF; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SSjpF1ZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=fe33qhirgjagpips26zuc7st2q.protonmail; t=1787078089; x=1787337289;
	bh=fF63kDyzTdoN6R0ErWEKjamAUkeyxeEPuv9iE9nTwqw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SSjpF1ZF9LUVFrpP+Z1ESol26QhgEcS9Utxy/l0FiQc33h2DhlNv5hC3iMRkXz6D7
	 v+wfJlz2fxbCYxLWFKNJSRCLkgoK7VixMJgXPzIOCVa9clUISE8pMaX6M/cdYjF84j
	 mblWyFd2A5p9JOxPYkR+AAVuqXM5RDgMrWz+B3QpnPOP33KO/ltG12Xn+S9x1Ft/jH
	 NdtjXCH6I9R4g75HYBacST9pira/QJJ7J3sOTksX0otWbyzzFDZ34ytDwiP0/bzGcY
	 WX5L5dwE3WJfC+p2vd+Hh8uK2jc2sE8sP7qxCsAyoI5QyRmjJU5YDl2i129spKB5It
	 hmTQPCHMIewMg==
Date: Tue, 18 Aug 2026 18:34:47 +0000
To: almaz.alexandrovich@paragon-software.com
From: k3rn3lbr3ach3r@proton.me
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ntfs3: fix out-of-bounds access in log replay and ni_remove_name
Message-ID: <o4ztNNNkpdDLI2xt81YfrL6QXaRJyrorsj6ouTqr1_uStTBnW4siOIZeDlmIUiznHvfghwWtTK4piK6rgE23Kr6w9XwxpfiMM7THLMcfsRQ=@proton.me>
Feedback-ID: 121670605:user:proton
X-Pm-Message-ID: be47016830ab11438c700ac7c8121f7006ca6be8
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback :)


Here are the two fixes as proper patches, one per finding.

Patch 1: Adds bounds check in UpdateFileNameRoot and
UpdateFileNameAllocation to prevent 56-byte memmove from overflowing
when e->size is too small.

Patch 2: Validates fname_full_size() against the attribute's actual
res.data_size in ni_remove_name() before copying.

Both pass checkpatch with zero errors and zero warnings.

KRISH JAIN


From ffc37dbfd48020558f278a2fef6fd03dbe117339 Mon Sep 17 00:00:00 2001
From: KRISH JAIN <k3rn3lbr3ach3r@proton.me>
Date: Tue, 18 Aug 2026 23:39:59 +0530
Subject: [PATCH 1/2] ntfs3: add bounds check to prevent oob write in
 UpdateFileNameRoot

The UpdateFileNameRoot and UpdateFileNameAllocation handlers in
do_action() perform a 56-byte memmove into an index entry's embedded
ATTR_FILE_NAME structure without verifying that the entry is large
enough to contain the write. If e->size is smaller than the required
80 bytes (sizeof(NTFS_DE) + offsetof(ATTR_FILE_NAME, dup) +
sizeof(NTFS_DUP_INFO)), the memmove overflows into adjacent slab
objects in kmalloc-1024.

Add a bounds check before both memmove calls to validate that e->size
is sufficient, marking the volume dirty and aborting replay if not.

Fixes: 8d3ae59288f1 ("Linux 7.2")
Signed-off-by: KRISH JAIN <k3rn3lbr3ach3r@proton.me>
Assisted-by: Claude:Opus4.6
---
 fs/ntfs3/fslog.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index f038c799e..c32b59f4e 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3520,8 +3520,13 @@ static int do_action(struct ntfs_log *log, struct OP=
EN_ATTR_ENRTY *oe,
              }

              e =3D Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
+             if (le16_to_cpu(e->size) <
+                 sizeof(struct NTFS_DE) +
+                         offsetof(struct ATTR_FILE_NAME, dup) +
+                         sizeof(fname->dup))
+                     goto dirty_vol;
              fname =3D (struct ATTR_FILE_NAME *)(e + 1);
-             memmove(&fname->dup, data, sizeof(fname->dup)); //
+             memmove(&fname->dup, data, sizeof(fname->dup));
              mi->dirty =3D true;
              break;

@@ -3706,6 +3711,11 @@ static int do_action(struct ntfs_log *log, struct OP=
EN_ATTR_ENRTY *oe,
                      goto dirty_vol;
              }

+             if (le16_to_cpu(e->size) <
+                 sizeof(struct NTFS_DE) +
+                         offsetof(struct ATTR_FILE_NAME, dup) +
+                         sizeof(fname->dup))
+                     goto dirty_vol;
              fname =3D (struct ATTR_FILE_NAME *)(e + 1);
              memmove(&fname->dup, data, sizeof(fname->dup));

--
2.53.0


From df143212211876f87a7253b555cee28435575431 Mon Sep 17 00:00:00 2001
From: KRISH JAIN <k3rn3lbr3ach3r@proton.me>
Date: Tue, 18 Aug 2026 23:40:10 +0530
Subject: [PATCH 2/2] ntfs3: validate fname size against resident data in
 ni_remove_name

In ni_remove_name(), fname_full_size() computes the copy length from
the untrusted on-disk name_len field, which can be up to 255 (yielding
576 bytes). If name_len is larger than the attribute's actual resident
data size, the subsequent memcpy reads past the end of the attribute
buffer.

Add a check that fname_full_size() does not exceed the attribute's
res.data_size before performing the copy.

Fixes: 8d3ae59288f1 ("Linux 7.2")
Signed-off-by: KRISH JAIN <k3rn3lbr3ach3r@proton.me>
Assisted-by: Claude:Opus4.6
---
 fs/ntfs3/frecord.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 2b49bc077..42627a5f2 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2653,6 +2653,10 @@ int ni_remove_name(struct ntfs_inode *dir_ni, struct=
 ntfs_inode *ni,
      fname =3D ni_fname_type(ni, name_type, &mi, &le);
      if (fname) {
              u16 de2_key_size =3D fname_full_size(fname);
+             struct ATTRIB *attr =3D attr_from_name(fname);
+
+             if (de2_key_size > le32_to_cpu(attr->res.data_size))
+                     return -EINVAL;

              *de2 =3D Add2Ptr(de, 1024);
              (*de2)->key_size =3D cpu_to_le16(de2_key_size);
--
2.53.0

---


