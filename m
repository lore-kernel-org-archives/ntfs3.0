Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BEF4430
	for <ntfs3@lists.linux.dev>; Mon,  2 Jan 2023 15:06:58 +0000 (UTC)
Received: from fsav412.sakura.ne.jp (fsav412.sakura.ne.jp [133.242.250.111])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 302E5Yls085543;
	Mon, 2 Jan 2023 23:05:34 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav412.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp);
 Mon, 02 Jan 2023 23:05:34 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp)
Received: from [192.168.1.20] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 302E5YWX085539
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 2 Jan 2023 23:05:34 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <305e5da3-bf57-0fc0-cf5e-4c620a76fb8d@I-love.SAKURA.ne.jp>
Date: Mon, 2 Jan 2023 23:05:33 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH] fs/ntfs3: don't hold ni_lock when calling truncate_setsize()
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        ntfs3@lists.linux.dev
Cc: syzbot <syzbot+bed15dbf10294aa4f2ae@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com, Hillf Danton <hdanton@sina.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <00000000000060d41f05f139aa44@google.com>
 <20230102005409.3474-1-hdanton@sina.com>
 <CAHk-=wim+_xutuWdeykqM34EQxbE3As7+91L5uEVLUCXbUL1CA@mail.gmail.com>
 <20230102094125.3552-1-hdanton@sina.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20230102094125.3552-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

syzbot is reporting hung task at do_user_addr_fault() [1], for
there is a silent deadlock between PG_locked bit and ni_lock lock.

Since filemap_update_page() calls filemap_read_folio() after calling
folio_trylock() which will set PG_locked bit, ntfs_truncate() must not
call truncate_setsize() which will wait for PG_locked bit to be
cleared when holding ni_lock lock.

Link: https://syzkaller.appspot.com/bug?extid=bed15dbf10294aa4f2ae [1]
Reported-by: syzbot <syzbot+bed15dbf10294aa4f2ae@syzkaller.appspotmail.com>
Debugged-by: Linus Torvalds <torvalds@linux-foundation.org>
Co-developed-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
---
By the way, ntfs_truncate() is ignoring attr_set_size() failure. Is it OK?

 fs/ntfs3/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index e5399ebc3a2b..d294cd975688 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -390,10 +390,10 @@ static int ntfs_truncate(struct inode *inode, loff_t new_size)
 
 	new_valid = ntfs_up_block(sb, min_t(u64, ni->i_valid, new_size));
 
-	ni_lock(ni);
-
 	truncate_setsize(inode, new_size);
 
+	ni_lock(ni);
+
 	down_write(&ni->file.run_lock);
 	err = attr_set_size(ni, ATTR_DATA, NULL, 0, &ni->file.run, new_size,
 			    &new_valid, ni->mi.sbi->options->prealloc, NULL);
-- 
2.34.1

