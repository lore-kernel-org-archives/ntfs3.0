Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E04F55A8
	for <ntfs3@lists.linux.dev>; Wed, 16 Sep 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556969; cv=none; b=XN4T00RSq2HvhEmzBY4x2qRNUjNYCBWQ9+HtTCGRLhe5DgunSyo4mR0UlWSzvIdFTrIb1DxtKs/dyRRGEB/n/6FyzoEXqI/U0D/Rd0SiuH/rN7d1eYzOMa/STJAiokJuXm+0Rx7w13dg/hfL4dbRjsn2CW7w0rLMR9Wl/968LtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556969; c=relaxed/simple;
	bh=CXDNaQ4q3pAVmjG5kYN7kkPTRXFon4QPOH2TjFi5GC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=slGeeuA4PQZuYnQ71tgS9kSmC7fRZaLRhK5lt8PUPJ896Jvaw7cD10rMLInsDoFqbkhhSG8yHo3Yi6sttGq9AvrnhgM92HuDK4yRY07RXj+S8IUffor0SUpE0D2V1XRBsSxQGlapUtjSasi7NQT01JegogSleL5KbSzCJYjduAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=S5VsupJ0; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="S5VsupJ0"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id C38B91D42;
	Wed, 16 Sep 2026 11:10:01 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=S5VsupJ0;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 0633A21F5;
	Wed, 16 Sep 2026 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789556946;
	bh=BZ+LmVveHc4cy75Ioi9FehzwdIlyLwd0p7KK/3cT5JQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S5VsupJ0hPgGpZUvO9ASjdq0lGBWNYQo1mBp2gbP8fVjnqErk0lcoFBVIADxNbiRF
	 dSi4CMMhK9yJggnwudehH+E8KzkHpudAvdAeDlWr90QqiVdCsgF+4glygganaNqLpS
	 Ui0cUQG58PYlxBXhUT+Scz9dhvYEA+3o4FDbxHbQ=
Received: from [192.168.95.128] (172.30.20.192) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 16 Sep 2026 14:09:03 +0300
Message-ID: <d7d933d4-11ad-43db-88e8-659f4c98afc9@paragon-software.com>
Date: Wed, 16 Sep 2026 13:09:01 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: reject FS_IOC_SETFSLABEL on readonly mounts
To: Baolin Liu <liubaolin12138@163.com>, <ethan.ferguson@zetier.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Baolin Liu
	<liubaolin@kylinos.cn>
References: <20260630005955.1374688-1-liubaolin12138@163.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260630005955.1374688-1-liubaolin12138@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/30/26 02:59, Baolin Liu wrote:

> From: Baolin Liu <liubaolin@kylinos.cn>
>
> FS_IOC_SETFSLABEL does not check for readonly mounts and
> can report success without persisting the label change.
>
> Return -EROFS on readonly mounts.
>
> Fixes: 21dc07ac9c25 ("ntfs3: add FS_IOC_SETFSLABEL ioctl")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>   fs/ntfs3/file.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index b041639ab406..f43baa46ec5c 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -105,6 +105,9 @@ static int ntfs_ioctl_set_volume_label(struct ntfs_sb_info *sbi, u8 __user *buf)
>   	if (!capable(CAP_SYS_ADMIN))
>   		return -EPERM;
>   
> +	if (sb_rdonly(sbi->sb))
> +		return -EROFS;
> +
>   	if (copy_from_user(user, buf, FSLABEL_MAX))
>   		return -EFAULT;
>   

Hello,

Sorry for the delay.
Your patch was applied, thanks.

Regards,
Konstantin

