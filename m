Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0921246781
	for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862841; cv=none; b=sW2KIzrvyE2MkPH4GiAkhNIbxuq1cTiaDd4BxKQAxMF/wcuJEjI3YQde/y49wgpQqNDRKo2uSoSxsJ8/QLX7OoTanRnT5JZxNzCYHNP7xef6yAh7ivMUuByt24bf2HA+xL4LXB1cQB8BzwiqstZ8qwhF7egmQo5NYPx9kH18eDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862841; c=relaxed/simple;
	bh=3FlUiIkq8nNfO4gEt6qM3i6l+lwaCE8lbOgVEylPzeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hWa945RMOhcRES4sNrdQwPqzQt7+efpg3I4HL+HnHewL1R7mtubDoQtwxavYdrJZzWop19fQ4AJtfePP47HhwQyW8hO+M7UnNJiRu7WlzF3pDcGhhIDy/UwuLmXdOSg2D/JcRzOICQSMWFP60iNmUXIAiXMKnJL6UQ3wMy5WY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlIUja+D; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlIUja+D"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8bc3ef10cc4so106259606d6.1
        for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778862839; x=1779467639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3vUVjM/dzC2z0GaCVAFpFXQRqsDU20UVZqnjmL8hhQ=;
        b=qlIUja+D0dWH/+Zfgqc1CshK0hGKqsfDYlV9eh/Goa5Eum+z9+BkV+yRt/y0VCxOnk
         2HwvaqeGWOfeRz3uOw2rx3y4NFd1i//2chma0b+DcqumBoYFvly5rIQdNJPmN95zUOU0
         qPh86+iu9MyGsku+PfbIgCXO8NWchn10MlWd2k/TEQaIQqCWLgpzxTkDEeadmBlFx5m2
         8PeN4hbmCujSQFLQqaY7PmdyAbZJbdKpAQZe/NvZ5v1x5wwRiOBTfz/WqfZmJr5ebus4
         sfF5/tfBrFdcXyfa6WWspyHWEli9fYujbvSyj1Muzf/fAqABfDfUxRvz1+JWNPMNBZYU
         eFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862839; x=1779467639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3vUVjM/dzC2z0GaCVAFpFXQRqsDU20UVZqnjmL8hhQ=;
        b=ZJNn+q2jgVMgKGLk5qB/ivwNc1haBWfDy12XTyl3C+FDe2/KrCmdrI5guSCKzar374
         YPBzLYpCUCi1QXL0aVSsdrLSZ502H/Osio9WZYRBtzthCraGwJH9nPCWz5lsX69YE8XS
         cI7qR0mf5RDxaSeMX07l7TdVN8vVKbtFUwlZTGtlX0g8AqVZ8TY4DXYbeqQQXMQLKJCE
         1govR+t7YWwJlLI0Pvo4+64Q3VGzWpJSMLLLVEqC+QMlhFXG0f1SnNn7b3nu/MGLGymX
         mj73a76/vp/hh6nzB/YrCiZzL6LOIe8qk1FjJFTeYvq9LjJhydR52DABpDQe8nb9HHVH
         Z3kQ==
X-Gm-Message-State: AOJu0YyfdUxYGXcJOZJnAAj1o/b5NnXUdySpLFVXhIeujOk6mb4Z0gkm
	4Mi4dNStLEFqPypWGk/MxOttKzn7L4ShYA+ECtVy/E3+zuX3TC5wBnpn
X-Gm-Gg: Acq92OHyL9oL0H/tcCGVJtde4+Kp7clnlefmhrgPxzQ7Md2jX7dRYJEWx1CK2e/oUi7
	RsEe3BydYvKxlsGV93ZlzdkpMF3qpfW+dnV7TwrpZX0YcZ271gMEa0iTXStjPINKvcqpwOq+0jM
	8udUTQReKFn/eXEQq2m1wztsSxXKq/73UZR+4gPSA7/JacTaIOq24uYB9ON2oF9H5Qz6E3NTsTG
	759YwkmvGRm0QZV9Zn3YrYw91klJuxLKWgkWJK4b5clBbfN4zxxTD8sLJKuEtZM1pJdGn+f2KrW
	lMUlLmeRKDP5epaidrvbedQrbnYTepuAnYB29zoaZ7JRs86PxCLULBSpPtALls4wdjf65gdzOL5
	RTYObQd8Xsv8iD3it5XlX6nHmKMncHEgGCYQxLbGSO361dEHIXlAZUduvq4B4Ii+ZwWDssxSmOe
	NF3N5iT/XskjqqhHI0AZOUk4lV3NFAJNSFV6Gsh4XF4x0+KFuAOTvTFGLzqnZxTB4uJdZWjrHyn
	Fds1A5jajDQgdy1Wo3ne+Wkx5UpfMjAXOTvLNy0DHVfab+gPxFD2w==
X-Received: by 2002:a0c:f08f:0:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8ca0f5f704fmr67820876d6.15.1778862838975;
        Fri, 15 May 2026 09:33:58 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c37bc64sm54721256d6.48.2026.05.15.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:33:58 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] fs/ntfs3: bound attr_off in UpdateResidentValue against data_off
Date: Fri, 15 May 2026 12:33:54 -0400
Message-ID: <20260515163355.1574086-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

In do_action()'s UpdateResidentValue case (fslog.c:3307),
lrh->attr_off and lrh->redo_len come from the on-disk LRH.
When they satisfy aoff + dlen < attr->res.data_off, the
assignment

	attr->res.data_size = cpu_to_le32(aoff + dlen - data_off);

underflows to ~4 GiB (e.g. 0xFFFFFFF9 when aoff=0x10, dlen=1,
data_off=0x18).  Subsequent code that reads attr->res.data_size
to walk the resident attribute payload would then read up to
4 GiB past the 1024-byte MFT record allocation.

The existing mi_enum_attr() defense in fs/ntfs3/record.c:287
catches the corrupted data_size on the next attribute walk
and fails the mount, but only on the path that walks all
attributes.  A read site that picks an attribute by name and
reads its data_size without re-validating is not covered.
Validate aoff against data_off and asize at the source.

Reproduced under UML+KASAN on mainline 8d90b09e6741 via
pr_warn-only probe: with aoff=0x10 and data_off=0x18, the
post-assignment data_size is 0xfffffff9 (mount then fails
at -22 from mi_enum_attr).

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 fs/ntfs3/fslog.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index acfa18b84401e..4977ac1f62027 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3325,6 +3325,17 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		nsize = ALIGN(nsize, 8);
 		data_off = le16_to_cpu(attr->res.data_off);
 
+		/*
+		 * aoff comes from the on-disk lrh->attr_off.  Forbid
+		 * writes that begin below the resident attribute's
+		 * data_off (which would overwrite the resident header),
+		 * and forbid aoff + dlen < data_off, which would make
+		 * the data_size assignment below underflow to ~4 GiB.
+		 */
+		if (aoff < data_off || aoff + dlen < data_off ||
+		    aoff + dlen > asize)
+			goto dirty_vol;
+
 		if (nsize < asize) {
 			memmove(Add2Ptr(attr, aoff), data, dlen);
 			data = NULL; // To skip below memmove().
-- 
2.53.0

