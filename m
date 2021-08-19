Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF26D17
	for <ntfs3@lists.linux.dev>; Thu, 19 Aug 2021 00:27:17 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id h9so8322847ljq.8
        for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 17:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DOuni2n/29LbC0ytAK0Fi8GuUBVC6c+VlqLmnjT4LqI=;
        b=emAMHPR2eshcvqE3HBYuyFC4p3XBf3LMqQL/Mb5s/G07siv0KIi1+8HtbTEGrqkRT+
         /01tH6FRvnoM85cxpHdL72VrHIs+tQlYdD09YEiuJBBqj6aSqQ8tixp9CSBT68mcnq7f
         y2We3CorfLz/6ciy99TVZF00BjpC3BOZhvUgp+HUsktQ9EvLPn1w6fg1ZFT6OS/3Xb90
         ADtjbb/dHJ/vEkLpbfFNPWZ40bjS1Sx8loX+SjCEFnNpfCoRBnd7WxsHKjLYr0WSDKxk
         DBYeg2hFfJox56SAAsk6qYyzDCamx4L92zHgN03xTGGc30xar+lVlndErPkfHm0/u2M9
         b1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DOuni2n/29LbC0ytAK0Fi8GuUBVC6c+VlqLmnjT4LqI=;
        b=MhMCIYO5fJaZBhkpXJkUSAWRv8462G1LHE5NdiydRA25+fF2BaqrG8ewyPuapjbH3d
         xjIJtw1sjlZ9YHTdqQyZYNKnHz8Te4DBk9w2/BAVI6xOEEQeqsETvoNHNOmuktM18kqw
         jY0At7RscoQW5tdzYTqd2gfRKCqQey5lTRdLw1H4gr9XyMceJAOCWRWKdgrCa/VGaQpd
         mLEWpNo09+VHBPjWCyW+ppI9DLH1jxqroP9IgULGoaohQjeZEGJRUCagDEy50LArAeV6
         XQgVX2l/YkECdRVPSKus78oD2CRU/E4n0IVTa1SxJCScp1GBXiq6FZzOE+nB6fb5zxjl
         n1Ug==
X-Gm-Message-State: AOAM531cZMitNd2GpULtAUoMUDNL9VdXOl2fwAKP86jqpwCNp11br7aa
	es74qLeqMTxmlmLNOpIVgC4=
X-Google-Smtp-Source: ABdhPJxCrzU2oaf6pHPW39AB8R+VNEta0gb/FOqjgHsyTDV/Qrr39Yg42+D8rgutlUtM2FVm7GWacg==
X-Received: by 2002:a2e:3914:: with SMTP id g20mr9926594lja.88.1629332835912;
        Wed, 18 Aug 2021 17:27:15 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id l14sm125907lji.106.2021.08.18.17.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 17:27:15 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH v2 5/6] fs/ntfs3: Add iocharset= mount option as alias for nls=
Date: Thu, 19 Aug 2021 03:26:32 +0300
Message-Id: <20210819002633.689831-6-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819002633.689831-1-kari.argillander@gmail.com>
References: <20210819002633.689831-1-kari.argillander@gmail.com>
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
 fs/ntfs3/super.c                    | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

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
index 8e86e1956486..c3c07c181f15 100644
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
@@ -259,9 +259,13 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
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
 
@@ -332,7 +336,7 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 	case Opt_showmeta:
 		opts->showmeta = result.negated ? 0 : 1;
 		break;
-	case Opt_nls:
+	case Opt_iocharset:
 		opts->nls_name = param->string;
 		param->string = NULL;
 		break;
@@ -519,7 +523,7 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 	if (opts->dmask)
 		seq_printf(m, ",dmask=%04o", ~opts->fs_dmask_inv);
 	if (opts->nls_name)
-		seq_printf(m, ",nls=%s", opts->nls_name);
+		seq_printf(m, ",iocharset=%s", opts->nls_name);
 	if (opts->sys_immutable)
 		seq_puts(m, ",sys_immutable");
 	if (opts->discard)
-- 
2.25.1

