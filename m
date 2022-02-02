Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4E32F29
	for <ntfs3@lists.linux.dev>; Wed,  2 Feb 2022 14:51:38 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f8so18479013pgf.8
        for <ntfs3@lists.linux.dev>; Wed, 02 Feb 2022 06:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=86/HaWRp2y/SbuutjnhnFgYLOj+BcaVRE8VVajIjfRc=;
        b=R/anZ7UkMnqaF3CW4Ump0dqYVUYUgaS4M/yiDIxTx2Cjcq+Qyd6YocKBZ8mPdRpPW+
         17FNI88k1C/BmVXl825aLA0miu2S5PPr8PsT0fMqN4dVJU17+9S6pjmTH6QbSeNecx9r
         0xP8jPO9Nw198zDO00TZswt+Ah25ZHBq+6KVkMYCNAEWgsPPHMXcAtmG4VsW3F3UiWKJ
         rSIzxvJZQrspkqWsoTGnJsSlKKFTTNT/fSLrJ2tAT5TU1bpU2aG1AoRBu+acTX1dmWiy
         dtFz/L7xjwsZ+s+MvP2INbmL3Bpln/WoZpGWMhz5gWzjqWyuCyzkWYcHCGIQZ7JI1y6B
         ls9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=86/HaWRp2y/SbuutjnhnFgYLOj+BcaVRE8VVajIjfRc=;
        b=al3Ria4brVhC97kHyes4NR9jBddLEAIbgJro6KEXulT82b16Qz5J1o3tI8dUKvL+51
         m7wS15aaqTedHJe/kQe1p4QWaFwVTVJ9Vu+ewryiI0Dyro7asmllhHyL+T6b7l2DriW5
         dZNySM+Y1S19fC7m2mC0okvIYedDfNtQ5cbY3j2HsthousPvoq1jqfkI0hDz22Pkk4XE
         7nKL4xeCvogWayANwFo0pgW/VQgrW9XiQLIRH4h8ViZA3Legnz6jAgl0C6iXPzbYRhHh
         eJLXoVHNsuNT6Ja7skNCf9wJGEChTLXNoaW/+F/E/QNBt8i91syquLVktzsbDBMn9oEw
         zdHw==
X-Gm-Message-State: AOAM533leF+8CHzMCtpjgu4JNc4C9Yb/i73wNVA7hfpyAkruSv6zVqgs
	aM+Vd0N6uxDcC3jcbCAOcbD8o2UMnWWp7A==
X-Google-Smtp-Source: ABdhPJwHqMALF/wOLDrSj4nmDW1I8tHyhaX9IDucrRtcOQAvGP0sRohPCEugxsJxmQaoZ0g8bCyDQg==
X-Received: by 2002:a63:e206:: with SMTP id q6mr25071054pgh.165.1643813497682;
        Wed, 02 Feb 2022 06:51:37 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id 76sm28639747pge.93.2022.02.02.06.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 06:51:37 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>, Dan Carpenter <dan.carpenter@oracle.com>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20220128140922.GA29766@kili>
References: <20220128140922.GA29766@kili>
Subject: Re: [PATCH] fs/ntfs3: remove unnecessary NULL check
Message-Id: <164381349664.170858.13226820250070489302.b4-ty@kernel.dk>
Date: Wed, 02 Feb 2022 07:51:36 -0700
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 28 Jan 2022 17:09:22 +0300, Dan Carpenter wrote:
> This code triggers a Smatch warning:
> 
>     fs/ntfs3/fsntfs.c:1606 ntfs_bio_fill_1()
>     warn: variable dereferenced before check 'bio' (see line 1591)
> 
> The "bio" pointer cannot be NULL so there is no need to check.
> Originally there was more extensive NULL checking but it was removed
> because bio_alloc() will never fail if it is allowed to sleep.
> 
> [...]

Applied, thanks!

[1/1] fs/ntfs3: remove unnecessary NULL check
      commit: 365ab499153cdb2007d54e7e62bcbf2c67f7ab8f

Best regards,
-- 
Jens Axboe


