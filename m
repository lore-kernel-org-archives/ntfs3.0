Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C133CD8BC
	for <ntfs3@lists.linux.dev>; Mon, 13 Apr 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087089; cv=none; b=KMFd8UG98S0deQbFGwBgBoHKjUyT3wgY00LKnmCi80zcHl/m0in+tfYogTaSIGZqFNfk54/FuThaN/xI0qzuL1lkJs/9tnchthsgptAu0ZF1ypRiHke8K4XhhTscr28l3mJIjWBowq2F03khOW3jO6KDXurrLnH6vWlZ7BrQy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087089; c=relaxed/simple;
	bh=NNF0oOpx6c/FbSF7aZoqGXm3gmeZfZbf1NphjvuVR20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pb3g6bFHW9WxKKqBvvBdkz27AwaxhIG2z/nHBd49N+G9tXWh2qTayGWgWjH8oPDvZzt8mdFtPTaziie6oiM71T7k7NRtNlqXpygHGedtCZJa99NwEhuV4PVBirbGkyX+ZMNIAL1NaLNznIsoHDpmdfMTT37zQhdvp7Bep7Mi1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=altvFmgA; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="altvFmgA"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c70b5594f4so428830885a.1
        for <ntfs3@lists.linux.dev>; Mon, 13 Apr 2026 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776087087; x=1776691887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cvX/3YS2hK9kgzlNtYASfb57GVegxtYM6rMLbYciK8=;
        b=altvFmgAGtnpbrGWEUAiXMzhYyoOppfpZ1JXo+HmaAThXtJ4GqXCVoS65KzX4Lcf5u
         S7IvAH/25oLRiLlN2qzkUbTuJ+W65pURmWUUUw6ZnASe14EKzWdOIg+IBJJYCSSJuQsI
         VEmP5kjuxFkEU0Lcd7SCkZDs2ALwbqKwAHi5dXayDQAhduiOIPdZ6S8PSkZh7WZh8oXA
         Ji25Sp8es+BPYWFbIxGFOUB9Q/95QaZNnukGAeRJWvORpdNfXalmOKKkM13E5A6vqeq+
         ++2BPX3nyeel7jvWN19ZE2qE+pOpDpsFA+osq5AgrsFV2Kyt/6iu6YH/mu1h4y8gHZLl
         1Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776087087; x=1776691887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cvX/3YS2hK9kgzlNtYASfb57GVegxtYM6rMLbYciK8=;
        b=NHu35wpZ6oqRzNPgsODgpmmMj8WBbAWJ5TccPTxCrEym+0ALPFpxVUse/H1xsde6qv
         h1hN7hUKOTtfvXWFR/5VNKsOvBSOlS1ZVN2ci3nxKfHds4qBZ/WJ/7Mq5JX2gujUbMO2
         J4NcPys0Ume5SqxwwJRwPLFhHbN09irAhC1s4K09Vb6nUzQAYz+C8BZxuJ2J74VSZgi/
         Ku3D1pwlgimXVpXRsfQQ1g8mj8uac68NYc0JOPZc2MCvbc48Hnl4ZS/Fbjwag6rfSKjd
         BrJuqcBF79YHe8j5MfPtymM6j4tkBB2sv3Tvc+M0Sw2EJdPEI+tuG6DjgWX9DOBjbwmr
         4Vfw==
X-Gm-Message-State: AOJu0YxUOGkj/F1dLoCum0D8v8rSB1m9umnSa7quqnS/qDqG0if03tGp
	1WMBGDisSEGdxazi5AEcgTsyJW1uhNnzzPBmZwY9Bzp0nlp+ye48mETtmK/6uQ==
X-Gm-Gg: AeBDiesW+ku3jVQcb8Kkz/c1fTYdlwuyyHoAD9PpeW13yWE9+aaJhGIZ6PIT+WTUnY7
	Mo2K7jW34iwa3KBPwRz1Rx0x11r6CjrGTsaNbgvL04Tk86JWNiaU5Li2xoO9j/XUdXRrAnS9C0g
	K6IhnSbcTx+IssDvdd4iGwjwxTmiN3D8gUn2oONK4HD2jfGLDlSR0vuJidgQ2WVitLx1wDxMyi7
	xZiChK8FYxJfghU1BS38mG74CdV8EyffRhndYhDPte4kdSTDN6yzOxR4cHCe+pNCmsly+mv6dx8
	uYYVKVErQKOzWpw/O5CoL25+LN224I9UZlJEpqiRWE7w4LDREDaUA9o8B20a9FXvqMNm6FGhMYq
	jXAbJh5yEiu6V4Xz36dd/KOPYT5iv/EtbhzBndmUoC9WR92PE7QiKcw0vonA94WiL0jWQ6CEo+h
	+XEifWA0iqUcR9NUuHIFMXZ7si3CAeC+CGMpSyWliAoXM24volkIZi00GOfaM0H9X1J3HQfHiu5
	3qjbWT9oAQbzi+cwEkU
X-Received: by 2002:a05:620a:2892:b0:8d8:ed00:5a90 with SMTP id af79cd13be357-8dc45d29b5bmr2298150385a.23.1776087086763;
        Mon, 13 Apr 2026 06:31:26 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8de6553c460sm852666385a.43.2026.04.13.06.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:31:26 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: add depth limit to indx_find_buffer to prevent stack overflow
Date: Mon, 13 Apr 2026 09:31:17 -0400
Message-ID: <20260413133117.3687677-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

indx_find_buffer() recursively descends the B+ tree index with no depth
limit.  A crafted NTFS image with circular index node references causes
unbounded recursion, overflowing the kernel stack and panicking the
system.

This is reachable by mounting a malicious NTFS filesystem (e.g. from a
USB drive via desktop automount) and deleting a file whose index entry
triggers the rebalancing fallback path in indx_delete_entry().

Add a depth parameter and bail out with -EINVAL when it reaches the
fnd->nodes array bound, matching the constraint already enforced by
fnd_push() in indx_find().

The related function indx_find() was previously patched for a similar
infinite-loop issue (commit 1732053c8a6b), but indx_find_buffer() was
missed.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
Found during a broader arch/um/ and filesystem security audit.
This is the same class of bug as the one fixed by commit
1732053c8a6b ("fs: ntfs3: check return value of indx_find to
avoid infinite loop"), which added a depth limit to indx_find()
but missed indx_find_buffer().

Reproduced on UML (ARCH=um) with a crafted NTFS image containing
a circular B+ tree directory index. Mounting the image and
deleting a specific file triggers indx_delete_entry() ->
indx_find_buffer() -> unbounded recursion -> stack overflow:

  Kernel panic - not syncing: Kernel tried to access user memory
    at addr 0x606128c4, ip 0x6012907e
  Call Trace:
   [<60611ec2>] ? indx_read_ra+0x0/0x677

At 168+ bytes per frame, ~97 recursions overflow the 16KB kernel
stack. Desktop automount (udisks2 + ntfs3) means a crafted USB
drive can trigger this without privilege.

Note: the pre-existing indx_node allocated by indx_read() during
the DFS is leaked when the new depth limit fires. This is a
pre-existing issue (the node was also leaked on any other error
return from indx_find_buffer); fixing it cleanly requires
restructuring the node ownership model and is left for a
follow-up patch.

Reproducer script and crafted image builder available on request.

 fs/ntfs3/index.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 97f06c26fe1a..2c43e7c27861 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -2013,13 +2013,21 @@ int indx_insert_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 static struct indx_node *indx_find_buffer(struct ntfs_index *indx,
 					  struct ntfs_inode *ni,
 					  const struct INDEX_ROOT *root,
-					  __le64 vbn, struct indx_node *n)
+					  __le64 vbn, struct indx_node *n,
+					  int depth)
 {
 	int err;
 	const struct NTFS_DE *e;
 	struct indx_node *r;
 	const struct INDEX_HDR *hdr = n ? &n->index->ihdr : &root->ihdr;
 
+	/*
+	 * Limit recursion depth to prevent stack overflow from crafted
+	 * images.  Use the same bound as the fnd->nodes array (20).
+	 */
+	if (depth > ARRAY_SIZE(((struct ntfs_fnd *)NULL)->nodes))
+		return ERR_PTR(-EINVAL);
+
 	/* Step 1: Scan one level. */
 	for (e = hdr_first_de(hdr);; e = hdr_next_de(hdr, e)) {
 		if (!e)
@@ -2040,7 +2048,8 @@ static struct indx_node *indx_find_buffer(struct ntfs_index *indx,
 			if (err)
 				return ERR_PTR(err);
 
-			r = indx_find_buffer(indx, ni, root, vbn, n);
+			r = indx_find_buffer(indx, ni, root, vbn, n,
+					     depth + 1);
 			if (r)
 				return r;
 		}
@@ -2446,7 +2455,7 @@ int indx_delete_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 
 		fnd_clear(fnd);
 
-		in = indx_find_buffer(indx, ni, root, sub_vbn, NULL);
+		in = indx_find_buffer(indx, ni, root, sub_vbn, NULL, 0);
 		if (IS_ERR(in)) {
 			err = PTR_ERR(in);
 			goto out;
-- 
2.53.0

