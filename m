Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75B35A66
	for <ntfs3@lists.linux.dev>; Fri, 30 Sep 2022 15:46:34 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 80D5321F9;
	Fri, 30 Sep 2022 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1664552657;
	bh=X/t1uIpH9jIq4Mo3QtTlxP6qt7fIyXsOyRbsC/sLhZ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YSK6z5RyIdULr+aOMx5sLVsCW4rcjRNzftXQ2bb0CsDRTQwURYhjHi0mCgQFFNDXx
	 Ct/I/bHkFyhiv1WMtYxGZvE5jj5vZBNt8Z6aMihNWlG/tkLzfj+J6fMKcjgWgj7nd/
	 RxwntoYu1x1TWRxCpTpNUZrBnGimPocN4GyI0KZE=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 93E461E81;
	Fri, 30 Sep 2022 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1664552792;
	bh=X/t1uIpH9jIq4Mo3QtTlxP6qt7fIyXsOyRbsC/sLhZ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PeTfBbefxuia+8h1LNlZafQG34XWao9VuyTnlffs9I0K4c6AY0KJYMVuhui64EP0J
	 xCyC0nzEsGsqVYQfEpmVI5wO4j+oRGI6Nq/Y89gU9CqShhwIvV3ZdMo2MUV8TVhSCW
	 45AAbuEbJR5E9WsDkKcTQ86oAIAbwxZOKJyMIPGA=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Sep 2022 18:46:32 +0300
Message-ID: <fef6f085-b871-fd49-8d28-aaf1de7ad697@paragon-software.com>
Date: Fri, 30 Sep 2022 18:46:31 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: Use kmalloc_array for allocating multiple
 elements
Content-Language: en-US
To: Kenneth Lee <klee33@uw.edu>
CC: <ntfs3@lists.linux.dev>
References: <20220819055117.2408841-1-klee33@uw.edu>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20220819055117.2408841-1-klee33@uw.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 8/19/22 08:51, Kenneth Lee wrote:
> Prefer using kmalloc_array(a, b) over kmalloc(a * b) as this
> improves semantics since kmalloc is intended for allocating an
> array of memory.
> 
> Signed-off-by: Kenneth Lee <klee33@uw.edu>
> ---
>   fs/ntfs3/bitmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
> index 5d44ceac855b..1675c9a69788 100644
> --- a/fs/ntfs3/bitmap.c
> +++ b/fs/ntfs3/bitmap.c
> @@ -1324,7 +1324,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
>   		new_last = wbits;
>   
>   	if (new_wnd != wnd->nwnd) {
> -		new_free = kmalloc(new_wnd * sizeof(u16), GFP_NOFS);
> +		new_free = kmalloc_array(new_wnd, sizeof(u16), GFP_NOFS);
>   		if (!new_free)
>   			return -ENOMEM;
>   

Applied, thanks!
