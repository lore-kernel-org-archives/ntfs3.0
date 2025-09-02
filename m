Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619FB2E6CB4
	for <ntfs3@lists.linux.dev>; Tue,  2 Sep 2025 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809846; cv=none; b=lvowafa4TEX+6RBkFsYhvSMoOin03QpaFtg3g3KPp4z+/NIRGaaQONIqAKg9J1946iZ7yNPHDE0R6J1BZM1IQw0wkgkeZZ5n45IHLLUf++EdASw6Mkg5ZMjnWq6A8tcyjsuHtimx3iJL7FgFOolTeiDITpVpe1RPZOXr6str5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809846; c=relaxed/simple;
	bh=fae+KqWjYaUUScNbAnLVX6DkXcGNfhfMm3lO0JME29Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aB71PXtUULKQNLnrtX48n3CPU2K3+IhgVcJI5yNHygj6K4+HlixWlxUtD2AGtKaE+oQTYIjzGxOFNSTugNQ3FIIAHqIq6fLraVjIM3jaZyET/J6RwRKvSh/dBtcMhlKL8bR1eYcP5FDp6DJlP0O96RipiCwmz0bnrBchlt5O53Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 582AhUF7059653;
	Tue, 2 Sep 2025 19:43:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.10] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 582AhO79059639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 2 Sep 2025 19:43:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <378c991b-cacf-4693-9823-0bf07f5f03f8@I-love.SAKURA.ne.jp>
Date: Tue, 2 Sep 2025 19:43:24 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] ntfs3: pretend $Extend records as regular files
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        ntfs3@lists.linux.dev
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
        Mateusz Guzik <mjguzik@gmail.com>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Christian Brauner <brauner@kernel.org>
References: <fb3888fb-11b8-481b-86a6-766bbbab5c81@I-love.SAKURA.ne.jp>
 <20250811-geteilt-sprudeln-f09e6ec25c0c@brauner>
 <d422acf1-129c-4886-9862-e16185ff26e9@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <d422acf1-129c-4886-9862-e16185ff26e9@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav305.rs.sakura.ne.jp
X-Virus-Status: clean

Since commit af153bb63a33 ("vfs: catch invalid modes in may_open()")
requires any inode be one of S_IFDIR/S_IFLNK/S_IFREG/S_IFCHR/S_IFBLK/
S_IFIFO/S_IFSOCK type, use S_IFREG for $Extend records.

Reported-by: syzbot <syzbot+895c23f6917da440ed0d@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=895c23f6917da440ed0d
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 fs/ntfs3/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 37cbbee7fa58..b08b00912165 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -471,6 +471,7 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 		   fname->home.seq == cpu_to_le16(MFT_REC_EXTEND)) {
 		/* Records in $Extend are not a files or general directories. */
 		inode->i_op = &ntfs_file_inode_operations;
+		mode = S_IFREG;
 	} else {
 		err = -EINVAL;
 		goto out;
-- 
2.51.0

