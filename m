Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CED3FC5
	for <ntfs3@lists.linux.dev>; Mon, 13 Sep 2021 16:55:53 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id A62971D40;
	Mon, 13 Sep 2021 19:55:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1631552151;
	bh=5FGvKa6/SY7v3aG+gp0qf1IhE5WNXd9rsEH3ZXI2TfM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WKNmc8FsMpBC0NASRjIZvxdS9DzRFCkA6Z/h9fwLWBrJB9rlcvq/76GQEhwvlD+xN
	 eZZYciJwxLjJSgyL4/OKXzjwcNTk5ZVoP+BFZGgNeDJIX2eekQYrbw44E/wbVaWJ/A
	 rbs0trEHA+m3+xkA6z2pe7g2s2bN74capqaUm5jI=
Received: from [192.168.211.103] (192.168.211.103) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 13 Sep 2021 19:55:51 +0300
Message-ID: <d2636759-7809-e080-952a-b24123744eb1@paragon-software.com>
Date: Mon, 13 Sep 2021 19:55:50 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3] fs/ntfs3: Make entry binary search faster
Content-Language: en-US
To: Kari Argillander <kari.argillander@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>
References: <20210902154050.5075-1-kari.argillander@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210902154050.5075-1-kari.argillander@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.103]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 02.09.2021 18:40, Kari Argillander wrote:
> This series will make binary search faster with removing the need of
> allocations. We will only use stack memory. This will also make possible
> to remove linear search completely.
> 
> It is good also point out that full binary search not quite fit with
> entry search because entrys are not always same size. This why we first
> need linear table fill algorithm. My implementation try to use the fact
> that we should not linear fill full table before not doing any checking
> of the entrys. It is example 50/50 change if we are in middle that entry
> is in first half. So it is very inefficient to fill table after we are
> middle point.
> 
> We could also predict how many entrys there is and use this information,
> but I did not do that in this point. I'm more than happy to improve this
> more if someone has ideas.
> 
> I have tested this with xfstests and did not see regressions. Checkpatch
> and build tests for every patch have been done. I haven't done major
> bench marking with this one. Idea that this is better is just my two
> cent. Paragon has hopefully done bencmarking with old binary search
> compared to linear search? I'm quite certain that this will win old
> binary search algorithm because no need for allocations.
> 
> Thanks Joe for let me notice this improvement.
> 
> Kari Argillander (3):
>   fs/ntfs3: Limit binary search table size
>   fs/ntfs3: Make binary search to search smaller chunks in beginning
>   fs/ntfs3: Always use binary search with entry search
> 
>  fs/ntfs3/index.c | 153 ++++++++++++++---------------------------------
>  fs/ntfs3/ntfs.h  |   3 -
>  2 files changed, 45 insertions(+), 111 deletions(-)
> 
> 
> base-commit: d3624466b56dd5b1886c1dff500525b544c19c83
> 

Hi Joe, Kari!

Applied, thanks!
