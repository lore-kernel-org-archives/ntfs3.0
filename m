Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2839172
	for <ntfs3@lists.linux.dev>; Sat, 28 Aug 2021 17:13:31 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id o10so21382141lfr.11
        for <ntfs3@lists.linux.dev>; Sat, 28 Aug 2021 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PG8z+XIonuWGdu3czEMXRzaWItNuzacbk0dZJgvuswY=;
        b=daw0rvbIk5V4Zm8DIXbqAHGUuI91vkfb3EyX9zrL+a+hl26XvDgDL8r9dYETKE/Ae6
         NVz34RW6KNXXaquZKrMsm4y3n1D2vXOf6KLPgIF3dO3k1XtDxSAoVKVtq5UPuEzZOwXY
         C+6YEcQF+K1cqgH+D2AtQjtQx4cGEZE99d2fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PG8z+XIonuWGdu3czEMXRzaWItNuzacbk0dZJgvuswY=;
        b=rbtb+Bmjd0hqykBsD8MbxTE87EPs0rySxX9MtdSaQwIAH79smPIcWXQxg4y3VRYAd0
         ak3E9WvAwmZuuEDsuu0IE6kWTjOgrdqcjVHpcEuzAHFdG5RNrITNVv4W8MajFexRaZRt
         CuYCDMP3rRWuxGx3Xjk9eYvbLyVcvL7kV5MpvBe2DDMomaIF4mu4HCb8nl4LlLM3SwSK
         9kYvwWNgnDj9xWYdqWT/7Mso7U4PjJaMI2/qpxVEW7D28S8yO5t12iKFm14BTayIBHw5
         h1yR2xpA4rsLYHhMPkV2r/tjm/YFgWp2TL4e8cMz56gaCp5UesPOXUBZ2wRJIlDegyfC
         aM9g==
X-Gm-Message-State: AOAM533yuDYb+qXCWYYCaFkVUew4Ni9sxAie1BA4OHYnT/fwicOlIxmT
	jK4vaB9heaUZSAygLlcq/Dd+0aeP5xUTFWpm
X-Google-Smtp-Source: ABdhPJx/6QItbMdm3cE9zyo1LYe3hFqYGLiRQ7QAAGfAe4ZX9JzIz6UpI94U5gTopBpamjGb3yM9Dw==
X-Received: by 2002:a19:c197:: with SMTP id r145mr10002757lff.276.1630170808605;
        Sat, 28 Aug 2021 10:13:28 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id j18sm816599lfe.301.2021.08.28.10.13.27
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 10:13:27 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id l18so17401449lji.12
        for <ntfs3@lists.linux.dev>; Sat, 28 Aug 2021 10:13:27 -0700 (PDT)
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr12752568ljc.251.1630170807239;
 Sat, 28 Aug 2021 10:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com> <20210827164926.1726765-5-agruenba@redhat.com>
 <20210827205644.lkihrypv27er5km3@kari-VirtualBox>
In-Reply-To: <20210827205644.lkihrypv27er5km3@kari-VirtualBox>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Aug 2021 10:13:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-TeAeraYo9jM7FsAVDtfCji_5ao=B3eoO10Sf2SdeTA@mail.gmail.com>
Message-ID: <CAHk-=wh-TeAeraYo9jM7FsAVDtfCji_5ao=B3eoO10Sf2SdeTA@mail.gmail.com>
Subject: Re: [PATCH v7 04/19] iov_iter: Turn iov_iter_fault_in_readable into fault_in_iov_iter_readable
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@infradead.org>, 
	"Darrick J. Wong" <djwong@kernel.org>, Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>, 
	cluster-devel <cluster-devel@redhat.com>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ocfs2-devel@oss.oracle.com, 
	ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 1:56 PM Kari Argillander
<kari.argillander@gmail.com> wrote:
>
> At least this patch will break ntfs3 which is in next. It has been there
> just couple weeks so I understand. I added Konstantin and ntfs3 list so
> that we know what is going on. Can you please info if and when do we
> need rebase.

No need to rebase. It just makes it harder for me to pick one pull
over another, since it would mix the two things together.

I'll notice the semantic conflict as I do my merge build test, and
it's easy for me to fix as part of the merge - whichever one I merge
later.

It's good if both sides remind me about the issue, but these kinds of
conflicts are not a problem.

And yes, it does happen that I miss conflicts like this if I merge
while on the road and don't do my full build tests, or if it's some
architecture-specific thing or a problem that doesn't happen on my
usual allmodconfig testing.  But neither of those cases should be
present in this situation.

                    Linus
