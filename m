Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC4415B0
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=a+pKMA5Wmt6suYkpR/CdbHZ8VbOsd6L4w35GQNhatsc=; b=z6jeQf6N+NJ+psvRThEfZWD+Cp
	4sYtusGWVcZ78K75gv/rItChvNs18J0nB7j3Y4ZBMt+9MPcmDLDmKwgmFU3mahL/6DlH5fsQ2Wlcu
	XZ2yhZb/qh+LDNurAtKB7ZahqRms7I68A2bcYpvhkuIfoy7oO5RhNiCFfx8IEtPnPtwCWRD3ixocw
	5dOBt9cOJyn6cyMiNI4loqZZd1LvfXLFF60fTavOkH6fozcUWnQ2lHjOygat63xYWHfIlxe811E46
	q22iad/smddIVH8nQzmWL2zhCwyopEo4P0WOS1w4BzM8SN3gWb3HgoFBrXLtfYbcFBjvWWhFSIfkf
	aywsadlg==;
Received: from [2601:1c2:d80:3110::a2e7]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obWiV-000nzm-Mr; Fri, 23 Sep 2022 00:38:55 +0000
Message-ID: <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org>
Date: Thu, 22 Sep 2022 17:38:53 -0700
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] fs/ntfs3: fix negative shift size in
 true_sectors_per_clst()
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Shigeru Yoshida <syoshida@redhat.com>
Cc: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, ntfs3@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <000000000000f8b5ef05dd25b963@google.com>
 <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/20/22 08:59, Tetsuo Handa wrote:
> syzbot is reporting shift-out-of-bounds in true_sectors_per_clst() [1], for
> commit a3b774342fa752a5 ("fs/ntfs3: validate BOOT sectors_per_clusters")
> did not address that (0 - boot->sectors_per_clusters) < 0 because "u8" was
> chosen for type of boot->sectors_per_clusters because 0x80 needs to be
> positive in order to support 64K clusters. Use "s8" cast in order to make
> sure that (0 - (s8) boot->sectors_per_clusters) > 0.
> 
> Link: https://syzkaller.appspot.com/bug?extid=1631f09646bc214d2e76 [1]
> Reported-by: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Tested-by: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
> Fixes: a3b774342fa752a5 ("fs/ntfs3: validate BOOT sectors_per_clusters")
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 47012c9bf505..c7ffd21fb255 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -672,7 +672,7 @@ static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
>  	if (boot->sectors_per_clusters <= 0x80)
>  		return boot->sectors_per_clusters;
>  	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
> -		return 1U << (0 - boot->sectors_per_clusters);
> +		return 1U << (0 - (s8) boot->sectors_per_clusters);
>  	return -EINVAL;
>  }
>  

I slightly prefer the earlier patch:

https://lore.kernel.org/all/20220823144625.1627736-1-syoshida@redhat.com/

but it appears that the NTFS3 maintainer is MIA again. :(

-- 
~Randy
