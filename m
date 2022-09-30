Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF55A66
	for <ntfs3@lists.linux.dev>; Fri, 30 Sep 2022 16:07:37 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 2A1EB21F9;
	Fri, 30 Sep 2022 16:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1664553920;
	bh=nuTiP5RQ7QlDNzZTBO6J9R76mnMHB0PA9hPDdswRpGE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tyZmy0LbwFCT31/WMxDKy/cdYn8DGZq/kleN8mIb8tKvbFX/9J4BFYtbSlreh/C70
	 iUM2jvAgUOH6W9mRylcHXzOQcEO20Uf5bDnkXb3YvwRD+/laWQLnQRDBl42KI3cFpA
	 +VGYYr0dZ7tq4EFNLjKe66WasUNK5zQG0zDPRA3E=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Sep 2022 19:07:34 +0300
Message-ID: <97ee7bbe-652f-e0f5-1ffe-06eb3a32d1aa@paragon-software.com>
Date: Fri, 30 Sep 2022 19:07:34 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ntfs3: harden against integer overflows
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <ntfs3@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <YxIGoOgUtaUP59FK@kili>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <YxIGoOgUtaUP59FK@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 9/12/22 18:08, Dan Carpenter wrote:
> Smatch complains that the "add_bytes" is not to be trusted.  Use
> size_add() to prevent an integer overflow.
> 
> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The add_bytes variable comes from:
> 
> 	add = ALIGN(struct_size(ea_all, name, 1 + name_len + val_size), 4);
> 
> This is problematic and has inspired a new static checker warning:
> 
> fs/ntfs3/xattr.c:26 unpacked_ea_size() warn: using integer overflow function 'size_add()' for math
> fs/ntfs3/xattr.c:290 ntfs_set_ea() warn: using integer overflow function 'size_add()' for math
> 
> The issue is that the struct_size() has an integer overflow and we call
> ALIGN() on it, then "add" becomes zero.  Is there a bounds check that
> we could use here?
> 
> 	add = struct_size(ea_all, name, 1 + name_len + val_size);
> 	if (add > SOMETHING_MAX)
> 		return -EINVAL;
> 
> Otherwise the limit would have to be if (add > ULONG_MAX - 3) { which
> is ugly.
> 
>   fs/ntfs3/xattr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 7de8718c68a9..ea582b4fe1d9 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -107,7 +107,7 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
>   		return -EFBIG;
>   
>   	/* Allocate memory for packed Ea. */
> -	ea_p = kmalloc(size + add_bytes, GFP_NOFS);
> +	ea_p = kmalloc(size_add(size, add_bytes), GFP_NOFS);
>   	if (!ea_p)
>   		return -ENOMEM;
>   

Applied, thanks!
