Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE73FF2
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:10:06 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id t19so5351433lfe.13
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lhs6ZtbTTAfte7OqmrSzspYuz4kpC1fa8cnVSBpcH/M=;
        b=AQJ+s9r1af+JC0IN3YS5W6YhO2dCwaRN0razykgXiqJf6YxvVa9mK3NPVSYcKKbKem
         lVbtc+Gtt7WwzBZ3435xnM1aB56KE7oSEdz8pLD+fpHB7atrjWKgWFv9lVqTbPIfiqyg
         TlGC6brqCFfAXypk4RNGg01lzoFeZwDL4W+vy8nslcbjtpjr1nUOam/zfTpwS+eE1TPc
         nx/OHRsmkOkxbeDvNhrIHWl1rir0MYmu53z411xgxGjumfB5Nm2e8ZhXP1NWjkbEFaPO
         DYdRID+k4V7ITcW7rpaq/Ur19MGdHfpO4XAPcxXLlhtPzbm5ADPQnCnYywQ9+oDWM2gP
         xDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lhs6ZtbTTAfte7OqmrSzspYuz4kpC1fa8cnVSBpcH/M=;
        b=wGcxsTmoFyK/CKSsL0M9QEMUro+WbrldetQ/EypVUnNgxDkVVolRqMCe17SUJGH47B
         anSOY4VB1kdZrPgu9kqFOTWx57M4pAi+PDLGQtDuQyQuHcTJ+Qeznn3VQy5gwlFhnV3V
         6PqSIE6oIHwJKOGTDatpfYYRJ5LztGkeujgw6XAsECtZgFD3rcOeQ8tEDzeiq0EtGH8k
         r8GU9Dgo1kuV3wCJfN9OxmqViCzee6w5+zjvCmjneT8R9+/bXbWBxVkkwLKtSbDnR3GB
         qpmOToksX6ZQsETOzTNCi8HtzcczgdZidDqN0uCkIl9HO7chCP23qXyFvc4hmFocD7Qr
         tdfw==
X-Gm-Message-State: AOAM532ooIQa9b0GtNnQJBNgaCc1I7Vg/0zUhHUJW0C7pmdWXsCehm3m
	FtibkC6zHV1dO/VUCNpweXA=
X-Google-Smtp-Source: ABdhPJwCudenO2kZniUnDmTBlPMPCIvy/dLpSGzFJ+HlwmF72/1L4inYVvqux81HWpnLCmQ+wfjeWA==
X-Received: by 2002:ac2:5dc9:: with SMTP id x9mr873081lfq.394.1631211004221;
        Thu, 09 Sep 2021 11:10:04 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:10:03 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 09/11] fs/ntfs3: Remove tmp pointer upcase in fill_super
Date: Thu,  9 Sep 2021 21:09:40 +0300
Message-Id: <20210909180942.8634-10-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909180942.8634-1-kari.argillander@gmail.com>
References: <20210909180942.8634-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can survive without this tmp point upcase. So remove it we don't have
so many tmp pointer in this function.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 14cb90a4c133..9a096be32fb2 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -886,7 +886,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	const struct VOLUME_INFO *info;
 	u32 idx, done, bytes;
 	struct ATTR_DEF_ENTRY *t;
-	u16 *upcase;
 	u16 *shared;
 	struct MFT_REF ref;
 
@@ -1186,11 +1185,9 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto out;
 	}
 
-	upcase = sbi->upcase;
-
 	for (idx = 0; idx < (0x10000 * sizeof(short) >> PAGE_SHIFT); idx++) {
 		const __le16 *src;
-		u16 *dst = Add2Ptr(upcase, idx << PAGE_SHIFT);
+		u16 *dst = Add2Ptr(sbi->upcase, idx << PAGE_SHIFT);
 		struct page *page = ntfs_map_page(inode->i_mapping, idx);
 
 		if (IS_ERR(page)) {
@@ -1209,10 +1206,10 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		ntfs_unmap_page(page);
 	}
 
-	shared = ntfs_set_shared(upcase, 0x10000 * sizeof(short));
-	if (shared && upcase != shared) {
+	shared = ntfs_set_shared(sbi->upcase, 0x10000 * sizeof(short));
+	if (shared && sbi->upcase != shared) {
+		kvfree(sbi->upcase);
 		sbi->upcase = shared;
-		kvfree(upcase);
 	}
 
 	iput(inode);
-- 
2.25.1

