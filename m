Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr [80.12.242.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3C0173
	for <ntfs3@lists.linux.dev>; Thu, 23 Dec 2021 12:28:41 +0000 (UTC)
Received: from pop-os.home ([86.243.171.122])
	by smtp.orange.fr with ESMTPA
	id 0N5inftG9E8xT0N5inBeG8; Thu, 23 Dec 2021 13:21:03 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 23 Dec 2021 13:21:03 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] fs/ntfs3: Remove a useless test
Date: Thu, 23 Dec 2021 13:20:56 +0100
Message-Id: <ade97ac1a1506fd322b008bdf8c24f0fb01b02a0.1640261993.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'new_free' has just been allocated by kmalloc() and is known to be not
NULL.
So this pointer can't be equal to a previous memory allocation, or there
would be trouble in paradise.

Axe the always true test and make the code more readable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ntfs3/bitmap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index aa184407520f..e3b5680fd516 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -1333,9 +1333,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
 		if (!new_free)
 			return -ENOMEM;
 
-		if (new_free != wnd->free_bits)
-			memcpy(new_free, wnd->free_bits,
-			       wnd->nwnd * sizeof(short));
+		memcpy(new_free, wnd->free_bits, wnd->nwnd * sizeof(short));
 		memset(new_free + wnd->nwnd, 0,
 		       (new_wnd - wnd->nwnd) * sizeof(short));
 		kfree(wnd->free_bits);
-- 
2.32.0

