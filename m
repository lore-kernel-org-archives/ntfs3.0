Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3A33B6C3
	for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713096; cv=none; b=NlpE0QxHNxQujZ227ytynrA34GhA5gpPt/Owk69dcb407SfDlTEtk0qH8XuqSzczUlj/B3kxf3j6okjs4jqZxc7h3Fx8hMvNjD5QfMJIgKZg+uZzg+rP548Fp5mvQ0rL19iBYhkDc/kAerwfuA86eMWGlMtN9aMeLDwpmf3TMKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713096; c=relaxed/simple;
	bh=/P1RYgORKxwE9EU9V7IqZbnP/9QJ+9L8NguSmQu/jJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NX60KWvlUCkUB8KPNhZdOU6o3Z0aVYlRnc4vm8zSxB8CjOnuV28ckRg9CQqz+nzSrOoNFi3YkV1m7Mwc0qWnRnmg2gZo7zY9qj3AmiHHU45fRIKtHtHqPJP3eSpRzCU1/1VSfBWIEdafSUBQKLOUV3p+SG46xtIvf/2mQkJODNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux4cdNZh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux4cdNZh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ba2450aba80so989043a12.1
        for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 00:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763713092; x=1764317892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2hQwsn6Sms438Pv0Q4ngdJSSkLE/b11prNvkoKJDYo=;
        b=Ux4cdNZhOIRxJHlRCny6td3/DzWatVslk3asCxXsD2aD6hdz59p8GjJP23zVwuMilf
         N3ga6/vIFhOb5/IW8NXv4qgP8wl694CafA+Mi4pOM6dhEp9p8SCrrukojIykaIo7ZKva
         uuFN+9KU9ithdxb7YuL1ajag6EWwRkqkexOpmridCxuP+6CIBSl7Tg6IrEkMslZj/2Hq
         19mgbnDYrCSFi3W7+U7vBkVUziM0fRiKR/TK7V2hRvOlJAZLsMIXwu8LAZThNrpawnUS
         AwR3d1PvjaTw9G6y+ljlYiv6h5BgvtRv355eaNCeL2EQSpHZMaTFKS7hNw98rfWqKVC1
         B74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713092; x=1764317892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2hQwsn6Sms438Pv0Q4ngdJSSkLE/b11prNvkoKJDYo=;
        b=YLkIUYfbH1M4qF7DCOVwYemqzORLdGRk150TwBYSESS/0FQqGS05LKoOYCyYKI/vwd
         qUCMBoo8k+Vanx51ZVqEotFp2lM/iT4nyatWnZomUAj1ngaLVgpP8SZX1rb+dUj6kjF3
         ie+H7j5q4g+Pza3Lg4A1kE47iPmOhFUmER7z4S5PZB994QRev0P58QzFqdbqSZU1Bcgc
         p3Tn4HYQR9hgaNRq12JIhpIY9zT9xElkduiDFMliM7K7P89meMAemKo0GEI/5ez9X7jv
         P7Y9ujOw0dZ2lqsiBZuGDeDvAOch/GgaxXi2JzQn7BqSzUfgRf5XBLhSvBCk5S9PF3Gp
         q5+g==
X-Forwarded-Encrypted: i=1; AJvYcCXqj+wtA2Dcg/bFTlzJLzR5PH7ucHsnK1nlV5wBVeORHg7pk8rGv1GZ1Gi85Fe+DOeoBpu3ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeggcYeWH5tzmu3BB3+GGe+AukYmQEdY0TAFZNfPOB/LwDC+a6
	5u6/nfxAGkH059KP2Ztqb3xKst8c0lzn4scuwMhjTWCmFQav/rfo2rq3
X-Gm-Gg: ASbGncvZflnrmPj5Xy57nByEH62GRh7+k7lIQmbl5/OV3kbjlxXaMUXPafwOqYFMyr8
	cUKBDsV8nVFy2Y/Y3NV6kYI+vOoFgJ85urDWZmlDApZrdcZ6u2+zxgHF1gDIVw+Ihvsp4NU2SXP
	D+x9Xv1RwfsO2DKOxRI/qQTlMbJLwUaudB7NYjWR29qluLbBxqBKZGVUp1BEOE4B/Lwc3gY1Ntj
	Uu0B/J1vQFrA4JG2E0PY1yqiLSKjadGl10fI9qfvQv0DpYLnSfZNGVsLdWl1PGCrlBFlxiNOTDn
	hWN+NrL9H6Vwo3OOcmdKYYdT9RCCFto9S5TlwdobHZSM1yk2uMBQqQDigeXaJD7h6DuqiQ9tRAS
	eRu+BKht/9QfFu3un//w+tMVosuDhZMMBDLS4fxM9+35vsXCUi5n4z5LHU163K9a3IhS4SdOot+
	VQoaXiBwnXC5b1qbkjiK+HyzF5Qw==
X-Google-Smtp-Source: AGHT+IENbSLlagXc9NX/smNIF96UgKjh9NXUi+KBRvhy18+CUMO6BxslQvGRE/2mRUDvnGhRtmvCRg==
X-Received: by 2002:a05:7022:ba1:b0:11b:b3a1:713c with SMTP id a92af1059eb24-11c9d60d20cmr498283c88.9.1763713092239;
        Fri, 21 Nov 2025 00:18:12 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm20997352c88.7.2025.11.21.00.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:18:11 -0800 (PST)
From: zhangshida <starzhangzsd@gmail.com>
X-Google-Original-From: zhangshida <zhangshida@kylinos.cn>
To: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org,
	nvdimm@lists.linux.dev,
	virtualization@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	gfs2@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	zhangshida@kylinos.cn,
	starzhangzsd@gmail.com
Subject: [PATCH 2/9] block: export bio_chain_and_submit
Date: Fri, 21 Nov 2025 16:17:41 +0800
Message-Id: <20251121081748.1443507-3-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121081748.1443507-1-zhangshida@kylinos.cn>
References: <20251121081748.1443507-1-zhangshida@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shida Zhang <zhangshida@kylinos.cn>

Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 block/bio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/bio.c b/block/bio.c
index 55c2c1a0020..a6912aa8d69 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -363,6 +363,7 @@ struct bio *bio_chain_and_submit(struct bio *prev, struct bio *new)
 	}
 	return new;
 }
+EXPORT_SYMBOL_GPL(bio_chain_and_submit);
 
 struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
 		unsigned int nr_pages, blk_opf_t opf, gfp_t gfp)
-- 
2.34.1

