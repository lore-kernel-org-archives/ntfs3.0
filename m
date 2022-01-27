Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3981329CA
	for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hISkPgWXBvxaPJR1A6cjvL239jVaZB/M99kE10NpdT4=;
	b=QyqCVKyWSiES9SCLaMXf8dKnSzbA3wdnZHzdNs/NQ8lPgpAue6oAJDCru3Y9wssSLoTGP7
	JqYhvKTEU715KvDZkCG6Sl5A5fRUs8K7WytS45Ny4netI6qnPh5FnqHEkZvMnsTyXcjPpA
	s5irx73me7RFXW+R8tmgEkGlLI3ffpY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-yqyChwwANqWmy2slAS3B9A-1; Thu, 27 Jan 2022 12:11:08 -0500
X-MC-Unique: yqyChwwANqWmy2slAS3B9A-1
Received: by mail-qk1-f197.google.com with SMTP id c128-20020a37b386000000b0047f37e77660so2833691qkf.12
        for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 09:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hISkPgWXBvxaPJR1A6cjvL239jVaZB/M99kE10NpdT4=;
        b=18ymCV/imnfBkjmIoJFcpDiS1/LOny5VXLPd/OomyEzMmy9KFn9IyJja93pfDC8cRT
         bNhfOlhe4PrqwGdI4o3U269Puf4MpZpY0zxmUYhbpU1Uz5099DWaswfRV4rTJIn9MnmC
         NQKFnowKlqYhrJK8G89u0GrUPRri9Ohy1cGGBcXIbCwHr2vL5v2Q3GXZDTDvDCEvjBE9
         vT9o4s4xVdQxrotQNhd0d6prBzRN0MFxAHyrPlT2LQuO8lcnjHKBMVfYxLW9LH0wNoGY
         FCXa2VAN3NRZfaWHNht+wjQ/I34GQEn9+V4xri0ZHhIwkN5PzKarO5FXGTA1DiCz7DxF
         Cv7A==
X-Gm-Message-State: AOAM532ebqR4EBN5GorUngm+HWeEMD8iKD1OuKo7xgsv1pl3S7vrYdfr
	xLefD0IH/4nzVJHzXwGC+16EaScpGe7vn8Ih1MA9bqTNE+0x0s76jriXR3BcSw+DWBca7fwq+I5
	MDYSFcejbzydJeg==
X-Received: by 2002:a05:6214:c2a:: with SMTP id a10mr4419659qvd.42.1643303467585;
        Thu, 27 Jan 2022 09:11:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQanMj7Y00ur/yzuLmY8gwfKPDXJeoixdwOU4KzNAVApl7lAtazZ8/rD9LIFjZrTulwd1nlg==
X-Received: by 2002:a05:6214:c2a:: with SMTP id a10mr4419637qvd.42.1643303467335;
        Thu, 27 Jan 2022 09:11:07 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net. [68.160.176.52])
        by smtp.gmail.com with ESMTPSA id h6sm1661870qtx.43.2022.01.27.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 09:11:06 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:06 -0500
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
Subject: Re: [PATCH 07/19] dm-snap: use blkdev_issue_flush instead of open
 coding it
Message-ID: <YfLSKlF89y3Cbf+S@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-8-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-8-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Use blkdev_issue_flush, which uses an on-stack bio instead of an
> opencoded version with a bio embedded into struct dm_snapshot.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

