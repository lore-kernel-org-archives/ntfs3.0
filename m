Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE293FD5
	for <ntfs3@lists.linux.dev>; Fri,  3 Sep 2021 13:25:05 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1463F4060A;
	Fri,  3 Sep 2021 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1630675499;
	bh=sfWVSkiVXrsH15ykdL6F1vaX2G6vomR361T+ZKMS4bk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=ayvrDtnfNQ1bjF5hZ4vvzMrfEXmqcD90XQojCtdQ4D7WyR3ZXwUKLxHGOpl8KlDnF
	 l9FosKX/xPMdlnrg+VwCujg7vzhUBzNYZMMT49rJxfa210CYhUJDpf0bNh6yJyLmex
	 XIz4zLm+lfBDId6qSzP4cJl4cZ7DwvCwVRx5KILRpymhY/r5vwDSdXlVqkGR8G/ol8
	 46eRbkWUv5rGtIbXxplLSznxSbQTPoBTLcn7vgEY589J+acVPm46RBLmp180H16WiA
	 yUYBFWs3o30RPxhVrYKbMFjWWLoU5L2VE+Oi0mayvNlIT/DNiJfaC2Zew9BKedNGHk
	 hAIu0mKDjKs5g==
From: Colin King <colin.king@canonical.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] fs/ntfs3: Remove redundant initialization of variable err
Date: Fri,  3 Sep 2021 14:24:58 +0100
Message-Id: <20210903132458.14342-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read, it
is being updated later on. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ntfs3/index.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 0daca9adc54c..b1175542d854 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1401,7 +1401,7 @@ int indx_find_raw(struct ntfs_index *indx, struct ntfs_inode *ni,
 static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 				CLST *vbn)
 {
-	int err = -ENOMEM;
+	int err;
 	struct ntfs_sb_info *sbi = ni->mi.sbi;
 	struct ATTRIB *bitmap;
 	struct ATTRIB *alloc;
-- 
2.32.0

