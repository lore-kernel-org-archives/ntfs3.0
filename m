Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7176330CD87
	for <ntfs3@lists.linux.dev>; Thu, 20 Nov 2025 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628458; cv=none; b=UBIRJv8eYmjwAsQfubSYgYrOEEOE4UhSeyYQkEvCieYo7gXi8e9ClRD6FVnTRh9vg5jl7kssR78uuKY3ftK7Q6vpWzFxRp+ZLfpGaLoDLZW4Qmi5WijoyGDMFjnV9lqfcavC4GeU9fc7kiLL/xbeC6zdKYJeWS34k5JuCKPcozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628458; c=relaxed/simple;
	bh=+UtCTbJbfWDfXf87d+xHjC0gEqn0TpoUkhAohozFrgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RPzEKYIOwcrjVePIGK1Nq5c+bhzqOm/LMBU1I7SLEvfr0tdlwgBRY24AqHuyOYrdR7oui0/qfkGmwJXvAEsHZkdseHyczhKIail9GPUXlVPoSSDMpuERzVbPQFG58t8XUPA3ucu/XEuzvB1vL/TXFIClj4JkT9qDFeJfeowWats=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=e8MjyF+H; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="e8MjyF+H"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 212C526;
	Thu, 20 Nov 2025 08:44:08 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=e8MjyF+H;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 9B47F1FA3;
	Thu, 20 Nov 2025 08:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763628455;
	bh=haxiHN9F7FumxXhH70G3CzcvMZvRkQvDGIJaweDv0rk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=e8MjyF+HWNkt+LEAakEqQDqjahEQmKJtZ7TK2NP1IAhW4yzwkM9Uh5MCX0cJtDWeB
	 KGx72DAuvYUd6ia4ZNXCeCvqgFnexYwqflYKFYwv1cXNCt0gLCoY/BlX/M8jnsKBc+
	 gMyn3O3Ba51n6yodbOSfQ+iccGSfHSs5ylVzP11I=
Received: from [192.168.95.128] (172.30.20.202) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 20 Nov 2025 11:47:34 +0300
Message-ID: <e957a100-9639-4b1e-9215-ce07ccd508c4@paragon-software.com>
Date: Thu, 20 Nov 2025 09:47:31 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ntfs3: Fix uninit buffer allocated by __getname()
To: Sidharth Seela <sidharthseela@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com>
References: <20250923064015.178554-2-sidharthseela@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20250923064015.178554-2-sidharthseela@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 9/23/25 08:40, Sidharth Seela wrote:

> Fix uninit errors caused after buffer allocation given to 'de'; by
> initializing the buffer with zeroes. The fix was found by using KMSAN.
>
> Reported-by: syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com
> Fixes: 78ab59fee07f2 ("fs/ntfs3: Rework file operations")
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
>
> --
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 37cbbee7fa58..6b14c13bda68 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -1716,6 +1716,7 @@ int ntfs_link_inode(struct inode *inode, struct dentry *dentry)
>   	de = __getname();
>   	if (!de)
>   		return -ENOMEM;
> +	memset(de, 0, PATH_MAX);
>   
>   	/* Mark rw ntfs as dirty. It will be cleared at umount. */
>   	ntfs_set_state(sbi, NTFS_DIRTY_DIRTY);

Patch looks good — applied. Thanks.

Regards,
Konstantin

