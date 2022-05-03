Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B717D2
	for <ntfs3@lists.linux.dev>; Tue,  3 May 2022 06:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E3AC385A9
	for <ntfs3@lists.linux.dev>; Tue,  3 May 2022 06:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651558512;
	bh=z7EijqrE3d5VjY35BMeH+t4YsXimOOv7VTpHoW6GE1w=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=O4+Ofb4+KNQ9xBTYKLlZblaINIZSCJz/cccgC+/Pig3cg67c5koYAAmE2DehhuFFp
	 H+gntwo3y9G3MarB+gexQ/LweM36nmLX5sSP6B8JSt55O/O56fsOhydK+KmRH0WTyT
	 z+dGmi+N43XKddpvKjdwiK4OmJer/sZ0In574kt2X8zTa4Eu63KOPiDAAIAkQa/s0R
	 cEEiDK4bKQyGiWO/IWU18xMRtdBKxPpqIJSN5APY4U2A/oJvIk7skNb8j6p4mTvRsl
	 22w3u43JiW0//9I0eYU7BiwlHOKxNewlu06d8NhHZ/tt12oloZmQUjSjkWaxNzjlXJ
	 qXgSPy+KOlOcw==
Received: by mail-wm1-f49.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso730236wma.0
        for <ntfs3@lists.linux.dev>; Mon, 02 May 2022 23:15:12 -0700 (PDT)
X-Gm-Message-State: AOAM533x33iedKunmvIlfOOyJOteaxn84M5foS45SqMdEufA97J2AhiT
	R+zgcM90XON5uUFeCgPWCyAmkWHCohtldX0FNbk=
X-Google-Smtp-Source: ABdhPJx6ppSJSx3kZIrU1OUbZLvsNKGTUGinUkr7ddRvDFpf/Md6SAgjSOobi33gFdRE1l3WTHPWDHicAjitZdXLkn8=
X-Received: by 2002:a05:600c:19d2:b0:393:efff:7c26 with SMTP id
 u18-20020a05600c19d200b00393efff7c26mr1980269wmq.9.1651558511066; Mon, 02 May
 2022 23:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a5d:4571:0:0:0:0:0 with HTTP; Mon, 2 May 2022 23:15:10 -0700 (PDT)
In-Reply-To: <20220429172556.3011843-20-willy@infradead.org>
References: <20220429172556.3011843-1-willy@infradead.org> <20220429172556.3011843-20-willy@infradead.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 3 May 2022 15:15:10 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-XzbDQEU3OCv82qF6a3Kvc-e2rqtJes06a4PVq41kDaA@mail.gmail.com>
Message-ID: <CAKYAXd-XzbDQEU3OCv82qF6a3Kvc-e2rqtJes06a4PVq41kDaA@mail.gmail.com>
Subject: Re: [PATCH 19/69] ntfs3: Call ntfs_write_begin() and ntfs_write_end() directly
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Kari Argillander <kari.argillander@stargateuniverse.net>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	Kari Argillander <kari.argillander@gmail.com>
Content-Type: text/plain; charset="UTF-8"

2022-04-30 2:25 GMT+09:00, Matthew Wilcox (Oracle) <willy@infradead.org>:
> There is only one kind of write_begin/write_end aops, so we don't need to
> look up which aop it is, just make ntfs_write_begin() and ntfs_write_end()
> available to this file and call them directly.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks.
