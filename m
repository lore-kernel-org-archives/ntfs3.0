Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6912C82
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 16:54:02 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d9so1664553pfl.6
        for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+MbYp/9I6HwSPkAmORgtqKp7aAXKpROAHsI0KkahVSk=;
        b=ikEdVtNf9eRQss1RELdYd+gQGtRkJJNUyxABmsyhavxmXS/GWW1GmjaIFqcZC+V7d0
         jxPVuirO3PDa+xeNqLrVJO8s8KcCPrKVcuz5mnU+QJTWjswUytrClmIjf52ECv87VZwj
         IWYURypnyInULxZ6QO8cmc8sNxz7IQsLEMu78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+MbYp/9I6HwSPkAmORgtqKp7aAXKpROAHsI0KkahVSk=;
        b=0FkENUNyV96VtBlFlg4i+g3nNOrdChuiViz/CclXF0ymetDvuzd0PL2oVzOeMh7i2m
         Zyei6iMFp1j5jb3Gln0lDm3gTt+Oav957+4VY0joLIxbZizWTErC4IAFMqz4G3wkA5T7
         VElINQUGr5rKv7u9Pc9AdpE4+lxoAoaq379xj3zVgoPO5KdSgwQwGZU99Xz6v8bTnU0E
         frS3MZz2Lp06N+/lFjmfx8OpR0q6JCyzKPrbJJhxOB4h8Ki2Sqv9v+DlRoJBNT0hEo/H
         eEjQXjChi36sT/9nyHGrJoSZPQcbjD7kdAV3/5b06/v4gFWullo3whv6jbXnMtzHRjxQ
         U3Cw==
X-Gm-Message-State: AOAM533+mSXwfulrfHgpzhvC0ZOH5obkz6PuZiB0+JZpUSSAGPc6/RXB
	EfgMItDgpL5cmwj7gOsc1rCf1w==
X-Google-Smtp-Source: ABdhPJxRzD0WBfqSsRnsWWctoiC4ZL/68Vbzs2wYW5pL6AgqTKpTz7zCXFAYZWzBRrc637AgBAl43A==
X-Received: by 2002:a63:7f0e:: with SMTP id a14mr3656783pgd.390.1634316842164;
        Fri, 15 Oct 2021 09:54:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b8sm5387267pfi.103.2021.10.15.09.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:54:01 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:54:01 -0700
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
Subject: Re: [PATCH 18/30] nfs/blocklayout: use bdev_nr_bytes instead of open
 coding it
Message-ID: <202110150953.4A7CC49DC@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
 <20211015132643.1621913-19-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-19-hch@lst.de>

On Fri, Oct 15, 2021 at 03:26:31PM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
