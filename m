Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C05E38887C
	for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234277; cv=pass; b=sdHPL9P3bI6+tlhXK4MXSBVH7NPGZlWs8syotkuDiMN9z1/lQ3Yro3OUmMEQlgal6GZjs+nvRBfnPKrPUaEqQHeVDDXyH+uy0imCfY8Da4rFS5PUkx9S9M6iwgVw9WtO99SWaRtTyC1D1LYy8dgSRO3vW0BY8Je78QQgnSbKP14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234277; c=relaxed/simple;
	bh=AmdxDpSAXFZg+NG1Z53JDpqr/ZSkXDFyKiUPoH63AXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNiWEIJxo7m3tA/f+E2Al8LW0KjLLz3yxjeY0OM8y2qAu0kWya55n0ysucl9k/vCPZB9tSz9u8bQZ4mFB0K8tbrRHv9dgxP0gw5H8xIyzIa0AKKic19GHvyaNL4cT9GM4PZxhQad/OqhQnAypNUDBsmBIEklXmMhsis0teGrajE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N48xUM7m; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N48xUM7m"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46255b269c2so88325f8f.3
        for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 10:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782234275; cv=none;
        d=google.com; s=arc-20240605;
        b=lXH9GRh53+XS35PS7n5frSGrz+3DxKD6C4ihuvDF3sgf7zqiUTOUrE7lyurrdG9W92
         94suaFr9RYPVOAWXzcrwVaEULxV2s53h4RFOvor32UjE8sKNtFy3axzhCGz/aFuqWZcU
         60chVk/tDQX0Vz/L5d6xrnMdfMUc3iXUNHqSjME59U200EIxTKgJudYKAJUBfmR6hFJB
         Nqi9QNoxN+ggFh6SsOGRYkVHFXIqG0WHICTRcxNbDza/ob1YloKpD7xkIiOZutkoIwyb
         LfsF1OsB/SzVeYRbijS41xN/4LB/j6cAtey5L/bnVJi+dT+tXKeAGEWmGF+SiX10nLmy
         sYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EchZhDXHLnIIeOQ/eg4q+Ls2B4SjaafDmxoTrWutOys=;
        fh=hnkIwtaeMEp2JxBBjIzXMO8X5v8ykqVqcL7YlRLIoUA=;
        b=FpFqjiR73Wv2HBH6QGtADVl1L5W2SPqEqBLcAZPORnleTncT34gr4rdxPlTt0vtZr0
         VHQYIPf0nmjfHXb69p8hmod/+pWJyzpvYvfJUnbWM6EckjXHlhekM+bEsKQJLspY0TTZ
         9WjGR+laFrb9qTEvOoBinnRqmSxtc0y+KdnRRpH6h+y/BxgDEguc3hufpwhVv06KUp7I
         25wU0k7o4fSsuB6cwAEIeAV930uGXLkag03yT62DLecNA5JFmT3FSO/geUSp86+NUyyR
         V5CBJFevnLrWGk7DLzpnRo3JzVLWUiqbB4gMYNGiplCKUSTh6Vmy/96aq9oxiwWaLpTu
         Om9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782234275; x=1782839075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EchZhDXHLnIIeOQ/eg4q+Ls2B4SjaafDmxoTrWutOys=;
        b=N48xUM7mWDTGqWUxgbDRYqGtEFNFzJJOdvl0NOh5HoVD7Ccr1s6gt2IyRcvtvJCJcr
         drOSP3u39P7nYOlZAeIiz+yj4Na8zt5V1hITzUd2T5bBGMpEhRoXwp+HUCiASh6Y+aA0
         /7PZPxHRAi2CFAoTrtyG8OAGfj4mqC7ByEXC3wQjResoICas30dt7SHBYINOpEJ5UMvv
         aOrDEUZCoXXI+f/koxaRYR8XrekmoW7j/Fdp3qIuY2caPHMzLp1816MYjQVi00C1yfVl
         3AootSKpEZTIsRzvrRXYxVQSHsmYusl6DN3J+hD0kKuoQZv/Y+bcxV7itcCYUSsGIlfO
         bCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782234275; x=1782839075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EchZhDXHLnIIeOQ/eg4q+Ls2B4SjaafDmxoTrWutOys=;
        b=hxUbSjjHj4isHOixen2yjNUtQijMRNc1gheEdlJR1fQx39yPerUPZE7Rdf6FTgcmHq
         pAhFnJ7osTDx5szHW5w8QiHgaIJ9DSLa70z7JGiC9XEJqDds549ht5XPIz6KyeCFCcF9
         Yx6yAgSHusFLMjtty39F+6yHTKFgIXeJEbwOwTKHy8uI1R41YBEB3Pan8/sF3hzaVAis
         eBQdBFhkETsIVZ6/8kBjI4nBQW2KZZWxenRK44fnIiobuEPDN9ZpkGzn0A4BVbI4w+g2
         kNN975D7hAOXCXYioxp/iiWwRq8LvgIvPj46TX8nhOswsSk5e9C71bgvpMRVjZfltZlR
         hRvw==
X-Forwarded-Encrypted: i=1; AHgh+RpQdfhb4kxoyfUwb3tSahC6nkw7nytJ6k/DkYSDpK59JDMMdFdKDUvKkBfN+/bTPLH4fdjTEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrMo10N6pB3lNaxLbPmG6Wyd1k+THSYc367tTUiXLJq+S37OLq
	tIP9weiKkQVziIJ5M5tztzcyZ8rf9RKHichzeT8LJAlWVvccZhLh1l96cZeReXh5EwLfvn+W/bO
	UoZpvd4ih0n7cTVc8zGjRJ+FOgOI+C58=
X-Gm-Gg: AfdE7cn0f3VmpdTE/pJHai/myPWK7SSRrHoT03vr4sLOohcv1a80RwOA8HXbNDliu02
	3HI2RWuFwh13rXVbNz6/XE5YjZgACI8RRo5ZWJ/YRlg7nx4tEwIXclvoopky4pf/6Oy18uL8qaN
	XHH/qmN5kr14FcDQBoZrjgi2sY5WeUt3AJrZ9T3esuQKcNwE/V/jjHg+8WY1aOKXiPAVBKSyvHW
	tp2D836Zw0k4vLn6vvbzetlTNeKbAfxQ7gGbtK92t+g85uJQjf+visyXBgYmhClmSnnNwNDUql0
	U4PSJPgiaJZBKW0UPlb4QbAzruhvCMrWN74cCEqayr/2nePas9hX
X-Received: by 2002:a05:6000:46c4:b0:464:5df5:332a with SMTP id
 ffacd0b85a97d-46add1841f7mr4198572f8f.34.1782234274518; Tue, 23 Jun 2026
 10:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623135208.1812933-1-hch@lst.de> <20260623135208.1812933-2-hch@lst.de>
In-Reply-To: <20260623135208.1812933-2-hch@lst.de>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 23 Jun 2026 10:04:22 -0700
X-Gm-Features: AVVi8Cdq1cSEiVKuIT7rCtOjoNPEfhV6BkfHSOO37MXbTaAKd3fDSsQ7oc8pKTc
Message-ID: <CAJnrk1bq7pJEwwDuimp6GzCfdhrjhzs=MFAdRLOAdkJWmeSg7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] iomap: consolidate bio submission
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 6:52=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Add a iomap_bio_submit_read_endio helper factored out of
> iomap_bio_submit_read to that all ->submit_read implementations for
> iomap_read_ops that use iomap_bio_read_folio_range can shared the
> logic.
>
> Right now that logic is mostly trivial, but already has a bug for XFS
> because the XFS version is too trivial:  file system integrity validation
> needs a workqueue context and thus can't happen from the default iomap
> bi_end_io I/O handler.  Unfortunately the iomap refactoring just before
> fs integrity landed moved code around here and the call go misplaced,
> meaning it never got called.  The PI information still is verified by
> the block layer, but the offloading is less efficient (and the future
> userspace interface can't get at it).
>
> Fixes: 0b10a370529c ("iomap: support T10 protection information")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
