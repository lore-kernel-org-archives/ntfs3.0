Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722873;
	b=lau9aBHBWeqwiGTGeiET75vpXHbuVhtJIH4JIuuBqOl1LzTzaFT0aKsK4dU4rOmlkREt
	 MWTpKLq76VQinGUDobDqryfvD83BcyvNZ4Td0QPSRUUOFghskWzn1CHzAilLYtug1lpFe
	 eNDT7WW2EUb/4tMQMnQ7c/ouXdmdrHBB/nRMXo42WdzSqu4GIpmMUEHK3pzJ+i+8vCJFV
	 FOLx+R5m4AURgLklrWMqlBQUBJDDJVHNbsgbhiw0aOKDielrvjHvgkUZ3EOPE9o3IroRY
	 3+aEPnJzSCJ4nYW4Ibbh6N8CNEOk0/ftXOswVBa5FXhagY7KkDgjANtEa6OzeLUUetQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=K+PeZm9tsGAqhp854CH7k9KBWOkxy9cTCDo0Ktot44Y=;
	b=WYb9YNROQ3A9mDaS6rqNl460/xW1SG9avRUV0ezqtff+wXdAwrTHeCF/sLwlHa7KhKTJ
	 ejunwtV30XvTEC+nOeuxpudWZIDW+xk7yQMo8Zv2RU++yQeiSC3SXYdW45WjX6vRE7Ep0
	 97Z5kNYNZpNmh8MjbOdrI5vRM1HbGUdBuvvQaCC4G64/sDVhqVDb5D9f69+2zJxYm1wfd
	 2mPguXj6LfxoEaeStuNTYXICsDASuTpEycJ9mIIg9A8rONS/m4kdD5xTeqzg2Hqs73L57
	 MoEY3X2YVIzidctas5mgRsePRR1a69K7UEpbmRobWVGDIkxlP2XU68ijrXjS84phAfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AX3+Om9a;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC280606A31A
	for <ntfs3@lists.linux.dev>; Fri, 23 Oct 2026 02:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC280606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AX3+Om9a
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so336516a91.3
        for <ntfs3@lists.linux.dev>; Thu, 22 Oct 2026 19:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792722872; x=1793327672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+PeZm9tsGAqhp854CH7k9KBWOkxy9cTCDo0Ktot44Y=;
        b=AX3+Om9a88NkYIx31TIQZArfri6Gvn8XiaDFXZg2AePTe3jr5GUvoRffDqGvMPP2dZ
         b89eSsKKvEC5lY5Qddv25zYsV1LFS63u11hnrde+CtMAzxYp7NkEmRKKtmsZk61KcvQq
         7ziMNJyHIOoJtcMiNeOndxE1B6BzI4JW9huaa3Ju7GvumLE/UJ5pYHR5gchGtX/F48sd
         n4wEL6dRhWzlHPPAFsFR2mXvzMa+w/hHflzQICTOsvc4ta/pd7Vj5D9keo6AjL1tIrpR
         XGvIyTON2rEt1XV1VBNSm46PBwVaFZn4zWRCCvC84CEm3suo1cSN4oT5ggdtDizXFOVU
         hrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722872; x=1793327672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+PeZm9tsGAqhp854CH7k9KBWOkxy9cTCDo0Ktot44Y=;
        b=Plma5GwcJfg7iHHquPGumWl25Ouc5NmmJo6IwOkmkRdk1+jswoy8j3G+DaMGISIvca
         n6fCxIPQw9/AaH/HsJDRYDWn/dwGxTbdMoZjBpLs7mT6cCyudvibqeNAqX+HT8sqF6jK
         /iC/68QHQvj0rNeDJmf4uKY7RN1rnHTsjfN0cCnSSl6FyPFzGD3wq+UloZIQjZE/RcVi
         iYpogwq348WefeP1vWJV+ZKoqTzRgEpCwPeORuW6wmhDO5PRBm1jh1Dz0MvzkF7a/1CV
         ciIY7kYesrHTq8XzWx0ecO1DL6x2//Vgoe47wKkaJ9Z/4TLPXNdKc4LD5eSEiyZoYzcP
         iFbQ==
X-Gm-Message-State: AFq9FYKQwv7kbzlN3Zvg8O84Y34qpFhQ5SsNLVbvB64/wjcmID6hqspP
	7/uwN+7CwJ6OpLTdKcr0tTrd9KjnOtonRS4Ngf8ErRfNMHpjs0vy73eR
X-Gm-Gg: AYBFou2tYCyiUwNdysDRmxWKWMvNCCcYjMvEAmuAguq/xeiqlVEYbhNHMtL2/IIEos0
	vu585rIS7UpPlmNVrlg0YWfIEKCGdpp9cCknaI5wcjFptqkDgM1NcM/1ftEtEtOGtixuNhhZdci
	xs5tGen5/oOgQp2Bg+HFJCrAHMif4/e4JuY1/fyKDgneegu6YuElulI7DSwSKlfA4A5vJKDkR1M
	E5wugJshw8Lglb2hdkIwzEZVCcWVtcfAsJP3Z7JuxT0xLIyL2T/MhKavigNIpGv8cZP99Li1OqE
	7wILF8zKWH3SCZj8ba9sqb6I6LJXgbbqONy5AR/1e2CwjT625ZdzJV1H5hFoMuMl2K+U75YyeIP
	SlL+bZekh4jRw7U0Wlolu85RiMzQQs7zhViuEXRyF5dXVdLkwFo06J0vLHOgHjC8T46AXKqDb3B
	sexkbQukXUNw28+cVH3TKOsY7K7sdfXgg1REVmRr5yNGcL9vB6KpsdA+hc3lFD0aKJn0KYDsPk2
	F/WSG7nv9S3XzAfhHLz6UDEFuQ+eTPamJrzziZBuKAZ0YDWR9d8TH6clRVUxk4mOFPVHvL/3YmF
	Dy5OZwIEXVlWy9Ik0Q==
X-Received: by 2002:a17:90b:5108:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3adce0cfdc4mr660962a91.41.1792722872119;
        Thu, 22 Oct 2026 19:34:32 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490c096sm6544867a91.7.2026.10.22.19.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:34:31 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix cluster over-free on allocation failure
Date: Fri, 23 Oct 2026 10:34:24 +0800
Message-ID: <20261023023424.4003943-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_look_for_free_space() returns in @flen how many clusters it marked
used, which is fewer than the requested @len whenever wnd_find() falls
back to the longest free run it could find.  That run is maximal, so the
cluster just past it is in use.  The undo path after a failed
run_add_entry() frees @len, releasing clusters that are still referenced,
and a later allocation can hand them out again.

run_add_entry() fails only when its kvmalloc() does.

Commit 0e5b044cbf3a ("fs/ntfs3: Refactoring attr_set_size to restore
after errors") replaced wnd_set_free(wnd, lcn, flen) here with
mark_as_free_ex(sbi, lcn, len, false).  Use @flen again.

Fixes: 0e5b044cbf3a ("fs/ntfs3: Refactoring attr_set_size to restore after errors")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206ffa..fefd201809a5 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -199,7 +199,7 @@ int attr_allocate_clusters(struct ntfs_sb_info *sbi, struct runs_tree *run,
 		if (!run_add_entry(run, vcn, lcn, flen, opt & ALLOCATE_MFT)) {
 undo_alloc:
 			/* Undo last 'ntfs_look_for_free_space' */
-			mark_as_free_ex(sbi, lcn, len, false);
+			mark_as_free_ex(sbi, lcn, flen, false);
 			err = -ENOMEM;
 			goto out;
 		}

base-commit: 3ac032ef6ca8e47bb06d1e189dfcf88fa0a09c75
-- 
2.43.0

