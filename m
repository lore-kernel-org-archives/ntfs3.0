Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD0715ADB4;
	Mon, 14 Oct 2024 03:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728878306; cv=none; b=tWrQasAGpU3TcFAKA7L7mGm1VZx3K3aoA4n0S2lDomc8dIgymbl9TcssHVs7WSJMFmNzks843B7RUq01KXDIMl1pse4mH0rTQ+IwKIrU0jmyNxmk6G4unTby0+oDknpd7Qox+3rm13csnm8Cvs9LzSzVFyt3HlpIvCzcbZMB+lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728878306; c=relaxed/simple;
	bh=SmlqE7p5Zc8fp1GCSFR6cV7mwCiZ3i/UlxgflCRjN5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fM0I0IwaseZZUyUO+fktQA2AuFDHvtyIbn4YbaP8MDLTTXKYfedVySj0d9aBIu/6nth5CX7RZ7tzyQBupLX4KTGVgXHA6h7ll+AGJ1NTtWoqmGQOZk3+LBXEg1CZfkk6cm4ql/gOEaF3JALhj4iVVXZWAulpEkX0559y7dkZ1oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOOnNsgv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOOnNsgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319EBC4CEC3;
	Mon, 14 Oct 2024 03:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728878305;
	bh=SmlqE7p5Zc8fp1GCSFR6cV7mwCiZ3i/UlxgflCRjN5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mOOnNsgvU1x+p0yEc38qvJpjmfZlpScM0ITawZ1pzuh+hMRTFHhlj/v3JyF3fUWT/
	 k/lqf0+itOpDppNvTtu2XcC9wvfvV0mQSxQI7Dx9BzJ1zEwSXvRhf3dixxoDBw6Iep
	 ktyTtsXyHZn45YiQCvnir1BixggnHBxVgzkeAq2Ylo2dz7s4TFiVdvkhlnesar+636
	 u4IkX+p2MaiDhNSQtXiPsFTxYkUXi87NqrQB9G0yOecxJ+0ImhfTncs0+cP+KRff/E
	 a1JQinl9jEFhGazWgtYtgaX6SBwUXag0vkLJ+OxroXZ2EvBrkL6eAzwpAG9IEexeRq
	 EjDcHbgaG9LCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	syzbot+3bfd2cc059ab93efcdb4@syzkaller.appspotmail.com,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 07/17] fs/ntfs3: Additional check in ni_clear()
Date: Sun, 13 Oct 2024 23:57:57 -0400
Message-ID: <20241014035815.2247153-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014035815.2247153-1-sashal@kernel.org>
References: <20241014035815.2247153-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.56
Content-Transfer-Encoding: 8bit

From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

[ Upstream commit d178944db36b3369b78a08ba520de109b89bf2a9 ]

Checking of NTFS_FLAGS_LOG_REPLAYING added to prevent access to
uninitialized bitmap during replay process.

Reported-by: syzbot+3bfd2cc059ab93efcdb4@syzkaller.appspotmail.com
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/frecord.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index f7c381730b396..fbc3a0f7017ba 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -102,7 +102,9 @@ void ni_clear(struct ntfs_inode *ni)
 {
 	struct rb_node *node;
 
-	if (!ni->vfs_inode.i_nlink && ni->mi.mrec && is_rec_inuse(ni->mi.mrec))
+	if (!ni->vfs_inode.i_nlink && ni->mi.mrec &&
+	    is_rec_inuse(ni->mi.mrec) &&
+	    !(ni->mi.sbi->flags & NTFS_FLAGS_LOG_REPLAYING))
 		ni_delete_all(ni);
 
 	al_destroy(ni);
-- 
2.43.0

