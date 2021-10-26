Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A12CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:55:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d3so428145wrh.8
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RAMksB1AEWxWybO/KjV2A5UN8pyqZv6XOIpiFUq6/fI=;
        b=fDbALEUfVGDNW/qpCdirJuiM3sOE/WN0Va3F/A/cbu6Bofz5Uy2Tgph8IsrVeq8Ts4
         dh/l/7G8mTN+/gfClnGB7GJWNEEE81G/5DbQPwgwnj9aYxoue9tJO+Gh2fxlPLpjOB1S
         +SxgKjnSxpLroTZsT8VwF/4LxdmT2sMownIppAft+wesx6ZybH2SoAFisdy8aZy3HBfi
         44uNDoyka4imDwubEq8GJjiUiVoearNHSA5qPQxgrliaUQud+LEaavuC9WR++DMUKErp
         sJx7ZoWtDa1peo5wsv8yGY55v1vevZ3TsMTBID2IDHUyrFUqj7l9upUygY9+y24H7dlF
         gacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RAMksB1AEWxWybO/KjV2A5UN8pyqZv6XOIpiFUq6/fI=;
        b=40+OQgUcq60U1O05GdFw/+G29wCQPnfbtt/2UXBuOMlQiVNxemCyaJcAuU89N4z+dY
         oV/So7b+ICC7ac8E8lBY8Yv45BBIF1TlUhBGY0jHi+G/0wkFhlWR+BB9u4Qo/ZXbQPMk
         8e8KunQi7DysnAtACJPebIT0M4hUyXb9HIRln69jO1oyXmok573mktri4Q9P+p5aTLRW
         zCrtzWe5ZGjvDqVclu2mHMO1xA8tRXOnNIiSoJCt6mo+yP+BEYW6PBVfvGOy9lrkVstW
         9clKZCktVaiN5yrWGLOiE1ewuMl1ZjiE1P6Ns0Saj59lY8eG/WNnQ7r0r9ir9UxSM4xi
         EEaw==
X-Gm-Message-State: AOAM530+jjh5Fidt0kLFIq+v2OQAwV2FkZQIlpiTeROSLa13DooVDH68
	MEOujpmyHYc4crtvragHBfjCLjV4y+0=
X-Google-Smtp-Source: ABdhPJxn3X8vTH+VQcGvj1bMpQmYEwr0bno9cgsQDGVgfET8zbtav1kZQmCRoYhvNOf1zZ2HeUqJZA==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr29326007wrp.28.1635281716483;
        Tue, 26 Oct 2021 13:55:16 -0700 (PDT)
Received: from localhost.localdomain (h17-ipv4-77-240-224.mynet.it. [77.240.224.17])
        by smtp.gmail.com with ESMTPSA id l124sm1726066wml.8.2021.10.26.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:55:16 -0700 (PDT)
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: ntfs3@lists.linux.dev
Cc: Enrico Mioso <mrkiko.rs@gmail.com>
Subject: [PATCH 2/2] fs/ntfs3: clarify emitted log message when marking volumes as dirty
Date: Tue, 26 Oct 2021 22:55:03 +0200
Message-Id: <20211026205503.126146-1-mrkiko.rs@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are actually marking the volume as dirty. Reflect this in the
message.

Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>
---
 fs/ntfs3/fsntfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index abe74dc9ce31..08802d7ca078 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -933,7 +933,7 @@ int ntfs_set_state(struct ntfs_sb_info *sbi, enum NTFS_DIRTY_FLAGS dirty)
 
 	switch (dirty) {
 	case NTFS_DIRTY_ERROR:
-		ntfs_notice(sbi->sb, "Mark volume as dirty due to NTFS errors");
+		ntfs_notice(sbi->sb, "Marking volume as dirty due to NTFS errors");
 		sbi->volume.real_dirty = true;
 		fallthrough;
 	case NTFS_DIRTY_DIRTY:
-- 
2.33.1

