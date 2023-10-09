Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78984358AA
	for <ntfs3@lists.linux.dev>; Mon,  9 Oct 2023 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdYEmKQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696864422; x=1728400422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+6yRIfvLPKcwf5mlMamrScqtJAqi+9+pZrbd12MWyDk=;
  b=DdYEmKQkm4xOSgJryd8pchveLDltJJDzwDbw6AsVEnDf0z9j3hK2KVz4
   +lCBvWM0heb4jLupsghwDp9J/wtzMqO4ECG6+P2Dtg0JqIRJwCcAc0d/+
   d6+ThuSHV+1lmGlXl91pQ4XoSGj6GhDRfCKawv8PFcD0s4B0Ta4ElShyo
   DTv/Lz8l4OpoFZZt6CDhZcFr3NqntGvRo3JagqX0+NuwXILPQkYPOVooW
   QRZf+73Ju8PBxaOYLB9Ivf1WFlpxjn6xeL5QDBEWkB3PfUfEf8WtGlFQ5
   0oIrvFzpvUEywzKwtH8QIXGJ5ft1MvAE1/p+jY3Wz59Geu6wrP3lLnTNy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369232325"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="369232325"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869288072"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869288072"
Received: from newjersey.igk.intel.com ([10.102.20.203])
  by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2023 08:13:33 -0700
From: Alexander Lobakin <aleksander.lobakin@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexander Potapenko <glider@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <simon.horman@corigine.com>,
	netdev@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	dm-devel@redhat.com,
	ntfs3@lists.linux.dev,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] bitmap: extend bitmap_{get,set}_value8() to bitmap_{get,set}_bits()
Date: Mon,  9 Oct 2023 17:10:21 +0200
Message-ID: <20231009151026.66145-10-aleksander.lobakin@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009151026.66145-1-aleksander.lobakin@intel.com>
References: <20231009151026.66145-1-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometimes there's need to get a 8/16/...-bit piece of a bitmap at a
particular offset. Currently, there are only bitmap_{get,set}_value8()
to do that for 8 bits and that's it.
Instead of introducing a separate pair for u16 and so on, which doesn't
scale well, extend the existing functions to be able to pass the wanted
value width. Make both offset and width arbitrary, but in order to not
over complicate the current logic and keep the helpers as optimized as
the current ones, require the width to be a pow-2 value and the offset
to be a multiple of the width, while the target piece should not cross
a %BITS_PER_LONG boundary and stay within one long.
Avoid adjusting all the already existing callsites by defining oneliner
wrapper macros named after the former functions. bloat-o-meter shows
almost no difference (+1-2 bytes in a couple of places), meaning the
new helpers get optimized just nicely.

Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 include/linux/bitmap.h | 51 ++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 63e422f8ba3d..9c010a7fa331 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -6,8 +6,10 @@
 
 #include <linux/align.h>
 #include <linux/bitops.h>
+#include <linux/bug.h>
 #include <linux/find.h>
 #include <linux/limits.h>
+#include <linux/log2.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
@@ -569,38 +571,59 @@ static inline void bitmap_from_u64(unsigned long *dst, u64 mask)
 }
 
 /**
- * bitmap_get_value8 - get an 8-bit value within a memory region
+ * bitmap_get_bits - get a 8/16/32/64-bit value within a memory region
  * @map: address to the bitmap memory region
- * @start: bit offset of the 8-bit value; must be a multiple of 8
+ * @start: bit offset of the value; must be a multiple of @len
+ * @len: bit width of the value; must be a power of two
  *
- * Returns the 8-bit value located at the @start bit offset within the @src
- * memory region.
+ * Return: the 8/16/32/64-bit value located at the @start bit offset within
+ * the @src memory region. Its position (@start + @len) can't cross
+ * a ``BITS_PER_LONG`` boundary.
  */
-static inline unsigned long bitmap_get_value8(const unsigned long *map,
-					      unsigned long start)
+static inline unsigned long bitmap_get_bits(const unsigned long *map,
+					    unsigned long start, size_t len)
 {
 	const size_t index = BIT_WORD(start);
 	const unsigned long offset = start % BITS_PER_LONG;
 
-	return (map[index] >> offset) & 0xFF;
+	if (WARN_ON_ONCE(!is_power_of_2(len) || offset % len ||
+			 offset + len > BITS_PER_LONG))
+		return 0;
+
+	return (map[index] >> offset) & GENMASK(len - 1, 0);
 }
 
 /**
- * bitmap_set_value8 - set an 8-bit value within a memory region
+ * bitmap_set_bits - set a 8/16/32/64-bit value within a memory region
  * @map: address to the bitmap memory region
- * @value: the 8-bit value; values wider than 8 bits may clobber bitmap
- * @start: bit offset of the 8-bit value; must be a multiple of 8
+ * @start: bit offset of the value; must be a multiple of @len
+ * @value: new value to set
+ * @len: bit width of the value; must be a power of two
+ *
+ * Replaces the 8/16/32/64-bit value located at the @start bit offset within
+ * the @src memory region with the new @value. Its position (@start + @len)
+ * can't cross a ``BITS_PER_LONG`` boundary.
  */
-static inline void bitmap_set_value8(unsigned long *map, unsigned long value,
-				     unsigned long start)
+static inline void bitmap_set_bits(unsigned long *map, unsigned long start,
+				   unsigned long value, size_t len)
 {
 	const size_t index = BIT_WORD(start);
 	const unsigned long offset = start % BITS_PER_LONG;
+	unsigned long mask = GENMASK(len - 1, 0);
 
-	map[index] &= ~(0xFFUL << offset);
-	map[index] |= value << offset;
+	if (WARN_ON_ONCE(!is_power_of_2(len) || offset % len ||
+			 offset + len > BITS_PER_LONG))
+		return;
+
+	map[index] &= ~(mask << offset);
+	map[index] |= (value & mask) << offset;
 }
 
+#define bitmap_get_value8(map, start)				\
+	bitmap_get_bits(map, start, BITS_PER_BYTE)
+#define bitmap_set_value8(map, value, start)			\
+	bitmap_set_bits(map, start, value, BITS_PER_BYTE)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __LINUX_BITMAP_H */
-- 
2.41.0

