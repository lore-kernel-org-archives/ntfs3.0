Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0AC3FF0
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:09:57 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id f2so4380324ljn.1
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XyzdfVcXNWHz2AnLeeSYWunihPeiHYmqdtq+pDc6YuI=;
        b=S9rT8RXz5SICnplyyuiERWwzAiKoLRp5EKF50aEp3PGd47T0Rh7EtvsixVSJLQJ1qW
         lVqfKMCGh0L+IUTYg8VJujFywfRvzcVxfFaLd4q9J+aQGs6V+MLoI1npO/IZ9g3F0slc
         wvvnTSWXGRmbdSbl9khYlirdxZfLetqeIAqtTlDncRwR3HP1zcUE7+y/lFUo3ltL/M8i
         iK/tYM2Snq2TxqTFxU050YNu4mCzMHRkFtQqHiBrKBQ8w2VEjeMF8AD8YA/jMapA/fAL
         VCPspyRQ6IHFXhMmUiv7R57PQEye759px6PNOEfUjuZlGLdqSC2kRoVvUu1hwgaF4/EK
         KZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XyzdfVcXNWHz2AnLeeSYWunihPeiHYmqdtq+pDc6YuI=;
        b=1hgyZjvlhxhrvLl2ld4TIgFkmJ/CCu0f7OD6iknf5KVHvw+KVDWoLRTb3RyFbJIn+V
         QJAZ+pbtmuE7sjYY59IosIZ9CcMXCJsZLDnzGKy2SyA3CTdl4QJp8wbY2cTm5Zum8nM5
         3BteBcj9c0zXCqZ5TfhZs+rnDnqTCqGOVpDkExr/kCLDQg8RtWKFxOyQ2R5OI+DV0X+y
         Js/UIqCZ32CSA4fjl9VwjpGoPd2T1EMTNeMarmyM/EQaaEei4xeFHVtb7OMtcGg6onLu
         IDeUwsNIsdkEjyl6B9Id55C3yQ0bV5j0RKKo1rTFoxgb1+Vcp87gjP5V91EGHTYX9g/F
         OPng==
X-Gm-Message-State: AOAM533VWALVw2as/DKKkKHFCv2ySxu57LXTKwBmsrPv/40qPMrIvHLE
	ynAIIGmFbbN5xdpXPZzBTUc=
X-Google-Smtp-Source: ABdhPJxBFXqNs2CoToW5Lu0/Za50cEVEJ90WoMnufalEHRX/LcOD4fKBkfZh6EqzQnZYSWaEgvSFYQ==
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr938354ljo.288.1631210996000;
        Thu, 09 Sep 2021 11:09:56 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:09:55 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 03/11] fs/ntfs3: Remove impossible fault condition in fill_super
Date: Thu,  9 Sep 2021 21:09:34 +0300
Message-Id: <20210909180942.8634-4-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909180942.8634-1-kari.argillander@gmail.com>
References: <20210909180942.8634-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove root drop when we fault out. This can never happened because
when we allocate root we eather fault when no root or success.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 6ddc0051fe73..793c064833c2 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1297,12 +1297,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 out:
 	iput(inode);
-
-	if (sb->s_root) {
-		d_drop(sb->s_root);
-		sb->s_root = NULL;
-	}
-
 	return err;
 }
 
-- 
2.25.1

