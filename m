Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB33FDE
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 15:36:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id t19so20284581lfe.13
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZfTZD2BK9OlT42vnGAs2eW6uulsF/+Be/8upspiEcGI=;
        b=nn22WeONuQDWrItj4HpTHAQ7dwAX51UBc43MhAZjGfRsvushjj5dGhl96Tj/djaRXk
         lSawt8oBukDPxxNw+wmfezepiWpSmRJ9LEVm1+XEuzykX1R1d2DeIUH/RdYJnlQW8tk3
         euXuamsehkVBr1qgdoyJVT34kwcv1vEGbuVUSvGlcDfZ9732AgqftgSDzbaijBIR58Ol
         eWWkQZK1TAa0atmDZJMqiHR3mmL9xybJCFFZxKsJQv3LQSOpspKXJy8yWs7ZM0m0pF15
         LWDkz/2cojQ04z5BtTImODXX4nW/eBHDxbyHftO6Z9pVyA1HiIs1zSYgMlGBTFIo0BQb
         L4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZfTZD2BK9OlT42vnGAs2eW6uulsF/+Be/8upspiEcGI=;
        b=le0wTOFHtj+jPIX2+86Ns9miHRWW+O1ZawRa5kLk+Jqcs6Di+Ek+CjHk4v9OLnhnAp
         IXqMuVCEfhJ6WPnB1jddz4WhwumW3mDenRsdaLGcGae7xdyZAFMSm/o9rhNC3KpCX4q5
         Uy2lHb+9ltyeQ/+Ol3xfIon2mZuN684nebPZVHGmHjs8h7BB6M1HqOlYFjsq8RBUIES8
         ACdcrYg4TaeiaxEUc68Ye8G8JWEKgqwT70N3bWdUhg9flfUwJcnmnBFxU1BHfGhlaEwb
         2ShzhRoca3pJ4Jhf8CMTzLmLf7UBYbsdZhGa+GHdb9XvtmQkkCXDyD+uGothIVLnPmSx
         KG0w==
X-Gm-Message-State: AOAM5323ZQvWbWU2qUKiQNAcXGhwEOZBDnOOeOstgzCFnzLTnyBe2dQp
	TgR9bF9DU4rHqhwtrCAQzWs=
X-Google-Smtp-Source: ABdhPJy3n1OhoIgD3JgIRKoHX/v4Q75f0ng1LbQuWlanfiAQN5PzM7HDJWkJcWYH0J3xw3H1k+67Fg==
X-Received: by 2002:a05:6512:388e:: with SMTP id n14mr13431241lft.242.1631028979649;
        Tue, 07 Sep 2021 08:36:19 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id p14sm1484458lji.56.2021.09.07.08.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 08:36:19 -0700 (PDT)
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
Subject: [PATCH v4 6/9] fs/ntfs3: Make mount option nohidden more universal
Date: Tue,  7 Sep 2021 18:35:54 +0300
Message-Id: <20210907153557.144391-7-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907153557.144391-1-kari.argillander@gmail.com>
References: <20210907153557.144391-1-kari.argillander@gmail.com>
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
index 420cd1409170..729ead6f2fac 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -242,7 +242,7 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("discard",		Opt_discard),
 	fsparam_flag_no("force",		Opt_force),
 	fsparam_flag_no("sparse",		Opt_sparse),
-	fsparam_flag("nohidden",		Opt_nohidden),
+	fsparam_flag_no("hidden",		Opt_nohidden),
 	fsparam_flag_no("acl",			Opt_acl),
 	fsparam_flag_no("showmeta",		Opt_showmeta),
 	fsparam_string("nls",			Opt_nls),
@@ -331,7 +331,7 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
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

