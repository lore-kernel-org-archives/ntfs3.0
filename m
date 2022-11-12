Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830CB29A8
	for <ntfs3@lists.linux.dev>; Sat, 12 Nov 2022 18:08:24 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 9DF031FE4;
	Sat, 12 Nov 2022 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1668276330;
	bh=SGzwK+cH+EVt3oRir84xwXS61miVeI5oBSv0PXC0YH8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ghmPLjKqw9HfsCdI6refUTvbZ/LRA502XaNQK0XMQEo1oZPLnklQlRZNUTdCppgCz
	 hXPkyoUvDmcEDwUr8zICP9eSOsWM76DVtMDVfNlxKFoN6Yc1Q/MtnJdroTdCTPZZIr
	 9mSM2ZQ257HgqAKcDO9a/t3KQDwh8YiFrnsDXJbM=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sat, 12 Nov 2022 21:08:22 +0300
Message-ID: <f5607633-e8e6-0467-7fe5-4883bd6988f4@paragon-software.com>
Date: Sat, 12 Nov 2022 21:08:21 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ntfs3: use __GFP_NOWARN allocation at wnd_init()
Content-Language: en-US
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
CC: syzbot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>, <ntfs3@lists.linux.dev>, Kari Argillander
	<kari.argillander@gmail.com>
References: <000000000000c2333105e9cc7b1c@google.com>
 <771ac308-6a55-77b4-8335-b68cde369aae@I-love.SAKURA.ne.jp>
 <c9dbfd5f-5dad-8432-e24f-74fbf88f709e@I-love.SAKURA.ne.jp>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <c9dbfd5f-5dad-8432-e24f-74fbf88f709e@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 10/2/22 17:39, Tetsuo Handa wrote:
> syzbot is reporting too large allocation at wnd_init() [1], for a crafted
> filesystem can become wnd->nwnd close to UINT_MAX. Add __GFP_NOWARN in
> order to avoid too large allocation warning, than exhausting memory by
> using kvcalloc().
> 
> Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963 [1]
> Reported-by: syzot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> Sorry, forgot to update subject line.
> 
>   fs/ntfs3/bitmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
> index 5d44ceac855b..90f3c4e84856 100644
> --- a/fs/ntfs3/bitmap.c
> +++ b/fs/ntfs3/bitmap.c
> @@ -661,7 +661,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
>   	if (!wnd->bits_last)
>   		wnd->bits_last = wbits;
>   
> -	wnd->free_bits = kcalloc(wnd->nwnd, sizeof(u16), GFP_NOFS);
> +	wnd->free_bits = kcalloc(wnd->nwnd, sizeof(u16), GFP_NOFS | __GFP_NOWARN);
>   	if (!wnd->free_bits)
>   		return -ENOMEM;
>   

Applied, thanks!
