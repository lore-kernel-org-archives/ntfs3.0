Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78F12E70
	for <ntfs3@lists.linux.dev>; Sun, 29 Oct 2023 22:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QO6vqUji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C696AC43395;
	Sun, 29 Oct 2023 22:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620271;
	bh=qy79aDmEvJg4mxmFxDurEDjHBkq2aNi5sBCJ4PTjFc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QO6vqUjiyrsdJoXjwRJRd7Jb9tMUhL9zmzag9dwfFny1dOGgrb7Z615QQXss7XVL8
	 i4oWrDpVm3zw1N0fFXH30wVcTStF3GAE+UpJW7QiKhg5DAFkYDRiH6NYdviqjchv2d
	 ZU4tHEEp8D4SSlOC0Y6WVil/1lhLiolbEFyBaR6OAaLgpBTaeBOvY0yBCKZFtRgf9m
	 xVTRAQAMdHrXB4PdktJfuGGTcYOjSclyFVTrX/rTxgV+bTGMeQ9SY50wZtK17kZYne
	 rS8CNZ3wXSOzrcFUB992Ate5dWkNnhU48giT3S8HSxW99jr6YKCxgL+tFsnL5V6GFH
	 DtOBdgWP2dSVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ziqi Zhao <astrajoan@yahoo.com>,
	syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 08/39] fs/ntfs3: Fix possible null-pointer dereference in hdr_find_e()
Date: Sun, 29 Oct 2023 18:56:40 -0400
Message-ID: <20231029225740.790936-8-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225740.790936-1-sashal@kernel.org>
References: <20231029225740.790936-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.60
Content-Transfer-Encoding: 8bit

From: Ziqi Zhao <astrajoan@yahoo.com>

[ Upstream commit 1f9b94af923c88539426ed811ae7e9543834a5c5 ]

Upon investigation of the C reproducer provided by Syzbot, it seemed
the reproducer was trying to mount a corrupted NTFS filesystem, then
issue a rename syscall to some nodes in the filesystem. This can be
shown by modifying the reproducer to only include the mount syscall,
and investigating the filesystem by e.g. `ls` and `rm` commands. As a
result, during the problematic call to `hdr_fine_e`, the `inode` being
supplied did not go through `indx_init`, hence the `cmp` function
pointer was never set.

The fix is simply to check whether `cmp` is not set, and return NULL
if that's the case, in order to be consistent with other error
scenarios of the `hdr_find_e` method. The rationale behind this patch
is that:

- We should prevent crashing the kernel even if the mounted filesystem
  is corrupted. Any syscalls made on the filesystem could return
  invalid, but the kernel should be able to sustain these calls.

- Only very specific corruption would lead to this bug, so it would be
  a pretty rare case in actual usage anyways. Therefore, introducing a
  check to specifically protect against this bug seems appropriate.
  Because of its rarity, an `unlikely` clause is used to wrap around
  this nullity check.

Reported-by: syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com
Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/index.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 495cfb37962fa..b89a33f5761ef 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -729,6 +729,9 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 	u32 total = le32_to_cpu(hdr->total);
 	u16 offs[128];
 
+	if (unlikely(!cmp))
+		return NULL;
+
 fill_table:
 	if (end > total)
 		return NULL;
-- 
2.42.0

