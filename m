Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8757D17FB
	for <ntfs3@lists.linux.dev>; Wed,  6 Apr 2022 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649235232; x=1680771232;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LFM3dJ4XtmmQmpjm/ADKwYliPf/iPacGMSt9/3x5IFU=;
  b=f6ypYCzlm+ondAQv6e7Lia42zEldWusAvcrQbzXpJTUj6PM/SqPFrQnA
   T+13wEy4zZW+YlLCacjTHFLiDTEvxW/JGtyeF1zga2qVgWvnmxMebMtpA
   AZSVo5RIhdp0S8UGumMYxbYDKkM6KecLwOB+4BMZQiN6eOg49XH2mnm7Z
   RrMpJF6p/W91urQSsJ2kyfQtdo5q8wZU3HoiHLoGO9tUAg61l6sqCCMjK
   4l7QeHeBV54qSrs09Mk1dJJnNfEgytmuRbj9TfKU/fj9DpJBT8E5Mi7nF
   4UcONl8tTum80EB9MvKZVxAQO0HV18/UQpDJnK+8VE8+RYbnpS28Y5J6G
   g==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; 
   d="scan'208";a="196092189"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 16:52:43 +0800
IronPort-SDR: TRsYsvR+diQ7e9de2UZXYvgitV93YzqDmSTqYSwKlhVBhU03vxvDY6XPZ6TaSqMdDVv9uWlSGk
 aQ78FTdG0RL8uG8lOhcY9v+xNUGewW76q+PsAHHLQTKLfxA2tvnIH3r2/VsX8v+gwRfquvRDnO
 utGUsgGeCiKY8+MF5oe9JkBB06ddxkavBhFArlzv2M/zA/tYEh8vGjD84GS5foveOTn0gAKQoH
 If2Zy48fkNplbj7xHSzqdMG0HvzIPHvrh6f2tRi8xle7LSX4V4YaZinfaZ5wR1mr+QQ/QBzKJk
 eQmB8XjhDK5a9AyI77arcKiH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Apr 2022 01:23:24 -0700
IronPort-SDR: zidiocLyHMsXwpTGppQTKym/XKJQUtkaMWNdDO1Q3628I3ZDg2P5frM68da/yY+BdJwJ57bsxb
 e5q2DCurLh4HpiMTzPSnWD3EnUjlyDVe3C2lR+McWX5m5rmToL/KwkbL9Y5QnE+dhQLvNaY5zK
 t7+trea1g9Cg5JyCHAm4uZQfZ0VsEcyYBXyxJRGdbFg7GO3NnC+cBOPo1mTip+sPArBM9x096I
 JlNtcf/bj6Hgbpy1RyOxHi17XXTldk8FUymqFKzFiMl0EK2v5PKhm7dNbuSZ7unDFEGCcpL63K
 7/w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Apr 2022 01:52:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYJDp2lbfz1SVp3
	for <ntfs3@lists.linux.dev>; Wed,  6 Apr 2022 01:52:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649235161; x=1651827162; bh=LFM3dJ4XtmmQmpjm/ADKwYliPf/iPacGMSt
	9/3x5IFU=; b=qvkCgjbtXOykeK3hzZNeB4nFZLJBLeVyzVQiFxPBd+c54HMRQrR
	r3mHxfVWNdkNw5DIJA4fgfkXPh93epK0mDoQ3kgu2fpFkbSa8brjeKFgTDNdjUXK
	QEdaChXXlXS0VTxT7h9gL19ju3gtHs6R6Mypq0Cc5OI+h1pEURz6XYf1UQ1mcqds
	uMy2QNMB1cQhY28LO46skbuCxOrF4i88P2mQlM7t3vtuiUBfVFmxO2ZMvku2/0fT
	GRED3B4iBwE6imVQ9DU7YD88eHs1K7YN6+E1hQRftlmDiNgCGpghEuxtQnop4vN/
	eOwwsoVyhIxEYaxD0ZFdcLlRFvL5b8ALceg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 08KxBiHsagMs for <ntfs3@lists.linux.dev>;
	Wed,  6 Apr 2022 01:52:41 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYJDg4WyPz1Rvlx;
	Wed,  6 Apr 2022 01:52:35 -0700 (PDT)
Message-ID: <ea3d14cb-00ea-8d7b-4615-9347fdd7aa27@opensource.wdc.com>
Date: Wed, 6 Apr 2022 17:52:34 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/27] block: add a bdev_max_zone_append_sectors helper
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-15-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220406060516.409838-15-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/22 15:05, Christoph Hellwig wrote:
> Add a helper to check the max supported sectors for zone append based on
> the block_device instead of having to poke into the block layer internal
> request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/target/zns.c | 3 +--
>   fs/zonefs/super.c         | 3 +--
>   include/linux/blkdev.h    | 6 ++++++
>   3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
> index e34718b095504..82b61acf7a72b 100644
> --- a/drivers/nvme/target/zns.c
> +++ b/drivers/nvme/target/zns.c
> @@ -34,8 +34,7 @@ static int validate_conv_zones_cb(struct blk_zone *z,
>   
>   bool nvmet_bdev_zns_enable(struct nvmet_ns *ns)
>   {
> -	struct request_queue *q = ns->bdev->bd_disk->queue;
> -	u8 zasl = nvmet_zasl(queue_max_zone_append_sectors(q));
> +	u8 zasl = nvmet_zasl(bdev_max_zone_append_sectors(ns->bdev));
>   	struct gendisk *bd_disk = ns->bdev->bd_disk;
>   	int ret;
>   
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 3614c7834007d..7a63807b736c4 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -678,13 +678,12 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
>   	struct inode *inode = file_inode(iocb->ki_filp);
>   	struct zonefs_inode_info *zi = ZONEFS_I(inode);
>   	struct block_device *bdev = inode->i_sb->s_bdev;
> -	unsigned int max;
> +	unsigned int max = bdev_max_zone_append_sectors(bdev);
>   	struct bio *bio;
>   	ssize_t size;
>   	int nr_pages;
>   	ssize_t ret;
>   
> -	max = queue_max_zone_append_sectors(bdev_get_queue(bdev));
>   	max = ALIGN_DOWN(max << SECTOR_SHIFT, inode->i_sb->s_blocksize);
>   	iov_iter_truncate(from, max);
>   
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index a433798c3343e..f8c50b77543eb 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1188,6 +1188,12 @@ static inline unsigned int queue_max_zone_append_sectors(const struct request_qu
>   	return min(l->max_zone_append_sectors, l->max_sectors);
>   }
>   
> +static inline unsigned int
> +bdev_max_zone_append_sectors(struct block_device *bdev)
> +{
> +	return queue_max_zone_append_sectors(bdev_get_queue(bdev));
> +}
> +
>   static inline unsigned queue_logical_block_size(const struct request_queue *q)
>   {
>   	int retval = 512;

Looks good.

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
