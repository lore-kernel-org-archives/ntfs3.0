Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9DB7E
	for <ntfs3@lists.linux.dev>; Mon,  5 Sep 2022 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662387015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/aM9Hz/CxTU/5IZIiOb0wSytjLDU1CYz4f/uZlzEYfY=;
	b=WXhE9tE+lWskXL7dnxRIFOx82M1hrtyWC1zMSjoHGv+JpsLFoAduU4XWYEOByeCoMYIC7/
	7XBDNz8gfqUeOXwJPLKEcM3HTA63IHoRDKgCWlxianshklmZW4oqlVRJIhc2w4xvaOWG/v
	scfBuFAyCrPa1mN5TgQrb6ClPeB9J3U=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-joczqCbxN6q0RnSnbNgKSg-1; Mon, 05 Sep 2022 10:10:14 -0400
X-MC-Unique: joczqCbxN6q0RnSnbNgKSg-1
Received: by mail-pl1-f199.google.com with SMTP id k3-20020a170902c40300b001743aafd6c6so6210788plk.20
        for <ntfs3@lists.linux.dev>; Mon, 05 Sep 2022 07:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/aM9Hz/CxTU/5IZIiOb0wSytjLDU1CYz4f/uZlzEYfY=;
        b=lWnkJ/ZdZHU4lUDehUalGPdoydl9XuMedxG+0lr2YOaco227SRIDbxmU9GGpsI8c3q
         LrxOsLUqCe5/MO2PEp6SUYpfUyic/6ckZBQC6wVYiQGPWHsKig90jcIa4Jde0FBK9lrx
         0N95615xNlEoIq9Eqvpy5b+Kfvl88WqPw4cybJ8MBBzRXrukpHVRKQy5ajH4wv7q1dQB
         8qJ6iZQosYvW8AgqneLydTZiPY2DRIMElDfRa/iqs8KRZLbmWcWELZbXpRRUlkXD7K6T
         r71f3+oTf/vGB8Hb4nPvVnStfP7bjB4n7J/1GjagVbJwR3Rze7IoCnFUPoERrcpjg28j
         j42Q==
X-Gm-Message-State: ACgBeo0dXA6U/kavmc2dO4WocC7/qzsILsHzW1POT0uHLekivruvFBM9
	kArsd/HpjHqjz1q/g77LtM/BE5BvXCLxoHwrZA3DLkrgfAZUlKZ18OilOJR0s2McU49c2ox+hlF
	3nHCK0Gb/fwl/rvBG7vB8hGodbwxa+ec=
X-Received: by 2002:a65:6e49:0:b0:429:cae6:aac6 with SMTP id be9-20020a656e49000000b00429cae6aac6mr41418490pgb.268.1662387013101;
        Mon, 05 Sep 2022 07:10:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Mbj0cnXfyvltZuZyI75OnAiCy5kv581MclsxMj6AKJtQBQIL0bE5MAfuVXEL2TcdEimwBiyT3tt6LHh8ASBA=
X-Received: by 2002:a65:6e49:0:b0:429:cae6:aac6 with SMTP id
 be9-20020a656e49000000b00429cae6aac6mr41418453pgb.268.1662387012811; Mon, 05
 Sep 2022 07:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220901133505.2510834-1-yi.zhang@huawei.com> <20220901133505.2510834-5-yi.zhang@huawei.com>
In-Reply-To: <20220901133505.2510834-5-yi.zhang@huawei.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 5 Sep 2022 16:10:01 +0200
Message-ID: <CAHc6FU4XqSxUr3CS8zxu=Fh_kHytJbzezim0ie_cxdioW5R=FA@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] gfs2: replace ll_rw_block()
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, 
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, 
	tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, 
	viro@zeniv.linux.org.uk, rpeterso@redhat.com, 
	almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, 
	hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 3:24 PM Zhang Yi <yi.zhang@huawei.com> wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that always submitting read IO if the buffer has been locked,
> so stop using it. We also switch to new bh_readahead() helper for the
> readahead path.
>
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> ---
>  fs/gfs2/meta_io.c | 7 ++-----
>  fs/gfs2/quota.c   | 8 ++------
>  2 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
> index 7e70e0ba5a6c..6ed728aae9a5 100644
> --- a/fs/gfs2/meta_io.c
> +++ b/fs/gfs2/meta_io.c
> @@ -525,8 +525,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
>
>         if (buffer_uptodate(first_bh))
>                 goto out;
> -       if (!buffer_locked(first_bh))
> -               ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &first_bh);
> +       bh_read_nowait(first_bh, REQ_META | REQ_PRIO);
>
>         dblock++;
>         extlen--;
> @@ -534,9 +533,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
>         while (extlen) {
>                 bh = gfs2_getbuf(gl, dblock, CREATE);
>
> -               if (!buffer_uptodate(bh) && !buffer_locked(bh))
> -                       ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
> -                                   REQ_PRIO, 1, &bh);
> +               bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
>                 brelse(bh);
>                 dblock++;
>                 extlen--;
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index f201eaf59d0d..1ed17226d9ed 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -745,12 +745,8 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
>                 }
>                 if (PageUptodate(page))
>                         set_buffer_uptodate(bh);
> -               if (!buffer_uptodate(bh)) {
> -                       ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
> -                       wait_on_buffer(bh);
> -                       if (!buffer_uptodate(bh))
> -                               goto unlock_out;
> -               }
> +               if (bh_read(bh, REQ_META | REQ_PRIO) < 0)
> +                       goto unlock_out;
>                 if (gfs2_is_jdata(ip))
>                         gfs2_trans_add_data(ip->i_gl, bh);
>                 else
> --
> 2.31.1
>

Thanks for this fix; looking good.

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Andreas

