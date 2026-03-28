Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED7119E819
	for <ntfs3@lists.linux.dev>; Sat, 28 Mar 2026 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774714685; cv=none; b=HGQoGKpx2rQc2B5tYajNz+OFtn1OqU9kqJSthihyeMi6g55LJoSg/MVhNOzP+rjaJLkf/k3evOivTEbu+q4EorCQkMwlEHqLPleW44SHSeI42RxHFNUmTPh+uzJiI4/suWc207IkVUGymUKIckfR1zzSOPzbV/9jba3zBA2/OTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774714685; c=relaxed/simple;
	bh=5BL932Zh2vm98BBiIO2Rlj+2dxSJnrQPUAH++zgp2/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/de4FRGIkjx6oZnFY5Q21dnC2fjOweTS3AIrOXjuGj0DRNGcLnSVqYrL70IgxWvhPqn3pqqZE978t07joAStoosjxseo0Hkvks/zh59V8+O6JaDaNnrAaK7nLzekeRYMLYhq/QKp7ADCwZ3IMLvoZDmyiZdNmiyOAm8gGAaWvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwZOAHox; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwZOAHox"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so3709576a12.1
        for <ntfs3@lists.linux.dev>; Sat, 28 Mar 2026 09:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774714682; x=1775319482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OJmNZZAHzKtCtuGtuf9MesXbqfb4cueg7/dAvpH6/0=;
        b=NwZOAHoxyww1cd2KDNeJJhw/skgygrrhnA1MU9vyoac0adxqU/COtqF0Vbo7Gcy8Xv
         DnlGPsiN9QLkWynnK8Yt1ePQK6nIQXX9Avq9jVmjC85JVYgf6APgdK8P+SMQLTBxYWZI
         N8SBXZUZAxbbQ/Hu7Q9Tw2VTPxiwOJJ7SZ1xJVYwCXiBq1QMq7NliYyW3grd4+1/vOMd
         sdkpg9WkKU5V6Dgp3uGtoH65K3GLDlGItlAODTEl11SEFHxX17O9Ic2KdQW7GKRP6/mW
         x7fhEUKm+RHoz9vGCaD4zhUddyyPzcmcNmnGCCraP2qBwICun0yK3XGCAJiWzc8oCyJy
         QM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774714682; x=1775319482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OJmNZZAHzKtCtuGtuf9MesXbqfb4cueg7/dAvpH6/0=;
        b=QOZRn+my5zbn36N3289geM4hSY0LuHxQB9CT7V2BG+3ZHlL7HtJ7HjfKZrZFnUO0nG
         FmcFI8c0B3TXtJ66HxN8oc+Gc5ybdHhC+1MEExAMKng+jN4Bp8ZfXDtcLjPd6lqB4yIY
         cUqDEzm+P5DdgiJsirmeEO4Z7RBSjLfmJN3iBQei3BmKz3VnAQvxCWO6wmhpM0xGdAWD
         3RAtEBuAuYiVabbJNqgm91uA2M5hxgRc6oNaTFB+g952qf29nK7q6xhJjM3bMBoygf2p
         YG3J5oCg6vVfaPteBzpdLyVuH35CCwxmKb/Ang+C3grf7JkwXDYO9mxJd8m/9yfj/iXB
         BzGw==
X-Gm-Message-State: AOJu0YxALbvxcI7+aAeyPHm4nda3uH1bhcy6JwP//1Jhj1zaXhkNma2f
	1UnG9uBji7vo7xFqJ1RumXAjHV9UDJ2e1fWIODdGqI21QRObP9k3IVPcQL7ChPdf/FeFi3Xb
X-Gm-Gg: ATEYQzw5Uswg4h06FoXwnlqt2SWqYaFlXqITrMj4lVgy14xK2JQsieIAX2d6xZiT7zH
	P75zC468DgpdsB9sCZr8XgDZVjxEmiRnP3KeVH8Y8xpX/yc2xP4vUFtzg6FJ0m33bqIXVwn5MDU
	ViAqpk8DqiHnVm6SNK076yE5SNGrosjKVu4vQd7v9UV568QjziA/b12aL3XERX5i6PETeo6RWIL
	oU+swNWcw+hdJxXmrs3UNUCADLFOjZbdrFan07zzU3WZD3hEnwcK4RHhRsSK/hWS7AFx1c4oImo
	ksPSs6dOc/uMxLhhMOnCzGDj/Ui401ORLiar4R7WzZwpxM73divotnoJTQIiSx3eDDPQyU4cL7v
	UfPIO8mb37rd7LEe7yfsE1zcsvH+5CxI8qLBCmfpE2EtTrF/RG+AXUc8E389AuA63jHWOSsOURt
	BdtXuwOshYvTiTXIE4
X-Received: by 2002:a05:6000:200c:b0:439:abcd:b314 with SMTP id ffacd0b85a97d-43b9ea34bfcmr9551110f8f.18.1774695190350;
        Sat, 28 Mar 2026 03:53:10 -0700 (PDT)
Received: from pop-os.. ([94.190.180.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm4779725f8f.11.2026.03.28.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:53:09 -0700 (PDT)
From: Ruslan Elishev <relishev@gmail.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	Ruslan Elishev <relishev@gmail.com>
Subject: [PATCH] ntfs3: fix mount failure on volumes with fragmented MFT bitmap
Date: Sat, 28 Mar 2026 12:53:08 +0200
Message-ID: <20260328105308.786150-1-relishev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the $MFT's $BITMAP attribute is fragmented across multiple MFT
records (base record + extent records), ntfs_fill_super() fails with
-ENOENT during wnd_init() because the MFT bitmap's run list only
contains runs from the base MFT record.

The issue is that wnd_init() (which calls wnd_rescan()) is invoked
before ni_load_all_mi(), so the extent MFT records containing
additional $BITMAP runs have not been loaded yet. When wnd_rescan()
tries to look up a VCN beyond the base record's runs, run_lookup_entry()
fails and returns -ENOENT.

This affects NTFS volumes with a large or heavily fragmented MFT, which
is common on long-used Windows systems where the MFT bitmap's run list
doesn't fit in the base MFT record and spills into extent records.

Fix this by:
1. Moving ni_load_all_mi() before wnd_init() so all extent records
   are available.
2. After ni_load_all_mi(), iterating through the attribute list to
   find any $BITMAP extent attributes and unpacking their runs into
   sbi->mft.bitmap.run before wnd_init() is called.

Tested on a 664GB NTFS volume with 86 MFT bitmap runs spanning
records 0 (VCN 0-105) and 17 (VCN 106-165). Before the fix, mount
fails with -ENOENT. After the fix, mount succeeds and all read/write
operations work correctly. Stress-tested with 8 test categories
(large file integrity, 10K small files, copy, move, delete/recreate
cycles, concurrent writes, deep directories, overwrite persistence).

Signed-off-by: Ruslan Elishev <relishev@gmail.com>
---
 fs/ntfs3/super.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index abcdef..123456 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1364,16 +1364,43 @@
 	tt = inode->i_size >> sbi->record_bits;
 	sbi->mft.next_free = MFT_REC_USER;

-	err = wnd_init(&sbi->mft.bitmap, sb, tt);
-	if (err)
-		goto put_inode_out;
-
 	err = ni_load_all_mi(ni);
 	if (err) {
 		ntfs_err(sb, "Failed to load $MFT's subrecords (%d).", err);
 		goto put_inode_out;
 	}

+	/* Merge MFT bitmap runs from extent records loaded by ni_load_all_mi. */
+	{
+		struct ATTRIB *a = NULL;
+		struct ATTR_LIST_ENTRY *le = NULL;
+
+		while ((a = ni_enum_attr_ex(ni, a, &le, NULL))) {
+			CLST svcn, evcn;
+			u16 roff;
+
+			if (a->type != ATTR_BITMAP || !a->non_res)
+				continue;
+
+			svcn = le64_to_cpu(a->nres.svcn);
+			if (!svcn)
+				continue; /* Base record runs already loaded. */
+
+			evcn = le64_to_cpu(a->nres.evcn);
+			roff = le16_to_cpu(a->nres.run_off);
+
+			err = run_unpack_ex(&sbi->mft.bitmap.run, sbi,
+					    MFT_REC_MFT, svcn, evcn, svcn,
+					    Add2Ptr(a, roff),
+					    le32_to_cpu(a->size) - roff);
+			if (err < 0) {
+				ntfs_err(sb, "Failed to unpack $MFT bitmap extent (%d).", err);
+				goto put_inode_out;
+			}
+			err = 0;
+		}
+	}
+
+	err = wnd_init(&sbi->mft.bitmap, sb, tt);
+	if (err)
+		goto put_inode_out;
+
 	sbi->mft.ni = ni;

 	/* Load $Bitmap. */
--
2.43.0
