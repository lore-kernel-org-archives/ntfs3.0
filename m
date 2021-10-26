Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93132CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:54:49 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id b82-20020a1c8055000000b0032ccc728d63so507675wmd.1
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G4X/JulyXjq5+zuBTvjCVDeZEOCdwlyRcq/fccbkirY=;
        b=nPXyjWYicuBeF/x6ynFsH959wctvt5LC56Nfb8hWD1o7IK060bym0VzviaXwIeU7io
         a77ovKL9Ga9hM1BBBlVds/pFN17kQhmI1yWo6HeBsRPT2nI095+US1vslZac9bF9aeQc
         ZaKfYbikhjUDrA61Y8IanyuJTiWFZPM1QCGISuOhXatMmHylrGdv4BRk1onf+nJIV82D
         +W5WWZ1WnnBcG5f/LK5WC3uGUPS0jM0yxeblJFXQAW0iKlimmwdGRivgB+OlYfz4I4Ul
         a7Qx/yvC8JnEWsCVyZ636tL/2aotw7riMqK5ASyUrHfR36uA+0ra9ANHUnzV/VUbvxJQ
         Mq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G4X/JulyXjq5+zuBTvjCVDeZEOCdwlyRcq/fccbkirY=;
        b=Gkt1rQhDwX/Dknq1EJmYLm+AawJTuez7C/KjCN5pwpion9L2PkntC8uxaesZMsYIus
         es/PXcYqjuhHzSxV6OTH1muMWnP5f6Wo5Slh7uIxdIKT/+2qHkWR9Cv7F+QzcELLowCL
         Zf5qjchHWOtrYgvWrs50tL8wCbinzZlWrhRS182D7rYyNB0P9802LqTaht/N9MZIs5J5
         /0F7JEgitJHf8bQKspuXgTqZU8tUZqNJNFyBrknFYcM7sgTU0qacnAC96V2A7RmpF6KT
         dQ+9DKPYmaEgYGq8EeApybD6RpLcA3uMvkuGoutY8qPeCuRkrTxkqDfrbkpiPA6vM60C
         MdMg==
X-Gm-Message-State: AOAM533ZB0vpuFtCc1Owu7asRSiA8QcY4DzEQ3y26hpAJuZlJX7TR7cp
	b/lBWcD6CMYtZXeqLm5qZJikj/7/b4s=
X-Google-Smtp-Source: ABdhPJwqdKLpBkyuSRHxz5j67AUnRAwVCdELFT4BSK5ng/Mp3YsP73khFTJZpSTPe9gSG18FmRqIWA==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr1122593wml.186.1635281688344;
        Tue, 26 Oct 2021 13:54:48 -0700 (PDT)
Received: from localhost.localdomain (h17-ipv4-77-240-224.mynet.it. [77.240.224.17])
        by smtp.gmail.com with ESMTPSA id t6sm14179248wrw.78.2021.10.26.13.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:54:48 -0700 (PDT)
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: ntfs3@lists.linux.dev
Cc: Enrico Mioso <mrkiko.rs@gmail.com>
Subject: [PATCH 1/2] fs/ntfs3: clarify why $Extend init is being skipped
Date: Tue, 26 Oct 2021 22:54:35 +0200
Message-Id: <20211026205435.126133-1-mrkiko.rs@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$Extend init may be skipped due to NTFS version lower than 3. Be more
clear on this.

Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>
---
 fs/ntfs3/fsntfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 4de9acb16968..abe74dc9ce31 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -189,7 +189,7 @@ int ntfs_extend_init(struct ntfs_sb_info *sbi)
 	struct MFT_REF ref;
 
 	if (sbi->volume.major_ver < 3) {
-		ntfs_notice(sb, "Skip $Extend 'cause NTFS version");
+		ntfs_notice(sb, "Skipping $Extend init due to NTFS version lower than 3");
 		return 0;
 	}
 
-- 
2.33.1

