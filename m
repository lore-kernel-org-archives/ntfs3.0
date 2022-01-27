Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2252C80
	for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtKZnu3m4MJ1lsPgVyhgN06mFCH9uLK+At7c0q3e4j8=;
	b=LN8FAamK45sm6noJKUN6tg+JuKEjFXTHjCz0Gz3hQXd7xEnG8vCRHb6CYG8/0sito9KieR
	EoA3uFroRZoPvlL+SDdS4cbDbrpWlWUd6YK5HZdf/U3wzh4GlyqcSS/9tB/oQEndPVNawx
	37imUkamyk+Z/2GOH1G55UuYiAToeOc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-4kqTw12VNH-GpQEiYCfLdA-1; Thu, 27 Jan 2022 12:11:42 -0500
X-MC-Unique: 4kqTw12VNH-GpQEiYCfLdA-1
Received: by mail-qk1-f198.google.com with SMTP id c128-20020a37b386000000b0047f37e77660so2835290qkf.12
        for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 09:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xtKZnu3m4MJ1lsPgVyhgN06mFCH9uLK+At7c0q3e4j8=;
        b=7hf1K284U/ZMgkBSgwZvIAD7OEXr42t3tKn4wpoV4mVpiYhQtavK1rMXZopJN3Kw/t
         d1AyoYCxcvErG9MbkqZgbYGZmIXJMv1HNkCbXt52ZyzfR9vEDKrj2I4BRuBWA1NmmFEQ
         dIp8GXt4JUXEtfFuv1cfcY8QgQL7jf/aPKHrT/k9PdKoXp913QaxHr86gmIvhHqZeCG/
         lJtUYpBWwcec4GraJTy/ZjTD6lvDuI4Li5qlCdvAj4uy9RfjFxF2+QIO6iYD6jMuRaZo
         uoMjI+GHz2HE3ya4ZHVR6UgfVTka6bOoc2KAapDK3Syubf6xJQg9mo9W7N88+mn7LVnO
         uaqg==
X-Gm-Message-State: AOAM532DJS9H5pqlGD5D5PIFZlK19dVC1uf5PMpoJS9/yUaThfyXIAOS
	Ql7Xh9jFjInGGMneF2ISivJ8Tnj3hIKVpet5uZOX+11mHxo9mORDhKh9Qt+NTkuJ4fhKmbmEIqY
	sFYJZTZ4Dbk3/XA==
X-Received: by 2002:ad4:5968:: with SMTP id eq8mr3808176qvb.80.1643303501892;
        Thu, 27 Jan 2022 09:11:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztPCW/ls/HGsD9xe/WMaahh4UjrJsfEVpwqwRI5tHMnXcgyiZLuuvrhgvmY/MRUsNQeYYfvQ==
X-Received: by 2002:ad4:5968:: with SMTP id eq8mr3808154qvb.80.1643303501730;
        Thu, 27 Jan 2022 09:11:41 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net. [68.160.176.52])
        by smtp.gmail.com with ESMTPSA id w8sm119796qti.21.2022.01.27.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 09:11:41 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:40 -0500
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
Subject: Re: [PATCH 08/19] dm-thin: use blkdev_issue_flush instead of open
 coding it
Message-ID: <YfLSTPB7UUZKqQKL@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-9-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-9-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Use blkdev_issue_flush, which uses an on-stack bio instead of an
> opencoded version with a bio embedded into struct pool.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

