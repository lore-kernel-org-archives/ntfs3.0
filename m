Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F7C23EAB8
	for <ntfs3@lists.linux.dev>; Sat,  6 Jun 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780743912; cv=none; b=dIU/WvI+YApN3hcP/jNlk31b3rXizejbq9mfgeNV96Hs1h3XP28YyaN+5pd2TGWMotw4fh+uoyWBORpqOTh3Ec6e1sthL52BalVWAdVjEmTyMU0aQOhitFeAT3pM9ATXIr2XTcuxtP7zG8E3gXpXOJmphdpCNH+uyKNVKlwxUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780743912; c=relaxed/simple;
	bh=rrZb6Ta4c7i2Oflor+d3spOg4ZD2PUkEHagIDH4s3Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbAQrZeA+jntr/sWt/O2OIXTtIilfOBLtLRvYz80nkrwci/h4xMrvpZpQjiieAH2L1lm24xnRkGXI5ChWl45nMwdx7fKtgPkzdf3NAwnugK/7jK2RNflLK1i4d/S8GnZZyIIVeEnDI4If0NmZNNt2daRZCkUnhglUOfLgXwFDbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=NYC7E//e; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="NYC7E//e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1780743907; bh=zD5XM3vbE38TnGRFFZ49dxmzWsjnLL8sJOiSHEOoav8=;
	h=From:Message-ID:From;
	b=NYC7E//e0NrC6Z3gKFZO23oIv9cbKY63ju6DYB4vceShrxNVdHwx7lC4btThe3k+A
	 hdTgOQ3kDwHpnXIlzTW9NCC4Ktb/lc3Xl4Py+rmJqmETquugDNbRWxZ7zs6x4tT9g/
	 I69JrlS/m5b16YvyzYz4/lFAtm4mAojO22iEGZoE=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id AEB0BC0A3C;
	Sat, 06 Jun 2026 13:05:07 +0200 (CEST)
Date: Sat, 6 Jun 2026 13:05:07 +0200
From: Willy Tarreau <w@1wt.eu>
To: sdj asj <sdjasjbuaa@gmail.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [SECURITY] ntfs3: direct $LX* xattr writes can create a root
 SUID file
Message-ID: <aiP-42fhOyMGK8Yg@1wt.eu>
References: <CAFTRC0=MDbnsNtb4-p7v4Hy9P-U4PsJuWv7s4MX0aEZcMxDVHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFTRC0=MDbnsNtb4-p7v4Hy9P-U4PsJuWv7s4MX0aEZcMxDVHw@mail.gmail.com>

Hello,

[moved the security list to bcc since the message was sent to public lists]

Comments below anyway.

On Sat, Jun 06, 2026 at 06:57:01PM +0800, sdj asj wrote:
> PoC
> 
> The core userspace trigger is just direct setxattr() on $LXUID/$LXGID/$LXMOD
> followed by inode reload. The following is copy/paste runnable on a vulnerable
> kernel if /mnt/ntfs3 is a writable NTFS3 mount:
(...)

It's usually not a good idea to send proof of concepts to public lists
as it tends to add pressure to maintainers who feel like they need to
apply an urgent fix.

> Proposed fix:

Was this tested ?

> [PATCH] ntfs3: reject direct userspace writes to reserved $LX* xattrs
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 9eeac0ab2..0bc633025 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -851,6 +851,14 @@ static int ntfs_getxattr(const struct
> xattr_handler *handler, struct dentry *de,
>   return err;
>  }
> 
> +static bool ntfs_is_reserved_lxattr(const char *name)
> +{
> + return !strcmp(name, "$LXUID") ||
> +        !strcmp(name, "$LXGID") ||
> +        !strcmp(name, "$LXMOD") ||
> +        !strcmp(name, "$LXDEV");
> +}
> +
>  /*
>   * ntfs_setxattr - inode_operations::setxattr
>   */
> @@ -955,6 +963,11 @@ static noinline int ntfs_setxattr(const struct
> xattr_handler *handler,
>     goto out;
>   }
> 
> + if (ntfs_is_reserved_lxattr(name)) {
> +   err = -EPERM;
> +   goto out;
> + }
> +
>   /* Deal with NTFS extended attribute. */
>   err = ntfs_set_ea(inode, name, strlen(name), value, size, flags, 0,
>         NULL);

Please see Documentation/process/submitting-patches.rst to see how to
turn this into a real patch that can be applied, which if accepted, will
get you credit for finding and fixing this bug.

Also please check Documentation/process/email-clients.rst to find how to
fix your mailer which mangled spaces and tabs as you can see above.

> This report was prepared with AI assistance, so I am treating it as public
> per Documentation/process/security-bugs.rst.

Thanks! Please note that the doc asks not to share PoCs with public
lists, and suggests not to Cc security@ in this case either. It also
asks to provide a tested patch.

Thanks,
Willy
