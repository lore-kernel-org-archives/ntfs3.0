Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6BF33C4
	for <ntfs3@lists.linux.dev>; Wed, 19 Apr 2023 11:19:56 +0000 (UTC)
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 33JBJmgA013677;
	Wed, 19 Apr 2023 20:19:48 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Wed, 19 Apr 2023 20:19:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 33JBJmXb013674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Apr 2023 20:19:48 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <3451e9a6-8c59-7878-83ee-4d42273260be@I-love.SAKURA.ne.jp>
Date: Wed, 19 Apr 2023 20:19:46 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH v2] fs/ntfs3: validate data_size at ntfs_load_attr_list()
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
References: <e094ae6b-e741-c1e9-46b1-6bdbbdd971f6@I-love.SAKURA.ne.jp>
In-Reply-To: <e094ae6b-e741-c1e9-46b1-6bdbbdd971f6@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

syzbot is reporting too large allocation at ntfs_load_attr_list(), for
a crafted filesystem can have huge data_size.

If -1023 <= (ssize_t) lsize <= 0 range, kmalloc(al_aligned(lsize)) allows
writing lsize bytes at ZERO_SIZE_PTR. But since nobody knows the valid
range, let's try limiting to 0 < lsize <= 1048576 range (and also add
__GFP_NOWARN in case costly memory allocation failed).

Reported-by: syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>
Link: https://syzkaller.appspot.com/bug?extid=89dbb3a789a5b9711793
Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 fs/ntfs3/attrlist.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/attrlist.c b/fs/ntfs3/attrlist.c
index c0c6bcbc8c05..46d52f66aca4 100644
--- a/fs/ntfs3/attrlist.c
+++ b/fs/ntfs3/attrlist.c
@@ -52,7 +52,12 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
 
 	if (!attr->non_res) {
 		lsize = le32_to_cpu(attr->res.data_size);
-		le = kmalloc(al_aligned(lsize), GFP_NOFS);
+		/* Arbitrary limit for avoid accessing ZERO_SIZE_PTR. */
+		if (!lsize || lsize > 1048576) {
+			err = -ENOMEM;
+			goto out;
+		}
+		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
 		if (!le) {
 			err = -ENOMEM;
 			goto out;
@@ -80,7 +85,12 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
 		if (err < 0)
 			goto out;
 
-		le = kmalloc(al_aligned(lsize), GFP_NOFS);
+		/* Arbitrary limit for avoid accessing ZERO_SIZE_PTR. */
+		if (!lsize || lsize > 1048576) {
+			err = -ENOMEM;
+			goto out;
+		}
+		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
 		if (!le) {
 			err = -ENOMEM;
 			goto out;
-- 
2.34.1


