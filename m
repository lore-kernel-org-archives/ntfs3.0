Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819F1FA3
	for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 13:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3C9C433C8
	for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 13:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691672530;
	bh=fWjzqbfyq3dqLOBOt3ZEPD08+Rztcs8+WqFfJPdEYEE=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=KVljWqOSmgio0hTSn1uej4374CX8MDSt/O/tCgjlhsWVgnNaEgFiLUjkc1sldi/Bq
	 vZNpntkTioSt/xNG5VieQzLVex9KsclxtZLK0IfThtfs90UvPRz3Nsyro8wF+8smoD
	 lWu5m4gCjWky2VB/92CHijaBdHMTzKQVQ4Vxqth5V+ArmH6zNMzHTwFxyU0iDTXwnN
	 8IJsv2fvTEu4Q0+gZpZW+fDcYiVOf4yUpdrKcDYkE7lHtc10FFKMG7g18JatGYSZO/
	 lEmN9e13BUh6NEdLG2oSFkQf+TQ5jzQe5g0dMSwkP/AX4koskZk0EG52tyKRAcnyEj
	 CbZ4HbnWd1OsQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1bfce114ef9so814423fac.1
        for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 06:02:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YylP0heM007tjkTzRtK30P48z+CZ/y46KHro3UGFe6Hkm6j2HIS
	34Ci8qN4opvA4xMfLQIKa3aq1K0aZ0iXaR/tLsc=
X-Google-Smtp-Source: AGHT+IGqdLSse0MyFayFMx2um0Jvds45aRF5j4EF+uhq5gWdDfwz037RnQXgHT8V4WMer8tSRo8i0DRENFNLRBLWqKE=
X-Received: by 2002:a05:6870:70a6:b0:1b3:f1f7:999e with SMTP id
 v38-20020a05687070a600b001b3f1f7999emr2426297oae.45.1691672530035; Thu, 10
 Aug 2023 06:02:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:482:0:b0:4e8:f6ff:2aab with HTTP; Thu, 10 Aug 2023
 06:02:08 -0700 (PDT)
In-Reply-To: <20230809220545.1308228-11-hch@lst.de>
References: <20230809220545.1308228-1-hch@lst.de> <20230809220545.1308228-11-hch@lst.de>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 10 Aug 2023 22:02:08 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9TaQnWja4vrHqzjA2FSoGhkJThv1FvOBbmcoR8x2ybXw@mail.gmail.com>
Message-ID: <CAKYAXd9TaQnWja4vrHqzjA2FSoGhkJThv1FvOBbmcoR8x2ybXw@mail.gmail.com>
Subject: Re: [PATCH 10/13] exfat: free the sbi and iocharset in ->kill_sb
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

2023-08-10 7:05 GMT+09:00, Christoph Hellwig <hch@lst.de>:
> As a rule of thumb everything allocated to the fs_context and moved into
> the super_block should be freed by ->kill_sb so that the teardown
> handling doesn't need to be duplicated between the fill_super error
> path and put_super.  Implement an exfat-specific kill_sb method to do
> that and share the code with the mount contex free helper for the
> mount error handling case.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks!
