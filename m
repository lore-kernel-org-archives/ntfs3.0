Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C428C6D1B
	for <ntfs3@lists.linux.dev>; Thu, 19 Aug 2021 00:27:15 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id q21so8333367ljj.6
        for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 17:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TB/XZBGPIVAOC56VciYkS4c+U53Iayfs//+43Dxn0UY=;
        b=LzrA6rYIvTj3n8pdQAsAtgJ26pLhb6CIHBT0zfuKWYz3M5oEf/rKazkStEBmaZKhaq
         jjgGUIjPnR0krSB++yEzGXPrRq+eHagwKpBNmNLwH61B/au0MPR2WIVvzZI45qLkJ3B8
         oQGIAbmjeWFvvfNax/zRDyTX5piaDcON3AMQkFsYdr9hHziRSk7s5lyGpAVx3udacUbl
         yxSiuitBivds4xf0IvZuHprFrtTWmuaZRXe9kNtlqz56gbDmRPeWktZht8kDKBMR4qJl
         yuLUzAH+FWNsD5Z9C57/Nf57+P3O8n/yqG1kuzaNZe13NhBJirugRhA1Ny9z7YCvsslC
         J8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TB/XZBGPIVAOC56VciYkS4c+U53Iayfs//+43Dxn0UY=;
        b=GxZJDtmi/0TdldAwg91eIgGLZXEPvPG9ppuqzcNeI5VP6ZR4QrL2PxESCnQ+oJkb0W
         +Nu1sUSUt3NWOgL22C0vBnq/wKNnd2apoXHbdZxo9UsWC1TrRN3pNSiaJsQGrBU7418y
         68fL2MtWSZcJNCXwXMCRXbyhZM+CHHikCplB0FmQSJZ9lczdiPeCQK8ZRZ/TrXRjN26a
         yZw7/5xm1I5YA80ShvEcPoKMEi4RpnJX0/5IJfytRws6c+9qrShWkynKXC0bS0fifNzh
         L2gWwMxQgAKg0Pix2UA34uUX+SCNyvgte4bq5WeOjH3e5OtsjxnQJDaqYe6nsGMMaGFi
         ukwA==
X-Gm-Message-State: AOAM531kJYIebGNTJSjDiYQTmu3wJZrpPXLlwiS/RQggx+aV8fPIPtQJ
	DrozqwISQo40Uk3oYFmCOLw=
X-Google-Smtp-Source: ABdhPJzWqGuZZycph73+9DAemhgxOKuVLuXMF7rsHuW033/8wK/igrGFIRakj3K1MUO4C+JNb39mjQ==
X-Received: by 2002:a05:651c:30d:: with SMTP id a13mr9420182ljp.393.1629332834048;
        Wed, 18 Aug 2021 17:27:14 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id l14sm125907lji.106.2021.08.18.17.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 17:27:13 -0700 (PDT)
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
Subject: [PATCH v2 4/6] fs/ntfs3: Make mount option nohidden more universal
Date: Thu, 19 Aug 2021 03:26:31 +0300
Message-Id: <20210819002633.689831-5-kari.argillander@gmail.com>
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

If we call Opt_nohidden with just keyword hidden, then we can use
hidden/nohidden when mounting. We already use this method for almoust
all other parameters so it is just logical that this will use same
method.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 39936a4ce831..8e86e1956486 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -256,7 +256,7 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("discard",		Opt_discard),
 	fsparam_flag_no("force",		Opt_force),
 	fsparam_flag_no("sparse",		Opt_sparse),
-	fsparam_flag("nohidden",		Opt_nohidden),
+	fsparam_flag_no("hidden",		Opt_nohidden),
 	fsparam_flag_no("acl",			Opt_acl),
 	fsparam_flag_no("showmeta",		Opt_showmeta),
 	fsparam_string("nls",			Opt_nls),
@@ -317,7 +317,7 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 		opts->sparse = result.negated ? 0 : 1;
 		break;
 	case Opt_nohidden:
-		opts->nohidden = 1;
+		opts->nohidden = result.negated ? 1 : 0;
 		break;
 	case Opt_acl:
 		if (!result.negated)
-- 
2.25.1

