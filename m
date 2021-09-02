Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9962FAE
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 15:41:18 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id j12so4361609ljg.10
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CWOCfRNG4fQxLJ+Kx3A/4ZxyhuIqTzTqHfmxkowqQ50=;
        b=QiABlvpngTc2hmqTZwFxfMqoXdBZmSExZY2nD9oSQiunGlkWWNqH6PD99EZbwBWBR5
         Zw7UDZnL30TzcsU9nQiTva7yAQH/5wQaUmkcQUN+N4ykHA7nr3yEgqFJC/3sfIAwAtEn
         Is8cykLiA+mi5dj30RHJ8Vrgxt30eHIqXY7RFGG1S67snsD463Ke7txMFFMuyQOs1pTf
         G8gs+EHwsupBz56p54H4v91MkTwF6mo/uR39G3cuKg6d82b3zaBySROeUnovBWfWzTnk
         60z5OTEIGd+twjKeAa329BBGwcXy8L38gDKWO4rjr7RoZ/v6IvmrEyolG5UuydE+2oOU
         srdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CWOCfRNG4fQxLJ+Kx3A/4ZxyhuIqTzTqHfmxkowqQ50=;
        b=JcTNiE6GN30E8nrmLbFeyadBVBpmF8OdGyysRUHQYA0+ltnSxdEvl4/jXMzQnI62OX
         49QB8hayaelD4wkRfCr09zS6QOyiMJn7iPVhHx8/q0/tyh2BEloQpLC4v1TvP491/DUR
         7tDjB+aEpiMziWgXsqofoUdukLQ71D5NtA9Au6BE6Th0ZCfIhXpbBHdlS09wfKLLIrHd
         pbpyur4azTlMn/JgDzE5SgbqJc20/2JfV6cqqovPKRC5/PO4Povb/oo+8ZRq+g5GpA5e
         71sCcGUSaJKAE6LNnK6L5rw+lRE4Q+IHjcPVxixVwWoti7q63XE/n38GIu65+QY2BnYd
         LFSg==
X-Gm-Message-State: AOAM533rwMIpdm7oOlsw5pvGnMdHLJd4VyUi+sYuk1v2/6OsH7MWQBYj
	xMkFCATCn6aGMi1fFtOuv/8=
X-Google-Smtp-Source: ABdhPJwu/E5UHn4JyscXGjtZbMUB43RYv3rVpsyBX5OCA//v2x8IKsvJ2nKiVk36RGKF8DFXZVQD5w==
X-Received: by 2002:a2e:9055:: with SMTP id n21mr3037707ljg.451.1630597276737;
        Thu, 02 Sep 2021 08:41:16 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id 25sm258630ljw.31.2021.09.02.08.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 08:41:16 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH 3/3] fs/ntfs3: Always use binary search with entry search
Date: Thu,  2 Sep 2021 18:40:50 +0300
Message-Id: <20210902154050.5075-4-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902154050.5075-1-kari.argillander@gmail.com>
References: <20210902154050.5075-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We do not have any reason to keep old linear search in. Before this was
used for error path or if table was so big that it cannot be allocated.
Current binary search implementation won't need error path. Remove old
references to linear entry search.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/index.c | 50 ++++++------------------------------------------
 fs/ntfs3/ntfs.h  |  3 ---
 2 files changed, 6 insertions(+), 47 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index e336d5645628..9f79cff7d09e 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -672,22 +672,16 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 				  const struct INDEX_HDR *hdr, const void *key,
 				  size_t key_len, const void *ctx, int *diff)
 {
-	struct NTFS_DE *e;
+	struct NTFS_DE *e, *found = NULL;
 	NTFS_CMP_FUNC cmp = indx->cmp;
+	int min_idx = 0, mid_idx, max_idx = 0;
+	int diff2;
+	int table_size = 8;
 	u32 e_size, e_key_len;
 	u32 end = le32_to_cpu(hdr->used);
 	u32 off = le32_to_cpu(hdr->de_off);
-
-#ifdef NTFS3_INDEX_BINARY_SEARCH
-	struct NTFS_DE *found = NULL;
-	int min_idx = 0, mid_idx, max_idx = 0;
-	int table_size = 8;
-	int diff2;
 	u16 offs[128];
 
-	if (end > 0x10000)
-		goto next;
-
 fill_table:
 	if (off + sizeof(struct NTFS_DE) > end)
 		return NULL;
@@ -721,7 +715,8 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 				return NULL;
 
 			max_idx = 0;
-			table_size = min(table_size * 2, 128);
+			table_size = min(table_size * 2,
+					 (int)ARRAY_SIZE(offs));
 			goto fill_table;
 		}
 	} else if (diff2 < 0) {
@@ -745,39 +740,6 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 	e = Add2Ptr(hdr, offs[mid_idx]);
 
 	goto binary_search;
-#endif
-
-next:
-	/*
-	 * Entries index are sorted.
-	 * Enumerate all entries until we find entry
-	 * that is <= to the search value.
-	 */
-	if (off + sizeof(struct NTFS_DE) > end)
-		return NULL;
-
-	e = Add2Ptr(hdr, off);
-	e_size = le16_to_cpu(e->size);
-
-	if (e_size < sizeof(struct NTFS_DE) || off + e_size > end)
-		return NULL;
-
-	off += e_size;
-
-	e_key_len = le16_to_cpu(e->key_size);
-
-	*diff = (*cmp)(key, key_len, e + 1, e_key_len, ctx);
-	if (!*diff)
-		return e;
-
-	if (*diff <= 0)
-		return e;
-
-	if (de_is_last(e)) {
-		*diff = 1;
-		return e;
-	}
-	goto next;
 }
 
 /*
diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 6bb3e595263b..a7e1b7cc7a14 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -12,9 +12,6 @@
 
 /* TODO: Check 4K MFT record and 512 bytes cluster. */
 
-/* Activate this define to use binary search in indexes. */
-#define NTFS3_INDEX_BINARY_SEARCH
-
 /* Check each run for marked clusters. */
 #define NTFS3_CHECK_FREE_CLST
 
-- 
2.25.1

