Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56F7C
	for <ntfs3@lists.linux.dev>; Sat, 22 Jul 2023 00:07:03 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso4043295e87.3
        for <ntfs3@lists.linux.dev>; Fri, 21 Jul 2023 17:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689984421; x=1690589221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YuIgZ0kCdlWgwOipolMH4qwbkf4qo8GzSPfjGjifT9M=;
        b=B3Hme8dqaOXMsrPG2++TgbuKnjnbxyHIC+ORugqmopZwL1w8TJEChZufUpZKZR1PQq
         tOIy46NPX7iBctrWcZ1cseEMzbjLLKRJD3MY6izVCeb7CUBHq1JFi8n8XXsXOzHMMCXH
         sx8gn6dzNjDKuNgfW5k8AGYZX6oKrCw1CkMimOwfAoj412POis87U/94PR+7owwkLeOg
         k2z88VJTw5RViiSFqp+7NcIass1DiRMrYcSyqFU3tm8WBa7FbhJmZeTOr1v9kRzFhloX
         XXbnQ4Bs79CaLpJjTTc8drlWVkncvsKx3tk6AqeExXG1KFqazjwMLuz+PnhJtnhSUTe3
         nYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689984421; x=1690589221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuIgZ0kCdlWgwOipolMH4qwbkf4qo8GzSPfjGjifT9M=;
        b=Dxa8SA1sRcrS4bAECIaipEVGXm3D/jMUdq+JyTeD/r319Di5bN5Srf/0p188rZfy5S
         UdmaSQKMJL+Khw0BmB/N1IcDNyCFzaFRnYN0c9IU3S0DI2HQ1IsJmPd0gX5e+M/fbNCA
         nioDfNOkxoX198Yg4sUWhN9faHqL5rLYj2sXXeZY4qlw/vqSmdKESRUacIdHFsoP2Xay
         fsSLhC1Xe+t0IBlJDGncCL36b+GQyU/LrOG+5nzJ8j2sx3KuLdVfAfK7rn6orJ0bBz9c
         Zyc8IQb75Kc3UYAFFhnXkROnPJ0FiQsi3BTNiab/hZJktx74Q89hCk8A9RMCXBE3+xC3
         VA6A==
X-Gm-Message-State: ABy/qLYvSkx6TvJESgmKUyVuzgF3qN5RGSHoz6Apq8o3WBOJ6KXZ5/dl
	F5MvhOHT1VFF8ikWgw0bqB27gdmERXpa2O9+K7w=
X-Google-Smtp-Source: APBJJlEz6MOY64ghyriSbK69kEtmWUCnsBm/JE0LJAyd4kPsue89R5aANO77pQOMG5YK4KrXGWPnwyYh2eFGvZj7XYk=
X-Received: by 2002:a05:6512:3da7:b0:4fb:52a3:e809 with SMTP id
 k39-20020a0565123da700b004fb52a3e809mr3283162lfv.28.1689984421181; Fri, 21
 Jul 2023 17:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230713035512.4139457-1-willy@infradead.org> <20230713035512.4139457-2-willy@infradead.org>
In-Reply-To: <20230713035512.4139457-2-willy@infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Sat, 22 Jul 2023 02:06:50 +0200
Message-ID: <CAHpGcM+LQyXBC64EC=YJv4SQAT3HudKzsYyxpCuK=VFGr0XTZA@mail.gmail.com>
Subject: Re: [PATCH 1/7] highmem: Add memcpy_to_folio() and memcpy_from_folio()
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Sterba <dsterba@suse.com>, 
	linux-fsdevel@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	Theodore Tso <tytso@mit.edu>, Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Do., 13. Juli 2023 um 06:04 Uhr schrieb Matthew Wilcox (Oracle)
<willy@infradead.org>:
> These are the folio equivalent of memcpy_to_page() and memcpy_from_page().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/highmem.h | 44 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index 68da30625a6c..0280f57d4744 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -439,6 +439,50 @@ static inline void memzero_page(struct page *page, size_t offset, size_t len)
>         kunmap_local(addr);
>  }
>
> +static inline void memcpy_from_folio(char *to, struct folio *folio,
> +               size_t offset, size_t len)
> +{
> +       VM_BUG_ON(offset + len > folio_size(folio));
> +
> +       do {
> +               char *from = kmap_local_folio(folio, offset);
> +               size_t chunk = len;
> +
> +               if (folio_test_highmem(folio) &&
> +                   (chunk > (PAGE_SIZE - offset_in_page(offset))))
> +                       chunk = PAGE_SIZE - offset_in_page(offset);
> +               memcpy(to, from, len);

We want memcpy(to, from, chunk) here.

> +               kunmap_local(from);
> +
> +               from += chunk;
> +               offset += chunk;
> +               len -= chunk;
> +       } while (len > 0);
> +}
> +
> +static inline void memcpy_to_folio(struct folio *folio, size_t offset,
> +               const char *from, size_t len)
> +{
> +       VM_BUG_ON(offset + len > folio_size(folio));
> +
> +       do {
> +               char *to = kmap_local_folio(folio, offset);
> +               size_t chunk = len;
> +
> +               if (folio_test_highmem(folio) &&
> +                   (chunk > (PAGE_SIZE - offset_in_page(offset))))
> +                       chunk = PAGE_SIZE - offset_in_page(offset);
> +               memcpy(to, from, len);

And also here.

> +               kunmap_local(to);
> +
> +               from += chunk;
> +               offset += chunk;
> +               len -= chunk;
> +       } while (len > 0);
> +
> +       flush_dcache_folio(folio);
> +}
> +
>  /**
>   * memcpy_from_file_folio - Copy some bytes from a file folio.
>   * @to: The destination buffer.
> --
> 2.39.2
>

Thanks,
Andreas
