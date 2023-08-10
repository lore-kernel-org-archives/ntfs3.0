Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EB1E1A4
	for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 13:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A09C433CA
	for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691672500;
	bh=L8v0r9doqZel/J2v7dujLyNos+92a27rf2u0qXW1J3s=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=buHrPopGvpa2PXQH2ihgGLWcE3tKpdzREf7fOef2SobndHttHp3mY7Zbo+pWmSjd2
	 KMTnXejW6RxtiMq2GmdVWrfMASOuIkFWsGWFylNvcdafpUac7PYBKCmkXvU2g62wb8
	 rM8BUTgNjphg88x1gT8UKtdTVA4JxWWEDKJN9wr7DBaWdsX/CszZDkjC6SQ/RTprXt
	 7kxeMpaYIOPZVbmujFI2QewnZtkhD6cYZAhyC/PFUYrPDYv/GpspXeiAQURb6Rzuwg
	 cbT6Ns2vdWIMXD6/0aKBc8h9zcEY7xvoVtSJHa2tZhrEbnYoLfZPZXTBqDOOpDDHWb
	 8+hyUXgwVQJwg==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1c0fa9dd74fso278976fac.3
        for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 06:01:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YxZ2xUEHpvNvW24t4g2Vqe/CiRKKLG945RYRf4PMYjqfa36WRMD
	gqf2D4jzlKzUxn8I+7P/ioy/QnZDnfRdek7Ingw=
X-Google-Smtp-Source: AGHT+IHGXX8j5FtK2vAGECuIYYeKRL8lP5vqMAg+4bwDrvliN//5tmNM3DXELlLFKcDyM4MBXQs+Ek4XnYl/S6pN5ZI=
X-Received: by 2002:a05:6870:239b:b0:1bf:ce5b:436 with SMTP id
 e27-20020a056870239b00b001bfce5b0436mr2584340oap.58.1691672499477; Thu, 10
 Aug 2023 06:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:482:0:b0:4e8:f6ff:2aab with HTTP; Thu, 10 Aug 2023
 06:01:38 -0700 (PDT)
In-Reply-To: <20230809220545.1308228-10-hch@lst.de>
References: <20230809220545.1308228-1-hch@lst.de> <20230809220545.1308228-10-hch@lst.de>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 10 Aug 2023 22:01:38 +0900
X-Gmail-Original-Message-ID: <CAKYAXd80rJ6v4=b-=i4XUi_0d9JNqEothmh3614FSxPg1apitA@mail.gmail.com>
Message-ID: <CAKYAXd80rJ6v4=b-=i4XUi_0d9JNqEothmh3614FSxPg1apitA@mail.gmail.com>
Subject: Re: [PATCH 09/13] exfat: don't RCU-free the sbi
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

2023-08-10 7:05 GMT+09:00, Christoph Hellwig <hch@lst.de>:
> There are no RCU critical sections for accessing any information in the
> sbi, so drop the call_rcu indirection for freeing the sbi.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks!
