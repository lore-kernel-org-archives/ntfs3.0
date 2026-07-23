Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE533343C
	for <ntfs3@lists.linux.dev>; Thu, 23 Jul 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784816792; cv=none; b=uGtEJ244nZJ7IDbfFFWvBKhAFdLMjMlMIUo4FceDpNFrq3ge+y8+ELc1FxbngKOwkVzBWJ0hq5ibfCE3/CA/wCpvERtV6tNsB5MyilyLK7JTEeJg/gyMn6WTgv+HOU+X0tz+HngZ1Kc0GJupVgcAWdifnXZYctkxYFysks6bXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784816792; c=relaxed/simple;
	bh=ksdfcj1wZSkb2tvvW37Xu5Z+vxck6FFmCHt378mx5ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kvvCMkSQ/4GalJQpsGMxgDyYlRdyF6jG2lqaST2e8Lfp6G077AOWUizyHXHp+DqafXZdnu9WX4ZO7PX8CDSgv1NhZO8BfZapJ2BmkYj4XHLVliIM9Brsi6XHwRDjTGSDg0Dl/DfO0DBPdZQOYrJOVBPbePV2GJwXi/Wx5dOu4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=LaKNptmJ; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="LaKNptmJ"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id CC1B11D3E;
	Thu, 23 Jul 2026 14:26:48 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=LaKNptmJ;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6982E21D8;
	Thu, 23 Jul 2026 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784816789;
	bh=PjZ0UZdqgtgvD3GqUeeJcTvUKLH6qnQ9d0TBa0/b3zA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=LaKNptmJYZ0A2+PpfiEer9VGn+1sCX7GbxCXn7MEyv3DhqOvAs2hO4+fExbLPKSFz
	 khGJ6VW4iAV42bUEH0Cn4ZEkzfGoW/70cIzBlHcj/3bA/ypOLob9nmgIfgKjZSInFU
	 veZnJgU8zgHpJYM8r5/NxRO/eiBAnxirquIlDOpg=
Received: from [192.168.95.128] (172.30.20.182) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 23 Jul 2026 17:26:28 +0300
Message-ID: <7905f141-1c1f-4c80-9ed6-37870f9c7a36@paragon-software.com>
Date: Thu, 23 Jul 2026 16:26:27 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: initialize err in attr_wof_frame_info
To: Ruoyu Wang <ruoyuw560@gmail.com>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20260617182227.965603-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260617182227.965603-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/17/26 20:22, Ruoyu Wang wrote:

> attr_wof_frame_info() may reuse a cached offsets folio. In that case the
> loop can fill the output offsets without calling attr_load_runs_range()
> or ntfs_read_run(), leaving err uninitialized before the common return
> path. Initialize err to 0 for the successful cached path.
>
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>   fs/ntfs3/attrib.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index e61c5bf7e27e4..c654b3cc1e91f 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1516,7 +1516,7 @@ int attr_wof_frame_info(struct ntfs_inode *ni, struct ATTRIB *attr,
>          u8 bytes_per_off;
>          char *addr;
>          struct folio *folio;
> -       int i, err;
> +       int i, err = 0;
>          __le32 *off32;
>          __le64 *off64;
>
> --
> 2.51.0
>
Hello,

Sorry for the delay.
The patch was applied, thank you.

Regards,
Konstantin

