Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0A3193
	for <ntfs3@lists.linux.dev>; Mon,  8 May 2023 12:47:24 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 6AABA21BF;
	Mon,  8 May 2023 12:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1683549755;
	bh=+RIZwKheUQEVK7fCvngM0V+Ns6xXNCmYVIblbPmQT/8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y79BRSN/xl3DUV6ZASNvDqiyVQwl2/rrup9RX8XyoGQZ6/6EJk7FzvADmIEgq9KH1
	 Lv/2IxLN9s9IUa+APrwkgpuK0bnRDXniEfqg0AH1q3PM2MgEaOWxabC1l4nL4zJSD3
	 3ufeANTBHpMAhRhJhDNJqskyQqf60fWaL0OYeDhA=
Received: from [192.168.211.146] (192.168.211.146) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 8 May 2023 15:47:21 +0300
Message-ID: <93d571a1-ca88-4824-01db-3b16973627e0@paragon-software.com>
Date: Mon, 8 May 2023 16:47:21 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] fs: ntfs3: Fix a possible null-pointer dereference in
 ni_clear()
Content-Language: en-US
To: Jia-Ju Bai <baijiaju1990@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20230111085943.1127-1-baijiaju1990@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20230111085943.1127-1-baijiaju1990@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.146]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

In a previous commit c1006bd13146, ni->mi.mrec in ni_write_inode()
> could be NULL, and thus a NULL check is added for this variable.
>
> However, in the same call stack, ni->mi.mrec can be also dereferenced
> in ni_clear():
>
> ntfs_evict_inode(inode)
>    ni_write_inode(inode, ...)
>      ni = ntfs_i(inode);
>      is_rec_inuse(ni->mi.mrec) -> Add a NULL check by previous commit
>    ni_clear(ntfs_i(inode))
>      is_rec_inuse(ni->mi.mrec) -> No check
>
> Thus, a possible null-pointer dereference may exist in ni_clear().
> To fix it, a NULL check is added in this function.
>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> ---
>   fs/ntfs3/frecord.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index f1df52dfab74..046ec4179d75 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -102,7 +102,7 @@ void ni_clear(struct ntfs_inode *ni)
>   {
>   	struct rb_node *node;
>   
> -	if (!ni->vfs_inode.i_nlink && is_rec_inuse(ni->mi.mrec))
> +	if (!ni->vfs_inode.i_nlink && ni->mi.mrec && is_rec_inuse(ni->mi.mrec))
>   		ni_delete_all(ni);
>   
>   	al_destroy(ni);

I apologize for the delayed response.

Thank you for your work, applied!

