Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812D619D8B7
	for <ntfs3@lists.linux.dev>; Sun, 16 Feb 2025 20:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739739128; cv=none; b=EWHLHBem6hARozIlEMdrunnlMnx4dNfQuVfad2HoFWtGO9AaYG8Peyd7HVbCn1ar5ACnwQ+0+BM+qJUnMSllHCQDehp8qiHcFP5Lw2epupl7N0B21u0qXEOxPSWIqlrIi0FVpjZJ1zU4dC+PiyMWgfpGnfbeCep+JWXtsE3aHOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739739128; c=relaxed/simple;
	bh=NtGbrjrmznu2NSRW7WDGTNFMx2/QQx6TquE+W2bapjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SgbqHEevp+PnDSPxnDnhP67neRmM/Mm6RxFU7ys4xlT/iEjIsXF8VawsBU5kHXz8aJ+N6WytlMXqz8SpmAXNzgRxrMsaNSm5/MmBlet/t9Ks7FNtFtlgUZLIx35RHFV/QSJDdfVhdo6ri2lZcwXJSoAe1Nq4i60ndcNZFqwkeB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMOf6VLY; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMOf6VLY"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so6208942a12.2
        for <ntfs3@lists.linux.dev>; Sun, 16 Feb 2025 12:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739739125; x=1740343925; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwcNQNpK2HNYBvKAgWSMSPgBYr8v+ovYWYrUWEbnsrM=;
        b=nMOf6VLY1etBYZzkmHFBwInk0KWkjp+DsJq35jgnaG2YrkVjbFThp7lwYOAGyPeVTp
         vaJvOxwGD/hZSydZhiQP19oTztVnrATqbY9Z5bn8AdbD7YENYu8sOCfvc3A6E3EwaOF3
         UU8hHaJNz1UO1PKlSSytDIMOVeJ1/yDv9V8aKI97RGsZUUrbE2g9AalRh5Bfume2ZkLy
         IJMz0nMYqGB2qLLJPLlaWms6dVtv2P4Avs4kaDVZMsbw3jUjSwPfd3V+rpZzwDQU73K7
         j/XhiKW2mx7M/Cd1lOlQQ0ZCl0rSrueQhEpr+Rct6J6s1k/qj5zMRbJugQ2cKalUeZZo
         4+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739739125; x=1740343925;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwcNQNpK2HNYBvKAgWSMSPgBYr8v+ovYWYrUWEbnsrM=;
        b=mjPHDRPxiocIDpfms0u+YEPVNgksA4Azxk8JIYwIytj9hC14L1DUomh1yEnemVCH81
         WWn+HceJCdDoMkVcwvqMuDri7k5YTnnQT+rrYCZHlI3yo4HveoiNbtoU2BbkHzpc/yq9
         RWYBzW2bBDUR4iPiJkwfih+/LDQMkaBCCQOA1bSbQL9HZW2sv/cDxs64k6l2XdLkrk9q
         +b3IZ8rSdfzBeWxQ+OoxmLKUYJzTJuHmYlAvy3UzlFz3fu5PcMJpTPGGwE90dw/ceg/P
         NjzWN0/9bsSimtDllm0e+6Vn1lbKL/JtvlqdCM8sLA5jH3nV5h0YG/v6U8bInEnnxtZ6
         3FVg==
X-Gm-Message-State: AOJu0YwbCxm1/logJ19CUq0WALD6TYkNiO1WD1oEEla/ui305h+cc8GV
	Iwa4KfZUesDEmQuYmvrBMKegLvYp2nqE5fifxXmwapnj/NMutiS+f2wp7H5R+II=
X-Gm-Gg: ASbGncth2A/YN1EPoJgaJyYUxzlQJbkuowMkLk9OygyZ3TqzoQpqf5/PaaYyv5ryhcp
	jEkuv5TXdrYMscrv22A8IF/ie9CQHhKO7CL2FBV7/AmjjjAII3N5xgQE4gPE9W8Cb3xojhak4x8
	eYxHZ7R6a/Y6KBJ67eRLddI3hOXZBZhGKSxHWNcAVGxJw9JM4y+d5wETfPb3GFURiz4JhRkWCqr
	pfhmDuD85rls/lGW4j/0nJK22kzS4B3kMlkmNayz8vR8UBBy0Ja7oCe+Rg6ecS7wVT6aRoZ3fz4
	BOKTgvB6D/eUFtMFGkU+
X-Google-Smtp-Source: AGHT+IHgwYPj3iqat9vbldQSlkyDo1u1ykz7UQvzC8QUVDQndEh7Kshy5EEfZbLcYAkxQywWbeqVOA==
X-Received: by 2002:a17:907:1b0b:b0:ab7:ee47:9938 with SMTP id a640c23a62f3a-abb70dd9024mr765292366b.39.1739739124793;
        Sun, 16 Feb 2025 12:52:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb9b81aacdsm75610966b.104.2025.02.16.12.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 12:52:04 -0800 (PST)
Date: Sun, 16 Feb 2025 23:52:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Fix a couple integer overflows on 32bit systems
Message-ID: <3e34cf5a-e70c-4096-b516-661c2a836001@stanley.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

On 32bit systems the "off + sizeof(struct NTFS_DE)" addition can
have an integer wrapping issue.  Fix it by using size_add().

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ntfs3/index.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 7eb9fae22f8d..78d20e4baa2c 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -618,7 +618,7 @@ static bool index_hdr_check(const struct INDEX_HDR *hdr, u32 bytes)
 	u32 off = le32_to_cpu(hdr->de_off);
 
 	if (!IS_ALIGNED(off, 8) || tot > bytes || end > tot ||
-	    off + sizeof(struct NTFS_DE) > end) {
+	    size_add(off, sizeof(struct NTFS_DE)) > end) {
 		/* incorrect index buffer. */
 		return false;
 	}
@@ -736,7 +736,7 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 	if (end > total)
 		return NULL;
 
-	if (off + sizeof(struct NTFS_DE) > end)
+	if (size_add(off, sizeof(struct NTFS_DE)) > end)
 		return NULL;
 
 	e = Add2Ptr(hdr, off);
-- 
2.47.2

