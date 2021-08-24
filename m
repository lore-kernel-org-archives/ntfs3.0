Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41BB72
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 18:20:39 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id j12so24770693ljg.10
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VBABjmHqYwSGMvrKOv+LHJL9S1tFaoQC8OEouPmbANI=;
        b=NGhAAuZZ/gVDx4WlrNQt8cLEsDc+JhpFXPBX3Wob3AVse2hz8oe5+DtC+NUIoqMo1a
         g8RxCqsMETMsufGr7r06hpQ1nDPwNKzUdhVp4X6EeDZ5I5iq3EeaRcjNb4kRHCt227lD
         a/vyTBt0djsZSHKsTLSOOiBLOqzpWccgfVXKhorFuRxfGU2SNmWiBdokCBAfU2Zx/4mC
         ILyAjXDIFzGOxondKuMt86R131+T6AxfRHABjdR5C7NFBuhWgMhqu2hxs8/OJ71jURWQ
         iruIlLTu5ynm42WAWV2L4EFNJFxALiuJF77fMaO97GLg699vZVKJahgo01Rfub1q6eos
         m/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VBABjmHqYwSGMvrKOv+LHJL9S1tFaoQC8OEouPmbANI=;
        b=mV5usxcnwFwaB7y4mIadwOexsrILVFNulXiMZDrVPlqCQfiwnXpukl4eTd88rjagaw
         dhDDf6lQ62kxHuGzZKgBcdetzHAnvX4lM95G+5Cwa9eUrFSvIXgD1hzd63IAaMQJJOFJ
         33OGlvLOSGNW+na4MI6ayWr8ayLNufbAL/I4KSRZolJaESf6TJQASjhtYpyX0hW9WcXe
         27vzHSv2SGeJSdvxKu7hhb/XxQOvk0gxnaAXer9abtfu9WhZciFjrowuPjz9mmBLEbFc
         LE6bgJjw6HaC8tDM2taxgLj0qxZt/LE0zQhxLXRm7FypwpkT9Q5Lv1FlSY5zXPDFYVf9
         4gkg==
X-Gm-Message-State: AOAM532TZ7DuQEymfJ9y7wTrUmYzaWH0bvFu2yzKPBHBajVfLOgvTjBA
	+z7ZqndE6TJIo84QNKcc5O4=
X-Google-Smtp-Source: ABdhPJxQUZ6wDtkA/pCRg7RLySrQbFXiTPbB78Q6+KHCxEe3xzRHc6jp2wV9DUMZTJUKCOjDcE7EGQ==
X-Received: by 2002:a05:651c:225:: with SMTP id z5mr22991979ljn.409.1629829237833;
        Tue, 24 Aug 2021 11:20:37 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id p5sm1823783lfs.99.2021.08.24.11.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:20:37 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH] fs/ntfs3: Remove fat ioctl's from ntfs3 driver for now
Date: Tue, 24 Aug 2021 21:20:20 +0300
Message-Id: <20210824182020.1007329-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some reason we have FAT ioctl calls. Even old ntfs driver did not
use these. We should not use these because it his hard to get things out
of kernel when they are upstream. That's why we remove these for now.

More discussion is needed what ioctl should be implemented and what is
important.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
Earlier disgussion with Pali can be founded here:
lore.kernel.org/linux-fsdevel/20210824113304.eabzy7ulbuouzlac@pali/
---
 fs/ntfs3/file.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 59344985c2e8..819afc4c902b 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -10,7 +10,6 @@
 #include <linux/compat.h>
 #include <linux/falloc.h>
 #include <linux/fiemap.h>
-#include <linux/msdos_fs.h> /* FAT_IOCTL_XXX */
 #include <linux/nls.h>
 
 #include "debug.h"
@@ -50,15 +49,8 @@ static long ntfs_ioctl(struct file *filp, u32 cmd, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct ntfs_sb_info *sbi = inode->i_sb->s_fs_info;
-	u32 __user *user_attr = (u32 __user *)arg;
 
 	switch (cmd) {
-	case FAT_IOCTL_GET_ATTRIBUTES:
-		return put_user(le32_to_cpu(ntfs_i(inode)->std_fa), user_attr);
-
-	case FAT_IOCTL_GET_VOLUME_ID:
-		return put_user(sbi->volume.ser_num, user_attr);
-
 	case FITRIM:
 		return ntfs_ioctl_fitrim(sbi, arg);
 	}
-- 
2.30.2

