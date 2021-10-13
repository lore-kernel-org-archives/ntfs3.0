Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35F12C85
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 06:30:44 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id q19so1563956pfl.4
        for <ntfs3@lists.linux.dev>; Tue, 12 Oct 2021 23:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VuQ9K07zKhFVmW27yAURvZgXNg5Kde2VB7A9n6/jcRM=;
        b=UofdAPLwzqN9irjKYpz7rqdpJba6YSanghzltJ7hygDQHnFxjoYnCn4YD0xclCWyyn
         1QGVCjAoCfMyHBxT5bED+JODP9R8TqKO5BZ3Ypckfrxuser3a0TwMhxL4/T0VMAtKJpU
         VKx0vRkqgm8Bnukgx8yTpvFmvLGoFoDP/yYAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VuQ9K07zKhFVmW27yAURvZgXNg5Kde2VB7A9n6/jcRM=;
        b=ElE/mlklMbqOJ64KCTOJP4KMbFW3YJIC93ZVw7UoRy6prvv2F4FaSTMDRzkeKxrKtF
         lj8qvc5qFcLGox8Wm5qcTxB80Oe6lB47TA8uY2ngo821SuPWmDiIYB+pdh9TjOOHbaSJ
         jwhAkA3BGFNyf4/987d/LxLcVFb0n1q2yCK7NvVDkPKhD5GBvN/EkrcNGbDAwU3OwjYO
         cKIQacat8dopGPWdsJOlKjX0fSpCRTVV8O0u2gSlB4n/nkef9TESQpK2OOHRPWdUPLo4
         R250pXYDMRYlNEMXeDDeovYqsC1GSgwnbrj2+bB9ZBbWNN20J7iwCn7tjyaknVAlVRyr
         qndg==
X-Gm-Message-State: AOAM533G5wpT2hJejr+sNpTMUwjfnEoxfWuDBFRvNB80IpYDzFke4Jgh
	jlFyv5nlTItzm+c98o8sztgFeA==
X-Google-Smtp-Source: ABdhPJxi3MilTVqoy9Kf7ydXOCYXbOlyCyon1KO3ew5UZssKOax53PkSESvwHqWMi+XXw8wleT4Yrw==
X-Received: by 2002:a05:6a00:ccb:b0:44c:eb4b:f24e with SMTP id b11-20020a056a000ccb00b0044ceb4bf24emr25691167pfv.16.1634106644424;
        Tue, 12 Oct 2021 23:30:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z10sm12678073pfn.70.2021.10.12.23.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:30:44 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:30:43 -0700
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
Subject: Re: [PATCH 25/29] ext4: use sb_bdev_nr_blocks
Message-ID: <202110122330.6E549D2@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-26-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-26-hch@lst.de>

On Wed, Oct 13, 2021 at 07:10:38AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 0775950ee84e3..3dde8be5df490 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4468,7 +4468,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		goto cantfind_ext4;
>  
>  	/* check blocks count against device size */
> -	blocks_count = sb->s_bdev->bd_inode->i_size >> sb->s_blocksize_bits;
> +	blocks_count = sb_bdev_nr_blocks(sb);

Wait, my bad. Yes, this is fine. It's going through two helpers. :)

Reviewed-by: Kees Cook <keescook@chromium.org>


>  	if (blocks_count && ext4_blocks_count(es) > blocks_count) {
>  		ext4_msg(sb, KERN_WARNING, "bad geometry: block count %llu "
>  		       "exceeds size of device (%llu blocks)",
> -- 
> 2.30.2
> 

-- 
Kees Cook
