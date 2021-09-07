Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE572
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 08:34:53 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id k13so18080650lfv.2
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UJApqLngxfd7a6IDA3UxDk/w6qCztaloZ9E8eyhf+ng=;
        b=L2Pt53KMeQrpffXx4u4xBfRkHxzSCo70c1lGMrE4GGJa6EVbAdGx20+4QaNMi/3yPD
         a68eE9Jxt62Mp67DO/1SvMcB9KjPKEo5VCvQacTzyfUymLcba3uJg6dHsI7/ElxFKWrQ
         ihnES8LqLchUk4WT3G1E3+Jyif7VJV1pOAN3SS3KWhxw/R1XNzKSauWn4HvpxrYdYaY+
         jQBTwm49gQ4qJj2caP3a6N2IN45DsVWhDf0Dm9YCU9J5dQ/3l5kSVWpA1TDYd+talUPo
         HGlKfFPB9j1xT38TgAGQbflsilsdbywDcNpvtad94Rtrc1+TrPORCs+RGEOFlpaRNssE
         EaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UJApqLngxfd7a6IDA3UxDk/w6qCztaloZ9E8eyhf+ng=;
        b=tXKufuvd+CAEadK9C0wBweL5R3HYpnQjmRCS/BHdSTjU3alxSHIHL2Aquk4mZ2GqjP
         2VfDbxoDuwQALqxDsH7208LAN06EglWYr92gitBlR1FHiYUAo0PwJWoW/CalfjHrNFfz
         n/XU+CIUa0NkBmuIuK/9O5zJ5zd+rgxtZQWdtPk78kR8eSKzc1fXvOFWqUF/gHesNf4+
         sjyIHWKOWOHZ7+ng/IFi2ap3EOFCx//4ysMthIzexRBGQ51g/n5n53DEgwBP6a2y3EYR
         coIfzCFUpJZzEvp2EqbcpDbatikGK8ZTP9B3wuWc1bA7eAb+bTcAQU1eGy1dpj0uHPMY
         zqDQ==
X-Gm-Message-State: AOAM5336od9xyLbFrLt0A1E2Tp4x4+lTp4yZXluYwUw1SlrudElfF7Jy
	3o31t9ILa6awIvpk0UskADI=
X-Google-Smtp-Source: ABdhPJwWYyrQMbQbsn8286j/Ujxba+mOtusle06cmfdzVVSuhs4C51+wk/dTIwjjxdRTSca3jZMDFg==
X-Received: by 2002:a05:6512:3f1a:: with SMTP id y26mr12716010lfa.263.1631003691856;
        Tue, 07 Sep 2021 01:34:51 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id q30sm944771lfb.155.2021.09.07.01.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 01:34:51 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v2 1/4] fs/ntfs3: Remove '+' before constant in ni_insert_resident()
Date: Tue,  7 Sep 2021 11:34:38 +0300
Message-Id: <20210907083441.3212-2-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907083441.3212-1-kari.argillander@gmail.com>
References: <20210907083441.3212-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need for plus sign here. So remove it. Checkpatch will also be happy.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 938b12d56ca6..d1477cabe3c7 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1451,7 +1451,7 @@ int ni_insert_resident(struct ntfs_inode *ni, u32 data_size,
 		attr->res.flags = RESIDENT_FLAG_INDEXED;
 
 		/* is_attr_indexed(attr)) == true */
-		le16_add_cpu(&ni->mi.mrec->hard_links, +1);
+		le16_add_cpu(&ni->mi.mrec->hard_links, 1);
 		ni->mi.dirty = true;
 	}
 	attr->res.res = 0;
-- 
2.25.1

