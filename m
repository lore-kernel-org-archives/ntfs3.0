Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A693FC8
	for <ntfs3@lists.linux.dev>; Tue, 21 Sep 2021 17:19:19 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id u8so305823lff.9
        for <ntfs3@lists.linux.dev>; Tue, 21 Sep 2021 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UgfqvwQAazOlHIXcgFNfzq1ZdpEvlmtOO/XH1GP+f4k=;
        b=oJXjpHvCGQJLAA0DhTlfYxl9dxCtowtACDgbFh9MDIXtqM29jzSB8077+iMR/7NCoi
         bZDg4bBvBRgS4kvg1g0U03+jOiwSal7FEtmpFB4niVtZinzGfNwoH+PVnzAtjgLXfYt6
         bDoag0R0NGPUN9KBLvEs5JbUOfJJvrTIjjE1YgZ3fNqcDcZvVmSDrxS862iw/sFiAJAU
         44Eyfn06yoXvnGbZ5BEsOybL1w+UbjgaF7zLws5tjEDI8AletGWa3ralyvWFFfv92uuD
         HDV9MgDBr6iDlWCNHzzoBN1KnGy85GsJ16duikVGSwdcx85aRd61llmXUPdTOmrTJi54
         0AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UgfqvwQAazOlHIXcgFNfzq1ZdpEvlmtOO/XH1GP+f4k=;
        b=g9z2tZ5HslcN3Xyml4wrchRFcSYIg48UaiRxEl1E04bzI1a1fUOYpBEMemvvMBKiue
         yV+we0o7JDMafyqrQJuEeEGsRIX9cSzAT1MdgG3XhxcYMD6uH8J+CEhB0xtQNAH38qyx
         GjW3yiQRAjUxBQOsPjMWVZQLcddEbrrQ2wMg9ssHMYhjNNfk4r8MraEVVuJHx9YMTRdy
         HFLAyqVRBhBJg8fEkbQSVhZPSc1bLH2mWa9fHi5bwe4PSL8UlGDNHgEv4EvobdNQP5Rq
         lSUJON5+kUB8cCsfH+7nJgPDvca2kMc5h5GU4gJhRL+k01pIm3uwN1cbRLLesoByLAys
         vsXQ==
X-Gm-Message-State: AOAM533fIdbpNuMkNqFtCTS0xUztEMD95alx3iPqFChoUHYclogRVN9K
	Y14G+p0yuFGwX+XGUZaWHvI=
X-Google-Smtp-Source: ABdhPJwlEx6b1YEEbjuBXwWeH2SHiMdFzGwheKz7e511BhxAIkOtew+4tlb7eEQSgQBHcV8p4cZLtw==
X-Received: by 2002:a05:6512:2244:: with SMTP id i4mr13240636lfu.219.1632244756199;
        Tue, 21 Sep 2021 10:19:16 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id w12sm1709258lfr.140.2021.09.21.10.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:19:15 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v2] fs/ntfs3: Remove deprecated mount options nls
Date: Tue, 21 Sep 2021 20:19:01 +0300
Message-Id: <20210921171901.49176-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some discussion has been spoken that this deprecated mount options
should be removed before 5.15 lands. This driver is not never seen day
light so it was decided that nls mount option has to be removed. We have
always possibility to add this if needed.

One possible need is example if current ntfs driver will be taken out of
kernel and ntfs3 needs to support mount options what it has.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
Patch is compile and checkpatch tested.

v2:
	-Do not delete {}
---
 fs/ntfs3/super.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 6a535b144ff9..800897777eb0 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -246,10 +246,6 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("prealloc",		Opt_prealloc),
 	fsparam_flag_no("acsrules",		Opt_noacsrules),
 	fsparam_string("iocharset",		Opt_iocharset),
-
-	__fsparam(fs_param_is_string,
-		  "nls", Opt_iocharset,
-		  fs_param_deprecated, NULL),
 	{}
 };
 

base-commit: 6354467245ff8dd04b54e39790f2ee4d21d5419e
-- 
2.25.1

