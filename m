Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9B872
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 14:28:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id c8so19943806lfi.3
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xttnB3Ajhycmu6LWTFae3dkDaWAtDzx1Q0ALaha80SQ=;
        b=k0tNJEH+5cbehd7XahIbdLxg1+ZqAAFio/jIFWNXu8hLF9oUPLOmuurfy0Te245wB/
         0ptitG9KTY+nakeZyC39WDX/z/w+9Ka17Aet8rBxVfndyKEpu312WCJNdlhIJNJa+eyo
         nwQYTAtf9J5hH6n1mCNaVHIXSYsO9kIQ/CkW962cMTKGYU3ZNH+b26dY6jOafCUk7RYH
         FJy+6lbzECEq1T6ZBqiXhSpXy7TUCdybJnkgDk1HHvs09gZACmpUuq4IkIbiP1P2F8AS
         NE2oCmkamNjx9olaPlGc/YeO2OWCLW6MnNLijoi47sCysgZD/TxWgyWhevxYuCXe0nDc
         NrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xttnB3Ajhycmu6LWTFae3dkDaWAtDzx1Q0ALaha80SQ=;
        b=qgHfsLgtvfQps3fU7cySnRMNZqybZ8pGyJ/J84PKQSPyBAuh24uYk+pjif+9wKls7q
         Ujk8FxPg72Xi6ttf1BVfWttnPwJiFfb+O039a7d348rw1n6yD8ln2r4ZjEs4F3DyEFZp
         jkW57ZBd6/fuZQKdXN3MWEueYKbYLn5fA864+/5q4F3mgXTKMX67NLTwAir6vCS937by
         CAl0Qf29dLOhOv/wcrCMBySW16M12RB5X2dykFNT18/II+k496Nrqkcoc6pUcQ4qJxMo
         /dqQjjDSB+XKTpgqk2rrsy8WHEffn3QF1BHA9buRc5luGm6PFwQDPUZrw/Q9KkAgHQHS
         TCyQ==
X-Gm-Message-State: AOAM5331ZoxAMglKmsIFy+mc1p+OlTPZvgwO6yhQ6vHWwBilOj3Q13wb
	DxD5eVwpHJndh9zyn2pqFwc=
X-Google-Smtp-Source: ABdhPJzptAs/HCa4VZApPRhjl+IWbtiyuC69z7AFTzAEoIVNOfx7cErDKwsbwk2YNpfcCSqcTO8vYQ==
X-Received: by 2002:ac2:5d63:: with SMTP id h3mr12995115lft.278.1631024935941;
        Tue, 07 Sep 2021 07:28:55 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id l11sm1014251lfg.39.2021.09.07.07.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:28:55 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] fs/ntfs3: Use min/max macros instated of ternary operators
Date: Tue,  7 Sep 2021 17:28:42 +0300
Message-Id: <20210907142842.133181-5-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907142842.133181-1-kari.argillander@gmail.com>
References: <20210907142842.133181-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can make code little bit more readable by using min/max macros.

These were found with Coccinelle.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/attrib.c |  3 ++-
 fs/ntfs3/bitmap.c | 11 ++++++-----
 fs/ntfs3/fsntfs.c |  6 +++---
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 34c4cbf7e29b..89bfef9dc0c4 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -10,6 +10,7 @@
 #include <linux/buffer_head.h>
 #include <linux/fs.h>
 #include <linux/hash.h>
+#include <linux/kernel.h>
 #include <linux/nls.h>
 #include <linux/ratelimit.h>
 #include <linux/slab.h>
@@ -1966,7 +1967,7 @@ int attr_punch_hole(struct ntfs_inode *ni, u64 vbo, u64 bytes, u32 *frame_size)
 			return 0;
 
 		from = vbo;
-		to = (vbo + bytes) < data_size ? (vbo + bytes) : data_size;
+		to = min_t(u64, vbo + bytes, data_size);
 		memset(Add2Ptr(resident_data(attr_b), from), 0, to - from);
 		return 0;
 	}
diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 831501555009..c17121887e6a 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -13,6 +13,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/fs.h>
+#include <linux/kernel.h>
 #include <linux/nls.h>
 
 #include "debug.h"
@@ -435,7 +436,7 @@ static void wnd_remove_free_ext(struct wnd_bitmap *wnd, size_t bit, size_t len)
 		;
 	} else {
 		n3 = rb_next(&e->count.node);
-		max_new_len = len > new_len ? len : new_len;
+		max_new_len = max(len, new_len);
 		if (!n3) {
 			wnd->extent_max = max_new_len;
 		} else {
@@ -731,7 +732,7 @@ int wnd_set_free(struct wnd_bitmap *wnd, size_t bit, size_t bits)
 			wbits = wnd->bits_last;
 
 		tail = wbits - wbit;
-		op = tail < bits ? tail : bits;
+		op = min_t(u32, tail, bits);
 
 		bh = wnd_map(wnd, iw);
 		if (IS_ERR(bh)) {
@@ -784,7 +785,7 @@ int wnd_set_used(struct wnd_bitmap *wnd, size_t bit, size_t bits)
 			wbits = wnd->bits_last;
 
 		tail = wbits - wbit;
-		op = tail < bits ? tail : bits;
+		op = min_t(u32, tail, bits);
 
 		bh = wnd_map(wnd, iw);
 		if (IS_ERR(bh)) {
@@ -834,7 +835,7 @@ static bool wnd_is_free_hlp(struct wnd_bitmap *wnd, size_t bit, size_t bits)
 			wbits = wnd->bits_last;
 
 		tail = wbits - wbit;
-		op = tail < bits ? tail : bits;
+		op = min_t(u32, tail, bits);
 
 		if (wbits != wnd->free_bits[iw]) {
 			bool ret;
@@ -926,7 +927,7 @@ bool wnd_is_used(struct wnd_bitmap *wnd, size_t bit, size_t bits)
 			wbits = wnd->bits_last;
 
 		tail = wbits - wbit;
-		op = tail < bits ? tail : bits;
+		op = min_t(u32, tail, bits);
 
 		if (wnd->free_bits[iw]) {
 			bool ret;
diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 4a0a1aa085d5..77f52fe49dc1 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -383,7 +383,7 @@ int ntfs_look_for_free_space(struct ntfs_sb_info *sbi, CLST lcn, CLST len,
 		}
 
 		lcn = wnd_zone_bit(wnd);
-		alen = zlen > len ? len : zlen;
+		alen = min_t(CLST, len, zlen);
 
 		wnd_zone_set(wnd, lcn + alen, zlen - alen);
 
@@ -1097,7 +1097,7 @@ int ntfs_sb_write_run(struct ntfs_sb_info *sbi, const struct runs_tree *run,
 	len = ((u64)clen << cluster_bits) - off;
 
 	for (;;) {
-		u32 op = len < bytes ? len : bytes;
+		u32 op = min_t(u64, len, bytes);
 		int err = ntfs_sb_write(sb, lbo, op, buf, 0);
 
 		if (err)
@@ -1298,7 +1298,7 @@ int ntfs_get_bh(struct ntfs_sb_info *sbi, const struct runs_tree *run, u64 vbo,
 	nb->off = off = lbo & (blocksize - 1);
 
 	for (;;) {
-		u32 len32 = len < bytes ? len : bytes;
+		u32 len32 = min_t(u64, len, bytes);
 		sector_t block = lbo >> sb->s_blocksize_bits;
 
 		do {
-- 
2.25.1

