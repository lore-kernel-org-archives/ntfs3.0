Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C10D30EF88
	for <ntfs3@lists.linux.dev>; Wed, 15 Apr 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268828; cv=none; b=BuMIHt/9Sf/KHNdejJbV48nHGEvCcftda8M8JI2coapuYoX2F869+QGwkvjDBI/Uun2wpBKHsouHoUE3Wx+OAA4bd19SZLJMJ0zYQatThUG6TmPiLjzKWtn+iyUX8ZTXNaDil/4WpFSN/kx5EbU7yCT5HKsgqThyCaxTZ6UqPGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268828; c=relaxed/simple;
	bh=v6JpSO8TtVi2NhCct+GP71mCjqn0o5+HdCS+mKYn2sA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GajbftHPCDwjN5eDeQTbm8BgUozcsHinOVPxoWKkfjzZ5RzID+G+bSkaay8MLC9cQdlLJM9unVug0bRNylYv+erjt364qQxYLrhvCTUCzHcK7pD1b6kheRW9pA7YdsHBDJXe0QUQl3YwHKXOJ+7fbrBGJGgC3d7Ppq9CPW9U2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=raMoFSC0; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="raMoFSC0"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 21DAE241;
	Wed, 15 Apr 2026 15:51:03 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=raMoFSC0;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 5C0022135;
	Wed, 15 Apr 2026 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1776268248;
	bh=15EuKxyy1J0OHsMDUPLMXuYZW3Mj/Y2JTaUwsEyRQcg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=raMoFSC0I8B83jULVatoWsLJ/pdDTqJRvT4XlVW5BfL+PfVic3l3/d93sAXNHe11L
	 V2fAxxwF6oLS1OUnO3LlAkbUq0rtUHuw3sT4W6Vmg5NdP0PMNuwuc3k3b5cXQgqg2L
	 NseuWDalI1oS8hr1ZH5fd+RjtJQd+gApvl4ayHEg=
Received: from [192.168.95.128] (172.30.20.171) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Apr 2026 18:50:47 +0300
Message-ID: <1cb0dc3a-dadd-4df3-9ccf-88070a8959e7@paragon-software.com>
Date: Wed, 15 Apr 2026 17:50:45 +0200
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

Hello,

Your patch is applied. Thank you.

Regards,
Konstantin

