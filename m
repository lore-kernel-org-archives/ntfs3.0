Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A8372
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 08:35:00 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id z2so18083097lft.1
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CtxYUHHPIcThwVP0UB7Lx6CHuiQRrXcZpwKxsh057eE=;
        b=apfvhDIqPlNvssNiHUw0pFzamwVhtrnZ3nJs1bqYOMKQA/Jr78142NiUlS52qnSYjs
         OrT9PaBOxBlovDH+usrbkPBISIdcjfqEUFS2yYsT5ayLxF6f60O7bVrAqjowCeUR3OCL
         FoEiYE5y4EFTQIjBQiHjv3lyes7cEei6TooxkMRxTU4aBorpTvN99owc0x6eLHZVdjW9
         reNVWuhjD0hIlozDYHLXSNQWW3qNdMoYjNWgp3gP2Opib32lcVHmGN5hVlX0LRfew5G9
         QzgwUATRUMXdazN854a57ZEa2jvlrZzsCQqX3QoHrRTMzUvS1BTB5cpro29qGOuHzPY4
         ndTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CtxYUHHPIcThwVP0UB7Lx6CHuiQRrXcZpwKxsh057eE=;
        b=Xco1fPQur2z7AtdtkFJKSw0rxZ0n+zuoK+BQjHK+AAmfZyzKQthn1TzImkWm18S4Ly
         U+EHcJ8vVfs+O3L0LAPtwjb9Hb97GJB4hn84CWxkoscmqWkoVRgIuqOZXvYXGnzjlhEk
         cETF/wPiV4XkyLyXiuj2mz4WoKLmkBpDLVqQ9OOlEr+S9oapuvzWXXOIsajCWMvO9MSZ
         7bHdtreX2rol6Sb1RGxDrsknwwVM8G2v2Z8yz+VyKrogre/6+eD2jEeZUJqTXNsEXFTD
         x4Kyop4KtG2oWUG/VIZHnPyiMTrZPVpIN44sNjsa0RIJIrzcy/akeTbxq9/U/tpNhj7d
         SEOw==
X-Gm-Message-State: AOAM533RzU6MzRTcl3wJ6R0uaI5w3oLyrxe0hkTHRIYq0Vi8Xh4zhX+C
	HmE65YMhM6oT0CwMgh9B8qE=
X-Google-Smtp-Source: ABdhPJzqGUIQX2CxiYHmC8tth8p2KwumY2EB/qBr640tCazomTuKlKAsJi8Eh8AB9rvHJpZdMeYvfA==
X-Received: by 2002:ac2:4106:: with SMTP id b6mr12534866lfi.89.1631003698230;
        Tue, 07 Sep 2021 01:34:58 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id q30sm944771lfb.155.2021.09.07.01.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 01:34:57 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v2 4/4] fs/ntfs3: Remove tabs before spaces from comment
Date: Tue,  7 Sep 2021 11:34:41 +0300
Message-Id: <20210907083441.3212-5-kari.argillander@gmail.com>
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

Remove tabs before spaces from comment as recommended by kernel coding
style. Checkpatch also warn about these.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/lznt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/lznt.c b/fs/ntfs3/lznt.c
index f1f691a67cc4..734a251deae9 100644
--- a/fs/ntfs3/lznt.c
+++ b/fs/ntfs3/lznt.c
@@ -292,7 +292,7 @@ static inline ssize_t decompress_chunk(u8 *unc, u8 *unc_end, const u8 *cmpr,
 /*
  * get_lznt_ctx
  * @level: 0 - Standard compression.
- * 	   !0 - Best compression, requires a lot of cpu.
+ *	   !0 - Best compression, requires a lot of cpu.
  */
 struct lznt *get_lznt_ctx(int level)
 {
-- 
2.25.1

