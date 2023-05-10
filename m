Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1420B4C
	for <ntfs3@lists.linux.dev>; Wed, 10 May 2023 11:44:12 +0000 (UTC)
Received: from fsav414.sakura.ne.jp (fsav414.sakura.ne.jp [133.242.250.113])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 34AB9AFo009862;
	Wed, 10 May 2023 20:09:11 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav414.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp);
 Wed, 10 May 2023 20:09:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav414.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 34AB9AAM009859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 10 May 2023 20:09:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b8f650f1-2028-1895-869d-5251cf404a4d@I-love.SAKURA.ne.jp>
Date: Wed, 10 May 2023 20:09:11 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        ntfs3@lists.linux.dev
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] fs/ntfs3: validate data_size at ntfs_load_attr_list()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

syzbot was reporting too large allocation at ntfs_load_attr_list(), for
a crafted filesystem can have huge data_size.

It turned out that commit 366bfcc2898f ("fs/ntfs3: Use __GFP_NOWARN
allocation at ntfs_load_attr_list()") was not sufficient, for
kmalloc(al_aligned(lsize)) allows writing lsize bytes at ZERO_SIZE_PTR
if -1023 <= (ssize_t) lsize <= 0. But since nobody knows the valid range,
let's try limiting to 0 < lsize <= 1048576 range.

Reported-by: syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=89dbb3a789a5b9711793
Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 fs/ntfs3/attrlist.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs3/attrlist.c b/fs/ntfs3/attrlist.c
index 42631b31adf1..a4b2a7f4cd7b 100644
--- a/fs/ntfs3/attrlist.c
+++ b/fs/ntfs3/attrlist.c
@@ -52,6 +52,11 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
 
 	if (!attr->non_res) {
 		lsize = le32_to_cpu(attr->res.data_size);
+		/* Arbitrary limit for avoid accessing ZERO_SIZE_PTR. */
+		if (!lsize || lsize > 1048576) {
+			err = -ENOMEM;
+			goto out;
+		}
 		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
 		if (!le) {
 			err = -ENOMEM;
@@ -80,6 +85,11 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
 		if (err < 0)
 			goto out;
 
+		/* Arbitrary limit for avoid accessing ZERO_SIZE_PTR. */
+		if (!lsize || lsize > 1048576) {
+			err = -ENOMEM;
+			goto out;
+		}
 		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
 		if (!le) {
 			err = -ENOMEM;
-- 
2.18.4

