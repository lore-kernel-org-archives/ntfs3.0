Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB562F28
	for <ntfs3@lists.linux.dev>; Sun, 16 Oct 2022 19:24:33 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id e22so3661900uar.5
        for <ntfs3@lists.linux.dev>; Sun, 16 Oct 2022 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvvSZ8hsOA/vFzPRXp8Ur1kFSiGHX0IPD62X46Ug/W0=;
        b=FMxYv+0mkVafL9t5eVpd+lG07WVADfCFQycld1sA3E+XYdwPOR4UToL/KnYyMYHjhX
         QMO+FhEwDgsRcTxQwZe7bZ+hzbNDhf4y0VZYVgSBV7omOyVcOXnc7MJBcxEWCS/70jdt
         KL7vAkaUIokzMusLfclgl04f9AckpHbdQFoa2EEjIY/tAf5V67efv3mjrCtQH/HE50gt
         lO+ERVraCjc9JUqFufilzYvzi7oKQre3NOOmRZ0vhWP+zBFLI8L+O81znqjkHYzl5fEC
         RTFOGYZt0AwGE6GKUd80UcSAv454oTooEUF6jp8BVtwlZZpFhGpzMNkWUPf+OOMZAKU6
         FjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvvSZ8hsOA/vFzPRXp8Ur1kFSiGHX0IPD62X46Ug/W0=;
        b=lJ8RzhX4NNt5JTZtsaBboiBW5DEgmplfjQOjAgwYnDnBEoKJsXTtixrq0PAaxbe9nL
         LJXhS+YMyC4PT2qD24TtM6wRp94681tT5UGunRq++sIMu8YKiXV1bC/JetKyubfl/bbx
         zHVg2k6kbXjfMgEnkdfuxChNUc5LyRrmx8TRGdwyUj9WF4y6iDhtiAPuMfS0OjgFZElG
         gEfOC3Eif1e4/nsJ8rImavwtDM7zO/WZuZ3Kx28TjICaV+d0impegdhrMfmaPR3Zwu1b
         S0hxVHrCeuR1vVgSqWYd0fXigdS2fOmpKSrPXH/mnb0RwStmcYDJlFVt3gmyivkshfBj
         YShA==
X-Gm-Message-State: ACrzQf2Bz75+TF398WmFpBdtRiSlxcthgyes/cu9AKyi98jxm2ifRN5V
	iBqBMU9Q6C3g94mPTU4pFG74hHAWBbLJL4Rw7PnQNW5tnydUxg==
X-Google-Smtp-Source: AMsMyM7V+QzMwbzxDuY5KGxZhiaSCJuOrdQe5y1cADXc7+27BtpgZw0e+2iOhHgvpGzG4WSOgkBsvuSyulWi3RmKp7A=
X-Received: by 2002:ab0:59a8:0:b0:3cd:aa28:aacd with SMTP id
 g37-20020ab059a8000000b003cdaa28aacdmr3104811uad.123.1665948272252; Sun, 16
 Oct 2022 12:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFFnA6tgOSsG8EQaHXY_bX_CFuEWw5yEOO387FWPeGYzSv9JQg@mail.gmail.com>
In-Reply-To: <CAFFnA6tgOSsG8EQaHXY_bX_CFuEWw5yEOO387FWPeGYzSv9JQg@mail.gmail.com>
From: Yanfeng Lee <liyafe1997@gmail.com>
Date: Sun, 16 Oct 2022 21:24:22 +0200
Message-ID: <CAFFnA6u7L6MPbH3db2C3uBdJZAX+w6vGucpKteRcYhBwk-j2eA@mail.gmail.com>
Subject: Re: About ntfs3 with mmap rw
To: ntfs3@lists.linux.dev
Cc: Yanfeng Lee <liyafe1997@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 16, 2022 at 7:54 PM Yanfeng Lee <liyafe1997@gmail.com> wrote:
>
> Hi All,
>
> I found that at this moment, NTFS3 doesn't support mmap write, even
> NTFS-3G supports that.
>
> I am considering trying to implement that, but I wonder is any
> technical problem here with the write operation of mmap? Because seems
> it's not a big deal, if no, I am curious about why is haven't been
> supported yet for a long time...
>
> Thanks for all.
>
> Best,
> Yanfeng


I mean NTFS compressed files, I missed this in the original message, sorry.
