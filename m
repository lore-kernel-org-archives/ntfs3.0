Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A5199D8
	for <ntfs3@lists.linux.dev>; Fri, 17 Apr 2026 23:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468790; cv=none; b=IX0mxLBIIeF2pQg4JX9uYU034QFybhxxikdM16yvBNre7ooa46oKsR1MrrW+Uvs8em1x+0sK8cp3XfsLFIYajm/u+OMN1CDzmNGepFoEKw9uolQor09A7StSYFg64natDep5zElRYNYooSaaKkzUU8hW+1d6+f4YkFraj9G40x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468790; c=relaxed/simple;
	bh=ZEi/cXh1iFeFEuzHRRsXi1pBdEeLdy+9xs/YHLYCT44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCv4Jc3S36Neezm870oiTZ9k64Zy3ubBEvudvrhWFHdPpeJ58C/eO7Qg8cBapgWgqnvt1gbxTbccEkyhk2NXPB7ypJYjzsemPeLLxjdLn4N23UV0YMWtrz8OSN1/LohLlMG5ddh7pjFVa+etojhz+dMNrGliidFUJICgUAs6Ob4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaslzxHK; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaslzxHK"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899a9f445cbso13969566d6.0
        for <ntfs3@lists.linux.dev>; Fri, 17 Apr 2026 16:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776468788; x=1777073588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWzyw9UpnNiqz+F9Ms8EKKcgZP/weNGJV02JLocqn4U=;
        b=GaslzxHKsxDM1IlvG5zdoD/tPPl8Xj35eI0Lha2VKnPGLK5YiPdxuHTZiDaRwnfBdh
         +U4WWS9/2lOXZx4/K6JlCFL7E/OR603SHuIUizK1g3mSRKuxzUWJi0M/FF6MqlqcCFnj
         xmKPVAodocL89DBw/BypzmpX0Zj78/PRTcsUVPokZj3pS1CMl5MAwGKUHjSG57WCmD40
         uevSZATRFlccpOlZrfqDkjiLXnq//eZtDSl0PogcUJ4vzOfC1pRlrXEWLKKnWb20+EXZ
         uezJ7PfggY586RPiuPNjCI3P9/MxueF9wKJXBOoWUBPAdxPsSdNYIgdzFrmyNZCBjAwy
         LmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468788; x=1777073588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWzyw9UpnNiqz+F9Ms8EKKcgZP/weNGJV02JLocqn4U=;
        b=B3wDa9gGmGawX8wMyRy3jEvTbdGjoCKqVFm4XnLyTUFq+4OZwBuT2Kkfhx0JTw0xYg
         YgpTvPTqQhrTC7PzSNL89MTkXfnXozRJn7Q+xiGq9Lhqs2+CISGokNoI0kX+5atmA0GE
         1WbZZae/Q6OtKce5k2gTfFnWw6lHU237pQqRm99cb6zYnj1SjtCw8asTa6Y8l9EOFzb3
         QKM+XpWIOvCmPvRHJOLLyE6xrlrI1CEInlXymjS2E+SB87AF1jeYmYHxhggvNMs01sdM
         2mwbXPDjHscDvkQqF90GDDxNyUZu/tHssZ52R4bweEodbl05ac9pi3zyV73pwjtpTsDM
         BbaQ==
X-Gm-Message-State: AOJu0YzwALH2OV1H+ZRTsWSVQGS2KBrXxohp7kgLeyoClJIN+I6M9wEW
	lu70OnIfhYPDBBJLnb0d+UnEA4nQj+UtztsSl3XkExIQEMWP63LbHyfy
X-Gm-Gg: AeBDiesokrjtS9OhE5RgmAxBuzFL/Vo/ml1Yihmh4QIUO4ycoWXY2ID0WBu1F+P3hKV
	7IgyyExALyzhuN0IQ9Qzzj7HVNAT80ONjdFP/woALLUFHfiyWu6MPNr6L0H+PlJFFu+xxMcGY1o
	6oZhtc8/4cUJNiodnSdS34gzmZXoHNFlgnNvyNg2r2rcjF9EnT+a8swj4JaHSAIiwPjefqhN+W+
	EvuL0rHaX1kOSbP8psV3gZjN41GXzfw5V6kfm0Hs2Ens0+outXVVzHt7Qq0qcQFVHAx+tS1i9N1
	nl6FxJuOIBEftyzPqHPEvysTsfDOt2fX1ORRBBe1+ton+p5ZwaF89Y5u2iV/Nm73V2Yp4lbCA92
	M5LZIF1XRRvERlL66OpY+dyD0j6mBktmbYgid7EVMmem6coAafvaN2bKW7puW4vYhuSizpbutsM
	pkrqVtE9JEcEMxtlul9RRGOvqnusNjL6h3i7XyS5xOwcd6nA8zvv+r+KLSW4Qfzs/C2Sam5a6e0
	hDBbZlUFhJDUW+lO8GSd3sKJd+zPBGWz39dnfv/8V6KyUKrgsQYsg==
X-Received: by 2002:a05:6214:8085:b0:8ac:a2f6:fbf7 with SMTP id 6a1803df08f44-8b02812ba4amr64724626d6.40.1776468787802;
        Fri, 17 Apr 2026 16:33:07 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429e9sm21701246d6.3.2026.04.17.16.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:33:07 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ntfs3: bound to_move in indx_insert_into_root before hdr_insert_head
Date: Fri, 17 Apr 2026 19:33:05 -0400
Message-ID: <20260417233305.1787096-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

indx_insert_into_root() promotes a full resident $INDEX_ROOT into
$INDEX_ALLOCATION and copies all non-last resident root entries into
a newly allocated INDEX_BUFFER via hdr_insert_head(). The source
byte count 'to_move' is summed from the on-disk resident entry sizes
and is independent of the destination buffer size, which comes from
root->index_block_size (via indx->index_bits).

A crafted NTFS image that keeps a valid, full resident root but
shrinks root->index_block_size down to 512 after the root has been
populated makes hdr_insert_head() memcpy attacker-controlled resident
entry bytes past the end of the kmalloc(1u << indx->index_bits)
allocation returned by indx_new(). For a 512-byte destination and a
resident root whose non-last entries total 560 bytes, the memcpy
overruns by 120 bytes and a following memmove extends the highest
written offset to 136 bytes past the allocation. The overflow bytes
are a direct copy of on-disk entries (via kmemdup), so they are
fully attacker-controlled.

The write is reachable from unprivileged open(O_CREAT) on a mounted
crafted NTFS image: a single sufficiently long create in a directory
whose resident root is already full forces root promotion and
triggers the copy.

This is a controlled out-of-bounds write of 120-136 bytes past a
kmalloc(index_block_size) allocation, with attacker-controlled
content. It is a bounded adjacent-heap corruption primitive; it is
not an arbitrary-address write. Successful exploitation into a named
victim object depends on the surrounding slab layout.

Reject the copy at the sink. The destination's INDEX_HDR already
reports hdr_total (the payload capacity of the new buffer) and
hdr_used (the bytes already consumed by the terminal END entry
installed by indx_new()); require that to_move fits in the remaining
payload before calling hdr_insert_head(). On mismatch, fail with
-EINVAL and mark the filesystem as having a detected on-disk
inconsistency, which is the same behaviour as the surrounding
validation in this function.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---

 - FYI, like the sp_size patch, I have a larger refactor that might
   make this easier to avoid long term.  It's a mount-time variant
   that adds the cross-check between root->index_block_size and
   the resident root attribute size to indx_init() instead of the
   sink, closing the whole "root entries do not fit declared
   index_block_size" class for any future caller that reaches
   hdr_insert_head from elsewhere.  Happy to send it as v2 if
   you prefer the wider change;  otherwise, this minimal guard is
   scoped to the minimal memcpy overrun site and is easier to
   backport.

 fs/ntfs3/index.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 2c43e7c27861..b7633b721d19 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1740,6 +1740,22 @@ static int indx_insert_into_root(struct ntfs_index *indx, struct ntfs_inode *ni,
 	hdr_used = le32_to_cpu(hdr->used);
 	hdr_total = le32_to_cpu(hdr->total);
 
+	/*
+	 * The destination INDEX_BUFFER has 'hdr_total' bytes of payload
+	 * available after the header, of which 'hdr_used' are already
+	 * consumed by the single terminal END entry installed by
+	 * indx_new(). A crafted image can present a resident root whose
+	 * non-last entries (summing to 'to_move') exceed what fits in
+	 * this buffer; copying them unchecked would overrun the
+	 * kmalloc(1u << indx->index_bits) allocation backing the new
+	 * buffer. Reject the copy in that case.
+	 */
+	if (to_move > hdr_total - hdr_used) {
+		err = -EINVAL;
+		ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
+		goto out_put_n;
+	}
+
 	/* Copy root entries into new buffer. */
 	hdr_insert_head(hdr, re, to_move);
 
-- 
2.53.0

