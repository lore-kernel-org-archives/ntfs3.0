Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA172
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 08:34:55 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id t19so18009627lfe.13
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m+LGmeR60FWHgs4xdzy8QblxkagG3b3H0/egfK8g1+8=;
        b=jQjc45qhii4QdoeAi82n4lzXuR35YeMYqgJCNFpS0irFt4T9yQrNR3KwbU3Tjox6Fm
         7ZRRvFRTYOj0vVX1p0RDm5qxtXUD5lSWYwq0R+TahkrDUg6hIlVLTSjczZpWs6oM3wzD
         qULV6zesK39+BPEJqgQA3Gq15hOHH+HX++PNcHmPrVx7w5ueWPrpZrOgtcRIzZpy/TI1
         zHmx/meUK5ZXVyQZVcIX4IUOJScHGHpXF/JmJv3XOBwXB2OJrQF3MNllZpchpoUv8fo2
         QYsCDVVgU1li+vXQ8m6eIbJVMY5lK3D/JDVnA8CKUJ+Ge/tnG4eAoW3hZcKLIxlsSnsJ
         0Vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m+LGmeR60FWHgs4xdzy8QblxkagG3b3H0/egfK8g1+8=;
        b=FefUwOCsE4zx4ebb0IDjgaU7RvebKNRML1FQXw4pECKiWlPJtW1Oi/crhh11ybbScD
         Rk+zP1ID3AljfxOLbwsxQqHAIjzaSRnExxSew+HIqGqOS9gS6XCVDC4dkVmI4U54R0fh
         0XnAXecK9QiaVn+5GPcG1qJ5bFWbN5nP1sDUld/4iQnLdBIEn6ptLJsvt/wfKoBvigDk
         gCHMaW6k1firnbV0KAHOL/5GbrBS05zXO4EAYO8KqkR+Hwxhahy9l5Bu42V5KZxHHdCi
         54Ezt+wfcd+4Y3Y5NZxMWik4JUp8G/BVQNT/GUpNo83wrot7/A49EWfgC+llKeMQ9b7v
         mLVA==
X-Gm-Message-State: AOAM533wBsA3HgaaYZwX3qw+xgmpdIBK5mg9ArWrg44hnpi/enVbpftO
	QG+2VMPE74HJ64cmYm4s7FQ=
X-Google-Smtp-Source: ABdhPJzVE3f8EVnwVt+eekwHX5lmd0AFQA7UffXlh1GYVv/wop3r/lzWSZB8BlMIFRWHSW95aNiVQA==
X-Received: by 2002:a05:6512:304f:: with SMTP id b15mr12254996lfb.462.1631003693468;
        Tue, 07 Sep 2021 01:34:53 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id q30sm944771lfb.155.2021.09.07.01.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 01:34:53 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v2 2/4] fs/ntfs3: Place Comparisons constant right side of the test
Date: Tue,  7 Sep 2021 11:34:39 +0300
Message-Id: <20210907083441.3212-3-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907083441.3212-1-kari.argillander@gmail.com>
References: <20210907083441.3212-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For better code readability place constant always right side of the
test. This will also address checkpatch warning.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index d1477cabe3c7..d3c1c46cfb0a 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1606,7 +1606,7 @@ struct ATTR_FILE_NAME *ni_fname_type(struct ntfs_inode *ni, u8 name_type,
 
 	*le = NULL;
 
-	if (FILE_NAME_POSIX == name_type)
+	if (name_type == FILE_NAME_POSIX)
 		return NULL;
 
 	/* Enumerate all names. */
-- 
2.25.1

