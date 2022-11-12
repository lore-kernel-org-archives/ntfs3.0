Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2463C4
	for <ntfs3@lists.linux.dev>; Sat, 12 Nov 2022 18:18:08 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 470EA1FA3;
	Sat, 12 Nov 2022 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1668276914;
	bh=LBXEojUVbSkmPtK6kRYVLbqPDb+pgXVfC2bn8oUwaSI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=nvIsr8JfPmG7aN5TgzgHArDbL+5wSQ1IZbQAca+I0CeL1gXuqzulp7oxTAwA8FhRr
	 VifVawKLo1rD01w+Ow3titZFJwXCqkcYQe2Fma66cq4uWeEh7IInPiOHPobZtZk2if
	 Wu+FN+Nl/DCgOxTmDh5an4FPqbt1RsrWg2/Vdo6o=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sat, 12 Nov 2022 21:18:05 +0300
Message-ID: <7241fb97-c7f7-2136-e93a-b498bcedf5e4@paragon-software.com>
Date: Sat, 12 Nov 2022 21:18:05 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/5] fs/ntfs3: Fix and rename hidedotfiles mount option
Content-Language: en-US
To: Daniel Pinto <danielpinto52@gmail.com>, <ntfs3@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 10/10/22 14:27, Daniel Pinto wrote:
> Changes v1->v2:
> - Add documentation for hidedotfiles mount option.
> 
> The current implementation of the hidedotfiles has some problems, namely:
> - there is a bug where enabling it actually disables it and vice versa
> - it only works when creating files, not when moving or renaming them
> - it is not listed in the enabled options list by the mount command
> - its name differs from the equivalent hide_dot_files mount option
>    used by NTFS-3G, making it incompatible with it for no reason
> 
> This series of patches tries to fix those problems.
> 
> Daniel Pinto (5):
>    fs/ntfs3: fix hidedotfiles mount option by reversing behaviour
>    fs/ntfs3: make hidedotfiles mount option work when renaming files
>    fs/ntfs3: add hidedotfiles to the list of enabled mount options
>    fs/ntfs3: document the hidedotfiles mount option
>    fs/ntfs3: rename hidedotfiles mount option to hide_dot_files
> 
>   Documentation/filesystems/ntfs3.rst | 6 ++++++
>   fs/ntfs3/frecord.c                  | 9 +++++++++
>   fs/ntfs3/inode.c                    | 2 +-
>   fs/ntfs3/super.c                    | 6 ++++--
>   4 files changed, 20 insertions(+), 3 deletions(-)

Good catch with differences between NTFS-3G and ntfs3.
Applied, thanks!
