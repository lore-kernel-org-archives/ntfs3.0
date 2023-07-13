Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6884688
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 03:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KarKDnAdc5ICiKgriHUs+5HIqBDCfuIyL8uoPMfdtgg=; b=ur4gJ0F4o1/TWO3SHQnYnth3Yi
	zibcyPEy9vabUq9Bi7uSwmrb5LEhyXMLqQBHOPcEhnMdb1df+8ue1EV1/S0LivBGHEzvrjh1bmQfO
	WY7Hx6D0GILcyJWTHNMC6Bwp1i2zJUCwtEGYIVbbA777fGlsZyuRqFw96x9koSqlMmPXtL/zUzXUE
	OSJITXRpnTgZv19m7/9aigyvZamxYnHeKARFvjV+mQsBai0Gr2YtlZok1NtsZO95bx/GjzYD5k1KK
	mN1DID+3DD8SxcRU2pyiiFnLN7PoZfz0wY5Y4u8aaw4GxdHc7Mk5dqsQwUCi2Th4SnqlPYHkReDIZ
	2SlqcDLw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJnQA-00HMre-81; Thu, 13 Jul 2023 03:55:14 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Sterba <dsterba@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	"Theodore Tso" <tytso@mit.edu>,
	Jan Kara <jack@suse.com>,
	linux-ext4@vger.kernel.org
Subject: [PATCH 1/7] highmem: Add memcpy_to_folio() and memcpy_from_folio()
Date: Thu, 13 Jul 2023 04:55:06 +0100
Message-Id: <20230713035512.4139457-2-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230713035512.4139457-1-willy@infradead.org>
References: <20230713035512.4139457-1-willy@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the folio equivalent of memcpy_to_page() and memcpy_from_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/highmem.h | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 68da30625a6c..0280f57d4744 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -439,6 +439,50 @@ static inline void memzero_page(struct page *page, size_t offset, size_t len)
 	kunmap_local(addr);
 }
 
+static inline void memcpy_from_folio(char *to, struct folio *folio,
+		size_t offset, size_t len)
+{
+	VM_BUG_ON(offset + len > folio_size(folio));
+
+	do {
+		char *from = kmap_local_folio(folio, offset);
+		size_t chunk = len;
+
+		if (folio_test_highmem(folio) &&
+		    (chunk > (PAGE_SIZE - offset_in_page(offset))))
+			chunk = PAGE_SIZE - offset_in_page(offset);
+		memcpy(to, from, len);
+		kunmap_local(from);
+
+		from += chunk;
+		offset += chunk;
+		len -= chunk;
+	} while (len > 0);
+}
+
+static inline void memcpy_to_folio(struct folio *folio, size_t offset,
+		const char *from, size_t len)
+{
+	VM_BUG_ON(offset + len > folio_size(folio));
+
+	do {
+		char *to = kmap_local_folio(folio, offset);
+		size_t chunk = len;
+
+		if (folio_test_highmem(folio) &&
+		    (chunk > (PAGE_SIZE - offset_in_page(offset))))
+			chunk = PAGE_SIZE - offset_in_page(offset);
+		memcpy(to, from, len);
+		kunmap_local(to);
+
+		from += chunk;
+		offset += chunk;
+		len -= chunk;
+	} while (len > 0);
+
+	flush_dcache_folio(folio);
+}
+
 /**
  * memcpy_from_file_folio - Copy some bytes from a file folio.
  * @to: The destination buffer.
-- 
2.39.2

