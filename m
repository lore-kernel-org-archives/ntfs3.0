Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517A805
	for <ntfs3@lists.linux.dev>; Wed, 31 May 2023 18:48:34 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9700219be87so1067137766b.1
        for <ntfs3@lists.linux.dev>; Wed, 31 May 2023 11:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1685558912; x=1688150912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4X30oNDcGuw9SVg09/maVlh6cvqQ6J+4aW32/Zd99o=;
        b=JN5NwAwy6tGgJI9UABktNapr3ikCOFG8l39Yt9iJMRFeGTh9xfZHTa+SrVVUVGmtpe
         qunDYxEB8PuYFguPDk2mmJm0oP3X1+REOBX1c4U1S4cRCGm+B9QrhPFofyPt35QFTQh5
         SLvOUNXj+M7PZaAKVTXTZ9QrBrk1ZNUtIlO60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558912; x=1688150912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4X30oNDcGuw9SVg09/maVlh6cvqQ6J+4aW32/Zd99o=;
        b=i5S9nQ4XDcJRZ5KCCHmAZyt52bDXVEnJ7HWT+nSKj/NeWUx00Mjj6ECRlyVX3uHN4I
         2Ugh0n/ju6L5MGjyYhurXNb89Tj7NOgDfAdjfmG19XjOfwKTdSzm+NyIINDmfuJiMwZ6
         18u9xDSIHNOlmsfiOkne4bqBSUbD6J3iMb6KQKXMEMPh5sZSLpn8YPblNP2XB65Tye+u
         cgE9mrS+vz9x4ckfg7duA6C5rn9uwLx2IVpRPYUnHdy881vceZzNQcH3ux1954q4t10P
         O1qh2IbOBm65RK6NNUxu+VLRw8QVHUp5JQkTgGOUMjQJq0xhYy8cAvNCYmT0dtBzWlL/
         j0PA==
X-Gm-Message-State: AC+VfDwEOtluiD3gOTtAht9upmDyKFuOLYc889+nqceSRODAVEJd3qbz
	X0uthk33KAnXz7A5nemoCamBh8OoVmVFkFJSMcoPsVjM
X-Google-Smtp-Source: ACHHUZ7tAvz9P1FKWhukHdh0h5GwZiDfYGx7y2wTexNZANqbsCzMwguxgaNWFaCnJ+kXU9wtSsddlQ==
X-Received: by 2002:a17:907:6da5:b0:959:919:963d with SMTP id sb37-20020a1709076da500b009590919963dmr5570628ejc.50.1685558912319;
        Wed, 31 May 2023 11:48:32 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709063d6a00b009737b8d47b6sm9265834ejf.203.2023.05.31.11.48.31
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 11:48:31 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5147e8972a1so147931a12.0
        for <ntfs3@lists.linux.dev>; Wed, 31 May 2023 11:48:31 -0700 (PDT)
X-Received: by 2002:a17:907:9609:b0:947:335f:5a0d with SMTP id
 gb9-20020a170907960900b00947335f5a0dmr6616481ejc.62.1685558911012; Wed, 31
 May 2023 11:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000030b7e05f7b9ac32@google.com> <00000000000040020d05fcf58ebf@google.com>
In-Reply-To: <00000000000040020d05fcf58ebf@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 31 May 2023 14:48:14 -0400
X-Gmail-Original-Message-ID: <CAHk-=wjqv_dAd55m31fJk=6FAy1+=556L9y8eAOB92RstWy6_Q@mail.gmail.com>
Message-ID: <CAHk-=wjqv_dAd55m31fJk=6FAy1+=556L9y8eAOB92RstWy6_Q@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in attr_data_get_block (2)
To: syzbot <syzbot+a98f21ebda0a437b04d7@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 12:14=E2=80=AFAM syzbot
<syzbot+a98f21ebda0a437b04d7@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 68674f94ffc9dddc45e7733963ecc35c5eda9efd
>     x86: don't use REP_GOOD or ERMS for small memory copies

That sounds very unlikely.

While we had another similar issue where not using REP_GOOD or ERMS
for user space clearing fixes a bug, that one failed by having
clear_user() oops instead of handling the right exception.

In that case the commit really did fix things, even if it was just by
pure luck, and removing buggy code.

But this one seems to have a failure case that has nothing to do with
exception handling, and I don't think that commit actually fixes any
semantic bug. I suspect the bisection was not entirely repeatable,
and/or might have been timing-dependent, and that the bisection thus
ended up on a random unrelated commit.

               Linus
