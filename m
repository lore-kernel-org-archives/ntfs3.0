Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D4D53F
	for <ntfs3@lists.linux.dev>; Tue, 17 Jan 2023 20:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813B8C433D2;
	Tue, 17 Jan 2023 20:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673987227;
	bh=r9S6GWZqtO98hixUabotCT9dNXxS/dfJjaNPyn+TipQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GFVJkIWukAG/4hoH/KvZs1ZQX+Zfk3eG87ciZxJV28q30TpQSOnHiD5UzNGHsM8vJ
	 dCgAxI2DS//fuL/AUEzCMojb+ZuOQx/AyJ4WD0uEfHlsnTKAhp82GPQToeqo0Omxqp
	 LcBIztjH6A14n+zmaxHTPGU5U1IoLJ3yT2qHMBevRez43e1IzTnTcDGEiwoo+dnrR9
	 nvZhL8zLdFf1SaJ3D/NfzC453F3ntM3qHj1D8c1L3AgelNFKyN41rxjT6u8Om2hnX9
	 fqzc0xW0Oa+Dexu8dXccc12ymY+8Ac2L8aIEARur4r6sleV+JhlFlVkgDK1bDX/rGa
	 XraAFntf7vGGA==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: Alon Zahavi <zahavi.alon@gmail.com>,
	almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tal Lossos <tallossos@gmail.com>,
	stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] ntfs3: Fix attr_punch_hole() null pointer derenference
Date: Tue, 17 Jan 2023 20:27:03 +0000
Message-Id: <20230117202703.116897-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815110712.36982-1-zahavi.alon@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Mon, 15 Aug 2022 14:07:12 +0300 Alon Zahavi <zahavi.alon@gmail.com> wrote:

> From: Alon Zahavi <zahavi.alon@gmail.com>
>
> The bug occours due to a misuse of `attr` variable instead of `attr_b`.
> `attr` is being initialized as NULL, then being derenfernced
> as `attr->res.data_size`.
>
> This bug causes a crash of the ntfs3 driver itself,
> If compiled directly to the kernel, it crashes the whole system.
>
> Signed-off-by: Alon Zahavi <zahavi.alon@gmail.com>
> Co-developed-by: Tal Lossos <tallossos@gmail.com>
> Signed-off-by: Tal Lossos <tallossos@gmail.com>

This patch has now merged in mainline as
6d5c9e79b726cc473d40e9cb60976dbe8e669624.  stable@, could you please merge this
in stable kernels?

Fixes: be71b5cba2e64 ("fs/ntfs3: Add attrib operations") # 5.14


Thanks,
SJ

> ---
>  fs/ntfs3/attrib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index e8c00dda42ad..4e74bc8f01ed 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1949,7 +1949,7 @@ int attr_punch_hole(struct ntfs_inode *ni, u64 vbo, u64 bytes, u32 *frame_size)
>               return -ENOENT;
>
>       if (!attr_b->non_res) {
> -             u32 data_size = le32_to_cpu(attr->res.data_size);
> +             u32 data_size = le32_to_cpu(attr_b->res.data_size);
>               u32 from, to;
>
>               if (vbo > data_size)
> --
> 2.25.1
>
>
