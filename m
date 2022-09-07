Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F095CA6
	for <ntfs3@lists.linux.dev>; Wed,  7 Sep 2022 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662566516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjZOI71LK+daMvClxtX0jgkcMOcguy0S84WVN0vsB8g=;
	b=C+xXckQhnxyUk/bdx7bV9iHfVjhE9QFh7mXTkx+ijEByIxhTTwNA9G5g6N0nsZbJQhcDei
	3yPuQNlghBiLVTT3Ds45KXzRIjkyNvrxPKYIgV6nJE1aVdON0Kpl3IbE3E9nM7JbcAPgui
	rbzeTG3N7PLVcNDhp44VXR6STMRMssY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-yopR5F8UNhiPJ67EPxsK1A-1; Wed, 07 Sep 2022 12:01:53 -0400
X-MC-Unique: yopR5F8UNhiPJ67EPxsK1A-1
Received: by mail-pj1-f69.google.com with SMTP id ng1-20020a17090b1a8100b001f4f9f69d48so11388268pjb.4
        for <ntfs3@lists.linux.dev>; Wed, 07 Sep 2022 09:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date;
        bh=mjZOI71LK+daMvClxtX0jgkcMOcguy0S84WVN0vsB8g=;
        b=MHapJWwls2O7AmAXKzRYgIIh0uu2oxJfTuUsUye4ySSQjGm0Da3sM7TFHhCMIhd4zk
         XA94w+lRstuGWwgtwdei9vXxseB44Wfe2xgaR341QUpBljU5VnjoFA2dHH0GmTSPHzal
         DSu2Eig8HwtXhO+xa/d0MPoUtWZhVO8z2YMuxA2rSHwmL08lP8q11wt1SAqvzJq8DNfI
         7AUWKBcnB18ihkRjE+h2gqxfkEiQtXhvquU7kLwp2gjwFIMB6BCtUPTWvWHKzgInzker
         eCjAFU7dGgykbKBFmAmFZx6H1kZfu1ttwDd0MCvHECLzrdl5jeuzPF53Fba7m/60IEjK
         02ww==
X-Gm-Message-State: ACgBeo2uTa0fiytgU9u4pXW5RMgoMWUoVB6BYrJuQyglJ7voyOPixDCE
	nC7LPnVQT+ilmBlI22/w+USnWFIBJ6XNJLlI21QIjCC1Vrdkn4qIaLednAWC+xFjfxwsq2ccjwQ
	VBWVz2KL/PA+ejOM=
X-Received: by 2002:a17:902:6ac8:b0:175:44b5:5264 with SMTP id i8-20020a1709026ac800b0017544b55264mr4590957plt.19.1662566511556;
        Wed, 07 Sep 2022 09:01:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7AVvzae+3cjd7I1Cj1UQggFzwL2WKwIqHj3JQ/I/W3JFAE0SmOXU5px7BUFcsDQeafqZ8w7w==
X-Received: by 2002:a17:902:6ac8:b0:175:44b5:5264 with SMTP id i8-20020a1709026ac800b0017544b55264mr4590923plt.19.1662566511091;
        Wed, 07 Sep 2022 09:01:51 -0700 (PDT)
Received: from localhost ([240d:1a:c0d:9f00:4f2f:926a:23dd:8588])
        by smtp.gmail.com with ESMTPSA id v28-20020aa799dc000000b00536531536adsm12840105pfi.47.2022.09.07.09.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 09:01:50 -0700 (PDT)
Date: Thu, 08 Sep 2022 01:01:47 +0900 (JST)
Message-Id: <20220908.010147.1900257605879402574.syoshida@redhat.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 syoshida@redhat.com, rdunlap@infradead.org,
 syzbot+35b87c668935bb55e666@syzkaller.appspotmail.com
Subject: Re: [PATCH] fs/ntfs3: Avoid UBSAN error on true_sectors_per_clst()
From: Shigeru Yoshida <syoshida@redhat.com>
In-Reply-To: <20220823144625.1627736-1-syoshida@redhat.com>
References: <20220823144625.1627736-1-syoshida@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 28.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

ping?

On Tue, 23 Aug 2022 23:46:25 +0900, Shigeru Yoshida wrote:
> syzbot reported UBSAN error as below:
> 
> [   76.901829][ T6677] ================================================================================
> [   76.903908][ T6677] UBSAN: shift-out-of-bounds in fs/ntfs3/super.c:675:13
> [   76.905363][ T6677] shift exponent -247 is negative
> 
> This patch avoid this error.
> 
> Link: https://syzkaller.appspot.com/bug?id=b0299c09a14aababf0f1c862dd4ebc8ab9eb0179
> Fixes: a3b774342fa7 (fs/ntfs3: validate BOOT sectors_per_clusters)
> Cc: Author: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: syzbot+35b87c668935bb55e666@syzkaller.appspotmail.com
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
> ---
>  fs/ntfs3/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 47012c9bf505..adc4f73722b7 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -672,7 +672,7 @@ static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
>  	if (boot->sectors_per_clusters <= 0x80)
>  		return boot->sectors_per_clusters;
>  	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
> -		return 1U << (0 - boot->sectors_per_clusters);
> +		return 1U << -(s8)boot->sectors_per_clusters;
>  	return -EINVAL;
>  }
>  
> -- 
> 2.37.2
> 

