Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82130168
	for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 08:56:28 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id d4so3076117lfk.9
        for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RpVCA+HiLct3rjHe6ucM4AvKd8lS1LzE0nTcYyla1JY=;
        b=cPiyNL+7q1dClbwJ+Le6I8CEPAnTMT4V3BmBnqGPpj7r8UjlBX5iV0YSRvzjp+dg4M
         C7JuggpeEuLPrTwBN76kAyR0NoMFn4ZKsnjHlonHyk1v1BjG1wnQQHlm0SteFgZ9bySS
         nGC3qOFWt3Q4NuwEbiPao4pdi4qBJNEwphTs+pnhCr28p6vD5BGkj/dUCCY4isvkf+rj
         01OJv/dtcyCUniQ8QTj4kjrylGOyV4iaXqaLouVJ3/l38uTFAmlTh1VOTIcXaEdMpJcd
         OwqJEB7+ZRsOFlbrT7yMHE8vMdUZthz/+PCUoLsWH3vqio88k1AdC+zBDr07eikcyBYS
         XAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RpVCA+HiLct3rjHe6ucM4AvKd8lS1LzE0nTcYyla1JY=;
        b=D3iuxE71hWW7P0mauHa8TxhWLFbC4RvKZgyBMPFlvjuC7k9ja65yZlOZMfE7zkV5M2
         FVqzLs+xWdQ11t6/mAy5YDjx+BaWTY/ewBLEiqhwK5tO7WXM3QJ+jst0Zmxi8/kvFNm3
         LqFIVkKCK4rPbXnazDgFMFlf2H3Og8+TVCKXmMTjZCUui8LYcCFrc4MCeZUxLGjc7EMj
         0rnmlXqkqe+ajIiZjvEy0zTljJQQCCJYPpPBqeFswmVWGKHQJS6BU3yZ3SLLC9OwKQnZ
         TKMpQ/3IDqUBEedsLG2T4wS9PN/Hg4ZbmqOqHytA0Q15yWyIp6X8dTJwtFurU3MfuDOH
         g65w==
X-Gm-Message-State: AOAM532j2cWy1t5MmzIZWKj0EmLrTmcOyhEI6/b6Ro6SjQB67sWBUhvh
	aGIAo0NJ982PlqcYaNG+dJY=
X-Google-Smtp-Source: ABdhPJwtLrN+Z+wJe7Xq9ADe9v6hoMKOnuILVBbTokrcKt8v3ogCQvfLWzfSBS/4RK91P983kWaCsw==
X-Received: by 2002:a05:6512:3f08:: with SMTP id y8mr5264543lfa.221.1629276986567;
        Wed, 18 Aug 2021 01:56:26 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u20sm200857ljl.76.2021.08.18.01.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 01:56:26 -0700 (PDT)
Date: Wed, 18 Aug 2021 11:56:23 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 1/3] fs/ntfs3: Fix one none utf8 char in source file
Message-ID: <20210818085623.quzdiekdg2y2vj7n@kari-VirtualBox>
References: <20210818010649.412912-1-kari.argillander@gmail.com>
 <20210818010649.412912-2-kari.argillander@gmail.com>
 <20210818053300.GA9165@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818053300.GA9165@lst.de>

On Wed, Aug 18, 2021 at 07:33:00AM +0200, Christoph Hellwig wrote:
> On Wed, Aug 18, 2021 at 04:06:47AM +0300, Kari Argillander wrote:
> > In one source file there is for some reason non utf8 char. But hey this
> > is fs development so this kind of thing might happen.
> 
> Pleaese also refomat these comments while you're at it.  While going
> over 80 characters is ok in exceptions for readability that is per
> definition never the case for a block comment.

Yeah. Totally good option. I already did it and looks lot better.

On Wed, Aug 18, 2021 at 07:23:40AM +0200, Christoph Hellwig wrote:
> On Wed, Aug 18, 2021 at 04:06:46AM +0300, Kari Argillander wrote:
> > In ntfs3 driver there is allocation made like this ntfs_malloc().
> > Patch 2/3 will converter these to kernel ones like kmalloc(). After I
> > did this then checkpatch raise warnings about array allocations so I
> > fix these in patch 3/3.
> > 
> > I also notice when I made patch that there is broken utf8 char so I
> > wanted first fix that because it raised some warning in my editor and
> > did not want to "break" patch 2/3. So patch 1/3 address that. I did
> > try to apply this and it seem to work without issues.
> 
> So this mostly looks sensible, but I still haven't actually seen
> the codebase this applies to posted anywhere as far as I can tell.

Yeah that's true. Only place for mention this is here (link). I have
asked that Konstantin will send patch series v28 to mailing lists. I
will resist resending v4 before Konstantin has sended.
https://lore.kernel.org/ntfs3/a9114805f777461eac6fbb0e8e5c46f6@paragon-software.com/
