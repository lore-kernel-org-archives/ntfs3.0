Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1A72
	for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 09:56:54 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g13so24541808lfj.12
        for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C8shmGTwIVEplPrN8NQt30baMk6rR4iI2vVWk35WOzg=;
        b=kwM5zKbAKM118C6fwyVLCkuxwNqazJSWfgelC8iWcm5DOoOTCfwB4ALMe7jnTTqjCY
         pvfCx7bpEsKbdJAFQYr77IAgYMP0icCCm/R09q8qvoj4w/8fnm2/+sy9AoDdsOk7SUB4
         mPfqgIUaZxFR7hRHs33D70oodAhk8EOcPW9CsAUi2xCn5MWXjf8El5KuGZcH6PT5kI5n
         sJgjQg+7jZY/DYKikxGHzec9rXLsYHDHx3UngE6K1d8/31JYTGX5wys4/4O0e8hX1Zrp
         2OQBRBu8kYqFiGrZwTfXGzh10/PlYp3+3Sm/wsEhrYVXB0JDNZ1uK8Z5HjAf7O5Q1+ng
         ZEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C8shmGTwIVEplPrN8NQt30baMk6rR4iI2vVWk35WOzg=;
        b=Bz3Drg/tJKGK6EQoRVH7fC6xl03VwyXJyFWcWb/2AvOS0EWCR+vmd1E3xTqpUI0vWp
         2h6rV6ySHlc7rjD3omWTQXFNrhOjcKr9vtUUTQgHu26FJvTJwgv4BpaCBmvfHzkvV+Nd
         Df6o7mnGFtKhA2gf0f4Ey9ObjtayDxICheYKmWd0DTHeQyaTF5cYVRk25QBCZ2ibSwn5
         2RRRYQuGNrW0WPojh8TzhnMMYL8p8LEScGgEAWCimJer7jMVrJ8LrhH9zIHh2dbo+t9u
         bZ+wVSK/k7kOC9K0Py9flLOnvKN4e36AIHMMW3GxO5uktMZmJHA8and9Pe7XhkrEYOkY
         YvBw==
X-Gm-Message-State: AOAM5318+2VdoW97RYTX51XVIj7e/+Yd7hh1vJyeXs4BfKE/vz+O4RUv
	dGGIRpoK3s9bjwKOriqjSgg=
X-Google-Smtp-Source: ABdhPJxO1OWQY8ATYb0DXxWiYYRIbHkiVdjUF/hA38qAOzv8owmWNGv3D4LPDdKA2eUIEdA/9L0B5Q==
X-Received: by 2002:a05:6512:1153:: with SMTP id m19mr6734923lfg.268.1630231012587;
        Sun, 29 Aug 2021 02:56:52 -0700 (PDT)
Received: from localhost.localdomain (37-33-245-172.bb.dnainternet.fi. [37.33.245.172])
        by smtp.gmail.com with ESMTPSA id d6sm1090521lfi.57.2021.08.29.02.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:56:52 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH v3 6/9] fs/ntfs3: Make mount option nohidden more universal
Date: Sun, 29 Aug 2021 12:56:11 +0300
Message-Id: <20210829095614.50021-7-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829095614.50021-1-kari.argillander@gmail.com>
References: <20210829095614.50021-1-kari.argillander@gmail.com>
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

Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index b2a3f947542b..52e0dc45e060 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -235,7 +235,7 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("discard",		Opt_discard),
 	fsparam_flag_no("force",		Opt_force),
 	fsparam_flag_no("sparse",		Opt_sparse),
-	fsparam_flag("nohidden",		Opt_nohidden),
+	fsparam_flag_no("hidden",		Opt_nohidden),
 	fsparam_flag_no("acl",			Opt_acl),
 	fsparam_flag_no("showmeta",		Opt_showmeta),
 	fsparam_string("nls",			Opt_nls),
@@ -324,7 +324,7 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
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

