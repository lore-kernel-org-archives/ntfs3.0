Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B43FC8
	for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 17:44:27 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id x27so96221161lfu.5
        for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 10:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aZjQH7QMaSl5FVaqYf6XvxwPYWNnZykG+9zOEaj2ve8=;
        b=ikPva56GfBzLVz9pfiLjNMzDQwJQ13fOS6PD+07irzd9UwvL09+1AvafRN/kRz7tfr
         m07+bSlrSOOWl+czXXBnR9T5Is0yfpPCg5awpeF2pvKGIHRl7OWfsWtJ0XnGgLOB5Bqz
         EpUgBtWailjmwVvqs/f/Frx03W8BPM6UUfEtFmVhRvzWrI937buBDjfl3WzMBNJ64YBD
         cMdFjBYoad6Dq1SOLHGVS5Lo3L16+vYbHl1HlrLmwUM9+8VZA9lR7KTlZHBfY29VNs0c
         yUMxeLFPA2IlKhJLe9jOAN51Sw7C5LQUQfx7bS4hQ6NsHejJeyacccnlFVDoFc1EsdnW
         4fAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aZjQH7QMaSl5FVaqYf6XvxwPYWNnZykG+9zOEaj2ve8=;
        b=oplkC/qlOcy4dBgEjPmX8CDCoUXGVpg5dW55jTGZTTCU/QqHl69zS7YJwDiHRQvAMg
         Yaxz+DJAr/GvRsTBqAlC9DUBOlgwQg/HBhZcv7TS48ZmLMOzv8iftk4tQV2UnonhC25q
         9Xkrlf00Bdg9wnC4G5+iiWA6jgmMYt55/JDy1JwTm3t9LTpXSdABUBqksmJ3gM5Bw8zX
         y++z49hwNHZP23k40EIUt3WNpp21Y6gkWnQmYFI0WxIgH6zWhB4vPUz1yc4RK+N59fik
         WSj6sTXtxEIShMblcCkc+4+O5HUZoOooKqIe6h+DkI5V9VOh2PKb8kGXKBLVsBs8ASKc
         AgmQ==
X-Gm-Message-State: AOAM533q57T7eewCja1GMSGxDrRW0BLZNNiwQ3ALklvEvJ3M28dkeaEc
	13XPG67PCQT6vr3EWALryMU=
X-Google-Smtp-Source: ABdhPJx56tNegwxTEFCawBFhlyG+ObrsBC9oQQtRrYyvlPxrw7+usHAtHxuaL9eiYgL9xPgmdg2wvw==
X-Received: by 2002:ac2:57cb:: with SMTP id k11mr6558368lfo.70.1632851065421;
        Tue, 28 Sep 2021 10:44:25 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id l9sm1988435lfh.36.2021.09.28.10.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 10:44:25 -0700 (PDT)
Date: Tue, 28 Sep 2021 20:44:23 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] fs/ntfs3: Fix memory leak if fill_super failed
Message-ID: <20210928174423.z7a6chrjmmyezlsp@kari-VirtualBox>
References: <a7c2e6d3-68a1-25f7-232e-935ae9e5f6c8@paragon-software.com>
 <5ee2a090-1709-5ca0-1e78-8db1f3ded973@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ee2a090-1709-5ca0-1e78-8db1f3ded973@paragon-software.com>

On Tue, Sep 28, 2021 at 08:17:29PM +0300, Konstantin Komarov wrote:
> Restore fc->s_fs_info to free memory allocated in ntfs_init_fs_context.
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/super.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 800897777eb0..aff90f70e7bf 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1242,6 +1242,10 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>  	return 0;
>  out:
>  	iput(inode);
> +
> +	/* Restore fc->s_fs_info to free memory allocated in ntfs_init_fs_context. */
> +	fc->s_fs_info = sbi;
> +

Nack. fc->s_fs_info is already pointing to sbi. We null this just before
we exit so it is impossible to be anything else in failure case.

	fc->fs_private = NULL;
	fc->s_fs_info = NULL;

	return 0;
out:
	iput(inode);

>  	return err;
>  }
>  
> -- 
> 2.33.0
> 
> 
