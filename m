Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ACA391
	for <ntfs3@lists.linux.dev>; Tue,  9 May 2023 07:28:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f19ab994ccso54882625e9.2
        for <ntfs3@lists.linux.dev>; Tue, 09 May 2023 00:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683617337; x=1686209337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ9NuQkeXU4fNX7iBYzOS07LZkDDq4TEk1a9dRD5OwI=;
        b=WuM5pudY0UqsP46LjTI8WpnLOV8nN2P+Qon8Lyta6Mr/3rEJHnoJBlFaw2vhAL48mC
         voOwJ6181tWnwuyAgPn+V0EcNkd3MlB10CzlY4+tNaxMA9CPFqMnw6SMNvINi0kNQv6y
         6W8X3pRPQIVvakeu2uLtI2s6BU3HO8DiJPiAEop463HKeqCyvLcZJN62f/WaVaygXth7
         1cjk4MGdIUaI//1oY/VbQJOZt9xCOrmv9d4SKI+3TNdbVhxp/ggghajkFa6JQ7tSoFAr
         9XYYZD6x8VaM8aDOAe8spO1er3riawEbhfroBAABSo2eeG1gyholwPqAXNv+aRJk3AGD
         BUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683617337; x=1686209337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZ9NuQkeXU4fNX7iBYzOS07LZkDDq4TEk1a9dRD5OwI=;
        b=hFBTl5/SUUgfc6GCVpsXOFR4TqHkW4vulVI0VU+9I348evWGALOTQNKhF3ELdVfdjK
         QxjbmNQLpx7G2EuaYguq42pa/0jpmD0oJuoXqYg+d/Bnv6OVGxgk/7JLNtAiNlYyYxdw
         r8FeuVzNBQdyg7RcM6XdpqqlDxJpCiXeu9nyQWufiyD/q8Q2s/Qlru/+kzDDqfYOdmve
         eDnOZcCWqo12QQpDxPMYzmdz8pDEhdngdqsKJ8vVGcYYuR4I6/dYKnUF8E0e0C9v8b/6
         AX8w+SLHNnh0nHcCdZDJi3+L0UZKPQ5BrRk0VEqIFh+TFOfBrVySMo8jynrSt87t4xyL
         h9uw==
X-Gm-Message-State: AC+VfDwcN5H6zKf4rJfJiCXd7yUagVYCN0bwhZPt5s1nsdZNQHWhaFlU
	SFNoF5vcHwEgei7hlaRyId8=
X-Google-Smtp-Source: ACHHUZ4aprA8jaV+02OALul3CdrPdHuejsbTRnfgW+TaIxH+q45taetODg6awx4MtB1jJAj852Yabg==
X-Received: by 2002:a05:6000:c1:b0:307:9473:fe26 with SMTP id q1-20020a05600000c100b003079473fe26mr4379251wrx.26.1683617337199;
        Tue, 09 May 2023 00:28:57 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t9-20020a7bc3c9000000b003f1958eeadcsm784243wmj.17.2023.05.09.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:28:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] fs/ntfs3: Fix spelling mistake "recommened" -> "recommended"
Date: Tue,  9 May 2023 08:28:55 +0100
Message-Id: <20230509072855.2908731-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a ntfs_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index e36769eac7de..8323911fe274 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1191,7 +1191,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->volume.ni = ni;
 	if (info->flags & VOLUME_FLAG_DIRTY) {
 		sbi->volume.real_dirty = true;
-		ntfs_info(sb, "It is recommened to use chkdsk.");
+		ntfs_info(sb, "It is recommended to use chkdsk.");
 	}
 
 	/* Load $MFTMirr to estimate recs_mirr. */
-- 
2.30.2

