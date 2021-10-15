Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D552C82
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 16:51:57 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id o133so8843575pfg.7
        for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8gI6mB0v8/bvGUktJ4Ms64SCq44VzGlslt0/tVmUcu0=;
        b=QdjfyqDFD4soQMEMSOicdhBdVamKBaYeLFRjv2+GeJkhkobBQ1wXcffRbrMri+SgXS
         ho2ZSrthIeYBE7Wx2MPp5VyuPKs5uKhB2/hHDVUacoeny7NW+A6nzAebO0KCgT+nfajN
         4woprmqITLxBlJcOq6oS9FryrMRcuTjaoqcfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8gI6mB0v8/bvGUktJ4Ms64SCq44VzGlslt0/tVmUcu0=;
        b=ZwJm7qBP7kYQ3GqETovIKyLgQfzZ9U26/dz0uUqzgq8bdUfsmR9a4LSD9HetSaMxlH
         Aps63jWI5D6X9XHfiIQzKdBt5DI4a+eULngpztLFCpBZZqtGnRtRaLK7v8BFJuaWtseP
         BfjwAbuYBL4sKF+Sw7NSFCDg7lQ3oRL+BjWZ1tpm1SWIOxPfsDfENmRg0uuyT3UUaYUz
         Fyer7a7KB5onmL3PhZ5eVuq80ehUI3AQbUV6vg5WhWeSjiHcG1XxcvwUeVqvV449OIXs
         gbm3eZKZEQtrSPrf1XVjUF0wwYdu46kizY+ugmgToiCT/Mv//4hCls2Z162XgxZtF9Bg
         Z3xg==
X-Gm-Message-State: AOAM533PsfkaKp8eQL/nCDg+SiEbEDaD0X7v1dIkrdKUlrBGxVCKHyUU
	0Ry0eH48+5PKxkD3PQjPh7uuvQ==
X-Google-Smtp-Source: ABdhPJzqeoukQXK8ExXBqth3GcTvhtURMxE+sN7W7wsB5KXgmz+OQ2/XE0rohu9GSzNW6fPwLJfBIw==
X-Received: by 2002:a05:6a00:1a15:b0:44d:a80:a194 with SMTP id g21-20020a056a001a1500b0044d0a80a194mr12521866pfv.78.1634316717195;
        Fri, 15 Oct 2021 09:51:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w18sm5617464pfj.170.2021.10.15.09.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:51:56 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:51:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Theodore Ts'o <tytso@mit.edu>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Dave Kleikamp <shaggy@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH 13/30] cramfs: use bdev_nr_bytes instead of open coding it
Message-ID: <202110150951.94FEBC4C@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
 <20211015132643.1621913-14-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-14-hch@lst.de>

On Fri, Oct 15, 2021 at 03:26:26PM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
