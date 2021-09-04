Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D443FC1
	for <ntfs3@lists.linux.dev>; Sat,  4 Sep 2021 17:34:33 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id t19so4781531lfe.13
        for <ntfs3@lists.linux.dev>; Sat, 04 Sep 2021 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X1/lHCDC58EpZAP3lSL5HIsZ7t+vVs/gedrU1qbfjC0=;
        b=g5E0A7pKVAwqmS28GONd127aSSuVA2rRCo0KFjrdmCpo6rlWVPKyBE1s+a1I99PChg
         pjdcRsvnYRVw/J0kgR4KTYtC7JHVyybTqboHqN+10p/hmcbHYK/1Q7FFPkYWSLmMWBLR
         6+tIcgDsIrGGM3fiRmY2IlkJv2zcOqPBLJ1BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X1/lHCDC58EpZAP3lSL5HIsZ7t+vVs/gedrU1qbfjC0=;
        b=WKyKUWLf8ZEuMjvfIxyUrS4l3DAY75FG4WMq9iZ7rOcISW50kBNDsueBGxlCx/hJ72
         /wv5oOPL8QY8GdKNWiQI2PMBP+sA0JxeMyKTgwxaKuEyY7C8DULN7T92+YmyXHeVE8wN
         NdAYW/2oSpxf3gZ/9dAsfZi/ivev7qlDheLrcMvWl68+3ZFl158++CvwOhYTrWH6hTma
         7IYUAgvsDEMZht0i7Jvpr4M5f5RK16V0KRfegiILigwIJDu3Mg/aVgbMtEUiV7KXSnnU
         o7f/jBAj+x1H+K6pi1mPUkkX+lI5MXOqBNbWXI5+Y6kjhxTK2Z7h8Glqr31jRZ7VbmDl
         PHMA==
X-Gm-Message-State: AOAM530tKgt0I1VlzLki7j0597sCPYmr1tshbgyIpiaWj0dv8H0o0vyE
	f4eY/nHJtaNbRq5a1vPgMBBI4Xz/IDnSb4PB
X-Google-Smtp-Source: ABdhPJyRzi27baLRNcRuzE0ThFEvMYyy36qHJL1P29sgKab3BEZ4xkp28aO3KL14rP3XSyW63Rux3w==
X-Received: by 2002:ac2:523b:: with SMTP id i27mr3491630lfl.678.1630776871512;
        Sat, 04 Sep 2021 10:34:31 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id r67sm290870lff.31.2021.09.04.10.34.30
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 10:34:30 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id f18so4788465lfk.12
        for <ntfs3@lists.linux.dev>; Sat, 04 Sep 2021 10:34:30 -0700 (PDT)
X-Received: by 2002:a05:6512:3987:: with SMTP id j7mr3646341lfu.280.1630776870597;
 Sat, 04 Sep 2021 10:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aa4aa155-b9b2-9099-b7a2-349d8d9d8fbd@paragon-software.com>
In-Reply-To: <aa4aa155-b9b2-9099-b7a2-349d8d9d8fbd@paragon-software.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 Sep 2021 10:34:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFAkqwGSNXqeN4KfNwXeCzp9-uoy69_mLExEydTajvGw@mail.gmail.com>
Message-ID: <CAHk-=whFAkqwGSNXqeN4KfNwXeCzp9-uoy69_mLExEydTajvGw@mail.gmail.com>
Subject: Re: [GIT PULL] ntfs3: new NTFS driver for 5.15
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 8:19 AM Konstantin Komarov
<almaz.alexandrovich@paragon-software.com> wrote:
>
>   https://github.com/Paragon-Software-Group/linux-ntfs3.git master

Oh, I didn't notice this until now, as I was lining up to actually pull this.

I probably forgot to say this originally:

For github accounts (or really, anything but kernel.org where I can
just trust the account management), I really want the pull request to
be a signed tag, not just a plain branch.

In a perfect world, it would be a PGP signature that I can trace
directly to you through the chain of trust, but I've never actually
required that.

So while I prefer to see a full chain of trust, I realize that isn't
always easy to set up, and so at least I want to see an "identity"
that stays constant so that I can see that pulls come from the same
consistent source that controls that key.

(We've also had situations where the chain of trust just didn't exist
_yet_, but then later on it can be established as a developer ends up
becoming more integral in the community)

Signed tags are easy to use - the hardest part is having any pgp key
setup at all, then git makes using the keys trivial with "git tag -s
.."

              Linus
