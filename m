Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794278330;
	b=XZPBTh5Sbj6HY002AKDtQTcg7pksO1g3zq9WG82pTdFjZxLZ39AeFNil8q42foP1pe6F
	 elHPzXFmB6mWp5ex7PtBMea6LZDsBjVKTPHCqS3qJ1KSTTP8H0pCc1R88RNuTb77vza+I
	 XYho9JhiVcLuyElQJpXNfjvBMIxauJtg+24N1F/HtX/uJQNqDCq5Oj37r9jxBkdI6pLU6
	 7ReyzzshLrlZrNFoUB/BpCOBSw8+HvixeCb44Uaw7mXoeBAP18BKk7gwd88Q4c/Yjkd3p
	 dFmYe3FBv8hrfhU0jZU3PSAxIT3hyzcTjb+HQo0tNOO6r7WuWewdQqTmcK0ot9olX/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278330;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hLFpIj06iWIjWH062UOt1GWvTFb9FnA3jx3mjAJmQOk=;
	b=R4CHXP/uEABDtKmGS9TUJcoGrzRRnZshUPRe2+y2LmNQr8qd3mlIv6NfFHRlWtfG59zF
	 cGU+WgPqXxriPpMOeCeDcuYLQlJkBBs4dtVB43nDG1yr5klW1rLFFC4Tj2lp7yYtw7aCw
	 CwwhkmhvWLgqmqsw1W7urm9ZJObVAfDdWMUztFPwyY8+V+p1uRr21UgXYxmNKA0k7c+qE
	 S/BXdGegXp0YKC9dvgyOG3cOIW+sessu6Z+Fh3iwl6jWOHJU6pkQl0eq/gDFiFl63TYVC
	 CRomY+uK7OeGZXEgPb0QjK4Q1PivONJq27WdOlmgLZ6uH3BXRnIQyjHaKpL78eJlFMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HV15tRNd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BB5606A32E;
	Tue, 10 Nov 2026 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HV15tRNd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794278329;
	b=X8NSPErzXXC3gpZbngSn0jnmxlNv103UzE3RVbhLbNBalWeUft2k/tjwFdVhA2rRDqyg
	 PJl7a5pejfz4eHDCPOF1RP+za2+TvSNVA31kRa2IfDtOokSvMwtfe+Mb5NL81/9MLqWTw
	 +U6FEYq4T3CfV4JexSencSjLlxXQgljhK6+uAQBj9qnPAtgcs+Thy/PSYfv/J1P7FwoCd
	 owykBrQ0Qq9Dj8v35zkzg/qTr3AJTzZjfupWJFYUzkG99Q1B7EjZJ4DyBEBlMZlewPz8C
	 mysm1X1Qnl5bY9lN1bN8qwOa0iLvUCPcY6yAIUF8UnZ04mXzVDm9Z7mKy34oCE/SNCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794278329;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hLFpIj06iWIjWH062UOt1GWvTFb9FnA3jx3mjAJmQOk=;
	b=BmBPhsvuxR6af5EAp3ESGK2KTYb5RYBjcZlbUAhzKRnkSY0NfBeJZ8JW9fyS4Wlhumyu
	 hc8Comgr/hiEnPigPGT7A1NTD063yyFXAMhRftUFxCSt2anOnJ4wb4VK7Y1LoHUDUy4gB
	 dwN3E6qTHUNe2SHf/kJ7zCUM7LCBKA/3d7SYfqKWEOdNowUm3igSmo9HP5LLkXd19/DTv
	 DonqqDy5PNdBBEpvT3zSTbADuoTLImeYsGOCQ/BnF9LG5mThrvlourAwAg0pkO0qFhocz
	 6KSV7xhapvA90IHY/InrFiUShUB9c2QSnS2wMFgZaAkQdHy8diZylxUwJJiVrtpA9FQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9FEC1F008A3;
	Tue, 10 Nov 2026 02:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794278329;
	bh=hLFpIj06iWIjWH062UOt1GWvTFb9FnA3jx3mjAJmQOk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HV15tRNd+I1BJ+QTFJHbiH4Io+ncUYaorppya3b2v/DfbcRY4uBru2yyyhFC5p30k
	 vYDZX0WJJkVElO66aOda+CF/xueUU0Knc4xostr6ccAxCFEMVqNkXSYyW+bjzlhAjf
	 dHKowPF55lrlzwkx9WMZC7/zLd1rbq07UjZiA088YsvVeGbSObKRrCZGo2hy1LmnJi
	 9zM3k+4fKuTKuriWPxfl8FhuNPZqY8iHccV+syS+tCY8/KSO1rpPb6cNCBffy4LmTV
	 EEDoFmOW5c0CinEqcPl1O/klVlR2lZsPWxwD+prBGPFGbGLoHJE0WGMYtmy7luwv1g
	 xzWc7yljxqweg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6756D48764;
	Tue, 10 Nov 2026 02:38:48 +0000 (UTC)
From: "Eric A. Stalee via B4 Relay" <devnull+mail.eric-stalee.eu@kernel.org>
Date: Tue, 10 Nov 2026 03:38:13 +0100
Subject: [PATCH] fs/ntfs3: load index allocation runs before use in
 indx_new()
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-ntfs3-indx-new-load-runs-v1-1-061378c2d45e@eric-stalee.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0yHZCoVzEsBqZgjSlmyl9Cu
 LujLr/FezsYJ2GDW7FD4kVMRs2gUwHdI+jAKDEbvPM1ETnUqbcSReOGyiu+xhAxzWrI/hyrQO5
 6cRXk/J24l+23vjd/29w+uZu+PziOD4eJcGZ8AAAA
X-Change-ID: 20261110-ntfs3-indx-new-load-runs-e25d4a109804
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
 "Eric A. Stalee" <mail@eric-stalee.eu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794278328; l=4039;
 i=mail@eric-stalee.eu; s=20261110; h=from:subject:message-id;
 bh=ljuOubNiF29ICM1zvurt0a9eMhRnzv4IXWbSHt8+7bE=;
 b=j7DyAqOo5H3uyh0znlxbg1uT5qlRDSALeA+akNO7C9t4HbQ7T8vA2ilU7MbVT6eJ2Hy9EvcQA
 amFDJ15gImBDXPS8lH70g6YMN7uniUfonI0u7ZRkKA9Aj3rY824w0n2
X-Developer-Key: i=mail@eric-stalee.eu; a=ed25519;
 pk=Vp3vCG+vzRAtKQmuxwsKy8/XIbX003wXmany+Up3BfY=
X-Endpoint-Received: by B4 Relay for mail@eric-stalee.eu/20261110 with
 auth_id=1473
X-Original-From: "Eric A. Stalee" <mail@eric-stalee.eu>
Reply-To: mail@eric-stalee.eu
Content-Transfer-Encoding: 7bit

From: "Eric A. Stalee" <mail@eric-stalee.eu>

indx_new() maps a new index buffer through indx->alloc_run with
ntfs_get_bh(). The runs of $INDEX_ALLOCATION in alloc_run are loaded on
demand: indx_read() loads the missing range with attr_load_runs_range()
and retries when ntfs_read_bh() returns -ENOENT, but indx_new() does not.

When indx_add_allocate() finds a free bit in the index $BITMAP, it
reuses that buffer without touching $INDEX_ALLOCATION, so no runs are
loaded on that path either. If the reused buffer lies in a range whose
runs have not been loaded during the current mount, run_lookup_entry()
fails in ntfs_get_bh(), indx_new() returns -ENOENT and the insertion
that needed the split fails.

This was seen on a 1.7 TiB NTFS volume that is also used by Windows.
Its $Extend/$Reparse index has $INDEX_ALLOCATION:$R split over two MFT
records through an attribute list, with 149 index buffers allocated and
148 in use. Every symlink() on the volume failed with ENOENT, while
creating files and directories worked and the other NTFS volumes on the
same system were not affected. The failure persisted across remounts
and reboots, and did not depend on the MFT record number of the new
inode.

Return values from a kretprobe trace of one failing symlink():

  indx_add_allocate()   <- indx_insert_into_buffer()  =  0
  ntfs_get_bh()         <- indx_new()                 = -2
  indx_new()            <- indx_insert_into_buffer()  = -2
  indx_insert_entry()   <- ntfs_insert_reparse()      = -2
  ntfs_insert_reparse() <- ntfs_create_inode()        = -2
  ntfs_create_inode()   <- ntfs_symlink()             = -2

Load the missing runs and retry when ntfs_get_bh() returns -ENOENT, as
indx_read() does. With this change, symlink creation on the affected
volume works.

The analysis and this patch were produced with an AI coding assistant
(Claude Opus 5.5 in Claude Code) under my direction. It read the ntfs3
source, wrote the kprobe script I ran to get the trace above, wrote the
fix and drafted this changelog. I reviewed the change and tested it as
described below.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Eric A. Stalee <mail@eric-stalee.eu>
---
Testing:
 - Built as an out-of-tree module without warnings for 6.18.60 (CachyOS
   kernel, gcc 16.2.1) and 7.3.3 (CachyOS kernel, clang 23.1.4 with
   ThinLTO). The CachyOS tree's fs/ntfs3 at 6.18.60 is identical to
   v6.18.60.
 - With the patched module on 6.18.60, symlink() on the affected volume
   succeeds for absolute and relative targets and for names containing
   ':'. With the unpatched module it fails every time.
 - Not run on mainline. The patch applies to current mainline with a
   5 line offset.
 - No reproducer from a freshly formatted volume: I could not recreate
   the on-disk state from scratch, so the affected volume is the only
   test case.
---
 fs/ntfs3/index.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b36760..4970188a0 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -987,6 +987,23 @@ static struct indx_node *indx_new(struct ntfs_index *indx,
 	}
 
 	err = ntfs_get_bh(ni->mi.sbi, &indx->alloc_run, vbo, bytes, &r->nb);
+	if (err == -ENOENT) {
+		/*
+		 * A reused index buffer can lie in a part of $INDEX_ALLOCATION
+		 * whose runs were never loaded. Load them and retry, as
+		 * indx_read() does.
+		 */
+		const struct INDEX_NAMES *name = &s_index_names[indx->type];
+
+		down_write(&indx->run_lock);
+		err = attr_load_runs_range(ni, ATTR_ALLOC, name->name,
+					   name->name_len, &indx->alloc_run,
+					   vbo, vbo + bytes);
+		up_write(&indx->run_lock);
+		if (!err)
+			err = ntfs_get_bh(ni->mi.sbi, &indx->alloc_run, vbo,
+					  bytes, &r->nb);
+	}
 
 	if (err) {
 		kfree(index);

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-ntfs3-indx-new-load-runs-e25d4a109804

Best regards,
--  
Eric A. Stalee <mail@eric-stalee.eu>


