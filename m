Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795186534;
	b=x/8r3rZO+tttGkKwnxB6A5h3oSiGGeZFeQeDBxDoG0CTYx+blGjw5Fs4sLixB75+9HDi
	 JEz9XEz2oKWwvfwBW+fMGSCZ3X3UYHPzC/07pKyzab0cOS5lX/dv9+6tG6OGIOBzqkQJ2
	 1aGCh2/ByGIFnuUQ7qB11wz2PMHFBLgGogK0wFZB5iZ6WKX3ov6X589NDjAZ800UfjrLG
	 tpVW2iOcoXIg8F7lMVkqrQK1BjuP2+EqM0jDpRbyoad8r2x0QzIj1t+Ph2AHLv16mnfFM
	 edhRFl6kifrlWorebPzin7fPtNd2qkZ7TS/J5y7W+OBpH15uNzCp9ZrVgT4iE8VOEcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
	b=4a5EbCld2RE9SY9jt05Eqoy/1zvmDd7Gd6uJao4HUWFUa+Vq0SxmxOy9Ypkan1EhVwIr
	 TadeRZ7abSt3ceBhGrjMu2r0azvxA3XCpQI6a9o17fYpmHeuRLVnj4s3umc5q3JwC/OJX
	 1dF7VzXjfjhZ6fXE1BkQ/uVFSz6C/7xx3i0m7E+WIH+BJYmRGGKHJRxIjaw803gWgReq+
	 uCAqgQyxeIcgT/cuzRACffNCGc3kxhcyn5AfnOFS6/fqiphk3gu2Dy3hixVMrLEtmhQjd
	 PHkGgdxZpCrc0KUj7rMTwzn6Uf3sCfE4utI6JJ+N+zTnxtU2GsnB7o3NIDGvv/xcuIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RF5454d2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E5606A33F
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 14:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08E5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RF5454d2
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so1228272a12.0
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 06:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795186532; cv=none;
        d=google.com; s=arc-20260327;
        b=V/kbW1ugeBmZnjaxoSiV1gRHcWQVC3NiVnbi9Tn8xTI6YeZ9Wu1O620bMmLPWsLhjU
         tPmhAQbBHzJRY4voWDLzo0LUfoVkwOP+TAyqhsXPRzkWfOZC1REEdaVllZEtsYq48EQd
         U1mSe63pP6Ff2tia7cbvu37Mihu2OUHnXxPIawIx+iYptrKbxKtQRBiFagWU0+jVxR+h
         7jALLf3qN0mbE3DDhws5zlI2GVwHKjMMRqOU95pu2m6w9+5Amzi1E0kJoSFIejUu+MDD
         uKrxKLUU8woSuDF0uSoqYqbJD6YjMvyBwXL8Jc+/sZ2rrgv/yq+y2IiPxMs5X3EAPSdB
         WpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        fh=75zPkcBnHVLMyhL37qyB2CLlSAlH1CoBMcsqRUll9YY=;
        b=l7tUIwSjlVUxMJsxyw/h94EJjRG9G4yu2lUqSkvqAJVvkblJY3fWycZQU13FOj1n58
         FpmQb2y1zPoEoo5AbjVPaOGqQzM9b5LOXGVdRg+2rcFZTfNyNEHeQG3M/u8wqRHi7Qot
         xrL6IvOe2zJgZb6CjdrlfUi6IjtcR+6ExbC/NF71NOMVPHHK4IPzKAd1RlGETnweLNoZ
         fmKb+JwZtYpZyLqIgi6GNRby2eQf7prffmiIUPCE4TzLAu2CEqo7mF5esdHgsjugN6GD
         GlNzhdonKopzBUagIEl6Qx8phEs8L2Cw1AL6KBAmZiI9ekxZGooIN4hNWg/fteMrKw7K
         TSnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186531; x=1795791331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        b=RF5454d2zWejyGXBnIXNrBWd1ngn2JXx/zSjmb9LwkAtbEOootfenfbISRnV+Loz0r
         x7dBD8EBK/hr0LwJsI7YEP63EIPy/86aqMc035tnqKfYMvvS9nRuSLo1iL0eY+9vqyUK
         PCxrfTQVSqt+Tb/+ABOxF0oDuspZbfXIAB26BSLqckLDJSsa1oMeHrZp3IBUpmj4YP3p
         LkXsOO0meNXWRCCseDu1DJsicYSQ3s/LI+QR/UFJMnrAn6pX6RT2boJqk7rtZh095wph
         2h6dWowN3FrA/ye/CsSyFCnL0b3X5Jvfvnqn7hHFm8wI5tt6Y4Vi38EjVXr3DqO4CR6h
         AGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186532; x=1795791332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        b=nY9plnPZCzZJbxWgvSW4anbT4x9b7Vh8NoD17XZXSsKVFGIWNtBWtCXWUDghhhLBYq
         RN73Hz2Q0QphG67Rns0Q93NeSPdroDNnHgSaCfguXTiKJ8wLln8ef0h7nISsZPls4LUo
         UWv72DpTl7TUiXsdhnBdQpGoQgR/U5g7vCo4h+K5AUNsAdnWzOFdUhg3x1cZpuu88OUs
         GHQYZ145boXmomttjxAm4Tj6E6nE+fg6TAc5+Yh1SS4AKNWI290pH4AvJQSxjqn6KoT1
         hmfnRrrwXXk2qs6Z53e5maN09H62CmQJm2LjObwkQCdmWOe8ev6FeIoF66sZ1wAE7OII
         hOTQ==
X-Forwarded-Encrypted: i=1; AL+hErH+bsLK2q61qdaTZE2q92IyaCLFd8/hERVZdtUA4TTO526qrudonpsfI4uTd7AvLFLtWeFPdg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8bO+bWFgUmUdF4QJyUfC/6ZI3qjZRett9dfVjBr46bEX+vRDL3
	mssKvS+AEtlCIuMcRYYsMW2LgN0RGUMicjxD+NhQAv+tDjU7YvRt+JkQ41p7/7m06arbkXG9zZ9
	M7Sf++fm9lFZ7Tck87S1+MkSr5R6LwuQ=
X-Gm-Gg: AZFdTZcKP/WP9BraDoBN4uPuYRJ6+RHzUi585la3XocSzrEL6FlJPASNR1h73dZ0ALk
	YOKYrZzUJvKf+305XLcZfgf5bZPkkV+Y8rUeOqE0a+a/1JBCOVkYe8C0F7uesYUmHaOWwWgKCVL
	OVQFmTMyiLxmUh5kFeTUC8bhWvxKPNuFyoNl82BYKyaMKwPaaKeNuUPr+ceQzNZtK6yvuHbL8fm
	V7LyDUPQbRIBbyKReem7y2BMHEencfCqbgJfmM1D2JjjY8bIWP3DQdqoj7fcmz1FY8mnM+L61Jk
	g474lWNZAYwD/h78KnUiNjrT8/H62jD9EMYaEFQE93Y9rCjgx8S7xcrKNao1mYWOQXSFFNoDQRy
	fW3NLpv0Hm7km2YAQGXYTureMFKdofBxxuQpHEJIosSUcEogTpdnFOgG3uqPt8jwq6wnYJw==
X-Received: by 2002:a05:6402:3223:b0:6b8:5f08:931b with SMTP id
 4fb4d7f45d1cf-6ba37ea44b2mr2503989a12.26.1795186531571; Fri, 20 Nov 2026
 06:55:31 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-9-koray.fra@gmail.com>
 <CAOQ4uxgoNsOH82FyrCxc+qSoid_CFmbmpL0qgWFw-e8E689fFA@mail.gmail.com>
 <DMZJ4PL1JVA4.2YEB7EPYJR5Q7@gmail.com> <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>
 <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
In-Reply-To: <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 15:55:19 +0100
X-Gm-Features: Aa3M54om4CtJTUNd2Te8u7pI-ZPclkwXdtuzgdSJLpiBpdV9ZiFnAJvfZll4Px8
Message-ID: <CAOQ4uxh+d-wNC0aWLEexPFz7zj=TZjLyu61kaEmwBx9_hKn2gg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/10] nfs: add provenance time (ptime) via FATTR4_TIME_CREATE
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:34=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Fri Nov 20, 2026 at 7:45 AM CET, Amir Goldstein wrote:
> > On Thu, Nov 19, 2026 at 11:10=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:

> >> >                    fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING;
> >> > +                 fa->fsx_xflags_mask |=3D FS_XFLAG_CASENONPRESERVIN=
G;
> >> > +                 fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASENONPRESER=
VING;
> >> Uhm, why both in _mask and _ro_mask? If it's a RDONLY flag shouldn't
> >> it *only* be in _ro_mask? (same for CASEFOLD)
> >>
> >
> > Good question. Maybe
> > I guess if you want to follow some percent
> > FS_FL_USER_MODIFIABLE is a subset of FS_FL_USER_VISIBLE
> > but I think that exporting ro_mask and _mask is going to be easier and
> > cleaner than rw_mask but not sure.
>
> Hmm I asked that also because you said in the xfs shared extent thread:
>
> > The advantage being that it makes the interface symmetric.
> > User can alway setattr() with the buffer they got from getattr()
> > and instead of randomly ignoring flags in set, the fsx_ro_mask
> > along with fsx_mask defines the behavior exactly.
>
> But by putting the ro flags in _mask too, a user would have to clean
> them out or vfs will reject the call with -EINVAL/something else, since
> in that case the vfs would see the user say "I want to change this [ro]
> flag".
>

That's just a matter of interpretation.

You could say that if flag FS_XFLAG_CASENONPRESERVING
is in ro_mask then its value may not be modified and fs needs to
fail the set if the user given value is not a match to the current
kernel's value.

Could be used for an "atomic flag set" operation, but I think
this is taking this too far.

I am fine with xflags_ro_mask and xflags_rw_mask I guess this
is the less ambiguous option.

Thanks,
Amir.
