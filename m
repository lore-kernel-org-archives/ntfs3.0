Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6497372
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 18:15:21 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id s10so621785lfr.11
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 11:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JHwVl9p3WIdSGjWbPUSNGnijhNENWZWD5QfH1eVWlE4=;
        b=cRaWoteDywWKRle0O6x88j38TTkXzjFwy28g2Z7CtEEsieen3UuD4OcN76wU9rkEY0
         MYvfdkZ6lQ75oYM74QcpDX31P/vaHdnxu0N+IXd0qn+eNFuS3U6ty+hAJauRO0RFVLL9
         IKFbPK3uqSg2av/EVmfs5hzs0HDx/Q3VWmJGVh1caUQhYAFP30N3R4YQ6/Tcy0D2mFJc
         iB4WJQl4hI8tSVURmf2ZAummiaHV3QhrW2JVnlf1xCpGUlGXUDrGY+kcOwMW1kgSLAkN
         b7HEZxRTWHV9RFsCD0+OVAAfjH7zhRnbzeiw1nfz6RXnW0th9PPxZOHveY3sGbmm6Ig8
         DW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JHwVl9p3WIdSGjWbPUSNGnijhNENWZWD5QfH1eVWlE4=;
        b=PcS++46GZ6l/VGyZYxi9iEhxyPX71uBnwENL/ayFmAmDbKftyyNI8vSEBDdkZO5E4h
         9xkndpexjoxezexT8jn5V9HK1zHviy1CVib0GRwNr8pGG/5zeb6IVJxol4dJde8fFvRb
         I0uTJRDBFreEqPHImnjgfydLadJSR9+NZP8I8JedW+xIhkbTV/o3l/hn+z3//5pkL9qT
         POH84vt9i1Forx70+KWq6pq+hMRMcEShPpuleZ0QGblUDjDvRIdec1U2h6or7MSwJ+Ey
         loZQTSCZx7koe2ZGPCBaWnV86nDf2z2TxOA9vO0jqDm9zX7Wc8FfxeKmRFSbxBazPjEV
         19wQ==
X-Gm-Message-State: AOAM5312t+Re9OvbN2WReifbmQuAaBxedDVwjneFWsJRNGZFE9TPj+vf
	Keh3KdAWo7ifz9Tl3X+ysoI=
X-Google-Smtp-Source: ABdhPJxfH0Jemwd+4N04GgmmLpXPStD7IWJ37erkb6a9OETOhF+smVyfGWrUXJX3wP7U5LbP1gitlw==
X-Received: by 2002:a05:6512:302:: with SMTP id t2mr11287728lfp.87.1630433719610;
        Tue, 31 Aug 2021 11:15:19 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z11sm2270757ljn.114.2021.08.31.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 11:15:19 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] fs/ntfs3: Place Comparisons constant right side of the test
Date: Tue, 31 Aug 2021 21:15:03 +0300
Message-Id: <20210831181505.1074767-4-kari.argillander@gmail.com>
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

For better code readability place constant always right side of the
test. This will also address checkpatch warning.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index b207d260ac06..bc3887635012 100644
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

