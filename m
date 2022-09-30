Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C35A66
	for <ntfs3@lists.linux.dev>; Fri, 30 Sep 2022 15:53:33 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id F26BF1D0C;
	Fri, 30 Sep 2022 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1664553076;
	bh=Kvp3r7tFqjR0yQUkLn4RKotejn0Af9kAQkVNGppOqCY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N4iYopAoQnsMun+YtbBED0m3e86Buan5J8XaR87ATlrwKL6QyIkZckpdajKohdm8J
	 hFOAnkaCDOsMEJ6I7W47RG0xckzZpVqAUONhaDVHcJ3cdZ6nwjNSWfC5nl6wOGbxtw
	 cAWFNwxX75QW1Kyuy+XnlOHI4tXA44JzrFdfQ8eY=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Sep 2022 18:53:30 +0300
Message-ID: <136fa55a-56d5-7d62-bbf0-602a357ab46d@paragon-software.com>
Date: Fri, 30 Sep 2022 18:53:30 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: Avoid UBSAN error on true_sectors_per_clst()
Content-Language: en-US
To: Shigeru Yoshida <syoshida@redhat.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Author : Randy
 Dunlap" <rdunlap@infradead.org>,
	<syzbot+35b87c668935bb55e666@syzkaller.appspotmail.com>
References: <20220823144625.1627736-1-syoshida@redhat.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20220823144625.1627736-1-syoshida@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 8/23/22 17:46, Shigeru Yoshida wrote:
> syzbot reported UBSAN error as below:
> 
> [   76.901829][ T6677] ================================================================================
> [   76.903908][ T6677] UBSAN: shift-out-of-bounds in fs/ntfs3/super.c:675:13
> [   76.905363][ T6677] shift exponent -247 is negative
> 
> This patch avoid this error.
> 
> Link: https://syzkaller.appspot.com/bug?id=b0299c09a14aababf0f1c862dd4ebc8ab9eb0179
> Fixes: a3b774342fa7 (fs/ntfs3: validate BOOT sectors_per_clusters)
> Cc: Author: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: syzbot+35b87c668935bb55e666@syzkaller.appspotmail.com
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
> ---
>   fs/ntfs3/super.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 47012c9bf505..adc4f73722b7 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -672,7 +672,7 @@ static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
>   	if (boot->sectors_per_clusters <= 0x80)
>   		return boot->sectors_per_clusters;
>   	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
> -		return 1U << (0 - boot->sectors_per_clusters);
> +		return 1U << -(s8)boot->sectors_per_clusters;
>   	return -EINVAL;
>   }
>   

Applied, thanks again for the patch!
