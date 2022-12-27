Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0058494
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD06FC433F1;
	Tue, 27 Dec 2022 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173229;
	bh=vMPndmgsz6Za5oPVT+44B1SsH4OmPfSUTl4HrUrDjwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a+1/3KUDRS9d32JYtafT2UhD+5xLWeal4KahJw8PKLb+PDr0qkDIQVVSmQBUDKDsA
	 uDCMlVgKtLe4abpbITDf1zMPRhOzY0bt7GtcGTyu/c01SoN99/iurlwtZZQwQdh3V9
	 y0l0T/DskgO85uPaESEl/zkKZXybS/n5TC4mbAWik11PSCxL7NAvAVrfQPubMgkUHp
	 meuc2IrZLfdB1/T30d5QBruzUduGpEATXKSqch0ZN57N8H/+YxSxyJ/K1IjDtWpNi+
	 vIAS1+eUSxrIysCmiE14IP8q5MAuJPxXy8KuIXj1rLErMerjVrLTZALRGgMySwt9lz
	 mfdjP8h7e6DuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shigeru Yoshida <syoshida@redhat.com>,
	syzbot+9d67170b20e8f94351c8@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 05/27] fs/ntfs3: Fix memory leak on ntfs_fill_super() error path
Date: Tue, 27 Dec 2022 15:33:20 -0500
Message-Id: <20221227203342.1213918-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203342.1213918-1-sashal@kernel.org>
References: <20221227203342.1213918-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Shigeru Yoshida <syoshida@redhat.com>

[ Upstream commit 51e76a232f8c037f1d9e9922edc25b003d5f3414 ]

syzbot reported kmemleak as below:

BUG: memory leak
unreferenced object 0xffff8880122f1540 (size 32):
  comm "a.out", pid 6664, jiffies 4294939771 (age 25.500s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 ed ff ed ff 00 00 00 00  ................
  backtrace:
    [<ffffffff81b16052>] ntfs_init_fs_context+0x22/0x1c0
    [<ffffffff8164aaa7>] alloc_fs_context+0x217/0x430
    [<ffffffff81626dd4>] path_mount+0x704/0x1080
    [<ffffffff81627e7c>] __x64_sys_mount+0x18c/0x1d0
    [<ffffffff84593e14>] do_syscall_64+0x34/0xb0
    [<ffffffff84600087>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

This patch fixes this issue by freeing mount options on error path of
ntfs_fill_super().

Reported-by: syzbot+9d67170b20e8f94351c8@syzkaller.appspotmail.com
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index d998cb083d95..0118c28d8ccb 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1281,6 +1281,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	 * Free resources here.
 	 * ntfs_fs_free will be called with fc->s_fs_info = NULL
 	 */
+	put_mount_options(sbi->options);
 	put_ntfs(sbi);
 	sb->s_fs_info = NULL;
 
-- 
2.35.1

