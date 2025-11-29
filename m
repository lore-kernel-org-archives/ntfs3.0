Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A0927F19F
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764406917; cv=none; b=G1ti/ni9ZAwYlbUq2S7pZ5vEzqK7fFWemPvgpKM0MneDINy9jJSZOdvZ9iO4HczFZZDmXiLinX7kS5Uo6Uz7+7wqO1UenGYCBBYFyMYz9c19eZTOb9pVtrNi4+iwVYT0eHtOgu+/lnLX28S32pkH622+EjtvcA9jo78XjLQ4/F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764406917; c=relaxed/simple;
	bh=pDPxpgP4y7Y34S846UZ5pdageZyT3VDirSvStDnHRd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EByR372wGzATq8fzQusUMjhQ9htpPmr+gX0ZjlwEvFo3EhHO2IhhFZxJS+osLSIFHwiHMdJWsLHCVTurVUxAXmQQV7jUhrQWfLzKhsf4VyqfLaUc4Gs7qK7Bg/luoblkfHrraVCP6gBlq15Ik4kZGMl8gbVXZAKGUEcn/HQB1HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2YqC761; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2YqC761"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo3105180b3a.2
        for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 01:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764406914; x=1765011714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8NoibJSiNHVArlLUK5xHvDn/GmQ96N4NjNkgGx3wcU=;
        b=C2YqC761RRTtyWTafyi0fvX+mfVMRgUn1MtR+FG4FixD/fh5+R6Ni9FwZYRtEX4cjg
         z7dVEjRJhj1mHe2ky2gztcsKF5nBdhDjRDRanFQPe+LyMKnu/pPx1Vm0N+jCXm3QD0+5
         gYxIBcBsyn50pAx43SLabSp3hty5DNrWfi9DnGXy5O+UrCDi9s9OlGVgcJedsFWHHkMm
         d2R8G6w+w+97luYXy1Mgpp5+BaUYpJ6rjf6x/ulqReFNpqdwaHruFWWwyr7A3HTpxkPs
         1b0h2stj/O/03OT+KWq7ATTGyy8CAm9eiyaiukk24rSckIpbS301Y2PYIj292legny9q
         03VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764406914; x=1765011714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t8NoibJSiNHVArlLUK5xHvDn/GmQ96N4NjNkgGx3wcU=;
        b=lhf+svD35Rs6KdeEm8J6vwkbAsps4rMBNgGQV5z63hiJrpJrZMjsypd0cBdvHxnQYV
         pRl0Bp85bG6EaGzLeVYOokPsIs9IDd8PJJtzmnhG8KJKw7cNnfV7e8DmQ6MOAyq8nxUe
         FHYuoiaBw71iGJvJEftfOgcihgSPCdLuYl43yHqIMds14br5Cjat28Ke8TAkTL/zpUou
         uz48SzZXF/5oBYcGp01lrWA0TivwQenDbCZgUKVrrBlzv653oM5sY+dCc14cMEy0zTaM
         DDciMY80D7TGpRSw4tgOgxW3zVLmfF7Xc3dubSm4/KXU5MZjFFMoTjk82ZajY5GNZfaX
         E88g==
X-Forwarded-Encrypted: i=1; AJvYcCXXZefiDHuaHC/+QbpgvPAkEC/9eT6Js6dNKBWzHAcxMzDg7F7mrXXQNEogxPv0AWeUw8tu6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvOJuPPyrXKpreC9zVJAO/uOsc12aeaczwGcOqPdGCS/p1bY+H
	hngYAglcKIyLAlW4kRH5+sKp3ilIApcKerzY72JpDdtbj/QW/GL4tJr2
X-Gm-Gg: ASbGncsBcOACLNaIYCfrZ+sR8NXOtSsNK+GGDXLr7rdZ020HdhnWTI4fJdtDRLhqij2
	+X4LJE5CdLEddqZ0dd/CpBBtHo1EpfS+lAb38L2A7mv6ZyN52IR2Tb6Qax+Z03hHEc8dWlTv2p+
	lZHlZUbsIZlCOh+dGCCngoDcyRu9fHFlSGVYhbObprs2zjXyQfNNheYrFTssFWeTZwpsoYt3Rmm
	jo8NntBfVFTyI1RmYYhmsdsTzqyOZM7HkMRWFDeycqRSA4aEJ4IsX5epF5JQ9D4/bW5YG2mxHrL
	M169cxZc7Crk8WlQJM/3IBA5i9WmYhSNVkE3eUOR7148rOeZuTxsWdw6ZPfAz7HiIvW2S2D6lpY
	kDposZNPac/al3Ani3DR6Yl7oB0qeBp+Jb6XT1YSomGTr/bUB5sHPsjpMtLzJ2v6NRRjYCwTeVo
	GGcbXVIOgGb0in1WwT4zaebjnsHoB3wvAxLgV6
X-Google-Smtp-Source: AGHT+IG2wahiB2PBWVfrDNRf7p52lLBDrzQQGimm/4V6gX8Dcmjw91342gxhdzWR3iErnl9Stx9Lzw==
X-Received: by 2002:a05:7022:3c84:b0:119:e569:f277 with SMTP id a92af1059eb24-11c9d864eddmr16724097c88.32.1764406914041;
        Sat, 29 Nov 2025 01:01:54 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm28114394c88.0.2025.11.29.01.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:01:53 -0800 (PST)
From: zhangshida <starzhangzsd@gmail.com>
X-Google-Original-From: zhangshida <zhangshida@kylinos.cn>
To: Johannes.Thumshirn@wdc.com,
	hch@infradead.org,
	agruenba@redhat.com,
	ming.lei@redhat.com,
	hsiangkao@linux.alibaba.com,
	csander@purestorage.com
Cc: linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	nvdimm@lists.linux.dev,
	virtualization@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangshida@kylinos.cn,
	starzhangzsd@gmail.com
Subject: [PATCH v3 4/9] block: export bio_chain_and_submit
Date: Sat, 29 Nov 2025 17:01:17 +0800
Message-Id: <20251129090122.2457896-5-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251129090122.2457896-1-zhangshida@kylinos.cn>
References: <20251129090122.2457896-1-zhangshida@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shida Zhang <zhangshida@kylinos.cn>

Export the bio_chain_and_submit function to make it available as a
common utility. This will allow replacing repetitive bio chaining
patterns found in multiple locations throughout the codebase.

Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 block/bio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/bio.c b/block/bio.c
index 097c1cd2054..7aa4a1d3672 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -368,6 +368,7 @@ struct bio *bio_chain_and_submit(struct bio *prev, struct bio *new)
 	}
 	return new;
 }
+EXPORT_SYMBOL_GPL(bio_chain_and_submit);
 
 struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
 		unsigned int nr_pages, blk_opf_t opf, gfp_t gfp)
-- 
2.34.1

