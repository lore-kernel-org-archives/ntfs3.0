Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890C322A15;
	Tue,  9 Dec 2025 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287435; cv=none; b=Cw+BRpFchLQFBlX1MaAi0sWeSMCSiC23TU3UeRxODt9AXRWTYCS5wAp2XfgFLCKDYtbJK1WzcGxK36QoSv+4u1Zlyoib+zCeWQJM8yfrfLfc3qMGu7LyxFn3gle8MK1yuSwY+r1yU+sP6+9nfOJI6kLB9Ys4E8try5AtKKLsGIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287435; c=relaxed/simple;
	bh=Tt2usFs4Ss9G6OOOd2Ne/9HCWyiLd1NF8uFTcP48+Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Lz3Ex0qdqlfzz/ChlFWHSrZsR99qriilLtkOJAtBSyfVa5CuORGMuq1V6tqiiBnIN526PR4+Kco48wiY9gBLe0HYvUgMTJaVwlOyY40OLUfWM0+WKxYyXWFpJZHFWWiF78Sen8f/W3ija9DaXIa0xJmxErgyGmINKsLHyE1FJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=M5sil/Y+; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="M5sil/Y+"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 9036F1D42;
	Tue,  9 Dec 2025 13:33:35 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=M5sil/Y+;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 825E62416;
	Tue,  9 Dec 2025 13:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1765287428;
	bh=Kg/y0TR40O+r3YmM+VHLe172F2fTNR+UXGuLnf0UfGk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M5sil/Y+wdQNwZmiAd7MN1s/GucT6IoYZxS2KcuFazNYsxJQzYX9OGLjInUob9xwI
	 cvKW005qR4zFfwW+ig9S9ArOFPvc5hBgrHG4OzlI3MDAi8UbpVg1Ks815f4IOUEcNg
	 7rzu+V2tiuYuHMhgJYEOnfrHSExA98HE4cIaSco4=
Received: from [192.168.95.128] (172.30.20.141) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 9 Dec 2025 16:37:07 +0300
Message-ID: <7b477b93-a521-4f87-9bee-e17505e46690@paragon-software.com>
Date: Tue, 9 Dec 2025 14:37:05 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: Initialize new folios before use
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<david.hunter.linux@gmail.com>, <skhan@linuxfoundation.org>,
	<khalid@kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
	<syzbot+08d8956768c96a2c52cf@syzkaller.appspotmail.com>
References: <20251126220251.856795-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251126220251.856795-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 11/26/25 23:02, Bartlomiej Kubik wrote:

> KMSAN reports an uninitialized value in longest_match_std(), invoked
> from ntfs_compress_write(). When new folios are allocated without being
> marked uptodate and ni_read_frame() is skipped because the caller expects
> the frame to be completely overwritten, some reserved folios may remain
> only partially filled, leaving the rest memory uninitialized.
>
> Fixes: 584f60ba22f7 ("ntfs3: Convert ntfs_get_frame_pages() to use a folio")
> Tested-by: syzbot+08d8956768c96a2c52cf@syzkaller.appspotmail.com
> Reported-by: syzbot+08d8956768c96a2c52cf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>   fs/ntfs3/file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 4c90ec2fa2ea..00df27876c50 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -930,7 +930,7 @@ static int ntfs_get_frame_pages(struct address_space *mapping, pgoff_t index,
>
>   		folio = __filemap_get_folio(mapping, index,
>   					    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
> -					    gfp_mask);
> +					    gfp_mask | __GFP_ZERO);
>   		if (IS_ERR(folio)) {
>   			while (npages--) {
>   				folio = page_folio(pages[npages]);
> --
> 2.39.5
>
Queued for the next merge window, thanks.

Regards,
Konstantin

