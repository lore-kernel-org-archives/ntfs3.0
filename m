Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A115AD
	for <ntfs3@lists.linux.dev>; Sun, 15 Oct 2023 02:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDbRRAzT"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a7af20c488so41009687b3.1
        for <ntfs3@lists.linux.dev>; Sat, 14 Oct 2023 19:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697336409; x=1697941209; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzmAztgi6ecB7UaqCGob459y4GhttsIKx/RrP9U9cpE=;
        b=RDbRRAzTCIIKyr/x3OG8pXvtnLrIJzP5CZJF3/MrrAyFTN+9PIPfcYQ97YFWblMAyq
         V99a6Z+2TxGs3bx7lEDeZGA4UchGSy0rWoPGKtva7r3/MI9nRnSsKvTeVoRifUFMQG3d
         UKVGwU7yLge2nr8rOMvHIDVv1q8YtgJMGDdJEEBI45+BtU9DtHEjb2om9H+txgjb0bMW
         UsUl44zX2/3EyiKvQXQjqceKD/WddYTNQ3yoyaa/yc7ykHhMYSFKdVtWA954Q29VO5OE
         f+7VHxMveSHZqYdNeGHiGcpalfRIdZw2KczvwEr1/5wOYb9XP2LmOi3UsBILPR8Rw7Cx
         mRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697336409; x=1697941209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzmAztgi6ecB7UaqCGob459y4GhttsIKx/RrP9U9cpE=;
        b=LOPvmvSL31OU5nzFGwvP9gEe3lejJvahIrsLDN+cbSIJ0EhYZPp1LZqmR2IzkpBOUQ
         pz2hflaK51bnqDzjnn5hFqKGcKzvxbpQE/lWW6HuinzotR14K780zCFNXomZ3FvEWKZ2
         L9VbWqqLoyS1OA74/zxOn1ykNn2b+GODgr5x6ey1JCEvwGHfvKgbaflwLo/n9qdPWuCa
         B//LZTXNuUkMj5qwh9Z8hNUwbRWbSMYWsI3gOuUw4yZKynwSPsZMUmzVjZBEQ06q4MBW
         BNXbpMwWQ3+ruRZi7JKy1aAtweYAwijbxP/5RrR4XkV+TePBldN0fXOErRKRf1nfXg9D
         hBCA==
X-Gm-Message-State: AOJu0YwkL94PNriTWVvJ7w5KOi0WqjAAF+YEDMOpVLzEANXTTq2Qrv3F
	TcH6qjQqnAF12pbQTD5mRa4=
X-Google-Smtp-Source: AGHT+IGkOEjO+bGWWFCarw0RLmOk68tVCv/6p3H378i9MP3Ve1TWkdNvsdbRXDgjuLQXDGyqdxhtJg==
X-Received: by 2002:a05:690c:257:b0:5a7:b51a:e176 with SMTP id ba23-20020a05690c025700b005a7b51ae176mr14718261ywb.12.1697336408657;
        Sat, 14 Oct 2023 19:20:08 -0700 (PDT)
Received: from localhost ([2607:fb90:3e2c:8023:e145:ae9d:cf98:1574])
        by smtp.gmail.com with ESMTPSA id z193-20020a0dd7ca000000b005a8073e2062sm1025954ywd.33.2023.10.14.19.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 19:20:08 -0700 (PDT)
Date: Sat, 14 Oct 2023 19:20:07 -0700
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
	linux-btrfs@vger.kernel.org, dm-devel@redhat.com,
	ntfs3@lists.linux.dev, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/14] bitmap: extend bitmap_{get,set}_value8() to
 bitmap_{get,set}_bits()
Message-ID: <ZStMV46v4EkoUHE8@yury-ThinkPad>
References: <20231009151026.66145-1-aleksander.lobakin@intel.com>
 <20231009151026.66145-10-aleksander.lobakin@intel.com>
 <ZSQq02A9mTireK71@yury-ThinkPad>
 <a28542e2-4a5b-4c29-9d4a-12a0d2ab5527@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a28542e2-4a5b-4c29-9d4a-12a0d2ab5527@intel.com>

On Wed, Oct 11, 2023 at 11:33:25AM +0200, Alexander Lobakin wrote:
> From: Yury Norov <yury.norov@gmail.com>
> Date: Mon, 9 Oct 2023 09:31:15 -0700
> 
> > + Alexander Potapenko <glider@google.com>
> > 
> > On Mon, Oct 09, 2023 at 05:10:21PM +0200, Alexander Lobakin wrote:
> >> Sometimes there's need to get a 8/16/...-bit piece of a bitmap at a
> >> particular offset. Currently, there are only bitmap_{get,set}_value8()
> >> to do that for 8 bits and that's it.
> > 
> > And also a series from Alexander Potapenko, which I really hope will
> > get into the -next really soon. It introduces bitmap_read/write which
> > can set up to BITS_PER_LONG at once, with no limitations on alignment
> > of position and length:
> > 
> > https://lore.kernel.org/linux-arm-kernel/ZRXbOoKHHafCWQCW@yury-ThinkPad/T/#mc311037494229647088b3a84b9f0d9b50bf227cb
> > 
> > Can you consider building your series on top of it?
> 
> Yeah, I mentioned in the cover letter that I'm aware of it and in fact
> it doesn't conflict much, as the functions I'm adding here get optimized
> as much as the original bitmap_{get,set}_value8(), while Alexander's
> generic helpers are heavier.
> I realize lots of calls will be optimized as well due to the offset and
> the width being compile-time constants, but not all of them. The idea of
> keeping two pairs of helpers initially came from Andy if I understood
> him correctly.
> What do you think? I can provide some bloat-o-meter stats after
> rebasing. And either way, I see no issue in basing this series on top of
> Alex' one.

You're right, let's try both and see what how worse is one comparing
to another wrt bloat-o-meter and overall code generation. If the
difference is not that terrible, I'd stick to universal and simpler
for users version.

If the difference is significant, we'd have to keep both. Maybe it's
worth to try merge the aligned case into generic one, but it's not the
purpose of your series, of course.

Thanks,
Yury
