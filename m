Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCB42C80
	for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+dhUoO5mtU5C6v7W8MZ+6HMQJZitoVQcF/qB+IF1Jr0=;
	b=Gy8LmpFXxAOAGU7wRpJYDntrcuVCM/U9IaryiMmxjzahqE+OOGqUfNitsw1fmHcJ6nz+w4
	cki2C0YmkAod280gOQQRXPn2SMs0uiYX+AZTdh58R7eU9uHOdlYpRG2yid3l6SN89qdQDQ
	W3IziguawlapZVvthny9kdx9gifJfKk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-S6j9MFQUMKqo3Fj0kUuTxw-1; Thu, 27 Jan 2022 12:09:38 -0500
X-MC-Unique: S6j9MFQUMKqo3Fj0kUuTxw-1
Received: by mail-qk1-f198.google.com with SMTP id a127-20020a37b185000000b004789e386256so2845891qkf.8
        for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 09:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+dhUoO5mtU5C6v7W8MZ+6HMQJZitoVQcF/qB+IF1Jr0=;
        b=tSG6kG0VD/6U1wtyohgmZE7o1SItCJW3nfMA0anZLb73UrcG8zuC8nAEv3VlndHSaO
         xkMyL+gw4aCz/VXVXM3/rX1yWGOx62/INL1HGL1HJXGpGNvBwtz+/NvB0uzQgeMF9BYS
         3vxeVN7/0r+3yzYqU+BJWPT+ra8YEnmQqNlm3Fn12wWH+Yeg376pv7tYfO0rjCWzVj5A
         iJ5hh/1D+rrdZArpX8IOjO/HH5tjezUQDGCelKeMSuNV00Zh06pu+YTwTWm8+pkKwP8w
         44tegveiqCRfA0tO/VxBAXHcmxpAmGx2SUn1jdfxecLS+hvknuhZg2EmadlSy9V2/mDm
         PipA==
X-Gm-Message-State: AOAM532rfhoDYosmXPyAEKt3B/+14VFIIN3QBQkSUeUa1e9sqv/CthF3
	X4ZsHG/pcdPORgiwerVmt33p1dL7qYNcoKDMhSojKsqP4zZAUWq7XpxIKnf5wTcqzJLwA6Sy15U
	PYPcLXylQ/3sNxQ==
X-Received: by 2002:a05:620a:1671:: with SMTP id d17mr3422677qko.683.1643303377468;
        Thu, 27 Jan 2022 09:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyie4bqi26jfgNY8Cjw+Pn5xYBOKV6NvnkIoBYF0/ZaizWWrCUD9ZTrfOlIA4zvFGF0i2/RFw==
X-Received: by 2002:a05:620a:1671:: with SMTP id d17mr3422658qko.683.1643303377286;
        Thu, 27 Jan 2022 09:09:37 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net. [68.160.176.52])
        by smtp.gmail.com with ESMTPSA id i8sm1628636qti.52.2022.01.27.09.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 09:09:36 -0800 (PST)
Date: Thu, 27 Jan 2022 12:09:36 -0500
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
Subject: Re: [PATCH 06/19] dm-crypt: remove clone_init
Message-ID: <YfLR0DPcDOYO65Hp@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-7-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-7-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Just open code it next to the bio allocations, which saves a few lines
> of code, prepares for future changes and allows to remove the duplicate
> bi_opf assignment for the bio_clone_fast case in kcryptd_io_read.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

