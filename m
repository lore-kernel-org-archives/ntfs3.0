Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793492575;
	b=PsJeC+qzivn7mk7cP56BxWa9qVtKIWVwUAjU5Wc1jER+xXlCjzpsI+FmIhTVSfqbdl3y
	 hj5jXrDSQVynXc4tbx+Rza7Rbi3BbuBu4/zWiUOwhSERnTPDo6W3sw/XfbkiIltMcEAaQ
	 JRtKKf9wMvEfRCttSpf+eBYfhroJ3LcczzABPTT8eDym/8WaVeVATHLTlVBqwHzteHYDL
	 4XylEYuvpKJWqMBdxEKTk+cxO6kZpQCrTI+Bnd9r7zuniyvYjKhyl8dF5BgtMpwmtK1/T
	 DgoFjV/OAhXyRCHrDWYc0vuEBG05Lg8p6soipYVQdJQu/3503nHn9VTQh/q314DHKEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793492575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iAN+RZ2zas5JcAoGByv9N9iIw6NxJqE3IMnDqczyNyA=;
	b=0wL6VGtWe/xfQtaI0Wt+TmlEwqGkoU2KjC2QsMEKn3ThARfHaizof8RtxDfYm9f5+v/5
	 TI5VZyzKoD694rRuEyTgKXVlVmoiICoOArOOtNDguzhiB7pVHe+f2EwS66mcHo84zO+w2
	 GC6Zi8SFfUelKChgTE5fKe0H4KZedE2JC8zHB32CRswkfrfsd+pSW32qFiIvPFrL6r4h+
	 5ztY1S/MYkp/6Cafqon7hKjdPuLgcE9cOq2kl/ZrQJx0wsBxZVS2eNRq9ZKr5nc+sDwxX
	 JYdrN0X5WR3fvlX9/MNMuoBqeTXlwTjQBhhXMvaWCHl9rZqN6WH3tQBbvSIgoQ4A1YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXcjY+HA;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDAD606A31A
	for <ntfs3@lists.linux.dev>; Sun,  1 Nov 2026 00:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXcjY+HA
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18393905e9.0
        for <ntfs3@lists.linux.dev>; Sat, 31 Oct 2026 17:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793492573; x=1794097373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAN+RZ2zas5JcAoGByv9N9iIw6NxJqE3IMnDqczyNyA=;
        b=UXcjY+HAyYmcllBxBqhPcsBcc5FxIILzS/A2HNwCsjT5+ign8hTbK+IsrbXK8oTBs3
         g6wyypEGvzQg9YUu064XzWQjM3XunCjBZyUW1OzoHH9/QMqAa9aIqhkmWW4LPWzpisRp
         Mfr4g7dJUiNI6FsPxbQQtTFTAW1C89XWTW7B5CMUrDebQWQIUUYMWZVQNgGPGszuZCVn
         iwLBy9i1PtiTavfTOJRVan/pBPazecd7mhk7Il/vdLFgPbIaldKBaTxZpuAaEmHiwsrp
         BqqPBOP4F+bYXKNda/j3QrdeOsUq743lYHLOegX/CI6bbzaCOX5Q5X/65G/lruBJipqk
         gH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793492573; x=1794097373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAN+RZ2zas5JcAoGByv9N9iIw6NxJqE3IMnDqczyNyA=;
        b=V9ZjtrsGBAvPew+7BlxMleAp3BWZoCDneZEUwvqmpP/CF1PXuadc82/t6AMAK/Hvlb
         K/FlaGvrhDXSxZf6Gw/h9gUVTzNnRtzAJw+q6F9R9oMt+IZ9DIp1NgUWCVXfDGmy3GEU
         ghKMECXQmMkyW2Ro8nU84HLkckRw75ZsA4eXji9KYiUvDP47sVsCTMLCAQ+KI0Wi2hJT
         Gkf9l+b6E6AFXnaEyp5NlwBgijuAhkByzwU1NbCM6HsAOcJlfkA9/5IWmFfkvGkI9mRj
         DoGy5YMj5ZTZikzfNhkUHyUH6pYOH8rjT1j+0B5AthS2d9ESiYxxC8BV/v9s+YFTLhEb
         nJ0g==
X-Forwarded-Encrypted: i=1; AKwUvBx1fD7XbYgZ04cDJijji3x7Kfg115cfeW7OP+35vijZLEcfoKEEw2tNZUxluC3u8CN4WDJm9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYI6N2sCFCFKERYQDrTX4BCEsYNP9ic2x2SnyWWF2wdgBqtqciCq
	x1cadDj54p/tkaTpF7vP/BQB4axf+Zw8S7QnhZCwNXtAwr1LZbj0UI/C
X-Gm-Gg: AYBFou3DIlbnFUX7NSh3DVSQxdGTJaTnFixddQA2iob6Fld0f+IXuT/txpOCunY8uz0
	AKswc2dof0GyaiQCNt+W9pW9WblCbwH4RPGplrXgwnArCrmssHdZj4R2mH+Di+CpN4Ss0gYmeDn
	zARgocsinh4wAAg0lZp4Kx00dfmV7zjjuBiPTaPdAlFCg5SmfH0JWTIZWAMJaTYn0gf2AZaIi3G
	B94BV2lil0Gr+KECNsDbgKLDLCvPj9x32tz+E+wCHQsa9hQRDDoCoaGd1Mf8vVepRptDsZ45ncJ
	Bbcdr1XH7FfM4LQFv9x44haCBMyT/i/97HtdP0ZrilhJHFuFOjZBzRMqU2+6iLrMYoKcX3llR3Y
	7XmBip4laelL9tWCXQXnY5L/nSzSovWssZI51IXAUMBj7SdNYcFoxCUxUIOFUORw1Y75FwnKwMI
	MczmzMf+unScoIEjegeUCjmDAN7fk1bXrVntHXjXBeNR0PSy34lrKzmyoq8XKPs/AMt/BNXChaN
	g8r1f9srRucbDZHHeHpu32icApJi2JYxrSrfiWkCikVt5zIsN5xrEG8KiDHrPTnhs9r1l9AjE1Y
	EcV+jFld3h5hAUz8yTCLj6HAPaA0WyKDtstRjrt6stkGlQ==
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr147069015e9.29.1793492573258;
        Sat, 31 Oct 2026 17:22:53 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm159019305e9.9.2026.10.31.17.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 17:22:52 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH] ntfs3: set .getattr in ntfs_link_inode_operations
Date: Sun,  1 Nov 2026 01:22:24 +0100
Message-ID: <20261101002224.677245-1-koray.fra@gmail.com>
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

When running stat (or calling statx() with AT_SYMLINK_NOFOLLOW) on a
symlink, ntfs3 doesn't report btime, cluster size or any other file
attribute because it falls back to generic_fillattr() without populating
those fields.

Fix this by setting ntfs_link_inode_operations.getattr to
ntfs_getattr().

Fixes: 82cae269cfa9530 ("fs/ntfs3: Add initialization of super block")
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Thanks

 fs/ntfs3/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 8adbdf1a7d11..0cc46c184ac6 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -2316,6 +2316,7 @@ static const char *ntfs_get_link(struct dentry *de, struct inode *inode,
 const struct inode_operations ntfs_link_inode_operations = {
 	.get_link	= ntfs_get_link,
 	.setattr	= ntfs_setattr,
+	.getattr	= ntfs_getattr,
 	.listxattr	= ntfs_listxattr,
 	.fileattr_get	= ntfs_fileattr_get,
 	.fileattr_set	= ntfs_fileattr_set,

base-commit: ee1cb3443cff5a800948b662756f75b17ca63fe2
-- 
2.56.0

