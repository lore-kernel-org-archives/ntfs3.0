Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024F2F2A
	for <ntfs3@lists.linux.dev>; Mon,  2 May 2022 17:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=PBbOMa0t5tq4c8Nbs7EdlafVIyjMt0zu5ylmUAL/VO8=; b=ms5w7nD2BXu1K/rtu9Kop/Pb9G
	5NkuuqgAdF7fSbC2tEaFgseXrVTS9jotzPe718A2TaagTB4Sg8BHOa56uTzua8QxfKyCLnjeUUsbe
	18ALn+ZVjOCIjsC7kX4ADglAcM5jMbtzUUckuBZeQqP8h2pk2xDTfmDp7tKl0Oo+j7aKLi0nsrR2D
	ytFrAbpZaSDUXlll2TnYOxuhqOJNC2VCwT1+rxD1MK30xxgq69vhz9HxVvV+qUS8ofTJdzAqMPUpU
	K1B+konVuNHtSaafNjtW3r5ShqtPPGTPprLTMEH4naErsNMDS9Q4DcwzeBOMaQ0w82rtafvojbCRw
	k0XkOPvw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlaEz-0025wT-1L; Mon, 02 May 2022 17:53:45 +0000
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
Subject: [PATCH v3] fs/ntfs3: validate BOOT sectors_per_clusters
Date: Mon,  2 May 2022 10:53:42 -0700
Message-Id: <20220502175342.20296-1-rdunlap@infradead.org>
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
not too large before using it (NTFS max cluster size is 2MB).
Return -EVINVAL if it too large.

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
v3: use Namjae's suggestions -- but now Konstantin can decide.
    drop Willy's Rev-by: tag due to changes

 fs/ntfs3/super.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

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
+	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
+		return 1U << (0 - boot->sectors_per_clusters);
+	return -EINVAL;
 }
 
 /*
@@ -713,6 +715,8 @@ static int ntfs_init_from_boot(struct su
 
 	/* cluster size: 512, 1K, 2K, 4K, ... 2M */
 	sct_per_clst = true_sectors_per_clst(boot);
+	if ((int)sct_per_clst < 0)
+		goto out;
 	if (!is_power_of_2(sct_per_clst))
 		goto out;
 
