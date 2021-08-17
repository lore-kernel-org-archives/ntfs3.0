Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFFA72
	for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 19:39:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id f2so661045ljn.1
        for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZJxlGJHEO77T883an67egr7W9MXKSGEA9+xvPHrhu4=;
        b=uTunJJx6zTBGFQKxa37z5HQc6OIyHoZRrt04h6ooImO/2WgBSSzRzZenLeqTm/nsM9
         z/RQPwTeoWPrFxG7CnXaY21pLs61r+HH0FuSBNMgjKUFdjqiZQZhXlneW3K/Sax8xsXN
         BmJPXx+fIZZjqfYDJZ40AuzD6tTHtV7Si0yRX9S2PHIt7wVdqSHLv1kXm+6n6A1KcPtd
         GQ8+KitsOZu/JkazjNzxKsW9brtdqRZP2YNoMdK7X+KKFkQId7TLNfN9vx+AVpbTqCkq
         Nmf7qiGebWSFcfYYnSD+NAihKeplGO6OesKWBUPC/vblTB6eYPtyBd6aUOJovygG2r4j
         9W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZJxlGJHEO77T883an67egr7W9MXKSGEA9+xvPHrhu4=;
        b=d45tU3KMR/oTfFGcmI71EcHbUYpEknwGZxrKoqDjbw69IT/uYxoh5mDtZObPvdNn+Y
         mQXv2Alp+xzyxoWS+hFrBoKYLLfubxDiTjeli8R3/cJs8rlHxuBRuYNZJgyPzF8r4bag
         WPAhhfpZ7+7G25kgd/g+9jZLz8JFqqpIZjZcaKHgLiJIPXU+UiggKgX6xckS6bpZ8MTI
         ytfm2uqbyZQ75PBk0YTGfgR32USFNwIJmiNEN/05X2pkLcj/tW/38p2KU9K6dSRZe0Ox
         2k9hc9lTKOmgpmK+PlLUomwiJLN+ujF8DmjXSGPi69WpA5C1rmAO7irsr4f7kyZqzRKc
         AXmQ==
X-Gm-Message-State: AOAM532+ihPHT4KENTJi2LXrdxzV9NpsxyyhrDkgKi6lECIumurBdptm
	KnyXTj80jAqJcOmADQO4yFI=
X-Google-Smtp-Source: ABdhPJzioeRODhoJArqwaQogIAvoGPz61J7Qxg2TaOpbJ57iWPXREK5EmWkVijG/o9821UNJHKELCA==
X-Received: by 2002:a2e:a602:: with SMTP id v2mr4734864ljp.50.1629229161229;
        Tue, 17 Aug 2021 12:39:21 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id o28sm99697lfg.238.2021.08.17.12.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 12:39:20 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] fs/ntfs3: Fix one none utf8 char in source file
Date: Tue, 17 Aug 2021 22:38:13 +0300
Message-Id: <20210817193815.307182-2-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817193815.307182-1-kari.argillander@gmail.com>
References: <20210817193815.307182-1-kari.argillander@gmail.com>
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
I tested this for my self and at least it apply. Hopefully will apply also
there.
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

