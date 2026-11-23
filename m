Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434158;
	b=jQDdQhy0gX+4z46gNfYALjHOPNRonWh2BaJ4MOKeZF769bVIjqEirOURPScPQqEW3wwK
	 wZD5PDnydqcixBCGWh4FW5gnDQ8VqWwNoTZJIrn8o3GiHr0ehnAHHr7AN/PInBoJEgLYj
	 tcVfkOdBHeALgW4YYBViJi5FDEyOfeQd2MwULVRzjyv1AbEH+1kX8jmiCe53UOGlbFWqd
	 p9qbNwI74sz0GE7mN33JEueuUpBmLAwpDlBNWKrmx5esdR8mb1Xe2kXXw+RQDOLBp1glQ
	 awu4v/EwPb24ze2THIqDBsqmnOnwNYDKanhj6ymT6y4lH4eXhuIMHoZJqrDcKQN+DKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434158;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=NZMqczRigjyoaGLBH/JSUbBehwEcwQGEWQCoGSsOXy4=;
	b=S9hTjCZI2PgLdYKRhA0QiAm5dd/d41OJ04tCUY3iz3oDzdH3WV07iyrKuqTEVK5vI4Dd
	 L+h+B9/xpmWggBAX66P9IKS0pvCaIXFUKtrhKyVtfYlsZyufMgsBHo9wrJ58mrqmau3Dm
	 ti8mTg3cFdvGQ/OLILcscDPtkD22x18FHzhej5Yl2fJpukIPF6UvKrpm2VZarORDm8vWj
	 oHnrVmsqlbB32xyiCZLeQG+FkdoVzk0KdChrRqe9p4lW1jzJxAvtzohe0wq1mvcToFHYD
	 fsRmiAHI3gQqt7hSg624NGgMCbzFmAxlIIS9sWPBzXjAw4ahFbUyhl0ldV46hI4ISGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=ujOxiQ4l;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2991606A32E
	for <ntfs3@lists.linux.dev>; Mon, 23 Nov 2026 11:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2991606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=ujOxiQ4l
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5D4351D4D;
	Mon, 23 Nov 2026 11:43:18 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=ujOxiQ4l;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id D1AE8F7;
	Mon, 23 Nov 2026 11:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795434155;
	bh=NZMqczRigjyoaGLBH/JSUbBehwEcwQGEWQCoGSsOXy4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ujOxiQ4l470JdL71RNoWezdCaO1JVkTgozO7Zt7OScwQNFX2qpGM8qImwD6VYvZka
	 qHTYYbQA64T8ZUcVJQlwVQ1BNaS16DJQbww1ifYv6+mdksMPb1+NGPn5TIu3uRq3Wq
	 fL6lEQfEFcsSbeKXVYmCWToupbuz3m5BmG7E8LJk=
Received: from [192.168.95.128] (172.30.20.204) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 23 Nov 2026 14:42:34 +0300
Message-ID: <eae07bc6-aa16-4221-b709-c7b6706808f5@paragon-software.com>
Date: Mon, 23 Nov 2026 12:42:33 +0100
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix -Wmaybe-uninitialized warning in
 ntfs_ioctl_fitrim
To: huhai <15815827059@163.com>
CC: <ntfs3@lists.linux.dev>, huhai <huhai@kylinos.cn>, k2ci
	<kernel-bot@kylinos.cn>
References: <20260902013911.30680-1-15815827059@163.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260902013911.30680-1-15815827059@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 9/2/26 03:39, huhai wrote:

> From: huhai <huhai@kylinos.cn>
>
> With CONFIG_KASAN and CONFIG_WERROR enabled, GCC 13.2 reports:
>
>    CC      fs/ntfs3/file.o
> In file included from ./include/asm-generic/rwonce.h:26,
>                   from ./arch/arm64/include/asm/rwonce.h:81,
>                   from ./include/linux/compiler.h:369,
>                   from ./include/linux/array_size.h:5,
>                   from ./include/linux/kernel.h:16,
>                   from ./include/linux/backing-dev.h:12,
>                   from fs/ntfs3/file.c:10:
> In function ‘instrument_copy_from_user_before’,
>      inlined from ‘_inline_copy_from_user’ at ./include/linux/uaccess.h:184:2,
>      inlined from ‘copy_from_user’ at ./include/linux/uaccess.h:222:9,
>      inlined from ‘ntfs_ioctl_fitrim’ at fs/ntfs3/file.c:77:6,
>      inlined from ‘ntfs_ioctl’ at fs/ntfs3/file.c:242:10:
> ./include/linux/kasan-checks.h:38:27: error: ‘range’ may be used uninitialized [-Werror=maybe-uninitialized]
>     38 | #define kasan_check_write __kasan_check_write
> ./include/linux/instrumented.h:146:9: note: in expansion of macro ‘kasan_check_write’
>    146 |         kasan_check_write(to, n);
>        |         ^~~~~~~~~~~~~~~~~
> ./include/linux/kasan-checks.h: In function ‘ntfs_ioctl’:
> ./include/linux/kasan-checks.h:20:6: note: by argument 1 of type ‘const volatile void *’ to ‘__kasan_check_write’ declared here
>     20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
>        |      ^~~~~~~~~~~~~~~~~~~
> fs/ntfs3/file.c:65:29: note: ‘range’ declared here
>     65 |         struct fstrim_range range;
>        |                             ^~~~~
>
> copy_from_user() initializes the entire structure on success, but GCC fails
> to recognize this after the KASAN checks are inlined. Zero-initialize range
> to avoid the false positive.
>
> Assisted-by: Codex:gpt-5.6-sol
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: huhai <huhai@kylinos.cn>
> ---
>   fs/ntfs3/file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 2abf334bfa0c..df46d153fed0 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -62,7 +62,7 @@ static bool ntfs_should_use_dio(struct kiocb *iocb, struct iov_iter *iter)
>   static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
>   {
>          struct fstrim_range __user *user_range;
> -       struct fstrim_range range;
> +       struct fstrim_range range = {};
>          struct block_device *dev;
>          int err;
>
> --
> 2.40.1

Hello,

The patch is applied, thank you.

Regards,
Konstantin

