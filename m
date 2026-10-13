Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD2D490BE4
	for <ntfs3@lists.linux.dev>; Tue, 13 Oct 2026 18:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917253; cv=none; b=cseToFPpZR9Equ7F1G3immEZmXH/+XORsTwJzPbne16YDE/9pHQN8zmhBNcNXltEGFc0txm2AC0EsJZW/T7c5iJEJVlwR3CwyQYyWud4icvaxBkNYUxc5Pv6NGgC2n/0+a+vEa4mEfb5kQ2YNXne6jzSM1a9Y7r3oqPGTQYjS+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917253; c=relaxed/simple;
	bh=pYjY9rWfr21kO4iNAj0qb5nTvYGVZnDwiPxGonsD5Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpA5oGpGBFWV7GBWwGwMHqWQI1Y05T1nSkCOW5xUokppdvpj89HFRcwwIAM4xYjhYiIs6Hmrf2oXHbdwuqx8rSJ0jQ1CUcfGPFlOyH9HCGS5NdTJC2cy6O3sQVHSsdqCWN784gdCZJlMekRZlBYs2p4Syjk4tGC/hCj9bHulTPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DutebjIK; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DutebjIK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33c10faf6easo337165eec.0
        for <ntfs3@lists.linux.dev>; Tue, 13 Oct 2026 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917251; x=1792522051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=udG0DXbTIaYDWqaYT2920eFyVeAlI4kC5bwVowQYt8Y=;
        b=DutebjIKzDFt7hE6YnLUK8R1rs8L00+ZOikzxKG6lm75LEGNTFPmTP2cVEu6KotSXQ
         A//RBZnZfjxRpKxXDJ0PgE0B1Hi8n3xwZDraQd+GZn5L5RKC37z29BOxhhyor8b9XZcp
         vPM7ARY3o2yLxYB1X5G/3FOC/2YbpAJSUSRFVp7ut4KY464XFfmhnDOoFp9944v32AeG
         mn6kLUGVX4WW7RrVbv2PaMO9oHmU1Y4D96SEz0A09kwnWgNyZGCmwemYxRrDcWbO5EdG
         GjY+sm6vBooewal9Ja6gXHkISs1ZMRT+UHFHxvB5F/IT16y+Uzd/iaiIldwrUOVvntMP
         axgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917251; x=1792522051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udG0DXbTIaYDWqaYT2920eFyVeAlI4kC5bwVowQYt8Y=;
        b=KBnLyM4pbNI5Gzwy3AfZXgR70H64y6PAbS+WcXARNX/ZpbGyp3plkerpBeUsgHy7hf
         2GWpRYBR7NH1OjKYI0YXXsgHZlVqtxiiUMdebnTk5QgApaM9flLG03jriWVu82XV17g1
         l+X7LOV3z/4KYaf9ylpwds6c5KID08B63J+7vVyKbDR5XDqlYZSdoh2cy6+PslgnZVN5
         IMjGfb274BTnOHIhbsXJrkDzlv9yJ/hU2p/Tawjrc/UHJrCvKFNE+9VuzNlvN5NhMSuo
         06VXcRrpQdrRW/p4KFTculdbBi7dvoxg/Fhn8+gw7Bn5UELQZQe0idvpmePi8RjUNupm
         Pe8g==
X-Gm-Message-State: AFq9FYJBtQF7WsFgynTbonuCW6fZtTemd4sWaPy+lhlsaaNOsXByIsCO
	uxJkSPGw5m7icayFeq3gwaz5rAcRNKXXMezNlg6ZOP77QpqAUEHbEJ5I
X-Gm-Gg: AYBFou2dLPpjH5Sh0eRAGvmHpVcx0BFOSUt4t7VjOGqq0yc7nylVtIQiG9wNOINdmxf
	tZ+L9hDFGRDPgzn0LZ4UFA3WRS3PNZvOEGWNc59bpthgZscMPkKRZcqdHR5kQjATpmE8SXejieU
	ocNGGloe7VFDYqIy8vVo/FO0ceX4vaLCqaYQtjKrO5Om8XQiplBaawX1mwDJHNFPtIQQ8oV1aGk
	E8ZHvzt0bT8agSnomHPpcQrWp9r39t8ZzVHZ+fhL/uGA8u6jZ8S+alXfmPVSHDepW6b32VZO42j
	Y38e8KhX9fGpukEslrdCSSsSawhnMNJJp8LLcGr8Iv+IpL8+aB39usdEMd823JHz3KgjDtHB3k6
	bOYT6mOXsJEANu1sRMLZs9XZpZYmaZ0aZKf6Fws5Y8lEVyStMp0+Ktuho29NuTMq6NES80qOAaT
	J7KmdJZvWcTITbFhZ+BHUp5QAOlcJH9kWLCp2zjj60qNb2sIzO4jphW0ZB9uezmzHyhIiJUgPAZ
	f2GcyGk775XRfy7fNq1Kh12Da6QYWPCpgM8YZGsv4JJV3kOmPzEfz6e9Ibu912RTr2+vo2D+8JF
	nrVem6EF9u3Bv6WNcweHYAJwihc=
X-Received: by 2002:a05:701b:450d:20b0:143:5c2a:e45f with SMTP id a92af1059eb24-16a4e6cc453mr27577271c88.0.1791917251231;
        Tue, 13 Oct 2026 11:47:31 -0700 (PDT)
Received: from eugene-desktop2.localdomain (c-73-222-231-84.hsd1.ca.comcast.net. [73.222.231.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm40261107c88.7.2026.10.13.11.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:47:30 -0700 (PDT)
From: Eugene Susla <eugenesusla@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	swilczek.lx@gmail.com
Subject: [PATCH] fs/ntfs3: fix ABBA page-lock deadlock in ni_read_folio_cmpr()
Date: Tue, 13 Oct 2026 11:47:28 -0700
Message-ID: <20261013184728.665956-1-eugenesusla@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_read_folio_cmpr() is called with the folio being read locked, then
locks every other page of the compression frame in ascending order via
ntfs_lock_new_page(), sleeping on each page lock. Two tasks reading
different pages of the same frame (e.g. two page faults on an mmap of a
compressed file) can each hold the page the other one needs next:

  task A: faults page 15, holds it, waits for page 0
  task B: faults page 0, holds it, waits for page 15

Both tasks sleep forever in D state:

  __filemap_get_folio_mpol+0x344/0x4e0
  ni_read_folio_cmpr+0x18b/0x490
  ntfs_read_folio+0x8c/0x110
  filemap_read_folio+0x1f/0xa0
  filemap_fault+0x7c0/0x1400

They cannot be killed, and suspend fails because they cannot be frozen.

The same lock order inversion exists between a reader and
ntfs_compress_write(), which locks the frame pages in ascending order
via ntfs_get_frame_pages().

Never sleep on the other page locks from the read path: pass FGP_NOWAIT
and, if a page is locked by someone else, decompress into a temporary
page instead, as is already done for pages that are uptodate. The data
in that page is discarded; the page is left to its lock holder. squashfs
does the same for the other pages of a compressed block.

ni_decompress_file() keeps blocking: it holds no page lock when it starts
locking a frame, so it cannot be part of such a cycle.

Reproduced under virtme-ng on v7.3-rc6 with a 64 MiB LZNT-compressed
file on a loop-mounted ntfs3 image: two processes faulting page 0 and
page 15 of every 64 KiB frame after a cache drop hang in the first pass
(5 of 5 runs). With this patch, 5 runs of 50 passes and one 16-process
run of 20 passes complete, the temporary-page fallback is taken about
46000 times in a 50-pass run, and the pages read and the file's cached
contents match the original data.

Link: https://syzkaller.appspot.com/bug?id=91960c6feb9ae216c9004c0f864f74aab1aebd5a
Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Assisted-by: LLM
Signed-off-by: Eugene Susla <eugenesusla@gmail.com>
---

Notes (not part of the changelog):

I hit this on 7.2.9 with a Windows dual-boot volume where my home folder
had NTFS compression enabled: two concurrent git commands in one repo
ended up in D state in ni_read_folio_cmpr() and the machine could no
longer suspend. A reboot was the only way out.

AI disclosure: the diagnosis, the reproducer and this patch were produced
with an LLM coding assistant, which also ran the tests listed above on my
machine. I have reviewed the analysis, the patch and the test results.

Not tested:
- concurrent writes: the reader vs ntfs_compress_write() case is
  covered by reasoning only, not by a test;
- LZX/XPRESS (WOF) compressed files, only LZNT;
- the syzbot report above (no reproducer, auto-obsoleted) shows a reader
  waiting in ntfs_lock_new_page() and a writer waiting in
  ntfs_get_frame_pages(), i.e. that reader vs writer case; I believe
  this patch fixes it but have not confirmed that.

Build: W=1 adds no warnings to fs/ntfs3/frecord.o. The reproducer (a
Python script and a guest shell script for virtme-ng, about 100 lines)
is available on request.

 fs/ntfs3/frecord.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a95..9a071b2a1 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1893,14 +1893,30 @@ enum REPARSE_SIGN ni_parse_reparse(struct ntfs_inode *ni, struct ATTRIB *attr,
 	return REPARSE_LINK;
 }
 
+/*
+ * ntfs_lock_new_page - Get a locked page to decompress a frame into.
+ *
+ * With @nowait the page lock is only tried, never waited for: the caller
+ * already holds the lock of another page of the same frame, and a second
+ * reader doing the same for a different page of that frame would deadlock
+ * with it. A page locked by someone else is left to its owner and a
+ * temporary page is used instead.
+ */
 static struct folio *ntfs_lock_new_page(struct address_space *mapping,
-					pgoff_t index, gfp_t gfp)
+					pgoff_t index, gfp_t gfp, bool nowait)
 {
-	struct folio *folio = __filemap_get_folio(
-		mapping, index, FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
+	fgf_t fgp = FGP_LOCK | FGP_ACCESSED | FGP_CREAT;
+	struct folio *folio;
 
-	if (IS_ERR(folio))
-		return folio;
+	if (nowait)
+		fgp |= FGP_NOWAIT;
+
+	folio = __filemap_get_folio(mapping, index, fgp, gfp);
+	if (IS_ERR(folio)) {
+		if (!nowait || PTR_ERR(folio) != -EAGAIN)
+			return folio;
+		goto use_tmp;
+	}
 
 	if (!folio_test_uptodate(folio)) {
 		struct page *page = folio_file_page(folio, index);
@@ -1913,6 +1929,7 @@ static struct folio *ntfs_lock_new_page(struct address_space *mapping,
 	/* Use a temporary page to avoid data corruption */
 	folio_unlock(folio);
 	folio_put(folio);
+use_tmp:
 	folio = folio_alloc(gfp, 0);
 	if (!folio)
 		return ERR_PTR(-ENOMEM);
@@ -1975,7 +1992,7 @@ int ni_read_folio_cmpr(struct ntfs_inode *ni, struct folio *folio)
 		if (i == idx)
 			continue;
 
-		f = ntfs_lock_new_page(mapping, index, gfp_mask);
+		f = ntfs_lock_new_page(mapping, index, gfp_mask, true);
 		if (IS_ERR(f)) {
 			err = PTR_ERR(f);
 			goto out1;
@@ -2072,7 +2089,7 @@ int ni_decompress_file(struct ntfs_inode *ni)
 		for (i = 0; i < pages_per_frame; i++, index++) {
 			struct folio *f;
 
-			f = ntfs_lock_new_page(mapping, index, gfp_mask);
+			f = ntfs_lock_new_page(mapping, index, gfp_mask, false);
 			if (IS_ERR(f)) {
 				while (i--) {
 					unlock_page(pages[i]);
-- 
2.56.0

