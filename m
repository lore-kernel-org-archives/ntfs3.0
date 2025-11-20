Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182232DF701
	for <ntfs3@lists.linux.dev>; Thu, 20 Nov 2025 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629368; cv=none; b=Z77U1OCXYQelBcZoXxpunAEYG+CPoL9X9CkZXXHfXX0QufHchuZ7TVA6TI32oQMqO/oEVKqY8yrnJzb7ZiZPHfRSWWBCAt/g0S2ihuFr+oHUuPlyX/1GMh/JW1gHgdT5+dmRymJ8YOp04BXwYwlQaAo3XF9suvtU6NYkclthq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629368; c=relaxed/simple;
	bh=ffrh8VEoKIJWyY91tWMgweQ9zlzB6/6kHQw6h/1pOOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JgP3JchiD2lzfjb2UOONlPG9Az1N3ScDxgziRHSj+ylcJL56ievfsuv356QlJbS3tYN5IvMrN2iVihTZZbcdwhOaC4LkOqSJV2hmu6Fgffk+ZRyTmfBWq1wiB9X3stzFtZCl1SSzfWegb681WBpP35saN2Br+UBiiF2PMLL2ees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=sPclYSBF; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="sPclYSBF"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id A9E0726;
	Thu, 20 Nov 2025 08:59:17 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=sPclYSBF;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3975E2472;
	Thu, 20 Nov 2025 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763629365;
	bh=GGnEsz7WH1zB9wHIdrjIItY3S/+A8sjMDBVWv5FXYsw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sPclYSBFyCb8+OWAszbTXNlG1G2vwggeeF5pdmTxoUEcEreq2AKUjh9ZbmOWzSi6W
	 9VsdQCLmg8+aZwcvMAz3otmnQkZvSr+HlgLl33UzvgHS/fhJMJDEseR7PpVHEjJ4/F
	 q/qEqPtnv9TuEq8kO+dqssJ/uIiIfoLZAEWDm+LQ=
Received: from [192.168.95.128] (172.30.20.202) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 20 Nov 2025 12:02:44 +0300
Message-ID: <ff8ad5a8-e5ae-46e3-897f-5de546759244@paragon-software.com>
Date: Thu, 20 Nov 2025 10:02:42 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Next] ntfs3: init run lock for extend inode
To: Edward Adam Davis <eadavis@qq.com>,
	<syzbot+bdeb22a4b9a09ab9aa45@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <ntfs3@lists.linux.dev>,
	<penguin-kernel@I-love.SAKURA.ne.jp>, <syzkaller-bugs@googlegroups.com>
References: <68c8583d.050a0220.2ff435.03a1.GAE@google.com>
 <tencent_F24B651BC22523BA92BB5A337D9E2A1B5F08@qq.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <tencent_F24B651BC22523BA92BB5A337D9E2A1B5F08@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 9/16/25 07:50, Edward Adam Davis wrote:

> After setting the inode mode of $Extend to a regular file, executing the
> truncate system call will enter the do_truncate() routine, causing the
> run_lock uninitialized error reported by syzbot.
>
> Prior to patch 4e8011ffec79, if the inode mode of $Extend was not set to
> a regular file, the do_truncate() routine would not be entered.
>
> Add the run_lock initialization when loading $Extend.
>
> syzbot reported:
> INFO: trying to register non-static key.
> Call Trace:
>   dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>   assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
>   register_lock_class+0x105/0x320 kernel/locking/lockdep.c:1299
>   __lock_acquire+0x99/0xd20 kernel/locking/lockdep.c:5112
>   lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
>   down_write+0x96/0x1f0 kernel/locking/rwsem.c:1590
>   ntfs_set_size+0x140/0x200 fs/ntfs3/inode.c:860
>   ntfs_extend+0x1d9/0x970 fs/ntfs3/file.c:387
>   ntfs_setattr+0x2e8/0xbe0 fs/ntfs3/file.c:808
>
> Fixes: 4e8011ffec79 ("ntfs3: pretend $Extend records as regular files")
> Reported-by: syzbot+bdeb22a4b9a09ab9aa45@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=bdeb22a4b9a09ab9aa45
> Tested-by: syzbot+bdeb22a4b9a09ab9aa45@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   fs/ntfs3/inode.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 3959f23c487a..180cd984339b 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -472,6 +472,7 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>   		/* Records in $Extend are not a files or general directories. */
>   		inode->i_op = &ntfs_file_inode_operations;
>   		mode = S_IFREG;
> +		init_rwsem(&ni->file.run_lock);
>   	} else {
>   		err = -EINVAL;
>   		goto out;

Taken, thanks. Will be sent in the next pull request.

Regards,
Konstantin

