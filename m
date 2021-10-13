Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F092C80
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 09:31:15 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g10so7620972edj.1
        for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 02:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jSDv3nCwYvRWF60PFzYmVFtCqi6n+8kG/qLGRQcEwXY=;
        b=XDrKXspyEQaSQYdqJnWhS/O0wblIXJrWl9pE6svv7KjgrDGVXul7dxFR95SMikNbI8
         dPBwNGXnMZrq9ECfkN9qd8qudIplcKbKQ02+dvBybldEqKgGTDn4o+Q+1yZvLDbQTpxH
         j0F3JAFmKpiVLRpHTHEBPzaDyzHphlM3B0d+/j7Ro7xiITFiea8XjX1E/h70+j8E07xJ
         iueofrb4NiJyC6FBpvAD+REiiIZXBpKUegBHgRICkLNGzc50RGa+mMfC0qBppipcUZ0O
         0MOGnuc/w5sEpIO1qpW0KnLTEIw6dv//T71InSxwu/1xkmLMW6ESgvB/ttIEAHR+9lRU
         du6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jSDv3nCwYvRWF60PFzYmVFtCqi6n+8kG/qLGRQcEwXY=;
        b=FE/hTj9TGMZ+aPS9F+BD+hd21b/yTBmdDjKwxM/lV7WyzE/coUxdlztphnE4FpvgC1
         bf0WkPmanQNZA3ejmmwKq2thhuihyydKGyv66dcJ1iRZ+hhRWZqnEj5VKfmbZ3Thp3M+
         pkbBYkLi4+gF9kr4ri05tpEHXJzAvWknm71s8g6YnVOhg+f6ZYwG2pSSvRWLZSV4RvyF
         6fngadLia3ovBzP5KNjxWzT99KsIOk9ocaHv/IoUnRmOGUXtTQQkXh9SICdFbUHcbopW
         V48fUdo0gBTbCUPlCq54bJ8KKWcDvwFoBtWmuJNWXsvK1Q6UK5G0LbCgj1CiMTa5AKu5
         OeWA==
X-Gm-Message-State: AOAM533vkYiJUxtXb2uI8fpCTvA3oCjK1gBYwmT6F6HSOHYLG2E201r5
	7i/qbnU6W4/3G5weaVHz7Xw=
X-Google-Smtp-Source: ABdhPJzWnNPujm70ssX25zhSqx1K1lXHECTOGOjBrmNCExix4poiHSM5QToDrvQz8D7ttpAXJOx3mg==
X-Received: by 2002:a05:6402:51d0:: with SMTP id r16mr7954872edd.353.1634117473882;
        Wed, 13 Oct 2021 02:31:13 -0700 (PDT)
Received: from [192.168.178.40] (ipbcc061e7.dynamic.kabel-deutschland.de. [188.192.97.231])
        by smtp.gmail.com with ESMTPSA id p7sm7639013edr.6.2021.10.13.02.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 02:31:13 -0700 (PDT)
Subject: Re: [PATCH 07/29] target/iblock: use bdev_nr_sectors instead of open
 coding it
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, David Sterba <dsterba@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Theodore Ts'o <tytso@mit.edu>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Dave Kleikamp <shaggy@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Kees Cook <keescook@chromium.org>, Phillip Lougher
 <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, dm-devel@redhat.com, drbd-dev@lists.linbit.com,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
 reiserfs-devel@vger.kernel.org
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-8-hch@lst.de>
From: Bodo Stroesser <bostroesser@gmail.com>
Message-ID: <3babe7ca-cf08-fd19-6793-39f6d78bca12@gmail.com>
Date: Wed, 13 Oct 2021 11:31:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211013051042.1065752-8-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.21 07:10, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/target/target_core_iblock.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
> index 31df20abe141f..ab7f5678ebc44 100644
> --- a/drivers/target/target_core_iblock.c
> +++ b/drivers/target/target_core_iblock.c
> @@ -232,8 +232,9 @@ static unsigned long long iblock_emulate_read_cap_with_block_size(
>   	struct block_device *bd,
>   	struct request_queue *q)
>   {
> -	unsigned long long blocks_long = (div_u64(i_size_read(bd->bd_inode),
> -					bdev_logical_block_size(bd)) - 1);
> +	loff_t size = bdev_nr_sectors(bd) << SECTOR_SHIFT;
> +	unsigned long long blocks_long =
> +		div_u64(size, bdev_logical_block_size(bd)) - 1;
>   	u32 block_size = bdev_logical_block_size(bd);

To enhance readability, would it make sense to shift the new lines
behind "u32 block_size = ...", so block_size can be used in div_u64
instead of using bdev_logical_block_size twice?

>   
>   	if (block_size == dev->dev_attrib.block_size)
> 
