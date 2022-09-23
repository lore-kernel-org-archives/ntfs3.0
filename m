Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756993C05
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 11:58:30 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id j17so13439304vsp.5
        for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 04:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QeQ7A4/9L+jEYAB7JYehSX041AgzGfugJpwYzn3Do9w=;
        b=VquBpd+zr50F8AZS1TFzN1h5qDzc9WwVKODyal6EIJnH4X+/1gwiBObkfNpNRSEMG9
         KSaeUgxbA+liR8gK2VrcRrCXWMvWfBUGMgIKV5hNJSCzUu06XDr1y45DAdH4CsdUfQpj
         7AzRKSqiPK5Dg3vYt/iyOssCnuU5vBqxce+PAEOJZblV0YapdYwk5XX2MxDFc68uu1j0
         O3q72XiOZ4pijjM4e7SXtPKyr7RwWbP3IwHe2MZmWQiZUSeLgqF90DDKvOSwQmrxRcpe
         NCcgEwc0Stxhd6DtszFOHvua7Qm9vR+eqShUyTkvsY9uZZjFyx8+r0EKTASKu6aOH379
         OaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QeQ7A4/9L+jEYAB7JYehSX041AgzGfugJpwYzn3Do9w=;
        b=4mXbcP2Gw0diOZB9LNRmAkg7ydeCDUFzW1eRc4aOF0NSD09xVWHCwnbhAGV6phnBpi
         pBjiTa8s++ecsqTqrjPkxWs+dhAx+tENVIaOb1BQKIBFTq0FxmUrKvcHoeQpcKzBLZ1O
         upRLzQX4bELljqBtvJlTQobBMH1VqS9LUtNQPvy3BOfGNAj4uoyc2mc0RWFWqWiXz54f
         QYEh0y2wxIKzuc6J6TO2Av4zoiWFKtqAGshBJnJL47POaHT0/61mAe7lno2G4SBqJJQM
         eg80SfaCZLKOqM3G+Le42QzGMCyVhx5ES7sKMa/+Mg0u0C2UQaANxUVA0RgokH4HKGdu
         YMsg==
X-Gm-Message-State: ACrzQf1Kc66rImfWFs9Nvx1l6muJWU/kQlcV2L14kgmHyhCg90Rlxntx
	8ujPbupkctiaFACzLS+mfKfQhQZIOMiyQtJWiKzYHw==
X-Google-Smtp-Source: AMsMyM4wNBgRFhR9QN2CLs+N2DMAyXkeajMXUi7qhlHpVLRsXH+CQLu+0IC3/E+9n3rhEt1e/aLHqj9Lz4KjioPoAuQ=
X-Received: by 2002:a67:a202:0:b0:39b:181d:bd20 with SMTP id
 l2-20020a67a202000000b0039b181dbd20mr3110464vse.51.1663934309305; Fri, 23 Sep
 2022 04:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000f8b5ef05dd25b963@google.com> <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
 <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org> <423b1fa6-10fa-3ff9-52bc-1262643c62d9@I-love.SAKURA.ne.jp>
In-Reply-To: <423b1fa6-10fa-3ff9-52bc-1262643c62d9@I-love.SAKURA.ne.jp>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 23 Sep 2022 13:58:18 +0200
Message-ID: <CANp29Y7fSsjqKbFiMZDG_w-ERigQOk_6Zw3L9rw5erpP3rRU0g@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: fix negative shift size in true_sectors_per_clst()
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Shigeru Yoshida <syoshida@redhat.com>, Dmitry Vyukov <dvyukov@google.com>, 
	syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>, 
	"'Aleksandr Nogikh' via syzkaller-bugs" <syzkaller-bugs@googlegroups.com>, ntfs3@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tetsuo,

Thank you very much for providing the feedback!

On Fri, Sep 23, 2022 at 3:26 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2022/09/23 9:38, Randy Dunlap wrote:
> > I slightly prefer the earlier patch:
> >
> > https://lore.kernel.org/all/20220823144625.1627736-1-syoshida@redhat.com/
> >
> > but it appears that the NTFS3 maintainer is MIA again. :(
> >
>
> Shigeru Yoshida posted a patch against https://syzkaller.appspot.com/bug?extid=35b87c668935bb55e666
> and I posted a patch against https://syzkaller.appspot.com/bug?extid=1631f09646bc214d2e76 .
> We didn't realize that these are the same problem.
>
> It seems that sending to not only syzbot+XXXXXXXXXXXXXXXXXXXX@syzkaller.appspotmail.com
> but also syzkaller-bugs@googlegroups.com is required for proposed patches to be recorded
> (in order to avoid duplicated works) into a page linked from "Status:" in each bug page.

We do have plans to start inspecting LKML messages for the patches
that mention syzbot-reported bugs. It will be possible then to display
them all on the bug page and somehow mark bugs with a PATCH sent on
the list.

>
> Since https://syzkaller.appspot.com/upstream does not have a column for tracking intermediate
> status between "Open" and "Fixed" (e.g. cause identified, patch proposed) because it can take
> long time until patches are accepted into one of git trees syzbot is tracking, we need to
> utilize "Last activity" in the list page and a page linked from "Status:" in each bug page.
> Time to boost priority for implementing user-supplied comment column (e.g. "#syz memo:" command)
> to each bug?

And then syzbot should just display all such received comments on the
bug's web page, right?

--
Best Regards,
Aleksandr

>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/423b1fa6-10fa-3ff9-52bc-1262643c62d9%40I-love.SAKURA.ne.jp.
