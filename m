Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D593D34A0
	for <ntfs3@lists.linux.dev>; Tue,  7 Apr 2026 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775582101; cv=none; b=s+z1gW6u71ckduEBDDh6Q9lipwwXMxfgus4rhi3mB8gJHmz1KFy6kFwmA+SQxK/2X2BBeZnIICFbU0ODw293ln/DE9AZHgJZCqHabM9MHZ8RnMI1EokUSgvGjfAnUIgSt3tC7QLkV9IGK/qvYCCjWKqX/SMFKJy2bxVlBeiTfuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775582101; c=relaxed/simple;
	bh=BB83qX9K4XyislNDUI7cXzVjds8WBIjIEp4VVdb9rgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=njduzL9rK4MatTn965TqTc9FgBmeP2LX4gikMbe5QVLCpzjW14vtzvoYijtBqEIS1h+FHKzIoYHkz01yFplAUAd6NM4WBKrLOnsHtmQTiFnI0p6Numf/2DOAVILFrbbwChZWwKv6ASkTLXYKvQWQDkx90KMV4SheqXBAsaAxsX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Cf8Y2SXu; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Cf8Y2SXu"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id E98D41D43;
	Tue,  7 Apr 2026 17:15:08 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Cf8Y2SXu;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id A6384213F;
	Tue,  7 Apr 2026 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1775582096;
	bh=n7IDM326IZDpukqALn/wyJdaOFkZ2Eey80fBH/J12y8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Cf8Y2SXu9/S/AfLQn4pDZM/XJFUwYLRJvvyEtdopz2iSs8M3fr3gbfWgleuA8veup
	 nQ5xgCBCdZyBwtOhYwrcVe7JG5CFhhU0lQCqOYx0LxM124EaE3JA6zTXR8mmeHJ/I/
	 /SngEZHhFE4FKrO/oyf3nT3Nt2T0+269S7eJbB3o=
Received: from [192.168.95.128] (172.30.20.204) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 7 Apr 2026 20:14:55 +0300
Message-ID: <fe332d91-fd72-4499-9997-94593aabe786@paragon-software.com>
Date: Tue, 7 Apr 2026 19:14:54 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: terminate the cached volume label after UTF-8
 conversion
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260327061955.46242-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260327061955.46242-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 3/27/26 07:19, Pengpeng Hou wrote:

> [You don't often get email from pengpeng@iscas.ac.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> ntfs_fill_super() loads the on-disk volume label with utf16s_to_utf8s()
> and stores the result in sbi->volume.label. The converted label is later
> exposed through ntfs3_label_show() using %s, but utf16s_to_utf8s() only
> returns the number of bytes written and does not add a trailing NUL.
>
> If the converted label fills the entire fixed buffer,
> ntfs3_label_show() can read past the end of sbi->volume.label while
> looking for a terminator.
>
> Terminate the cached label explicitly after a successful conversion and
> clamp the exact-full case to the last byte of the buffer.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   fs/ntfs3/super.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 174a7cb202a0..9ed485f9efba 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1339,8 +1339,13 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>                                        le32_to_cpu(attr->res.data_size) >> 1,
>                                        UTF16_LITTLE_ENDIAN, sbi->volume.label,
>                                        sizeof(sbi->volume.label));
> -               if (err < 0)
> +               if (err < 0) {
>                          sbi->volume.label[0] = 0;
> +               } else if (err >= sizeof(sbi->volume.label)) {
> +                       sbi->volume.label[sizeof(sbi->volume.label) - 1] = 0;
> +               } else {
> +                       sbi->volume.label[err] = 0;
> +               }
>          } else {
>                  /* Should we break mounting here? */
>                  //err = -EINVAL;
> --
> 2.50.1 (Apple Git-155)
>
Hello,

Applied, thanks for the patch.

Regards,
Konstantin

