Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5673FC1
	for <ntfs3@lists.linux.dev>; Sat,  4 Sep 2021 18:09:18 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id m4so3961056ljq.8
        for <ntfs3@lists.linux.dev>; Sat, 04 Sep 2021 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9cCKBvhWQzJ1D49VIyTebPGrZpxmsDI6MMA6+ICjqw=;
        b=HJK+uwndSZDYMHUzAH2y1VYzz3qQkff8CaYRr5jvVhT2+rmi0k+i0J+wr5bTW0pCiz
         sPI+5NNf1wFJW96mj0g6PLOostmhaZo4meoyhQw7fIIveBocpxXBQU4fJ1dr69eLoWac
         XydqvnVnJB2yWg7x8Gy8VphD1A+JJ5CU0SoZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9cCKBvhWQzJ1D49VIyTebPGrZpxmsDI6MMA6+ICjqw=;
        b=YqUgZAmgTdNUIDVVti36PtYuyygR4untAM6dcIkEL573bv6D+OmnJSI8+PebbNd4cF
         qhLo2F6pPnmWWw+ljjzSECDwXOlU+/0WDh/ebdjt/VJ0dP+WvG0aDHCbofwjEiy6O4dr
         4KowxqfupDkSq0wJ48ecgTevhVSTcrAILLxG4UNB1k3ogbdxE19z04McwI3hhbvxQE77
         SKSNaEi2XqJmWUwkYIlXQSGv2JpzV0DhF9dfPWq0RN9Yy8fXBBH2vGtjgFN8o22mLvk+
         WOZo2eq9t845WqNZCEyZ40sFgsJlaGlUi52gaa2+oOtZUxTXslc5E2ZopThEQr3OIN2W
         /t3g==
X-Gm-Message-State: AOAM532vtpc9OOcGJgpQgdAL7Dr2H5vnJVs2Fi3oCpH1WtN0MzqMz7dM
	AMUWS/wBi8bBXt9kbBwO4DDJU4YiyByKvoK6
X-Google-Smtp-Source: ABdhPJxgCoZIkT8kZoXTkMW5SlY1lsM2qCUkKn0DbvajPN/zX54Ab59Ijtceg0gz5GO8H/O/D+89RA==
X-Received: by 2002:a2e:9256:: with SMTP id v22mr3715500ljg.150.1630778956523;
        Sat, 04 Sep 2021 11:09:16 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id br13sm298565lfb.71.2021.09.04.11.09.14
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 11:09:14 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id x27so4942820lfu.5
        for <ntfs3@lists.linux.dev>; Sat, 04 Sep 2021 11:09:14 -0700 (PDT)
X-Received: by 2002:a05:6512:3987:: with SMTP id j7mr3726453lfu.280.1630778954535;
 Sat, 04 Sep 2021 11:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aa4aa155-b9b2-9099-b7a2-349d8d9d8fbd@paragon-software.com> <CAHk-=whFAkqwGSNXqeN4KfNwXeCzp9-uoy69_mLExEydTajvGw@mail.gmail.com>
In-Reply-To: <CAHk-=whFAkqwGSNXqeN4KfNwXeCzp9-uoy69_mLExEydTajvGw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 4 Sep 2021 11:08:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjbtip559HcMG9VQLGPmkurh5Kc50y5BceL8Q8=aL0H3Q@mail.gmail.com>
Message-ID: <CAHk-=wjbtip559HcMG9VQLGPmkurh5Kc50y5BceL8Q8=aL0H3Q@mail.gmail.com>
Subject: Re: [GIT PULL] ntfs3: new NTFS driver for 5.15
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 4, 2021 at 10:34 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> For github accounts (or really, anything but kernel.org where I can
> just trust the account management), I really want the pull request to
> be a signed tag, not just a plain branch.

Ok, to expedite this all and not cause any further pointless churn and
jumping through hoops, I'll let it slide this time, but I'll ask that
you sort out your pgp key for the future and use signed tags.

Also, I notice that you have a github merge commit in there.

That's another of those things that I *really* don't want to see -
github creates absolutely useless garbage merges, and you should never
ever use the github interfaces to merge anything.

This is the complete commit message of that merge:

    Merge branch 'torvalds:master' into master

Yeah, that's not an acceptable message. Not to mention that it has a
bogus "github.com" committer etc.

github is a perfectly fine hosting site, and it does a number of other
things well too, but merges is not one of those things.

Linux kernel merges need to be done *properly*. That means proper
commit messages with information about what is being merged and *why*
you merge something. But it also means proper authorship and committer
information etc. All of which github entirely screws up.

We had this same issue with the ksmbd pull request, and my response is
the same: the initial pull often has a few oddities and I'll accept
them now, but for continued development you need to do things
properly. That means doing merges from the command line, not using the
entirely broken github web interface.

(Sadly, it looks like that ksmbd discussion was not on any mailing
lists, so I can't link to it).

                    Linus
