Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFD11F956
	for <ntfs3@lists.linux.dev>; Thu, 11 May 2023 14:19:29 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so79959396a12.0
        for <ntfs3@lists.linux.dev>; Thu, 11 May 2023 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683814768; x=1686406768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/W5GB4E38fHdQpL0SzJkoknJdNzqLnuSIkNSr13Ymk=;
        b=RSDHREpAcYSI/HiA9jG4HfyGuqu8emlmGKaiyNbYoEm/449/U+d5jLKr0N3HbDhrFu
         Eq7KapRhjPG9gz+JhbrNON5QWOHN3yZn3bHoLzL5qWlBBfz2D78ujJZOm+lsIYwhz+5Q
         ZKnwi+0oioOzmlbW/9Vvel2zp5TgJ4jM31y74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683814768; x=1686406768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/W5GB4E38fHdQpL0SzJkoknJdNzqLnuSIkNSr13Ymk=;
        b=KP+fyu4ATzIbcucBTfYZEWd7ros7mkQtAFY6m3vqSxuWIzF0GxBEjicMDSdhDd34yk
         IDU1/DCEHl4T/LEqow8RlnX0lNSBo/XpdUJHjlqawr5lahz5n5pfwWfgnEoQoPBGc9O2
         3aslPiDL/puVD5AXQJXCU0fwMtLWJEOi0mXdVz240q2LbFvN32MdFhdpO86pqVnEd1gX
         JW3Q4GhGnIblYj6WPvTXiEoX5tJKLpEeND0SUaxoIm3tsiO0smDsmFbGxV02liniZBsH
         amc2OpCtqmQsKQWw9jTrvWtqoFYVUFArB7Vf+0WIr5M52Uc/g3j04xYWnvR6M+XoHGJF
         6YQw==
X-Gm-Message-State: AC+VfDwqgyPrt8VAZA6cKuOEJqa3X6TCv/bWQ9DUBg8PUZsZMuQCX7bP
	HnnCMNpCzfgEXvEkdpbHxjy3fwA2cXztb2ejEUYq+g==
X-Google-Smtp-Source: ACHHUZ457sXlNUWfYDGBA/6J2ji0qoXIR/pmlJpG6e258uLAIwZ3jVuWNP7DhoJGDAqTT1H1VADUNw==
X-Received: by 2002:a17:907:e91:b0:967:4bc7:38c0 with SMTP id ho17-20020a1709070e9100b009674bc738c0mr12663873ejc.9.1683814767575;
        Thu, 11 May 2023 07:19:27 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id kz23-20020a17090777d700b009659fed3612sm4055386ejc.24.2023.05.11.07.19.26
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 07:19:27 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so79959159a12.0
        for <ntfs3@lists.linux.dev>; Thu, 11 May 2023 07:19:26 -0700 (PDT)
X-Received: by 2002:a17:907:3ea8:b0:953:37d9:282f with SMTP id
 hs40-20020a1709073ea800b0095337d9282fmr18146763ejc.38.1683814766379; Thu, 11
 May 2023 07:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230509030705.399628514@linuxfoundation.org> <20230509080658.GA152864@d6921c044a31>
 <20230509131032.GA8@9ed91d9f7b3c> <2023050913-spearhead-angrily-fc58@gregkh>
 <20230509145806.GA8@df3c0d7ae0b0> <2023051025-plug-willow-e278@gregkh>
 <CAG9oJsnr55Atybm4nOQAFjXQ_TeqVG+Nz_8zqMT3ansdnEpGBQ@mail.gmail.com>
 <2023051048-plus-mountable-6280@gregkh> <CAG9oJskrJotpyqwi6AHVMmhnFmL+Ym=xAFmL51RiZFaU78wv-A@mail.gmail.com>
 <2023051132-dweller-upturned-b446@gregkh> <CAG9oJskf0fE7LiumdzD4QW8dTmGpmVyXBSyiKu_xP+s72Rw44A@mail.gmail.com>
In-Reply-To: <CAG9oJskf0fE7LiumdzD4QW8dTmGpmVyXBSyiKu_xP+s72Rw44A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 11 May 2023 09:19:08 -0500
X-Gmail-Original-Message-ID: <CAHk-=wjJNHjwfrT0X5DvSP3fZzUF0SAbErkc30qAWDW=U9uKtQ@mail.gmail.com>
Message-ID: <CAHk-=wjJNHjwfrT0X5DvSP3fZzUF0SAbErkc30qAWDW=U9uKtQ@mail.gmail.com>
Subject: Re: [PATCH 6.3 000/694] 6.3.2-rc2 review
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, ntfs3@lists.linux.dev, 
	almaz.alexandrovich@paragon-software.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 3:30=E2=80=AFAM Rudi Heitbaum <rudi@heitbaum.com> w=
rote:
>
> I have run 6.1.28-rc2 today, and was able to trigger the error. So
> definitely bad in both 6.3 and 6.1.
>
> [13812.020209] BUG: kernel NULL pointer dereference, address: 00000000000=
00020
> [13812.021322] #PF: supervisor read access in kernel mode
> [13812.022346] #PF: error_code(0x0000) - not-present page
> [13812.023591] PGD 0 P4D 0
> [13812.024876] Oops: 0000 [#1] SMP NOPTI
> [13812.026088] CPU: 5 PID: 20386 Comm: .NET ThreadPool Not tainted 6.1.28=
-rc2 #1
> [13812.027336] Hardware name: Intel(R) Client Systems
> NUC12WSKi7/NUC12WSBi7, BIOS WSADL357.0085.2022.0718.1739 07/18/2022
> [13812.028593] RIP: 0010:ntfs_lookup+0x76/0xe0 [ntfs3]

I suspect this is fixed in mainline by commit 6827d50b2c43 ("fs/ntfs3:
Refactoring of various minor issues") which changed the IS_ERR() check
into a IS_ERR_OR_NULL().

But dropping the original fix from stable might be the right thing to do.

                 Linus
