Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7253FF0
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:09:55 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id m4so4344906ljq.8
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F2YE/IpBouufnw/SY3U1h27yOblAPYlbcr4zue0STtU=;
        b=c7BByKEpi8GRVP+ar5aD5pvYdgHdL/PPzvTYDy9o7YqlFXEsd+VWfQ9juyPtUsZG1l
         X16dcK0WjK5pQzFbI+WJWjZZqHdiFSF4FKtpL5BTo7niOaqbj7Z7+hWTKoA+LDilfw1G
         44eH8g7FfpTp90qmopZPseFc+wZ7UtsVfLEeobUm1JR5FISJ+ty7UPaQcyZooU8y7OOH
         Wwn9Ff4s/9a9irVxVBgCxCAd1MeprQPEeX+j/v42olML9G2Dz6yyzSolAUf/FSkBCxTX
         Ha83b1+5d8wZEuzEkVkmiHsegkSVEYzG4lrw/OVBtIPGkaOy1zP4O9+QYHJLxc3HOfYC
         LCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F2YE/IpBouufnw/SY3U1h27yOblAPYlbcr4zue0STtU=;
        b=hZpj0pj2gauLjPBAGyojjKbgh23lmcqN2OzXCwutAzGKC7BaKKLD69+fuKVCX3i6jI
         SBdby1jIjaouqOgSHp8aoub1K2YNWuBS3VqSOe2vNkAQDr8LdPmflBNK4g8wL2Oz59aU
         jZ1wkMcYs8l90Tho5YIAsYG/PTJjcVjB5YRrWVCbiaB9ud0/HWjARNGBgh4fQ8rWrSAI
         Hrwn19xwccHgseSaXtcs98D70rMdOvDYQLEKM8Z3r9TG9P3jfKXL2597zy9dIUS42qad
         8hSNoYqQ1Onc+ZrcFUole2N05mh/WRDNhciRSExTYcV3r+rBhGxOYLqW4OHVqe30WLvK
         De4Q==
X-Gm-Message-State: AOAM533hHIDnos9d69sFSBoXCNhfFU0jEU4xuQEg961VxBRssAS1lggJ
	KSODuVa0/8H79ghVncNljSllp5KYipRGFA==
X-Google-Smtp-Source: ABdhPJx5dZEUFZVbNE8p4jn8CGjWeBL33pyiyl6VF6utW4RJdPC8Ru11Nppi4ci8dos8Cq5H2QRKYw==
X-Received: by 2002:a2e:984e:: with SMTP id e14mr972467ljj.134.1631210993354;
        Thu, 09 Sep 2021 11:09:53 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:09:52 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 01/11] fs/ntfs3: Fix wrong error message $Logfile -> $UpCase
Date: Thu,  9 Sep 2021 21:09:32 +0300
Message-Id: <20210909180942.8634-2-kari.argillander@gmail.com>
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

Fix wrong error message $Logfile -> $UpCase. Probably copy paste.

Fixes: 203c2b3a406a ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 3cba0b5e7ac7..c3df29bb21eb 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1203,7 +1203,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	inode = ntfs_iget5(sb, &ref, &NAME_UPCASE);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		ntfs_err(sb, "Failed to load \x24LogFile.");
+		ntfs_err(sb, "Failed to load $UpCase.");
 		inode = NULL;
 		goto out;
 	}
-- 
2.25.1

