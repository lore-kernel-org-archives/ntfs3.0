Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC7F3FC0
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 14:28:55 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id s3so16865054ljp.11
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XsEUb4i0UZiEHWMRMSPWGXQkcz0r9bMyZf/QmVFGIfw=;
        b=Tc8svVaVugRu85UV8OtdL2R5U5yJ/XHZXBb9mDEevh3QXNwn9pZ/zGV+yZPrssT5/Y
         qZ5FhIG72J6N+8fq03SpO8olGi+JlxmAYhGr2TBpSvH5jW80I+uSJUpxsNvGsdUJRR0G
         f+eeDJaLO4qTkWmw9KkSImiXgltJwDJznqaWuSN62qEV3xyWCpYG8Q/pyta2HztQ/zDV
         WnyJPHPp1hSbeE+B11XVCU+4nISWqN94Ky1D22qZpdxxgbyn/7JafVUD5S6KjivKdEQy
         6fvHP9TrZxGUe8eMY4mvJ/LW3cK4KLxQQegN+tA9yB2AKz5hs2cUvWRaVq1kg4ioO8aD
         qezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XsEUb4i0UZiEHWMRMSPWGXQkcz0r9bMyZf/QmVFGIfw=;
        b=cLAqmZByctHO8NACs8vi+l/JEXlEUhuxhsWi14+vZfPiNlqe1X2zrs7HrdnvMUa5DS
         noBHnbQVsaZduENWOmyYkbHpbi8gnJ1jR4zv8m7jMFV97USwFVGcPMRM2r5k/OC9WLf2
         DrV+PwMnD+pLvt36wYC/kIXQZYCLEUvnSt2mGtuo6VXMhXkYmImSiCpfdzMia1yMg/mD
         g367/OckLpCAOm9nQuLbGEKdXfAwQOlvqbA4FQoxWZLZ8f/gCuNkwEGc91E1G9PePMm1
         Gks+oCCTkY/m1FwRw3wHw2Rg9xsHhcZDzB8Km9L+tEHCKcREt9PW7ebAND2S3LirPllL
         Pvyw==
X-Gm-Message-State: AOAM532W2ApvKU+mOlzL7U3Gl15m+YLQrdHLcT9099DLRxJXHjMKcclX
	+d2P4cWNoT8bF84BHgQvGlI=
X-Google-Smtp-Source: ABdhPJzLSJk3/CorSyD+j6UH8YbIlfCOXkDBNK6GrQvmGwkZMGtERmliZJWYLz0akxkuFHbIUf9u2w==
X-Received: by 2002:a2e:a584:: with SMTP id m4mr14598197ljp.518.1631024933370;
        Tue, 07 Sep 2021 07:28:53 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id l11sm1014251lfg.39.2021.09.07.07.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:28:53 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] fs/ntfs3: Remove always false condition check
Date: Tue,  7 Sep 2021 17:28:40 +0300
Message-Id: <20210907142842.133181-3-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907142842.133181-1-kari.argillander@gmail.com>
References: <20210907142842.133181-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We do not need this check as this is same thing as
NTFS_MIN_MFT_ZONE > zlen. We already check NTFS_MIN_MFT_ZONE <= zlen and
exit because is too big request. Remove it so code is cleaner.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/fsntfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index ae7c6435d7bc..99d0a2799b0e 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -423,11 +423,8 @@ int ntfs_look_for_free_space(struct ntfs_sb_info *sbi, CLST lcn, CLST len,
 	ztrim = len > zlen ? zlen : (len > zlen2 ? len : zlen2);
 	new_zlen = zlen - ztrim;
 
-	if (new_zlen < NTFS_MIN_MFT_ZONE) {
+	if (new_zlen < NTFS_MIN_MFT_ZONE)
 		new_zlen = NTFS_MIN_MFT_ZONE;
-		if (new_zlen > zlen)
-			new_zlen = zlen;
-	}
 
 	wnd_zone_set(wnd, zlcn, new_zlen);
 
-- 
2.25.1

