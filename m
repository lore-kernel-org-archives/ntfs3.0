Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CA319D081
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379208; cv=none; b=g0Yt2x2TfSDn6Y6uk2yhv/nt2ksrjZysdWYPkeB5+7ZZapBm4IaL93HjPJXh04SCHATw6X15sHg+gw3AEWnvTKE6s+3/LcaaDteo4hNYPgYQW9M6IyCQUCBb6iuOEPlCg1uqDp5XRRRp7YMabQOXz1fkDxiQYv9oLFYS1F2hSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379208; c=relaxed/simple;
	bh=CQ4gu5qwHISanFuymuvKH3qflMdaqJ/uuGBrjJ6tlTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXhN+4deOpUMRFa3FP4PoCDIJ2DQTwpVRvwK6fD5Wu1chdFlH/0QbDNyRRzKITV4x4G8/HADzUA9YLZ/qRwjI3wbEGhansyhKUMXuhMIioJ3DmjdRZht2xgbCe+IDX3ndjXOgrtkhixtnSe/5iQaSeT52DXm/PLplDnoHNMhglg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXBIA5iV; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXBIA5iV"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee19b1fe5dso28497891cf.0
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 17:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764379204; x=1764984004; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs0ohHvC2dybiBLIXiSQxGJyUXrOOQGSRM7UOWCS5dA=;
        b=YXBIA5iVl1jJ5Lr3sJof78zHrpkQn1dv/8eluXaKvm32Rk8AuqcfQVRsVooNHK2otr
         aHoMIx7jrWK9uXoX/C93RHrOKC0iGW7fu5sisSxAeno2g4qXRBxArmLzjWFMvV3AX28g
         Rqx2GyRwTNAB1/dkvXERUptXB4ZdlaW1ySQuNITL6QKP7dxiJYIZsF/DaxQ8HNXkwehS
         E1Mdy66W+XkRZaosTdduZzG6lYC7a3GgdrEVXTeciPRUjPMuIEjUoQ/+qtA/VvRP6S0o
         CwLQJedoX3txhIqe3elS9Ja0QbOWGfC8HDWm5V4aqHZpaPYoS+9vD3/zvbabP2y3Md2k
         +u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764379204; x=1764984004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fs0ohHvC2dybiBLIXiSQxGJyUXrOOQGSRM7UOWCS5dA=;
        b=Fc9mFKSD8FUCAeCvMCrWYzeN7A5kV2FGqLRh5QKjGwe/DeWSz1ftupWE5DZl6EBvVM
         5yF5nHMW9WIy+j8eWgB2a/MVITtuumzzlQHO7airF149LM6tZD812LAwu0QCg26YswrI
         kiz4zrnX941pdoc7HexT6Nw8QQX6hrS0Th/93rwvLCUf5BH0j7P05QOqZyxwhYDE1HPr
         Vdlq3gWkdI5Lpa8tVlr1v7//W8sWMy5OqsUsVHZ64rmgA86mtYAINvLhUsh+A5Zwg9Sa
         EX7GPHxfIB0iNA0Ob40xZMHtYx0/GfO8XwC10oUrjF/iFImdY5mIc6D+AeDyFaY+nkiC
         Y+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnv03+hgOcGxu3w9JS+KsqVLuJ9lfM1rRn7lZzVnrx0xmLIrr4QYCSrVNA7kFAiBLFS5TlHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsvX3BiqouMpAcdTQDrWf36q8V4TsDndreXVGvVmYAbdizGgfB
	/vjNmUx7KX4gxMUpdC9JJJwPZY06Pubt7SAQ1Ts9o0dH8C/vNNBSfu1MIsU0bAaGPfbWLWKF7kW
	EW1u42D+dUVJOw1ZBMhM9p+atDMWcF94=
X-Gm-Gg: ASbGncvUmNdxryYvoNVreLFpCS/37cPjmUyjvALNBVC0RiJqYzIPPs0Djl7f0Owx4V6
	VS/JplpyEVSKdxnf3QvFzawPFKEe+LuNKPmgqYIrl4xaeV4RbgcSShuTFTj2ZujaKTYG1ltOkjO
	RMvvDp5MojnPZgJfPnYTq+vMPQQeqChaCzTGj8KKq/aYspZ03tNk/q7G6qNAr1rjh1jgcFA3h/0
	E8mYcsUxDEzCm1RR6da6OBsonKuWBevG9Uhr+AJVNZuXMyet8ou81coCf9S8iKjEK5CXw==
X-Google-Smtp-Source: AGHT+IGvVajIc41VyAxCuPyxqWUXb2OrVTIXZXouCyBBkNWEtauVL8pGUlccoVwLRAWDPyhKgINw+5nh517v8WUU60c=
X-Received: by 2002:ac8:7c43:0:b0:4ed:b1fe:f87f with SMTP id
 d75a77b69052e-4efbda3957amr254551091cf.20.1764379203672; Fri, 28 Nov 2025
 17:20:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128083219.2332407-1-zhangshida@kylinos.cn> <20251128083219.2332407-13-zhangshida@kylinos.cn>
In-Reply-To: <20251128083219.2332407-13-zhangshida@kylinos.cn>
From: Stephen Zhang <starzhangzsd@gmail.com>
Date: Sat, 29 Nov 2025 09:19:27 +0800
X-Gm-Features: AWmQ_bn06KtcfeC8pChk4HEBjz19bArSXx8IRJxxttyX3p2OYoBSLr0JgGawFZU
Message-ID: <CANubcdXJyE6Y5J3C5Zgc1jA7qSXk+_Hb0pm8Q-8cTb3Z_eM4sA@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] nvmet: use bio_chain_and_submit to simplify bio chaining
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
> Replace repetitive bio chaining patterns with bio_chain_and_submit.
> Note that while the parameter order (prev vs new) differs from the
> original code, the chaining order does not affect bio chain
> functionality.
>
> Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> ---
>  drivers/nvme/target/io-cmd-bdev.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-c=
md-bdev.c
> index 8d246b8ca60..4af45659bd2 100644
> --- a/drivers/nvme/target/io-cmd-bdev.c
> +++ b/drivers/nvme/target/io-cmd-bdev.c
> @@ -312,8 +312,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *r=
eq)
>                                         opf, GFP_KERNEL);
>                         bio->bi_iter.bi_sector =3D sector;
>
> -                       bio_chain(bio, prev);
> -                       submit_bio(prev);
> +                       bio_chain_and_submit(prev, bio);
>                 }
>

My apologies.  I think the order really matters here, will drop this patch.

Thanks,
shida

>                 sector +=3D sg->length >> 9;
> --
> 2.34.1
>
