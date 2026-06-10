Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD943F6618
	for <ntfs3@lists.linux.dev>; Wed, 10 Jun 2026 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088224; cv=none; b=Dmk4rPItotuwXz8FuSY8U5NdvHJs+s1ol5Mn6CNMxxhiEAdKN+qJFCMhI5A9ET7SfAZk3DmdEm8/1uA9Zfz2lbIvIZQSzqk2KwoL9NGewGYaUkeqQBajEiqSNFIJGOcgWsgoiQwJqD8sLZhx5fty0Jh2zFM18xlQDt+xVT5eegk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088224; c=relaxed/simple;
	bh=7mcxoAyA88UV+cTgyrzAYNuLhK3NfbPzaSFarMxGLIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NaIUIsVHGFDbL9URFUgc8DRl55KNd0dKvb0e5/Vi8ERLGfyJcWtZZj72Umwdsh+O3hG2qnXWY3cJ+XNDtZVcpzCRRHnkHb3RjXXmC7GUNX4J8Ypy1BxYoXGWXk/EelL0jrEC3pkHmUnZibPpm1mkD8difeDZcqjD8LTg0wdJcIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=tTLaRYPZ; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="tTLaRYPZ"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 698E11D44;
	Wed, 10 Jun 2026 10:43:39 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=tTLaRYPZ;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 83A221E0F;
	Wed, 10 Jun 2026 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1781088219;
	bh=D6obsJz71NYK4JLwwwEe9V63laATjw56y5Wd231syIo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tTLaRYPZigWDlP56wCN+z0CmzcRfiuow+tdNzZ6NZ8wC3L6Pr5YhSACGoGCsEHWsh
	 jUE91d3cHwHh46Al/HAKPSbDSRy2KHuQ0iYZc+vd0fPtEqDhd2PbMwm/j+a6v8O8py
	 fhJKNDLiEAesHvF4oDTxMkJxDWOnQGfkxThDnUW4=
Received: from [192.168.95.128] (172.30.20.172) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 10 Jun 2026 13:43:38 +0300
Message-ID: <c9d18431-b328-4920-8c4e-c336b24c72a8@paragon-software.com>
Date: Wed, 10 Jun 2026 12:43:36 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: prevent potential lcn remains uninitialized
To: Edward Adam Davis <eadavis@qq.com>,
	<syzbot+c2cfe997245202e46f10@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <ntfs3@lists.linux.dev>,
	<syzkaller-bugs@googlegroups.com>
References: <6a150a09.820a0220.e7972.0005.GAE@google.com>
 <tencent_76C985EEDDAEE04C8627DE86D9D2DC467906@qq.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <tencent_76C985EEDDAEE04C8627DE86D9D2DC467906@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/26/26 10:08, Edward Adam Davis wrote:

> The target VCN being sought was not found within runs[0], causing
> run_lookup() to return false. This causes run_lookup_entry() to return
> false, which in turn results in a len value of 0, and the new parameter
> passed to attr_data_get_block() is NULL. Collectively, these factors
> ultimately cause attr_data_get_block_locked() to exit prematurely without
> initializing lcn, thereby triggering [1].
>
> To prevent [1], the clen check within ni_seek_data_or_hole() has been
> moved to occur before the lcn check.
>
> [1]
> BUG: KMSAN: uninit-value in ni_seek_data_or_hole+0x24f/0x5f0 fs/ntfs3/frecord.c:2862
>   ni_seek_data_or_hole+0x24f/0x5f0 fs/ntfs3/frecord.c:2862
>   ntfs_llseek+0x22a/0x4a0 fs/ntfs3/file.c:1530
>   vfs_llseek fs/read_write.c:391 [inline]
>
> Fixes: c61326967728 ("fs/ntfs3: implement llseek SEEK_DATA/SEEK_HOLE by scanning data runs")
> Reported-by: syzbot+c2cfe997245202e46f10@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c2cfe997245202e46f10
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   fs/ntfs3/frecord.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 7b035da63c12..d511b6a75ae8 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2859,6 +2859,11 @@ loff_t ni_seek_data_or_hole(struct ntfs_inode *ni, loff_t offset, bool data)
>   			return err;
>   		}
>   
> +		if (!clen) {
> +			/* Corrupted file. */
> +			return -EINVAL;
> +		}
> +
>   		if (lcn == RESIDENT_LCN) {
>   			/* clen - resident size in bytes. clen == ni->vfs_inode.i_size */
>   			if (offset >= clen) {
> @@ -2909,10 +2914,6 @@ loff_t ni_seek_data_or_hole(struct ntfs_inode *ni, loff_t offset, bool data)
>   			}
>   		}
>   
> -		if (!clen) {
> -			/* Corrupted file. */
> -			return -EINVAL;
> -		}
>   	}
>   }
>   

Hello,

The patch was applied, thank you.

Regards,
Konstantin

