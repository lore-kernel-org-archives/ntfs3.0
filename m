Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925572
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634143395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DvE9A+LL2XADoLsMv/QT6HGglilUC7cXAXtJNsfa8lA=;
	b=IIypTiFYhWCZbUSA7VEpUQlZe+SKXR1aCyCxIeoqcvY99VskuswRyMMy2b0K556uJIiCjv
	Ox6qgb6HttmrXI9seTaJDYkZUlW9UeyOf+kL7QD/bz8MJ74DIoTbmWfaHbeNmatD8nYYnh
	K+JHChfxdua7U/XCkmmnTUNapGNrs3s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-iC5x_SKgOcuJZ1_GyiV4bw-1; Wed, 13 Oct 2021 12:43:14 -0400
X-MC-Unique: iC5x_SKgOcuJZ1_GyiV4bw-1
Received: by mail-qt1-f200.google.com with SMTP id 12-20020aed208c000000b002a78b33ad97so2458424qtb.23
        for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DvE9A+LL2XADoLsMv/QT6HGglilUC7cXAXtJNsfa8lA=;
        b=gxbUPEQNeEPjoEnP4OrmyaOAUPwSIuRNR6wMo9JJJHSdxE5pHh7ZVqvuFJyheCIz6z
         OHKkyGZe/3Fcq0RYDIrcgMObC2ymJLsTWJQUn0tnyEQC6DsmyEPUHgIbV2BSEGwA3JfC
         CAoB1uT8wnoovreChmyPVukGAku0vPB6od6sb0S5ldnTm3HUQ4U1q5Bvb8WxfJLRQ+2J
         Llw5LfQMIm4j+SrxEOCB8PWBN5lqkEpaR0Ix3ZahY3JBNufX+rFHIBcbbKP1vKp0N2C+
         YWH8uFxq/hz+kqpr6ZjBZvXYSEYzWWgR0rUDvQ+24pkVYz5QLGYzE+JKz+s6WnE00EV7
         6j1A==
X-Gm-Message-State: AOAM531dJqR5IbClPFKAB6OV8gV229ZlVU8/FH7PEmijazwOYCQrLXBf
	IipUR44Hr1I2IDkwNTJ8ynNeQ3tWA+ouKSNoJIQul9NRTymcldoc4NqfKLvxl7rUdrSJY3WuK7d
	3X4exRy5iglBIgw==
X-Received: by 2002:ac8:7d02:: with SMTP id g2mr450218qtb.66.1634143393836;
        Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4uQGBl82DdkygPL4oygkwPDtljuRYBV8+ESqW4tKnOahM7pZ+SYljUTQ3BKpa4FdVi33PjA==
X-Received: by 2002:ac8:7d02:: with SMTP id g2mr450159qtb.66.1634143393507;
        Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
Received: from localhost ([45.130.83.141])
        by smtp.gmail.com with ESMTPSA id q14sm77870qtl.73.2021.10.13.09.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 12:43:12 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Theodore Ts'o <tytso@mit.edu>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Kees Cook <keescook@chromium.org>,
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
Subject: Re: [PATCH 03/29] dm: use bdev_nr_sectors instead of open coding it
Message-ID: <YWcMoCZxfpUzKZQ+@redhat.com>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-4-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211013051042.1065752-4-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 13 2021 at  1:10P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

