Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8948F2874FE
	for <ntfs3@lists.linux.dev>; Tue, 24 Feb 2026 18:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959119; cv=none; b=B6i0Qg2bGGl5ep6pKEOrbDYgW7h3waWAN4jl9FcAEG1/voemZbjZnRmpBl4MiJcGU44drj5PpOKPALKmcIpj2ZVneh5Il6enPmx4Rb2SZOtjeYunyXLTP023H+0AkrB9dHlD+1bXDzm1CPMiATqenFCaFsjyq13+wVAPN1zZPiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959119; c=relaxed/simple;
	bh=GfgjNRRl0PnoRxgnAnOpzGCUDXEJRmAYG1+Umtplf00=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iHSNinsG4NPBAahJuaXEGrNSUEGkPC8EtBmIbR1KeHeSjYmk1ih5ehDQlwWeRtVQGE8r/AhUk/Rsa5RW1tOdQKPi4A+SlsBXoJFT86piAZZCLFg0XCEyr7g1V4Xq1STN7UQptBdsYZUUOJsmlJQMe4QpEWBs9sHKANymXJUfnx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=fc0PC/qs; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="fc0PC/qs"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 6CA561D13;
	Tue, 24 Feb 2026 18:50:08 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=fc0PC/qs;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C0AE921FA;
	Tue, 24 Feb 2026 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1771959116;
	bh=zNRAvFl9043YV119u3TiaDLcdNWV/16Cpu7LHA3jGFI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fc0PC/qsxzR0VyHUcoPvrNZ96DAruQjJmPpbWJMfpH45rodxixttjI5SM7BIQ3B00
	 Qg2xxkUB1lfYkrqwwZY4aB1/EKOzlC3jSflCOVcuYgEIrMtCGAnBOt50nf5NF7QDU9
	 zBme3oIw1g0DLYB/Vo0FH6qD/piv+Vccpr1wF//Q=
Received: from [192.168.95.128] (172.30.20.212) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 24 Feb 2026 21:51:55 +0300
Message-ID: <a1d6ec4c-35ae-46b6-96b1-6150b16177d2@paragon-software.com>
Date: Tue, 24 Feb 2026 19:51:53 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: reject inodes with zero non-DOS link count
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260210155634.380168-1-n7l8m4@u.northwestern.edu>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260210155634.380168-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 2/10/26 16:56, Ziyi Guo wrote:

> ntfs_read_mft() counts file name attributes into two variables:
> names (all names including DOS 8.3) and links (non-DOS names
> only). The validation at line 424 checks names but set_nlink()
> at line 436 uses links. A corrupted NTFS image where all file
> name attributes have type FILE_NAME_DOS passes the names check
> but results in set_nlink(inode, 0).
>
> When such an inode is loaded via a code path that passes name=NULL
> to ntfs_iget5() and the nlink=0 inode enters the VFS. The subsequent
> unlink, rmdir, or rename targeting this inode calls drop_nlink()
> which triggers WARN_ON(inode->i_nlink == 0) in fs/inode.c.
>
> An all-DOS-name MFT record cannot exist on a valid NTFS volume.
> Reject such records by checking for links == 0 before
> calling set_nlink().
>
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
>   fs/ntfs3/inode.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 0a9ac5efeb67..a2984a4996c8 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -433,6 +433,11 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>   		ni->mi.dirty = true;
>   	}
>   
> +	if (!links) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
>   	set_nlink(inode, links);
>   
>   	if (S_ISDIR(mode)) {

Hello,

Patch looks good — applied. Thanks.

Regards,
Konstantin

