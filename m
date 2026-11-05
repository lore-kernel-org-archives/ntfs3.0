Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867157;
	b=3WhTWG8EnhmDSAOdngoiAi3Kdd9TimhKXw2RYB+WqnGavW4/FSpwx0D8147uiVoHEosB
	 5zdo993+CPDZWQz1FwL/Dtk0L5VUIZTasmaozQK9qC7AxxTiWjg4bRYJ7cTR7SMb+e9Yj
	 Xblqw5niyTtnLwwln28UyK2QYYsUd4ifCS4oo6zbPxWacDIoDxa4OyHN/df0pKWQ8+4p+
	 0E5QaDKo7RVtAVU8L/MBBx1MPA5pJ1QVFONA1gEi+yfwPNY2CR9A6qKoZc0Sdy08uclQg
	 T7mClV7IbXxoLwTpammfjGglokPAPwcQI1nwX/EpqX8WCNEsUTCwh33pibOI9kw072g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fSSaR3HgquBJbFuLC5S8K7K1lQfMmH2UDUaR+qdNMaM=;
	b=LRShmXLrOBHjCApAKpbWiSufC1ioOnwJJmCZORTOFndmldJR6y9u0nEA6QocHGNnIySu
	 AQGd62lO9CjF9+Dh7N6kIJQsjTNSmVRxEGdW/YoxoyOQHCYH6sAlwZ5nXbp0kQRAfBvxS
	 skzoUQcjszuXKXXk5DtgddyTkjWUzZ7aPXovegzLGD8p6P6a0z0b6lIgcE/JCINCdEQjn
	 pgalsDhICBxj5uTiwBTuZvpVnyR8tLMR2rNozJEcgnOb3IolE25BlZ8+egqZLqETYPULw
	 7mDips69Ksj/aKGfQIR/yxP5Xs6821aQ5gHBwldE9iCp9LUJlYrS7wRMBOqFe6PGfdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asfcTjZq;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4408F606A328
	for <ntfs3@lists.linux.dev>; Thu,  5 Nov 2026 08:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4408F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asfcTjZq
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so234975eec.0
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793867156; x=1794471956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fSSaR3HgquBJbFuLC5S8K7K1lQfMmH2UDUaR+qdNMaM=;
        b=asfcTjZqQKMiPQSvdi6EAmQdAuJzQcWBZp/9mf4ACYwktxFDUxKOD4himzqVZGEPc7
         /OItiVC5FdZpHLqIoFFdVTTPqTDAM1PqJGbaf7WlZcRFL7ITFqLCmGKun7UGYem6Y8gO
         2QwclJOfA1BwLZOfTsmPD495YQN+poOzKiCS08J0OlAjaevZ9sWUPTzB3nrp2RyZQPXI
         5XNeWVHra8evxbYoYCqwVVwZkKLEze5G/efw/Yuf3Ix3qb6awhs242Z2i3X0Y1TXZmCJ
         tGMgJDofCh0gY6z+fW2awv6rRURznNhdX3YH0Z/XLGe6ZWX5BKpBiTTk+2ISA0Px6NwG
         0+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867156; x=1794471956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSSaR3HgquBJbFuLC5S8K7K1lQfMmH2UDUaR+qdNMaM=;
        b=ex/CKCD59Qe9I7s07IaV1guRwHDzcFPWae1xotn+jWY7z4fjul02YsmKdJqwjBle+G
         ZAgn8APM1UMGVB3wpztPaxLXACBiGZGWkMdGhDsFtAagwd9B7WwgCvm3HqT2exFMTGYz
         U9c9NOUb4b3waJd4KWBDfNuFCWwtB2xs2hsiarWQGHGwzKRtdijw5RpxvMMv4wLZ6rbM
         oVysVHFA1TYkYUaWNWohSc5GxdZBhqCKDyu6bc9lp/OeMIfa2VK2WehRGTh8UPKH4OX4
         ukUMFTmj8Pcd3eTFbd9CgUVUvx1dXJGEBvew8IhmDM7yiJHTAoweItD4+ctKsJ+ea0JJ
         HiaQ==
X-Gm-Message-State: APuU4Z/R72XkL4sRH/+pVE9T1bmwVwvptRREiPyi3hdJR4BPVj+1c5IR
	P/MOVzQgRJ4/iBtXRH6IYJsSYCyAvZB+OyIMhTBculBqfce5tZ8/ljaedSLQuE25kmB/aT9i
X-Gm-Gg: AYBFou2F7jmQzjwe+7Vu8cIk8o4VhzVE8UOZwuoUKxrRUavtJHoBTXoBy3PAVgrmceJ
	ltY3DmfzdN68qRrhNKTzRqW3C5nH2P2sgPrQ5hLGvtR573RwI7AU+n92Qa7YXyVwODw5WOEDLUa
	ZY9EJcDzjhmwE/2gaD1VfsFe0cKDWsFtqLTuhuRBWzRGVwGb8VkRa08AGQu4g4CYMJQ/XoZPR7Z
	7myNMqPU/eVBLkMmoGqkFXjizdNXFFBgvSqOe06N064nqQ6tVcRWDyh7QxZp4YUQ36aLlaPuG56
	ifrVMAwfEwkVnHpTh3VAGgapd0nQs6/7H8fcGVKGGwi7b/rQ8LrGCrlSiEYNUD0b4NVbSNP9yrk
	ymEmGeG9QUnbkZ5HOZGVKgeBN2ggGJXkB/siGgfxxsNHJUcXTZSpS1FDbuT0aSUX0v1rswRE9Ez
	NYZp53AZx8Eigm4ZLEKFdXWj+vIbsLogtHByZQyzXtSjllFgAvIsgixj7bgfDmlr/EUR6Bt3Ndj
	gGXq1IsBsNs3o+jfpxb6OzrGLlo1skM+eQYg+UPlyUz8pf53xvOlcNaqlT5dsghD+PlP6WgrV/+
	iakPEV25X49zjs2aPVdB836skZ/i0uwWWRRJDXd+fp9czU3+AAkJiFvDLtsN9H+IZQ==
X-Received: by 2002:a05:693c:895c:10b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-36a4a08f8a7mr26146762eec.27.1793867155695;
        Thu, 05 Nov 2026 00:25:55 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca392abe4sm17162580eec.19.2026.11.05.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:25:54 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: merge overlapping free extents in wnd_add_free_ext()
Date: Thu,  5 Nov 2026 13:55:50 +0530
Message-ID: <20261105082550.1503111-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wnd_set_free() clears the bits and then adds the range to the tree of
free extents, without looking at what the tree already holds. When the
range overlaps a free extent, which is what freeing clusters that are
free already comes to on a damaged $Bitmap, wnd_add_free_ext() does not
merge them: the left neighbor is taken only if it ends exactly at the
start of the new range. A new extent with the start of an existing one
is then inserted, rb_insert_start() warns about the duplicate key, and
the tree is left with overlapping extents.

  WARNING: fs/ntfs3/bitmap.c:217 at wnd_add_free_ext+0xb61/0xdd0
  Call Trace:
   wnd_set_free

Another way to get there is the scan of the bitmap that follows the
merge. It widens the range over free bits that belong to extents of the
tree, and those are not merged any more. The right side has a similar
problem: for a neighbor that ends inside the new range,
"len += next_end - end_in" shrinks the length, and end_in is moved back.

Take the extents that touch or overlap the range out of the tree in one
helper, keep the larger of the ends, and run it again if the scan of the
bitmap widened the range.

Reported-by: syzbot+323f07d372f692a127b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=323f07d372f692a127b3
Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs3/bitmap.c | 116 ++++++++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 46 deletions(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 60b362f388d9..7ee0067a3421 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -224,6 +224,66 @@ static inline bool rb_insert_start(struct rb_root *root, struct e_node *e)
 	return true;
 }
 
+/*
+ * wnd_merge_free_ext - Take the extents that touch or overlap [*bit, *end_in)
+ * out of the trees and widen the range to cover them.
+ *
+ * The first extent removed is returned in @e0 for reuse, the others are freed.
+ */
+static void wnd_merge_free_ext(struct wnd_bitmap *wnd, size_t *bit,
+			       size_t *end_in, struct e_node **e0)
+{
+	struct rb_node *n = rb_lookup(&wnd->start_tree, *bit);
+	struct e_node *e;
+
+	if (!n) {
+		n = rb_first(&wnd->start_tree);
+	} else {
+		size_t e_end;
+
+		e = rb_entry(n, struct e_node, start.node);
+		n = rb_next(n);
+		e_end = e->start.key + e->count.key;
+		if (e_end < *bit)
+			goto right;
+
+		/* Remove left. */
+		if (e_end > *end_in)
+			*end_in = e_end;
+		*bit = e->start.key;
+		rb_erase(&e->start.node, &wnd->start_tree);
+		rb_erase(&e->count.node, &wnd->count_tree);
+		wnd->count -= 1;
+		if (!*e0)
+			*e0 = e;
+		else
+			kmem_cache_free(ntfs_enode_cachep, e);
+	}
+
+right:
+	while (n) {
+		size_t next_end;
+
+		e = rb_entry(n, struct e_node, start.node);
+		if (e->start.key > *end_in)
+			break;
+
+		/* Remove right. */
+		next_end = e->start.key + e->count.key;
+		n = rb_next(n);
+		if (next_end > *end_in)
+			*end_in = next_end;
+		rb_erase(&e->start.node, &wnd->start_tree);
+		rb_erase(&e->count.node, &wnd->count_tree);
+		wnd->count -= 1;
+
+		if (!*e0)
+			*e0 = e;
+		else
+			kmem_cache_free(ntfs_enode_cachep, e);
+	}
+}
+
 /*
  * wnd_add_free_ext - Adds a new extent of free space.
  * @build:	1 when building tree.
@@ -243,58 +303,19 @@ static void wnd_add_free_ext(struct wnd_bitmap *wnd, size_t bit, size_t len,
 			return;
 		}
 	} else {
-		/* Try to find extent before 'bit'. */
-		n = rb_lookup(&wnd->start_tree, bit);
-
-		if (!n) {
-			n = rb_first(&wnd->start_tree);
-		} else {
-			e = rb_entry(n, struct e_node, start.node);
-			n = rb_next(n);
-			if (e->start.key + e->count.key == bit) {
-				/* Remove left. */
-				bit = e->start.key;
-				len += e->count.key;
-				rb_erase(&e->start.node, &wnd->start_tree);
-				rb_erase(&e->count.node, &wnd->count_tree);
-				wnd->count -= 1;
-				e0 = e;
-			}
-		}
-
-		while (n) {
-			size_t next_end;
-
-			e = rb_entry(n, struct e_node, start.node);
-			next_end = e->start.key + e->count.key;
-			if (e->start.key > end_in)
-				break;
-
-			/* Remove right. */
-			n = rb_next(n);
-			len += next_end - end_in;
-			end_in = next_end;
-			rb_erase(&e->start.node, &wnd->start_tree);
-			rb_erase(&e->count.node, &wnd->count_tree);
-			wnd->count -= 1;
-
-			if (!e0)
-				e0 = e;
-			else
-				kmem_cache_free(ntfs_enode_cachep, e);
-		}
+		wnd_merge_free_ext(wnd, &bit, &end_in, &e0);
 
 		if (wnd->uptodated != 1) {
+			size_t old_bit = bit, old_end = end_in;
+
 			/* Check bits before 'bit'. */
 			ib = wnd->zone_bit == wnd->zone_end ||
 					     bit < wnd->zone_end ?
 				     0 :
 				     wnd->zone_end;
 
-			while (bit > ib && wnd_is_free_hlp(wnd, bit - 1, 1)) {
+			while (bit > ib && wnd_is_free_hlp(wnd, bit - 1, 1))
 				bit -= 1;
-				len += 1;
-			}
 
 			/* Check bits after 'end_in'. */
 			ib = wnd->zone_bit == wnd->zone_end ||
@@ -302,11 +323,14 @@ static void wnd_add_free_ext(struct wnd_bitmap *wnd, size_t bit, size_t len,
 				     wnd->nbits :
 				     wnd->zone_bit;
 
-			while (end_in < ib && wnd_is_free_hlp(wnd, end_in, 1)) {
+			while (end_in < ib && wnd_is_free_hlp(wnd, end_in, 1))
 				end_in += 1;
-				len += 1;
-			}
+
+			/* The free bits can belong to extents of the tree. */
+			if (bit != old_bit || end_in != old_end)
+				wnd_merge_free_ext(wnd, &bit, &end_in, &e0);
 		}
+		len = end_in - bit;
 	}
 	/* Insert new fragment. */
 	if (wnd->count >= NTFS_MAX_WND_EXTENTS) {
-- 
2.56.0

