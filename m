Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138B5A7C
	for <ntfs3@lists.linux.dev>; Fri, 30 Sep 2022 16:34:37 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 16DF41D0C;
	Fri, 30 Sep 2022 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1664555540;
	bh=BfVyerR9nFKtgCb57f6dp6x16N8R+pt5FEJjtWJ7zOM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FY90ajQTFrWtfufXwrzal59mCVc1Hk4VlDv8dY2/uo058Xq927W88OgSU+sJ99kOV
	 2KgnZ1ubpVxL7uGyfjjeK3aBElkhaHg790RnjXcT8aUiR6Z+KaDtS7DxUbAxvpD/4B
	 tIrhNsBKnaKtNVgXr2UEKLGO2rsL81fgKVnhm4xs=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Sep 2022 19:34:34 +0300
Message-ID: <f901daa9-c6aa-a13f-1e33-2e30d0792029@paragon-software.com>
Date: Fri, 30 Sep 2022 19:34:34 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: fix negative shift size in
 true_sectors_per_clst()
Content-Language: en-US
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Andrew Morton
	<akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>
CC: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>, <ntfs3@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
References: <000000000000f8b5ef05dd25b963@google.com>
 <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 9/20/22 18:59, Tetsuo Handa wrote:
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
>   	if (boot->sectors_per_clusters <= 0x80)
>   		return boot->sectors_per_clusters;
>   	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
> -		return 1U << (0 - boot->sectors_per_clusters);
> +		return 1U << (0 - (s8) boot->sectors_per_clusters);
>   	return -EINVAL;
>   }
>   

Hello
Thanks for patch, but there was already a similar patch by Shigeru Yoshida,
so I chose it.
Sorry about that, thanks again for your work.
