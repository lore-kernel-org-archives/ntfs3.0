Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4FC47AF57
	for <ntfs3@lists.linux.dev>; Mon, 11 May 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523383; cv=none; b=AFI3+HElcgp9tbaDyS6cTLP7zoEOiukaAopc9tAClI6MWjXrfsvQWcwKIvVICiBXAZoPR2xj7JJh97i0DswyweH2P81k+9gfL6z2zQsb86UiN+dYtERyNQKhftUg2i6FRu6jVQW+GS8TE7zw4y5Dh7MKayV8GRrz8S/+zE+fMJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523383; c=relaxed/simple;
	bh=/ePDKYvRy9DMjD6SCrcU3Xu8vaRvl6YIH1WPK0CW07U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fTUl6i8I2Vhuy6Xr4ujbi72kj3QOjxZ7wr26h/OYY4TOwqUEzLKqt/wZpVDOLoM9Q8p/rMJsUEcw9eiRl0kA8JXMrNvKWhj+GDrSeVYzl8hOb8ywFDb7whrUshV9KAZCnIpkD3vvjnr2bf9AurR2ecOU+KX57UkAhw5IDu0MHO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZ2/vJ1E; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZ2/vJ1E"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso44162235e9.2
        for <ntfs3@lists.linux.dev>; Mon, 11 May 2026 11:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778523380; x=1779128180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbzWIIoT+Bw+pAGkNBdxls5iXss5yHMpdPL7pkQ74Ps=;
        b=PZ2/vJ1EAHNtvLVC0uVt6b3UZQHhEszySGRNDDFIJmcgC/Em6k21rXUDAVy6A0xC/g
         dj9dxNxloj85GBWYeGNgYy4yLEjW30ygGRPhk7ZbOyGWc7jo4fS8epS1yqiDnrZXAfjN
         ++R12ziD8Gt3LFApgAr2GE4JuS3JY2KJQcsyjDcxSSFR6n+kqy/Xt1vXZTRkluklfjIV
         lo774vtJUqprZZNFtKbZ/Om6ATpP9gne5+QN8ATz0/1yI7sVOA7s5eg7s34Pe9ryftFO
         RJrN4QxHSmBdaqMSkgMszZY4QAZjxZh/SADku0iAhYxs/Ape1eNMm5X9nkBFLQafwATn
         Jl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778523380; x=1779128180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbzWIIoT+Bw+pAGkNBdxls5iXss5yHMpdPL7pkQ74Ps=;
        b=cjIDEgRoXLe4yObii6ueA61L/7ejL6jG+dB9TH9u15a5xJ0dp1+4RytuR50t/qMusu
         dh2w10lb66O64bjX6kOmBKJsO/heTXkwEcRDZUwMrgvJVF0scp46euXCXWb50NLGtC7P
         L/Jb6533vOPAPm2j2m9SALBE/Zr0zXS+3mxI5z2I4aDRK1jZ5KpWeV6+411OgL+9fMCw
         iSe17+2hoKdcM6wg2MGduKG8hks5FEIyLd5Vykz+LOztsotzKkZ7Sb99f0Qh3buTBNl3
         FsdgyT+Yd7nnbXnKWOFbR8K9bl+7FB90uqy/zV4LjtRqIBSbxcFVSYFnnHGhcLtZSk06
         VWew==
X-Gm-Message-State: AOJu0Yy7bDxhP3DUsIPfWsHbTNQlk64ZtF7C8dyYzsRZYYLpdYE+gfov
	UmxSiuPs9wBLR0xMex5DkHKpOwNIpmEUcBRsRCPDpzspEMuIit/iu31Cqrj9lJrG
X-Gm-Gg: Acq92OEkQ5NXz55CVDQiUb8aDZTlGMrrYrs/ClUKFvIk5fYRJiiaGh+LIBLguTJ1p+4
	AySccf76629gsEjJ34SpG/004f0Aip5ARwH2YQ6laRvovrmTrx5OLJVVok2EB1rn5QtorxNAGpc
	ULXdnE2GouZl4WQaagFl8pKnzvNGzuBYD8vucvBdVSrIq3ZykZW3w3B5+Cs0/cy4cJ30RQl9gGK
	k2bHRG6BLeK1RTsHOc8OsrSpwAyv4bbHNAEvFrgRKrYsWpYUmGtUjhRgodPSLoIUVhTffMr3cEH
	t59yEMWExYaVOsiqAD+FOnEgjCoX4AERupkxqOcraOctddtpMVcMOlpF+CtXEylrTs/IvyLNBm7
	sWUFvDNJcdfUJZ1oZO0guiiyMMV4lnJPQCp+BN6fP6+nICZztNXr+JGLMeLwjiWzWP07P3ULHZa
	/uJgsiOgm/HyygQKORg5LkpRt7yTk9ke7qe2HmTlRjjKVNPOYtkn6sDvkzqf46kprfDBkXSojcJ
	qy8nji2/DuhuaWsYg==
X-Received: by 2002:a05:600c:3f18:b0:48e:5990:9698 with SMTP id 5b1f17b1804b1-48e5990978bmr354079365e9.24.1778523379855;
        Mon, 11 May 2026 11:16:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:827:3b28:500:4954:471e:9dc7:7f18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db1742asm68957235e9.31.2026.05.11.11.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:16:19 -0700 (PDT)
From: Alessandro Schino <7991aleschino@gmail.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	Alessandro Schino <7991aleschino@gmail.com>
Subject: [PATCH] ntfs3: fix out-of-bounds read in ntfs_dir_emit() and hdr_find_e()
Date: Mon, 11 May 2026 20:15:15 +0200
Message-ID: <20260511181516.220-1-7991aleschino@gmail.com>
X-Mailer: git-send-email 2.41.0.windows.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bounds check in ntfs_dir_emit() compares fname->name_len (a
character count) against e->size (a byte count) without accounting
for the 2-byte-per-character UTF-16LE encoding or the ATTR_FILE_NAME
header size:

  if (fname->name_len + sizeof(struct NTFS_DE) > le16_to_cpu(e->size))

This computes: name_len + 16 > e_size

The correct check must account for the ATTR_FILE_NAME header (66 bytes
before the name) and the UTF-16LE character size (2 bytes each):

  sizeof(NTFS_DE) + offsetof(ATTR_FILE_NAME, name) +
  name_len * sizeof(short) > e_size

Which computes: 16 + 66 + name_len * 2 > e_size

The correct calculation already exists as fname_full_size() in ntfs.h
and is used in cmp_fnames(), namei.c, and fslog.c, but was not used
in the readdir path.

A crafted NTFS image with an index entry containing a small e->size
but large fname->name_len bypasses the current check, causing
ntfs_utf16_to_nls() to read past the entry boundary.

Additionally, add a key_size validation in hdr_find_e() to ensure the
declared key_size does not exceed the available entry data, preventing
comparison functions from reading past entry boundaries on the lookup
path.

Signed-off-by: Alessandro Schino <7991aleschino@gmail.com>
---
 fs/ntfs3/dir.c   | 4 +++-
 fs/ntfs3/index.c | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index d99ab086..6cd66ce0 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -305,7 +305,9 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
 	if (sbi->options->nohidden && (fname->dup.fa & FILE_ATTRIBUTE_HIDDEN))
 		return true;
 
-	if (fname->name_len + sizeof(struct NTFS_DE) > le16_to_cpu(e->size))
+	if (sizeof(struct NTFS_DE) +
+	    offsetof(struct ATTR_FILE_NAME, name) +
+	    fname->name_len * sizeof(short) > le16_to_cpu(e->size))
 		return true;
 
 	name_len = ntfs_utf16_to_nls(sbi, fname->name, fname->name_len, name,
diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 5344b29b..46dc7642 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -754,6 +754,10 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 binary_search:
 	e_key_len = le16_to_cpu(e->key_size);
 
+	/* Validate key_size fits within the entry data area. */
+	if (e_key_len > le16_to_cpu(e->size) - sizeof(struct NTFS_DE))
+		return NULL;
+
 	diff2 = (*cmp)(key, key_len, e + 1, e_key_len, ctx);
 	if (diff2 > 0) {
 		if (found) {
-- 
2.43.0

