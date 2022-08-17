Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110CE7463
	for <ntfs3@lists.linux.dev>; Wed, 17 Aug 2022 21:55:56 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id w3so19224125edc.2
        for <ntfs3@lists.linux.dev>; Wed, 17 Aug 2022 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kEu3LoPnwB+E9uQr3yvAY75tc6MJOyqDhxfB70KSfNQ=;
        b=T0msTuPhx1VfnQd74B08rOH2exZjqLNW3BuxKYcVBR5qhseNUY9XMELlXRFDvhrxoJ
         bEafhlfHAxOLps/yKbluH4hwDq0ekhNmANb6lKeJsYf00OMickttnHUIVACROCoCNhBh
         Bm93sJt54QVLsKi/DqcQHvTmze8JXzUNAFb0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kEu3LoPnwB+E9uQr3yvAY75tc6MJOyqDhxfB70KSfNQ=;
        b=UG3KH7AYD4HGTdy7BAi26xjr7Ec3ZyOAwuVAnx3+hGHpJBFXZcWMNjHKi1JcE1HGso
         8hypz/gD7kVerER5hab8wl8bxwRZAl9uk4+OBZNIfwSa3IMSrpsQrte9nRwZGp62t2f7
         0yDxCRhVLTjsMKNEbNYwj8BCy1fZ8TWWT+0IN45KbSQbW4qmEiOZgeBWlQkmbNphYvLH
         8/Ozdjy1zXmViTfnDh1nzwLYnas+Tmz7r2hQo23lgO6O1oQnSKN2j/KlCFHr6F7O2mFN
         7VBMpoLW3ApfzYgrTo+i9j6xwnXOl+vHSjvo0fxjbsy76vAbEvJJ3xEW5ZIej+RY4R7G
         JCFQ==
X-Gm-Message-State: ACgBeo2oFbJvppeXpJ7Q/co6Bjm7hXzD/2dmoJNCb1f0Epq0G5+qs+ct
	DX0ipjSz9YpFw/Qdtbm6dIgis4D/mXDROSmU
X-Google-Smtp-Source: AA6agR7M5jqvp4x0eu5Q840inSHIZhH9p9JaRSc5mI1vgTudpFum3ueIHdWY4mkzwGeqTa8QtN/dJw==
X-Received: by 2002:a05:6402:35c:b0:43c:8f51:130 with SMTP id r28-20020a056402035c00b0043c8f510130mr52936edw.393.1660773355041;
        Wed, 17 Aug 2022 14:55:55 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id ov14-20020a170906fc0e00b007311eb42e40sm7353540ejb.54.2022.08.17.14.55.54
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 14:55:54 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id h24so3573105wrb.8
        for <ntfs3@lists.linux.dev>; Wed, 17 Aug 2022 14:55:54 -0700 (PDT)
X-Received: by 2002:a5d:6248:0:b0:222:cd3b:94c8 with SMTP id
 m8-20020a5d6248000000b00222cd3b94c8mr26766wrv.97.1660773354188; Wed, 17 Aug
 2022 14:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <db8cb5d9-56d6-a00a-9cf0-4deec9056433@paragon-software.com>
In-Reply-To: <db8cb5d9-56d6-a00a-9cf0-4deec9056433@paragon-software.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 17 Aug 2022 14:55:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg53xW_ppC5w_tDvWKn3Q7i-hWmd09KM-O1npQHWoBBGw@mail.gmail.com>
Message-ID: <CAHk-=wg53xW_ppC5w_tDvWKn3Q7i-hWmd09KM-O1npQHWoBBGw@mail.gmail.com>
Subject: Re: [GIT PULL] ntfs3: bugfixes for 6.0
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 17, 2022 at 9:43 AM Konstantin Komarov
<almaz.alexandrovich@paragon-software.com> wrote:
>
> Please pull this branch containing ntfs3 code for 6.0.

This really should have come in during the merge window.

Yes, there are clearly several fixes in here, but at least that
FALLOC_FL_INSERT_RANGE is clearly new development. And a lot of it
looks like just refactoring and cleanup, and again that is something
that should come in during the merge window.

But since this all affects only ntfs3, and I consider that still
fairly solidly experimental, I'll let it slide. But please keep this
in mind for next time - new work (whether cleanups or actual new code)
during the merge window, and obvious fixes afterwards.

                Linus
