Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A931FA8
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 18:37:18 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 7hsAo7wOSYwJ77hsAo61iK; Sat, 02 Jul 2022 20:29:39 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 02 Jul 2022 20:29:39 +0200
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
Subject: [PATCH 3/4] bitmap: Introduce bitmap_size()
Date: Sat,  2 Jul 2022 20:29:36 +0200
Message-Id: <98f5d3d855a9c687ccc035edf62016b02a6876b7.1656785856.git.christophe.jaillet@wanadoo.fr>
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

The new bitmap_size() function returns the size, in bytes, of a bitmap.

Remove the already existing bitmap_size() functions and macro in some
files.
These files already use the bitmap API and will use the new function
in bitmap.h automatically.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/md/dm-clone-metadata.c | 5 -----
 include/linux/bitmap.h         | 6 ++++++
 lib/math/prime_numbers.c       | 2 --
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-clone-metadata.c b/drivers/md/dm-clone-metadata.c
index c43d55672bce..47c1fa7aad8b 100644
--- a/drivers/md/dm-clone-metadata.c
+++ b/drivers/md/dm-clone-metadata.c
@@ -465,11 +465,6 @@ static void __destroy_persistent_data_structures(struct dm_clone_metadata *cmd)
 
 /*---------------------------------------------------------------------------*/
 
-static size_t bitmap_size(unsigned long nr_bits)
-{
-	return BITS_TO_LONGS(nr_bits) * sizeof(long);
-}
-
 static int __dirty_map_init(struct dirty_map *dmap, unsigned long nr_words,
 			    unsigned long nr_regions)
 {
diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index f091a1664bf1..f66fb98a4126 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -48,6 +48,7 @@ struct device;
  *  bitmap_equal(src1, src2, nbits)             Are *src1 and *src2 equal?
  *  bitmap_intersects(src1, src2, nbits)        Do *src1 and *src2 overlap?
  *  bitmap_subset(src1, src2, nbits)            Is *src1 a subset of *src2?
+ *  bitmap_size(nbits)                          Size, in bytes, of a bitmap
  *  bitmap_empty(src, nbits)                    Are all bits zero in *src?
  *  bitmap_full(src, nbits)                     Are all bits set in *src?
  *  bitmap_weight(src, nbits)                   Hamming Weight: number set bits
@@ -124,6 +125,11 @@ unsigned long *bitmap_alloc_node(unsigned int nbits, gfp_t flags, int node);
 unsigned long *bitmap_zalloc_node(unsigned int nbits, gfp_t flags, int node);
 void bitmap_free(const unsigned long *bitmap);
 
+static __always_inline size_t bitmap_size(unsigned long nbits)
+{
+	return BITS_TO_LONGS(nbits) * sizeof(unsigned long);
+}
+
 /* Managed variants of the above. */
 unsigned long *devm_bitmap_alloc(struct device *dev,
 				 unsigned int nbits, gfp_t flags);
diff --git a/lib/math/prime_numbers.c b/lib/math/prime_numbers.c
index d42cebf7407f..d3b64b10da1c 100644
--- a/lib/math/prime_numbers.c
+++ b/lib/math/prime_numbers.c
@@ -6,8 +6,6 @@
 #include <linux/prime_numbers.h>
 #include <linux/slab.h>
 
-#define bitmap_size(nbits) (BITS_TO_LONGS(nbits) * sizeof(unsigned long))
-
 struct primes {
 	struct rcu_head rcu;
 	unsigned long last, sz;
-- 
2.34.1

