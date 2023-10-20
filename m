Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1191A713
	for <ntfs3@lists.linux.dev>; Fri, 20 Oct 2023 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTZDmeE1"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7d9d357faso8068327b3.0
        for <ntfs3@lists.linux.dev>; Fri, 20 Oct 2023 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697805057; x=1698409857; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=po603pLa6+WCSRfB+kSK68fxdf9syke8GemdI09pYiI=;
        b=PTZDmeE1TtSh4/1ndhOA7U3KxN+dNDt6esTMQ+SFJ/Oi5sHBvpjayQAz30/hDEjk1p
         hEdeySbZ0zDXMCnFb57sNpLuogtiZp1RXw+1kC8xxT6QZprhSQzZb/BdyW572SK3eL38
         Vx1s3uk9gSMGdWElBW4+rHs0+x6QpV9/U7VwEVtiE1MdkvlZxo6tN/6tGhcKb3nsKvTA
         VQpGr+Ozs1yix1zy/UYCQ+BwNalvTAfJNeMJyVquI8DYsXcndgKwqt1qvNxN8UdKdbUO
         iVKMi6bnJqYXNG4Oi4sN3kQ/dICV1r75uTE9hbnGXtvCifOynqQ4BWxpQbt2EgAsLIH6
         xXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697805057; x=1698409857;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=po603pLa6+WCSRfB+kSK68fxdf9syke8GemdI09pYiI=;
        b=JhL8TYNiWY8twcHPi+2DjOgKl6jFJywQsB8gKZ7Hjg2q4yUS57GYG63xzCC/BoZSQF
         RXg1zG5U3Bfddrwe/bO0XbEi4Kd6QfgSIx5/Pp+PdqvIRUHImqzlQp3XExbhOhaAiHiN
         Cz1BTFZ+n2/YOd4W35ded2QqB6cBftQrdwKzMmiygqovvraIZBld3+gsawvzc15HZrK5
         ZWJQEfA4XRPWVuMcJ8kgg+8MtgnCVQNNiT/fqUzZRELFlvd/xcLfZQqGWA73x1YngyPX
         L1pyZbD824jcIfyz0b51ScIJfErCZX5MoB0i1NGJtzxR926iMW+Aegp1UbCrZhP51oBP
         cc7Q==
X-Gm-Message-State: AOJu0Yy2c+ePEVD0q+o2RZtAFda+nlwjbCrQsKNnZsORZ8sjGifYUUAp
	JrMwNZa4NOyXw41ojREj8yg=
X-Google-Smtp-Source: AGHT+IEOIarenbX043L5oIbX6lbvtuAP32bTGnwRaigZvMyalrTwJO+TskT/MUvUAG4FNXSH60Yzgw==
X-Received: by 2002:a81:4f57:0:b0:5a7:b8d4:60e1 with SMTP id d84-20020a814f57000000b005a7b8d460e1mr1817405ywb.9.1697805057406;
        Fri, 20 Oct 2023 05:30:57 -0700 (PDT)
Received: from localhost ([2607:fb90:3e1a:8bc6:bf58:5f88:bb90:604])
        by smtp.gmail.com with ESMTPSA id v77-20020a814850000000b005a7daa09f43sm641359ywa.125.2023.10.20.05.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 05:30:56 -0700 (PDT)
Date: Fri, 20 Oct 2023 05:30:55 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Potapenko <glider@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org,
	linux-btrfs@vger.kernel.org, dm-devel@redhat.com,
	ntfs3@lists.linux.dev, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/13] ip_tunnel: convert __be16 tunnel flags to
 bitmaps
Message-ID: <ZTJy/7PMX/kGw2EL@yury-ThinkPad>
References: <20231016165247.14212-1-aleksander.lobakin@intel.com>
 <20231016165247.14212-12-aleksander.lobakin@intel.com>
 <20231018172747.305c65bd@kernel.org>
 <CAG_fn=XP819PnkoR0G6_anRNq0t_r=drCFx4PT2VgRnrBaUjdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG_fn=XP819PnkoR0G6_anRNq0t_r=drCFx4PT2VgRnrBaUjdA@mail.gmail.com>

On Fri, Oct 20, 2023 at 09:41:10AM +0200, Alexander Potapenko wrote:
> On Thu, Oct 19, 2023 at 2:27 AM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Mon, 16 Oct 2023 18:52:45 +0200 Alexander Lobakin wrote:
> > >  40 files changed, 715 insertions(+), 415 deletions(-)
> >
> > This already has at least two conflicts with networking if I'm looking
> > right. Please let the pre-req's go in via Yury's tree and then send
> > this for net-next in the next release cycle.
> 
> Yury, Andy,
> 
> The MTE part of my series will need to be reworked, so it might take a while.
> Shall I maybe send v8 of
> https://lore.kernel.org/lkml/20231011172836.2579017-1-glider@google.com/
> (plus the test) separately to unblock Alexander?
 
You better ask Alexander :). No objections from me.
