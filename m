Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6093ADBA3
	for <ntfs3@lists.linux.dev>; Thu, 25 Jun 2026 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389289; cv=none; b=O14JG/y+RjzqPmQk3bv4CKmb6eE+2LV7uzyUZLEoDgV4JNp2eeOwTyvElZyGQmrV4KkVQbfC+LnT9YmySynVrGXqorpGM5vLhic4vQdsreJ4UTjRS6V98SWrvoaLC/BNmKx1+lBNHpnq5UcYkrMtPAWpGXqDDb6aoGUKihWh7q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389289; c=relaxed/simple;
	bh=w0zUKEdtA9z+ySuMLwd7k9yfIHFXCHjznEbMKap3Wyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pOK1x5NOHDr8OoKqpZjCKvX86vLnKDcssYoWqEk+EioidyRI/cgK95S+hHqTyk1QY4iM3FNon4HI3vhAjetTVBuRcd2DbNZ6ge2+YpyEEz5rcds3nYjAU7XH4o6HJNZMSieFUsCiVGzxZzz/0oOWDT2loR6PNyQ130Xow0QzAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7hWjWjG; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7hWjWjG"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30c52cc5285so3303599eec.1
        for <ntfs3@lists.linux.dev>; Thu, 25 Jun 2026 05:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782389288; x=1782994088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLyVxfuXHHwmgNqyDoQL9C552r8viSTt8tr5Kzn1SQY=;
        b=P7hWjWjGaLW2empjtVd+rbRIb6wVtsolAwvxzoNlRfnWs1+pbHmxvuHU5BBdYujvKw
         ALVi3jHNXbLU2qW//qOw2pKVTAYnj48qjsgH2Nx6daXjX66qWtxGnFf85MEjf5V5sgGb
         zWrMBc3o/oBtatOrcWh3uhB9C8gE59rKk/iFH3oiRzSkMJQ+gRZwWyxK31ilWSTtQzJl
         z7XQZcC/P0uQcSfh4vefQz92w2V4nrg43rce2j3fCEWRK4wq8TuwQWdovCqseO6eU+o3
         Mca/2HD9rpoWFuJ9epL3f93wFSJZ8+vZyaSUc2A3jVFY82RnG2Gjmt4SiWezjG0NVxL+
         /Qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389288; x=1782994088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLyVxfuXHHwmgNqyDoQL9C552r8viSTt8tr5Kzn1SQY=;
        b=MRKU2xB7/psi/tBVIu+xDj8vdZx969tg71tqz0n9dXhVnjiq/Ux6kngqzsgSlHveg2
         XE3S0X6HYjtSCxlQ+WJyWtadoQRgFw5nh71DfpHY6B5f2lFD2tH61h5P1KSRfPhKvEYI
         TK14IuFlms7oiUr/WpSbk8VIYGOWOu+TeN4in9lhCTNWvmnjYRpDjoVqZZZK0t/TO7/h
         Y8Q85qO2Pk7lEcL/VuPuhVzcVuLbey2wq5GFQ3g7LWMVC2zBeyJVqXs62vuI1aMLeLpc
         pltdBmPjaYWObhbR9xz02dPGzKHmBdg3P8d1JqwH/OwrUJKN6mp47HrrUt494TKiRkq3
         CK6A==
X-Forwarded-Encrypted: i=1; AHgh+RqZINRznj37J/ZPtvWPsHkZRp4QqbrSnwfQntmtyj3mjloVQGEeREQq2wrPhNL1aRm42xdTrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoYtdv+e5h/w2HGwupjVRdDUH1OTiGB3tq2aas6uzzUJ9cm1NI
	xDkw+LQYqP4B7TtRL1It1g3SEeZzT7HHdSi2Ttm98mcKDyjhh9YhSOSr
X-Gm-Gg: AfdE7ckeN+MITEduIbqJEYsdcpk0G40uyv3qMEUCvUAojg/RKKOjI5a599Fo9votERy
	BvUjmx71SDdSzW1c71NUgfiaJGK/zYTwn4xnS9rG7ameIq3NNYktANX5d2qiGuIcFUJKto6aigE
	koZ/GAiji+XP4Hns1TlkniYS0uZAU6fFvfoewkIztNjYookSNsQCrkRWOgmKPXwlLMZjBd18P6i
	usG+ybPI6F7amgngJoq6M1azfntJM4SKrv929Ff7Yb2qRyY/T6vnk6ufIRM8m/MqMB0M1GlaZc4
	3MomqaY/q+yj6NGt0co+SfQB/rVQ/jkJQyMWSBfXI9AoWezq46fdU8JXskby7h0mIzWeC5SDCB/
	NCUkgKEg8yln6QPbd6yY5yaY+69wLp5l0NKK/EsTPujUTZv0Y/ENnfPCVfA30R784Nt5CCGhn56
	isR+PdW3bKqUVqUeQI3ogJLgqxzNAMl0+twKc7KAsCkUV7IwYNYPqDfjGdkg==
X-Received: by 2002:a05:7300:640f:b0:30c:6a50:3805 with SMTP id 5a478bee46e88-30c85009a5amr2773354eec.28.1782389283824;
        Thu, 25 Jun 2026 05:08:03 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm9295691eec.16.2026.06.25.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:08:03 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: xmei5@asu.edu,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] ntfs3: fix out-of-bounds read in ntfs_read_mft()
Date: Thu, 25 Jun 2026 05:07:42 -0700
Message-ID: <20260625120741.1618516-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_mft() walks the attributes of an MFT record and, for each
FILE_NAME attribute, compares the resident on-disk name with the name
being looked up.  The only size check before the compare is
rsize >= SIZEOF_ATTRIBUTE_FILENAME, which covers the fixed header up to
and including name_len, but not the variable-length name that follows it.

name_len comes straight from disk and is not validated against the
resident data_size.  A crafted image can set name_len large while keeping
data_size at the header size, so ntfs_cmp_names_cpu() reads name_len
le16 characters past the end of the MFT record buffer:

  BUG: KASAN: slab-out-of-bounds in ntfs_cmp_names_cpu (fs/ntfs3/upcase.c:84)
  Read of size 2 at addr ffff888031879c00 by task a.out
   ntfs_cmp_names_cpu (fs/ntfs3/upcase.c:84)
   ntfs_iget5 (fs/ntfs3/inode.c:209)
   dir_search_u (fs/ntfs3/dir.c:265)
   ntfs_lookup (fs/ntfs3/namei.c:85)
   __lookup_slow (fs/namei.c:1915)
   lookup_slow (fs/namei.c:1932)
   path_lookupat (fs/namei.c:2278)
   vfs_statx (fs/stat.c)
   vfs_fstatat (fs/stat.c)
   __do_sys_newfstatat (fs/stat.c)

  Allocated by task:
   mi_init (fs/ntfs3/record.c)
   ntfs_iget5 (fs/ntfs3/inode.c)
   dir_search_u (fs/ntfs3/dir.c)
   ntfs_lookup (fs/ntfs3/namei.c)

Check that the name fits in the resident data before using it.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index c43101cc064d..c41c7231bb87 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -201,6 +201,11 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 
 		names += 1;
 		fname = Add2Ptr(attr, roff);
+
+		/* Make sure the full name fits in the resident data. */
+		if (rsize < fname_full_size(fname))
+			goto out;
+
 		if (fname->type == FILE_NAME_DOS)
 			goto next_attr;
 
-- 
2.43.0

