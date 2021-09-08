Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398972
	for <ntfs3@lists.linux.dev>; Wed,  8 Sep 2021 09:01:16 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 9so710508edx.11
        for <ntfs3@lists.linux.dev>; Wed, 08 Sep 2021 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CWSESMWDkMfMeRSoL9IsfVXiKU3coRndu8gqx7VGgiY=;
        b=SOKhMxGTz39hIr4b1nClxsKceeoE1sO4WLsCobLRBxuHVeWkLX6g2EtFj15lBGZ3p8
         s+nUJQ03Uc8JPsr3GLGUKjjeQkXFqJUc8WlttAbbDNONyrTqGXpjVa3RXhlyt74xJYL2
         k9Wlg8cXGtpXBY596dHa6rd+ulmoQ0WnKaQQeWoj8sWvXxpm4I+AWJ8ACD3NmwZD6NhP
         T01wF5UkqnWUqOHTj+Zv8C8NzoY7t4cIzIM2Wp2nXDXJ4B8sxO0nYGItE8MBhQCW13H+
         KX/9/cayXbAyRprY/cG84+ocMmV1s5e9dtDxelg9O1yXDwpdoETTL+3VOVjpbSapzj/7
         kk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CWSESMWDkMfMeRSoL9IsfVXiKU3coRndu8gqx7VGgiY=;
        b=fYSY1Z2sDi/f9pI8Gy7D8P1cUT2bmCnDwLuskHtS5Bo2p7wsQ756SKsNWRYVrhNQpl
         NA1JUqdW0HufuwUlRhGr9fLCW3GcwY9OttwWQ1rDWf/TcG99IDY/lNyaCTrgoyWvRRPX
         vO6U5Kbajt5G3D0+1Qn/6yLxqvKeBC9Io1/u9GRYZKI95RRwb3vDeF7x3NqpDbdH/Hsc
         1Vswj7wQXLA8e4J3guEc5mOcXXF/oOWriTltd28xhcYx26Pah2Db4H1LNIao79bmzhJ4
         o2sokxG9jM0lptd414INpLvlKOJRInr4VE9nrlKpf0Okj9BGJVlkxQ2Mqfkh9zvIRZNN
         vgWA==
X-Gm-Message-State: AOAM531nMP8JDf4iDDgSYlbY/UHf/6KlxtrJwFeKGwNYqP/nrjvgNDY1
	GCrkLUrh0oxXkFK6hzM3BhIj7iRsOEfIYHZpVMo=
X-Google-Smtp-Source: ABdhPJyhHIKB4FGHtP3jwCkTR07epcdIGTg6FU/1oyD5wraYT8GY2qS2JF69ii4jNq+94kAnUbsOUIXVdVFH4PXM81M=
X-Received: by 2002:a05:6402:5242:: with SMTP id t2mr2750682edd.240.1631091675019;
 Wed, 08 Sep 2021 02:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829095614.50021-1-kari.argillander@gmail.com>
 <20210907073618.bpz3fmu7jcx5mlqh@kari-VirtualBox> <69c8ab24-9443-59ad-d48d-7765b29f28f9@paragon-software.com>
 <CAHp75Vd==Dm1s=WK9p2q3iEBSHxN-1spHmmtZ21eRNoqyJ5v=Q@mail.gmail.com> <CAC=eVgTwDsE+i3jG+iwZJhFDBXzCyPprRnGk5tjUKXP+Ltrw4w@mail.gmail.com>
In-Reply-To: <CAC=eVgTwDsE+i3jG+iwZJhFDBXzCyPprRnGk5tjUKXP+Ltrw4w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Sep 2021 12:00:38 +0300
Message-ID: <CAHp75VetzFedGyqaB5TmsBH5UjBYpR8rimGmt8scn5fZ4FRbqg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] fs/ntfs3: Use new mount api and change some opts
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 11:47 PM Kari Argillander
<kari.argillander@gmail.com> wrote:
> On Tuesday, September 7, 2021, Andy Shevchenko
> (andy.shevchenko@gmail.com) wrote:
> > On Tuesday, September 7, 2021, Konstantin Komarov <almaz.alexandrovich@paragon-software.com> wrote:
> >> On 07.09.2021 10:36, Kari Argillander wrote:

...

> >> Yes, everything else seems good.
> >> We tested patches locally - no regression was
> >
> > The formal answer in such case should also contain the Tested-by tag. I would suggest you to read the Submitting Patches document (available in the Linux kernel source tree).
>
> He is a maintainer so he can add tags when he picks this up.

It's a good practice to do so. Moreover, it's better to do it
patch-by-patch, so tools like `b4` can cope with tags for *anybody*
who will use it in automated way.

> This is not
> really relevant here.

Why not?

> Yes it should be good to include that but I have already
> sended v4 which he has not tested. So I really cannot put this tag for him.
> So at the end he really should not even put it here.

For v4 I agree with you.

> Also usually the maintainers will always make their own tests and usually
> they will not even bother with a tested-by tag.

If it's their own code, yes, if it's others', why not? See above as well.

> Or do you say to me that I
> should go read Submitting Patches document as I'm the one who submit
> this?

It's always good to refresh memory, so why not? :-)

-- 
With Best Regards,
Andy Shevchenko
