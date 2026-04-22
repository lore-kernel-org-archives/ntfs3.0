Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7AD3264DC
	for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857753; cv=pass; b=BoztbWi0uggh+dQ4gX7yOxtF38Y3+rToD6YwCPGzvTLPviD3ts1GsQCsErEMTNgX+Oj1gEFAPNIcqCvfnEy5JNRXYcP/OViLRXpJX4VHdDuFPzGav63Qa8zve53MYxK1lVWhL3hvt6p98INVxiSZY6Te4u6NAswB9hFHD1yt5pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857753; c=relaxed/simple;
	bh=T2UoZZMlBFW7epRMNh0OLTaLvytzxCJoKyPYy31zmAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9kL10taap4SVL1H+RYTaLUNznV51tjRpBsSurCjeG61p5fV6kDcgcPzTEr5/LeHau+Cj8suTCazrtqEeLT9bFPBLaXXzneVSWC2xYajXvhzHz2o/KxAVXuCdK39FD0DTn3WavI45AHi1HBWbrjRT06op5Q1LOyNB82isTd0SgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qa0HEB2W; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qa0HEB2W"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c8cc7a77eso2099175c88.1
        for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 04:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776857751; cv=none;
        d=google.com; s=arc-20240605;
        b=jqgt6eEb56RG1KUPIBV6riPQxEnNjGxWrw/NfKQBs7Y9+FNLecONW+fQvxn8EMEfBx
         HU5V101yte0/tAhk0zOw7rgt5uO/9CkuJgSViLaC7VUb5AmUxGmPCBtEgy/Ztk/6Z3vp
         lB5NHNSIM58hrtB+CwahlS5ryHfvNYYzRST0tZPCchUelz5MuUgRHY2e839bxdEfMgCu
         zDwCuTC3Wm2qDzuwef3zO9ZnU/lrpcQWqg+fdgzgjZmaHQCCqJwu3sbk0coq5+hp5+S+
         XfFzoWWWamvuwOaN4pyWG8L6iGghzqdRKDF2WDv8+EiSiwI2xdSOhGQOj/qHAauWqD34
         Eg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T2UoZZMlBFW7epRMNh0OLTaLvytzxCJoKyPYy31zmAg=;
        fh=y1GhHRvgDFcMVyEyopSr8kJMYNvdjM+qLRl03N03D24=;
        b=GCBsF4x4LKKlEXYX1pIOhqWQfsf7YR2qPh/Py07y5Y+kl3IC8BG31n7k/DsK2tW4JG
         3OUFho+l/vkCyLvnGgoBXEgqdZdT7hP/Zhmo8NZZyAmy5RtU4Nb/lKDXyaVyddp9Aw+w
         l7yun5LKtBvNWyhuR8HGj+Cnpry66j0Zaf/yxMjCDPELcWFa1pOTm8QsHYXmZxMBW4PS
         GBBRHt066mgzkd5eAwOZ9n398ehhnG/81uCN1af8s1RV/kA8asbnCfxI1Wq5Uy4K1ANY
         0uPhYf7JD7D07BUSCykGhDlwvWRjN/7LJznezHb7VQ6PtVQjdUuyGyy5zB+l4JvmN/qw
         RerQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776857751; x=1777462551; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2UoZZMlBFW7epRMNh0OLTaLvytzxCJoKyPYy31zmAg=;
        b=qa0HEB2W79PMfCGDTkAS0LZBJvye43zn8DtSQhgkiOkOF3A9uUo1PX/Pf6I+eRbAwj
         RoNWXGCv8M0iUbJBNGXRjzgDSUWUEtmk+xkAzKMMXfWjO0CUWsC9zgEZzG8rI7pTXUxb
         YIEiaLaEl5DGj5q6nn8VFly0Diaj8d8q37E0066fZ/Q8P9Z6pgNAqNqp1bP07k4e8s+p
         vJfErSPbNwrOQIm3rNZc/csqyv4g0yp3R5FaJEcUCZyw3UkR2Vd4VmMXOkxcjGNNAHiG
         P1c9WtOHcCypxYxf3Ha32dbTvxhbvfVBkd6k/2jqEnvJZ4xw0eb596V4gXBPv3/5uIix
         U5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776857751; x=1777462551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2UoZZMlBFW7epRMNh0OLTaLvytzxCJoKyPYy31zmAg=;
        b=nN6UxgOQj324bBcycNx26JWzwVL0hL30rFDIICjE22iGs6MWb6F4u05Ht+FoEKCNfQ
         Xkw5rfsTR47GqPxqT2/DE+uOKz7XzmMpzRB3Uckp7gQ7DYdC3Qwk/g1Yw9IvSM3M8WBY
         3WAUJDQ+yCRoJEGFa+6x1WSX5l6XS8r7nvF/TrkjAEa+H9DFBaN877CtRpvhb5LbIHiX
         eOUdVa9p/zrATSiAWELwJCJ2trM7/USAlqGLlVHmvtvK0yX4TOQP6boTOZeOLSr9dHZQ
         cXSWazY2314iK9+hAG0LTVYs+in8Mwp8rIqBaRn6fDpBuVmx76p8N0yXp1AEJlHU2+gZ
         T6Vw==
X-Forwarded-Encrypted: i=1; AFNElJ8zgaomMip0FBES1IQ81PrxaLv3eBj091aR0DIS9Cv8bZuEf9d1eSEw+qGoC09vSEdF0BrRmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxje65hAIdKFl31D51tSCaeZST4E2uO5JfhKrYFkx9nUrNm8nQb
	5gGjPugwRtMv99ObPcLcrwNmfsVHOvZsxUOSRYBkij4RJlCkRfqzZVfDFxfrgdwfEOisBndi/ne
	ttthgpDVc14VIfk1G8ymntW3qWuqLaKy8NNl/Q6Yh
X-Gm-Gg: AeBDieuUDOm481RbN4PXFcx0HMwAx2112yHh2cH1M07YiEWYoBhYWfgbaLj5eU+seFN
	ZvWcDz1/bFpk+v8iHfPXBmWCp7uT+7NvSGYZ8gXk2Fw4H7U+hdHuZGaXKX7M/+tZVfDWp5xIqdf
	csf1YiGL5sf9ENQyhC2xLuOgpLgHOZMlRdxwAioVK+L0yExSaZHPYbX+BFz2yXPYZKVNecZMrdp
	LQ0/yf/HlB+V390l+wjlslzO28ZOGArPs5Jo7S6tOkLNPjkV+D/Vtd/i/uBSwWLYgO7JxMFw0qO
	+V7pQyl7hwJAI2pffkaRpcWBkf5WnSjxKqeBSONi0hSj81FoHUudmHq/NlP9HVyT82Dt+w==
X-Received: by 2002:a05:7022:6289:b0:12c:6ec9:3f1 with SMTP id
 a92af1059eb24-12c73b4b076mr9387046c88.21.1776857750821; Wed, 22 Apr 2026
 04:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
 <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com> <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
 <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com> <aed5LYnQvjgWm5Rc@elver.google.com>
 <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com> <CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
 <CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
 <49780769-461a-4a09-a7df-c34a2e839e45@app.fastmail.com> <4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com>
 <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
In-Reply-To: <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 22 Apr 2026 13:35:12 +0200
X-Gm-Features: AQROBzCwY9MW04GUljn6gOnIbHfclBOshUTh-SNwfzwzCjf3XU3L8Mkl578PeDI
Message-ID: <CANpmjNNcGgqoA02QGCXcvDwkjcnk8BgCo6yTKu-B0VBVBJd4UA@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 10:23, Marco Elver <elver@google.com> wrote:
>
> On Wed, 22 Apr 2026 at 10:00, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Apr 21, 2026, at 21:12, Arnd Bergmann wrote:
> > > On Tue, Apr 21, 2026, at 21:06, Marco Elver wrote:
> > >> On Tue, 21 Apr 2026 at 17:26, Marco Elver <elver@google.com> wrote:
> > >> [...]
> > >>> > To me, 2 makes more sense. The attribute requires gcc-11 or higher,
> > >>> > so you need to wrap that in a compiler version specific macro,
> > >>> > but since I only saw the warning with gcc-12 and higher, that
> > >>> > should be fine.
> > >>
> > >> Kindly test if you can:
> > >> https://lore.kernel.org/all/20260421190351.1976329-1-elver@google.com/
> > >
> > > Applied to my randconfig tree and verified that this fixes the
> > > known warning (only one out of about 200 random configs). I'll
> > > let you know if something comes up by tomorrow.
> >
> > Unfortunately, there are new warnings after your patches using
> > gcc-11. In 500 randconfig builds with that compiler, I saw 7
> > configurations failing with one of these four messages:
>
> Looks like a compiler bug to me; can you check gcc-12+ ? Maybe we need
> to allow the __access attribute only for later GCC versions.

I can also see this warning with later GCC - so I'll give up on the
__attribute__((access)) version and instead suppress warnings.
