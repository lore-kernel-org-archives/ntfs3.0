Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A491624C0
	for <ntfs3@lists.linux.dev>; Wed,  1 Jul 2026 00:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864691; cv=none; b=ZRCFsrTymor/dn95BK/EUuyFZhh7QnXxhVDxjHfb37UqO6VrVTzEgX/kY79sdA9yK4yzzSa/+ujEQaLGIE0SQ/tvcWpjjp8ZMZ5X9OcVco7haBr0z96R9Fx9pc4L/Wbpzbdm6G1xQ2oj5rHuuvk6EhKlMADjKwy2TJJ51879n4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864691; c=relaxed/simple;
	bh=lARvSuawiV3hPRfc+1WuShqKRb08isXcI3sp8qVKngU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjR79hzLjQ1ArSi7BbCky/R4i93tKoXoRI6r4L2pYtUwPGjHU3QOQpr5mcvpPR03819rNAn626SDwquh4G2bEooy3ioXHqiP7pH8zupgsynKsOFQeHRV9YCFvb+0+7dTcFQkR52NyJ4MQeIR8dgJFMTwBZMMaB0SomrJJwlb8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBKk1MKn; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBKk1MKn"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9b95eda2cso63699a34.2
        for <ntfs3@lists.linux.dev>; Tue, 30 Jun 2026 17:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782864689; x=1783469489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vqoaRZS+wir94bOkLTsUmkUx9RZ3pvp4I8Lfye5kj8=;
        b=eBKk1MKnyhtQUFohQ0pNIIBi9V0Ma3DuMnGyxeF0y5uVXKokEy4sUpB3gv5/1zNdlW
         elJhZenVqZiSOJmGeh8pM5Bb5JGbiYHPVMfCbXl6uRwotgEnD6WkbVnV5bRNFT2jtHv/
         FP7KekCriHtBap399P+z4HOJ+S4lqybFxr8C0MALyWMQtgF42RqPXFB1AcvBZPKN5QZH
         P9rAncsSM2CyQaLvANzpIRVvYmYgV6QxyQjpqoVpJpUV9TbjTZVYK612J6aj/Yao/B3F
         BPwnnrsvRwb2nee7q7Ug2g3PNYKGWFwNArhGvNz1mCojK86mBACJmn20GkyPiCbLygpe
         pZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782864689; x=1783469489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vqoaRZS+wir94bOkLTsUmkUx9RZ3pvp4I8Lfye5kj8=;
        b=pTseJ60LKbC2rELiVYV7GAS4nLSWC+ezNQoNZV2eMVGrJzUxKyl0FaOyvDwCmkSauI
         Gz0WGZghwm37atPVkbne8IPiVX7Zx1XbG81eo95orIRi1jbY9tyw0xmxXLC6wFqBHUOW
         IWILDIXavNvYq4txCmOxpaOHptFyntdj+HA2xE30Ei+NzsbmsP3KqG66uAiFhjWDzWSv
         hMruCc01riTT4mxFEVqJlE6NBNBCCnd7H65oEWeUZ/uM0ZFFi7mK9Mzs5Q+ESzD0PBjf
         mcg9xfvxxSPRANVX/cTZsy5416hVIEWQ3uHOwhEk5nr5S+xz7ZB5hiWFoBWU4LM2RWLW
         hKGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Eh6AkbPQ+RAgA8ugoPnVGQD3pXwUc5+XwJ7Zad1q8NP4MFdcM6qfvZBe1qoBW4JV66WPBlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIlsstWFKxLm6GOPLB3zYaLiN8OoEAX5XBgGLVmJ0HhjZz4nf+
	CEBjVCIv5C33Rbkb5pWxuLczNpWbxLaELJ9vYiJCWAtaYIpvmG5OSomt
X-Gm-Gg: AfdE7ckFU/mVfNV/gmGXPiIUy8rWuWCVpTrgXxQLkfkC8s46FuTkltLnmX2tOoQ2X+a
	2v7D1rFXC4N03trA79Fyddts/EywC57EEZVdBOcRo2F7QUfYFN4Xe+iZcpoWD6yE9+w0xRuy6Zm
	i05W1RkwVyL+F8Jin+TwHBc/9p/xn6bwtOH9fr3++aa3wg2yhSzXofTJ3Y/b0ksQ3xWMJtdf3jz
	YQsJH32MviYe5SDvuGw5hgBPG+WrgRNhE4DyOdHPfGCIrVyAs/0zM+YDBWXURN6AycJCpC31Kyy
	GGuAtqx6/7quD6EhwwH0g2vxD+2yzNYxQ1mlR4XEuUfqb0oFDh7FPcG0kRwkWxWmeM3zZGGMC4p
	uIhJg+DqsBeWmpkjKTjgkOpwg/51/tAt5Cfpy0PM2I77JrMZviztCSEW0u3pHiooX59hebWLQFz
	9e4y8pJa14WPIFK4ZjdDhsRididhrnZN+TNEFQrWOR/ToJEVpxRVry7/veKd37/nJS
X-Received: by 2002:a05:6830:4901:b0:7e9:b537:102c with SMTP id 46e09a7af769-7e9ec743f22mr4579267a34.25.1782864689485;
        Tue, 30 Jun 2026 17:11:29 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4b::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9f328636dsm2558647a34.9.2026.06.30.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 17:11:28 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	hch@lst.de
Cc: djwong@kernel.org,
	willy@infradead.org,
	hsiangkao@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev (open list:NTFS3 FILESYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 04/18] ntfs3: convert iomap ops to ->iomap_next()
Date: Tue, 30 Jun 2026 17:09:19 -0700
Message-ID: <20260701000949.1666714-5-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260701000949.1666714-1-joannelkoong@gmail.com>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert ntfs3 iomap_ops to the new ->iomap_next() callback. This uses the
iomap_process() helper, which finishes the previous mapping if needed
and produces the next one. No functional changes are intended.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/ntfs3/inode.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index c43101cc064d..c5676c51a3a4 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -2101,9 +2101,15 @@ const struct address_space_operations ntfs_aops_cmpr = {
 	.invalidate_folio = iomap_invalidate_folio,
 };
 
+static int ntfs_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
+			   struct iomap *srcmap)
+{
+	return iomap_process(iter, iomap, srcmap, ntfs_iomap_begin,
+			     ntfs_iomap_end);
+}
+
 const struct iomap_ops ntfs_iomap_ops = {
-	.iomap_begin	= ntfs_iomap_begin,
-	.iomap_end	= ntfs_iomap_end,
+	.iomap_next	= ntfs_iomap_next,
 };
 
 const struct iomap_write_ops ntfs_iomap_folio_ops = {
-- 
2.52.0

