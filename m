Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B915D5B3
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709136663; cv=none; b=mDbimKWk3PwbfOo/77MJb0V+DBI81zJ4dZsqwfKs+0xri0zgJJWsIHmYgh9unRSciT4q4Qv8g7Pvu1ocY2X0Klwjp33gXBgB7D6svTS3u900koDqzN4/b1mBnkMUJNM0ftqLO554d+HTwFBswGankSaEY/v/2AIkmFhg+czLwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709136663; c=relaxed/simple;
	bh=x4cppwy5kuHxn1Xdw/R0WLbMpw8zlt+UyW3XE5G3RSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeGYpb9bXkn9VdRpZbL4gxt65nXRH3hS7uIATzhvdhtOBTDlVpLsoEPhzUlpwI6YiYF6794gqOgBrmwi86vFwtOZ8vNEqHhIfB79Xid9R07nZuEnRoor1tAyZY8KOBRBashH/ZlJkLrLoxmQEN1t8mbqCQLavyBVfEOzjLzdpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhNkSJrk; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhNkSJrk"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5a04dd6721dso1558263eaf.0
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709136661; x=1709741461; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UM7fB83xrY7g3CIrUJgpt+5lWVhOTXwWDbWvr1lXm3o=;
        b=OhNkSJrkIpv2pR1UdWo30HBBCSKgo5JZOeA8FYOjeYh9zR3ea0akno4jV8BPbR7mVE
         n4Z04WNp0Q2Kg/566rer7h0spVX6d9gKr0YPJlkeL94dIM9Ir3FFghX6ASSZX4J8Ck9b
         pw0hwR45ntJ6QoXCJTFQqzzRnRnChF+sDMUGVR1e87UrB7qjstmkpx5iwB5Bv+Nzf3G2
         S0Yu2IP7uwQjnAcvOZ+xywGP0G7NZ5oe96CpN4/C6hL0Z//S1uXGmSPYxiNB0gluGeKY
         op6sntp5KaE6QQCcb5aXGCY3RCYjIoJR/bCQZ0A0B9QA6dGVpQFDFp6gA1K6n0AKlAys
         19Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136661; x=1709741461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UM7fB83xrY7g3CIrUJgpt+5lWVhOTXwWDbWvr1lXm3o=;
        b=sEUnjcgV2yOqMVIZPcXhc8ySKzJ+jocJIPmRzFS8i00NG+RTz8Y4m24GC1StYp1OKU
         9PuR6aleiJO34RXRsnZRsLQgNpubMy3KYSOd8/1e2GeEtkzmUYFnOu5hjj1aSvXz9HGJ
         K4np+gwmy1lCwTww8bLsu3/0Yg30GMrMWPUVNk4oQ1jh1GLA/bVq1KBw26sSFioM/Iyb
         D0B3qEqD2bW8MycVcNdZOx+kmbD/GfP9aHvAM7PtxKAdqhCVsJZWJUZYiZ94DhtXqwZn
         bE56AiNdeWUb8P1cHqSShLZHZ/QP5u1N9SLnP/oN0j9PekxPkzLhSgca+fklOeyj8HYQ
         E9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXhgM3JomHjIVctv3AqeoLM3P0QvT1WlglYuhX1W/BSFxJ/dl7guyQLWCdItxXVnJZSQZVrKZbGmgrtiZPfcscyZKawwiI=
X-Gm-Message-State: AOJu0Ywz1XCA7eKy+AXQCqC/tD7C+ogUM6gtgnFbDcVlDW+EKyeU+a1r
	tiOHz+toEptOI4t+N+o2gjb/pkKSQPR4MzHPFD6xw01uwt+hRaOw
X-Google-Smtp-Source: AGHT+IHVqmXgCjjpeT3Ayfgm29V7pLwkYccA07WjeKQIvCijKqteNCHyaFrBaReNdiJYMkPFdwfJlQ==
X-Received: by 2002:a05:6359:4c0f:b0:178:94bc:72ef with SMTP id kj15-20020a0563594c0f00b0017894bc72efmr17459234rwc.25.1709136660774;
        Wed, 28 Feb 2024 08:11:00 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id h8-20020a255f48000000b00dcda5ddeccasm1939107ybm.30.2024.02.28.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:11:00 -0800 (PST)
Date: Wed, 28 Feb 2024 08:10:59 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexander Potapenko <glider@google.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jiri Pirko <jiri@resnulli.us>, Ido Schimmel <idosch@nvidia.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <horms@kernel.org>, linux-btrfs@vger.kernel.org,
	dm-devel@redhat.com, ntfs3@lists.linux.dev,
	linux-s390@vger.kernel.org,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
	Syed Nayyar Waris <syednwaris@gmail.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH net-next v5 01/21] lib/bitmap: add bitmap_{read,write}()
Message-ID: <Zd9bE0Z3djvj3+As@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-2-aleksander.lobakin@intel.com>
 <3f6df876-4b25-4dc8-bbac-ce678c428d86@app.fastmail.com>
 <CAG_fn=Wb81V+axD2eLLiE9SfdbJ8yncrkhuyw8b+6OBJJ_M9Sw@mail.gmail.com>
 <b4309c85-026c-4fc9-8c26-61689ac38fa1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4309c85-026c-4fc9-8c26-61689ac38fa1@app.fastmail.com>

On Thu, Feb 01, 2024 at 03:02:50PM +0100, Arnd Bergmann wrote:
> On Thu, Feb 1, 2024, at 14:45, Alexander Potapenko wrote:
> > On Thu, Feb 1, 2024 at 2:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Thu, Feb 1, 2024, at 13:21, Alexander Lobakin wrote:
> >>
> >> As far as I can tell, the header ends up being included
> >> indirectly almost everywhere, so just parsing these functions
> >> likey adds not just dependencies but also compile time.
> >>
> >
> > Removing particular functions from a header to reduce compilation time
> > does not really scale.
> > Do we know this case has a noticeable impact on the compilation time?
> > If yes, maybe we need to tackle this problem in a different way (e.g.
> > reduce the number of dependencies on it)?
> 
> Cleaning up the header dependencies is definitely possible in
> theory, and there are other places we could start this, but
> it's also a multi-year effort that several people have tried
> without much success.
> 
> All I'm asking here is to not make it worse by adding this
> one without need. If the function is not normally inlined
> anyway, there is no benefit to having it in the header.
> 
>       Arnd

Hi Arnd,

I think Alexander has shown that the functions are normally inlined.
If for some target that doesn't hold, we'd use __always_inline.

They are very lightweight by nature - one or at max two word fetches
followed by some shifting. We spent quite some cycles making sure
that the generated code looks efficient, at least not worse than the
existing bitmap_{get,set}_value8(), which is a special case of the
bitmap_{read,write}.

I agree that bitmap header is overwhelmed (like many other kernel
headers), and I'm working on unloading it.

I checked allyesconfig build time before and after this patch, and
I found no difference for me. So if you're concerned about compilation
time, this patch doesn't make things worse in this department.

With all that, Alexander, can you please double-check that the
functions get inlined, and if so:

Signed-off-by: Yury Norov <yury.norov@gmail.com>
