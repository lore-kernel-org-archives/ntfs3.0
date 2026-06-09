Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902A40D58F
	for <ntfs3@lists.linux.dev>; Tue,  9 Jun 2026 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781036393; cv=none; b=YzlFGBXs7ffkErMps0MpqpAQACQHBigPW9nfk8X+QoE0fAAarLWz7uU6JNUB8zTrNE/UZFxfUJXDwIRyNV4IuH+vvtKQMDZAXZhR5UBKy5Y6e5gcDPbU9P5i7+1lVC3OAGM3dlt9mgnvL/lFP0hca0KChV53EI1dZNEoxdsgbf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781036393; c=relaxed/simple;
	bh=aQ6OGLOH5zUsU+09RnUfb1c/omR2JYQX9+9kMhW0F18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mce6PhzVsvj9GKf+D4caAB6PPMn58IZs1S0hCMcs9Bd+sxuU6NgVN/xAzoOZ6ZLgx/UW8QN+T3LMP2wOfRBiPPIpKYa9LaLFSuXcsLB8525UYcqhMN2wFHqLYEmVMhZlH1IlBMV9A/IT1sG79KbCnXbiYwp7C2wOpd1UTtnAOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=HxJug7gP; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="HxJug7gP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vXDGceYndfmFhk5Jf/BV2eP7LTY6LkGm1oYZtz4QyxY=; b=HxJug7gPq3bBvnOiyCfV/+kD56
	JCoS1uvW5NKTpW0ikBdMZFe0UW6SflgSYQWbJx4IUoQKkhmXga5gFQ9WS3xm2jnHDn1XHWNgWwJBe
	dCSIgoRHhyMy3P6K9DzhAgPLCCr72t93Cjw/xqzoWyb2pVhExpJdwPsJAGTEPDlreIlKAMTkfkLFg
	lx8+S+LxCqn+K9WceBus/9R19S2AIBqVMC9zOhWqex1xRHHtRxVfCMmm4aVlbKGTnnDZFv7Y3MFcL
	6H/kkrWI2vF/dL4NGfLeSDsti+vofNItkE7OqQmvcG25KQjOmkneVby7TKR0EegbA0uz2amKB10Cd
	8n/Dw0Hw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wX2vM-0000000FCYU-3PTL;
	Tue, 09 Jun 2026 20:19:48 +0000
Date: Tue, 9 Jun 2026 21:19:48 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, lvc-project@linuxtesting.org,
	syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Subject: Re: [PATCH] ntfs3: fix info-leak in ntfs_rename()
Message-ID: <20260609201948.GK2636677@ZenIV>
References: <20260609123618.712961-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609123618.712961-1-dmantipov@yandex.ru>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Jun 09, 2026 at 03:36:18PM +0300, Dmitry Antipov wrote:
> In 'ntfs_rename()', buffer passed to 'fill_name_de()' should
> be allocated with 'kzalloc()' to avoid exposing contents of
> an uninitialized kernel memory via 'copy_to_user_iter()'.
> 
> Reported-by: syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=905d785c4923bea2c1db
> Fixes: ca2a04e84af7 ("ntfs: ->d_compare() must not block")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  fs/ntfs3/namei.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
> index b2af8f695e60..74fe002214f3 100644
> --- a/fs/ntfs3/namei.c
> +++ b/fs/ntfs3/namei.c
> @@ -303,7 +303,7 @@ static int ntfs_rename(struct mnt_idmap *idmap, struct inode *dir,
>  			return err;
>  	}
>  
> -	de = kmalloc(PATH_MAX, GFP_KERNEL);
> +	de = kzalloc(PATH_MAX, GFP_KERNEL);
>  	if (!de)
>  		return -ENOMEM;

Could you please elaborate the way by which the contents of that
object would have managed to reach copy_to_user_iter()?
While we are at it, which userland addresses would rename()
want to write into?
