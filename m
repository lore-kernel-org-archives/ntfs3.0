Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E832533F8
	for <ntfs3@lists.linux.dev>; Sun,  3 Jul 2022 19:13:10 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id f14so5541265qkm.0
        for <ntfs3@lists.linux.dev>; Sun, 03 Jul 2022 12:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GxZU3SzyJ8upRz6LCjkJN5ZVBWMWHWnQxWf8ULlGcLQ=;
        b=Giv06WUWxg0fF61PclDJ02DPq/PWJXa0T0WU0T+RhUDp5QfbkXFRV5pSOmduH1+faY
         jpLh+J7/jaKclowQ6H9yT2aCKiVOG+Q0OCXd2u/3eKf9DHoqQVCeC2AwIwOodW+RWFvQ
         5LopDGMRjO+FjT1jDBOjjNr14WWsKV1F/ywBxSk7ZdjsL+G2munj1VAYsSfU9sfgNdR6
         GIDkwpZyk7pLErOvYhRtoR7TYYEL/4CenvRD2IAsIcCcYdD/+VBEzA/Jphnt48bcx6gH
         HR/WhNyJAEY3HlTwXnK3GMNjEKOaHPXPh/eVfXc1lyHAyWzKImpjX+kQUXmBfHWuXS+8
         QMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GxZU3SzyJ8upRz6LCjkJN5ZVBWMWHWnQxWf8ULlGcLQ=;
        b=DO8RtPHR9WEbFk5DwgdA5WlE2ROA1udg6tclwf1qxkYDOrKbhTjM4Se+qYUnrv9G13
         soShNg2ruIYwAxmkks/8PyMr0yPuL1Bb0Dv4fCJKRXbCYw5ZRg55Fk0j4ZuXTVljp0NG
         1fXl7HFW5OboaaQZY1al47esFXcp2WCYSTMdOoBaklEN6y28+/TNTVa0w+0DJw0+9Mk5
         YmrAjNJ/fXsQkoCY2SUAvLdbM8cbXtn8gO6Cm+h8pdC3RRW4SvRLvDZjhIT0IvtWpVab
         59HEafaxMcsqJNhrKYTH3bJOcirkKCjEjgqazvhstLCe/Br5bKbsAZrbWAq0NL+eQ2q7
         Kybw==
X-Gm-Message-State: AJIora8cffjzn/GoUyoFrK5dTPCl6eKrGW5jyEjgt3t7Wj9bW+NsHp0A
	qXKMBU1caiU496W4WN/RHww=
X-Google-Smtp-Source: AGRyM1suCUiGNj2AtGv9qXHAknI0rdQV6COTvbJxhRt90ZLtR45vYIX+UMWLgN5XKi7Wvu+pjWrLOg==
X-Received: by 2002:a37:9447:0:b0:6af:944:8050 with SMTP id w68-20020a379447000000b006af09448050mr18208081qkd.732.1656875589665;
        Sun, 03 Jul 2022 12:13:09 -0700 (PDT)
Received: from localhost (c-69-254-185-160.hsd1.fl.comcast.net. [69.254.185.160])
        by smtp.gmail.com with ESMTPSA id v26-20020ac873da000000b00304dec6452csm18782228qtp.78.2022.07.03.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:13:08 -0700 (PDT)
Date: Sun, 3 Jul 2022 12:13:08 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, agk@redhat.com,
	snitzer@kernel.org, dm-devel@redhat.com, vneethv@linux.ibm.com,
	oberpar@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, almaz.alexandrovich@paragon-software.com,
	linux@rasmusvillemoes.dk, linux-s390@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/4] bitmap: Introduce bitmap_size()
Message-ID: <YsHqRDfCQVwyA2m1@yury-laptop>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <98f5d3d855a9c687ccc035edf62016b02a6876b7.1656785856.git.christophe.jaillet@wanadoo.fr>
 <YsC0GpltMVaCPhkJ@yury-laptop>
 <4dc5d50a-2291-1d3a-efac-3f6378a15d69@wanadoo.fr>
 <YsGz1Xp0RDM5ZhVY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsGz1Xp0RDM5ZhVY@smile.fi.intel.com>

On Sun, Jul 03, 2022 at 06:20:53PM +0300, Andy Shevchenko wrote:
> On Sun, Jul 03, 2022 at 08:50:19AM +0200, Christophe JAILLET wrote:
> > Le 02/07/2022 à 23:09, Yury Norov a écrit :
> > > On Sat, Jul 02, 2022 at 08:29:36PM +0200, Christophe JAILLET wrote:
> 
> ...
> 
> > > This should be dropped, for sure, and kmalloc() at line 128 should be
> > > replaced with bitmap_alloc().
> > 
> > This kmalloc() is for a structure and a flexible array.
> > 
> > You mean re-arranging the code to allocate the structure alone at first,
> > then the bitmap?

We can change struct primes to:
        struct primes {
                struct rcu_head rcu;
                unsigned long last, sz;
                unsigned long *primes;
        };

And then either allocate twice:
        new = kmalloc(sizeof(struct primes);
        new->primes = bitmap_alloc(sz);

Or keep the same struct primes for all expansions, and just allocate
new bitmap for ->primes when needed. This is what I meant.

This a bit deeper rework, but it addresses Andy's concern about excessive
fragmentation. (Did anyone before complain? Is it measurable?)

> It's one way, but it will increase fragmentation of memory. The other one
> as it seems to me is to name a new API properly, i.e. bitmap_size_to_bytes().
>
> In such case you won't need renames to begin with. And then would be able
> to convert driver-by-driver in cases of duplicated code.
> 
> I think that's what confused Yuri and I kinda agree that bitmap_size() should
> return bits, and not bytes. Also argument for pure bitmap_size() would be
> bitmap itself, but we have no way to detect the length of bitmap because we
> are using POD and not a specific data structure for it.

bitmap_size_to_bytes() sounds better. How many places in the kernel
do we have where we can't simply use bitmap_alloc(), and need this
machinery? If this is the only one, I'd prefer to switch it to
bitmap_alloc() instead.

Thanks,
Yury
