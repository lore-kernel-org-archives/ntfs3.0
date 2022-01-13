Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822A29CA
	for <ntfs3@lists.linux.dev>; Thu, 13 Jan 2022 03:52:52 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id v1so6671666ioj.10
        for <ntfs3@lists.linux.dev>; Wed, 12 Jan 2022 19:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IkTW/f1btDdtmebJOs9va1brO9n2byvbc/TGFMyWGVA=;
        b=D4dKKHpgBJu2/atbonwXBGxVJ6n560QSSx4z9Bf9BPfse7wy1LFez2vTj7XNQS++EJ
         YsPHn0Yi3PgCr8YyGKKNWCjLJcnzyIux8ggWkwc2v/AySv+7EY/Eqv8mnjjxNTnjnB2y
         F+Zg4PqzXHV3AggNVy4Nl/b26Wczp2qUBY13R6iUrO7wuqQvnna7veM+nnI/RYBtowJu
         hDffD8cI5EcgbIl7OeOGoZQ8HIdJfDlv9DWQHUwKB2YhzoUQ2i04M+XsshSitl4jPN4h
         k1EUTr7xHgaye4gjMXc2G0UzBm0IZ4ZOAPogopZv3b9csUn9VuhQJ4AaMSAF8gdGPL2B
         JvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IkTW/f1btDdtmebJOs9va1brO9n2byvbc/TGFMyWGVA=;
        b=BT0NAfPoK3XfWjk7mv/CXdaEN331abyVXTzE2XQFY3jCorf0vpgotLEjNXxSsb4Sl9
         XWbjTAlu4nNIQRHgB+vYJg6Dvv59DTFspL7dDd7P7KMhDWcqjGKuTfkaF/lLl5Qv9J/y
         WivuANNDd6TNWsQlDUhNYXLmuwNcrUhseUs6+lnQMq80BqEjYT6/Ui/4ptBacU032P5y
         Vxs2XU8RdAkBlfqMiIS6GFZtYT3wbO83pk53vOPeEmb9yDlNwLDCSlA5cd4pShntxa6T
         w7sWFWJyrRQplr5dk6Mv1Vu6BH4+z60tE4m3v6cFW6btz0UcUk5ZbEZWduO0ZQzw82Gq
         7zyA==
X-Gm-Message-State: AOAM531Dl7iHYLbEoEzt1zoCY2ZFpLrmMRBVdr71gRCboiHleSQ4VduG
	+sycdr49HnxxfE8gFkrzNiR4NVpECwQKKdwuDEM=
X-Google-Smtp-Source: ABdhPJwgMuCPjLMe0KKbmpitTjVZUuTLSsyhB1hPisBBTzYcZ/TPIDnRp9aDvCtWNvEoMorQRff/QkX80COOvac4y80=
X-Received: by 2002:a5d:9155:: with SMTP id y21mr1264833ioq.112.1642045971472;
 Wed, 12 Jan 2022 19:52:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220111074309.GA12918@kili> <Yd1ETmx/HCigOrzl@infradead.org>
 <CAOQ4uxg9V4Jsg3jRPnsk2AN7gPrNY8jRAc87tLvGW+TqH9OU-A@mail.gmail.com> <20220112174301.GB19154@magnolia>
In-Reply-To: <20220112174301.GB19154@magnolia>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 13 Jan 2022 05:52:40 +0200
Message-ID: <CAOQ4uxh7wpxx2H6Vpm26OdigXbWCCLO1xbFapupvLCn8xOiL=w@mail.gmail.com>
Subject: Re: [bug report] NFS: Support statx_get and statx_set ioctls
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, richard.sharpe@primarydata.com, 
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>, lance.shelton@hammerspace.com, 
	Anna Schumaker <Anna.Schumaker@netapp.com>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>, 
	ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"

> > Which leaves us with an API to set the 'time backup' attribute, which
> > is a "mutable creation time" [*].
> > cifs supports setting it via setxattr and I guess ntfs3 could use an
> > API to set it as well.
> >
> > One natural interface that comes to mind is:
> >
> > struct timespec times[3] = {/* atime, mtime, crtime */}
> > utimensat(dirfd, path, times, AT_UTIMES_ARCHIVE);
> >
> > and add ia_crtime with ATTR_CRTIME to struct iattr.
> >
> > Trond,
> >
> > Do you agree to rework your patches in this direction?
> > Perhaps as the first stage, just use statx() and ioctls to set the
> > attributes to give enough time for bikeshedding the set APIs
> > and follow up with the generic set API patches later?
> >
> > Thanks,
> > Amir.
> >
> > [*] I find it convenient to use the statx() terminology of "btime"
> > to refer to the immutable birth time provided by some filesystems
> > and to use "crtime" for the mutable creation time for archiving,
> > so that at some point, some filesystems may provide both of
> > these times independently.
>
> I disagree because XFS and ext4 both use 'crtime' for the immutable
> birth time, not a mutable creation time for archiving.  I think we'd
> need to be careful about wording here if there is interest in adding a
> user-modifiable file creation time (as opposed to creation time for a
> specific instance of an inode) to filesystems.
>
> Once a year or so we get a question/complaint from a user about how they
> can't change the file creation time and we have to explain to them
> what's really going on.
>

To add one more terminology to the mix - when Samba needed to cope
with these two terminologies they came up with itime for "instantiation time"
(one may also consider it "immutable time").

Another issue besides wording, is that statx btime can be either of those
things depending on the filesystem, so if we ever add mutable btime to
ext4/xfs, what's statx btime going to return?

One more question to ask, if we were to add mutable btime to ext4/xfs
should it be an additional attribute at all or should we allow with explicit
filesystem flag and maybe also mount option to modify the existing crtime
inode field? if we can accept that some users are willing to trade the
immutable crtime with mutable btime, then we can settle with a flag
indicating "warranty seal removed" from the existing crtime field.
At least one advantage of this approach is that it simplifies terminology.

Thanks,
Amir.
