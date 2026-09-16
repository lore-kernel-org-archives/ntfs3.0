Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23B4F30F8
	for <ntfs3@lists.linux.dev>; Wed, 16 Sep 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557016; cv=none; b=hEgWYyYBhQlWd1sKjDdxD2/P7Oy6oAcqfBQoNmfdXHTY6YsZgmFLktb8XmPwdjjVrtv530IS5gFotXBibT7lbGP3xU3kldOykeuEizkSifff5gqKCCJqudUZ52071JtWsx0hfZOQHRllsabtVe8ELb8l6aCy5NJd+27FInXeRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557016; c=relaxed/simple;
	bh=le76ZqfvuN+l4sYJZ5Z7prmLfIFWQvnGTDw8bLsWVcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u6bLKGnRuFCo8MkcfWz9UOxUMQIU85CSgKxmFAtkBTy4W7k0olMOb9xdbEdFcQRr14aMHTxn22uAoXJDKurb4z2+RzFy0HHhClUVCFXthQu1cEfE2IJUHbH0A+Tveq45qF9tjezU0Z0cHkXjUgqrGTGRx6mEfFmLgKUAts3e5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=dP0txIdT; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="dP0txIdT"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 7EF171D42;
	Wed, 16 Sep 2026 11:11:03 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=dP0txIdT;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id B665521F5;
	Wed, 16 Sep 2026 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789557007;
	bh=VzCreqDw8UDzeuNtgjhCRdJeBl3jngad14CSjKx/vEc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dP0txIdT0xy8dKMkntipUit4kd6DOADXlYUQzVqsCEuAWIgoNb0gs+zRRwIG4mIHL
	 U5txOaTDpoaWiPLRVUQRNVbdOqF1B2OX+bIp55o7FtBB9rBEeWgttH/9q+4dZ7rTVZ
	 YSjZc6UEJJqopLQWmvQHFivQGhKkPOpeRdyPiCzk=
Received: from [192.168.95.128] (172.30.20.192) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 16 Sep 2026 14:10:07 +0300
Message-ID: <77f50267-6102-44f3-85b3-3b7572c93687@paragon-software.com>
Date: Wed, 16 Sep 2026 13:10:05 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix out-of-bounds read in ntfs_read_mft()
To: Weiming Shi <bestswngs@gmail.com>, <ntfs3@lists.linux.dev>
CC: <xmei5@asu.edu>
References: <20260625120741.1618516-2-bestswngs@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260625120741.1618516-2-bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/25/26 14:07, Weiming Shi wrote:

> ntfs_read_mft() walks the attributes of an MFT record and, for each
> FILE_NAME attribute, compares the resident on-disk name with the name
> being looked up.  The only size check before the compare is
> rsize >= SIZEOF_ATTRIBUTE_FILENAME, which covers the fixed header up to
> and including name_len, but not the variable-length name that follows it.
>
> name_len comes straight from disk and is not validated against the
> resident data_size.  A crafted image can set name_len large while keeping
> data_size at the header size, so ntfs_cmp_names_cpu() reads name_len
> le16 characters past the end of the MFT record buffer:
>
>    BUG: KASAN: slab-out-of-bounds in ntfs_cmp_names_cpu (fs/ntfs3/upcase.c:84)
>    Read of size 2 at addr ffff888031879c00 by task a.out
>     ntfs_cmp_names_cpu (fs/ntfs3/upcase.c:84)
>     ntfs_iget5 (fs/ntfs3/inode.c:209)
>     dir_search_u (fs/ntfs3/dir.c:265)
>     ntfs_lookup (fs/ntfs3/namei.c:85)
>     __lookup_slow (fs/namei.c:1915)
>     lookup_slow (fs/namei.c:1932)
>     path_lookupat (fs/namei.c:2278)
>     vfs_statx (fs/stat.c)
>     vfs_fstatat (fs/stat.c)
>     __do_sys_newfstatat (fs/stat.c)
>
>    Allocated by task:
>     mi_init (fs/ntfs3/record.c)
>     ntfs_iget5 (fs/ntfs3/inode.c)
>     dir_search_u (fs/ntfs3/dir.c)
>     ntfs_lookup (fs/ntfs3/namei.c)
>
> Check that the name fits in the resident data before using it.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   fs/ntfs3/inode.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index c43101cc064d..c41c7231bb87 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -201,6 +201,11 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>   
>   		names += 1;
>   		fname = Add2Ptr(attr, roff);
> +
> +		/* Make sure the full name fits in the resident data. */
> +		if (rsize < fname_full_size(fname))
> +			goto out;
> +
>   		if (fname->type == FILE_NAME_DOS)
>   			goto next_attr;
>   

Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

