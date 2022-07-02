Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030D63D8E
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 18:29:48 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 7hsIoTjZy4Ltq7hsIonixx; Sat, 02 Jul 2022 20:29:46 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 02 Jul 2022 20:29:46 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: agk@redhat.com,
	snitzer@kernel.org,
	dm-devel@redhat.com,
	vneethv@linux.ibm.com,
	oberpar@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	almaz.alexandrovich@paragon-software.com,
	yury.norov@gmail.com,
	andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk
Cc: linux-s390@vger.kernel.org,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 4/4] bitmap: Use bitmap_size()
Date: Sat,  2 Jul 2022 20:29:44 +0200
Message-Id: <a1d240070b58addae91aef9912925835ff09122d.1656785856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify code and take advantage of the new bitmap_size() function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/bitmap.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index f66fb98a4126..668b47c1e5de 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -243,21 +243,18 @@ extern int bitmap_print_list_to_buf(char *buf, const unsigned long *maskp,
 
 static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
 {
-	unsigned int len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
-	memset(dst, 0, len);
+	memset(dst, 0, bitmap_size(nbits));
 }
 
 static inline void bitmap_fill(unsigned long *dst, unsigned int nbits)
 {
-	unsigned int len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
-	memset(dst, 0xff, len);
+	memset(dst, 0xff, bitmap_size(nbits));
 }
 
 static inline void bitmap_copy(unsigned long *dst, const unsigned long *src,
 			unsigned int nbits)
 {
-	unsigned int len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
-	memcpy(dst, src, len);
+	memcpy(dst, src, bitmap_size(nbits));
 }
 
 /*
-- 
2.34.1

