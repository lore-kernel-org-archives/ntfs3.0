Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE878F39
	for <ntfs3@lists.linux.dev>; Thu, 16 Apr 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328764; cv=none; b=Wln688bG1FxH60zRULw25qaCX1qghzYkXHYG6f679Kj73kcGYOs3fJPuNuR4z7HxegwpWXRT9ELt1ALod9/5VAV07oILCj8m5OEYtFWL5UV9HXqL1yUe1nwRfND2jIuf7yMzRUdqKv6AXBAFXgCtZ/RC80wIU7qEnh1qyy4/Lmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328764; c=relaxed/simple;
	bh=FQ0PVOc1YVqYceryIuSjfWLCzcMiASV6DBS1GlJ93GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=onomBIrVKyWfk73Ec2d2eK8fSK5YM1WQ/25prjvzWmkWVZ7EKae6v42vps8SN0IaTVVyYu3qr7T9lgk2a5sAE/aFa6KS7AfHqZg4U9QEOzXOoO4KQoRjJRwsab8347XIolB5J+oryYRbZUTb/Bj4gMSFh7zsNQYFoVieSJAG/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=nDMdWUy0; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="nDMdWUy0"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id B0FCC1D42;
	Thu, 16 Apr 2026 08:39:30 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=nDMdWUy0;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 202F32182;
	Thu, 16 Apr 2026 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1776328760;
	bh=owulkjfScGtJLen8Q/CPKS8STXYatVeuNFM6i7+ml+Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nDMdWUy0bxu1fepVBkVSKjatqj0mNKVIaEBP7M9I/C6CuLyYjMVVuny+g3kZQ5kJP
	 X6tkwq1Lz08ytMaMvwOSL2/uNSg5t6Cgbf+RQ3/QdORTiXI92wjim8WGXPNwsk4d2Y
	 2zaGlqmEoiwluNQVuYmYgR9lStm3jxnSPwqo8LvA=
Received: from [192.168.95.128] (172.30.20.197) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 16 Apr 2026 11:39:18 +0300
Message-ID: <d99b33f2-4052-42ff-9b65-b892f6e3ef12@paragon-software.com>
Date: Thu, 16 Apr 2026 10:39:16 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix deadlock in ntfs_force_shutdown
To: Deepanshu Kartikey <kartikey406@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com>
References: <20260404153213.365836-1-kartikey406@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260404153213.365836-1-kartikey406@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/4/26 17:32, Deepanshu Kartikey wrote:

> ntfs_force_shutdown() calls bdev_freeze() which internally calls
> freeze_super(). freeze_super() calls sb_wait_write() which waits
> for all active sb_writers holders to finish.
>
> However active writers (ntfs_compress_write) can be stuck waiting
> for ni->file.run_lock while holding the sb_writers read lock
> acquired via file_start_write() in the VFS layer. This creates
> a deadlock where freeze_super() waits for writers that can never
> complete because they are blocked on run_lock contention.
>
> Fix by removing bdev_freeze/bdev_thaw entirely. The shutdown bit
> NTFS_FLAGS_SHUTDOWN_BIT is already checked at entry of all ntfs3
> write paths (file.c, inode.c, namei.c, frecord.c, fsntfs.c,
> super.c, xattr.c) and causes them to return errors immediately,
> making further writes impossible without risking a deadlock.
>
> Reported-by: syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5f6ca38579a76e303c1c
> Tested-by: syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com
> Fixes: ae91dfe38966 ("fs/ntfs3: implement NTFS3_IOC_SHUTDOWN ioctl")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>   fs/ntfs3/file.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 7eecf1e01f74..cbbc7d81875f 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -118,18 +118,12 @@ static int ntfs_ioctl_set_volume_label(struct ntfs_sb_info *sbi, u8 __user *buf)
>    */
>   static int ntfs_force_shutdown(struct super_block *sb, u32 flags)
>   {
> -	int err;
>   	struct ntfs_sb_info *sbi = sb->s_fs_info;
>   
>   	if (unlikely(ntfs3_forced_shutdown(sb)))
>   		return 0;
>   
> -	/* No additional options yet (flags). */
> -	err = bdev_freeze(sb->s_bdev);
> -	if (err)
> -		return err;
>   	set_bit(NTFS_FLAGS_SHUTDOWN_BIT, &sbi->flags);
> -	bdev_thaw(sb->s_bdev);
>   	return 0;
>   }
>   

Hello, I missed this before, but internal testing shows that this patch 
causes several failures. I will not include it in the pull request for 
now. I am looking into the root cause and will reply with details once I 
have them. If the fix turns out to be straightforward, I will send an 
updated patch as soon as possible. Regards, Konstantin

