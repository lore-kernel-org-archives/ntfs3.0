Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867473210
	for <ntfs3@lists.linux.dev>; Thu,  9 Jun 2022 16:22:41 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 25658244B;
	Thu,  9 Jun 2022 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1654791714;
	bh=2pF+Mncm/+13tmpKoUp3zQxXypd1Pb171Sxbd2ILQ34=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CmqIRscKSuMzWqapIdLBC3JKeQsBgvVtaRtnvYnCfsjJ/9MYEjCxjcDj0OQZ7zsy+
	 2C6oZKAbmFrGo/HjstWBL0SXJKsrzgSFmeY3KaP5MQCCUwMqXGnHw+SkRUAwyMWFbq
	 Iu02WK7adqiLjVfjs8IfWfRuqGm2i9zQm8GYWtNA=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id DC9701D30;
	Thu,  9 Jun 2022 16:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1654791752;
	bh=2pF+Mncm/+13tmpKoUp3zQxXypd1Pb171Sxbd2ILQ34=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nWDG+I0ya82irHCM7BQC1ktjgH9LBoGssPuTog8R3wT2wpd3Wxb6LoNjIMqrEkG+L
	 dVLtpe4xmeSgKbCia4HTYoe0arjV/sAlbnJWl6gLcH9WghKVdEPtTw6yqyUsMPJZ9B
	 BoN1zdluEXYRvb67O+Gv4pr5IqJMCmhPsZeIYa08=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 9 Jun 2022 19:22:32 +0300
Message-ID: <20af6039-1461-648b-0ff8-ef698fd62c83@paragon-software.com>
Date: Thu, 9 Jun 2022 19:22:32 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC] ntfs3: Use the same order for acl pointer check in
 ntfs_init_acl
Content-Language: en-US
To: Yang Xu <xuyang2018.jy@fujitsu.com>
CC: <ntfs3@lists.linux.dev>
References: <1650444509-3330-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <1650444509-3330-1-git-send-email-xuyang2018.jy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 4/20/22 11:48, Yang Xu wrote:
> Like ext4 and other use ${fs}_init_acl filesystem, they all used the following
> style
> 
>         error = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
>         if (error)
>                  return error;
> 
>          if (default_acl) {
>                  error = __ext4_set_acl(handle, inode, ACL_TYPE_DEFAULT,
>                                         default_acl, XATTR_CREATE);
>                  posix_acl_release(default_acl);
>          } else {
>                  inode->i_default_acl = NULL;
>          }
>          if (acl) {
>                  if (!error)
>                          error = __ext4_set_acl(handle, inode, ACL_TYPE_ACCESS,
>                                                 acl, XATTR_CREATE);
>                  posix_acl_release(acl);
>          } else {
>                  inode->i_acl = NULL;
>          }
> 	...
> 
> So for the readability and unity of the code, adjust this order.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>   fs/ntfs3/xattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index afd0ddad826f..64cefa869a61 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -642,13 +642,13 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
>   		inode->i_default_acl = NULL;
>   	}
>   
> -	if (!acl)
> -		inode->i_acl = NULL;
> -	else {
> +	if (acl) {
>   		if (!err)
>   			err = ntfs_set_acl_ex(mnt_userns, inode, acl,
>   					      ACL_TYPE_ACCESS);
>   		posix_acl_release(acl);
> +	} else {
> +		inode->i_acl = NULL;
>   	}
>   
>   	return err;

Applied, thanks!
