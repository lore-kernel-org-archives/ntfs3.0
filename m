Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F8C1DFD96
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764384051; cv=none; b=WFY2rcF3gPaKS2pzEXwIO0xodZ3Ka5UhdbMuCyMDidQ3JNh3gZOLn1x4xNn4Ji1imZhG6WeZQ6+gqR6dXqE13pSA0IstIfgN1i3gIuIfd54iUij8Kfcu27/1bhl38liTyN+zpZY8Fcwfxe9RjbjXItOEAhTgeFXIp9Wn35QIeyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764384051; c=relaxed/simple;
	bh=zHvwDf5Xq+iEVnjbasw1OMjmqc8Je/9Bg17U+6o9Pt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djZU61TWAm9p6oZXnkeNsXLz4jdCjI8grxsbBXO0vMcXe8mnoz/SoylJHePgJX4VR5qgg/4CBjquwzSGoDp0ljH+yn3yCA++zqqHVuYm79shJEVcXTDd1UF7/xgrIMH+TrbA9/k9QvKuHR1vgMpS57PaA0tk6l06kBaNm5fpytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgZL8W47; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgZL8W47"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ed861eb98cso26154741cf.3
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 18:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764384048; x=1764988848; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAPySlCz6W7rFB53xcBPcWM3i1+fAM460YdX4Fw6oEA=;
        b=EgZL8W47vVSLSqHiH/oSc1B3SJpVh5EGfzOpAQCGTUiMWOO8mCVyksEdon+nLwoQVC
         +2NQaFSgscVtwJJ77K3wTj+54Eee3LLAwpuvLQ0f7c15kQaVwqXs5RyNFCyDXAaNq9RV
         psW511VozzM9bpoKniBxnkuMsSSDsMUXso6Pfe/cLLVM3etjidxQhxHDe2wgsbHdP7v/
         8ZBsXckhSFp+xuo1SvZhezfAZsWn/Eo09b2HOMJJu1zo+VAO+6OKaORNM5EiKwmd1iYJ
         C/NW0QN07fwYrVNQRIkRe28uueUg4fybgeExUEkRXlpHpRjUQ2uPIutCmYurxvJWMdEj
         BYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764384048; x=1764988848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QAPySlCz6W7rFB53xcBPcWM3i1+fAM460YdX4Fw6oEA=;
        b=tptw1N4eZpW6CJ0vKH4UJKfHdDiYLyk+SFfRt744QnPFojLqtqBsAsYmqLVm4hH+8A
         xfFO45Q++FKs+2P0sOHr4IoAmxjsive6zC8IHXIavWR9UXDGY8KRT1mz4xJz9y8JCQ8K
         Kz3TDAT5Wky2RJvxs4eU1AvjnjBP72oKcKQOCoZDdJ1c7oSqrHGGvVq4fAcMzZripeoT
         e7erprW1yZytQSO00HhweOj7WtqAWtMKI2vmRmAW67oeJMAPJ7w2H6MEL48mcMQZhM65
         jd+nFYG6uiMmHQp7GTYxfrYbfVsK4QIgmzoiPh9eFBnCRMQ2M2BwMVgZ6md3k00nRSff
         Kd5A==
X-Forwarded-Encrypted: i=1; AJvYcCURYGG4s/LT8yGE2JDDcovx/ZPXG1hSLN2jD08hutLrfSgK0Gok5zWmlRmQJ/5MhfclA2ZFlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRTqHbrCi48q0u5dakMklO26nQ0X+WSQO+pF70x32C6d1WTlVE
	4Xwebheox55dEEXBVyyrCd0/6AaiL1WvXbhagtp5z+1gLbdeB6wae7wW5U0q67bxbVWG1wCUnPp
	1KOMfqwQT3TZvM57TM4iVyi0Xpmi9+3Q=
X-Gm-Gg: ASbGncsDn1Xia5NqlC4A4BSWQ5lKymcL1tzHidTtaOGGtlUDx33d9gM3nMgqKblKrzo
	rtwIhqdtEiozKYiOvmgS+3PSAksx8Hp5UYNRilk0eWoK9hxmhxu9VQIglj2+W2UYLzk5tyJ/Qzk
	hXmnXh9tJaJviibXqZHZgJU8jFuOzZoVy/eve0eNxZuLBpKwjOGU0vtdKPMjQSc9exI01ricvmh
	lmqZXk7GEkstcvz0EliLTf31GQPyQ4Phtco+mrJbuc2r/dF/mGxrOhEGlABnRipYS6VeQ==
X-Google-Smtp-Source: AGHT+IEc3jQjTSh2wGwA1eyD2xP/eWtKWxB49pbTJ6uDNzgYaFeaO9lvwOhTEy0qjR7rLP4x3OvjjW+3HSCvva4PQqk=
X-Received: by 2002:ac8:5753:0:b0:4ee:1b36:b5c2 with SMTP id
 d75a77b69052e-4ee58af12d0mr418152811cf.68.1764384048425; Fri, 28 Nov 2025
 18:40:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128083219.2332407-1-zhangshida@kylinos.cn> <20251128083219.2332407-7-zhangshida@kylinos.cn>
In-Reply-To: <20251128083219.2332407-7-zhangshida@kylinos.cn>
From: Stephen Zhang <starzhangzsd@gmail.com>
Date: Sat, 29 Nov 2025 10:40:12 +0800
X-Gm-Features: AWmQ_bkvl1bn1ab0FbiQv1s_-KpnO8A0jbXWmROhOJd-0tcEov6J9fzUaa8ydUI
Message-ID: <CANubcdUtncH7OxYg0+4ax0v9OmbuV337AM5DQHOpsBVa-A1cbA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] gfs2: Replace the repetitive bio chaining code patterns
To: Johannes.Thumshirn@wdc.com, hch@infradead.org, gruenba@redhat.com, 
	ming.lei@redhat.com, Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-block@vger.kernel.org, linux-bcache@vger.kernel.org, 
	nvdimm@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-nvme@lists.infradead.org, gfs2@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhangshida@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

zhangshida <starzhangzsd@gmail.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=94 16:33=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Shida Zhang <zhangshida@kylinos.cn>
>
> Replace duplicate bio chaining logic with the common
> bio_chain_and_submit helper function.
>
> Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> ---
>  fs/gfs2/lops.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 9c8c305a75c..0073fd7c454 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -487,8 +487,7 @@ static struct bio *gfs2_chain_bio(struct bio *prev, u=
nsigned int nr_iovecs)
>         new =3D bio_alloc(prev->bi_bdev, nr_iovecs, prev->bi_opf, GFP_NOI=
O);
>         bio_clone_blkg_association(new, prev);
>         new->bi_iter.bi_sector =3D bio_end_sector(prev);
> -       bio_chain(new, prev);
> -       submit_bio(prev);
> +       bio_chain_and_submit(prev, new);

This one should also be dropped because the 'prev' and 'new' are in
the wrong order.

Thanks,
Shida

>         return new;
>  }
>
> --
> 2.34.1
>
