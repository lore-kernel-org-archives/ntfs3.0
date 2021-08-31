Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1572
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 18:15:22 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id i28so229352ljm.7
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 11:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a/2+IO+onR8n3ZdfuwB5lM1ps4vOPHv1OrjjTrVRTCk=;
        b=X0ufsWfC9N2z4/uotq23vGlo/DdqC+468GqPtNuc1ZZfkah7kMxpeku5LUa9pPVVH+
         TmWaglhxqM2zYn1HRHLkMhgeU8GgkEefvt3gA9U7CPFqiu18mEllBf6br8uo/VF7RVYo
         vuSImix2ItWDgrpRdbjLgfyxGDmxG0BJvNJvJNxVLtDdmrShZaXBLrOjOCJ+zXD7gA+r
         If0dgYQk9rhRpbxyhrzFLL11zbsKubj/F4bY9dEJ1B86QOXvHBcK7UzFGPRCS9w5DO7W
         5fv/MjFwb2VWAHeBpssB14VYKbmiaRyiSVKnqK+y/k6BNcpuxvn9/LzCdd/drCH2kLj9
         xaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/2+IO+onR8n3ZdfuwB5lM1ps4vOPHv1OrjjTrVRTCk=;
        b=X7PN2Ptej/TIw6g8HlMeXvO3x0bdUZvhpfnfP+cekTuSHbWQLp4JkPRgd+sYjsXVno
         xIHlqHnRyYxSXRvmtKogMNHqQYUdPuCFHosBpPRLMzjVQ8nqnxNx222xzkRPG+8mo1KR
         3CGMqtiBBxO6n/dkX2l8+mPftNFMgDCI/UqalTlaiMAQI/dSIyfl1kDaHpxUu9tWmtJt
         zubT6PpM9DIf8eZooH+Y54k6YnMEgJcdBzjKwUTLqlDas254vOJZdb9GvAHoyHA/QZz0
         bEM2H9cwbKrAR4oCuUEb1HzVeCyeGD/BP5rkfpHAys+Ay5+aUA7xVI8lhvJqyJjFRj4l
         TqPg==
X-Gm-Message-State: AOAM5321pN6MrA76PHXQ9jLW5aOBRiEJb2aZcEX7DQpZcLOOwmd6s2/p
	XDIxRGPoaj0Ge74k4RTah4Q=
X-Google-Smtp-Source: ABdhPJxhmdZK3kigK1ngsxDNVQmlXUBtaQ3R9N3n636p96WyNZX9i6F2MzjU99X5en0g7aZpxIpBkg==
X-Received: by 2002:a2e:84c5:: with SMTP id q5mr7039974ljh.43.1630433720728;
        Tue, 31 Aug 2021 11:15:20 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z11sm2270757ljn.114.2021.08.31.11.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 11:15:20 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] fs/ntfs3: Remove braces from single statment block
Date: Tue, 31 Aug 2021 21:15:04 +0300
Message-Id: <20210831181505.1074767-5-kari.argillander@gmail.com>
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

Remove braces from single statment block as they are not needed. Also
Linux kernel coding style guide recommend this and checkpatch warn about
this.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/frecord.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bc3887635012..61448325c4d1 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2906,9 +2906,9 @@ bool ni_remove_name_undo(struct ntfs_inode *dir_ni, struct ntfs_inode *ni,
 		memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), de + 1, de_key_size);
 		mi_get_ref(&ni->mi, &de->ref);
 
-		if (indx_insert_entry(&dir_ni->dir, dir_ni, de, sbi, NULL, 1)) {
+		if (indx_insert_entry(&dir_ni->dir, dir_ni, de, sbi, NULL, 1))
 			return false;
-		}
+
 	}
 
 	return true;
-- 
2.25.1

