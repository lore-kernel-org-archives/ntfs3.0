Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82DD3FC5
	for <ntfs3@lists.linux.dev>; Mon, 13 Sep 2021 16:49:54 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 53B381D40;
	Mon, 13 Sep 2021 19:49:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1631551792;
	bh=QZCRnWQdSHor/Ryg4X8KggMjh3St8DKV+rc3R8trBA4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WqfsCsTqMjbyHD8t0J8VAvE9do5+UH2ejGWlKYi9q03mf70M5QRP9s123m/aA2dAO
	 UN/E983ZwBmfxYE9VQw6SlvS1yQ3BXv7VjrjERpShXtpYVLRLextEveYeLKlcmxZ3O
	 tQUG7SLzPK+x3bPj8Wd4qTkS05Coqo09XExv2RUM=
Received: from [192.168.211.103] (192.168.211.103) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 13 Sep 2021 19:49:51 +0300
Message-ID: <472ecb1c-578d-137a-9ec1-182642dac037@paragon-software.com>
Date: Mon, 13 Sep 2021 19:49:51 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH][next] fs/ntfs3: Remove redundant initialization of
 variable err
Content-Language: en-US
To: Colin King <colin.king@canonical.com>, <ntfs3@lists.linux.dev>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210903132458.14342-1-colin.king@canonical.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210903132458.14342-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.103]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 03.09.2021 16:24, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read, it
> is being updated later on. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/ntfs3/index.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 0daca9adc54c..b1175542d854 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1401,7 +1401,7 @@ int indx_find_raw(struct ntfs_index *indx, struct ntfs_inode *ni,
>  static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>  				CLST *vbn)
>  {
> -	int err = -ENOMEM;
> +	int err;
>  	struct ntfs_sb_info *sbi = ni->mi.sbi;
>  	struct ATTRIB *bitmap;
>  	struct ATTRIB *alloc;
> 

Hi Colin, thanks for the patch - applied it.

Best regards.
