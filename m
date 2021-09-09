Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCCB3FF2
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:09:56 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id s10so5361462lfr.11
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Vx5VXlsDYM0By8qtcMLzzMkqkjvP8sT0BAMFB6qnBA=;
        b=VWN+KI3gXPykfmiXluHPCsUNjGkdviEwS6QafNig9FwHtEL/vpMD30GCVs7Dt4me1Y
         quTkSJqfz8deriMR6OYWruV6INa0p0UOwV2l1fxKx4TU1EgQGEN3qT7fbrAQkTMafdCc
         KfXDfN7Fep3zcjXmTIDcsqoWPzgDtXTxI2f0p7tc1mYcoUerI8s0TD3YGVfPNLh/HbOK
         e9AB+OO9l5/s0ARwWEG4B+FuWG6yarJLpM5vSTPEFwk/92dLSwGWZJAc1AgY0ufxeY4s
         GPtntDbRt4cPx7ox2bmb4kiB2K1r2j0MV9N2SneIs1YcVR52VItFM8axNi6nurL0F+Tg
         cvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Vx5VXlsDYM0By8qtcMLzzMkqkjvP8sT0BAMFB6qnBA=;
        b=qU1T/bTX7cYgo1o32sKZXP2dQiGQGTp0zuYCFv0SewOAUJhhjCBMdpHSdQKsz2M2jZ
         Z3ITKTpUIvvRMKiaoDDM+affHQHExKX5CurAqltZdI+FXZ3OZZPiY3p40inZEPOqCgyK
         QOaY6ujfAJvudOljew3LU4LFL7H1eytzghFfvVh/wGDebHxN+bLWLz1Zew938Swi7zGt
         mx/7Hkns53OM/x3f6OXmWE5sXmdtIIh3hDWA8AUfNRWTM8uFxwVT+zUZppRz4fzprm5C
         uRxxQ5H7x/xH0TmWNFsjUKJ4TmO9VgxzNeW0tncBFVFxcep4ZYS2Llp37ZtnwZDU5kKf
         wECQ==
X-Gm-Message-State: AOAM532ajXi++ZaRJJ0LhXCq0dG9lGpn3kWWzZyVQzL8zcXZqx3iovjL
	i+zHWIAHM/zP09VNXrTaaXY=
X-Google-Smtp-Source: ABdhPJwDszHiRj++9s+ncjc3eIQhblfVQl2ia20V7Ut3Y7cGzqPsuRjEfiaSl3V1MKYDEXkzQiR7AA==
X-Received: by 2002:a05:6512:3311:: with SMTP id k17mr856519lfe.520.1631210994802;
        Thu, 09 Sep 2021 11:09:54 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:09:54 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 02/11] fs/ntfs3: Change EINVAL to ENOMEM when d_make_root fails
Date: Thu,  9 Sep 2021 21:09:33 +0300
Message-Id: <20210909180942.8634-3-kari.argillander@gmail.com>
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

Change EINVAL to ENOMEM when d_make_root fails because that is right
errno.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index c3df29bb21eb..6ddc0051fe73 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1286,7 +1286,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_root = d_make_root(inode);
 
 	if (!sb->s_root) {
-		err = -EINVAL;
+		err = -ENOMEM;
 		goto out;
 	}
 
-- 
2.25.1

