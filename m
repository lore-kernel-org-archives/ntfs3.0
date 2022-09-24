Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1319617D0
	for <ntfs3@lists.linux.dev>; Sat, 24 Sep 2022 12:03:17 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id h1so2322364vsr.11
        for <ntfs3@lists.linux.dev>; Sat, 24 Sep 2022 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7h3ia+vTGNs24al3PYoERBRlCHGoJd5FZ5bvI2kc6oc=;
        b=I+R+WNpo3kJ8BLJ3dquygRsm1UyjrNBaW51UzxN9clRO5nM5BXqlp/i9N+kBcz5gZ3
         Tx2DI3TQLQMO/1rThIA35GQJAtJnYGhdf2iOwqVg+yXs7ylLZ5356MHIMwebJvxhzGz2
         VKxIMCGCTb/sjPU1sLYofI3i8kK8re1qAlGZpTlTzvWQY2R50YCyHd+QrwBOgvRz2XVx
         9ITMbMacXmEh2FT6rx6vgYeK0s40zN914KLyb4Sho8TzzvH1b18BtI+TQsA+ZemaZdXk
         KIez+stMQ0alsNBn/gLl98puj7sj5hLivIYPoKFNWPq+SaTf9bFpnLT8/c0Gxq5Q7KN9
         MTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7h3ia+vTGNs24al3PYoERBRlCHGoJd5FZ5bvI2kc6oc=;
        b=Mt4zUV+Po9TRlmo5udhMi2ZrkSU7W0K9MRgBcRCmGpNlxOwCHATXvWf4bZR35HUjj3
         ukmCtyLJ/cyDlfAmyFW723PsE0U91Hkow3MDo6LnWEj5gCSs766ItHwlwE93E3gvNSu+
         KZYdKUqTJQrFD7awHRr4ex3rGxm49RU+ZxX/+1cDxq9WhiM6wLkuOyrd8sXHTyS7YdVm
         fOaaHKzEd0kPkqFKOSHS77diVrvTYvnUeTa1+nrrAzwQvr1cO4yCIp1mH5gTCCnDO/g9
         cDn2OlsRH+ygmdJPSYZWaenXzj8jwm9HnOq285j8WoSOTekbQjnSkBy6kkmKO//MQnn9
         7JuQ==
X-Gm-Message-State: ACrzQf2ixyD90cTTAtsCeqprx5f3o4T1gjhNv7n6qvF+bShtMl2LlvbD
	68Bw4zTVmXvNGb9SVYykfEeSAI7ajofSfZ/XsL+r3g==
X-Google-Smtp-Source: AMsMyM6GrzCLMZtBHLSdQTz+cHrM0/jgq25M9vk/gQym7rXDY3T/1JRV7KAfmEdIak2yIHXzbU0a8m7sD5Rdy4IVldQ=
X-Received: by 2002:a67:a202:0:b0:39b:181d:bd20 with SMTP id
 l2-20020a67a202000000b0039b181dbd20mr5000194vse.51.1664020996807; Sat, 24 Sep
 2022 05:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000f8b5ef05dd25b963@google.com> <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
 <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org> <423b1fa6-10fa-3ff9-52bc-1262643c62d9@I-love.SAKURA.ne.jp>
 <CANp29Y7fSsjqKbFiMZDG_w-ERigQOk_6Zw3L9rw5erpP3rRU0g@mail.gmail.com>
 <ea7c00c1-07d7-c23e-80f0-0693016e9731@I-love.SAKURA.ne.jp> <CANp29Y4xHHKXAYFiORACqLHDCmF8XkqQSMy5QfjFSag6UFVojQ@mail.gmail.com>
In-Reply-To: <CANp29Y4xHHKXAYFiORACqLHDCmF8XkqQSMy5QfjFSag6UFVojQ@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Sat, 24 Sep 2022 14:03:05 +0200
Message-ID: <CANp29Y7cBbk8AbLq1z7w_PjQ-2fzG9FNyWyH+aH4oG9hfEm6nw@mail.gmail.com>
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

> > By the way, a possible improvement on "Patch testing requests:" table.
> > Although the "Patch" link showing diff output after applying proposed patch is OK,
> > I'd like to also see a link to original "#syz test:" mail, for the intent of diff
> > (which would be in patch description part if it was a formal patch) is dropped from
> > diff output in the "Patch" link.
>
> Interesting!
> I created an issue to keep track of this:
> https://github.com/google/syzkaller/issues/3392
> The presence of the link will, though, depend on whether the user did
> Cc some public mailing lists while making the patch testing request.

Upd from Dmitry:
https://github.com/google/syzkaller/issues/3392#issuecomment-1256952263

We actually do provide these links, but they're rarely present for the
reason I mentioned above.
