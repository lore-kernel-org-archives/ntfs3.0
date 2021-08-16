Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB96D19
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 02:48:28 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z2so31633092lft.1
        for <ntfs3@lists.linux.dev>; Sun, 15 Aug 2021 19:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iYz9vWgNSNALF0ku2PXSCElORiPAPuGLP9E83ZEt3mg=;
        b=cZp0EcbuoXb094Fa+0A2X0Axmo8Is+WEreRzqFc9l7hBq/RU6qPOcjFijQ1RKl4Llq
         ESDDbZt65QR1DowjIeNF5DpHOLY8P5gsbNpxGwkNu1SlO/xpJszYPpMBnJUn/fgVC4Cv
         zqgMwhuF/yaZ6Z6JfPSkXBaZRE9l1yHYNgIjZd51E04Uf9q93VXWaTXiIHpfl+9ihaOX
         N+Y/ymJ18SpgvErC94kVxAtsRy2ejQLCfRayZ2ecl80q+CzZsFtm0f0ioOpFG3kkozuH
         AG5aYXjyze7bO+kNiW1a3MF8SXCcoRa3WPYXHsMOMS9kHo7oFo+wkRClfqW/5UIQPLB6
         zMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iYz9vWgNSNALF0ku2PXSCElORiPAPuGLP9E83ZEt3mg=;
        b=UjdhUEr4fYwyIBfFyxsiS95BMdQDSEXHlo7AvEtTMMW7aUBSLwnMZ0Nq5XbivRnMQH
         xp6KsAnnc9+5FYt7YVCCgr1EM1mNOJEjMZVFTg73VavCd51PzUisx+mHCn2qJ66Anq6o
         7O5+3QjLml/j4ZM5nNj4JlwRzxt9KHmC43kEXMLu1uH7WxFK3uWM+RIzLyvrSOm45kcv
         OutfgLeRsbllW+aJ58tf8yt1wTUrBRLV12HfCf3LaH1zeiUCYKuIetOPnaoHmaA3hiSp
         Ah+6b84mo9nuj5H/g78K9gG6Yk+EFCge/QowPz53WKx3QAVyXgQoQYxFMbN+FDYec0a3
         tyTA==
X-Gm-Message-State: AOAM533iGYNnVgyy7yu2Hvr26aOtwZBFEiMno2L3YXXZu9QRBzAJgSI3
	1GPWWPXbTJTARUH1Dzd/v08=
X-Google-Smtp-Source: ABdhPJx6TMgsxM82KUFNsSMqgYnQ1K/+2Bw1KpPLpVuKVWH1slkF6yi4IoRTvj84ckvU3XZnElAVwQ==
X-Received: by 2002:a05:6512:3887:: with SMTP id n7mr10007419lft.572.1629082106427;
        Sun, 15 Aug 2021 19:48:26 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id b12sm425392lfs.152.2021.08.15.19.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 19:48:26 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [RFC PATCH 4/4] fs/ntfs3: Add iocharset= mount option as alias for nls=
Date: Mon, 16 Aug 2021 05:47:03 +0300
Message-Id: <20210816024703.107251-5-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816024703.107251-1-kari.argillander@gmail.com>
References: <20210816024703.107251-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Other fs drivers are using iocharset= mount option for specifying charset.
So add it also for ntfs3 and mark old nls= mount option as deprecated.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 Documentation/filesystems/ntfs3.rst |  4 ++--
 fs/ntfs3/super.c                    | 14 +++++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index af7158de6fde..ded706474825 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -32,12 +32,12 @@ generic ones.
 
 ===============================================================================
 
-nls=name		This option informs the driver how to interpret path
+iocharset=name		This option informs the driver how to interpret path
 			strings and translate them to Unicode and back. If
 			this option is not set, the default codepage will be
 			used (CONFIG_NLS_DEFAULT).
 			Examples:
-				'nls=utf8'
+				'iocharset=utf8'
 
 uid=
 gid=
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 2a4866c2a512..886c495d2f5c 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -240,7 +240,7 @@ enum Opt {
 	Opt_nohidden,
 	Opt_showmeta,
 	Opt_acl,
-	Opt_nls,
+	Opt_iocharset,
 	Opt_prealloc,
 	Opt_no_acs_rules,
 	Opt_err,
@@ -260,9 +260,13 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("hidden",		Opt_nohidden),
 	fsparam_flag_no("acl",			Opt_acl),
 	fsparam_flag_no("showmeta",		Opt_showmeta),
-	fsparam_string("nls",			Opt_nls),
 	fsparam_flag_no("prealloc",		Opt_prealloc),
 	fsparam_flag("no_acs_rules",		Opt_no_acs_rules),
+	fsparam_string("iocharset",		Opt_iocharset),
+
+	__fsparam(fs_param_is_string,
+		  "nls", Opt_iocharset,
+		  fs_param_deprecated, NULL),
 	{}
 };
 // clang-format on
@@ -342,7 +346,7 @@ static int ntfs_fs_parse_param(struct fs_context *fc, struct fs_parameter *param
 	case Opt_showmeta:
 		opts->showmeta = result.negated ? 0 : 1;
 		break;
-	case Opt_nls:
+	case Opt_iocharset:
 		unload_nls(opts->nls);
 
 		opts->nls = ntfs_load_nls(param->string);
@@ -529,9 +533,9 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 	if (opts->dmask)
 		seq_printf(m, ",dmask=%04o", ~opts->fs_dmask_inv);
 	if (opts->nls)
-		seq_printf(m, ",nls=%s", opts->nls->charset);
+		seq_printf(m, ",iocharset=%s", opts->nls->charset);
 	else
-		seq_puts(m, ",nls=utf8");
+		seq_puts(m, ",iocharset=utf8");
 	if (opts->sys_immutable)
 		seq_puts(m, ",sys_immutable");
 	if (opts->discard)
-- 
2.25.1

