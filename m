Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBA22573
	for <ntfs3@lists.linux.dev>; Tue, 20 Sep 2022 16:36:10 +0000 (UTC)
Received: from fsav119.sakura.ne.jp (fsav119.sakura.ne.jp [27.133.134.246])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 28KFxUm8092946;
	Wed, 21 Sep 2022 00:59:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav119.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp);
 Wed, 21 Sep 2022 00:59:30 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 28KFxTq7092942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 21 Sep 2022 00:59:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
Date: Wed, 21 Sep 2022 00:59:27 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH] fs/ntfs3: fix negative shift size in true_sectors_per_clst()
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
References: <000000000000f8b5ef05dd25b963@google.com>
Cc: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com, ntfs3@lists.linux.dev,
        LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <000000000000f8b5ef05dd25b963@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

syzbot is reporting shift-out-of-bounds in true_sectors_per_clst() [1], for
commit a3b774342fa752a5 ("fs/ntfs3: validate BOOT sectors_per_clusters")
did not address that (0 - boot->sectors_per_clusters) < 0 because "u8" was
chosen for type of boot->sectors_per_clusters because 0x80 needs to be
positive in order to support 64K clusters. Use "s8" cast in order to make
sure that (0 - (s8) boot->sectors_per_clusters) > 0.

Link: https://syzkaller.appspot.com/bug?extid=1631f09646bc214d2e76 [1]
Reported-by: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Tested-by: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
Fixes: a3b774342fa752a5 ("fs/ntfs3: validate BOOT sectors_per_clusters")

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 47012c9bf505..c7ffd21fb255 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -672,7 +672,7 @@ static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
 	if (boot->sectors_per_clusters <= 0x80)
 		return boot->sectors_per_clusters;
 	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
-		return 1U << (0 - boot->sectors_per_clusters);
+		return 1U << (0 - (s8) boot->sectors_per_clusters);
 	return -EINVAL;
 }
 
-- 
2.18.4

