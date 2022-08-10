Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753962CA7
	for <ntfs3@lists.linux.dev>; Wed, 10 Aug 2022 16:22:59 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D97111FA5;
	Wed, 10 Aug 2022 16:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1660148140;
	bh=TS+7ykxS+/RbIUIrMkBZtw+JsrC7IJjJ/ehW21gIdRc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Sni8K2LkW8vrm0wv1vYyOcqiGezy0wbf8/S+RUDwWLMacS8KaZWVYYPzdixnrgOlA
	 4t+etfNF7yD93OTw9nvuGnWKrirZ6H4zXaKfWEm5aDEvs0yFwSIacyP2cyY9BfVpnO
	 KL2hweUpBdBDtiv6EBkfeUiPNkVp7djmfQbXPk/s=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 10 Aug 2022 19:17:12 +0300
Message-ID: <8a3b479b-dedc-2a73-32fa-5c0440048b7d@paragon-software.com>
Date: Wed, 10 Aug 2022 19:17:11 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: Remove unused function wnd_bits
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Abaci Robot
	<abaci@linux.alibaba.com>
References: <20220721031841.24571-1-jiapeng.chong@linux.alibaba.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20220721031841.24571-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 7/21/22 06:18, Jiapeng Chong wrote:
> Since the function wnd_bits is defined but not called in any file, it is
> a useless function, and we delete it in view of the brevity of the code.
> 
> Remove some warnings found by running scripts/kernel-doc, which is
> caused by using 'make W=1'.
> 
> fs/ntfs3/bitmap.c:54:19: warning: unused function 'wnd_bits' [-Wunused-function].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   fs/ntfs3/bitmap.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
> index e3b5680fd516..177c5bc53373 100644
> --- a/fs/ntfs3/bitmap.c
> +++ b/fs/ntfs3/bitmap.c
> @@ -51,11 +51,6 @@ void ntfs3_exit_bitmap(void)
>   	kmem_cache_destroy(ntfs_enode_cachep);
>   }
>   
> -static inline u32 wnd_bits(const struct wnd_bitmap *wnd, size_t i)
> -{
> -	return i + 1 == wnd->nwnd ? wnd->bits_last : wnd->sb->s_blocksize * 8;
> -}
> -
>   /*
>    * wnd_scan
>    *

Applied, thanks!
