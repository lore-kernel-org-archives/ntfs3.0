Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3742FB0
	for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 17:20:57 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id z2so42829652lft.1
        for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 10:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NiKTumcxK3zbWymWmeoCtw+XIrZL7iXfa8NnINXFFdQ=;
        b=ol1JWvVLZ6N+Ufee9ZVYYnNNvs7XXqEUhDOOvXHkv7+hFQkGLXjCf6rfhSI1tBS/WC
         sip5eEbObVm5bHwhY9m5n/Eol31AWyn6tomH3UPJ7E5mSCBTzwEXLReBtnSk/tB3AksE
         61zjtXOw15cF9HloLeFcHlpQjZf6akFytgf1u6yAvRjBFS/tWiFxf/rYON4YXZGkA0lf
         uoyYCS2AWCEm29pKHur1gBSN/qFSRnFjH5y//2wyogwc1WRwj7/YSQguxXzctKMw5ySn
         9BpPgNgeAbQ6jpMRczubQ+M/VJzBzfhB4W2P1PXQ+o1txQU8yr9m9oUzKObVh01akOKq
         5uyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NiKTumcxK3zbWymWmeoCtw+XIrZL7iXfa8NnINXFFdQ=;
        b=Fp25k+9N+1eU8tLRXDh56FkMg/6DUfDmPcbbw7JeLlE9WFoISJgfCBOhCcqhgJZQXh
         2cD8yOGp8IEWHQIW7eI9zLzBRIqLv0t/hC6FGXWFc3i/WW3nIvgXuLdP7rNABjYO3qd0
         iSb3F62mVWAzaJP2CUSbb1Iz2Zmv+kKJynob+6PfurD53fIta6Lw3Qmlj1PDo0xtzLkl
         o14im3eRzHZ7aPAIyOfdFpxjKi9OjPGW4PEzFRGsctQmFmS7U4/OWcxfJUc2g/ErR2Vh
         RLFVgbPkiJrf/7UcKYYikbVbzQiR8zmTFYTZWBfDxCw6XykXFgWs4VZjsI6C17UxytOk
         znJg==
X-Gm-Message-State: AOAM531QawbJdERk+pGyduvfFxy452GqZm94eff1VtYCIaUYegyEosWt
	oekNLwXpIrrDP0ZKtL6N47o=
X-Google-Smtp-Source: ABdhPJwXdFTAlZU2oO3/vJEy8drzCS98YkYbfTxSrfghuikebTK+KAENX4h+oWDHpXypuL3Nib/3vg==
X-Received: by 2002:a05:6512:38ab:: with SMTP id o11mr3324394lft.5.1629220855957;
        Tue, 17 Aug 2021 10:20:55 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id f10sm241444lfr.303.2021.08.17.10.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 10:20:55 -0700 (PDT)
Date: Tue, 17 Aug 2021 20:20:53 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Do not use driver own alloc wrappers
Message-ID: <20210817172053.6gyy3nhpc75pygod@kari-VirtualBox>
References: <20210817143848.245324-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817143848.245324-1-kari.argillander@gmail.com>

On Tue, Aug 17, 2021 at 05:38:48PM +0300, Kari Argillander wrote:
> Ntfs3 driver contains self made alloc wrappers. Problem with these
> wrappers is that we cannot take off example GFP_NOFS flag. It is not
> recomended use those in all places. Also if we change one driver
> specific wrapper to kernel wrapper then it would look really wierd.
> People should be most familiar with kernel wrappers so let's just use
> those ones.
> 
> Driver specific alloc wrapper might also confuse some static analyzing
> tools, but I do not have real world example.

Actually I do. checkpatch.pl will now give following warnings so
checkpatch was triggered with self made wrappers.

WARNING: Prefer kcalloc over kzalloc with multiply
#170: FILE: fs/ntfs3/bitmap.c:686:
+	wnd->free_bits = kzalloc(wnd->nwnd * sizeof(u16), GFP_NOFS);

WARNING: Prefer kmalloc_array over kmalloc with multiply
#179: FILE: fs/ntfs3/bitmap.c:1357:
+		new_free = kmalloc(new_wnd * sizeof(u16), GFP_NOFS);

WARNING: Prefer kcalloc over kzalloc with multiply
#284: FILE: fs/ntfs3/frecord.c:2053:
+	pages = kzalloc(pages_per_frame * sizeof(struct page *), GFP_NOFS);

WARNING: Prefer kcalloc over kzalloc with multiply
#302: FILE: fs/ntfs3/frecord.c:2136:
+	pages = kzalloc(pages_per_frame * sizeof(struct page *), GFP_NOFS);

WARNING: Prefer kmalloc_array over kmalloc with multiply
#1016: FILE: fs/ntfs3/index.c:684:
+	offs = kmalloc(sizeof(u16) * nslots, GFP_NOFS);

WARNING: Prefer kmalloc_array over kmalloc with multiply
#1025: FILE: fs/ntfs3/index.c:706:
+		ptr = kmalloc(sizeof(u16) * new_slots, GFP_NOFS);

> Following Coccinelle script was used to automate most of this patch:
> 
> virtual patch
> 
> @alloc depends on patch@
> expression x;
> expression y;
> @@
> (
> -	ntfs_malloc(x)
> +	kmalloc(x, GFP_NOFS)
> |
> -	ntfs_zalloc(x)
> +	kzalloc(x, GFP_NOFS)
> |
> -	ntfs_vmalloc(x)
> +	kvmalloc(x, GFP_NOFS)
> |
> -	ntfs_free(x)
> +	kfree(x)
> |
> -	ntfs_vfree(x)
> +	kvfree(x)
> |
> -	ntfs_memdup(x, y)
> +	kmemdup(x, y, GFP_NOFS)
> )
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---
> 
> Christoph also nack about these so I CC him.
 
