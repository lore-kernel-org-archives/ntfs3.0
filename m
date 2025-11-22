Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EBC284671
	for <ntfs3@lists.linux.dev>; Sat, 22 Nov 2025 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763794971; cv=none; b=E0L7z8EQ7LH4/iDXYU1wgSC6KVJPI4iS++SdhFJRvlJwceShd/uFiUFOdjoR0hjbZBaIisbG62ixoljDwKuJW7jh3lc5YnlSL94bKzYEzQCUP5rv1Fgd+S4duX+gQycgy49+LH0payRhQ4MY4qnJ9fmBhdldzDE1iwlxfjHA/Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763794971; c=relaxed/simple;
	bh=3qML6mAdP3XOHu6CRgEfvtbrG4LVKi3a96yUcu5LMO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZ2oBDQKaRwrgQ4P6CjPs1PIdvMlaE9bmM/sIx7jl2GOi0tgjPogyiF08VmV7AoE9uOgPDoWggkR223esDI9EvaIMP3st1W7/LhGa2aZb6m5nhgJOC9LM2bEm+wj0IlT7Ee2DALkw8BI3H4/AlA0ipztQzpr9bNkNPHvX9BcsNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFNGP3cE; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFNGP3cE"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b1bfd4b3deso223903885a.2
        for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 23:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763794967; x=1764399767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLckKOB/6XWKdTlMPCvOWJYhseDg7RVjB2FyFDWqsDI=;
        b=NFNGP3cEcVI4DzLS8NwKrlYEZXToc2D655GsOaN0h/xdx3GhMFMY6HxuOMewSZteBX
         3q4kK2ozIT2dDMgGY6DgcZU4IH/Z9mc9Ojpt110/BGVvIruSFX/UjNt2N7IKwc8IQwSO
         UJhSWqjuQfnHfNAFaIzmtKHXGZvBnxdUPkFWyOsXcg37FwRRQzz5cSUAhVb7s4mWAmRZ
         e+SePYfBxAY0+2Npkz41TWtvs35beVKSqj9m5CfvxcZH5ShcV0UBNWSH0B+2hX9BCruh
         6b/07c085YvLMnAqigV3uqmcNT04sUvNIJMX4MDTacTj4tU3w67f0Z+iOjj2qoFtSwjl
         oLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763794967; x=1764399767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLckKOB/6XWKdTlMPCvOWJYhseDg7RVjB2FyFDWqsDI=;
        b=If5mZPXs4j7V/zWOlo04nnOkDM0lwRYtZdrlQCuDQHn1OJFkeIKQTnOAty8cBjjZ3C
         XnbK0RIUUKpnQrbyZMukoD93Kx0MQ6C2FUazMOJZNZ4hwq+7KMGstTiHaGQzlUHZcRKK
         ZI1QTO1Jpd03uZ0TTDT6+idfgI5KQxZltgTef5+I1VuMDrUFEQiuNJyG9HmxAVCH64vl
         ZHEe7LqeIorXXbFSZz01DiVffmMJ4PpNYCruY7KHlXB59uSlrYAiB+bQlegH5HgpmtEH
         jO4eU+JnhOLLg3BbTdQR8EAipcrix4xqyDogJsBfmTpTaUs/Xb0PaLV9NqkvlQyLQb9C
         Cvog==
X-Forwarded-Encrypted: i=1; AJvYcCXsetxuDeOlBYQbUSv61GGXsh58+a7socpbyajw/uMnki2c2j8l2p6xlTk9KlIGviaZVIc82w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx9SrByN8D+8D8b7aaQTs9/VltObYBq9oNQogbsTQft57M0b/g
	UTfDEO93sKLesNaUulJq3GBHEe4TJuFweqX9okANiwS9MBtnY8CQhjQ8uxZanxWpzVQZM1jjjsz
	39FlJetR1ovKOzPlU/O6xvi2HPwvbr20=
X-Gm-Gg: ASbGnct9Cjikoe9EpVDmj4QHVFxbNpZHRLeEMU/UVUrIa9wAxdo5Egh9vsSusmUojOs
	gv4VXECE6dhyvbgGDIRf49vMz+emADHHLym6r8rdd8FckcJtRYROsR4KKXmdI7Kl382tAYrEBFG
	LQ7h1TxyvazUudCF7m2YsFoC7OHzXLcpoPMWO2RMAInFpz9DCoolH472D4K2NS+R+S2Dm3ryiyl
	H/84rPWCSPwG7XHPobMPX/1w8EqlvqfwhA26EXAGlJ3TChwxwNppNOFkVIEZCByfxDhGec=
X-Google-Smtp-Source: AGHT+IEjcPOv6aPW6JO4Bb1jDowgVciSWSsWd+FNjyx3VBhgbx3Pj6ddYbo0M3Mtuw+ANHFx2AKfX0TCp1WB72JEhOk=
X-Received: by 2002:a05:620a:7106:b0:8b2:e5da:d316 with SMTP id
 af79cd13be357-8b33d48b7d4mr603659585a.87.1763794967475; Fri, 21 Nov 2025
 23:02:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121081748.1443507-1-zhangshida@kylinos.cn>
 <20251121081748.1443507-3-zhangshida@kylinos.cn> <CAHc6FU7eL6Xuoc5dYjm9pYLr=akDH6ETow_yNPR0JpLGcz8QWw@mail.gmail.com>
In-Reply-To: <CAHc6FU7eL6Xuoc5dYjm9pYLr=akDH6ETow_yNPR0JpLGcz8QWw@mail.gmail.com>
From: Stephen Zhang <starzhangzsd@gmail.com>
Date: Sat, 22 Nov 2025 15:02:11 +0800
X-Gm-Features: AWmQ_bnR6g2ivQ9YSC5w0bIwME61y28InS6FucoZ4PBrcXjaLHV0KwJ_bufirnM
Message-ID: <CANubcdXx8Lp1JsqG3ctAE2V6jpuvJL93UH+7yHaAFtdMjHdijw@mail.gmail.com>
Subject: Re: [PATCH 2/9] block: export bio_chain_and_submit
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	nvdimm@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-nvme@lists.infradead.org, gfs2@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-xfs@vger.kernel.org, zhangshida@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andreas Gruenbacher <agruenba@redhat.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=88=
22=E6=97=A5=E5=91=A8=E5=85=AD 01:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Nov 21, 2025 at 9:27=E2=80=AFAM zhangshida <starzhangzsd@gmail.co=
m> wrote:
> > From: Shida Zhang <zhangshida@kylinos.cn>
> >
> > Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> > ---
> >  block/bio.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/block/bio.c b/block/bio.c
> > index 55c2c1a0020..a6912aa8d69 100644
> > --- a/block/bio.c
> > +++ b/block/bio.c
> > @@ -363,6 +363,7 @@ struct bio *bio_chain_and_submit(struct bio *prev, =
struct bio *new)
> >         }
> >         return new;
> >  }
> > +EXPORT_SYMBOL_GPL(bio_chain_and_submit);
> >
> >  struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
> >                 unsigned int nr_pages, blk_opf_t opf, gfp_t gfp)
> > --
> > 2.34.1
>
> Can this and the following patches please go in a separate patch
> queue? It's got nothing to do with the bug.
>

Should we necessarily separate it that way?
Currently, I am including all cleanups with the fix because it provides a r=
eason
to CC all related communities. That way, developers who are monitoring them
can help identify similar problems if someone asksfor help in the
future, provided
that is the correct analysis and fix.

Thanks,
Shida

> Thanks,
> Andreas
>
