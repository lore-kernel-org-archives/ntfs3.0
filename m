Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D91872
	for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 01:07:13 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id p38so1054670lfa.0
        for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GuxDKW/GAM+p5sLoLukWpyUcq/5PoDFOcuNKUo2nvms=;
        b=fzpDCJYElVK4OCtf3p8qUuPuFLOqX+84YQ5nFHwK2zAGgG6Xyxq4+IaHGVhhDerX4y
         kggUYcjKlA5Gi0dskcnG+1cds6PHzBEFgautI//svnSnQP1WvNcDY6WIY/PmabmVBkCP
         FEqJ+LEcUJwtZBev8efe0BtzlWtWdsIDovzDn7IJ9WQvWNRy/ilGXZP2eO//w+PwCfCQ
         M9949/xSVbqYm8LTYTLbboNjXfYZ/cfxzi7vgOawoArBbHoqQb2RRY+6NxUqwZxSybDm
         AS86XpTnoCBfTXz59eOsangzUwDdJ8EfZuFNUj8QoZY/z4n8zbLmWHL7y2T0K7JKRhq0
         nyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GuxDKW/GAM+p5sLoLukWpyUcq/5PoDFOcuNKUo2nvms=;
        b=Syqz+KyrX1IVGcorMtexKGvHZtcjku3SOjh7Onezw8qbBc6iT6oKLt66I0uYJ2cTmy
         KGeJC47u/NOec5yZu5oqgaNGUqxCCp9pXl5v6FN/vod9vMF9OZ54zr4/QznHdjkG6RM9
         RllkLKIyd97IxgmoNsj+Nv14k3p0wfdRlBSm+PFVcWFhOa6BmZMl6/0LaJKyJrdATO6X
         0hf2nMpRvM0ICiEzZBknlWc7zCReNtHq9/f4TZN+MlAX5JhuT0Fj5kMQDwUQTFdhWdXF
         22uhovN+pZsWqNF+y4FyOESb1HCXF+VE48MW3bvE3gRrgTAguzwMiKhotaicmsM/6AXs
         564g==
X-Gm-Message-State: AOAM532F+X0Ky9o9zeRm6RNzaajciUWApZGzAdEig2J+UmOKehFWTEg7
	AJJQph/5ECyg+lbArI7f/TM=
X-Google-Smtp-Source: ABdhPJw3Rqg1Zln5Q7IeqzZmRYjCDOncWGAbtZd2vJTnBW6CtT6adJnc8A/YSo8fz7odAAD6LgHjTQ==
X-Received: by 2002:a05:6512:3f28:: with SMTP id y40mr4616727lfa.345.1629248831288;
        Tue, 17 Aug 2021 18:07:11 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id j4sm400245ljh.120.2021.08.17.18.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:07:10 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v3 1/3] fs/ntfs3: Fix one none utf8 char in source file
Date: Wed, 18 Aug 2021 04:06:47 +0300
Message-Id: <20210818010649.412912-2-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818010649.412912-1-kari.argillander@gmail.com>
References: <20210818010649.412912-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In one source file there is for some reason non utf8 char. But hey this
is fs development so this kind of thing might happen.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index c3121bf9c62f..e377d72477df 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1784,7 +1784,7 @@ enum REPARSE_SIGN ni_parse_reparse(struct ntfs_inode *ni, struct ATTRIB *attr,
 		/*
 		 * WOF - Windows Overlay Filter - used to compress files with lzx/xpress
 		 * Unlike native NTFS file compression, the Windows Overlay Filter supports
-		 * only read operations. This means that it doesn’t need to sector-align each
+		 * only read operations. This means that it doesn't need to sector-align each
 		 * compressed chunk, so the compressed data can be packed more tightly together.
 		 * If you open the file for writing, the Windows Overlay Filter just decompresses
 		 * the entire file, turning it back into a plain file.
-- 
2.25.1

