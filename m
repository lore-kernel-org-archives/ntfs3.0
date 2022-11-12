Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B2F63C4
	for <ntfs3@lists.linux.dev>; Sat, 12 Nov 2022 18:24:14 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 789341FA3;
	Sat, 12 Nov 2022 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1668277280;
	bh=YDMmiy8TKjg1hrDs5YhNJ+iYuddd49hGLx1IrU5mUX8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RUuTsr5YVA0K0RMvUjjFoUkuRtn9D/0BJ49z0UYVxgQt7kucFmycISGQ/POzkESA8
	 AbC+21TFbEgqmhLFBTsT/ms9dAxnl9DObLucH3E/dsAL3Dmw/BlG2C6wBDkFOOdusu
	 +I5BKSsX3TbM3MPFG9aaSs0myUgeRWSZAPzldPXQ=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sat, 12 Nov 2022 21:24:12 +0300
Message-ID: <72a41efe-a196-451f-6b85-6dd944a58c5d@paragon-software.com>
Date: Sat, 12 Nov 2022 21:24:11 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: delete duplicate condition in ntfs_read_mft()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <ntfs3@lists.linux.dev>, Edward Lo <edward.lo@ambergroup.io>, Hawkins
 Jiawei <yin31149@gmail.com>, <kernel-janitors@vger.kernel.org>
References: <Y0pvRzgu5FiGhghL@kili>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <Y0pvRzgu5FiGhghL@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 10/15/22 11:28, Dan Carpenter wrote:
> There were two patches which addressed the same bug and added the same
> condition:
> 
> commit 6db620863f85 ("fs/ntfs3: Validate data run offset")
> commit 887bfc546097 ("fs/ntfs3: Fix slab-out-of-bounds read in run_unpack")
> 
> Delete one condition.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I deleted this one because it was further away from the "roff = "
> assignement.
> 
>   fs/ntfs3/inode.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index a31474d697e0..e6143da5b4d6 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -374,12 +374,6 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>   
>   	t64 = le64_to_cpu(attr->nres.svcn);
>   
> -	/* offset to packed runs is out-of-bounds */
> -	if (roff > asize) {
> -		err = -EINVAL;
> -		goto out;
> -	}
> -
>   	err = run_unpack_ex(run, sbi, ino, t64, le64_to_cpu(attr->nres.evcn),
>   			    t64, Add2Ptr(attr, roff), asize - roff);
>   	if (err < 0)

I missed this situation when applying patches.
Thanks for catching this.
