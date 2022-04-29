Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19501851
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=CyYw8T+qukf404HNKztzaHFlirz/BOX9g+8WVJEmfQ0=; b=pnbT8Hzd/d+sSPW2g85GnrTFbR
	/wc//8WZVroAEfoW49Pbw1aLahqDjU9vq0OcbpTqM4se1PLVGC3b5I0JtS7s7PolofvTMwRgGseWL
	1ZhTejUgScHpFugb1sMndXuNqBQSygbW5T7N05OxU+xgH6Mdxe0ALcEdt4y+UvA95V+0j/i8eACXv
	lcClE4Czgt69UfxPethBv4i5tulNmyNTI7cZPVtiv1N4OmEq3+S9tXu3Lm4tXbwRgfBTrP41NmCLM
	/gBgXrszsMI7pFfMK/8up7Z9Svw/1QYSu+Fg4X9WEyrNnFLN6qtWzRNmWNUAoUmnS5o6Ef7rJaooe
	NIjSWLKA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkUOe-00C54G-PQ; Fri, 29 Apr 2022 17:27:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kari Argillander <kari.argillander@stargateuniverse.net>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] fs/ntfs3: validate BOOT sectors_per_clusters
Date: Fri, 29 Apr 2022 10:27:11 -0700
Message-Id: <20220429172711.31894-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the NTFS BOOT sectors_per_clusters field is > 0x80,
it represents a shift value. First change its sign to positive
and then make sure that the shift count is not too large.
This prevents negative shift values and shift values that are
larger than the field size.

Prevents this UBSAN error:

 UBSAN: shift-out-of-bounds in ../fs/ntfs3/super.c:673:16
 shift exponent -192 is negative

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kari Argillander <kari.argillander@stargateuniverse.net>
Cc: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/ntfs3/super.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20220428.orig/fs/ntfs3/super.c
+++ linux-next-20220428/fs/ntfs3/super.c
@@ -670,7 +670,8 @@ static u32 true_sectors_per_clst(const s
 {
 	return boot->sectors_per_clusters <= 0x80
 		       ? boot->sectors_per_clusters
-		       : (1u << (0 - boot->sectors_per_clusters));
+		       : -(s8)boot->sectors_per_clusters > 31 ? -1
+		       : (1u << -(s8)boot->sectors_per_clusters);
 }
 
 /*
@@ -713,7 +714,7 @@ static int ntfs_init_from_boot(struct su
 
 	/* cluster size: 512, 1K, 2K, 4K, ... 2M */
 	sct_per_clst = true_sectors_per_clst(boot);
-	if (!is_power_of_2(sct_per_clst))
+	if ((int)sct_per_clst < 0 || !is_power_of_2(sct_per_clst))
 		goto out;
 
 	mlcn = le64_to_cpu(boot->mft_clst);
