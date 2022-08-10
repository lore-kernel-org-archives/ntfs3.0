Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900DE2CA7
	for <ntfs3@lists.linux.dev>; Wed, 10 Aug 2022 16:18:03 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 0DEF91FAD;
	Wed, 10 Aug 2022 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1660148190;
	bh=T2NLMxv4OIuyPv3DucWm3v2GwTiPDvFi/cz+rwuWf/E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qceRUKQwUTHULIFNTOgCiqtd7kuRXMs2NGM0gOV122TTT5M2OLKVzTonOkZNYgie3
	 twJwtsZ0mvc/Jy9aPlGClbta0CRU6bIWy8QOIw+cs0XQV/bA8a7jnDC9Dx1/vxJlJS
	 btkKQ/9SuClvbxweQ8XmLi5BUOWC4NYPC63JunsE=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 71299DD;
	Wed, 10 Aug 2022 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1660148281;
	bh=T2NLMxv4OIuyPv3DucWm3v2GwTiPDvFi/cz+rwuWf/E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oOS9JoHtsyLaX0QZAQHHGWen4lKrOwipFPrHCZmd1PN9Ph18mzEd0D5rpIKNZ8zu/
	 E9z8FbMFzUTzdiUefugbG8CzJx/nyItmbbY+pAkKDu/4doyslJ95ax1cUNDDtLjxKG
	 dulsiVixj3sYnEavJZjTYweqOgDTay6xcLMzAxsw=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 10 Aug 2022 19:18:01 +0300
Message-ID: <fba5803f-ec98-1b63-1518-803567a5d5ef@paragon-software.com>
Date: Wed, 10 Aug 2022 19:18:00 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: uninitialized variable in ntfs_set_acl_ex()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <ntfs3@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <YvDKoXqt5GuZNzzN@kili>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <YvDKoXqt5GuZNzzN@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 8/8/22 11:34, Dan Carpenter wrote:
> The goto out calls kfree(value) on an uninitialized pointer.  Just
> return directly as the other error paths do.
> 
> Fixes: 460bbf2990b3 ("fs/ntfs3: Do not change mode if ntfs_set_ea failed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   fs/ntfs3/xattr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 02f6a933ee79..5bdff12a1232 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -568,7 +568,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>   			err = posix_acl_update_mode(mnt_userns, inode, &mode,
>   						    &acl);
>   			if (err)
> -				goto out;
> +				return err;
>   		}
>   		name = XATTR_NAME_POSIX_ACL_ACCESS;
>   		name_len = sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1;

Thanks for patch, applied!
