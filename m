Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1077B
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 20:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=zHUUINo4yJyTYlJWIEO+i+Gv3G+bm3CvTusmM0IYPVI=; b=f5lR+EeHsnnOgPEzU6di73+m3G
	uKLi3qL6+sobcmacijRGPPmDQ33mbxyCuzCERsxrykXcC5CkBt/yNr087twyORevf8wnNtR6e2KGP
	N5N/LMBJv+z8lljhYZqaUZ3vROuSa4IpftNKp9RE8o7FLqQijabSNya6flipQxfONQb3VuXUcgfbR
	3NxV38aJUl9yT8ONaJZdwo9jwCYjaCkq99gZh/M57DfbYkkPcGVDGPmQQnJ9Ucm34H5h86R1HeAMz
	I546vl/PvM6/Gdnpo36jqgk3VQiZrsmBVMjD0KNMpgrV5UL14TAnFOKJ9zoc0yw4mi8kZbQze1Ucd
	j5LW98YA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkWnV-00CON3-2c; Fri, 29 Apr 2022 20:01:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kari Argillander <kari.argillander@stargateuniverse.net>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2] fs/ntfs3: validate BOOT sectors_per_clusters
Date: Fri, 29 Apr 2022 13:01:00 -0700
Message-Id: <20220429200100.22659-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the NTFS BOOT sectors_per_clusters field is > 0x80,
it represents a shift value. Make sure that the shift value is
not too large (> 31) before using it. Return 0xffffffff if it is.

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
Cc: Matthew Wilcox <willy@infradead.org>
---
v2: use Willy's suggestions

 fs/ntfs3/super.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- linux-next-20220428.orig/fs/ntfs3/super.c
+++ linux-next-20220428/fs/ntfs3/super.c
@@ -668,9 +668,11 @@ static u32 format_size_gb(const u64 byte
 
 static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
 {
-	return boot->sectors_per_clusters <= 0x80
-		       ? boot->sectors_per_clusters
-		       : (1u << (0 - boot->sectors_per_clusters));
+	if (boot->sectors_per_clusters <= 0x80)
+		return boot->sectors_per_clusters;
+	if (boot->sectors_per_clusters > 0xe0) /* limit to 31-bit shift */
+		return 1U << (0 - boot->sectors_per_clusters);
+	return 0xffffffff;
 }
 
 /*
