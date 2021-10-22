Received: from smtprelay.hostedemail.com (smtprelay0202.hostedemail.com [216.40.44.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8F472
	for <ntfs3@lists.linux.dev>; Fri, 22 Oct 2021 16:41:19 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id E39F018076226
	for <ntfs3@lists.linux.dev>; Fri, 22 Oct 2021 16:22:49 +0000 (UTC)
Received: from omf02.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id B5FA439F24;
	Fri, 22 Oct 2021 16:22:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id D40FF1D42F8;
	Fri, 22 Oct 2021 16:22:41 +0000 (UTC)
Message-ID: <d5e8af244174917e6dd1b29057b0f46f823a62e4.camel@perches.com>
Subject: Re: [PATCH 3/4] fs/ntfs3: Optimize locking in ntfs_save_wsl_perm
From: Joe Perches <joe@perches.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Date: Fri, 22 Oct 2021 09:22:40 -0700
In-Reply-To: <f8c4d63d-1296-ede2-50b9-242f52b856ed@paragon-software.com>
References: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
	 <f8c4d63d-1296-ede2-50b9-242f52b856ed@paragon-software.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: D40FF1D42F8
X-Spam-Status: No, score=-1.68
X-Stat-Signature: xjbgjke43susyq6wmjqmzzo73gupk3tm
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19pUH21oGkxLq/QnEwTrJOsBhBf+KCPFCY=
X-HE-Tag: 1634919761-37637

On Fri, 2021-10-22 at 18:55 +0300, Konstantin Komarov wrote:
> Right now in ntfs_save_wsl_perm we lock/unlock 4 times.
> This commit fixes this situation.
> We add "locked" argument to ntfs_set_ea.
[]
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
[]
> @@ -259,7 +259,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
>  
>  static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  				size_t name_len, const void *value,
> -				size_t val_size, int flags)
> +				size_t val_size, int flags, bool locked)
[]
> @@ -595,7 +597,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  		flags = 0;
>  	}
>  
> -	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
> +	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);

generally is nicer to use true/false for bool rather than true/0

>  	err = ntfs_set_ea(inode, "$LXGID", sizeof("$LXGID") - 1, &value,
> -			  sizeof(value), 0);
> +			  sizeof(value), 0, true);


