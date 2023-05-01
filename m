Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC89233E6
	for <ntfs3@lists.linux.dev>; Mon,  1 May 2023 18:50:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so2592868a12.1
        for <ntfs3@lists.linux.dev>; Mon, 01 May 2023 11:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682967014; x=1685559014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJsDytAkzpo1N72CvaRaEHpBmg/KeBVFFxmvg3mMNXA=;
        b=adBwuu89iCtYiMyq/Oqh8jtUUMQ30inGM2uqK/ZHob/SJ4G1/fYcRRHlo3Ur28aqjG
         7Bbs3fkzZ+xptL3cAD+rvmD2wBUaCCGlfQXnvpatD4jFv4WpOqtMZdzS3wmt7gma7jsF
         Zjkw9PDgEj0xOgyf3JGDXm48Y2XoOEnOGDaBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682967014; x=1685559014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJsDytAkzpo1N72CvaRaEHpBmg/KeBVFFxmvg3mMNXA=;
        b=QJYlyvWoXcEgqbVwl/pPFQvZcvhNJIgu2Qvk1kvSSwJrM9ec2T+y/9DuB1DssqrM0v
         w+vIUgSbpg/TRI0qLWBBeuEIVu8a5yKNWbno12rH4puKIZ51cLXyq9qfP9K+zgaVor3i
         xFSTH/M/CaLT9spdF85UaRRMQV1jBxpTxr05RfrUwTE6GjGsw89C7CRx2IblmTi2ciY4
         OApspIadvl7vaawzCIwLWlDTiTZU8NBA+3YM807zhctQ3GysYK4r6x0nlcs40CX42zpR
         qmFaCeSukKWu90ZPeZo2A94SDGSeboNP40f8P1MQx+F054UrNND7FjLboov+roTerOlx
         JMXA==
X-Gm-Message-State: AC+VfDxQB3ZdxzdGVS5aNoKnCTMcp0QryLHStqWvnSc0ChuMjSLYdFvR
	LMXJgQ0seF32yrnQA56bEITKmTPGXq/Sd6PlZMDfmg==
X-Google-Smtp-Source: ACHHUZ6IAosZqCJEim6J5/tWDmL95sCPkk2bnmq0U62mW79fc2bDCTi6sPdUIidumDajDPJPIZatyg==
X-Received: by 2002:aa7:df84:0:b0:506:bd01:114d with SMTP id b4-20020aa7df84000000b00506bd01114dmr5806224edy.34.1682967014666;
        Mon, 01 May 2023 11:50:14 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id g18-20020a056402181200b004c2158e87e6sm12266607edy.97.2023.05.01.11.50.12
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 11:50:13 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so2592754a12.1
        for <ntfs3@lists.linux.dev>; Mon, 01 May 2023 11:50:12 -0700 (PDT)
X-Received: by 2002:aa7:d8cb:0:b0:50b:cff8:ff1f with SMTP id
 k11-20020aa7d8cb000000b0050bcff8ff1fmr310706eds.42.1682967012421; Mon, 01 May
 2023 11:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000de34bd05f3c6fe19@google.com> <0000000000001ec6ce05fa9a4bf7@google.com>
In-Reply-To: <0000000000001ec6ce05fa9a4bf7@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 1 May 2023 11:49:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whWUZyiFvHpkC35DXo713GKFjqCWwY1uCs3tbMJ6QXeWg@mail.gmail.com>
Message-ID: <CAHk-=whWUZyiFvHpkC35DXo713GKFjqCWwY1uCs3tbMJ6QXeWg@mail.gmail.com>
Subject: Re: [syzbot] [xfs?] BUG: unable to handle kernel paging request in clear_user_rep_good
To: syzbot <syzbot+401145a9a237779feb26@syzkaller.appspotmail.com>, 
	Borislav Petkov <bp@suse.de>, stable <stable@vger.kernel.org>
Cc: almaz.alexandrovich@paragon-software.com, clm@fb.com, djwong@kernel.org, 
	dsterba@suse.com, hch@infradead.org, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[ Added Borislav and stable people ]

On Sun, Apr 30, 2023 at 9:31=E2=80=AFPM syzbot
<syzbot+401145a9a237779feb26@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:

Indeed.

My initial reaction was "no, that didn't fix anything, it just cleaned
stuff up", but it turns out that yes, it did in fact fix a real bug in
the process.

The fix was not intentional, but the cleanup actually got rid of buggy code=
.

So here's the automatic marker for syzbot:

#syz fix: x86: don't use REP_GOOD or ERMS for user memory clearing

and the reason for the bug - in case people care - is that the old
clear_user_rep_good (which no longer exists after that commit) had the
exception entry pointing to the wrong instruction.

The buggy code did:

    .Lrep_good_bytes:
            mov %edx, %ecx
            rep stosb

and the exception entry weas

        _ASM_EXTABLE_UA(.Lrep_good_bytes, .Lrep_good_exit)

so the exception entry pointed at the register move instruction, not
at the actual "rep stosb" that does the user space store.

End result: if you had a situation where you *should* return -EFAULT,
and you triggered that "last final bytes" case, instead of the
exception handling dealing with it properly and fixing it up, you got
that kernel oops.

The bug goes back to commit 0db7058e8e23 ("x86/clear_user: Make it
faster") from about a year ago, which made it into v6.1.

It only affects old hardware that doesn't have the ERMS capability
flag, which *probably* means that it's mostly only triggerable in
virtualization (since pretty much any CPU from the last decade has
ERMS, afaik).

Borislav - opinions? This needs fixing for v6.1..v6.3, and the options are:

 (1) just fix up the exception entry. I think this is literally this
one-liner, but somebody should double-check me. I did *not* actually
test this:

    --- a/arch/x86/lib/clear_page_64.S
    +++ b/arch/x86/lib/clear_page_64.S
    @@ -142,8 +142,8 @@ SYM_FUNC_START(clear_user_rep_good)
            and $7, %edx
            jz .Lrep_good_exit

    -.Lrep_good_bytes:
            mov %edx, %ecx
    +.Lrep_good_bytes:
            rep stosb

     .Lrep_good_exit:

   because the only use of '.Lrep_good_bytes' is that exception table entry=
.

 (2) backport just that one commit for clear_user

     In this case we should probably do commit e046fe5a36a9 ("x86: set
FSRS automatically on AMD CPUs that have FSRM") too, since that commit
changes the decision to use 'rep stosb' to check FSRS.

 (3) backport the entire series of commits:

        git log --oneline v6.3..034ff37d3407

Or we could even revert that commit 0db7058e8e23, but it seems silly
to revert when we have so many ways to fix it, including a one-line
code movement.

Borislav / stable people? Opinions?

                         Linus
