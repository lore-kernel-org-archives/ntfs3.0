Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4CD28FB
	for <ntfs3@lists.linux.dev>; Tue,  7 Jun 2022 15:58:56 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5FA5B255B;
	Tue,  7 Jun 2022 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1654617497;
	bh=gyeTbiR+uUhE29A+RGuh6i8rdvYUlUvUGCn1xr1k4cs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E9D9zVOYRdWoge0CnkXB7UdtfsA3h/RovelUsR30YXMLNOThcmNY5zWXcevyMIw/Q
	 3eCOD2nG2R+3aLqY8ZGWKCJx+9DiwE0RBwNrdkR2D3GjubNIVFOvyxH48FP0tMAON3
	 Uv+Gj6A4iEawWW7EDTGe4C0v6StfNftJ4zYbhw8s=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6C7481D0B;
	Tue,  7 Jun 2022 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1654617534;
	bh=gyeTbiR+uUhE29A+RGuh6i8rdvYUlUvUGCn1xr1k4cs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pqBlGqW6xS6n3BWqW/81M589K6ALyy85JH0UEAahiZxABf8Z0GwvzPioqJXHZnbLI
	 clBXZyjEH412XG3NHfnqLNEBpR0dpNBqqz6lBPwotKWopecHCbnZ1gcz+qxKBVFj/o
	 QvS+0J5c+2tkBgkcEFk+AsJMy1fcsjBc5QCxwimE=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 7 Jun 2022 18:58:54 +0300
Message-ID: <4f66239a-2209-6375-95ad-e8be0d28cf85@paragon-software.com>
Date: Tue, 7 Jun 2022 18:58:53 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] fs/ntfs3: Remove a useless test
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<kernel-janitors@vger.kernel.org>
References: <ade97ac1a1506fd322b008bdf8c24f0fb01b02a0.1640261993.git.christophe.jaillet@wanadoo.fr>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <ade97ac1a1506fd322b008bdf8c24f0fb01b02a0.1640261993.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 12/23/21 15:20, Christophe JAILLET wrote:
> 'new_free' has just been allocated by kmalloc() and is known to be not
> NULL.
> So this pointer can't be equal to a previous memory allocation, or there
> would be trouble in paradise.
> 
> Axe the always true test and make the code more readable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   fs/ntfs3/bitmap.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
> index aa184407520f..e3b5680fd516 100644
> --- a/fs/ntfs3/bitmap.c
> +++ b/fs/ntfs3/bitmap.c
> @@ -1333,9 +1333,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
>   		if (!new_free)
>   			return -ENOMEM;
>   
> -		if (new_free != wnd->free_bits)
> -			memcpy(new_free, wnd->free_bits,
> -			       wnd->nwnd * sizeof(short));
> +		memcpy(new_free, wnd->free_bits, wnd->nwnd * sizeof(short));
>   		memset(new_free + wnd->nwnd, 0,
>   		       (new_wnd - wnd->nwnd) * sizeof(short));
>   		kfree(wnd->free_bits);

Thanks for patch, applied!
