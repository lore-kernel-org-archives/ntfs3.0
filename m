Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17D202F65
	for <ntfs3@lists.linux.dev>; Fri, 16 Jan 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571011; cv=none; b=WLHI/VXJFFFeinXkseodLEPcUbHUEUGKhdTsfj6xMMBUObbE4Xg+h1YNVoKYoePBZ8vJFrErsgwwYiRE+NO90kNbTV0D0+Pp6D1e1+8CY0hZ4Bh+G82wwgACllRlCJ37A9mCciNSSE2KiMma9aXI2hvRcy5p2Xzl7stfAP6ONDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571011; c=relaxed/simple;
	bh=mYcYzR1Bq52SXryggqUi+9OeTZ69/rd9RCnsJuZ0oMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o6owmr11yLgOnqAl7tp2ZZA2fysikCV+6r8dmPutF8YjnUv6HJF4qPImQAvM4TYr9WZ1LaO3yruy/g/Orvst35ZEuu88/5DE4L00fnIAoZsVgJ+CDlZNpMHrF468/qkU5U3gpUCFgDwf+Xzd/2EumnMsnh6gv6xijpg+EFuUUO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=mNI5aj0y; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="mNI5aj0y"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 67D581DDC;
	Fri, 16 Jan 2026 13:40:50 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=mNI5aj0y;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id AE458258B;
	Fri, 16 Jan 2026 13:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1768571008;
	bh=+YQhfHsKWhjlKpn6HMjpLpXC6nPPaoTNNoY9NOqgGKc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mNI5aj0y/qmCPep3T4uwNmpcAU1skbykBkA1KHx/bwNebRT0MqymqM6ABXK+8UcLz
	 M6Xfbeomjiu09YBB1X90q8o/UJ5eX0/zTzFh7yR/Np3LF5NjwOdAt1YaZGabyW2ZsU
	 0BQDhAcQAsCgUEmi333D9wh53Lc+63jtZNNYFhDI=
Received: from [192.168.95.128] (172.30.20.155) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 16 Jan 2026 16:43:27 +0300
Message-ID: <dabd5f3b-8fea-4db5-9899-c1f238efb70d@paragon-software.com>
Date: Fri, 16 Jan 2026 14:43:26 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: prevent infinite loops caused by the next valid
 being the same
To: Edward Adam Davis <eadavis@qq.com>,
	<syzbot+bcf9e1868c1a0c7e04f1@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <ntfs3@lists.linux.dev>,
	<syzkaller-bugs@googlegroups.com>
References: <694f53ba.050a0220.35954c.0083.GAE@google.com>
 <tencent_D46CCC9550EA26ED7ECE4079366D542E790A@qq.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <tencent_D46CCC9550EA26ED7ECE4079366D542E790A@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 12/28/25 04:53, Edward Adam Davis wrote:

> When processing valid within the range [valid : pos), if valid cannot
> be retrieved correctly, for example, if the retrieved valid value is
> always the same, this can trigger a potential infinite loop, similar
> to the hung problem reported by syzbot [1].
>
> Adding a check for the valid value within the loop body, and terminating
> the loop and returning -EINVAL if the value is the same as the current
> value, can prevent this.
>
> [1]
> INFO: task syz.4.21:6056 blocked for more than 143 seconds.
> Call Trace:
>   rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
>   inode_lock include/linux/fs.h:1027 [inline]
>   ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
>
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> Reported-by: syzbot+bcf9e1868c1a0c7e04f1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=bcf9e1868c1a0c7e04f1
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   fs/ntfs3/file.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 2e7b2e566ebe..04292674f889 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -1077,8 +1077,12 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   			goto out;
>   
>   		if (lcn == SPARSE_LCN) {
> -			ni->i_valid = valid =
> -				frame_vbo + ((u64)clen << sbi->cluster_bits);
> +			valid = frame_vbo + ((u64)clen << sbi->cluster_bits);
> +			if (ni->i_valid == valid) {
> +				err = -EINVAL;
> +				goto out;
> +			}
> +			ni->i_valid = valid;
>   			continue;
>   		}
>   

Applied to my tree, thanks for the patch.

Regards,
Konstantin

