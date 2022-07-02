Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr [80.12.242.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35471FA8
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 18:36:50 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 7hrio8ivT2ovC7hrioywFJ; Sat, 02 Jul 2022 20:29:13 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 02 Jul 2022 20:29:13 +0200
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
Subject: [PATCH 1/4] s390/cio: Rename bitmap_size() as idset_bitmap_size()
Date: Sat,  2 Jul 2022 20:29:09 +0200
Message-Id: <3f2ad7fb91948525f6c52e0d36ec223cd3049c88.1656785856.git.christophe.jaillet@wanadoo.fr>
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

In order to introduce a bitmap_size() function in the bitmap API, we have
to rename functions with a similar name.

Add a "idset_" prefix and change bitmap_size() into idset_bitmap_size().

No functional change.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/s390/cio/idset.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/s390/cio/idset.c b/drivers/s390/cio/idset.c
index 45f9c0736be4..e1e77fe080bf 100644
--- a/drivers/s390/cio/idset.c
+++ b/drivers/s390/cio/idset.c
@@ -16,7 +16,7 @@ struct idset {
 	unsigned long bitmap[];
 };
 
-static inline unsigned long bitmap_size(int num_ssid, int num_id)
+static inline unsigned long idset_bitmap_size(int num_ssid, int num_id)
 {
 	return BITS_TO_LONGS(num_ssid * num_id) * sizeof(unsigned long);
 }
@@ -25,11 +25,11 @@ static struct idset *idset_new(int num_ssid, int num_id)
 {
 	struct idset *set;
 
-	set = vmalloc(sizeof(struct idset) + bitmap_size(num_ssid, num_id));
+	set = vmalloc(sizeof(struct idset) + idset_bitmap_size(num_ssid, num_id));
 	if (set) {
 		set->num_ssid = num_ssid;
 		set->num_id = num_id;
-		memset(set->bitmap, 0, bitmap_size(num_ssid, num_id));
+		memset(set->bitmap, 0, idset_bitmap_size(num_ssid, num_id));
 	}
 	return set;
 }
@@ -41,7 +41,7 @@ void idset_free(struct idset *set)
 
 void idset_fill(struct idset *set)
 {
-	memset(set->bitmap, 0xff, bitmap_size(set->num_ssid, set->num_id));
+	memset(set->bitmap, 0xff, idset_bitmap_size(set->num_ssid, set->num_id));
 }
 
 static inline void idset_add(struct idset *set, int ssid, int id)
-- 
2.34.1

