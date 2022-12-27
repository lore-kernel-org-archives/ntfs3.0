Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793A58495
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17BCC43392;
	Tue, 27 Dec 2022 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173290;
	bh=yz8ACh6OsI/ZD9bQhVfiEFQYhY+mPlVOWuQ7QbjLCG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rF+HbN4vkaJkT44pYfxBi9OaIqb1g+OGP+0AQkevPJALr2wmfM6EFYueKFJC4TAg0
	 aUPECIsHWfgmbVho8ICgFaMx/hzt+uPt1K0zsWrvxstP+8NYpOymw2g9HTsJUivSVa
	 nR4bMuTQKFntvVerKWtaW9h4EujRQz7U3FOOvEgOEiCfTvo78UNrwe3PqJuBpIdQ8n
	 MltwWeslaMlqUzq4E8eh5vo/6eNQC69NjXTA9ZiilzeT+/neCUp6KCMnkk/yEGVC1K
	 KzSw1Uw+EQBIDKRenZzuMbbdgdAFMwgn9twMGDETZWeZl0xjJ6QlEUn51ScY8Bzohe
	 WtHoCdmvGNoGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 13/22] fs/ntfs3: Use __GFP_NOWARN allocation at wnd_init()
Date: Tue, 27 Dec 2022 15:34:23 -0500
Message-Id: <20221227203433.1214255-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203433.1214255-1-sashal@kernel.org>
References: <20221227203433.1214255-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

[ Upstream commit 0d0f659bf713662fabed973f9996b8f23c59ca51 ]

syzbot is reporting too large allocation at wnd_init() [1], for a crafted
filesystem can become wnd->nwnd close to UINT_MAX. Add __GFP_NOWARN in
order to avoid too large allocation warning, than exhausting memory by
using kvcalloc().

Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963 [1]
Reported-by: syzot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index aa184407520f..021b5738eca3 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -666,7 +666,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
 	if (!wnd->bits_last)
 		wnd->bits_last = wbits;
 
-	wnd->free_bits = kcalloc(wnd->nwnd, sizeof(u16), GFP_NOFS);
+	wnd->free_bits = kcalloc(wnd->nwnd, sizeof(u16), GFP_NOFS | __GFP_NOWARN);
 	if (!wnd->free_bits)
 		return -ENOMEM;
 
-- 
2.35.1

