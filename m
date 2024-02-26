Received: from mail115-118.sinamail.sina.com.cn (mail115-118.sinamail.sina.com.cn [218.30.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A445FBB4
	for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708949353; cv=none; b=G7G+ZuWxzAtGXQnj19ltfPeijwkZQH7wK3a7bvKVJ4ixyvkIx+wDl6l9ACjSTmxckE6/986Ok9gkbigR8eUbmi+5Av9Z2Ta/rzUorfLiWGg6LR0ooEpUSHPCfCHI77/nedJI6gIWQEom7I0dpXt//AHXmuonJwRrTKudZELLPlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708949353; c=relaxed/simple;
	bh=pLt7uW/tLWOix+u8T0EY+yCzxoIKPC5tGiwPgZA82wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ePTZvS1ld0j0o6C1UmqO85jUixZtPUge9AtzRAPbUi01DJc0VdnNCu0lp74wZw273OaPcrsYt34EJ5HcjHGB4utirEhp/E6VY0g7uKHDk3zRryTZxTho6sFIN2q8Ib1EKp+NGiVcqMs601AulkhfKWg2SHmOkjXmz9/LTPATjqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.50.169])
	by sina.com (172.16.235.25) with ESMTP
	id 65DC7EC900006951; Mon, 26 Feb 2024 20:06:35 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 74897934210316
X-SMAIL-UIID: B7F26EFD82E247E782670C81FCE0147F-20240226-200635-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+c2ada45c23d98d646118@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com,
	boqun.feng@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	penguin-kernel@i-love.sakura.ne.jp,
	syzkaller-bugs@googlegroups.com,
	torvalds@linux-foundation.org
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_set_state (2)
Date: Mon, 26 Feb 2024 20:06:23 +0800
Message-Id: <20240226120623.1464-1-hdanton@sina.com>
In-Reply-To: <00000000000044c2da06124774f7@google.com> (raw)
References: 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test non-zero subkey against the mainline tree.

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  master

--- x/fs/ntfs3/fsntfs.c
+++ y/fs/ntfs3/fsntfs.c
@@ -944,7 +944,7 @@ int ntfs_set_state(struct ntfs_sb_info *
 	if (!ni)
 		return -EINVAL;
 
-	mutex_lock_nested(&ni->ni_lock, NTFS_INODE_MUTEX_DIRTY);
+	mutex_lock_nested(&ni->ni_lock, (1 + NTFS_INODE_MUTEX_PARENT2));
 
 	attr = ni_find_attr(ni, NULL, NULL, ATTR_VOL_INFO, NULL, 0, NULL, &mi);
 	if (!attr) {
--
