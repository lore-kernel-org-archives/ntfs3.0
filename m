Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B662CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:37:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v127so597488wme.5
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1Xx1/9EQFTLEZktI5mQO5DnpFihsWQTXxOCOpA7mjI=;
        b=U/7sG1cta8fw/GrQxFcHWRdaazVi/Det0cYDG+QxDdSrHr8aXs6Cxz3NaXmvs1Nvxg
         nCYIJw76z3P1UGD2eTKEUMrV16t0UXdmYs3r4ZnmkIeiDES6f3xr44j7COIqQU6FtzOV
         lVHGgzIxl/ckq+rmgIh+iyYNmOWAIGx6wIjPpW5xoL7oyrvLKQJILTtZHk+82J8habq8
         44dMzAWNWpw5LJXog6h6HPkyE2pqUnbaojG4kWF++iCobyJ/oRiRt/kfAfugb2DLiCpu
         9lto7cg4lU2/xXFUIl7X2CvYEf8JQYUKg8OLhiyK9cyBHZih841FsReENTAvRdD999Y/
         eKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1Xx1/9EQFTLEZktI5mQO5DnpFihsWQTXxOCOpA7mjI=;
        b=3Tfwe0IEC4ZTXN0ihvpxGsHN/UGBCpIi9ZdSZw6H9dLykShnxKdWBsQvM3hSb+7FyQ
         V1D+/XQ5HFPMHo/+SMZYfZCpfn0G+QSShFNg731Qoqen/52KU2jHOAV85Kev3qFcaU85
         gx+9AbydPPs8rS05dlxfgKsyr5o1zbkb8Y19tKg8rVrKqx/uHKvNc2FH9sJ5Tk+x4W7O
         lFMRAEwJmAsRNhXY8T8W0/Bddp4RExGNGWFje39w3FEKYnK7POEQ6mm2gR2rzLV35FPF
         4zI27hznJbuyka2XucYZ/J9WaMuNagOyyJq3tZdqM+oGZqkzH/4DVgwHxKZfmTsQGIgm
         YaHg==
X-Gm-Message-State: AOAM5329qmal0xRiRR1j0JWYth2ajKgQztXTLa6JRNaCDWE41v1SAh9+
	D34as8yTL3HMPvRVvPcLKXC7osvW6HU=
X-Google-Smtp-Source: ABdhPJy1fR+DooBIb7bzv2FKXgDTHwliCc5abUfRQ+Fc7l4TYv7OdwOiZQodNDrw6oEePsaz7WgoGQ==
X-Received: by 2002:a05:600c:3581:: with SMTP id p1mr1085873wmq.88.1635280659391;
        Tue, 26 Oct 2021 13:37:39 -0700 (PDT)
Received: from localhost.localdomain (h17-ipv4-77-240-224.mynet.it. [77.240.224.17])
        by smtp.gmail.com with ESMTPSA id u13sm20558376wri.50.2021.10.26.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:37:39 -0700 (PDT)
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: ntfs3@lists.linux.dev
Cc: Enrico Mioso <mrkiko.rs@gmail.com>
Subject: [PATCH] fs/ntfs3: clarify why $Extend init is being skipped
Date: Tue, 26 Oct 2021 22:36:30 +0200
Message-Id: <20211026203630.125971-1-mrkiko.rs@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$Extend init may be skipped due to NTFS version lower than 3. Be more clear on this.

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

