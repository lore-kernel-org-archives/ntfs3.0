Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3A2DE713;
	Thu, 20 Nov 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629655; cv=none; b=akopS1kxx7WUxViE9/EnCV7qUZPnKQ32k8UrVUzWAyBBvBy4ZjVM++VMNEMLDdrYNhejumzuRkGzA2SIPi3Mqpwx99hNdT1fl1eSlBpx4W+5SXKfztsyQwEBF69NnkEWrKUMYc9IX7J8ewILFcXENGiMPbvw0Dlg73oBuy5U3Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629655; c=relaxed/simple;
	bh=PSkAeWjPYU2+oJL1IxxpXcmP8lJIVIN7h490fCsHOWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IjA80tSmsq2mGXBNAl0/iwgNckWj2/ghTKLkEkr2exfq04s3RJOp+jkYB9rYubwZO7h3AJHN89n4knYH2kYRuFh6d2jzmN34QX1056tmNd5p+q/iofjefsHwNoPpsSnksINRiJDx+Zk6aFi3fflBNEHuMDA4EwVFW+vQOpUOThE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=GLE5VSNB; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="GLE5VSNB"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 43EA226;
	Thu, 20 Nov 2025 09:04:04 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=GLE5VSNB;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id BD77D2471;
	Thu, 20 Nov 2025 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763629651;
	bh=1IK8IMzGlQ1T8PqbDyyvX9TqWcC+UsrGSAypa3d/kTI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GLE5VSNBxtzRJ0Ldho8HrmR4ubZLZPxxIo8xwO38EAdD8ibg9Pb2tfxRDBSFmdgIE
	 /cERgz3fqKg3xBMTQSjk6+s5/+FCn7vD6jMd3gcQ1ug2HgfTLw9cI4apUv5WSfsaVL
	 d18m1cn72ojguVkx0+wmzSVMYqhm2pJ+APmGLZ/c=
Received: from [192.168.95.128] (172.30.20.202) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 20 Nov 2025 12:07:29 +0300
Message-ID: <6b8a9def-30ce-4f82-9b7e-c4292f0fc5ba@paragon-software.com>
Date: Thu, 20 Nov 2025 10:07:28 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next] fs/ntfs3: Initialize allocated memory before
 use
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<david.hunter.linux@gmail.com>, <skhan@linuxfoundation.org>,
	<khalid@kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
	<syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com>,
	<syzbot+0399100e525dd9696764@syzkaller.appspotmail.com>
References: <20251105211808.260893-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251105211808.260893-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 11/5/25 22:18, Bartlomiej Kubik wrote:

> KMSAN reports: Multiple uninitialized values detected:
>
> - KMSAN: uninit-value in ntfs_read_hdr (3)
> - KMSAN: uninit-value in bcmp (3)
>
> Memory is allocated by __getname(), which is a wrapper for
> kmem_cache_alloc(). This memory is used before being properly
> cleared. Change kmem_cache_alloc() to kmem_cache_zalloc() to
> properly allocate and clear memory before use.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Fixes: 78ab59fee07f ("fs/ntfs3: Rework file operations")
> Tested-by: syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com
> Reported-by: syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=332bd4e9d148f11a87dc
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Fixes: 78ab59fee07f ("fs/ntfs3: Rework file operations")
> Tested-by: syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
> Reported-by: syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0399100e525dd9696764
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>   fs/ntfs3/inode.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index ab61388f819c..13720baf079d 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -1281,7 +1281,7 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
>   		fa |= FILE_ATTRIBUTE_READONLY;
>
>   	/* Allocate PATH_MAX bytes. */
> -	new_de = __getname();
> +	new_de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
>   	if (!new_de) {
>   		err = -ENOMEM;
>   		goto out1;
> @@ -1723,10 +1723,9 @@ int ntfs_link_inode(struct inode *inode, struct dentry *dentry)
>   	struct NTFS_DE *de;
>
>   	/* Allocate PATH_MAX bytes. */
> -	de = __getname();
> +	de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
>   	if (!de)
>   		return -ENOMEM;
> -	memset(de, 0, PATH_MAX);
>
>   	/* Mark rw ntfs as dirty. It will be cleared at umount. */
>   	ntfs_set_state(sbi, NTFS_DIRTY_DIRTY);
> @@ -1762,7 +1761,7 @@ int ntfs_unlink_inode(struct inode *dir, const struct dentry *dentry)
>   		return -EINVAL;
>
>   	/* Allocate PATH_MAX bytes. */
> -	de = __getname();
> +	de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
>   	if (!de)
>   		return -ENOMEM;
>
> --
> 2.39.5

The patch has been applied. Thanks for your work.

Regards,
Konstantin

