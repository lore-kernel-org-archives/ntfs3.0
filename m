Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36FA53B5
	for <ntfs3@lists.linux.dev>; Fri, 30 Sep 2022 15:48:54 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D8C2F1D0C;
	Fri, 30 Sep 2022 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1664552379;
	bh=nmkTwmXqesIfJ/1aB2wEXqGWGGTPZopYvCvssO9Ukfs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=S7gnv7wfXaJFNEyt69daODhWpnwW68UheFTmx9ma12s3VLI3GV/dcoQRkGZa4aFh3
	 V2pCf7js1NxFbQb4TU0inKAaV2tcfP3+iz3Ut1GcTtsPX/dOp6lomK6VKJoGRXWY0t
	 OAoXsLER+0DygScmmo2K7vliLGa+bx5rDYXXY+vg=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Sep 2022 18:41:54 +0300
Message-ID: <b3d04e78-c6d0-17ec-620f-5125e645dd00@paragon-software.com>
Date: Fri, 30 Sep 2022 18:41:53 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH} ntfs3: fix [df]mask display in /proc/mounts
Content-Language: en-US
To: =?UTF-8?Q?Marc_Aur=c3=a8le_La_France?= <tsi@tuyoix.net>,
	<ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <d3337d95-201c-43bd-3b37-4fd9e654d821@tuyoix.net>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <d3337d95-201c-43bd-3b37-4fd9e654d821@tuyoix.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 8/10/22 23:28, Marc Aurèle La France wrote:
> ntfs3's dmask and fmask mount options are 16-bit quantities but are displayed
> as 1-extended 32-bit values in /proc/mounts.  Fix this by circumventing
> integer promotion.
> 
> This change is not eligible for stable@.
> 
> Please Reply-To-All.
> 
> Thanks and have a great day.
> 
> Marc.
> 
> Signed-off-by: Marc Aurèle La France <tsi@tuyoix.net>
> 
> diff -aNpRruz -X /etc/diff.excludes linux-5.17.1/fs/ntfs3/super.c devel-5.17.1/fs/ntfs3/super.c
> --- linux-5.17.1/fs/ntfs3/super.c	2022-03-28 02:03:22.000000000 -0600
> +++ devel-5.17.1/fs/ntfs3/super.c	2022-03-28 07:14:10.799008309 -0600
> @@ -518,9 +518,9 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
>   	seq_printf(m, ",gid=%u",
>   		  from_kgid_munged(user_ns, opts->fs_gid));
>   	if (opts->fmask)
> -		seq_printf(m, ",fmask=%04o", ~opts->fs_fmask_inv);
> +		seq_printf(m, ",fmask=%04o", opts->fs_fmask_inv ^ 0xffff);
>   	if (opts->dmask)
> -		seq_printf(m, ",dmask=%04o", ~opts->fs_dmask_inv);
> +		seq_printf(m, ",dmask=%04o", opts->fs_dmask_inv ^ 0xffff);
>   	if (opts->nls)
>   		seq_printf(m, ",iocharset=%s", opts->nls->charset);
>   	else

Thanks for patch, applied!
