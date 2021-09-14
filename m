Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB53FC3
	for <ntfs3@lists.linux.dev>; Tue, 14 Sep 2021 20:53:48 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B6EE22CA;
	Tue, 14 Sep 2021 20:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B6EE22CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1631652821; bh=qNG+QjYpTqVVqPYQyVubIzCa4nYlNsW4VLhC6GdB9/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kvKW++o9akpZL2djRjp3Gh2X0Q4u5rv8gexPH5qwZ+kHS0rhS9cyHvaZvQDiT70o5
	 su8sgfPO1tcPn3+xLbg6w//gvKJgLRuIuzVwDwE57P8ZNd5Z0CnTQ4QvTy0+mwv7vN
	 qJnaLZICjkt/oYgWgfqZyigwWtUvDuFk1rvA6Cl/KwsOXV3PVHE2UqhI8GJP5D1IsQ
	 0cFk/HO56WWZ7Ks+pvMdtxfelJT0LTrs0ILqJNUBOyPZnCX3GWMvoJa/BSTVpI1Xdh
	 gpl9ffTbsIOWwY/+04dg6bFBm32QFOgWNP2asLYlKiw2Lzvn6PQbPC9bF5KZG5l89L
	 5DXshKbS/EzbA==
From: Jonathan Corbet <corbet@lwn.net>
To: Kari Argillander <kari.argillander@gmail.com>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Doc/fs/ntfs3: Fix rst format and make it cleaner
In-Reply-To: <20210909215753.34138-1-kari.argillander@gmail.com>
References: <20210909215753.34138-1-kari.argillander@gmail.com>
Date: Tue, 14 Sep 2021 14:53:41 -0600
Message-ID: <878rzyev56.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Kari Argillander <kari.argillander@gmail.com> writes:

> Current ntfs3 rst documentation is broken. I turn table to list table as
> this is current Linux documentation quide line. Simple table also did
> not quite work in our situation as we need to span rows together.
>
> It still look quite good as text so we did not loss anything. This will
> also make diffing quite bit more pleasure.
>
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---
> As this is pretty new to me and Konstantin I CC Jonathan because he is
> maintainer of documentation section. Do you want to get all
> documentation patches to you about ntfs3? This probably still goes
> through our tree? I ask because checkpatch will give your address also
> and it is not clear to me at least should I send these to you also.

Don't hesitate to CC people when in doubt - it's the kernel way :)

As for merging, documentation patches should go through whatever is the
best path.  Some subsystem maintainers want me to take them, others want
to handle them themselves.  It sounds like you're in the latter camp, so
I'll assume I don't need to apply this one; let me know if I've
misunderstood.

Thanks,

jon
