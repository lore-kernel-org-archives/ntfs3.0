Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFA23FCF
	for <ntfs3@lists.linux.dev>; Thu, 16 Sep 2021 14:07:46 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 580181F89;
	Thu, 16 Sep 2021 17:07:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1631801264;
	bh=JJnlxypnVRgMT5SLAXWcsf8aaPGV2nStrpNiAr0sGkU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YLBmdcL1dV24tFVR8JXIbtc6mbkPoHVMFPDYbAI4GBVaLSa7gmqb00QkRFXEL7mzE
	 2Aj5dyfjnOXjbdTu4x9AIWFqejjPp5U0tya9En65upGnVTzq0LHilla4E/WG9kGTK6
	 ewmFbJ68JIsecIMDpxJl9MwTybp+vhCD5/13Lg7U=
Received: from [192.168.211.100] (192.168.211.100) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 16 Sep 2021 17:07:43 +0300
Message-ID: <dc3fab5b-c70e-bf8c-eabf-7da1ca24830c@paragon-software.com>
Date: Thu, 16 Sep 2021 17:07:43 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/4] fs/ntfs3: Fix various styling issues
Content-Language: en-US
To: Kari Argillander <kari.argillander@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>
References: <20210907083441.3212-1-kari.argillander@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210907083441.3212-1-kari.argillander@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.100]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 07.09.2021 11:34, Kari Argillander wrote:
> Fix various checkpatch warnings. There will still be some but they
> will be addressed in different patch sets.
> 
> v2:
> 	- Remove + sign completly in 1/4 (Thanks Joe)
> 	- I dropped one patch as it addressed else were [1]. (Thanks Joe)
> 	- Drop newline in 3/4
> 
> [1]: lore.kernel.org/ntfs3/20210902154050.5075-1-kari.argillander@gmail.com
> 
> Kari Argillander (4):
>   fs/ntfs3: Remove '+' before constant in ni_insert_resident()
>   fs/ntfs3: Place Comparisons constant right side of the test
>   fs/ntfs3: Remove braces from single statment block
>   fs/ntfs3: Remove tabs before spaces from comment
> 
>  fs/ntfs3/frecord.c | 7 +++----
>  fs/ntfs3/lznt.c    | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> 
> base-commit: d3624466b56dd5b1886c1dff500525b544c19c83
> 

Hi, Kari, Joe!
Applied, thanks!
