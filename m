Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201FD7F
	for <ntfs3@lists.linux.dev>; Sun, 16 Oct 2022 17:54:13 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id u204so4406417vkb.13
        for <ntfs3@lists.linux.dev>; Sun, 16 Oct 2022 10:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xLagLuhXAAsZo/6o2Emxz/ZSpIEdigfb7lVMOngphl0=;
        b=TxX42ZipXJcn2UZsAuh/nEwm5z/0IjcH4MGtyOHmgW7WnrZW4DchYlDQ6R/kDgSZop
         Ujzql9LYLTnvSzXsPRFlia1pS8ZEvNSONYHwZBHkHcxoIr40o48+k8Uc4L94uKlvPqGw
         +tonYFNKG/8J5/uBGZor+KwL/wvkvEacYnVN0qlCIDJDnunxg1OecY5CkqFQOUcDwZFa
         BQghk8kwEUGfdpeEq7tkTozwYWoM5qr7/kN1nTH84OjO+/JFhq+Ptj/uiRZ4yFydwFkO
         bYsnFuQK6qR54KOi1KynTz7AllbPsR0bx6KkBABl36ogQXthG76cxfCrWof3YDTSayBv
         9PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLagLuhXAAsZo/6o2Emxz/ZSpIEdigfb7lVMOngphl0=;
        b=YQu9Hk5nEDZSdck0JUU0AqCVAKnXsN64xs/5i+8o+EsMsDn/3S5SRPpC4Eltjso13M
         putF2hqx6EZ4z7Gl39oXHqiGrYQBUr0hqXBg0t3J4vwKWNp+G7zC2XH6L11Ck7N7jYNI
         ls0b7vi/VUqH5iwZercda/xrLAK75qaZBIP0BgSW1MER0Tqn9X4OhRxhMs0C9e/s3RHS
         5JxyLGAQBRoCEeJPfsWR9ntVzqQlJ1P4EoKGOS+6K1/C0e14KcomTOW04Ez1GRBh2AiW
         L/pTn9TmtY41r0OT6R5nqekusOHNWY1PzAd/y+CAKCtbjClW5QCc4YqJZuffTFtB1OtC
         ujZw==
X-Gm-Message-State: ACrzQf1Q6C/ZX4OhAKzEwaem6+4yoBl6R3cAeFtwU7gZiU3ePuAfB0+z
	pIf3XtrRVRCtC2N45ydqbpb7UmUMN9m6RonTkeCfnq7s/p3GEBA/
X-Google-Smtp-Source: AMsMyM7tugp96Na3GajayUWUWiPITFKaUDY6BonroTSqHZoxkY7mFa8EUXt1I6rAZ6oVhu+OJVo3m2rk8Bqmd2BWAX4=
X-Received: by 2002:a1f:b453:0:b0:3ab:2c49:57df with SMTP id
 d80-20020a1fb453000000b003ab2c4957dfmr2590711vkf.29.1665942852714; Sun, 16
 Oct 2022 10:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Yanfeng Lee <liyafe1997@gmail.com>
Date: Sun, 16 Oct 2022 19:54:03 +0200
Message-ID: <CAFFnA6tgOSsG8EQaHXY_bX_CFuEWw5yEOO387FWPeGYzSv9JQg@mail.gmail.com>
Subject: About ntfs3 with mmap rw
To: ntfs3@lists.linux.dev
Cc: Yanfeng Lee <liyafe1997@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi All,

I found that at this moment, NTFS3 doesn't support mmap write, even
NTFS-3G supports that.

I am considering trying to implement that, but I wonder is any
technical problem here with the write operation of mmap? Because seems
it's not a big deal, if no, I am curious about why is haven't been
supported yet for a long time...

Thanks for all.

Best,
Yanfeng
