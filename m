Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EE5ECE
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 03:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=W0UYXwWjWGda5omCDxw1jAlh390Lk5TbGcfd3nEU6uE=; b=LRqHvclw5T4FaH8TRmIhenQus/
	ki6KdHGC98/kq7B7fdscjEH+dx/6NClTrk+nPnZo2txh+X0ura3Z57FPxOmRqZYaKu1IBBgBp3Stj
	udId/40CzjMN71gdsy9O489V0KjWEY3t+BDw6lWN2LSPPCsm63yiP3XRiIPA+tlDmsQy0B4CJ8sQA
	lErTqVmfPayPxj6jzEE1IkakDLp+7G/JhdTBnJ+4ErBpIGFFt78zD34/oRemUcsvy8HOKVxiEXnc8
	V8WL/M/E3P4RUIJU69kXS5jJRFWQe4iTfyPOqPenlw+PtcmmnAQICVsH3UnAfg4Ool8Na71sQyvDm
	NmA+BO0Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJnQA-00HMrk-Gp; Thu, 13 Jul 2023 03:55:14 +0000
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
Subject: [PATCH 4/7] migrate: Use folio_set_bh() instead of set_bh_page()
Date: Thu, 13 Jul 2023 04:55:09 +0100
Message-Id: <20230713035512.4139457-5-willy@infradead.org>
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

This function was converted before folio_set_bh() existed.  Catch
up to the new API.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index af8557d78549..1363053894ce 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -773,7 +773,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
 
 	bh = head;
 	do {
-		set_bh_page(bh, &dst->page, bh_offset(bh));
+		folio_set_bh(bh, dst, bh_offset(bh));
 		bh = bh->b_this_page;
 	} while (bh != head);
 
-- 
2.39.2

