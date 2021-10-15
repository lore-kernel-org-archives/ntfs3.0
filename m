Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3BE2C82
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 16:56:04 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id g14so8902113pfm.1
        for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 09:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dBqAYLNOJEEerwqZkr8h1WW5rIZpnbVROvIlOTScyoI=;
        b=a7qtweAUbS8K+NvWs4UCJMddQ3rECf/7QZ6zgMst5BcQ7TbdTIW8B/A36zncKdA0GG
         8KMhkxj+OzPkhorCWgeiV72Q4Wcq28WkBpsAyjDJDIhvh57vqCJGOPQwvw9YxRM4d1BS
         rdcHafc3+6KUZpEfQohGLoX5kTVxG/qsPhu90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dBqAYLNOJEEerwqZkr8h1WW5rIZpnbVROvIlOTScyoI=;
        b=O8YCp29ztvvL0/xhyqlyK/iB/yzDKztOL+NZoInXCey8+IiBWvw4aPG8ug4S5RXu3e
         SjcZSJZ4iX0A8OfNjwR+qP1DOF0UZFGzM/7ynLp23uvTwDlzh3srOfT0fY51zHWLnLq0
         +HaypAJCWjOXdSbP34+jfiJ6FDUHLD5cOkGK7EH+nbrb4KOT2JLIwnGbHLHVoMTnT/Ex
         N0RitfB2khTrkWMspzPRyY19A/XX1VQlrSUGAGjtV+NrUEuavZhgDtSZWDhR+KmrtGgO
         es5ahOJJxSd0GfrYyepEl9y5UMjsOIsPWbyS9BsfZhxpZw6lO7t++ZBxGFVC5MpC/rxC
         NZsg==
X-Gm-Message-State: AOAM531Idt1lSrTjNSQ7Z/S821XsC6Gq5GGKGUfxZcbqq+7S5jzaZEdx
	PZz80xAqsaqlcQ10/+iaBwVZNw==
X-Google-Smtp-Source: ABdhPJwArKSP1GbQ25tbhNDvzZCNcxogaP2mPI5IH6CBqZA2sACP5s1J2IGQKikEyZ/PadmXHII8iA==
X-Received: by 2002:a63:1266:: with SMTP id 38mr9960371pgs.219.1634316964288;
        Fri, 15 Oct 2021 09:56:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m12sm5254518pjv.29.2021.10.15.09.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:56:04 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:56:03 -0700
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
Subject: Re: [PATCH 21/30] pstore/blk: use bdev_nr_bytes instead of open
 coding it
Message-ID: <202110150955.495735B@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
 <20211015132643.1621913-22-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-22-hch@lst.de>

On Fri, Oct 15, 2021 at 03:26:34PM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for the bdev_by_bytes() helper; this is more readable now. :)

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
