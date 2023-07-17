Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841888F7D
	for <ntfs3@lists.linux.dev>; Mon, 17 Jul 2023 13:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A494C433CA;
	Mon, 17 Jul 2023 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689601189;
	bh=Id+reBJyUs3EtIOjUfUwT0F59yUypbbEDsxmRcaul30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLdjO31gndkZ3v19ndUg216eD5L14WUmZZnJJLm0j+EZWQ8c7g+jAxtVsK4LQ2g5o
	 1g32669l/gwZS5qY+hzlMr+4cp86AfnNK7x5zka5VmssUwigW5y/t4OIdGg8o/Urjr
	 l2jVUQ5B3I9UMhUq5C3aGjubIycSRMnYhqUNI0to=
Date: Mon, 17 Jul 2023 15:39:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: almaz.alexandrovich@paragon-software.com, stable@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	van fantasy <g1042620637@gmail.com>
Subject: Re: [PATCH 1/1] fs/ntfs3: Check fields while reading
Message-ID: <2023071733-basically-snub-5570@gregkh>
References: <20230717125013.1246975-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717125013.1246975-1-lee@kernel.org>

On Mon, Jul 17, 2023 at 01:50:13PM +0100, Lee Jones wrote:
> commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b upstream.
> 
> Added new functions index_hdr_check and index_buf_check.
> Now we check all stuff for correctness while reading from disk.
> Also fixed bug with stale nfs data.
> 
> Reported-by: van fantasy <g1042620637@gmail.com>
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Fixes: 82cae269cfa95 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

What stable tree(s) is this for?

thanks,

greg k-h
