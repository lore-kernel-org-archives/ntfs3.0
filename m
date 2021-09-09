Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98EE3FF2
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:10:04 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id h1so4352318ljl.9
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FNstURAnEwRQWJKpoRhMrXhV0IY6uV/pfL9IkEMgoq8=;
        b=O9HpcNgnLXjKu72laDJ5trRhVissy09oawT2w6m+FG2Ft01Pj1CZJBFWoPhpWiCq2i
         tZYhoiODW69DCoUKEdaypOr3Q50+WF8qocsVmSL1IbmX2XHs6s8av+NBQemxlG1hOK/3
         CMG+nQv1UQBbVX61Iqj1BLmCCGmmx0fhdcPjOXr9enpZJ0QTWEVFENnxjfb7TUUEoZZU
         S3sGjE5s63yaxWwzm/cx8xHXIrqgz+j3cpU+wb4jmS8PZ/YD7tOy1NnIXSvZhQ0VjnUn
         2TiJ/TG7YkAg3nRlcXPj+u+FSxQwePzCr95YojJJFRBuPWy4xfeDd2IOsoUSil+3YqDi
         Hnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FNstURAnEwRQWJKpoRhMrXhV0IY6uV/pfL9IkEMgoq8=;
        b=QuIll8wXImrJym61TPJSDUM3YLnswSO/QfgexeDatssGQh3fUwNcuFpp7uzutPl7X8
         ZXoWLeimyquEUnFLANlE95/nRRqikzJAEU4yojL3TCbpFFt/1tgD3bWNu+WEwponAcJ9
         bjzfcDWy2ugJCQv93IFUyTFm82Cfw+f6aGYqo/IoCwFsVlQO4r31BFl6/DqGKF1q5PI+
         pmKgE9hPw6ugtdAwiaeyIFJ896A394D5/kV3G9Dlgni51pfXGBwnbPY9hFSVbdE6/Xwb
         sK0neJpxQ4eklHtwViGSNi2zF6wlbbLLRfOqWhx7F4z8wyBrn6TbaHS3ODw+msgO14eS
         SNKg==
X-Gm-Message-State: AOAM532RkZq/gIVvbGTKQI34Emfn5/VZp/N/nBJkYYksVrq6IR5POIYL
	7KzxKFoaO0v/6B6v8BE3TW4=
X-Google-Smtp-Source: ABdhPJyXJpPXfHBTuvCUwOH8tzpEb5kxGOxW6YCPPSJ2A/QU4wKFwazFhP9svlL5SQJC+LAwUrDIFg==
X-Received: by 2002:a2e:964b:: with SMTP id z11mr929079ljh.91.1631211002977;
        Thu, 09 Sep 2021 11:10:02 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:10:02 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 08/11] fs/ntfs3: Remove tmp pointer bd_inode in fill_super
Date: Thu,  9 Sep 2021 21:09:39 +0300
Message-Id: <20210909180942.8634-9-kari.argillander@gmail.com>
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

Drop tmp pointer bd_inode because this is only used ones in fill_super.
Also we have so many initializing happening at the beginning that it is
already way too much to follow.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 8022149f6b88..14cb90a4c133 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -877,7 +877,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	int err;
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
 	struct block_device *bdev = sb->s_bdev;
-	struct inode *bd_inode = bdev->bd_inode;
 	struct request_queue *rq = bdev_get_queue(bdev);
 	struct inode *inode;
 	struct ntfs_inode *ni;
@@ -920,7 +919,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* Parse boot. */
 	err = ntfs_init_from_boot(sb, rq ? queue_logical_block_size(rq) : 512,
-				  bd_inode->i_size);
+				  bdev->bd_inode->i_size);
 	if (err)
 		return err;
 
-- 
2.25.1

