Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068432C85
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 06:34:10 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id k23so1455900pji.0
        for <ntfs3@lists.linux.dev>; Tue, 12 Oct 2021 23:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6VbHD8PBwfaj43ljVUZZGyMj52YEmx4jfqAsGhf6+JQ=;
        b=AvobKbPMrQUDEUEp6fPFubcGItxc/wnKkqnDSAjF2JOJIzD6GaHgOkeTfLVH2dVkY7
         athTU5gaBp9pQ5+vN8pGXUoM6NXB9m94GmbcWoYtzrCupD5haSLJb51jgUAYN2bie92y
         Cw/fWMm7nAHe57gHGr8VcvjTAn4+/uHsWTDDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6VbHD8PBwfaj43ljVUZZGyMj52YEmx4jfqAsGhf6+JQ=;
        b=W+2ldaBXwLuRRCKO2YiMMZqaqEkXUGVwwzjHHhuUr7HXhQG2j0U9gzoIvpEGVKE1hv
         Lu3S1HEBFZqxO5cDRF0SXQWEjHKWpHoN13d1dL5Jrs98ibNJHQ+J07O2d/XDyWKRZNOc
         IIwbtqvGpUszzpl8vXTcnCxhpLFrSKDxRseHng0lImi/L59E/oEYHLg35Fv1AVBWRoje
         PJ/WGLYrwIXckDdPilzLcp0M+61xDNkY3Ku6hjYwTtICcE/XW6XB9aevP4quVMe5ottx
         EwGlyHrn5l4W7ES4nGgWRleSrOscIHt4ORr5PWctI8O974Uy4Cle5w2oHaGF3pRN7iDE
         El4Q==
X-Gm-Message-State: AOAM530kqWmufc+daiomqTQGy/E7VxYvaCK/hBONs0251Zs/WgjSag8C
	J8SJ5v9PVSbJiE2DsgLd799mOQ==
X-Google-Smtp-Source: ABdhPJyCtmPDTqSGxs9iwHCnitZ1F86E6zXvgsm3yviJEZQtBzg0xs5Q4LZVn9iTvPOonDA6xdZ1cg==
X-Received: by 2002:a17:902:f683:b0:13f:2fbe:498f with SMTP id l3-20020a170902f68300b0013f2fbe498fmr18917273plg.17.1634106850602;
        Tue, 12 Oct 2021 23:34:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t3sm13004045pfb.100.2021.10.12.23.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:34:10 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:34:09 -0700
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
	linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	ntfs3@lists.linux.dev, reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH 29/29] udf: use sb_bdev_nr_blocks
Message-ID: <202110122334.7A3E933D@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-30-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-30-hch@lst.de>

On Wed, Oct 13, 2021 at 07:10:42AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
