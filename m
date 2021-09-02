Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24562FAE
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 15:41:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id t12so5075134lfg.9
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XgijCMskJCudI7TkVSpuxsd8r1TstWnscrMUPwKfNPs=;
        b=TwnK0M6enZJhf6vbeFDvzMNtUP1ZY/y41L1KRui7iSoipB6QWPldyRLIpqlElinvy+
         PSrMdLatHvBSOzopsofanLtrTjrWxgy3esY4kjA/GlwyFhGPGvI0WirCq853F+fPbaPK
         R7o8h8iNcXZExWXX9kVhulZxrZO+6WQf7eAWY3ZWdtyQfnTobBRa7/h5sngCZfEjtz2v
         EqTwibScbH3/yuRRpTuiNKuU+J5ezUbUA2gGiw2puHo5c50VvEoqM/mCud5F8PHmnxo/
         FwK6iu1pxl+0oCh5vFU3Xsy/FieT7z9zDv945FMtHp9UpxklkViho+nJP8TITI7nsCwh
         4xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XgijCMskJCudI7TkVSpuxsd8r1TstWnscrMUPwKfNPs=;
        b=PnOUOfQ7fggHQwtUS7bVV9/gykAL9Blgl5mW6Zm0/SrDBY6Dxig2Slu/dKkM5f2Ujg
         JVsWrDoVtmF7bs6bTJBLgGAdFwL9fKc9UfGdj0a6ScHDZO/ialh4WmWxGtTl/9J0IoVy
         CojorLSe25RcxCbsyHOkIv1LeuDZiviIFJoWY+LIfnTxmgSlv7Tv7tQZBxcKdKitoLJ7
         WurWaxQKP6lHHH2ul+azQYfmSCjfcJicKmXVQJW9wJHgil/5fU7T0QV1V/CdLSVy3i3R
         Z1o/9fNztFck/QMdNR5EDUiKx5khgcVbdl07nXLBNf9b9j+lwZPfSj6Ti3siX8XS6c8p
         /A0w==
X-Gm-Message-State: AOAM532FOYMS2HJNoTqee134aScRagIR0QhH19iWaUSTxVNAaLoB+heh
	v+7kVLSSzw6WWwTKpfrU9mc=
X-Google-Smtp-Source: ABdhPJwd8XTj24Ih9FVnFHeCUJnlSlWVHL2uQQs4QgZaIj8Yl/Bqy6xZDaxOG4hEI+CROHGNlBch0Q==
X-Received: by 2002:a05:6512:1695:: with SMTP id bu21mr3143133lfb.506.1630597264862;
        Thu, 02 Sep 2021 08:41:04 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id 25sm258630ljw.31.2021.09.02.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 08:41:04 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH 1/3] fs/ntfs3: Limit binary search table size
Date: Thu,  2 Sep 2021 18:40:48 +0300
Message-Id: <20210902154050.5075-2-kari.argillander@gmail.com>
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

Current binary search allocates memory for table and fill whole table
before we start actual binary search. This is quite inefficient because
table fill will always be O(n). Also if table is huge we need to
reallocate memory which is costly.

This implementation use just stack memory and always when table is full
we will check if last element is <= and if not start table fill again.
The idea was that it would be same cost as table reallocation.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/index.c | 110 ++++++++++++++++++-----------------------------
 1 file changed, 41 insertions(+), 69 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 0daca9adc54c..8bac9d20e7e3 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -678,98 +678,70 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 	u32 off = le32_to_cpu(hdr->de_off);
 
 #ifdef NTFS3_INDEX_BINARY_SEARCH
-	int max_idx = 0, fnd, min_idx;
-	int nslots = 64;
-	u16 *offs;
+	struct NTFS_DE *found = NULL;
+	int min_idx = 0, mid_idx, max_idx = 0;
+	int diff2;
+	u16 offs[64];
 
 	if (end > 0x10000)
 		goto next;
 
-	offs = kmalloc(sizeof(u16) * nslots, GFP_NOFS);
-	if (!offs)
-		goto next;
+fill_table:
+	if (off + sizeof(struct NTFS_DE) > end)
+		return NULL;
 
-	/* Use binary search algorithm. */
-next1:
-	if (off + sizeof(struct NTFS_DE) > end) {
-		e = NULL;
-		goto out1;
-	}
 	e = Add2Ptr(hdr, off);
 	e_size = le16_to_cpu(e->size);
 
-	if (e_size < sizeof(struct NTFS_DE) || off + e_size > end) {
-		e = NULL;
-		goto out1;
-	}
-
-	if (max_idx >= nslots) {
-		u16 *ptr;
-		int new_slots = ALIGN(2 * nslots, 8);
-
-		ptr = kmalloc(sizeof(u16) * new_slots, GFP_NOFS);
-		if (ptr)
-			memcpy(ptr, offs, sizeof(u16) * max_idx);
-		kfree(offs);
-		offs = ptr;
-		nslots = new_slots;
-		if (!ptr)
-			goto next;
-	}
-
-	/* Store entry table. */
-	offs[max_idx] = off;
+	if (e_size < sizeof(struct NTFS_DE) || off + e_size > end)
+		return NULL;
 
 	if (!de_is_last(e)) {
+		offs[max_idx] = off;
 		off += e_size;
-		max_idx += 1;
-		goto next1;
-	}
 
-	/*
-	 * Table of pointers is created.
-	 * Use binary search to find entry that is <= to the search value.
-	 */
-	fnd = -1;
-	min_idx = 0;
+		max_idx++;
+		if (max_idx < ARRAY_SIZE(offs))
+			goto fill_table;
 
-	while (min_idx <= max_idx) {
-		int mid_idx = min_idx + ((max_idx - min_idx) >> 1);
-		int diff2;
-
-		e = Add2Ptr(hdr, offs[mid_idx]);
+		max_idx--;
+	}
 
-		e_key_len = le16_to_cpu(e->key_size);
+binary_search:
+	e_key_len = le16_to_cpu(e->key_size);
 
-		diff2 = (*cmp)(key, key_len, e + 1, e_key_len, ctx);
+	diff2 = (*cmp)(key, key_len, e + 1, e_key_len, ctx);
+	if (diff2 > 0) {
+		if (found) {
+			min_idx = mid_idx + 1;
+		} else {
+			if (de_is_last(e))
+				return NULL;
 
-		if (!diff2) {
-			*diff = 0;
-			goto out1;
+			max_idx = 0;
+			goto fill_table;
 		}
-
-		if (diff2 < 0) {
+	} else if (diff2 < 0) {
+		if (found)
 			max_idx = mid_idx - 1;
-			fnd = mid_idx;
-			if (!fnd)
-				break;
-		} else {
-			min_idx = mid_idx + 1;
-		}
-	}
+		else
+			max_idx--;
 
-	if (fnd == -1) {
-		e = NULL;
-		goto out1;
+		found = e;
+	} else {
+		*diff = 0;
+		return e;
 	}
 
-	*diff = -1;
-	e = Add2Ptr(hdr, offs[fnd]);
+	if (min_idx > max_idx) {
+		*diff = -1;
+		return found;
+	}
 
-out1:
-	kfree(offs);
+	mid_idx = (min_idx + max_idx) >> 1;
+	e = Add2Ptr(hdr, offs[mid_idx]);
 
-	return e;
+	goto binary_search;
 #endif
 
 next:
-- 
2.25.1

