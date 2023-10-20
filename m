Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E628F5A
	for <ntfs3@lists.linux.dev>; Fri, 20 Oct 2023 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYqVk6Xa"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a81ab75f21so8124957b3.2
        for <ntfs3@lists.linux.dev>; Fri, 20 Oct 2023 05:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697805963; x=1698410763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jps82JBDACzoR3tUfyIbEtBbVZCxrcf9ApmwOX34umg=;
        b=UYqVk6Xa0/G2fnNh7UZ7u3puziQtsAaO2zZrgq6o+lCDQdRYIk6N5Mnjb3Dz5yI6P8
         vxOpxX5NmH8OtKuCspTaUB+U0DOAcPdz5hL9TVZm/5bG1dJHieMZmnralKPfcXX5Hu9V
         shbmQX2hbnpuEp0mFq78AozekfyTnW3ftrDuDogSdibIorYj/d3xnROLGVJMjr1K/YVa
         osdlRW+//29kjy5yTQbMor573ITDkvDaE1R3HLWE/Yfk3mRVxbtYaV8F1CzdrfMJpSrv
         dAmYrzwyxQjhX928CXWSrugrnhP4tEFGJ4ikSsVtL0rjdxhu2pwlzouD1Jqs+UIuqPti
         2/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697805963; x=1698410763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jps82JBDACzoR3tUfyIbEtBbVZCxrcf9ApmwOX34umg=;
        b=XE1jEMrmoGekdWKImIEgHrkkLP2rRzQGTstGqIgacsAsRcwYI27SZI1YUq1LQIdZO6
         ES1LaxWFIV+KIr2wNiW5RDGEDJrmLQFLI49CA6//PgMfkduJoWfEvx7VsXt9LBAO6oLX
         XHiT7a/znW+fFAp+mzXI/sZXxV0qN+AMdiL7FAIzcrW4mFqYKMOzaBVfWEIutmAEf2lf
         nlD2/iqIrjoLXh4ElHJZ/oVNPn1ILfkqBrmm9Th0MDzfBtEe/zCNLDdVzrTsiuXfhZ4s
         oA4sifM9n+r8jjdfKd4aAScaxPlAamT27dWjzilZNRjGZyOgg5xRwIZWYTEk63+S2amj
         A9oQ==
X-Gm-Message-State: AOJu0Yyd3qcRNEtOYe+7JfU6qTB3puAJDwtGZqHeYQw2tzj3f2ugctuF
	vvnFiB0ka7Rc0ubGaCKo8Fc=
X-Google-Smtp-Source: AGHT+IE6t/1v27h+fcqmTdO36JdundJNToc6FICMQ+l92k0VypVbJHWYvo6kei8XbZDOyOkNc3/wwA==
X-Received: by 2002:a05:690c:dc4:b0:5a7:aa54:42b1 with SMTP id db4-20020a05690c0dc400b005a7aa5442b1mr2232055ywb.28.1697805962604;
        Fri, 20 Oct 2023 05:46:02 -0700 (PDT)
Received: from localhost ([2607:fb90:3e1a:8bc6:bf58:5f88:bb90:604])
        by smtp.gmail.com with ESMTPSA id m205-20020a8171d6000000b0059af121d0b8sm654571ywc.52.2023.10.20.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 05:46:01 -0700 (PDT)
Date: Fri, 20 Oct 2023 05:46:00 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexander Potapenko <glider@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-btrfs@vger.kernel.org, dm-devel@redhat.com,
	ntfs3@lists.linux.dev, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] ip_tunnel: convert __be16 tunnel flags to
 bitmaps
Message-ID: <ZTJ2iKk3sBFzVQJl@yury-ThinkPad>
References: <20231016165247.14212-1-aleksander.lobakin@intel.com>
 <ZS148saIsG7WY8ul@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS148saIsG7WY8ul@yury-ThinkPad>

+ Stephen

On Mon, Oct 16, 2023 at 10:55:02AM -0700, Yury Norov wrote:
> On Mon, Oct 16, 2023 at 06:52:34PM +0200, Alexander Lobakin wrote:
> > Based on top of "Implement MTE tag compression for swapped pages"[0]
> > from Alexander Potapenko as it uses its bitmap_{read,write}() functions
> > to not introduce another pair of similar ones.
> > 
> > Derived from the PFCP support series[1] as this grew bigger (2 -> 13
> > commits) and involved more core bitmap changes. Only commits 10 and 11
> > are from the mentioned tree, the rest is new. PFCP itself still depends
> > on this series.
> > 
> > IP tunnels have their flags defined as `__be16`, including UAPI, and
> > after GTP was accepted, there are no more free bits left. UAPI (incl.
> > direct usage of one of the user structs) and explicit Endianness only
> > complicate things.
> > Since it would either way end up with hundreds of locs due to all that,
> > pick bitmaps right from the start to store the flags in the most native
> > and scalable format with rich API. I don't think it's worth trying to
> > praise luck and pick smth like u32 only to redo everything in x years :)
> > More details regarding the IP tunnel flags is in 11 and 13.
> > 
> > The rest is just a good bunch of prereqs and tests: a couple of new
> > helpers and extensions to the old ones, a few optimizations to partially
> > mitigate IP tunnel object code growth due to __be16 -> long, and
> > decouping one UAPI struct used throughout the whole kernel into the
> > userspace and the kernel space counterparts to eliminate the dependency.
> > 
> > [0] https://lore.kernel.org/lkml/20231011172836.2579017-1-glider@google.com
> > [1] https://lore.kernel.org/netdev/20230721071532.613888-1-marcin.szycik@linux.intel.com

[...]

> > ---
> > Not sure whether it's fine to have that all in one series, but OTOH
> > there's not much stuff I could split (like, 3 commits), it either
> > depends directly (new helpers etc.) or will just generate suboptimal
> > code w/o some of the commits.
> > 
> > I'm also thinking of which tree this would ideally be taken through.
> > The main subject is networking, but most of the commits are generic.
> > My idea is to push this via Yury / bitmaps and then ask the netdev
> > maintainers to pull his tree before they take PFCP (dependent on this
> > one).
> 
> Let's wait for more comments, but I'm generally OK with the generic
> part, and have nothing against moving it, or the whole series, through
> bitmap-for-next.

I put this into bitmap-for-next, and it caused build failures for
Stephen:

https://lore.kernel.org/lkml/20220722191657.1d7282c2@canb.auug.org.au/

I can reproduce them too. So, removing from -next. Alexander, can you
run another round with all found issues fixed?

Thanks,
Yury
