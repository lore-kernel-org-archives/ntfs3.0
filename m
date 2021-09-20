Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50772
	for <ntfs3@lists.linux.dev>; Mon, 20 Sep 2021 16:07:58 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 0C0B2808E5;
	Mon, 20 Sep 2021 19:07:45 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632154065;
	bh=LCc4A1W9PLfKmwUmn9LJPwFX/fEx6flwgoYMDiWnoYQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N496+tCQWBQnqCJOEHbxFYuiyFvZ2NIWQ+LD45VyqDQdzUnyLDhCNpB01au0JINYm
	 +zLcbxvtWi50W+Cttcf+NpDQ1vttaLrwpGtnCxSLZkXSOrDMXsuIQSE9y3IMb1/sYh
	 lchnebHvmXtUcfylc1tMuy4fxgrzdkGp/iC91hXo=
Received: from [192.168.211.150] (192.168.211.150) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 20 Sep 2021 19:07:44 +0300
Message-ID: <61328d8b-2298-f206-aa43-323587a8b082@paragon-software.com>
Date: Mon, 20 Sep 2021 19:07:44 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 00/11] fs/ntfs3: Refactor fill_super
Content-Language: en-US
To: Kari Argillander <kari.argillander@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Christian Brauner
	<christian.brauner@ubuntu.com>
References: <20210909180942.8634-1-kari.argillander@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210909180942.8634-1-kari.argillander@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.150]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 09.09.2021 21:09, Kari Argillander wrote:
> Two first ones are only ones that fix something. Everything else
> just take off dead code or make it little bit cleaner. They should
> be pretty trivial.
> 
> As promise to Christian, 10/11 makes one section cleaner as he
> wanted [1].
> 
> [1]: lore.kernel.org/ntfs3/20210824113217.ncuwc3zs452mdgec@wittgenstein
> 
> Kari Argillander (11):
>   fs/ntfs3: Fix wrong error message $Logfile -> $UpCase
>   fs/ntfs3: Change EINVAL to ENOMEM when d_make_root fails
>   fs/ntfs3: Remove impossible fault condition in fill_super
>   fs/ntfs3: Return straight without goto in fill_super
>   fs/ntfs3: Remove unnecessary variable loading in fill_super
>   fs/ntfs3: Use sb instead of sbi->sb in fill_super
>   fs/ntfs3: Remove tmp var is_ro in ntfs_fill_super
>   fs/ntfs3: Remove tmp pointer bd_inode in fill_super
>   fs/ntfs3: Remove tmp pointer upcase in fill_super
>   fs/ntfs3: Initialize pointer before use place in fill_super
>   fs/ntfs3: Initiliaze sb blocksize only in one place + refactor
> 
>  fs/ntfs3/super.c | 121 +++++++++++++----------------------------------
>  1 file changed, 33 insertions(+), 88 deletions(-)
> 
> 
> base-commit: 15b2ae776044ac52cddda8a3e6c9fecd15226b8c
> 

Thanks for work - applied!
