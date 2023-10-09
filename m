Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC32358B9
	for <ntfs3@lists.linux.dev>; Mon,  9 Oct 2023 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an3PttCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696864436; x=1728400436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WpadbYZ01czsjx6xeQZ678kvyMyhwvEZrm8aP1rQxlg=;
  b=an3PttCeTE7nDnkXnra03vnvuPdyGh0I4GgIFWFMN/6lzCx576qtF6BL
   eFHMEAnY/0/yr3tu+sNQ5PobfkQsj1q13+wupv4a+sQt8T+4GTpQu2jiH
   WmXe2A3TUqrHhN863CpZB9hCE4I8LAPuV8zw/qVLch1Ylt+ytGIqAJoij
   5eTrnYkiZOvYRKQhhJ+/KtIjWx4KaIiKQhEeJ38JmalHjiTl0WEXHfvRP
   v3HzcpK/q6NmuOywQN1ERf2lHDQssBzPkgZFLG1j1aItAXuZ4nIV/Xgqr
   9369uG8Y0fAhFL1lykL08ZgJJ3ymZ+audysUcBt7f35MHXBqV8Qwl9Ndo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369232508"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="369232508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869288163"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="869288163"
Received: from newjersey.igk.intel.com ([10.102.20.203])
  by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2023 08:13:45 -0700
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
Subject: [PATCH 12/14] lib/bitmap: add compile-time test for __assign_bit() optimization
Date: Mon,  9 Oct 2023 17:10:24 +0200
Message-ID: <20231009151026.66145-13-aleksander.lobakin@intel.com>
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

Commit dc34d5036692 ("lib: test_bitmap: add compile-time
optimization/evaluations assertions") initially missed __assign_bit(),
which led to that quite a time passed before I realized it doesn't get
optimized at compilation time. Now that it does, add test for that just
to make sure nothing will break one day.
To make things more interesting, use bitmap_complement() and
bitmap_full(), thus checking their compile-time evaluation as well. And
remove the misleading comment mentioning the workaround removed recently
in favor of adding the whole file to GCov exceptions.

Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 lib/test_bitmap.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index f2ea9f30c7c5..cbf1b9611616 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -1181,14 +1181,7 @@ static void __init test_bitmap_const_eval(void)
 	 * in runtime.
 	 */
 
-	/*
-	 * Equals to `unsigned long bitmap[1] = { GENMASK(6, 5), }`.
-	 * Clang on s390 optimizes bitops at compile-time as intended, but at
-	 * the same time stops treating @bitmap and @bitopvar as compile-time
-	 * constants after regular test_bit() is executed, thus triggering the
-	 * build bugs below. So, call const_test_bit() there directly until
-	 * the compiler is fixed.
-	 */
+	/* Equals to `unsigned long bitmap[1] = { GENMASK(6, 5), }` */
 	bitmap_clear(bitmap, 0, BITS_PER_LONG);
 	if (!test_bit(7, bitmap))
 		bitmap_set(bitmap, 5, 2);
@@ -1220,6 +1213,15 @@ static void __init test_bitmap_const_eval(void)
 	/* ~BIT(25) */
 	BUILD_BUG_ON(!__builtin_constant_p(~var));
 	BUILD_BUG_ON(~var != ~BIT(25));
+
+	/* ~BIT(25) | BIT(25) == ~0UL */
+	bitmap_complement(&var, &var, BITS_PER_LONG);
+	__assign_bit(25, &var, true);
+
+	/* !(~(~0UL)) == 1 */
+	res = bitmap_full(&var, BITS_PER_LONG);
+	BUILD_BUG_ON(!__builtin_constant_p(res));
+	BUILD_BUG_ON(!res);
 }
 
 static void __init selftest(void)
-- 
2.41.0

