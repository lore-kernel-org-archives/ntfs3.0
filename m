Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62D63081BE
	for <ntfs3@lists.linux.dev>; Thu, 25 Jun 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412376; cv=pass; b=NC3+yYfiGnpLrkS6h+oYKUteJ/8V348F79DhxW00HX7tp6Y88Ewls2WpSi+dC/vvE+qVUFJslsKjSfaoO/NMnN73Jab11J4OqjatYTaZXQvxqOyJ1wWm7yJ3Q+0KA/WMpyEzHQLptWGTpznyRFS0RVbjleum7Ul54fOcyTyzqJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412376; c=relaxed/simple;
	bh=BDX+NQmwbo8tKyIHJVU3KO5zaM+mKg+N84iqF/OWUBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kx8KT7JGTcjNesl0qwFKE93aeWgmQXLFIYvPLAoaF5H5sHrnwrYQJUpRhWqe6C9Pb4e+w1S83gX0k/5VarBFekg0OOU8cil55uqdgs+dhVCgh7S35lwH+m4APhCU5bMiiHgfLeybg9hYwDszA07z+pvQaPVZjLEDBcpM6Dgd9BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0By5HZm; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0By5HZm"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46cbf263113so53746f8f.1
        for <ntfs3@lists.linux.dev>; Thu, 25 Jun 2026 11:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782412373; cv=none;
        d=google.com; s=arc-20260327;
        b=B/kMDMVHqTMRYnBA9vhK4MA5p+CFZLrz8ZpwR2y62s0HjWMXaJzLSYzjb5023MgNKD
         BbKXmf2/fIikuV13xVF1L0aIjWtH9WDiD5eAlcJjHkpbxEO3Q7U760S1+xEzvh7/CCpY
         CPYDjscScuuAC0A91EPJl+S74mAM7GBka8SYDynJSub/h6A8SCrBU6vVg+cHUtMoQV0V
         6mpDGj5+pQcuntdocmrN0hRo8r+YpGjVdPJrdhR23GsDQZr8iH4usojzH6x6dtLuoEjW
         FlCgdZv0psv002WAr+vebPhbmMmRfQtN2ToZaWgsjWjti3Ya5o9EshHjs24zSERnMkZq
         V9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g9V61tcEtmNSRd/wIPFD8Kzb7PIr8WM9gRz3AhdzXFA=;
        fh=F9KMN3PKNXawUygD6q6NYPaSq88JU+7+Pq233KojFhA=;
        b=pj/MlE5+YZ6lbOaK4E0Fo7O4dlFWqieV3zyry/DAfGoidnKW34PjnfDdoNt2G2VLGj
         2h1iK0ORvYh4M2R2CCWYwJD7IpZOChS0g6ETFMQZ8yzb/Ujkoc9QUOFOz4SxEX6d0Qns
         T6zRJL79fc/1J8a7YYJDNqgoIWaXZ2J1uM89vSE3vdFEcSnceLF3dw3749fmDXRPKILq
         VxbcM9rehNikuI6WQGowJfO7DdpIKuWq5JVLN6WBJY7WKGw8wvNkcAQVnuZScCEYdXxA
         /0tKZ4H985p+z8I4pB7i7nLyOGfMxvHabF34xTW8eMcCR5YkDp27Kz3STTEtjR8E0XjI
         U09g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782412373; x=1783017173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9V61tcEtmNSRd/wIPFD8Kzb7PIr8WM9gRz3AhdzXFA=;
        b=B0By5HZm3/fHC+5DYU095s2jTd0qKCZ6+PX8EWeqYB6fVvrK3j5iwROazVy8pVsAln
         B+GFbWKEIggQmA41vsHv2Md6E+j8VbYAfsMgtz/Wux8o+ndM0w6Pch4MzzFnguSE9ky0
         q4ZPRh93mZp08MCUWvte3D90/PDbW77iCrr+KLn5YLfrA6PU7Fpoj5iBBIOXSeKGxaRN
         QVPbjMAUKqIQPXxYQi+00xayAJwSB7WC0BynChucTbFghZYj/VgEcHL+0W/vStHRzZRg
         SR+m4AOwWZXDNrWKOoVSrDhUp+A+FGxgLX1WEOJkDoWX91+GgrQ1sOjxTnvv6Dr9IUjd
         9V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412373; x=1783017173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9V61tcEtmNSRd/wIPFD8Kzb7PIr8WM9gRz3AhdzXFA=;
        b=MBQiQTy/IY7XUAyLMB0gpxPc+lBhrufembD3fj9vKMoalLvODj0hEtXXSQKk/6tXA8
         rNDdq9a/4O3gje/JHTJ60tfcvvLKyVQtjO4bzZNAei1jkeLSbVE01zez61t46fTrbV8f
         qWgNAwlGC3ykf5wcSr4sWoAZWqzceuQa+vtcJgcwsaT3M2O9ScAFjdDJVHIXB8ODL9uf
         B3XcQgDSrG7AqizT7CnjTtmMnMSpNsyjf38CgFTnBttOFCQ2ngH0uJprEHYNZMo00N1U
         75+rtcYz3ozwF3OCjybX9FTWnxf/pUbRcE0ZZXRzo4lk88gX53TCldFHnu+ToIs5lZmB
         0VDg==
X-Forwarded-Encrypted: i=1; AHgh+RqlEwBOAZc7WXKd1MHGdrAxSz2jLH+3Tqvnxl+pkpYXRt3RjmQKiSs/9dEIMwpzM0AamEZcsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ9RhjDJCH3xqAgrb9EOAmdzf1+AiL8KzbsFw99swUZTl9eZpq
	MyuXwSvV/No1WiNGaiYnQh49MlNzcKqlBxPhMLj8kYlnj2L17WNEPXwNgka5DNEHuL9BEKwnfho
	ibnLT8xVt/XmrZmuJPx6zWjM34rF94BI=
X-Gm-Gg: AfdE7clZSybiErLdVdF0QtczpSJaiN6cmZyv0eKA3+E6GjLZkDJYLE19T5ZqWrX2l6N
	OwM6txqQH+1VJ8p4kSYyByLfbaXLWsbmD8/Aw0SaI5quKwqRZuLtVzfzC1IOKGZF36+x2Wdi1Yt
	v2v6OCJTt1SZVDa/z5bMu+o12wBYQK0rGwvDDz+hgujpnD9616VW8zwKZs36G8xAeTNATh+9JC0
	lDP8KAIX/fmeFUrbT7CJ7Kzy/cA27VLyeFTS1dnoClhYSnsvsEcafGsc9WIU2qOmrWAx4No39NO
	b7xVuLyLJ0RdR7QNnG2zoYDeQUrNrb1lcd5o3IshJ8y1SZqPHLvp
X-Received: by 2002:adf:e198:0:b0:469:3bd0:fa7d with SMTP id
 ffacd0b85a97d-46dc1e7d2aamr5538200f8f.41.1782412373179; Thu, 25 Jun 2026
 11:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625120803.2462291-1-hch@lst.de> <20260625120803.2462291-3-hch@lst.de>
 <20260625174758.GE6078@frogsfrogsfrogs>
In-Reply-To: <20260625174758.GE6078@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 25 Jun 2026 11:32:40 -0700
X-Gm-Features: AVVi8Cft-saEfjqDMyKwAQ7hs3asCzTZsJFUliVou9sVBM1d6hPzz_2GUJ4y52Y
Message-ID: <CAJnrk1YFeirQ4g7qcVsda-8qPLeAtoiyW6ZBuJb2qDsGpxi-tg@mail.gmail.com>
Subject: Re: [PATCH 2/2] iomap: submit read bio after each extent
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 10:47=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Thu, Jun 25, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
>
> > So instead of adding more checks move over to a model where a bio only
> > spans a single iomap.  Change ->submit_read to be called after each
> > iteration, and pass a force argument to indicate that the bio must
> > be submitted set on the last iteration.  Switch the bio based users
> > to always submit, while keeping the single submit for fuse.
>
> Is fuse the sole reason for the "force" parameter to exist?  I wonder if
> fuse could drop its submit_read function and call fuse_send_readpages
> after the iomap_read{ahead,folio} function returns?
>

Yes, that works. I think that's a good idea. fuse only needs
submit_read logic for readahead. The change would just be:

--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -953,19 +953,8 @@ static int
fuse_iomap_read_folio_range_async(const struct iomap_iter *iter,
        return ret;
 }

-static void fuse_iomap_submit_read(const struct iomap_iter *iter,
-               struct iomap_read_folio_ctx *ctx)
-{
-       struct fuse_fill_read_data *data =3D ctx->read_ctx;
-
-       if (data->ia)
-               fuse_send_readpages(data->ia, data->file, data->nr_bytes,
-                                   data->fc->async_read);
-}
-
 static const struct iomap_read_ops fuse_iomap_read_ops =3D {
        .read_folio_range =3D fuse_iomap_read_folio_range_async,
-       .submit_read =3D fuse_iomap_submit_read,
 };

 static int fuse_read_folio(struct file *file, struct folio *folio)
@@ -1089,6 +1078,9 @@ static void fuse_readahead(struct readahead_control *=
rac)
                return;

        iomap_readahead(&fuse_iomap_ops, &ctx, NULL);
+       if (data.ia)
+               fuse_send_readpages(data.ia, data.file, data.nr_bytes,
+                                   fc->async_read);
 }


If this fix needs to go into 7.2 though, maybe it makes sense to land
the v1 implementation [1] + the xfs integrity fix now and do the fuse
change later?

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260619050105.439956-2-hch@lst.d=
e/
