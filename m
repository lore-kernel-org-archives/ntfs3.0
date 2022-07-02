Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75941FA8
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 18:36:37 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 7hrUoTjFU4Ltq7hrUonitC; Sat, 02 Jul 2022 20:28:59 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 02 Jul 2022 20:28:59 +0200
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
Subject: [PATCH 0/4] Introduce bitmap_size()
Date: Sat,  2 Jul 2022 20:28:53 +0200
Message-Id: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie introduces bitmap_size() which returns the size, in bytes, of a
bitmap. Such a function is useful to simplify some drivers that use vmalloc() or
other functions to allocate some butmaps.
It also hides some implementation details about how bitmaps are stored (array of
longs)

Before introducing this function in patch 3, patch 1 and 2 rename some functions
with the same name but with different meaning.

Finaly, patch 4 makes use of the new function in bitmap.h.


Other follow-up patches to simplify some drivers will be proposed later if/when
this serie is merged.

Christophe JAILLET (4):
  s390/cio: Rename bitmap_size() as idset_bitmap_size()
  fs/ntfs3: Rename bitmap_size() as ntfs3_bitmap_size()
  bitmap: Introduce bitmap_size()
  bitmap: Use bitmap_size()

 drivers/md/dm-clone-metadata.c |  5 -----
 drivers/s390/cio/idset.c       |  8 ++++----
 fs/ntfs3/bitmap.c              |  4 ++--
 fs/ntfs3/fsntfs.c              |  2 +-
 fs/ntfs3/index.c               |  6 +++---
 fs/ntfs3/ntfs_fs.h             |  2 +-
 fs/ntfs3/super.c               |  2 +-
 include/linux/bitmap.h         | 15 +++++++++------
 lib/math/prime_numbers.c       |  2 --
 9 files changed, 21 insertions(+), 25 deletions(-)

-- 
2.34.1

