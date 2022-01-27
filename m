Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E129CA
	for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kAV23rTMcuty4CJFZ8o8ysOxnvRFj2DI1yB1mT746og=;
	b=QU+UARpVft1TH4Ycj9CFqX254OOzM8EVrl3ZtSl6Dm32JTefsVBZbhy/HPfFFespA+mbTR
	N92inGTPutQzpsDrmtG8FbGj739lvdaM7u5zo/Los13xUSThaZNJ09o4q0S2CfBUaczQ+J
	pX2caUc1wui+XiRXE/spsU6KvZ7L4xc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-dVfEiX-xPWqWF1oYOnaE0Q-1; Thu, 27 Jan 2022 12:08:59 -0500
X-MC-Unique: dVfEiX-xPWqWF1oYOnaE0Q-1
Received: by mail-qk1-f200.google.com with SMTP id u12-20020a05620a0c4c00b00475a9324977so2822937qki.13
        for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 09:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kAV23rTMcuty4CJFZ8o8ysOxnvRFj2DI1yB1mT746og=;
        b=TwRQnLE1LNjWDHV2AU9BjSmI41a+YtMCP7ksNGwLBj6nZ77x2ab3j6T82l6W+wk+2f
         M8F61qNefgN0Iocpd6Uk78mZY+5Nj+W6B46+ANVLH3HeUf0Mot4TaEn53pmFcK2Uo1rD
         haxXh3FvdCNGcNG/lm55DsEq1eA14dnF2TJK8RGtNwi59ls3QMqV7oQnvn35bOc7bJR2
         B6dxR9sY6HXKz3wrRu/0sSHzQByPn0D+QGMljb9RjEDY6obp4ivlXZp8HJyPhMoBkE7v
         TIljWzVhs9qKMxFJ/gAJRvmj82o4lc3HMbwgixou0WIJt4HJ6/ejcCAaxzytmD2Ahenk
         hEfw==
X-Gm-Message-State: AOAM5323lEvdQCtubAEzHwO3zwDZL1szGBK7Bb2V7KQG40GNx05h1+4h
	d3c6jQvCak86VX74Liy11hxZrlS7U3uI8WsUbbEYUxFWMiA1R5djPrBtJ9tRvhPJGLLHblKWdCt
	C5TIp1Lc4cTDGHQ==
X-Received: by 2002:ac8:44c9:: with SMTP id b9mr3555325qto.524.1643303338470;
        Thu, 27 Jan 2022 09:08:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDu0k2yM0Z7B8jNmnNXJFkDazruS7TZzFMNaHKbWmY0JBs9tIC0IfQuLij5Gmty6LtXXG+Yw==
X-Received: by 2002:ac8:44c9:: with SMTP id b9mr3555294qto.524.1643303338263;
        Thu, 27 Jan 2022 09:08:58 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net. [68.160.176.52])
        by smtp.gmail.com with ESMTPSA id a141sm1694826qkc.73.2022.01.27.09.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 09:08:57 -0800 (PST)
Date: Thu, 27 Jan 2022 12:08:56 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	xen-devel@lists.xenproject.org, drbd-dev@lists.linbit.com
Subject: Re: [PATCH 05/19] dm: bio_alloc can't fail if it is allowed to sleep
Message-ID: <YfLRqCMAhLH8xhDD@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-6-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-6-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Remove handling of NULL returns from sleeping bio_alloc calls given that
> those can't fail.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

