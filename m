Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB22C82
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 16:58:08 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i76so6722208pfe.13
        for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D4ik1Lt2fUu7rVQyF8CllyYkKQv1Uz9xzDA6N8pwEt0=;
        b=Wa0EACpWQ8IomuSobKiAJDXNIo9H/HSTHk3bhesUYAYHCsUAKK+Bjrkw13ye1TxZcf
         TuQa8RCxeCC8IVmjTZdx5iQYLmOHoIRbNEFY9PFnqm6LcjTjI/8URYdBHdOJCis8Hcgz
         7OkB4Z6yrhdMDXf4pPYVZP18IZMykjhm0o16E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D4ik1Lt2fUu7rVQyF8CllyYkKQv1Uz9xzDA6N8pwEt0=;
        b=b31p8QIwGCZvHcx6Srw+Vnu0A5dec0SddXPmMJ44IZM3gsBGbX+CtRQT2ooqvoP9Cg
         Y5LtUEZqxrgW9plWEve9waaRrv/ZlM8kyymIS7O5M1BFdWmNHkFaNNXBRmZNkgcq8ZQ/
         88XpqVkCVnfWWS2nZCilVc6W1xtXb6H/EA7dkMdRli9clc7EUxiwMAHBrMNmm1QE3iBM
         lbj+Mw1exFJj6DNvruw+IDbotbN2SbVsLVRo83Kn7WeMTWbdo2bh+aTfHEXXPpnJwQmT
         cVTrsDdrSmXxaVN1JUOV+RpLW6DLCX7CzawflzzJ/vE/qH85GpA5xNg360BA/vvL7OzN
         RRxQ==
X-Gm-Message-State: AOAM531njk9a4XEAkxHWrKlroMTz+WTu9CVfF87KP8jbYjAULP41gJQ6
	pE2wUg4OwMrI6l6ZLidMXhFrAg==
X-Google-Smtp-Source: ABdhPJwjs+d5iHomMRfB84u/9uN/BXfrv3rJikQOTGFeQP4iBMjOf7nvTwY+G4DJFOV8bNrfnz+CuA==
X-Received: by 2002:a63:4766:: with SMTP id w38mr10056849pgk.104.1634317087874;
        Fri, 15 Oct 2021 09:58:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e1sm5367341pgi.43.2021.10.15.09.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:58:07 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:58:06 -0700
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
Subject: Re: [PATCH 25/30] block: add a sb_bdev_nr_blocks helper
Message-ID: <202110150957.44EE74B5@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
 <20211015132643.1621913-26-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-26-hch@lst.de>

On Fri, Oct 15, 2021 at 03:26:38PM +0200, Christoph Hellwig wrote:
> Add a helper to return the size of sb->s_bdev in sb->s_blocksize_bits
> based unites.  Note that SECTOR_SHIFT has to be open coded due to
> include dependency issues for now, but I have a plan to sort that out
> eventually.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

You can adjust this changelog to remove the note about SECTOR_SHIFT
now. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
