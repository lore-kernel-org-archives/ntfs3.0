Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E903FCF
	for <ntfs3@lists.linux.dev>; Thu, 16 Sep 2021 14:11:40 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 580FE822CD;
	Thu, 16 Sep 2021 17:11:32 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1631801492;
	bh=ItArpZzrHU+TglHzR+KVEuwuqP1JeFCPdBeCYCtmFrw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SdpBBxNU3uI0E5FxdAe++amGnylgKmxtotvaSKgAonoADGitwNNWy31f1mv91P3Qd
	 nkdEJ8rFyUNLzUgrcTfkAb3mZs/Tdk/BdrwLAP2IgqHpbVHL9CBgXxsDDOksw4+fUV
	 OJiCdp+dkKfto+JbQZs0lAVO77Acd0pXhTcXHv1o=
Received: from [192.168.211.100] (192.168.211.100) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 16 Sep 2021 17:11:32 +0300
Message-ID: <9ddd042f-cb8e-cb8a-bcaf-0ada1345c899@paragon-software.com>
Date: Thu, 16 Sep 2021 17:11:31 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/4] Fix error path and use kernel macros for
 min/max/calmp
Content-Language: en-US
To: Kari Argillander <kari.argillander@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>
References: <20210907142842.133181-1-kari.argillander@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210907142842.133181-1-kari.argillander@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.100]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 07.09.2021 17:28, Kari Argillander wrote:
> First fix some error path fault which I found during when I did this.
> It should go to 5.15.
> 
> For better code readability we can use kernel defined macros. Patch
> 2/4 also removes some dead code so that it would be more clear why
> do we do what we do in patch 3/4.
> 
> Series is tested with xfs-tests. No recression in my tests.
> 
> Kari Argillander (4):
>   fs/ntfs3: Fix ntfs_look_for_free_space() does only report -ENOSPC
>   fs/ntfs3: Remove always false condition check
>   fs/ntfs3: Use clamp/max macros instead of comparisons
>   fs/ntfs3: Use min/max macros instated of ternary operators
> 
>  fs/ntfs3/attrib.c |  3 ++-
>  fs/ntfs3/bitmap.c | 11 ++++----
>  fs/ntfs3/fsntfs.c | 68 +++++++++++++++++++++++------------------------
>  3 files changed, 41 insertions(+), 41 deletions(-)
> 
> 
> base-commit: 2e3a51b59ea26544303e168de8a0479915f09aa3
> 

Thanks for patches, applied!
