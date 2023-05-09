Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7971992D
	for <ntfs3@lists.linux.dev>; Tue,  9 May 2023 21:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2F7C433A0;
	Tue,  9 May 2023 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683667233;
	bh=ypsdodpimwft7y95qWNxaTzJuho5OIt50WEgkP1MYKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lYYTsaH8s2hc29QhUsaKIGMr+6GbrTIBZKhVBjR3ut4Kyet1tg0N7SmHOlkC6M/2C
	 Lstr7w3ApbVZTgsc2seL8kJQOzI5H1ztSeK7dd08MaxCRygw4My1iDvPDtyDz79p87
	 GMT3DYYXlo8J/sAa2l+zoAzfzPB8lZLsPgMLTahDv5QVo9TOo7dw3I1YLjrfL8bQTB
	 HnQL7w6ycDoQV2jcEq0UnYqkH3pd9pAHhYKwONnpblT+gZAYWAt+55tURwx5gJbdNl
	 zXSqG5+UO5r9EnvIAnWvBRvAzvu6myNgxvD43W3SOA+RxYH+rEYYpUT9E9vS/QKAGq
	 hVLJe067HAIPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 05/13] fs/ntfs3: Fix NULL dereference in ni_write_inode
Date: Tue,  9 May 2023 17:20:13 -0400
Message-Id: <20230509212023.22105-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509212023.22105-1-sashal@kernel.org>
References: <20230509212023.22105-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Abdun Nihaal <abdun.nihaal@gmail.com>

[ Upstream commit 8dae4f6341e335a09575be60b4fdf697c732a470 ]

Syzbot reports a NULL dereference in ni_write_inode.
When creating a new inode, if allocation fails in mi_init function
(called in mi_format_new function), mi->mrec is set to NULL.
In the error path of this inode creation, mi->mrec is later
dereferenced in ni_write_inode.

Add a NULL check to prevent NULL dereference.

Link: https://syzkaller.appspot.com/bug?extid=f45957555ed4a808cc7a
Reported-and-tested-by: syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index cdeb0b51f0ba8..95556515ded3d 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3189,6 +3189,9 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		return 0;
 	}
 
+	if (!ni->mi.mrec)
+		goto out;
+
 	if (is_rec_inuse(ni->mi.mrec) &&
 	    !(sbi->flags & NTFS_FLAGS_LOG_REPLAYING) && inode->i_nlink) {
 		bool modified = false;
-- 
2.39.2

