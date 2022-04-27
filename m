Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914373D60
	for <ntfs3@lists.linux.dev>; Wed, 27 Apr 2022 17:47:41 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id y32so4457312lfa.6
        for <ntfs3@lists.linux.dev>; Wed, 27 Apr 2022 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dCDyVJYCpFQImgtQWb5hjJokeHveyyypu0o328met1M=;
        b=bX0kfr9ZKjmeVebBzzle/1Y0lDXA3NfuBVKuDcUwqe1WBFhgB7r7/yboqLx3/q7q16
         gMArz3ke2tONs167vKwStCJkd27HOkgX4g/fRP6CcpZ4LiNB/ShaMKlhUcDKSWGi/sta
         Z5ao+qL0GzQxXj+9/B/q5VGt4MlcBLT/5xKqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCDyVJYCpFQImgtQWb5hjJokeHveyyypu0o328met1M=;
        b=40ZgH16UaulsSde+zU3GnrXPBRu3J51zI4y4ZUd/Hs6FqcekePwu2JbkaWMNXs8DSs
         pa93y1dDn4t6p5fNKJnI0hUtKQSGUMz/xtuVgzrIT6ShfFJzd9FQMFYkh/z6x2B4tPsj
         /nFofwZaEkIPKM6hzUzA/ND0KrVArSkBxO4HbHL3BkayrR9kJsevh7L6nDjsZwmP7y0c
         nMrMUg9EnH5cDIkAMcC05yqDU9AmcMN5DHN/dmDgRXI7GzdFgG2nVuadrOgnafsVqZH1
         IK/SnsXByv7dimiZsRaNpB5t/YNrOjnXpdd8BfOaL1sT+xkvs8YPkDGY0k1M/UjistmP
         iwKQ==
X-Gm-Message-State: AOAM531URZddtXRSRPYVoQSYi5eZhCH3uW4LkX1rSAvKkh+kZGmy5t24
	/ivAXN2RH1CloPaiaqWXkh/m4gijQCl3bSToV6k=
X-Google-Smtp-Source: ABdhPJyO5BGwnjoHz4MjLkd9YOu/GRJvgRCP2iqePk7v1hO53K/dhz3gaHZoATOkPyWInE1kERpLzQ==
X-Received: by 2002:a05:6512:2528:b0:472:b68:6dab with SMTP id be40-20020a056512252800b004720b686dabmr10183479lfb.426.1651081658707;
        Wed, 27 Apr 2022 10:47:38 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id p41-20020a05651213a900b00443fac7d6ffsm2116389lfa.108.2022.04.27.10.47.33
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 10:47:35 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id v1so3656629ljv.3
        for <ntfs3@lists.linux.dev>; Wed, 27 Apr 2022 10:47:33 -0700 (PDT)
X-Received: by 2002:a2e:8245:0:b0:24b:48b1:a1ab with SMTP id
 j5-20020a2e8245000000b0024b48b1a1abmr18519334ljh.152.1651081653043; Wed, 27
 Apr 2022 10:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <da20d32b-5185-f40b-48b8-2986922d8b25@stargateuniverse.net>
In-Reply-To: <da20d32b-5185-f40b-48b8-2986922d8b25@stargateuniverse.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Apr 2022 10:47:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihuvzVTozzNLZT=uFzJH6uM7ZNKN7fYVpm0v2KkY6Jxg@mail.gmail.com>
Message-ID: <CAHk-=wihuvzVTozzNLZT=uFzJH6uM7ZNKN7fYVpm0v2KkY6Jxg@mail.gmail.com>
Subject: Re: NTFS3 driver is orphan already. What we do?
To: Kari Argillander <kari.argillander@stargateuniverse.net>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	"Theodore Ts'o" <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>, 
	Eric Biggers <ebiggers@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	Christian Brauner <christian.brauner@ubuntu.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[ Sad state of affairs mostly edited out ]

On Tue, Apr 26, 2022 at 2:22 AM Kari Argillander
<kari.argillander@stargateuniverse.net> wrote:
>
> I also did suggest that I could co maintain this driver to take burden from
> Konstantin, but haven't got any replay.

If you are willing to maintain it (and maybe find other like-minded
people to help you), I think that would certainly be a thing to try.

And if we can find *nobody* that ends up caring and maintaining, then
I guess we should remove it, rather than end up with *two* effectively
unmaintained copies of NTFS drivers.

Not that two unmaintained filesystems are much worse than one :-p

           Linus
