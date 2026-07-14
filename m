Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0D4D90D3
	for <ntfs3@lists.linux.dev>; Tue, 14 Jul 2026 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047506; cv=none; b=gV8DaApqtxqh0HLA4odcE/RWOkENgXc4fZaTMeg/Sqo5tQAEQ5j4GN6DcVMK5cZMtQpm1EzTxMZ2UNxo5OODf4cd5Pg8SaIC0AwnGyhP1cSZUjqILU11V+B1jqXRP3bz9BZoCPxHX1yDgbD1lXRCSVs222IL1TsBXHXoyRfg4ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047506; c=relaxed/simple;
	bh=Wuu9TMel/4j44R4pJusSgZtAqR4E0gDb47d5ewxE1iE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ImATIl6/vkwjDMFY6EIUOeZ0CGzQPJXk/iibIGE8UDZQnODIdFaLp/7fsCGdzn7XRPuVMsOuTDidfVAwzEc/vGiy1s3m0L5ixqnT+Zzqu7Dfmww7A3EjzDUemw5dAL9K7R99NgRmhbxVipM6MFhAovfotOefF4JCMyY8m99l1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=nYVM723J; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="nYVM723J"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 9FEF11D37;
	Tue, 14 Jul 2026 16:45:12 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=nYVM723J;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6995C1F9F;
	Tue, 14 Jul 2026 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784047503;
	bh=s2BAllRsTRG4BM9hSKHqHBV5tqi2BwbmS5230yDqAII=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nYVM723JScZzdo/8q3TYlYx3J/l7Cm+zPzEOXrZIGbdmeLB0CW+TsgUtvjzq5OJmU
	 CjPm2qQUUcz0UCcMHi1v1h+Y6nisp5fAytD05kMhUXsfjSG3h6DsMm/cXzOG5imyUH
	 GZoUhWe3M9hcNpkEK8qidYv4UP6MI7IZf/FfHF8o=
Received: from [192.168.95.128] (172.30.20.173) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 14 Jul 2026 19:45:01 +0300
Message-ID: <f58b55f3-e8c1-4af0-901a-16ef6f05af48@paragon-software.com>
Date: Tue, 14 Jul 2026 18:45:00 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in
 reparse/objid init
To: Weiming Shi <bestswngs@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Xiang Mei
	<xmei5@asu.edu>, Weiming Wu <weiming3@asu.edu>
References: <20260610115724.1813176-2-bestswngs@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260610115724.1813176-2-bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/10/26 13:57, Weiming Shi wrote:

> From: Weiming Wu <weiming3@asu.edu>
>
> ntfs_reparse_init() and ntfs_objid_init() parse the index root of the
> $Extend/$Reparse and $Extend/$ObjId metafiles (the INDEX_ROOT attributes
> named $R and $O). They read its type and rule fields through
> resident_data(), which does not check that the resident attribute is
> large enough to hold them.
>
> mi_enum_attr() accepts a resident attribute with data_off == asize and
> data_size == 0. For such an attribute placed last in its MFT record,
> resident_data() returns a pointer to the end of the record_size buffer,
> so reading root->type / root->rule reads past the allocation.
>
> Use resident_data_ex(attr, sizeof(struct INDEX_ROOT)) and bail out when
> it returns NULL, as ntfs_security_init() already does for $SDH / $SII.
>
> The attribute is only parsed while mounting a crafted image, so this
> needs CAP_SYS_ADMIN.
>
>   BUG: KASAN: slab-out-of-bounds in ntfs_reparse_init (fs/ntfs3/fsntfs.c:2306)
>   Read of size 4 at addr ffff88801219dc00 by task mount
>    ntfs_reparse_init (fs/ntfs3/fsntfs.c:2306)
>    ntfs_fill_super (fs/ntfs3/super.c:1604)
>    get_tree_bdev_flags (fs/super.c:1703)
>    vfs_get_tree (fs/super.c:1758)
>    path_mount (fs/namespace.c:4131)
>    __x64_sys_mount (fs/namespace.c:4360)
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   fs/ntfs3/fsntfs.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index d0434756029b6..42493a2da24ef 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -2302,8 +2302,8 @@ int ntfs_reparse_init(struct ntfs_sb_info *sbi)
>                  goto out;
>          }
>
> -       root_r = resident_data(attr);
> -       if (root_r->type != ATTR_ZERO ||
> +       root_r = resident_data_ex(attr, sizeof(struct INDEX_ROOT));
> +       if (!root_r || root_r->type != ATTR_ZERO ||
>              root_r->rule != NTFS_COLLATION_TYPE_UINTS) {
>                  err = -EINVAL;
>                  goto out;
> @@ -2340,8 +2340,8 @@ int ntfs_objid_init(struct ntfs_sb_info *sbi)
>                  goto out;
>          }
>
> -       root = resident_data(attr);
> -       if (root->type != ATTR_ZERO ||
> +       root = resident_data_ex(attr, sizeof(struct INDEX_ROOT));
> +       if (!root || root->type != ATTR_ZERO ||
>              root->rule != NTFS_COLLATION_TYPE_UINTS) {
>                  err = -EINVAL;
>                  goto out;
> --
> 2.43.0
>
Hello,

Very sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

