Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C3672
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 18:15:20 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id s3so188156ljp.11
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D5++aHHD3RXCwj0e7WuOBRTNcQJE0NmGKDk2bffqn2c=;
        b=jjMBSNSbOSwx8VfofOMpIrKkGR583oJRhEY+RGlLjBJbeUlNNj99kcsiWVUh/lVyUw
         qSAfoYL+o4kGY6TYeFVhL9iEL+G/FOOgqjOztW8PNeAA6gkzFsILH3IUUuS1rpqPuq6Q
         RfPoPLQKOCk7zCTqJU4//rNv0hZk18ScZq50fklDbpM109iJ8rr75A6ILfV/F/sixjeo
         58z25CY97kViw6QUW/RADai8UqxyuOTIO+XD6jeyMmuTWnSNNwUd8S3v+gCtRubsD5zx
         /yVXvoxc+5pSJj6HpI5hn9h8MtWOyZ0T3wSJTY6uk/2WN4IeapyFYTjTt78BP7mLmRsP
         Fu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D5++aHHD3RXCwj0e7WuOBRTNcQJE0NmGKDk2bffqn2c=;
        b=pvop0QZftqVpRnaJJDN5Z7I2aqr6A0QZ6nPv7TrY7DhHfgI+PEa2+Dt8CWmoy4MLjo
         yvC7sXkM3s/jH9ut6YmK9ZLEAYGtoDQJb55ki4Ss25645TPKcuEgxZ2QpOJDu7LC2Uik
         V8yhuTNARKMX87TDvbksP83FHhyB0JGbVyHCi0TSRP19qJIlbiX1ljSKJQXPH499x8Xu
         Q0uoE2h425qoDrINsd++L08mgfZ03rsGsDaDCSoOrswr0cdBVclDg+9uDqLhAuM/eG1/
         b0LDztgTh743wRodcIR9k+eTXvxkJ14AU0rqp/OGmGns8XinvYLisuWJ1QjEdBdoHyn9
         82EA==
X-Gm-Message-State: AOAM532OQ2E1QoiP6y+BhaNgwv1NKNkXC6osb4mzukx1Fb6VALf5XOQI
	qJzX8ajGFbPAeqFWi0XUCnM=
X-Google-Smtp-Source: ABdhPJxGCPLcnb19VROY2euC3LDGiJXTEuV6bdaZ3QPfVoeMeDSguDv2Tbgc6XiZTgytkge1Hq9Uvw==
X-Received: by 2002:a2e:a7cf:: with SMTP id x15mr26185530ljp.227.1630433718347;
        Tue, 31 Aug 2021 11:15:18 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z11sm2270757ljn.114.2021.08.31.11.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 11:15:18 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] fs/ntfs3: Use consistent spacing around '+'
Date: Tue, 31 Aug 2021 21:15:02 +0300
Message-Id: <20210831181505.1074767-3-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831181505.1074767-1-kari.argillander@gmail.com>
References: <20210831181505.1074767-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use consistent spacing around '+' for better code reading. Checkpatch
will also be happy.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 938b12d56ca6..b207d260ac06 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1451,7 +1451,7 @@ int ni_insert_resident(struct ntfs_inode *ni, u32 data_size,
 		attr->res.flags = RESIDENT_FLAG_INDEXED;
 
 		/* is_attr_indexed(attr)) == true */
-		le16_add_cpu(&ni->mi.mrec->hard_links, +1);
+		le16_add_cpu(&ni->mi.mrec->hard_links, + 1);
 		ni->mi.dirty = true;
 	}
 	attr->res.res = 0;
-- 
2.25.1

