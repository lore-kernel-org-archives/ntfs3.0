Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D99D515
	for <ntfs3@lists.linux.dev>; Sat, 20 Sep 2025 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758361381; cv=none; b=hmCn4w2p+Qf75zAyQIYnZ7vErrGO9gkxrPSW8RSKX5j7Hu+SYtYE/HFcQlpmY2e2Yu0NtPJD1chAsC1lUaoaVpUqG4EfPo8+B/ZOi5Apfwse9ORIXAwLJBJvYkhuD2l5Lc1BR7KJG6FOWPy9KOv+ailnyOp2lu5WuePnORIzFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758361381; c=relaxed/simple;
	bh=QXKBZxBbIIrY7dUNDCSovURrM6TC+8t9ufoJYA27PI8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EJBCJ4tOZyA5s5m6yb2VHxLc6IFLq32PHmGUhU83gFeSEOw7xMdowLK6jts1jK0OXUIWwEoRXrDTDI+mpiVfVSako2USJp8ZXpHWARqqTam7+jrYkLB+4kyF5i3zRpaFrQekVjuDVnqrVQQ5+NR4jKsSwdfUgXM7bKT8i/zVm9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 58K9gk0K057448;
	Sat, 20 Sep 2025 18:42:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.10] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 58K9gktk057445
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 20 Sep 2025 18:42:46 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <d79cb8dd-7dc3-49da-8fb1-793fa7e2a7e0@I-love.SAKURA.ne.jp>
Date: Sat, 20 Sep 2025 18:42:43 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [ntfs3?] INFO: trying to register non-static key in
 ntfs_set_size
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
        Edward Adam Davis <eadavis@qq.com>
Cc: syzbot <syzbot+bdeb22a4b9a09ab9aa45@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <68c8583d.050a0220.2ff435.03a1.GAE@google.com>
 <bcd184f1-acbc-46c7-9e30-045a8f17fc5c@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <bcd184f1-acbc-46c7-9e30-045a8f17fc5c@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav301.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/09/16 12:48, Tetsuo Handa wrote:
> Well, we need to also initialize ni->file.run_lock, for vfs_truncate() now
> passes the
> 
> 	/* For directories it's -EISDIR, for other non-regulars - -EINVAL */
> 	if (S_ISDIR(inode->i_mode))
> 		return -EISDIR;
> 	if (!S_ISREG(inode->i_mode))
> 		return -EINVAL;
> 
> check. But do we really want to pretend as if S_IFREG ?
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 37cbbee7fa58..ea2193ebf8fc 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -471,6 +471,8 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>                    fname->home.seq == cpu_to_le16(MFT_REC_EXTEND)) {
>                 /* Records in $Extend are not a files or general directories. */
>                 inode->i_op = &ntfs_file_inode_operations;
> +               mode = S_IFREG;
> +               init_rwsem(&ni->file.run_lock);
>         } else {
>                 err = -EINVAL;
>                 goto out;
> 
> Are records in $Extend expected to be truncated to arbitrary size? Should we
> prepend something other than S_IFREG (at least S_IFREG so that truncate()

pretend something other than S_IFREG (at least S_IFDIR so that truncate()

> will fail, or possibly S_IFSOCK so that open() will fail) ?



Well, ntfs_extend_init() verifies that the inode returned as the result of
looking up MFT_REC_EXTEND is S_IFDIR.

	ref.low = cpu_to_le32(MFT_REC_EXTEND);
	ref.high = 0;
	ref.seq = cpu_to_le16(MFT_REC_EXTEND);
	inode = ntfs_iget5(sb, &ref, &NAME_EXTEND);
	if (IS_ERR(inode)) {
		err = PTR_ERR(inode);
		ntfs_err(sb, "Failed to load $Extend (%d).", err);
		inode = NULL;
		goto out;
	}

	/* If ntfs_iget5() reads from disk it never returns bad inode. */
	if (!S_ISDIR(inode->i_mode)) {
		err = -EINVAL;
		goto out;
	}

Then, should ntfs_read_mft() pretend as if S_IFDIR ? Also, are conditions

	} else if (fname && fname->home.low == cpu_to_le32(MFT_REC_EXTEND) &&
		   fname->home.seq == cpu_to_le16(MFT_REC_EXTEND)) {
		/* Records in $Extend are not a files or general directories. */
		inode->i_op = &ntfs_file_inode_operations;

correct? These conditions do not check ref.high == 0 and name is "$Extend".
Don't we need to verify ref.high and name here?

